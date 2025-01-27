{
  inputs = {
    flakelight.url = "github:nix-community/flakelight";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { flakelight, nixpkgs, ... }:
    flakelight ./. {
      devShell.packages = pkgs:
        with pkgs;
        with nodePackages; [
          hello
          live-server
        ];
    };
}
