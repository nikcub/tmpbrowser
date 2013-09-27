## tmpbrowser

 ![Temporary Chrome](http://i.imgur.com/8v4rOSV.png) 
 **Demonstration with temporary Chrome session** 

Creates a temporary throwaway browser session in OS X. Like incognito mode but stores and accepts all cookies so all websites will work, is anonymous and will destory all the sessions and cookies automatically when you exit. 

Use if you want to separate your cookies for your real logged in accounts from websites you access. Provides privacy from tracking cookies, ad networks, single signon, oAuth and OpenID logins, etc.

Click the application icon to create as many sessions as you like.

Supports Chrome, Chromium, Firefox and Opera.

## Benefits

 * Run a separate set of cookies for enhanced privacy.
 * User profile is destroyed so no saved history or passwords, etc.
 * Works like incognito mode except you get all the benefits of browser
   session
 * Ability to disable plugins and extensions on a per-execution basis

## Install

 1. [Download the latest
    version](https://github.com/nikcub/tmpbrowser/blob/master/dist/tmpbrowser.dmg?raw=true)
 1. Mount the installer by double clicking on the file you downloaded
 1. When the image opens, drag the `tmpbrowser` application icon into the Applications folder
![Install](http://i.imgur.com/AF0h8lU.png)
 1. (Optional) Drag the application icon from `Applications` to your Dock

## Running

### 1. Run the application

From your install the applicaiton icon is either in your Dock or in the Applications folder
 1. Run from your Dock or from the Applications folder (shortcut c`ommand + option + a`)
 ![Run](http://i.imgur.com/BPoyOEh.png)

### 2. Pick a Browser

First step is to select a supported browser

![Step 1](http://i.imgur.com/Xq6eirw.png)

### 3. Enable Plugins?

Select if you wish plugins and extensions to be loaded (no supported in
Opera)

![Step 2](http://i.imgur.com/rT51Plb.png)

### 4. Presto!

You now have a new running temporary browser process and a session that
will be automatically detroyed. 

![Step 3](http://i.imgur.com/scBndLH.png)

Click the `tmpbrowser` icon as many times as you like to create as many
browser session as you want.

## How it works

It works by creating a temporary folder on your drive and storing a temporary profile there. It starts up the browser using the command line and tells it to use the temporary folder location for the profile.

## Todo

 * Support Safari and Webkit by finding a way to set a custom profile
   path
 * Disable nag box on setting browser as default for Firefox and Opera
 * Give the project an icon
 * Create a similar Windows version


## Changelog

### v0.0.3 - 27th September 2013

 * Disk image based install for easy drag+drop
 * Updates to README with screenshots of install and run

 ### v0.0.2 - 12th September 2013

 * Auto detect installed browsers

