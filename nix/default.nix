{
  lib,
  stdenv,
  cmake,
  version,
}:
stdenv.mkDerivation {
  pname = "hyprland-protocols";
  inherit version;

  src = ../.;

  nativeBuildInputs = [ cmake ];

  meta = {
    homepage = "https://github.com/hyprwm/hyprland-protocols";
    description = "Wayland protocol extensions for Hyprland";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}
