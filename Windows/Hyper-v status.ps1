# Check if Hyper-V feature is enabled
$hyperVEnabled = Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online | Select-Object -ExpandProperty State

if ($hyperVEnabled -eq "Enabled") {
    Write-Host "Hyper-V feature is enabled on this machine."
} else {
    Write-Host "Hyper-V feature is not enabled on this machine."
}
