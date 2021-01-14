#########################################################
          ----------------------------------
                  Disk Controls pack

              for Delphi and C++ Builder
                     Version 3.8

                     SOURCE CODE
          ----------------------------------

           Legal: (c) 1999-2004 Utilmind Solutions
           Email: info@appcontrols.com
             Web: http://www.appcontrols.com
                  http://www.utilmind.com
#########################################################

TABLE OF CONTENTS

    1. Welcome
        1.1 Introduction
        1.2 Components Overview
        1.3 Compatiblity
        1.4 Further updates
    2. Installation
    3. Problems

1. Welcome
----------------------------------------------------
Disk Controls is set of 21+ top quality components which can make your
life much easier if you developing software that works with disks
(Hard/FloppyCD/RAM/Network), shell and file system.

1.1 Introduction
================
The package facilitate in work with files, folders and drives,
contains two advanced search engines, several components that provides
you detalied information about disks and file system, installs/uninstalls
the shell extensions, performs useful shell operations.

DiskControls pack contains:
 * Two advanced search engines, which will find any file or folder by
   specified criterias (DiskScanner and MultiDiskScanner components);
 * The FolderListView component which let's you to display filtered
   contents of any directory and looks and feels like Windows Explorer.
   Supports big number of features such like automatical sorting of the
   list items with arrow-style sort mark on the header section, individual
   context menus for every shell object, possibility to hide or show some
   list columns, automatic drag'n'drop support via OLE and so on...
 * The FolderMonitor, which will check your folders for any changes;
 * The VirtualDrives utility, which can define, redefine or delete the
   virtual drives from the file system;
 * Several components that provide you with detailed information about
   any shell objects (files, folders or drives), can retrieve the version
   information from executable files and dynamic-link libraries;
 * Component which can install or uninstall new file types into the shell
   (dcFileAssociation);
 * Component which performs the operations with files and folders on shell
   level (dcFileOperations);
 * Several advanced edit controls and dialogs for browsing and selecting
   the files and folders;
 * much more... see Components Overview for more details.


1.2 Components Overview
=======================
  1. dcDiskScanner - extremely easy to use and powerful threaded search
     engine that scans the drives and folders for files (specified by
     mask) and/or directories that matches to specified request criteria.
     To find files - just point the starting folder and wildcarded searching
     mask and DiskScanner will lignting-fast return the matches by specified
     criteria. You may also specify desired file attributes, size and time
     range. Besides file names it can return the file type, date and time
     of last modification, file icons (32x32 and 16x16).

  2. dcMultiDiskScanner - The dcMultiDiskScanner component is enhancement
     of the dcDiskScanner component. Used to search files in multiple
     locations with multiple searching masks. MultiDiskScanner operates with
     two lists - IncludeList and ExcludeList that describes desired and
     unwanted searching paths and file masks.
     For example, you would like to find all files in the "c:\windows\"
     directory, including all subfolders except "c:\windows\system". Just put
     the "c:\windows\*.*" path to the IncludeList, point that this path should
     include subfolders, and put "c:\windows\systems\*.*" to the ExcludeList.

  3. dcDiskInfo - provies detailed information about any disk (Hard, Floppy,
     CD, RAM or Network disks). Returns available disks, disk capacity and
     free space, file system information, serial number and shell icons
     (large and small) that designate specified disk.

  4. dcFileInfo - provides detailed information about any file - size, type,
     shell name, creation and last modification dates, small and large shell
     icons.

  5. dcFileCRC - calculates a CRC (Cyclic Redundency Check) for any files.
     Supports three methods of checking: CRC32 (most frequently used method,
     used in such programs like ZIP, RAR, ARJ etc), CRC16 (applicable to
     XModem protocol), CRCArc (used by SEA's "ARC" utility).

  6. dcVersionInfo - used to extract version information from a file.

  7. dcShellIcon - determinees the icons (32x32 and 16x16) for any specified
     shell object (file, folder or disk). It can return the real icon for
     shortcut files (without link overlays), or otherwise - put link mark
     to the shell icons  . May show the shell object both in opened and
     closed state (for example, opened and closed folder icons.

  8. dcShellLink - installs the shell links (creates the shortcut files)
     and provides detalied information about any existing shortcut file.

  9. dcShellProperties - shows the "Properties" dialog or context menu for
     any shell object (file, folder or disk).

 10. dcShellFileOperation - performs the wildcarded simple file operations
     and can copy, move, delete file(s) or folder(s) displaying shell dialog
     with according smooth animation and progress bar. For example, "Delete"
     operation moves deteled files to the "RecycleBin" instead of erasing
     them permanently.

 11. dcShellExtension - let you to install or uninstall Shell Extensions
     to the system registry. Shell Extensions enchances the shell by
     providing the file system and networks, or by giving the user easier
     access to tools that manipulate objects in file system. For example,
     acShellExtension can assign an icon to specified file
     (ie ".yourdatafile") and specify the executable file for this file
     extension.
     dcShellExtension also provides detailed information about others file
     extensions that already installed to the user's system. You can
     determinate the icons, executable file and argument string for any
     file extensions (ie ".pas", ".wav", ".doc", ".gif", ".html").

 12. dcOpenDialog - enhancement of standard TOpenDialog. dcOpenDialog can
     remember last used folder in the system registry.

 13. dcSaveDialog - enhancement of standard TSaveDialog. dcSaveDialog can
     remember last used folder in the system registry.

 14. dcBrowseDialog - makes an "Browse For Folders" dialog box available
     to your application. The purpose of the dialog box is to let a user
     select local or netrwork folders. Use the Execute method to display
     this dialog box.

 15. dcIcon2Bitmap - utility component that will help you to convert icons
     (TIcon) to bitmaps (TBitmap). Very useful if you would like to store
     bitmaps instead of icons (returned by components of DiskControls
     pack), in the TImageList collection.


1.3 Compatibility
=================
DiskControls compatible with Delphi 3/4/5/6 and BCB 3/4/5 and has been
tested on Win95, Win95OSR2, Win98, NT4, Win2K and WinME. Upgrade to Delphi 6
coming soon.


1.4 Further updates
===================
Actually the DiskControls pack contains 21 components. However, we contantly
updating the package and adding more useful utilities and new great features
to existing components. If you have any suggestions to help us to improve
the DiskControls - please contact us (info@appcontrols.com) and never
hesitate to do this for any question.


2. Installation
----------------------------------------------------

 1. Create "..\Lib\DiskControls" directory.
 2. Unzip files and copy them to "..\Lib\DiskControls".
 3. Start Delphi / C++ Builder IDE.
 4. Open "_DCReg.pas" file.
 5. Install package to the components palette ("Install" button).


3. Problems
----------------------------------------------------
If you have any problems during the setup or using this
component, please visit the support area of our website
at http://www.appcontrols.com or contact us: info@appcontrols.com

    
Good Luck!

Aleksey Kuznetsov,
Founder, UtilMind Solutions
aleksey@utilmind.com
http://www.utilmind.com
http://www.appcontrols.com
