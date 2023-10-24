local awful = require('awful')
local gears = require('gears')
local ruled = require('ruled')
local beautiful = require('beautiful')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

ruled.client.connect_signal(
	'request::rules',
	function()
		-- All clients will match this rule.
		ruled.client.append_rule {
			id = 'global',
			rule = {},
			properties = {
				focus = awful.client.focus.filter,
				raise = true,
				floating = false,
				maximized = false,
				above = false,
				below = false,
				ontop = false,
				sticky = false,
				maximized_horizontal = false,
				maximized_vertical = false,
				keys = client_keys,
				buttons = client_buttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen
			}
		}

		ruled.client.append_rule {
			id = 'round_clients',
			rule_any = {
				type = {
					'normal',
					'dialog'
				}
			},
			except_any  = {
				name = {'Discord Updater'}
			},
			properties = {
				round_corners = true,
				shape = beautiful.client_shape_rounded
			}
		}

		-- Titlebar rules
		ruled.client.append_rule {
			id 		= 'titlebars',
			rule_any = {
				type = {
					'normal',
					'dialog',
					'modal',
					'utility'
				}
			},
			properties = {
				titlebars_enabled = true
			}
		}

		-- Dialogs
		ruled.client.append_rule {
			id = 'dialog',
			rule_any = {
				type  = {'dialog'},
				class = {'Wicd-client.py', 'calendar.google.com'}
			},
			properties = {
				titlebars_enabled = true,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Modals
		ruled.client.append_rule {
			id = 'modal',
			rule_any = {
				type = {'modal'}
			},
			properties = {
				titlebars_enabled = true,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Utilities
		ruled.client.append_rule {
			id = 'utility',
			rule_any = {
				type = {'utility'}
			},
			properties = {
				titlebars_enabled = false,
				floating = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Splash
		ruled.client.append_rule {
			id = 'splash',
			rule_any = {
				type = {'splash'},
				name = {'Discord Updater'}
			},
			properties = {
				titlebars_enabled = false,
				round_corners = false,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Terminal emulators
		ruled.client.append_rule {
			id = 'terminals',
			rule_any = {
				class = {
					'URxvt',
					'XTerm',
					'UXTerm',
					'kitty',
					'K3rmit'
				}
			},
			properties = {
				tag = '1',
				switch_to_tags = true,
				size_hints_honor = false,
				titlebars_enabled = true
			}
		}

		-- Browsers and chats
		ruled.client.append_rule {
			id = 'internet',
			rule_any = {
				class = {
					'firefox',
					'firefox-bin',
					'discord',
					'TelegramDesktop',
					'thunderbird-bin'
				}
			},
			properties = {
				tag = '2'
			}
		}

                -- GIS
                ruled.client.append_rule {
                        id = 'gis',
                        rule_any = {
                                class = {
                                        'Qgis',
					'grass'
                                }
                        },
                        properties = {
                                tag = '3',
                                skip_decoration = true
                        }
                }

		-- CAD
		ruled.client.append_rule {
			id = 'cad',
			rule_any = {
				class = {
					'FreeCAD',
					'OpenSCAD',
					'LibreCAD'
				}
			},
			properties = {
				tag = '4',
				skip_decoration = true
			}
		}

		-- Multimedia
		ruled.client.append_rule {
			id = 'multimedia',
			rule_any = {
				class = {
					'vlc',
					'Spotify'
				}
			},
			properties = {
				tag = '5',
				switch_to_tags = true,
				placement = awful.placement.centered
			}
		}

		-- Gaming
		ruled.client.append_rule {
			id = 'games',
			rule_any = {
				class = {
					'dolphin-emu',
					'kerbal-space-program',
					'rimworld',
					'factorio',
					'Steam',
					'Citra',
					'supertuxkart'
				},
				name = {'Steam'}
			},
			properties = {
				tag = '6',
				skip_decoration = true,
				switch_to_tags = true,
				placement = awful.placement.centered
			}
		}

		ruled.client.append_rule {
			id = 'graphics_editor',
			rule_any = {
				class = {
					'darkroom',
					'inkscape'
				}
			},
			properties = {
				tag = '7',
				skip_decoration = true,
				switch_to_tags = true,
				placement = awful.placement.centered
			}
		}

		-- Floating
		ruled.client.append_rule {
			id       = 'floating',
			rule_any = {
				instance    = {
					'file_progress',
					'Popup',
					'nm-connection-editor',
				},
				class = {
					'scrcpy',
					'Mugshot',
					'Pulseeffects'
				},
				role    = {
					'AlarmWindow',
					'ConfigManager',
					'pop-up'
				}
			},
			properties = {
				titlebars_enabled = true,
				skip_decoration = true,
				ontop = true,
				floating = true,
				focus = awful.client.focus.filter,
				raise = true,
				keys = client_keys,
				buttons = client_buttons,
				placement = awful.placement.centered
			}
		}
	end
)
