set emacs_path to "/Applications/Emacs.app/Contents/MacOS/"
set emacs_client_path to emacs_path & "bin/"

try
	set IsRunning to do shell script emacs_client_path & "emacsclient -e '(= 1 1)'"
	if IsRunning is "t" then
		display alert "Emacs Daemon already running."
	end if
on error
	do shell script emacs_path & "Emacs --daemon"
end try