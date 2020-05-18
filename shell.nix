let
  pkgs = import ./nix/nixpkgs.nix {
    overlays = [ (import ./nix/overlay.nix) ];
  };
  pythonEnv = pkgs.poetry2nix.mkPoetryEnv {
      projectDir = ./.;
      # preferWheels = true;
  };
  in

  with pkgs;

  mkShell {
    name = "pba-iot-cloud-env";

    nativeBuildInputs = [
      pythonEnv
      poetry
    ];
  }
