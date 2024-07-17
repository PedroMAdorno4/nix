{
  wayland.windowManager.hyprland.settings = {
    #monitor=name,resolution,position,scale
    "$mainMonitorName"="DP-3";
    "$mainMonitorResolution"="1920x1080@143.98100";
    "$mainMonitorPosition"="0x0";
    "$mainMonitorScale"="1";
    "$mainMonitor"="$mainMonitorName,$mainMonitorResolution,$mainMonitorPosition,$mainMonitorScale";
    
    "$secondaryMonitorName"="HDMI-A-1";
    "$secondaryMonitorResolution"="1920x1080@60";
    "$secondaryMonitorPosition"="1920x0";
    "$secondaryMonitorScale"="1";

    # this value controls what the Super + N keybind rotate the monitor to
    "$secondaryMonitorPortraitTransform"="1";
    "$secondaryMonitor"="$secondaryMonitorName,$secondaryMonitorResolution,$secondaryMonitorPosition,$secondaryMonitorScale,transform,1";

    monitor=["$mainMonitor" "$secondaryMonitor"];

    # Binding workspace to monitors
    workspace = ["1, monitor:DP-3, default:true" "2, monitor:DP-3" "3, monitor:DP-3" "4, monitor:DP-3" "5, monitor:DP-3" "6, monitor:DP-3" "7, monitor:DP-3" "8, monitor:DP-3" "9, monitor:DP-3" "10, monitor:DP-3" "101, monitor:HDMI-A-1, default:true" "102, monitor:HDMI-A-1" "103, monitor:HDMI-A-1" "104, monitor:HDMI-A-1" "105, monitor:HDMI-A-1" "106, monitor:HDMI-A-1" "107, monitor:HDMI-A-1" "108, monitor:HDMI-A-1" "109, monitor:HDMI-A-1" "110, monitor:HDMI-A-1"];
  };
}
