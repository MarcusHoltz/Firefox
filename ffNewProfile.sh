#!/bin/sh
clear
echo -n "Please describe this Firefox Profile with a name: " && read ffProfileName
Addons_Installed_HERE="adnauseam,
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
// 2811: set/enforce what items to clear on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", true);                         // [WARNING: false will allow everything in browser to stay upon shutdown]
user_pref("privacy.clearOnShutdown.cache", false);                              // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.downloads", true);                           // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.formdata", true);                            // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.history", false);                            // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.sessions", false);                           // [DEFAULT: true]

// Go easy on fingerprinting
user_pref("privacy.resistFingerprinting", false);                               // Disable RFP to use localtimezone and Canvas API
user_pref("privacy.resistFingerprinting.letterboxing", false);                  // Disable letterboxing, basically if you disable above - disable this
user_pref("webgl.disabled", false);                                             // Enable WebGL (Web Graphics Library) for Canvas API

// Go easy on tracking protection
// (Only use if you're also using adnauseam. Adnauseam needs access before any ad blocking, to click the ads.)
// You can find out more about these at: https://mozilla.github.io/policy-templates/
user_pref("privacy.trackingprotection.enabled", false);                         // If this policy is not configured, tracking protection is not enabled by default in the browser, but it is enabled by default in private browsing.
user_pref("privacy.trackingprotection.pbmode.enabled", false);                  // tracking protection in Private Browsing mode on websites are ALLOWED
user_pref("privacy.trackingprotection.cryptomining.enabled", false);            // cryptomining scripts on websites are ALLOWED
user_pref("privacy.trackingprotection.fingerprinting.enabled", false);          // fingerprinting scripts on websites are ALLOWED

// PREF: enable container tabs
user_pref("privacy.userContext.enabled", true);

// Customization
user_pref("browser.startup.page", 3);                                           // 0=blank, 1=home, 2=last visited page, 3=resume previous session
user_pref("browser.display.use_system_colors", false);                          // Do not use default dark mode or light mode
user_pref("extensions.pocket.enabled", false);                                  // Disable Pocket
user_pref("browser.tabs.firefox-view", false);                                  // Disable Firefox View
user_pref("general.autoScroll", true);                                          // Enable AutoScrolling
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);         // Enable userchrome.css
user_pref("signon.rememberSignons", false);                                     // Disable saving passwords
user_pref("browser.urlbar.update2.engineAliasRefresh", true);                   // Add button to add custom search engines
user_pref("ui.systemUsesDarkTheme", 1);                                         // Dark Mode
user_pref("browser.startup.homepage", "https://www.github.com/marcusholtz");    // My favorite homepage
//user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
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
    echo -e "\n==========================================================\n== You will need to paste in the styling for Sidebery. ==\n== Open Sidebery settings, Styles editor. And paste in ==\n== any of the new styles. You may find them in:        ==\n$profilePath/sidebery/dark_sidebery_styles.css\n==========================================================" && sleep 2
fi
