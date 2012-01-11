# What is this?

This is the setup that I have created to make a daemon-client system
to work with OS X.

Emacs Client.app will start the daemon if it's not running, will spawn
a frame if there isn't an active one, and will bring the emacs frames
to the front if any exist.  In short, have Emacs (sort of) emulate normal OS X App conventions.

Further, Emacs Client.app can be used as a droplet.  Dragging a file
onto the icon or selecting Emacs Client.app from the "Open With" menu
will open the file and put it in an active frame if there is one.

The basic building block was from Brian McCallister, and can be found
[here](http://skife.org/emacs/mac/osx/2011/03/17/emacs-client-mac.html).

# Installation Notes

This has only been tested on OS X Lion using
[Emacs For Mac OS X](http://emacsformacosx.com/).  In particular, the
location of Emacs is hard-coded as
/Applications/Emacs.app/Contents/MacOS/Emacs, and the location of
emacsclient is hard-coded as /Applications/Emacs.app/Contents/MacOS/bin/emacsclient.

The apps are written in AppleScript, so the hard-coded path is easy
enough to change by opening Emacs Client.app in the Apple Script
Editor.

# To Do List

* Configure Emacs Client.app so that right-clicking a file gives Emacs
Client as a default option

* Configure Emacs.app so that it won't appear in the Dock, but still
offers a menu bar.
