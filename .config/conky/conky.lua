-- Conky, a system monitor https://github.com/brndnmtthws/conky
--
-- This configuration file is Lua code. You can write code in here, and it will
-- execute when Conky loads. You can use it to generate your own advanced
-- configurations.
--
-- Try this (remove the `--`):
--
--   print("Loading Conky config")
--
-- For more on Lua, see:
-- https://www.lua.org/pil/contents.html

conky.config={
  background=true,
  alignment = 'top_left',
  gap_x = 20,
  border_inner_margin=5,
  border_outer_margin=10,
  border_width=2,
  default_bar_height=5,
  default_bar_width=80,
  -- default_color="C0C0C0",
  default_color="222222",
  default_graph_height=25,
  default_graph_width=200,
  default_outline_color="000000",
  default_shade_color="000000",
  double_buffer=true,
  draw_borders=false,
  draw_graph_borders=false,
  draw_outline=false,
  draw_shades=false,
  font="FiraCode Nerd Font:style=Retina,Regular:size=12",
  maximum_width=1500,
  minimum_width=500,
  no_buffers=true,
  override_utf8_locale=true,
  own_window_class="conky",
  own_window_hints="undecorated,below,skip_taskbar,skip_pager,sticky",
  own_window_transparent=true,
  own_window=true,
  own_window_type="desktop",
  stippled_borders=0,
  text_buffer_size=6144,
  total_run_times=0,
  update_interval=5,
  uppercase=false,
  use_spacer="none",
  use_xft=true,
  xftalpha=0.8,
};

conky.text = [[
${font FiraCode Nerd Font:style=Bold:pixelsize=50}Info ${hr 2}${font}
Clock: ${time %Y-%m-%d %R}
Battery: $battery
Uptime:$color $uptime
Frequency (in MHz):$color $freq
Frequency (in GHz):$color $freq_g
RAM Usage:$color $mem/$memmax - $memperc% ${membar 4}
Swap Usage:$color $swap/$swapmax - $swapperc% ${swapbar 4}
CPU Usage:$color $cpu% ${cpubar 4}
Processes:$color $processes  Running:$color $running_processes
$hr
File systems:
 / $color${fs_used /}/${fs_size /} ${fs_bar 6 /}
Networking:
Up:$color ${upspeed}  - Down:$color ${downspeed}
]]
