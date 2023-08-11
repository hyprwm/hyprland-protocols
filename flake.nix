{
  description = "Hyprland Protocols";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # <https://github.com/nix-systems/nix-systems>
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
    ...
  }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs (import systems);
    pkgsFor = eachSystem (system:
      import nixpkgs {
        localSystem = system;
        overlays = [self.overlays.hyprland-protocols];
      });
    mkDate = longDate: (lib.concatStringsSep "-" [
      (builtins.substring 0 4 longDate)
      (builtins.substring 4 2 longDate)
      (builtins.substring 6 2 longDate)
    ]);
    version = "0.1" + "+date=" + (mkDate (self.lastModifiedDate or "19700101")) + "_" + (self.shortRev or "dirty");
  in {
    overlays = {
      hyprland-protocols = final: prev: {
        hyprland-protocols = final.callPackage ./nix/default.nix {inherit version;};
      };
      default = self.overlays.hyprland-protocols;
    };

    packages = eachSystem (system: {
      inherit (pkgsFor.${system}) hyprland-protocols;
      default = self.packages.${system}.hyprland-protocols;
    });

    formatter = eachSystem (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
