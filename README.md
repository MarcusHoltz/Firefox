# Firefox
## 👋 Hi, this is a repo for my Firefox setup 🦊

* * *

### 🧁 This script takes a recipie for Firefox, gathers the ingredients, combines, and bakes them. 🥧

#### 🌶 I just combine them to my preference. 😋

* * *

### 🗺 To give you a map of what happens when you run this script: 

```
Your Installed Firefox > Make a New Profile > Firefox UI Fix Install > VerticalFox Added > Betterfox Added > user-overrides.js created > Firefox Addons Installed > Sidebery styles reminder
```


* * * 

### Additional work required

> Please note: Additional work is required to finish setting up the entire profile beyond running this script.


#### Please see below for details.

Thank you for visiting.


* * *

## Extra Steps for Firefox profile

* * *


### uBlock Origin


[uBlock Origin](https://ublockorigin.com/) is an open-source, cross-platform browser extension for content filtering ï¿½ primarily aimed at neutralizing privacy invasion in an efficient, user-friendly method.

> uBlock Origin requires lists to operate.


* * *

### uBlock Origin lists

There are different types of filter lists that people use across the internet.

The lists I use are specific for Ublock Origin.


#### uBlock Origin with Betterfox's Recommended Filter lists

There is **no better guide** than [`yokoffing`'s `Betterfox` wiki for filterlists](https://github.com/yokoffing/filterlists).


* * *

##### Yokoffing's Guidelines

1) Prevent overblocking by applying the law of [diminishing returns](https://web.archive.org/web/20230719033252/https://pmctraining.com/site/wp-content/uploads/2018/04/Law-of-Diminishing-Returns-CHART.png) (always blocking more ? better blocking experience).

2) Aim for [efficiency](https://brave.com/the-mounting-cost-of-stale-ad-blocking-rules/) without sacrificing quality (use sane, quality resources).

3) Implement the [minimum](https://reddit.com/r/uBlockOrigin/wiki/index#wiki_which_filter_lists_should_i_select.3F) number of useful lists (avoid redundancy and bloat when possible).

> [Subscribe uBlock Origin to Yokoffing's lists](https://github.com/yokoffing/filterlists?tab=readme-ov-file#privacy) (use the 'subscribe' link for each list) 


* * * 

### Sidebery

I use the Sidebery addon as my primary means of tabbed browsing. Sidebery brings with it some extra features that need some customization. 


#### Using Sidebery to tab-sync and maintain active tabs and tab history across multiple devices



* * * 

##### Using Sidebery tabs as bookmarks

* * * 

Sidebery can go from `tabs --> bookmarks --> tabs`.

> You can use your [bookmark sync](https://floccus.org/) to sync Sidebery tabs between devices as well.



* * * 

##### Setting up Sidebery Snapshots

* * * 

Sidebery also lets you save your current tabs to disk in JSON and MD format, at a specific time interval or with manual creation. 

> These files can then be synced between devices for a self-hosted cloud history/tab sync between devices.


* * *

### Sidebery addon setup 

You can find out more about how to use Sidebery and a more complete tutorial at: 

- [Holtzweb's Firefox Browser Setup with Sidebery](https://blog.holtzweb.com/posts/browsers-firefox-floorp-sidebery-setup/)




* * *

## Multi-Account-Containers addon

What are Containers and how can they help?

> Containers are a tab/process isolation mechanism in order to separate each new tab/window from each other.
> This means each Tab gets itï¿½s own resources.

The **real power** is when you use [`Multi-Account-Containers`](https://addons.mozilla.org/en-GB/firefox/addon/multi-account-containers) for websites you frequent and [`Temporary Containers`](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/) for everything else.


* * * 

## Temporary Containers addon

**Unlimited Containers** are now at our disposal with [Temporary Containers](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/).



### Settings for Temporary Containers

To make the Temporary Containers addon more useful, try and change the defaults to the following:


* * *

In the `General` section:

- Automatic Mode: `On`

- Notifications when Temporary Containers are deleted: `Off`

- Container Number: `Reuse available numbers`

- Delete no longer needed Temporary Containers: `After the last tab in it closes`


* * *

Under the `Isolation` tab, find `Global`:

- All settings on this page should be set to: `ï¿½Different from Tab Domain & Subdomainsï¿½`

* * *

In the `Isolation` section, look for `Per Domain`:

- Always open in new Temporary Container: `Disabled`

- All other settings on this page should be set to `ï¿½Use Globalï¿½`


* * *

> For more information about [`Multi-Account-Containers`](https://addons.mozilla.org/en-GB/firefox/addon/multi-account-containers) and [`Temporary Containers`](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/) visit the [Firefox Container Guide](https://chefkochblog.wordpress.com/2018/04/03/firefox-container-guide/)




## Script to Install Vertical Tabs, Betterfox, and Addons

The script below will turn a vanilla Firefox profile into one that resembles a Floorp setup.

All `plugins` will be installed along with the `user.js` and `userChrome.css` changes.

> You will still need to configure `uBlock Origin` and all `Multi-Account` and `Temporary Containers`, as mentioned above.



* * * 

## New Firefox Profile Creation Script

```
#!/bin/sh
clear;
echo -n "Please describe this Firefox Profile with a name: " && read ffProfileName
Addons_Installed_HERE="adnauseam,
bitwarden-password-manager,
switchyomega,
darkreader,
sidebery,
floccus,
nighttab,
multi-account-containers,
temporary-containers,
facebook-container,
containers-helper,
fastforwardteam,
redirector,
clearurls,
istilldontcareaboutcookies,
onetab,
downthemall,
external-application,
canvasblocker,
checkmarks-web-ext,
audioctx-fingerprint-defender,
webext-private-bookmarks,
refined-h264ify,
requestcontrol,
ttsfox,
ecosia-the-green-search,
ddg-lite-search-provider"

echo "Creating Profile"
firefox -CreateProfile $ffProfileName
# sed will search for `Path=` it will then try and find the line with the name of the firefox profile specified above. Then remove all text to the left of the `=` sign.
folder=$(sed -n "/Path=.*.$ffProfileName$/ s/.*=//p" ~/.mozilla/firefox/profiles.ini)
# sed -n 's/Path=//p' ~/.mozilla/firefox/profiles.ini | grep $ffProfileName
profilePath="/home/$(whoami)/.mozilla/firefox/$folder"
cd $profilePath
echo "Profile Creation Finished"

mkdir chrome sidebery 2> /dev/null

echo "Install Theme and Select New Profile -- My favorite style is 1) Original"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/black7375/Firefox-UI-Fix/master/install.sh)"

cd $profilePath

curl -sS https://raw.githubusercontent.com/christorange/VerticalFox/main/windows/userChrome.css >> ./chrome/userChrome.css
curl -sS https://raw.githubusercontent.com/christorange/VerticalFox/main/sidebery/dark_sidebery_styles.css > ./sidebery/dark_sidebery_styles.css
clear;
echo -e "\nYou will need to paste in the styling for Sidebery.\nThe styles are located at $profilePath/sidebery\n" && sleep 2
echo -e "\nA reminder will be displayed again at the end of the script." && sleep 5;

curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js >> user.js && clear;
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Securefox.js >> user.js && clear;
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Fastfox.js >> user.js && clear;
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Peskyfox.js >> user.js && clear;
curl -sS https://raw.githubusercontent.com/yokoffing/Betterfox/main/Smoothfox.js >> user.js && clear;

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
echo "user-overrides.js merged into user.js" && sleep 2;

echo "...Now Downloading Addons..."
installtmp="$(mktemp -d)"
# trap will run when there is an exit command, or this script is terminated
trap "rm -fr $installtmp" HUP INT QUIT TERM PWR EXIT
AMOurl="https://addons.mozilla.org"
IFS=$'\n,'
mkdir -p "$profilePath/extensions/"
for addon in $Addons_Installed_HERE; do
	echo "Installing $addon"
	# grep will match anything that is not a double quote ("). When encountering a double quote, it will act as a terminating character for the grep operation. 
	packageURL="$(curl --silent "$AMOurl/en-US/firefox/addon/${addon}/" | grep -o "$AMOurl/firefox/downloads/file/[^\"]*")"
	# You can directly manipulate a string without assigning it to a variable, you can use command substitution:
	# echo "Filename: $(basename 'https://example.com/downloads/file.zip')"
	# Or this script uses parameter expansion:
	file="${packageURL##*/}"
	curl -LOs "$packageURL" >"$installtmp/$file"
	# You can use command substitution instead of parameter expansion and use the following command:
	# unzip -p sidebery-5.2.0.xpi manifest.json | grep "\"id\"" | sed 's/"//' | awk -F '"' '{print $3}'
	id="$(unzip -p "$file" manifest.json | grep "\"id\"")"
	id="${id%\"*}"
	id="${id##*\"}"
	mv "$file" "$profilePath/extensions/$id.xpi"
done
echo "Addons Installed"

if [ -f $profilePath/sidebery/dark_sidebery_styles.css ]; then
    echo -e "\n==========================================================\n== You will need to paste in the styling for Sidebery. ==\n== Open Sidebery settings, Styles editor. And paste in ==\n== any of the new styles. You may find them in:        ==\n$profilePath/sidebery/dark_sidebery_styles.css\n==========================================================" && slee
