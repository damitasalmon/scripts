#!/usr/bin/env bash

# version 3.0
#
# DESCRIPTION
# This script configures users docks using docktutil
# source dockutil https://github.com/kcrawford/dockutil/
# 
# REQUIREMENTS
# dockutil Version 3.0.0 or higher installed to /usr/local/bin/
# Compatible with macOS 11.x and higher
#
#DATE
#2022-04-08


export PATH=/usr/bin:/bin:/usr/sbin:/sbin

LOGFILE=~/Library/Logs/imre_outset.log
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`
currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )

echo `date` " Log - Setting up Default Dock for $currentUser - Whipping my matcha..." >> $LOGFILE

# COLLECT IMPORTANT USER INFORMATION
# Get the currently logged in user


# Get uid logged in user
uid=$(id -u "${currentUser}")

# Current User home folder - do it this way in case the folder isn't in /Users
userHome=$(dscl . -read /users/${currentUser} NFSHomeDirectory | cut -d " " -f 2)

# Path to plist
plist="${userHome}/Library/Preferences/com.apple.dock.plist"

# Check if dockutil is installed
if [[ -x "/usr/local/bin/dockutil" ]]; then
    dockutil="/usr/local/bin/dockutil"
else
    echo "dockutil not installed in /usr/local/bin, exiting"
    exit 1
fi

# Version dockutil
dockutilVersion=$(${dockutil} --version)
echo "Dockutil version = ${dockutilVersion}"

# Create a clean Dock
${dockutil} --remove all --no-restart ${plist}
echo "clean-out the Dock"

# Full path to Applications to add to the Dock
apps=(
"/Applications/Google Chrome.app"
"/Applications/zoom.us.app"
"/Applications/Slack.app"
"/Applications/Microsoft Outlook.app"
"/Applications/Microsoft Word.app"
"/Applications/Microsoft Excel.app"
"/System/Applications/System Preferences.app"
)

# Loop through Apps and check if App is installed, If Installed at App to the Dock.
for app in "${apps[@]}"; 
do
	if [[ -e ${app} ]]; then
		${dockutil} --add "$app" --no-restart ${plist};
	else
		echo "${app} not installed"
    fi
done

# Add logged in users Downloads folder to the Dock
${dockutil} --add ${userHome}/Downloads --view list --display stack --sort dateadded --no-restart ${plist}

# Kill dock to use new settings
killall -KILL Dock
echo "Restarted the Dock"

#If all goes well and we're in happy dock land
echo "$TIMESTAMP Finished creating default Dock for $currentUser" >> $LOGFILE 2>&1

exit 0
