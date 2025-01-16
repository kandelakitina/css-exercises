{
  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell.packages = pkgs:
        with pkgs;
        with nodePackages; [
          hello
          live-server
        ];
    };
}
