{ config, pkgs, lib, ... }:

{

  programs.firefox = {

    enable = false;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      darkreader
      ublock-origin
      vimium
      decentraleyes
      search-by-image
      zoom-redirector
    ];

    profiles.work = {
      id = 1;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "dom.w3c_touch_events.enabled" = 1;
        "extensions.update.enabled" = false;
        "findbar.modalHighlight" = true;
        "browser.urlbar.trimURLs" = true;
        "media.navigator.audio.full_duplex" = false;
        "media.autoplay.enabled" = false;
        "browser.uidensity" = 1;
        "browser.search.region" = "US";
        "browser.search.isUS" = true;
        "browser.tabs.closeTabByDblclick" = true;
        "browser.in-content.dark-mode" = true;
      };

      userContent = ''
        *{scrollbar-width:none !important}
      '';

      userChrome = ''
        @namespace "http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul";
        #browser vbox#appcontent tabbrowser, #content, #tabbrowser-tabpanels, browser[type=content-primary], browser[type=content] > html { background: #222 !important; }

        #tabs-newtab-button { display:none !important; }
        #tabbrowser-tabs .tabbrowser-tab .tab-close-button { display:none !important; }

        #TabsToolbar, .tabbrowser-tab {
          height: 44px !important;
          font-size: 12px;
          position: absolute !important;
        }
        .scrollbutton-up, .scrollbutton-down { display: none !important; }

        #browser { -moz-box-ordinal-group: 0 !important; padding-top: 0px; padding-bottom:-30px; }
        :root:not([customizing]) #TabsToolbar{ background-color: #222222; }
        :root:not([customizing]) #navigator-toolbox { background-color: #222222 !important; }

        #tabbrowser-tabs ~ #alltabs-button {display:none!important;}
        #urlbar[focused]{ top: auto !important; bottom: 0px !important; }
        #urlbar[breakout=true]:not([open="true"]) { --urlbar-height: 20px !important; --urlbar-toolbar-height: 24px !important; }
        #urlbar-container { --urlbar-container-height: 30px !important; margin-top: 0 !important; }
        .statuspanel-label {display:none!important;}
        #statuspanel {display:none!important;}
      '';
    };

    profiles.default = {
      id = 0;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "dom.w3c_touch_events.enabled" = 1;
        "extensions.update.enabled" = false;
        "findbar.modalHighlight" = true;
        "browser.urlbar.trimURLs" = true;
        "media.navigator.audio.full_duplex" = false;
        "media.autoplay.enabled" = false;
        "browser.uidensity" = 1;
        "browser.search.region" = "US";
        "browser.search.isUS" = true;
        "browser.tabs.closeTabByDblclick" = true;
        "browser.in-content.dark-mode" = true;
      };

      userContent = ''
        *{scrollbar-width:none !important}
      '';

      userChrome = ''
        @namespace "http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul";
        #browser vbox#appcontent tabbrowser, #content, #tabbrowser-tabpanels, browser[type=content-primary], browser[type=content] > html { background: #222 !important; }

        #tabs-newtab-button { display:none !important; }
        #tabbrowser-tabs .tabbrowser-tab .tab-close-button { display:none !important; }

        #TabsToolbar, .tabbrowser-tab {
          height: 44px !important;
          font-size: 12px;
          position: absolute !important;
        }
        .scrollbutton-up, .scrollbutton-down { display: none !important; }

        #browser { -moz-box-ordinal-group: 0 !important; padding-top: 0px; padding-bottom:-30px; }
        :root:not([customizing]) #TabsToolbar{ background-color: #222222; }
        :root:not([customizing]) #navigator-toolbox { background-color: #222222 !important; }

        #tabbrowser-tabs ~ #alltabs-button {display:none!important;}
        #urlbar[focused]{ top: auto !important; bottom: 0px !important; }
        #urlbar[breakout=true]:not([open="true"]) { --urlbar-height: 20px !important; --urlbar-toolbar-height: 24px !important; }
        #urlbar-container { --urlbar-container-height: 30px !important; margin-top: 0 !important; }
        .statuspanel-label {display:none!important;}
        #statuspanel {display:none!important;}
      '';
    };
  };
  home.file.".mozilla/native-messaging-hosts/passff.json".source =
    "${pkgs.passff-host}/share/passff-host/passff.json";

}
