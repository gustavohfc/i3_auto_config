#!/bin/bash

# Confere os parametros
if [ "$#" -ne 1 ]; then
  echo "Numero de parametros invalido."
  exit
elif [ "$1" != "note" ] && [ "$1" != "estagio" ] && [ "$1" != "pc" ]; then
  echo "Argumento invalido."
  exit
fi

maquina=$1
config=~/.i3/config
i3blocks_conf=~/.i3/i3blocks.conf

# Configura as fontes
cp *.ttf ~/.fonts/
echo '
font pango:SFNS Display 10
' > $config

# Escreve as configuracoes padroes
echo '
# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!
#
# This config file uses keycodes (bindsym) and was written for the QWERTY
# layout.
#
# To get a config file with the same key positions, but for your current
# layout, use the i3-config-wizard
#

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
####font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# use these keys for focus, movement, and resize directions when reaching for
# the arrows is not convenient
####set $up l
####set $down k
####set $left j
####set $right semicolon

# use Mouse+Mod1 to drag floating windows to their wanted position
floating_modifier Mod1

# start a terminal
bindsym Mod1+Return exec gnome-terminal

# kill focused window
bindsym Mod1+Shift+q kill

# start dmenu (a program launcher)
bindsym Mod1+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym Mod1+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym Mod1+$left focus left
bindsym Mod1+$down focus down
bindsym Mod1+$up focus up
bindsym Mod1+$right focus right

# alternatively, you can use the cursor keys:
bindsym Mod1+Left focus left
bindsym Mod1+Down focus down
bindsym Mod1+Up focus up
bindsym Mod1+Right focus right

# move focused window
bindsym Mod1+Shift+$left move left
bindsym Mod1+Shift+$down move down
bindsym Mod1+Shift+$up move up
bindsym Mod1+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym Mod1+Shift+Left move left
bindsym Mod1+Shift+Down move down
bindsym Mod1+Shift+Up move up
bindsym Mod1+Shift+Right move right

# split in horizontal orientation
####bindsym Mod1+h split h

# split in vertical orientation
bindsym Mod1+v split v

# enter fullscreen mode for the focused container
bindsym Mod1+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym Mod1+s layout stacking
bindsym Mod1+w layout tabbed
bindsym Mod1+e layout toggle split

# toggle tiling / floating
bindsym Mod1+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym Mod1+space focus mode_toggle

# focus the parent container
bindsym Mod1+a focus parent

# focus the child container
#bindsym Mod1+d focus child

# move the currently focused window to the scratchpad
bindsym Mod1+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod1+minus scratchpad show

# switch to workspace
####bindsym Mod1+1 workspace 1
####bindsym Mod1+2 workspace 2
####bindsym Mod1+3 workspace 3
####bindsym Mod1+4 workspace 4
####bindsym Mod1+5 workspace 5
####bindsym Mod1+6 workspace 6
####bindsym Mod1+7 workspace 7
####bindsym Mod1+8 workspace 8
####bindsym Mod1+9 workspace 9
####bindsym Mod1+0 workspace 10

# move focused container to workspace
####bindsym Mod1+Shift+1 move container to workspace 1
####bindsym Mod1+Shift+2 move container to workspace 2
####bindsym Mod1+Shift+3 move container to workspace 3
####bindsym Mod1+Shift+4 move container to workspace 4
####bindsym Mod1+Shift+5 move container to workspace 5
####bindsym Mod1+Shift+6 move container to workspace 6
####bindsym Mod1+Shift+7 move container to workspace 7
####bindsym Mod1+Shift+8 move container to workspace 8
####bindsym Mod1+Shift+9 move container to workspace 9
####bindsym Mod1+Shift+0 move container to workspace 10

# reload the configuration file
bindsym Mod1+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod1+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym Mod1+Shift+e exec "i3-nagbar -t warning -m '"'"'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.'"'"' -b '"'"'Yes, exit i3'"'"' '"'"'i3-msg exit'"'"'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 10 px or 10 ppt
        bindsym Down        resize grow height 10 px or 10 ppt
        bindsym Up          resize shrink height 10 px or 10 ppt
        bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym Mod1+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
####bar {
####        status_command i3status
####}

#######################################################################
# automatically start i3-config-wizard to offer the user to create a
# keysym-based config which used their favorite modifier (alt or windows)
#
# i3-config-wizard will not launch if there already is a config file
# in ~/.i3/config.
#
# Please remove the following exec line:
#######################################################################
####exec i3-config-wizard
' >> $config




# -------------------------------------------------------------------------------------------


# Separa a tela na horizontal com G
echo '
# split in horizontal orientation
bindsym Mod1+g split h
' >> $config

# Teclas de movimento
echo '
set $up k
set $down j
set $left h
set $right l
' >> $config

# Abre o dmenu com a tecla do windows
echo '
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
bindsym Mod4+d exec --no-startup-id i3-dmenu-desktop
' >> $config

# Aplica o wallpaper
cp wallpaper.jpg ~/.i3/
echo 'exec_always feh --bg-scale ~/.i3/wallpaper.jpg' >> $config


# Seleciona os nomes dos workspaces
if [ "$maquina" == "estagio" ]; then
  echo '
  set $workspace1 "1"
  set $workspace2 "2"
  set $workspace3 "3"
  set $workspace4 "4"
  set $workspace5 "5"
  set $workspace6 "6"
  set $workspace7 "7"
  set $workspace8 "8"
  set $workspace9 "9"
  set $workspace10 "10"
  ' >> $config
elif [ "$maquina" == "note" ] || [ "$maquina" == "pc" ]; then
  echo '
  set $workspace1 "1"
  set $workspace2 "2"
  set $workspace3 "3"
  set $workspace4 "4"
  set $workspace5 "5"
  set $workspace6 "6"
  set $workspace7 "7"
  set $workspace8 "8"
  set $workspace9 "9"
  set $workspace10 "10"
  ' >> $config
else
  echo "Erro seleciona workspace"
fi

# Configura os nomes dos workspaces
echo '
# switch to workspace
bindsym Mod1+1 workspace $workspace1
bindsym Mod1+2 workspace $workspace2
bindsym Mod1+3 workspace $workspace3
bindsym Mod1+4 workspace $workspace4
bindsym Mod1+5 workspace $workspace5
bindsym Mod1+6 workspace $workspace6
bindsym Mod1+7 workspace $workspace7
bindsym Mod1+8 workspace $workspace8
bindsym Mod1+9 workspace $workspace9
bindsym Mod1+0 workspace $workspace10

# move focused container to workspace
bindsym Mod1+Shift+1 move container to workspace $workspace1
bindsym Mod1+Shift+2 move container to workspace $workspace2
bindsym Mod1+Shift+3 move container to workspace $workspace3
bindsym Mod1+Shift+4 move container to workspace $workspace4
bindsym Mod1+Shift+5 move container to workspace $workspace5
bindsym Mod1+Shift+6 move container to workspace $workspace6
bindsym Mod1+Shift+7 move container to workspace $workspace7
bindsym Mod1+Shift+8 move container to workspace $workspace8
bindsym Mod1+Shift+9 move container to workspace $workspace9
bindsym Mod1+Shift+0 move container to workspace $workspace10
' >> $config

# Configuracao do monitor (arandr)
if [ "$maquina" == "pc" ]; then
  echo "
        exec_always xrandr --output DVI-D-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --off --output DVI-I-1 --off --output DVI-I-0 --off --output DP-1 --off --output DP-0 --off
       " >> $config
elif [ "$maquina" == "estagio" ]; then
  echo "exec_always xrandr --output HDMI1 --mode 1366x768 --pos 1366x0 --rotate normal --output VIRTUAL1 --off --output VGA1 --primary --mode 1366x768 --pos 0x0 --rotate normal
       " >> $config
elif [ "$maquina" == "note" ]; then
  echo "" >> $config
else
  echo "Erro configuracao do monitor"
fi

# Cores
echo '
set $bg-color 	         #2f343f
set $inactive-bg-color   #2f343f
set $text-color          #f3f4f5
set $inactive-text-color #676E7D
set $urgent-bg-color     #E53935

# window colors
#                       border              background         text                 indicator
client.focused          $bg-color           $bg-color          $text-color          #ffffff
client.unfocused        $inactive-bg-color  $inactive-bg-color $inactive-text-color #ffffff
client.focused_inactive $inactive-bg-color  $inactive-bg-color $inactive-text-color #ffffff
client.urgent           $urgent-bg-color    $urgent-bg-color   $text-color          #ffffff
' >> $config

# Bar
echo '
bar {
    status_command i3blocks -c '$i3blocks_conf'
    colors {
            background $bg-color
            separator #757575
            #                  border             background         text
            focused_workspace  $bg-color          $bg-color          $text-color
            inactive_workspace $inactive-bg-color $inactive-bg-color $inactive-text-color
            urgent_workspace   $urgent-bg-color   $urgent-bg-color   $text-color
    }
    font pango: DejaVu Sans Mono 10
}
' >> $config

# Lock (Windows+l)
echo '
bindsym Mod4+l exec i3lock --color "#222222"
' >> $config













# -------------------------------------------------------------------------------------------
# Configuracao do i3blocks

echo '
# Global properties
#The top properties below are applied to every block, but can be overridden.
#Each block command defaults to the script name to avoid boilerplate.
command=/usr/local/libexec/i3blocks/$BLOCK_NAME
separator_block_width=15
markup=none
' > $i3blocks_conf


# Volume
if [ "$maquina" == "note" ] || [ "$maquina" == "pc" ]; then
  echo "
[volume]
label=♪
instance=Master
interval=1
" >> $i3blocks_conf
fi

echo "
[memory]
label=MEM
separator=false
interval=30

[memory]
label=SWAP
instance=swap
separator=false
interval=30

[disk]
label=HOME
#instance=/mnt/data
interval=30

[iface]
#instance=wlan0
color=#00FF00
interval=10
separator=false

[wifi]
#instance=wlp3s0
interval=10
separator=false

[bandwidth]
#instance=eth0
interval=5

[cpu_usage]
label=CPU
interval=10
min_width=CPU: 100.00%
#separator=false

#[load_average]
#interval=10

[battery]
label=BAT
#label=⚡
#instance=1
interval=30

[time]
command=date '+%d-%m-%Y %H:%M:%S'
interval=10
" >> $i3blocks_conf