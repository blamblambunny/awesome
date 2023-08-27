local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local icons = require('theme.icons')
local clickable_container = require('widget.clickable-container')
local task_list = require('widget.task-list')

local top_panel = function(s)

	local panel = wibox {
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(28),
		width = s.geometry.width,
		x = s.geometry.x,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}

	panel:struts {
		top = dpi(28)
	}

	panel:connect_signal(
		'mouse::enter',
		function() 
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end
	)

	local add_button 		= require('widget.open-default-app')(s)
	local clock 			= require('widget.clock')(s)
	s.end_session			= require('widget.end-session')()
	s.global_search			= require('widget.global-search')()

	panel : setup {
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			task_list(s),
			add_button
		},
		{
			layout = wibox.layout.flex.horizontal,
			spacing = dpi(5),
		},
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(5),
			expand = "none",
			clock,
			s.global_search,
			s.end_session
		}
	}

	return panel
end


return top_panel
