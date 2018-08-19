-- Filename 'default_settings.txt', for minetest mod "hudclock"
--
-- ©2017 Boruch Baum <boruch_baum@gmx.com>
-- License: GPL3+

-- Font Color
hc.fg_color = hc.load_setting("hudclock_fg_color", "number", 0xFFFF00)

-- Display elements
hc.sunrise = hc.load_setting("hudclock_sunrise", "bool", false)
hc.sunset  = hc.load_setting("hudclock_sunset" , "bool", false)
hc.real_elapsed = hc.load_setting("hudclock_real_elapsed", "bool", false)
hc.game_elapsed = hc.load_setting("hudclock_game_elapsed", "bool", false)

-- Time positions
hc.pos.now  = {
  x = hc.load_setting("hudclock_pos_x", "number", 0.95),
  y = hc.load_setting("hudclock_pos_y", "number", 0.05)
}
hc.pos.rise = {
  x = hc.load_setting("hudclock_sunrise_pos_x", "number", 0.94),
  y = hc.load_setting("hudclock_sunrise_pos_y", "number", 0.10)
}
hc.pos.set = {
  x = hc.load_setting("hudclock_sunset_pos_x", "number", 0.94),
  y = hc.load_setting("hudclock_sunset_pos_y", "number", 0.13)
}

-- Position offset of clock image
hc.pos.offset = {
  x = hc.load_setting("hudclock_offset_x", "number", -30),
  y = hc.load_setting("hudclock_offset_y", "number", 0)
}

-- Update interval
hc.update_interval
  = hc.load_setting("hudclock_update_interval", "number", 1.0)

-- Time raio constant
hc.time_const = hc.load_setting("hudclock_time_const", "number", 72)

-- Times of day
hc.sunrise_time = hc.load_setting("hudclock_sunrise_time", "number", 0.198)
hc.sunset_time  = hc.load_setting("hudclock_sunset_time", "number", 0.775)
