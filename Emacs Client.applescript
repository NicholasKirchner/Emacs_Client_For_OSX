set emacs_path to "/Applications/Emacs.app/Contents/MacOS/"
set emacs_client_path to emacs_path & "bin/"

on open theDropped
	set emacs_path to "/Applications/Emacs.app/Contents/MacOS/"
	set emacs_client_path to emacs_path & "bin/"
	
	repeat with oneDrop in theDropped
		set DropPath to quoted form of POSIX path of oneDrop
		try
			-- we look for <= 2 because Emacs --daemon seems to always have an entry in visibile-frame-list even if there isn't
			set frameVisible to do shell script emacs_client_path & "emacsclient -e '(<= 2 (length (visible-frame-list)))'"
			if frameVisible is "t" then
				do shell script emacs_client_path & "emacsclient -n " & DropPath
			else
				-- there is a not a visible frame, launch one
				do shell script emacs_client_path & "emacsclient -c -n " & DropPath
			end if
		on error
			-- daemon is not running, start the daemon and open a frame		
			do shell script emacs_path & "Emacs --daemon"
			do shell script emacs_client_path & "emacsclient -c -n " & DropPath
		end try
	end repeat
	tell application "Emacs" to activate
end open

try
	-- we look for <= 2 because Emacs --daemon seems to always have an entry in visibile-frame-list even if there isn't
	set frameVisible to do shell script emacs_client_path & "emacsclient -e '(<= 2 (length (visible-frame-list)))'"
	if frameVisible is not "t" then
		-- there is a not a visible frame, launch one
		do shell script emacs_client_path & "emacsclient -c -n"
	end if
on error
	-- daemon is not running, start the daemon and open a frame		
	do shell script emacs_path & "Emacs --daemon"
	do shell script emacs_client_path & "emacsclient -c -n"
end try

-- bring the visible frame to the front
tell application "Emacs" to activate