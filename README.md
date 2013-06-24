MrWallpapers source
==========

Please be aware that the script were written using ubuntu, I can't guarentee they work on all linux/unix system.

This is pretty simple though. I did the hard part! Wallpapers need to be 3966x2560 this ensures all wallpapers look and act the same.

Once you have the wallpaper:

     https://github.com/lithid/MrWallpapers.git
     cd wrwallpapers/
    ./add-wallpaper.sh ~/Pictures/6.jpg "Savoca" "Dark Beach" mrwallpapers.json

That is it, it will eventually ask you for a description of the wallpaper but the rest is handled by the scripts. Once you add the wallpaper just make a pull request and the json file and images will be uploaded and added to the phone by refreshing simple as cake.

Here is some sample output:

    ./convert-walls.sh ~/Pictures/6.jpg "Savoca" "Dark Beach" mrwallpapers.json
    Made directory wallpapers/savoca/darkbeach
    Working on wallpapers/savoca/darkbeach/darkbeach-2160x1920.jpg
    Working on wallpapers/savoca/darkbeach/darkbeach-1440x1280.jpg
    Working on wallpapers/savoca/darkbeach/darkbeach-960x800.jpg
    Working on wallpapers/savoca/darkbeach/darkbeach-200x200.jpg
    Completed  convert
    Executing json building now...
    Enter description: Dark beach with dark purple and blue skyline

    Complete! Validating json now: mrwallpapers_20130624_111512.json

    JSON data is valid, merged content successfully.

Have an issue? Please submit a issue. I will fix it!
