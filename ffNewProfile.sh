#!/bin/sh
clear
echo -n "Please describe this Firefox Profile with a name: " && read ffProfileName
Addons_Installed_HERE="ublock-origin,
bitwarden-password-manager,
darkreader,
sidebery,
floccus,
chikamichi,
adaptive-tab-bar-colour,
multi-account-containers,
temporary-containers,
facebook-container,
containers-helper,
redirector,
istilldontcareaboutcookies,
onetab,
downthemall,
external-application,
canvasblocker,
webext-private-bookmarks,
refined-h264ify,
requestcontrol,
ttsfox,
ecosia-the-green-search,
ddg-lite-search-provider,
nighttab,
fastforwardteam,
audioctx-fingerprint-defender"
echo "Creating Profile"
firefox -CreateProfile $ffProfileName
# sed will search for `Path=` it will then try and find the line with the name of the firefox profile specified above. Then remove all text to the left of the `=` sign.
folder=$(sed -n "/Path=.*.$ffProfileName$/ s/.*=//p" ~/.mozilla/firefox/profiles.ini)
# sed -n 's/Path=//p' ~/.mozilla/firefox/profiles.ini | grep $ffProfileName
profilePath="/home/$(whoami)/.mozilla/firefox/$folder"
cd $profilePath
echo "Profile Creation Finished"
# Making edits to a new theme:  https://superuser.com/questions/1608096/how-to-inspect-firefoxs-ui
# Find more themes:  https://firefoxcss-store.github.io/
######################################################################
## Add this theme for example: https://raw.githubusercontent.com/Shina-SG/Shina-Fox/main/userChrome.css
## Add to the bottom of your userChrome.css:
### #_c607c8df-14a7-4f28-894f-29e8722976af_-BAP, _c607c8df-14a7-4f28-894f-29e8722976af_-browser-action { display: none; } /** The tmp tabs button **/
### #TabsToolbar .titlebar-buttonbox-container:not(:hover) .titlebar-buttonbox .titlebar-button { background-color: hsla(0, 0%, 0%, 0) !important; } 
### #TabsToolbar .titlebar-buttonbox-container .titlebar-min{  background-color: #fac536 !important; }
### #TabsToolbar .titlebar-buttonbox-container .titlebar-max, #TabsToolbar .titlebar-buttonbox-container .titlebar-restore{ background: #39ea49 !important; } 
### #TabsToolbar .titlebar-buttonbox-container .titlebar-close{ background: #f25056 !important; } 
##
######################################################################
mkdir chrome sidebery 2> /dev/null
echo "Install Theme and Select New Profile -- My favorite style is 1) Original"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/black7375/Firefox-UI-Fix/master/install.sh)"
cd $profilePath
curl -sS https://raw.githubusercontent.com/christorange/VerticalFox/main/windows/userChrome.css >> ./chrome/userChrome.css
curl -sS https://raw.githubusercontent.com/christorange/VerticalFox/main/sidebery/dark_sidebery_styles.css > ./sidebery/dark_sidebery_styles.css
clear
echo -e "\nYou will need to paste in the styling for Sidebery.\nThe styles are located at $profilePath/sidebery\n" && sleep 2
echo -e "\nA reminder will be displayed again at the end of the script." && sleep 5
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js >> user.js && clear
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Securefox.js >> user.js && clear
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Fastfox.js >> user.js && clear
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Peskyfox.js >> user.js && clear
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Smoothfox.js >> user.js && clear
echo -e "Preference persistantance file for edits :\nuser-overrides.js\n" && sleep 2;
cat <<EOF > user-overrides.js



////////////////////////////////////////////////////
//   Quick changes you may want to make
////////////////////////////////////////////////////

// PREF: Set the start page to be resume session
user_pref("browser.startup.page", 3);                                           // 0=blank, 1=home, 2=last visited page, 3=resume previous session

// PREF: disable Firefox Sync
user_pref("identity.fxaccounts.enabled", false);    // This will remove the chance to use Firefox sync all together

// NOTE: If you have over 300 Mbps internet dedicated to a single browser, you may want to just disable Disk Cache, unless you're caching on an NVME.



////////////////////////////////////////////////////
//   [SECTION 0100]: STARTUP
////////////////////////////////////////////////////

// Disable Activity Stream recent Highlights in the Library
user_pref("browser.library.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);

// Disable recommdations
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);   // Disable "Recommend extensions as you browse"
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false); // Disable "Recommend features as you browse"

// Disable Activity Stream telemetry
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");

// Disable Activity Stream Snippets (runs code from a remote server)
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.asrouter.providers.snippets", "");

// The NewTab Page. Dont use it. Use the NightTab addon.
user_pref("browser.newtabpage.activity-stream.showSearch", true);       // This basically how Mozilla gets paid, leave it on.
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.search.serpEventTelemetry.enabled", false);
user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.system.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.sections", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.recommendationprovider", false);
user_pref("browser.newtabpage.activity-stream.feeds.recommendationprovider", false);
user_pref("browser.newtabpage.activity-stream.feeds.recommendationproviderswitcher", false);

// 0000: Don't warn when opening about:config 
user_pref("browser.aboutConfig.showWarning", false);  // for the new HTML version [FF71+]

// 0001: Disable startup next>next>next screens
user_pref("browser.onboarding.enabled", false);        // Hide onboarding tour (uses Google Analytics)

// 0103: set HOME+NEWWINDOW page
user_pref("browser.shell.checkDefaultBrowser", false); // Disable check for default browser

// Disable promo
user_pref("browser.vpn_promo.enabled", false);

// 0106: clear default topsites
user_pref("browser.newtabpage.activity-stream.default.sites", "");



////////////////////////////////////////////////////
//   My Custom Stuff
////////////////////////////////////////////////////

user_pref("browser.startup.homepage", "about:blank");  // Set "Homepage and new windows"
user_pref("browser.newtabpage.enabled", false);        // Set "New tabs"
user_pref("browser.newtab.preload", false);

// Disable Ctrl+Q quit shortcut
user_pref("browser.quitShortcut.disabled", true);

// Settings for finding
//user_pref("findbar.highlightAll", true);    // Most user.js files already include highlight all words on the page
user_pref("findbar.modalHighlight", true);  // Dim the rest of the page

// When double-clicking a word on a page, only copy the word itself, not the space character next to it 
//user_pref("layout.word_select.eat_space_to_next_word", false);   // Most user.js files already include removing the white space next to a word

// disable telemetry of what default browser you use [WINDOWS]
user_pref("default-browser-agent.enabled", false);

// enable Firefox View while keeping it disabled
// Just open  ---   about:firefoxview 
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.tabs.firefox-view-next", true);
user_pref("browser.tabs.firefox-view-newIcon", true); // needed?

// do not allow embedded tweets, Instagram, Reddit, and Tiktok posts
user_pref("urlclassifier.trackingSkipURLs", "");
user_pref("urlclassifier.features.socialtracking.skipURLs", "");

// enable HTTPS-Only Mode
// Warn me before loading sites that don't support HTTPS
// in both Normal and Private Browsing windows.
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

// Display "Not Secure" text on HTTP websites
user_pref("security.insecure_connection_text.enabled", true);

// More zoom amounts
user_pref("toolkit.zoomManager.zoomValues", ".3,.5,.67,.8,.95,.9,1,1.1,1.15,1.2,1.25,1.33,1.5,1.7,2,2.4,3,4,5");

// any time I click on a bookmark it opens in another tab
user_pref("browser.tabs.loadBookmarksInTabs", true);



////////////////////////////////////////////////////
//   [SECTION 2000]: PLUGINS / MEDIA / WEBRTC
////////////////////////////////////////////////////

// 2815: allow "Cookies" and "Site Data" on shutdown
user_pref("privacy.clearOnShutdown.cookies", false); // Allow Cookies



////////////////////////////////////////////////////
//   [SECTION 0300]: QUIETER FOX
////////////////////////////////////////////////////

// Disable add-on recommendations
// user_pref("extensions.getAddons.showPane", false);  // Most user.js files already include Disable about:addons "Recommendations" (uses Google Analytics) [HIDDEN PREF]
user_pref("extensions.htmlaboutaddons.discover.enabled", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);



////////////////////////////////////////////////////
//   [SECTION 1700]: CONTAINERS
////////////////////////////////////////////////////

// 1701: enable Container Tabs
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);

// 1702: set behavior on "+ Tab" button to just open a new tab
user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", false);



////////////////////////////////////////////////////
//   [SECTION 2800]: SHUTDOWN & SANITIZING
////////////////////////////////////////////////////

// 2810: enable Firefox to clear items on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", true);                         // [WARNING: false will allow everything in browser to stay upon shutdown]

// 2811: set/enforce what items to clear on shutdown
user_pref("privacy.clearOnShutdown.cache", false);                              // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.downloads", true);                           // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.formdata", true);                            // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.history", false);                            // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.sessions", false);                           // [DEFAULT: true]



////////////////////////////////////////////////////
//   [SECTION 4000]: FPP (fingerprintingProtection)
////////////////////////////////////////////////////

// 4501: disable RFP and Go easy on fingerprinting
// Firefox RFP has some side effects: mainly timezone is UTC, letterboxing, and websites will prefer light theme
user_pref("privacy.resistFingerprinting", false);                               // Disable RFP to use localtimezone and Canvas API

// 4504: disable RFP letterboxing
// Firefox RFP will randomize the canvas, causing borders around viewframe
user_pref("privacy.resistFingerprinting.letterboxing", false);                  // Disable letterboxing, basically if you disable above - disable this

// 4510: disable using system colors
user_pref("browser.display.use_system_colors", false);                          // Do not use default dark mode or light mode

// 4520: disable WebGL (Web Graphics Library)
user_pref("webgl.disabled", false);                                             // Enable WebGL (Web Graphics Library) for Canvas API


////////////////////////////////////////////////////
//   My Custom FPP Stuff
////////////////////////////////////////////////////

// Go easy on tracking protection
// (Really, only use if you're also using adnauseam.)
// Adnauseam needs access before any ad blocking, to click the ads.
// You can find out more about these at: https://mozilla.github.io/policy-templates/

//user_pref("privacy.trackingprotection.enabled", false);                         // If this policy is not configured, tracking protection is not enabled by default in the browser, but it is enabled by default in private browsing.

//user_pref("privacy.trackingprotection.pbmode.enabled", false);                  // tracking protection in Private Browsing mode on websites are ALLOWED

//user_pref("privacy.trackingprotection.cryptomining.enabled", false);            // cryptomining scripts on websites are ALLOWED

//user_pref("privacy.trackingprotection.fingerprinting.enabled", false);          // fingerprinting scripts on websites are ALLOWED

// Dont use Pocket, use Wallabag or Readeck
//user_pref("extensions.pocket.enabled", false);                                  // Most user.js files already include Disable Pocket

user_pref("general.autoScroll", true);                                          // Enable AutoScrolling

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);         // Enable userchrome.css

//user_pref("browser.urlbar.update2.engineAliasRefresh", true);                // Most user.js files already include Add button to add custom search engines

user_pref("ui.systemUsesDarkTheme", 1);                                         // Dark Mode

user_pref("browser.startup.homepage", "https://www.github.com/marcusholtz");    // My favorite homepage

//user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");



////////////////////////////////////////////////////
//   [SECTION 5000]: OPTIONAL OPSEC
////////////////////////////////////////////////////

// Passwords and Forms
user_pref("signon.rememberSignons", false);   // Disable Ask to save logins and passwords for websites
user_pref("signon.autofillForms", false);     // Disable "Autofill logins and passwords"
user_pref("extensions.formautofill.available", "off");
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);



EOF
cat user-overrides.js >> user.js
echo "user-overrides.js merged into user.js" && sleep 2
echo "...Now Downloading Addons..."
installtmp="$(mktemp -d)"
# trap will run when there is an exit command, or this script is terminated
trap "rm -fr $installtmp" HUP INT QUIT TERM PWR EXIT
AMOurl="https://addons.mozilla.org"
# IFS (Internal Field Separator) will use both newline character and comma as separators when iterating over elements in the addons to install list. This allows flexibility in how the addons to install are presented to the end user.
IFS=$'\n,'
mkdir -p "$profilePath/extensions/"
for addon in $Addons_Installed_HERE; do
	echo "Installing $addon"
	# The following command, grep will match anything that is not a double quote ("). When encountering a double quote, it will act as a terminating character for the grep operation. 
	packageURL="$(curl --silent "$AMOurl/en-US/firefox/addon/${addon}/" | grep -o "$AMOurl/firefox/downloads/file/[^\"]*")"
	# You can directly manipulate a string without assigning it to a variable, you can use command substitution:
	# echo "Filename: $(basename 'https://example.com/downloads/file.zip')"
	# Or this script uses parameter expansion to removes everything up to and including the last slash:
	file="${packageURL##*/}"
	curl -LOs "$packageURL" >"$installtmp/$file"
	# Parameter expansion prevents needing external commands, like awk. But,  you can use command substitution instead of parameter expansion and use the following command:
	# unzip -p sidebery-5.2.0.xpi manifest.json | grep "\"id\"" | sed 's/"//' | awk -F '"' '{print $3}'
	id="$(unzip -p "$file" manifest.json | grep "\"id\"")"
        # This expansion removes the shortest match of \"* (a double quote followed by any character) from the end of the value stored in id. In this case, it effectively removes the double quote and everything after it from the filename.
	id="${id%\"*}"
        # The expansion below removes everything up to and including the last slash from the value stored in id, effectively extracting the filename.
	id="${id##*\"}"
	mv "$file" "$profilePath/extensions/$id.xpi"
done
echo "Addons Installed"
if [ -f $profilePath/sidebery/dark_sidebery_styles.css ]; then
    echo -e "\n==============================================================\n==                If using AdNauseam                       ==\n==      trackingprotection must be disabled manually       ==\n==  This is due to the \"Strict\" browser privacy.  To fix:  ==\n==  Open the browser to  -  about:config  -  and set your  ==\n==    privacy.trackingprotection.enabled    to    false    ==\n==============================================================\n==   Also you need to paste in the styling for Sidebery.   ==\n==   Open Sidebery settings, Styles editor. And paste in   ==\n==   any of the new styles. You may find one located at:   ==\n$profilePath/sidebery/dark_sidebery_styles.css\n==============================================================" && sleep 2
fi
