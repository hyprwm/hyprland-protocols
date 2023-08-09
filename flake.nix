{
  description = "Hyprland Protocols";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    inherit (nixpkgs) lib;
    genSystems = lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
    ];
    pkgsFor = genSystems (system:
      import nixpkgs {
        inherit system;
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

    packages = genSystems (system:
      (self.overlays.default pkgsFor.${system} pkgsFor.${system})
      // {default = self.packages.${system}.hyprland-protocols;});

    formatter = genSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
