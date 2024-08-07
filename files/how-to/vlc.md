# vlc and blueary

install vlc  
install makemkv  
open makemkv up in the terminal as root `sudo /Applications/MakeMKV.app/Contents/MacOS/makemkv`  
In makemkv Go to Preferences > Integrations and check VLC .. this should get around the macos security bug. If you just run makemkv as your regular user it can't enable the integration for some reason, even if you allow makemkv to make app management changes in system settings.

Then you need to link libraries from makemkv into vlc

```bash
ln -s /Applications/MakeMKV.app/Contents/lib/libmmbd_new.dylib /Applications/VLC.app/Contents/MacOS/lib/libaacs.dylib
ln -s /Applications/MakeMKV.app/Contents/lib/libmmbd_new.dylib /Applications/VLC.app/Contents/MacOS/lib/libbdplus.dylib
ln -s /Applications/MakeMKV.app/Contents/lib/libmmbd_new.dylib /Applications/VLC.app/Contents/MacOS/lib/libmmdb.dylib
```

Now when you use vlc it can play encrypted bluerays
