let
  pkgs = import ./nixpkgs.nix {
    overlays = [ (import ./overlay.nix) ];
  };

  pythonEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ../.;
  };
in
  with pkgs;

  stdenv.mkDerivation {
    inherit pkgs;
    name = "pba-device-manager";
    buildInputs = [
      pythonEnv
    ];
  }

