        TopGrid v2.20 for Delphi 7 installation notes

This version of the TopGrid is intended for use with Delphi 7. The following files are installed:

Directory		Contents
===================================================
[Installdir]\Lib	The TopGrid component files
[Installdir]\Help	The help files
[Installdir]\Examples	The example program files
[Installdir]\Source	The source code files

[Installdir] is the installation directory chosen during setup.

1. AUTOMATIC INSTALLATION

On first installation, the installation program will automatically install the TopGrid components on the Delphi Component Palette if you choose to do so. The following package, which registers the TopGrid components in Delphi, will be installed:

OSGDCLD7.BPL 	Installs the TopGrid components
OSGDRP7.BPL	Installs the TosGridReport component

The components will be installed on a seperate tab in the Component palette labeled 'TopGrid'. If a version of the TopGrid is already installed, it will not be replaced by the new version on the Delphi Component Palette. Either remove the previous version from the Delphi Component Palette before installing the new version, or replace the old version manually. See below for manual installation instructions.

2. MANUAL INSTALLATION

If you do not select automatic installation of the components, or if a version of the TopGrid is already installed on the Delphi Component Palette, the TopGrid components will need to be installed manually in the Delphi IDE before they can be used. To install TopGrid components, install the following package from the [Installdir]\Lib directory using the Component|Install Packages menu selection on the Delphi menu:

OSGDCLD7.BPL 	Installs the TopGrid components
OSGDRP7.BPL	Installs the TosGridReport component

If you already have an older version of the TopGrid installed, first remove the old packages from Delphi before installing the new ones. Also make sure the library path no longer points to the old location. It is recommended that you restart Delphi after replacing the old version to ensure that Delphi uses the new one. See the TopGrid Online Help for more information.

3. RUNTIME PACKAGES

The TSGDCLD5 package is a design time only package used for registering the TopGrid components. The components themselves however are located in the two runtime packages osg7220.DPL and osdg7220.DPL. These packages are runtime only packages, and will be installed in the windows system directory. These runtime packages include the following components:

OSG7220.BPL	TtsGrid, TtsMaskDefs, TtsDateTimeDef, 
		TtsImageList
OSDG7220.BPL	TtsDBGrid

The TopGrid runtime package names have changed with regard to previous TopGrid versions. The version number is included in the filename (the 20), as well as the Delphi version (the 7). This is to ensure compatibilty with applications built with older runtime package files or with different Delphi and C++Builder versions.

If you have created packages which require these TopGrid packages, you will need to update the required files section of your packages to include the new package names.

To use the TopGrid packages as runtime packages, make sure they are located on the Windows search path on the machines where your application needs to run. During setup, the setup program will install the runtime packages in your own Windows system directory for you.

4. ONLINE HELP INSTALLATION

The setup program creates an icon for the TopGrid Online Help in the Windows NT Program Manager or on the Windows 95/98 Start up menu.

If you choose so during installation, the installation program will automatically integrate the online help with Delphi's help system, under the topic 'TopGrid Component Guide'.

You can start start the online help either from the program manager, by double clicking on the 'TopGrid.hlp' file in the [Installdir]\Help directory, or from the Delphi Help.

For manual integration of the TopGrid online help in the Delphi help system, see the online help under the topic 'Installing the help files'.
