{ inputs, config, ... }: {

  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      setupCompleted = false;
      bar = {
        position = "top";
        backgroundOpacity = 0.0;
        monitors = [ ];
        density = "default";
        showCapsule = true;
        floating = true;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        outerCorners = true;
        exclusive = true;
        widgets = {
          left = [
            {
              id = "Workspace";
            }
            {
              id = "SystemMonitor";
            }
          ];
          center = [
            {
              id = "MediaMini";
              hideMode = "hidden";
              maxWidth = 300;
              scrollingMode = "always";
              showAlbumArt = true;
              showVisualizer = false;
              useFixedWidth = false;
              visualizerType = "mirrored";
            }
          ];
          right = [
            {
              id = "Battery";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "Microphone";
              displayMode = "alwaysShow";
            }
            {
              id = "Volume";
              displayMode = "alwaysShow";
            }
            {
              id = "Clock";
            }
            {
              id = "Tray";
            }
            {
              id = "ControlCenter";
            }
          ];
        };
      };
      general = {
        avatarImage = "";
        dimDesktop = true;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockOnSuspend = true;
        enableShadows = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
      };
      ui = {
        fontDefault = "Roboto";
        fontFixed = "DejaVu Sans Mono";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        tooltipsEnabled = true;
        panelsAttachedToBar = true;
        settingsPanelAttachToBar = false;
      };
      location = {
        name = "Pouso Alegre, Brasil";
        weatherEnabled = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
      };
      screenRecorder = {
        directory = "~/videos";
        frameRate = 60;
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "very_high";
        colorRange = "limited";
        showCursor = true;
        audioSource = "default_output";
        videoSource = "portal";
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        directory = "/home/quatro/nix/wallpapers/";
        enableMultiMonitorDirectories = false;
        recursiveSearch = false;
        setWallpaperOnAllMonitors = true;
        defaultWallpaper = "${config.home.homeDirectory}/nix/wallpapers/wallpaper2.jpg";
        fillMode = "crop";
        fillColor = "#000000";
        randomEnabled = true;
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
        monitors = [ ];
        panelPosition = "follow_bar";
      };
      sessionMenu = {
        countdownDuration = 10000;
        enableCountdown = false;
        position = "center";
        powerOptions = [
          {
            action = "lock";
            enabled = true;
          }
          {
            action = "logout";
            enabled = true;
          }
          {
            action = "suspend";
            enabled = true;
          }
          {
            action = "hibernate";
            enabled = false;
          }
          {
            action = "reboot";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
        showHeader = false;
      };
      appLauncher = {
        enableClipboardHistory = false;
        position = "center";
        backgroundOpacity = 1;
        pinnedExecs = [ ];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = "kitty -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
      };
      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
        icon = "snowflake";
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            { id = "ScreenRecorder"; }
            { id = "WallpaperSelector"; }
          ];
          right = [
            { id = "Notifications"; }
            { id = "PowerProfile"; }
            { id = "KeepAwake"; }
            { id = "NightLight"; }
          ];
        };
      };
      dock = {
        enabled = false;
        displayMode = "always_visible";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
      };
      network = {
        wifiEnabled = true;
      };
      notifications = {
        enabled = true;
        monitors = [ ];
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
      };
      osd = {
        enabled = true;
        location = "bottom_center";
        monitors = [ ];
        autoHideMs = 2000;
        overlayLayer = true;
      };
      audio = {
        volumeStep = 5;
        volumeOverdrive = true;
        cavaFrameRate = 30;
        visualizerType = "linear";
        visualizerQuality = "high";
        mprisBlacklist = [ "firefox" ];
        preferredPlayer = "YoutubeMusic";
      };
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
      };
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "TokyoNight";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        matugenSchemeType = "scheme-fruit-salad";
        generateTemplatesForPredefined = true;
      };
      templates = {
        gtk = false;
        qt = false;
        kcolorscheme = false;
        alacritty = false;
        kitty = false;
        ghostty = false;
        foot = false;
        wezterm = false;
        fuzzel = false;
        discord = false;
        pywalfox = false;
        vicinae = false;
        walker = false;
        code = false;
        spicetify = false;
        enableUserTemplates = false;
        discord_vesktop = false;
        discord_webcord = false;
        discord_armcord = false;
        discord_equibop = false;
        discord_lightcord = false;
        discord_dorion = false;
      };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
      };
      battery = {
        chargingMode = 0;
      };
    };
  };
}

