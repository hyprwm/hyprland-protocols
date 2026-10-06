cmake_minimum_required(VERSION 3.20)

file(STRINGS "${CMAKE_CURRENT_SOURCE_DIR}/VERSION" HYPRLAND_PROTOCOLS_VERSION
     LIMIT_COUNT 1)
string(STRIP "${HYPRLAND_PROTOCOLS_VERSION}" HYPRLAND_PROTOCOLS_VERSION)

project(
  hyprland-protocols
  VERSION ${HYPRLAND_PROTOCOLS_VERSION}
  LANGUAGES C)

include(GNUInstallDirs)

set(PROTOCOL_FILES
    protocols/hyprland-toplevel-export-v1.xml
    protocols/hyprland-global-shortcuts-v1.xml
    protocols/hyprland-focus-grab-v1.xml
    protocols/hyprland-ctm-control-v1.xml
    protocols/hyprland-surface-v1.xml
    protocols/hyprland-lock-notify-v1.xml
    protocols/hyprland-toplevel-mapping-v1.xml
    protocols/hyprland-input-capture-v1.xml
    protocols/hyprland-workspace-image-capture-source-v1.xml)

foreach(PROTOCOL_FILE ${PROTOCOL_FILES})
  get_filename_component(PROTOCOL_DIR ${PROTOCOL_FILE} DIRECTORY)
  install(
    FILES ${PROTOCOL_FILE}
    DESTINATION "${CMAKE_INSTALL_DATADIR}/hyprland-protocols/${PROTOCOL_DIR}")
endforeach()

# Configure pkg-config file
set(prefix "${CMAKE_INSTALL_PREFIX}")
set(datarootdir "\${prefix}/${CMAKE_INSTALL_DATADIR}")
set(abs_top_srcdir "${CMAKE_CURRENT_SOURCE_DIR}")
set(PACKAGE "hyprland-protocols")

configure_file(hyprland-protocols.pc.in hyprland-protocols.pc @ONLY)

# Install pkg-config file
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/hyprland-protocols.pc"
        DESTINATION "${CMAKE_INSTALL_DATADIR}/pkgconfig")
