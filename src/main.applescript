# tmpbrowser
#
# http://github.com/nikcub/tmpbrowser
#
# MIT License - see LICENSE file.
# Copyright © 2013 Nik Cubrilovic

#
# supportedBrowsers array format is {browser_nice_name, brower_type, browser_cmd_path}
# browserFlags list format is {browser_nice_name, cmd_flags, cmd_no_plugins_flags, user_data_flag}
#

set supportedBrowsers to {Â
	{"Google Chrome", "chrome", "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"}, Â
	{"Google Chrome Canary", "chrome", "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"}, Â
	{"Firefox", "ff", "/Applications/Firefox.app/Contents/MacOS/firefox"} Â
		}

set browserFlags to {Â
	{"chrome", "--enable-strict-site-isolation --site-per-process --no-default-browser-check --no-first-run --disable-default-apps", "--disable-plugins", "--user-data-dir="}, Â
	{"ff", "-url about:home -silent -no-remote", "-safe-mode", "-profile "} Â
		}

# other variables used throughout script
set foundBrowsers to {}
set foundBrowsersDialogList to {}
set foundBrowserDefault to {}
set firstRun to 0
set foundFlags to 0
set shell_pipe to "> /dev/null 2>&1 &"

# Iterate supported browsers and find those that exist on this system
# make a copy of the first browser we find to set it as the default selected
repeat with i from 1 to length of supportedBrowsers
	set currentBrowserItem to item i of supportedBrowsers
	set currentBrowserCl to item 3 of currentBrowserItem
	if FileExists(currentBrowserCl) then
		if firstRun is 0 then
			copy item 1 of currentBrowserItem to foundBrowserDefault
			set firstRun to 1
		end if
		copy currentBrowserItem to end of foundBrowsers
		copy item 1 of currentBrowserItem to end of foundBrowsersDialogList
	end if
end repeat

if length of foundBrowsers is 0 then
	Exception("No supported browsers found")
end if

# Prompt user to select a browser
choose from list foundBrowsersDialogList default items foundBrowserDefault with title "Select a browser:"
if the result is not false then
	set selectedBrowserNiceName to item 1 of the result
else
	Exception("Bad browser selection")
end if

# now we have to iterate through again since the result of the dialog is a nice_name not an index
# find the nicename and extract path, flags
repeat with i from 1 to length of foundBrowsers
	set currentBrowserItem to item i of foundBrowsers
	if item 1 of currentBrowserItem is selectedBrowserNiceName then
		set selectedBrowserType to item 2 of currentBrowserItem
		set selectedBrowserCmd to quoted form of item 3 of currentBrowserItem
	end if
end repeat

# prompt if we should load plugins or not
set userLoadPlugins to display dialog "Load browser plugins?" buttons {"Yes", "No"} default button "Yes"

# find the flags
repeat with i from 1 to length of browserFlags
	set currentItem to item i of browserFlags
	if item 1 of currentItem is selectedBrowserType then
		set foundFlags to 1
		set selectedBrowserFlags to item 2 of currentItem
		set selectedBrowserFlagsPlugins to item 3 of currentItem
		set selectedBrowserDatadir to item 4 of currentItem
		exit repeat
	end if
end repeat

if foundFlags is 0 then
	Exception("Could not set browser flags")
end if

# Get a temporary directory for the profile
try
	# set tmpDir to do shell script "mktemp -d -t tmpbrowser XXXXX"
	# set tmpDir to path to temporary items as text
	# set tmpDir to POSIX path of tmpDir
	set tmpDir to do shell script "mktemp -d /tmp/tmpbrowser.XXXXXXX"
	set dataDirCmd to selectedBrowserDatadir & "\"" & tmpDir & "\""
on error errMsg number errorNumber
	Exception("Problem creating temporary directory")
end try

# Build the command string
set cmd_string to "" & selectedBrowserCmd & " " & selectedBrowserFlags
if userLoadPlugins is "No" then
	set cmd_string to cmd_string & " " & selectedBrowserFlagsPlugins
end if
set cmd_string to cmd_string & " " & dataDirCmd & " " & shell_pipe

# Run
try
	#display dialog cmd_string
	do shell script cmd_string
on error errMsg number errorNumber
	Exception("Exec Error:" & (errorNumber as text) & errMsg as text)
end try

# Functions -------------

on Exception(msg)
	# display alert "Error" message msg as critical
	display dialog "Error: " & msg buttons {"OK"} with icon caution
	error number -128
	return
end Exception

on FileExists(theFile) -- (String) as Boolean
	tell application "System Events"
		if exists file theFile then
			return true
		else
			return false
		end if
	end tell
end FileExists
