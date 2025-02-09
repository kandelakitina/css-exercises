{
  inputs = {
    flakelight.url = "github:nix-community/flakelight";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { flakelight, nixpkgs, ... }:
    flakelight ./. {
      devShell = {
        packages = pkgs:
          with pkgs;
          with nodePackages; [
            nodejs
            hello
            live-server
            pm2
          ];
        shellHook = ''
          unset name
          pm2 start live-server
        '';
      };
    };
}
