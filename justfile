[private]
default:
	just --list

# Install the 'plasmoid' directory as a local user plasmoid via symlink
[group('Setup')]
install-link:
    ln -s "${PWD}/plasmoid/" ~/.local/share/plasma/plasmoids/life.vern.traccar-plasmoid

# Remove the symlink
[group('Setup')]
remove-link:
    rm -i -v ~/.local/share/plasma/plasmoids/life.vern.traccar-plasmoid

# Restart the plasma shell
[group('Test')]
test-real:
	systemctl --user restart plasma-plasmashell

# Test in `plasmoidviewer`
[group('Test')]
test-viewer:
	QT_LOGGING_RULES="qml.debug=true" plasmoidviewer -a life.vern.traccar-plasmoid -l bottomedge -f horizontal

# Test in `plasmawindowed`
[group('Test')]
test-windowed:
	plasmawindowed life.vern.traccar-plasmoid

