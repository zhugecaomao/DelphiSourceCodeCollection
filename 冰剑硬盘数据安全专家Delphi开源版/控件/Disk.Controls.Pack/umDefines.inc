{*********************************************************}
{*                     umDefines.INC                     *}
{*      Assorted conditional compilation directives      *}
{*      Copyright (c) UtilMind Solutions 1998-2002       *}
{*                 All rights reserved.                  *}
{*********************************************************}

{$IFNDEF VER80}          {Delphi 1}
 {$IFNDEF VER90}         {Delphi 2}
  {$IFNDEF VER93}        {BCB 1}
   {$DEFINE D3}          {* Delphi 3 or higher}
   {$IFNDEF VER100}      {Delphi 3}
    {$IFNDEF VER110}     {BCB 3}
     {$DEFINE D4}        {* Delphi 4 or higher}
     {$IFNDEF VER120}    {Delphi 4}
      {$IFNDEF VER125}   {BCB 4}
       {$DEFINE D5}      {* Delphi 5 or higher}
       {$IFNDEF VER130}  {Delphi/BCB 5}
        {$ObjExportAll On}
        {$DEFINE D6}     {* Delphi 6 or higher}
        {$IFNDEF VER140} {Delphi/BCB 6}
         {$DEFINE D7}
         {$IFNDEF VER150} {Delphi/BCB 7}
           { * delphi 8? * }
         {$ENDIF}
        {$ENDIF}
       {$ENDIF}
      {$ENDIF}
     {$ENDIF}
    {$ENDIF}
   {$ENDIF}
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

{$IFNDEF D3} // For Delphi 2 & BCB 1 only
  {$DEFINE NO_COM_CLEANUP}
{$ENDIF}

{DEFINE APPCONTROLS}
{$DEFINE FORCEDHELPEDITOR}
{$DEFINE USEINIFILES}
{$DEFINE AUTOUPGRADERPROXY}
{$WARNINGS OFF}
{$R-}

{DEFINE TRIAL}
