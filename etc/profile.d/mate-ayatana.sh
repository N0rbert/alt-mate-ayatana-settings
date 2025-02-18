if [[ "$DESKTOP_SESSION" = "mate" || "$XDG_SESSION_DESKTOP" = "mate" ]]; then
  # Correctly define XDG_DATA_DIRS for sure
  if [ -z "$XDG_DATA_DIRS" ]; then
    XDG_DATA_DIRS=/usr/share/mate:/usr/local/share/:/usr/share/
  else
    XDG_DATA_DIRS=/usr/share/mate:"$XDG_DATA_DIRS"
  fi
  export XDG_DATA_DIRS

  if [ -z "$XDG_CONFIG_DIRS" ]; then
    export XDG_CONFIG_DIRS=/etc/xdg/xdg-mate:/etc/xdg
  fi

  # Ensure GTK accessibility modules are active
  if [ -z "$GTK_MODULES" ]; then
    GTK_MODULES=gail:atk-bridge:canberra-gtk-module
  else
    GTK_MODULES="$GTK_MODULES:gail:atk-bridge:canberra-gtk-module"
  fi
  export GTK_MODULES

  # Disable GTK3 overlay scrollbars
  export GTK_OVERLAY_SCROLLING=0

  # MATE Desktop Qt integrations - ask Qt apps to use GTK styling
  # export QT_QPA_PLATFORMTHEME=gtk2
fi
