local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. 'utilities/'

return {
	-- The default applications that we will use in keybindings and widgets
	default = {
		terminal = 'kitty',
		web_browser = 'firefox-bin',
		file_manager = 'dolphin',
		cad_editor = 'librecad',
		multimedia = 'vlc',
		game = 'kerbal-space-program',
		graphics_editor = "datktable",
		sandbox = 'virtualbox',
		-- Default IDE
		development = 'qgis',
		network_manager = 'wpa_gui',
		bluetooth_manager = 'blueman-manager',
		power_manager = 'xfce4-power-manager',
		package_manager = 'pamac-manager',
		-- Default locker
		lock = 'awesome-client "awesome.emit_signal(\'module::lockscreen_show\')"',
		-- Default quake terminal
		quake = 'kitty --name QuakeTerminal',
		-- Default rofi global menu
		rofi_global = 'rofi -dpi ' .. screen.primary.dpi .. 
							' -show "Global Search" -modi "Global Search":' .. config_dir .. 
							'/configuration/rofi/global/rofi-spotlight.sh' .. 
							' -theme ' .. config_dir ..
							'/configuration/rofi/global/rofi.rasi',
		-- Default app menu
		rofi_appmenu = 'rofi -dpi ' .. screen.primary.dpi ..
							' -show drun -theme ' .. config_dir ..
							'/configuration/rofi/appmenu/rofi.rasi'

		-- You can add more default applications here
	},

	-- List of apps to start once on start-up
	run_on_start_up = {
		--'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf',
		'xiccd',
		'pulseaudio --start',
		'blueman-applet',
		-- Polkit and keyring
		'/usr/bin/lxqt-policykit-agent &' ..
		' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
		-- Load X colors
		'xrdb $HOME/.Xresources',
		-- Audio equalizer
		-- 'pulseeffects --gapplication-service',
		-- Lockscreen timer
		[[
		xidlehook --not-when-fullscreen --not-when-audio --timer 600 \
		"awesome-client 'awesome.emit_signal(\"module::lockscreen_show\")'" ""
		]],

		'synclient HorizTwoFingerScroll=1 MaxSpeed=1.45 TapButton1=1'
	},

	-- List of binaries/shell scripts that will execute for a certain task
	utils = {
		-- Fullscreen screenshot
		full_screenshot = utils_dir .. 'snap full',
		-- Area screenshot
		area_screenshot = utils_dir .. 'snap area',
		-- Update profile picture
		update_profile  = utils_dir .. 'profile-image'
	}
}
