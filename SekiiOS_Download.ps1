# File: SekiiOS_Download.ps1
# Beschreibung: Lädt automatisch die ReactOS Stable 64-bit ISO herunter und startet optional QEMU
# Projektname: Sekii OS

# === Einstellungen ===
$isoUrl = "https://sourceforge.net/projects/reactos/files/ReactOS%20Stable/0.4.15/ReactOS-0.4.15-Stable-x64.iso/download"
$savePath = "$env:USERPROFILE\Downloads\SekiiOS-0.4.15-x64.iso"
$qemuPath = "C:\Program Files\qemu\qemu-system-x86_64.exe"  # Pfad zu QEMU, falls installiert

# === Download ===
Write-Host "Downloading Sekii OS (ReactOS Stable 64-bit ISO)..."
Invoke-WebRequest -Uri $isoUrl -OutFile $savePath -UseBasicParsing
Write-Host "Downloaded ISO to $savePath"

# === Optional: QEMU starten ===
if (Test-Path $qemuPath) {
    Write-Host "QEMU found. Starting Sekii OS in QEMU..."
    & $qemuPath -m 2048 -cdrom $savePath -boot d
} else {
    Write-Host "QEMU not found at $qemuPath. You can manually start the ISO in your VM software."
}
