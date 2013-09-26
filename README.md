## tmpbrowser

Creates a temporary throwaway browser session in OS X. 

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

## Running

### 1. Pick a Browser

First step is to select a supported browser

![Step 1](http://i.imgur.com/Xq6eirw.png)

### 2. Enable Plugins?

Select if you wish plugins and extensions to be loaded (no supported in
Opera)

![Step 2](http://i.imgur.com/rT51Plb.png)

### 3. Presto!

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

