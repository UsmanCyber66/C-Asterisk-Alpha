
# Define repository details
$repoUrl = "https://github.com/TheJudge26/C-Asterisk-Alpha.git"
$destination = "C:\Program Files\CSTAR"

# Check for Administrator privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "This script must be run as an Administrator."
    exit
}

# Clone the repository
if (-not (Test-Path $destination)) {
    Write-Host "Cloning repository to $destination..."
    git clone $repoUrl $destination
} else {
    Write-Host "Destination already exists. Skipping clone."
}

# Add the folder to the System PATH environment variable
Write-Host "Adding $destination to PATH..."
$oldPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)

if ($oldPath -split ';' -notcontains $destination) {
    $newPath = "$oldPath;$destination"
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
    Write-Host "Successfully added to PATH. Please restart your terminal for changes to take effect."
} else {
    Write-Host "Folder is already in PATH."
