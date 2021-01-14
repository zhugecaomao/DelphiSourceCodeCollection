[Setup]
AppName=Qemu Manager 5.0 / Qemu 0.9.0/0.9.1
AppVerName=Qemu Manager 5.0
AppPublisher=David T Reynolds
AppPublisherURL=http://www.davereyn.co.uk
AppSupportURL=http://www.davereyn.co.uk
AppUpdatesURL=http://www.davereyn.co.uk
Compression=lzma/ultra
OutputBaseFilename=setupqemuk50
SolidCompression=yes
InfoBeforeFile=D:\qm5\docs\lictype.txt
DefaultDirName={pf}\QemuManager
DefaultGroupName=Qemu Manager 5.0
DirExistsWarning=no

[Dirs]
Name:"{app}\media"
Name:"{app}\images"
Name:"{app}\resource"
Name:"{app}\qemu"
Name:"{app}\qemu\090\keymaps"
Name:"{app}\qemu\091\keymaps"
Name:"{app}\qemu\kqemu"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\qm5\Master\Licenses\*"; DestDir: "{app}\licenses"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\qm5\Master\qemu\*"; DestDir: "{app}\qemu"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\qm5\Master\resource\*"; DestDir: "{app}\resource"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\qm5\Master\updater.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\gplv2.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\opsys.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\process.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\qemu-img.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\QemuManager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\qemumanager.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\Qemumandll.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\qemuvers.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\qman.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\qmclient.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\QMFTServ.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\qmports.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\qm5\Master\updater.exe"; DestDir: "{app}"; Flags: ignoreversion


[Icons]
Name: "{group}\Qemu Manager"; Filename: "{app}\QemuManager.exe"
Name: "{group}\Qemu User Documentation"; Filename: "{app}\qemu\091\qemu-doc.html"
Name: "{group}\Qemu Technical Documentation"; Filename: "{app}\qemu\091\qemu-tech.html"
Name: "{group}\GNU GPL License Version 2"; Filename: "{app}\gplv2.txt"
Name: "{group}\Qemu Manager Uninstall"; Filename: "{uninstallexe}"

Name: "{userdesktop}\Qemu Manager"; Filename: "{app}\QemuManager.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\QemuManager.exe"; Description: "{cm:LaunchProgram,Qemu Manager}"; Flags: nowait postinstall skipifsilent


