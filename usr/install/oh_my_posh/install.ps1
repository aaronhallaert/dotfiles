Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Set-Prompt
Add-Content $PROFILE "Import-Module posh-git"
Add-Content $PROFILE "Import-Module oh-my-posh"
Add-Content $PROFILE "Set-Theme Powerlevel10k-Lean"