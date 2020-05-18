# overlay.nix: Add our own things to Nixpkgs

self: super: {
  inherit (
    let src = super.fetchFromGitHub {
      owner = "nix-community";
      repo = "poetry2nix";
      rev = "1cfaa4084d651d73af137866622e3d0699851008";
      sha256 = "16lp3z9w0m7sdxvbk252sx92b3jwf2122vskw0vkrfgym803y59s";
        };
    in
      (import "${src.out}/overlay.nix" self super)
  ) poetry poetry2nix;
}
