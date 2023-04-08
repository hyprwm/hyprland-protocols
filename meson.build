project('hyprland-protocols',
	version: '0.1',
	meson_version: '>= 0.55.0',
)

hyprland_protocols_version = meson.project_version()

fs = import('fs')

protocols = {
  'hyprland-toplevel-export': ['v1'],
  'hyprland-global-shortcuts': ['v1']
}

protocol_files = []

foreach name : protocols.keys()
	foreach version : protocols.get(name)
		protocol_files += [
			'protocols/@0@-@1@.xml'.format(name, version)
		]
	endforeach
endforeach

foreach protocol_file : protocol_files
	protocol_install_dir = fs.parent(join_paths(
		get_option('datadir'),
		protocol_file,
	))
	install_data(
		protocol_file,
		install_dir: protocol_install_dir,
	)
endforeach

hyprland_protocols_srcdir = meson.current_source_dir()

pkgconfig_configuration = configuration_data()
pkgconfig_configuration.set('prefix', get_option('prefix'))
pkgconfig_configuration.set('datarootdir', '${prefix}/@0@'.format(get_option('datadir')))
pkgconfig_configuration.set('abs_top_srcdir', hyprland_protocols_srcdir)
pkgconfig_configuration.set('PACKAGE', '')
pkgconfig_configuration.set('HYPRLAND_PROTOCOLS_VERSION', hyprland_protocols_version)

pkg_install_dir = join_paths(get_option('datadir'), 'pkgconfig')
configure_file(
	input: 'hyprland-protocols.pc.in',
	output: 'hyprland-protocols.pc',
	configuration: pkgconfig_configuration,
	install_dir: pkg_install_dir,
)

hyprland_protocols = declare_dependency(
	variables: {
		'pkgdatadir': hyprland_protocols_srcdir,
	},
)

meson.override_dependency('hyprland-protocols', hyprland_protocols)
