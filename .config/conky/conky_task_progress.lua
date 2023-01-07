conky.config={
  background=true,
  alignment = 'top_right',
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

conky.text=[[
${font FiraCode Nerd Font:style=Bold:pixelsize=50}DOING ${hr 2}${font}
${texecpi 60 flock /home/niklas/.task task limit:10 rc.defaultwidth:80 doing | ansito - | sed -r 's/([^ ])#/\1\\#/g' | cat }
${font FiraCode Nerd Font:style=Bold:pixelsize=50}TODO ${hr 2}${font}
${texecpi 60 flock /home/niklas/.task task limit:5 rc.defaultwidth:80 todo project.not:Schule | sed -r 's/([^ ])#/\1\\#/g' | cat}
${font FiraCode Nerd Font:style=Bold:pixelsize=50}Schulaufgaben ${hr 2}${font}
${texecpi 60 flock /home/niklas/.task task limit:10 rc.defaultwidth:80 schulaufgaben }
${font FiraCode Nerd Font:style=Bold:pixelsize=50}Nächste Klausur ${hr 2}${font}
${texecpi 60 flock /home/niklas/.task task limit:10 rc.defaultwidth:80 examen }
]]


-- ${font FiraCode Nerd Font:style=Bold:pixelsize=50}BURNDOWN ${hr 2}${font}
-- ${font FreeMono:style=Bold:size=10}${texecpi 120 flock /home/niklas/.task task rc._forcecolor:on burndown.monthly | tail -n+2 | head -n-2 | $HOME/.local/bin/conky/conky-bg-space-to-fg.sh | ansito - | sed -r 's/([^ ])#/\1\\#/g'}${font}

-- ${font FiraCode Nerd Font:style=Bold:pixelsize=50}PROGRESS ${hr 2}${font}
-- ${font FiraCode Nerd Font:size=10}${texecpi 180 flock /home/niklas/.task $HOME/.local/bin/conky/conky-task-progress.sh | sed '/100/d'}${font}

-- ${texecpi 60 flock /home/niklas/.task task limit:10 rc.defaultwidth:80 rc._forcecolor:on rc.verbose:affected,blank todo | ansito - | sed -r 's/([^ ])#/\1\\#/g' | cat}
