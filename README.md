# Firefox
## 👋 Hi, this is a repo for my Firefox setup 🦊

* * *

### 🥧This script takes a recipe for Firefox, gathers the ingredients, combines, and bakes them.

#### 🌶 I just combine them to my preference. 😋

* * *

### 🗺 To give you a map of what happens when you run this script: 

```
Your Installed Firefox > Make a New Profile > Firefox UI Fix Install > VerticalFox Added > Betterfox Added > user-overrides.js created > Firefox Addons Installed > Sidebery styles reminder
```

* * *


![Firefox Profile Install Script](https://raw.githubusercontent.com/MarcusHoltz/marcusholtz.github.io/main/assets/img/posts/firefox_profile_install.gif)



* * * 

### Additional work required

> Please note: Additional work is required to finish setting up the entire profile beyond running this script.


#### Please see below for details.

Thank you for visiting.


* * *

## Extra Steps for Firefox profile

* * *


### uBlock Origin


[uBlock Origin](https://ublockorigin.com/) is an open-source, cross-platform browser extension for content filtering - primarily aimed at neutralizing privacy invasion in an efficient, user-friendly method.

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
> This means each Tab gets it's own resources.

The **real power** is when you use [Multi-Account-Containers](https://addons.mozilla.org/en-GB/firefox/addon/multi-account-containers) for websites you frequent and [Temporary Containers](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/) for everything else.


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

- All settings on this page should be set to: `"Different from Tab Domain & Subdomains"`

* * *

In the `Isolation` section, look for `Per Domain`:

- Always open in new Temporary Container: `Disabled`

- All other settings on this page should be set to `"Use Global"`


* * *

> For more information about [Multi-Account-Containers](https://addons.mozilla.org/en-GB/firefox/addon/multi-account-containers) and [Temporary Containers](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/) visit the [Firefox Container Guide](https://chefkochblog.wordpress.com/2018/04/03/firefox-container-guide/)




## Script to Install Vertical Tabs, Betterfox, and Addons

The script below will turn a vanilla Firefox profile into one that resembles a Floorp setup. 

> If you want the slow-motion self-bake version of this, check out [Sidetabs](https://addons.mozilla.org/en-US/firefox/addon/sidetabs/) by Jeb Nicholson.


* * * 

## Firefox New Profile Creation Script

You can find the [Firefox New Profile Creation Script](https://raw.githubusercontent.com/MarcusHoltz/Firefox/main/ffNewProfile.sh) in 👆 this repository. 👆


* * *

### Firefox Profile changes made and - modifications still needed

All `plugins` will be installed along with the `user.js` and `userChrome.css` changes.

> You will still need to configure `uBlock Origin` and all `Multi-Account` and `Temporary Containers`, as mentioned above.



