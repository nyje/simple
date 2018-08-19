# hud_clock

Configurable clock and timer for the minetest HUD

## Why?

Prior to this mod, there were two others offering hud clocks, but
'mthudclock' was positioned in a hard-coded way to be obscured by the
HUD map, and 'testclock' was positioned in a hard-coded way to be
obscured by the debug and chat output.

Once I started, feature creep set in.

## What?

### Additional display elements

+ real-world time remaining until next in-game sunset

+ real-world time remaining until next in-game sunrise

### Advanced setting menu tab

+ Change position of all elements

+ Change whether to display any element

+ Change the text font color

## Chat commands

    /clock            toggles display on/off

    /clock on         turn display on

    /clock off        turn display off

    /clock COLOR      where COLOR is in hexadecimal format 0xRRGGBB

    /clock rise_on    turn sunrise display on

    /clock rise_off   turn sunrise display on

    /clock set_on     turn sunset display on

    /clock set_off    turn sunset display off

## Credits:

Forked from 'mthudclock' by "Rochambeau"[1], which credits "Kaeza" and
"Pitriss" for code contributions and which was issued under the WTFPL
License. Also forked from 'testclock' by "cactus_pl"[2].

## Footnotes

[1] https://forum.minetest.net/viewtopic.php?t=11879

[2] https://forum.minetest.net/viewtopic.php?t=9325
