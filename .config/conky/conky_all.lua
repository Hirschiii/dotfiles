conky.config={
  background=true,
  alignment = 'middle_right',
  border_inner_margin=5,
  border_outer_margin=10,
  border_width=2,
  cpu_avg_samples=2,
  default_bar_height=5,
  default_bar_width=80,
  default_color="C0C0C0",
  default_graph_height=25,
  default_graph_width=200,
  default_outline_color="000000",
  -- default_outline_color="FFFFFF",
  default_shade_color="FFFFFF",
  diskio_avg_samples=2,
  double_buffer=true,
  draw_borders=false,
  draw_graph_borders=false,
  draw_outline=false,
  draw_shades=false,
  font="FiraCode Nerd Font Mono:style=Retina,Regular:size=12",
  maximum_width=300,
  minimum_width=300,
  net_avg_samples=2,
  no_buffers=true,
  override_utf8_locale=true,
  own_window_class="conky",
  own_window_hints="undecorated,below,skip_taskbar,skip_pager,sticky",
  own_window_transparent=true,
  own_window=true,
  own_window_type="desktop",
  stippled_borders=0,
  text_buffer_size=6144,
  top_cpu_separate=true,
  top_name_width=25,
  total_run_times=0,
  update_interval=5,
  uppercase=false,
  use_spacer="none",
  use_xft=true,
  xftalpha=0.5,

  --Network Template
  template3=[[${if_up \1}${font}\1 down: ${downspeed \1} (${totaldown \1}) ${alignr}up: ${upspeed \1} (${totalup \1})\n${font}${downspeedgraph \1 25,140 C0C0C0 5F9EA0 -t} ${alignr}${upspeedgraph \1 25,140 C0C0C0 5F9EA0 -t}\n${endif}]]


};

conky.text=[[
${font FiraCode Nerd Font:style=Retina,Bold:pixelsize=12}SYSTEM ${hr 2}${font}
${font}${alignr}${cpugraph cpu0 40,92 C0C0C0 5F9EA0 -t}
${font}${alignr}${memgraph 10,92 C0C0C0 5F9EA0 -t}${voffset -65}
${font} CPU1${tab}${cpubar cpu1 5,80} ${cpu cpu1}%  ${platform coretemp.0/hwmon/hwmon1 temp 1}°C
${font} CPU2${tab}${cpubar cpu2 5,80} ${cpu cpu2}%  ${platform coretemp.0/hwmon/hwmon1 temp 2}°C
${font} CPU3${tab}${cpubar cpu3 5,80} ${cpu cpu3}%  ${platform coretemp.0/hwmon/hwmon1 temp 3}°C
${font} CPU4${tab}${cpubar cpu4 5,80} ${cpu cpu4}%  ${platform coretemp.0/hwmon/hwmon1 temp 4}°C
${font}  RAM${tab}${membar 5,80} ${memperc}%  ${mem}
${font FiraCode Nerd Font:style=Retina,Bold:pixelsize=12}DISK USAGE ${hr 2}${font}
${texecpi 120 $HOME/.local/bin/conky/conky-diskio.sh}
${texecpi 120 $HOME/.local/bin/conky/conky-disk-usage.sh}
${font FiraCode Nerd Font:style=Retina,Bold:pixelsize=12:size=12}PROCESSES ${hr 2}${font}
${top_cpu_separate=false}NAME ${alignr}PID    CPU   MEM
${top name 1} ${alignr}${top pid 1} ${top cpu 1} ${top mem 1}
${top name 2} ${alignr}${top pid 2} ${top cpu 2} ${top mem 2}
${top name 3} ${alignr}${top pid 3} ${top cpu 3} ${top mem 3}
${top name 4} ${alignr}${top pid 4} ${top cpu 4} ${top mem 4}
${top name 5} ${alignr}${top pid 5} ${top cpu 5} ${top mem 5}

${font FiraCode Nerd Font:style=Retina,Bold:pixelsize=12}DOING ${hr 2}${font}
${texecpi 60 flock /home/niklas/.task task limit:10 rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank doing | ansito - | sed -r 's/([^ ])#/\1\\#/g'}
${font FiraCode Nerd Font:style=Retina,Bold:pixelsize=12}TODO ${hr 2}${font}
${texecpi 60 flock /home/niklas/.task task limit:10 rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank todo | ansito - | sed -r 's/([^ ])#/\1\\#/g'}
${font FiraCode Nerd Font:style=Retina,Bold:pixelsize=12}BURNDOWN ${hr 2}${font}
${font FiraCode Nerd Font Mono:style=Retina,Bold:size=12}${texecpi 120 flock /home/niklas/.task task rc._forcecolor:on burndown.monthly | tail -n+2 | head -n-2 | $HOME/.local/bin/conky/conky-bg-space-to-fg.sh | ansito - | sed -r 's/([^ ])#/\1\\#/g'}${font}
${font FiraCode Nerd Font:style=Retina,Bold:pixelsize=12}PROGRESS ${hr 2}${font}
${font FiraCode Nerd Font:style=Retina,Regular:size=12}${texecpi 180 flock /home/niklas/.task $HOME/.local/bin/conky/conky-task-progress.sh}${font}
]]