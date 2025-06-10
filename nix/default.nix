{
  lib,
  stdenv,
  meson,
  ninja,
  version,
  self,
}:
stdenv.mkDerivation {
  pname = "hyprland-protocols";
  inherit version;

  src = self;

  nativeBuildInputs = [meson ninja];

  meta = {
    homepage = "https://github.com/hyprwm/hyprland-protocols";
    description = "Wayland protocol extensions for Hyprland";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}
