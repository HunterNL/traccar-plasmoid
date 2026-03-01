[private]
default:
	just --list

# Install the 'plasmoid' directory as a local user plasmoid via symlink
[group('Setup')]
install-link:
    ln -s "${PWD}/plasmoid/" ~/.local/share/plasma/plasmoids/plasma-traccar

# Remove the symlink
[group('Setup')]
remove-link:
    rm -i -v ~/.local/share/plasma/plasmoids/plasma-traccar

# Restart the plasma shell
[group('Test')]
test-real:
	systemctl --user restart plasma-plasmashell

# Test in `plasmoidviewer`
[group('Test')]
test-viewer:
	plasmoidviewer -a plasma-traccar -l bottomedge -f horizontal

# Test in `plasmawindowed`
[group('Test')]
test-windowed:
	plasmawindowed plasma-traccar

