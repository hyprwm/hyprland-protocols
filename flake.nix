{
  description = "Hyprland Protocols";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # <https://github.com/nix-systems/nix-systems>
    systems.url = "github:nix-systems/default-linux";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      eachSystem = lib.genAttrs (import systems);
      pkgsFor = eachSystem (
        system:
        import nixpkgs {
          localSystem = system;
          overlays = [ self.overlays.hyprland-protocols ];
        }
      );
    in
    {
      overlays = import ./nix/overlays.nix { inherit lib self; };

      packages = eachSystem (system: {
        inherit (pkgsFor.${system}) hyprland-protocols;
        default = self.packages.${system}.hyprland-protocols;
      });

      formatter = eachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
