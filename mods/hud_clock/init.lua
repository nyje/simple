-- Filename 'init.lua', for minetest mod "hudclock", forked from
-- "mtclock", with snippets from "hudbars"
--
-- ©2017 Boruch Baum <boruch_baum@gmx.com>
-- License: GPL3+
--
-- Changelog
--
-- Change the default position to the lower margin of the display so
-- that it isn't obscured by the hud-map.
--
-- Add options to display the real-world time remaining until the next
-- in-game sunset and sunrise.
--
-- Add option to change the clock text font color.
--
-- Create a minetest 'advanced settings' section for this mod, and
-- there allow configuration of the clock text position, the image
-- offset, and the clock update interval.
--
-- Add chat command /clock with many options to change the display
-- dynamically.
--
-- Untabify and change indents from four to two.

local hud_now  = { };
local hud_img  = { };
local hud_rise = { };
local hud_set  = { };
local real_elapsed  = { };
local game_elapsed  = { };
local toggle_state = { };

local timer = 0;
local last_time = os.time()

-- Global variables
hc = {}
hc.pos = {}



function hc.load_setting(sname, stype, defaultval, valid_values)
-- This function was copied from mod "hudbars", but it seems
-- sufficiently generic to be part of the 'minetest' API!
  local sval
  if stype == "string" then
    sval = minetest.settings:get(sname)
  elseif stype == "bool" then
    sval = minetest.settings:get_bool(sname)
  elseif stype == "number" then
    sval = tonumber(minetest.settings:get(sname))
  end
  if sval ~= nil then
    if valid_values ~= nil then
      local valid = false
      for i=1,#valid_values do
        if sval == valid_values[i] then
          valid = true
        end
      end
      if not valid then
        minetest.log("error", "[hudclock] Invalid value for "..sname.."! Using default value ("..tostring(defaultval)..").")
        return defaultval
      else
        return sval
      end
    else
      return sval
    end
  else
    return defaultval
  end
end



-- Load default settings
dofile(minetest.get_modpath("hud_clock").."/default_settings.lua")



local function floormod ( x, y )
  return (math.floor(x) % y);
end



local function calc_times ( now, event )
-- Calculates the remaining real world game-play time in minutes and
-- seconds until an in-world gameplay event.
--
-- NOW is the current percentage of the gameplay day,
--     eg. minetest.env:get_timeofday()
--
-- EVENT is the percentage of the gameplay day for the future event.
--
-- The function works its magic based upon knowing the correct
-- relationship between the in-world gameplay time and real-world
-- time, defined by hc.time_const.
  if ((now) >= (event)) then
    diff
      = ((event*86400        / hc.time_const)
      + ((86400-(86400*now)) / hc.time_const));
  else
    diff
      = ((event*86400   / hc.time_const)
      - ((60*60*24*now) / hc.time_const));
  end
  return floormod(diff/60, 60), floormod(diff, 60);
end



local function get_times ( )
-- Returns the current in-world time, and the real-world time
-- remaining until the next in-game sunrise and sunset
  local timeofday = minetest.env:get_timeofday();

  local secs = (60*60*24*timeofday);
  local now_h = floormod(secs/3600, 60);
  local now_m = floormod(secs/60, 60);

  local rise_m, rise_s = calc_times(timeofday, hc.sunrise_time);
  local set_m,  set_s  = calc_times(timeofday, hc.sunset_time);

  return
    ("%02d:%02d"):format(now_h , now_m),
    ("Next sunrise: %02d:%02d"):format(rise_m, rise_s),
    ("Next sunset:  %02d:%02d"):format(set_m , set_s);
end



local function toggle_player_off( player, name )
  toggle_state[name] = false
  if hud_now[name] then
    player:hud_remove(hud_now[name]);
    hud_now[name] = nil
  end
  if hud_img[name] then
    player:hud_remove(hud_img[name]);
    hud_img[name] = nil
  end
  if hud_rise[name] then
    player:hud_remove(hud_rise[name]);
    hud_rise[name] = nil
  end
  if hud_set[name] then
    player:hud_remove(hud_set[name]);
    hud_set[name] = nil
  end
end



local function change_color( player, name, color )
  hc.fg_color = color
  if hud_now[name] then
    player:hud_change(hud_now[name], "number", color);
  end
  if hud_rise[name] then
    player:hud_change(hud_rise[name], "number", color);
  end
  if hud_set[name] then
    player:hud_change(hud_set[name], "number", color);
  end
end



minetest.register_globalstep(function ( dtime )
  timer = timer + dtime;
  if os.time() >= last_time then
    last_time = os.time() + 1
    if (timer >= hc.update_interval) then
      timer = 0;

--    BUG? Is this loop processing the clock for all connected
--    players? We want this feature to be for the current player only!
--    What if some players don't want the clocka t all?
      for _,p in ipairs(minetest.get_connected_players()) do

        local name = p:get_player_name();

        if toggle_state[name] == true then
          local now, rise, set = get_times();

--        Update the in-game time
          if (hud_now[name]) then
            p:hud_change(hud_now[name], "text", now);
          else
            hud_now[name] = p:hud_add({
              hud_elem_type = "text";
              position = hc.pos.now;
              text = now;
              number = hc.fg_color;
            --scale = ??;
            });
          end

--        Only need to present the image once
          if not (hud_img[name]) then
            hud_img[name] = p:hud_add({
              hud_elem_type = "image";
              position = hc.pos.now;
              offset = hc.pos.offset;
              scale = {x=1, y=1};
              text = "hud_clock.png";
            });
          end

--        Update the real-world time remaining until next in-game sunrise
          if (hc.sunrise) then
            if (hud_rise[name]) then
              p:hud_change(hud_rise[name], "text", rise);
            else
              hud_rise[name] = p:hud_add({
                hud_elem_type = "text";
                position = hc.pos.rise;
                text = rise;
                number = hc.fg_color;
              --scale = 20;
              });
            end
          end

--        Update the real-world time remaining until next in-game sunset
          if (hc.sunset) then
            if (hud_set[name]) then
              p:hud_change(hud_set[name], "text", set);
            else
              hud_set[name] = p:hud_add({
                hud_elem_type = "text";
                position = hc.pos.set;
                text = set;
                number = hc.fg_color;
              --scale = 20;
              });
            end
          end
        end
      end
    end
  end
end);


-- minetest.register_chatcommand
minetest.register_chatcommand("clock", {
  params = "[on|off|color|rise_on|rise_off|set_on|set_off]",
  description = "Toggle the view of the hud clock or its elements, and change its font color (format 0xRRGGBB).",
  func = function(name, param)
    local return_message = nil
    local player = minetest.get_player_by_name(name)
    if not player then
      return false, "Player not found"
    end
    if param == "" then
      if not toggle_state[name] then
        toggle_state[name] = true
        return_message = "Hud clock toggled on"
      else
        toggle_player_off(player, name)
        return_message = "Hud clock toggled off"
      end
    elseif param == "on" then
      if not toggle_state[name] then
        toggle_state[name] = true
        return_message = "Hud clock toggled on"
      end
    elseif param == "off" then
      if toggle_state[name] then
        toggle_player_off(player, name)
        return_message = "Hud clock toggled off"
      end
    elseif param:match("0x%x%x%x%x%x%x") then
      change_color(player, name, param)
      return_message = "Color changed"
    elseif param == "rise_on" then
      hc.sunrise = true
      if not hud_rise[name] then
        hud_rise[name] = playe1r:hud_add({
          hud_elem_type = "text";
          position = hc.pos.rise;
          text = rise;
          number = hc.fg_color;
        --scale = 20;
        });
      end
      return_message = "Hud 'next sunrise time' turned on"
    elseif param == "rise_off" then
      hc.sunrise = false
      if (hud_rise[name]) then
        player:hud_remove(hud_rise[name])
        hud_rise[name] = nil
      end
      return_message = "Hud 'next sunrise time' turned off"
    elseif param == "set_on" then
      hc.sunset = true
      if not hud_set[name] then
        hud_set[name] = playe1r:hud_add({
          hud_elem_type = "text";
          position = hc.pos.set;
          text = set;
          number = hc.fg_color;
        --scale = 20;
        });
      end
      return_message = "Hud 'next sunset time' turned on"
    elseif param == "set_off" then
      hc.sunset = false
      if (hud_set[name]) then
        player:hud_remove(hud_set[name])
        hud_set[name] = nil
      end
      return_message = "Hud 'next sunset time' turned off"



    elseif param == "real_elapsed_on" then
      hc.real_elapsed = true
      if not hud_set[name] then
        hud_set[name] = player:hud_add({
          hud_elem_type = "text";
          position = hc.pos.set;
          text = set;
          number = hc.fg_color;
        --scale = 20;
        });
      end
      return_message = "Hud 'real elapsed time' turned on"
    elseif param == "real_elapsed_off" then
      hc.sunset = false
      if (hud_set[name]) then
        player:hud_remove(hud_set[name])
        hud_set[name] = nil
      end
      return_message = "Hud 'real elapsed time' turned off"
    end



    if return_message then
      timer = hc.update_interval
      return true, return_message
    else
      return false, "Invalid parameter."
    end
  end,
});


minetest.register_on_joinplayer(function(player)
  local name = player:get_player_name()
  if hud_now[name] ~= nil then
    player:hud_remove(hud_now[name]);
    hud_now[name] = nil
  end
  if hud_img[name] ~= nil then
    player:hud_remove(hud_img[name]);
    hud_img[name] = nil
  end
  if hud_rise[name] ~= nil then
    player:hud_remove(hud_rise[name]);
    hud_rise[name] = nil
  end
  if hud_set[name] ~= nil then
    player:hud_remove(hud_set[name]);
    hud_set[name] = nil
  end
  toggle_state[name] = true
  return true
end)
