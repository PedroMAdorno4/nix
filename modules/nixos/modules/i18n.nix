{ pkgs, ... }: {
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod =
      {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          waylandFrontend = true;
          addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
            fcitx5-nord
          ];

          settings = {
            globalOptions = {
              "Hotkey" = {
                "EnumerateWithTriggerKeys" = true;
                "EnumerateForwardKeys" = "";
                "EnumerateBackwardKeys" = "";
                "EnumerateSkipFirst" = false;
                "EnumerateGroupForwardKeys" = "";
                "EnumerateGroupBackwardKeys" = "";
                "ActivateKeys" = "";
                "DeactivateKeys" = "";
                "PrevPage" = "";
                "NextPage" = "";
                "PrevCandidate" = "";
                "NextCandidate" = "";
                "TogglePreedit" = "";
              };
              "Hotkey/TriggerKeys" = {
                "0" = "Control+space";
              };
              "Behavior" = {
                "ActiveByDefault" = false;
                "ResetStateWhenFocusIn" = "No";
                "ShareInputState" = "No";
                "PreeditEnabledByDefault" = true;
                "ShowInputMethodInformation" = true;
                "ShowInputMethodInformationWhenFocusIn" = false;
                "CompactInputMethodInformation" = true;
                "ShowFirstInputMethodInformation" = true;
                "DefaultPageSize" = 5;
                "OverrideXkbOption" = false;
                "CustomXkbOption" = "";
                "EnabledAddons" = "";
                "DisabledAddons" = "";
                "PreloadInputMethod" = true;
                "AllowInputMethodForPassword" = false;
                "ShowPreeditForPassword" = false;
                "AutoSavePeriod" = 30;
              };
            };
            inputMethod = {
              "Groups/0" = {
                "Name" = "Default";
                "Layout" = "us";
                "DefaultIM" = "keyboard-us-intl";
              };
              "Groups/0/Items/0" = {
                "Name" = "keyboard-us-intl";
                "Layout" = "";
              };
              "GroupOrder" = {
                "0" = "Default";
              };
            };
          };
        };
      };

    extraLocaleSettings = {
      LC_TIME = "pt_BR.UTF-8";
    };

    supportedLocales = [ "all" ];
  };
}
