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
$env:PATH = "" + $old_path;