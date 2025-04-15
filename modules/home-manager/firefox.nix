{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    # package =
    #   pkgs.firefox.override
    #   {
    #     nativeMessagingHosts = [
    #       pkgs.tridactyl-native
    #     ];
    #   };

    languagePacks = ["en-US" "pt-BR"];

    profiles = {
      quatro = {
        id = 0;
        isDefault = true;
        search.engines = {
          "bing".metaData.hidden = true;
          "google".metaData.hidden = true;
          "ddg".metaData.hidden = true;
          "wikipedia".metaData.hidden = true;

          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["!np"];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "24.11";
                  }
                  {
                    name = "from";
                    value = "0";
                  }
                  {
                    name = "size";
                    value = "50";
                  }
                  {
                    name = "sort";
                    value = "relevance";
                  }
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["!no"];
          };

          "Searchix" = {
            urls = [{template = "https://searchix.alanpearce.eu/all/search?query={searchTerms}";}];
            icon = "https://wiki.nixos.org/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["!ns"];
          };

          "Brave Search" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
          };

          "Nyaa" = {
            urls = [{template = "https://nyaa.si/?f=0&c=1_2&q=1080p+{searchTerms}";}];
            definedAliases = ["!ani"];
          };
        };

        search.default = "Brave Search";
        search.force = true;

        settings = {
          "media.ffmpeg.vaapi.enabled" = true;
          "browser.tabs.closeWindowWithLastTab" = true;
          "dom.security.https_only_mode" = true;
          "browser.download.panel.shown" = true;
          "signon.rememberSignons" = false;
          "full-screen-api.transition.timeout" = 0;
          "full-screen-api.warning.timeout" = 0;
          "full-screen-api.fullscreenElement.timeout" = 0;
          "full-screen-api.fullscreenEnabled" = false;
          "full-screen-api.visibleElement.timeout" = 0;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSearch" = false;
          "browser.newtabpage.enabled" = false;
          "browser.newtabpage.storageVersion" = 1;
          "browser.startup.page" = 3;
          "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.showSearchSuggestionsFirst" = false;
          "browser.urlbar.suggest.recentsearches" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.suggest.trending" = false;
          "browser.urlbar.tipShownCount.searchTip_onboard" = 2;
          "services.sync.declinedEngines" = "";
          "browser.urlbar.quicksuggest.scenario" = "history";
          "browser.urlbar.placeholderName" = "Brave Search";
          "signon.autofillForms" = false;
          "signon.generation.enabled" = false;
          "signon.firefoxRelay.enabled" = false;
          "extensions.autoDisableScopes" = 0;
        };

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          augmented-steam
          bitwarden
          darkreader
          enhancer-for-youtube
          mal-sync
          sponsorblock
          ublock-origin
          videospeed
          # tridactyl
        ];
      };
    };
  };
}
