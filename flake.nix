{
  description = "vibec0re w3bsite — hugo static site, maximum c0re vibes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, treefmt-nix }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system: f {
          inherit system;
          pkgs = import nixpkgs { inherit system; };
        });

      treefmtEval = forAllSystems ({ pkgs, ... }:
        treefmt-nix.lib.evalModule pkgs {
          projectRootFile = "flake.nix";
          programs.nixpkgs-fmt.enable = true;
          programs.prettier.enable = true;
          programs.taplo.enable = true;
          settings.formatter.prettier.includes = [
            "*.md"
            "*.css"
            "*.js"
            "*.html"
            "*.json"
            "*.yaml"
            "*.yml"
          ];
        });
    in
    {
      packages = forAllSystems ({ pkgs, ... }: {
        default = self.packages.${pkgs.system}.dist;

        dist = pkgs.stdenv.mkDerivation {
          pname = "vibec0re-w3bsite";
          version = "0.1.0";
          src = ./.;

          nativeBuildInputs = [ pkgs.hugo ];

          buildPhase = ''
            runHook preBuild
            hugo --minify --destination $out
            runHook postBuild
          '';

          dontInstall = true;
        };
      });

      devShells = forAllSystems ({ pkgs, ... }: {
        default = pkgs.mkShell {
          packages = [
            pkgs.hugo
            pkgs.go
            treefmtEval.${pkgs.system}.config.build.wrapper
          ];

          shellHook = ''
            echo "▓▒░ vibec0re dev shell ░▒▓"
            echo "hugo $(hugo version)"
          '';
        };
      });

      formatter = forAllSystems ({ pkgs, ... }:
        treefmtEval.${pkgs.system}.config.build.wrapper);

      checks = forAllSystems ({ pkgs, ... }: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });
    };
}
