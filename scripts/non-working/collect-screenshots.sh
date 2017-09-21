#!/bin/bash

# Prerequisites
# sudo apt-get install gstreamer0.10-fluendo-mp3 imagemagick xdotool
#
# Save this script in ~/.ubuntu-kylin-help (this is also where the screenshots will be kept)
# The hidden directory is so that they don't clutter the File Browser screenshot
#
# Open System Settings>Privacy. Delete all history
# Switch to the Files tab and add the .ubuntu-kylin-help directory to the don't record list.
#
# Make sure that /etc/default/apport has enabled=0 . This
# will turn off the automatic bug report window that will just get in the way of screenshots.
#
# Finally press Alt+F2 and run .ubuntu-kylin-help/collect-screenshots-without-mouse.sh

function error {
  echo -e $1
  exit 1
}

## prerequisites installed? Needs more work
#for pkg in gedit gstreamer0.10-fluendo-mp3 xdotool imagemagick ; do
#  if dpkg --get-selections | grep -q $pkg ; then error "Error: $pkg isn't installed. To install it, run: \n sudo apt-get install $pkg#"; fi
#done

lang=$(basename $LANG .UTF-8)
echo "lang: $lang"
dir=$HOME/.ubuntu-kylin-help/$lang/figures
downdir=$HOME/.downloads
echo "dir: $dir"
mkdir -p $dir
mkdir -p $downdir

long_pause="sleep 5"
mid_pause="sleep 3"
short_pause="sleep 1"

wget -c -O $downdir/EmblemDivide.pdf http://emblemdivide.files.wordpress.com/2009/12/chapter0.pdf
wget -c -O $downdir/standard-tube-map.pdf http://www.tfl.gov.uk/assets/downloads/standard-tube-map.pdf
wget -c -O $downdir/richard-stallman-young.jpg http://upload.wikimedia.org/wikipedia/commons/f/f7/Richard_Matthew_Stallman.jpeg
wget -c -O $downdir/Echoes\ In\ Time.mp3 http://people.ubuntu.com/~jbicha/Echoes%20In%20Time.mp3

# Set the screen resolution
xrandr -s 1024x768
$long_pause
xdotool mousemove 1024 350

# Change the time to match the version number
# This needs to be updated for different locales
gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "14:04 %p"
gsettings set org.gnome.Evince.Default show-sidebar false # This doesn't seem to work
gsettings set com.canonical.Unity form-factor "Netbook"

xdotool key Super
$mid_pause
xdotool key m a h
$short_pause
xdotool key Down Down Return
$mid_pause

xdotool key Super
$mid_pause
xdotool key t e x
$short_pause
xdotool key Down Down Return
$mid_pause

xdotool key Super
$mid_pause
xdotool key d o c
$short_pause
xdotool key Down Down Return
$mid_pause

xdotool key Super
$mid_pause
xdotool key i m a
$short_pause
xdotool key Down Down Right Return
$mid_pause

pkill mahjongg
evince $downdir/standard-tube-map.pdf &
$mid_pause
pkill evince
touch $downdir/index.html
gedit $downdir/index.html &
$mid_pause
pkill gedit
evince $downdir/EmblemDivide.pdf &
$mid_pause
pkill evince
eog $downdir/richard-stallman-young.jpg &
$mid_pause
pkill eog
$long_pause
xdotool click 1

nautilus &
$long_pause
xdotool getactivewindow windowsize 650 325
gnome-screenshot -w -f $dir/nautilus.png
$long_pause
convert $dir/nautilus.png -resize 250x125 $dir/nautilus.png
xdotool key Alt+F4

$short_pause
gnome-screenshot -f $dir/unity.png
$long_pause
convert $dir/unity.png -resize 250x188 $dir/unity2.png
$long_pause
if [ $dir == ".ubuntu-kylin-help/en-US/figures" ] # English only
  then
    convert $dir/unity.png -crop 65x180+0+25 +repage $dir/unity-launcher.png
    $mid_pause
    convert $dir/unity-launcher.png -crop 65x123+0+57 +repage $dir/unity-launcher-apps.png
fi

xdotool key Super
$short_pause
xdotool key BackSpace
$short_pause
gnome-screenshot -f $dir/unity-overview-original.png
convert $dir/unity-overview-original.png -crop 230x130+0+0 +repage $dir/unity-dash-sample.png
$short_pause
convert $dir/unity-overview-original.png -resize 75% $dir/unity-overview.png
rm $dir/unity-overview-original.png

xdotool key Ctrl+Tab
$mid_pause
gnome-screenshot -f $dir/unity-dash.png
convert $dir/unity-dash.png -crop 525x227+0+0 +repage $dir/unity-dash.png

xdotool key Escape
$long_pause

gsettings set com.canonical.Unity.Launcher favorites "['ubuntu-software-center.desktop',
 'ubuntuone-installer.desktop', 'gnome-control-center.desktop', 'evince.desktop', 'sol.desktop']"
$mid_pause
evince $downdir/standard-tube-map.pdf &
$long_pause
xdotool getactivewindow windowsize 600 500
xdotool getactivewindow windowmove 55 208
xdotool key Down Down Down Down
xdotool key Down Down Down Down Down
xdotool key Right Right Right Right Right Right Right
sol -v Klondike &
$mid_pause
xdotool getactivewindow windowmove 240 340
xdotool mousemove --sync 300 510
xdotool click 1
xdotool mousemove --sync 53 413
$short_pause
gnome-screenshot -p -d 3 -f $dir/unity-workspace-intro.png
$mid_pause
convert $dir/unity-workspace-intro.png -crop 375x300+0+202 +repage $dir/unity-workspace-intro.png
$short_pause
convert $dir/unity-workspace-intro.png -resize 250x200 $dir/unity-workspace-intro.png
pkill evince
pkill sol
gsettings set com.canonical.Unity.Launcher favorites "[]"
$mid_pause
gsettings reset com.canonical.Unity.Launcher favorites
$short_pause

xdotool key Ctrl+Alt+Down Ctrl+Alt+Right
software-center &
$long_pause
$long_pause
xdotool key Ctrl+Alt+Up
$mid_pause
evince $downdir/EmblemDivide.pdf &
$mid_pause
xdotool key Down Down Down Down Down Down
xdotool getactivewindow windowsize --sync 580 520
xdotool getactivewindow windowmove --sync 270 150
xdotool key Ctrl+Alt+Left
xdg-open "http://www.ubuntu.com"
$long_pause
$mid_pause
xdotool mousemove --sync 53 650
$short_pause
xdotool click 1
gnome-screenshot -p -d 3 -f $dir/unity-windows.png
convert $dir/unity-windows.png -resize 400x300 $dir/unity-windows.png
xdotool click 1
pkill software-center
pkill evince

xdotool key Ctrl+Super+Right
xdotool key Alt+F1
$short_pause
xdotool key Down
$short_pause
xdotool key Down
$short_pause
xdotool key Right
$short_pause
xdotool key Down
$short_pause
xdotool mousemove --sync 85 205
gnome-screenshot -p -f $dir/unity-launcher-intro.png
$mid_pause
convert $dir/unity-launcher-intro.png -crop 300x240+0+83 +repage $dir/unity-launcher-intro.png
$mid_pause
convert $dir/unity-launcher-intro.png -resize 250x200 $dir/unity-launcher-intro.png
xdotool key Escape
xdotool key Ctrl+Super+Up
xdotool key Ctrl+W

xdg-open $downdir/Echoes\ In\ Time.mp3
sleep 25
xdotool key Alt+F4
$short_pause
xdotool key Alt+F10
$short_pause
xdotool key Left
$short_pause
xdotool key Left
$short_pause
xdotool key Left
$short_pause
xdotool key Down
$short_pause
xdotool key Down
$short_pause
xdotool key Down
$short_pause
xdotool mousemove --sync 900 165
gnome-screenshot -p -f $dir/unity-appmenu-intro.png
pkill rhythmbox
convert $dir/unity-appmenu-intro.png -crop 375x300+650+0 +repage $dir/unity-appmenu-intro.png
convert $dir/unity-appmenu-intro.png -resize 250x200 $dir/unity-appmenu-intro.png

xdotool key Right
$short_pause
xdotool key Right
$short_pause
xdotool key Up
$short_pause
xdotool key Up
$short_pause
xdotool key Up
$short_pause
xdotool key Up
$short_pause
xdotool mousemove --sync 900 210
gnome-screenshot -p -f $dir/unity-exit.png
convert $dir/unity-exit.png -crop 375x300+650+0 +repage $dir/unity-exit.png
$short_pause
convert $dir/unity-exit.png -resize 250x200 $dir/unity-exit.png
xdotool key Escape


# Change things back to normal
gsettings reset com.canonical.indicator.datetime time-format
gsettings reset com.canonical.indicator.datetime custom-time-format
gsettings reset com.canonical.Unity form-factor

# This is supposed to set a laptop's screen resolution back to default
xrandr --output LVDS1 --auto
