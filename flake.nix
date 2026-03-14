{
  description = "PiratePot dev environment (Jupyter for local notebook editing)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.python3Packages.jupyterlab
            pkgs.python3Packages.ipykernel
          ];

          shellHook = ''
            echo "=== PiratePot Dev Environment ==="
            echo "JupyterLab available for local notebook editing."
            echo "Model training: use Google Colab with model/requirements.txt"
            echo "Mobile: Flutter (not configured yet)"
          '';
        };
      }
    );
}
