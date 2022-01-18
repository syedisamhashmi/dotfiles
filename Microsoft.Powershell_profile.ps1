#? Wherever projects are stored.
#? Big fan of the pharmacy, you know... CVS *ba dum tss*
$PROJECT_ROOT = "C:\vs"; 

#? To run scripts as needed.
#? I typically just copy paste,
#? but might make an alias at some point...
#? (after all, I am taking the time to copy paste all this anyways)
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

#? I have a hotkey to run powershell from system32, 
#? so this just sets me to my home directory
if ((Get-Location).tostring() -eq 'C:\WINDOWS\system32')
{
	cd $PROJECT_ROOT;
}

#? I prefer VS code insiders, so this just overrides code to point there.
Set-Alias -Name code -Value code-insiders.cmd

#? Useful pattern for prepending things into the path,
#? as it is uses the first item found in the search.
$OLD_PATH = $env:PATH;
#? For local user install
#$env:PATH = "~\AppData\local\Microsoft\dotnet;";
#? For access to bins in npm
#$env:PATH += "~\AppData\Roaming\npm;";
#$env:PATH += $OLD_PATH;


# Helper function to kill all chrome and re-run it with debug port enabled.
#? Where Chrome is installed
$CHROME_LOCATION = ""      
function kill-chrome-re-run-with-debug {
	foreach($id in (ps | Where ProcessName -eq chrome | Select Id))
	{
		Stop-Process -Id $id.Id
	}
	Start-Process $CHROME_LOCATION --remote-debugging-port=9222
}