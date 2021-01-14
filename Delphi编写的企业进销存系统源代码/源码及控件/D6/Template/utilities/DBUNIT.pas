unit DBUnit;

{*************************************************************************

  DBUNIT.PAS -- Delphi Database Maintenance API for Paradox and DBASE
                tables. See the accompanying demonstration application
                and help file for instructions and examples of use.

                NOTICE: This source code is NOT freeware. It must be
                registered with Logic Process Corporation before it
                can be used in your applications. Registered users
                have the right to deliver this API (in object code
                format) with their applications royalty-free. However,
                this source code may NOT be delivered without first
                securing a separate license for each system on which
                the source code is to be installed.

                Copyright (c) 1995 - 2000 by Logic Process Corporation,
                Dallas, Texas USA. Protected by international law.
                All rights reserved.

 IMPORTANT: This API carries no warranties, either expressed or implied.
            Use of this API and the underlying Borland International
            Database Engine and TUTILITY.DLL (TUTIL32.DLL) table maintenance
            libraries are at your own risk. Logic Process Corporation
            assumes no responsibility for any loss of information resulting
            from the use of this API or the Borland products aforementioned.

 CHANGE HISTORY:

   Version 1.18.200 (23 December 1999)
     -- Made minor modification to "DBStructGetField" to make field type
        validation case-insensitive.
     -- Made minor modification to "DBRestructureTableFromTableExtended" and
        "DBCreateTableFromStructure" routines to force the database operation
        result value back to DBIERR_NONE from DBIERR_NOTINDEXED (which was also
        considered a successful result). This change was necessary to avoid
        a potential misinterpretation of the database result value later in
        the routines.
   Version 1.18 (16 September 1999)
     -- Made minor conditional compilation modification to "GetDLLVersion"
        routine to accommodate a Windows API function prototype change in
        Delphi 5.
  Version 1.17c (8 May 1999)
     -- Qualified modifications made in Version 1.17b with "$IFDEF WIN32"
        conditional compiler directives to overcome an object pascal limitation
        in Delphi 1.0.
   Version 1.17b (27 March 1999)
     -- Modified the "DBRestructureTable" and "DBStructSyncTables" functions
        to eliminate several memory leaks during table structure comparison
        and sync operations.
   Version 1.17a (11 January 1999)
     -- Modified the "DBCompareTables" function to be more intelligent in
        determining what steps (add/copy/drop) are required to get from one
        table structure to the comparison table structure.
   Version 1.17 (29 July 1998)
     -- Moded "GetDLLVersion" function to conditionally define "VerQuerySize"
        variable type as Cardinal for Delphi 4 only.
     -- Fixed bug in "DBCheckAutoIncTranslationAllowed" function where a loop
        variable was being used improperly (nested).
   Version 1.16 (16 June 1998)
     -- Moded "DBGetBDEVersion" function to use a read-only call to the registry
        HKEY_LOCAL_MACHINE. Defined new "TReadOnlyRegistry" class as a subclass
        of the Delphi "TRegistry" class and added a new read-only key open
        function ("OpenKeyReadOnly") that is now called in "DBGetBDEVersion".
        This corrects a problem in Windows NT when the user is not granted
        write access to this registry key.
     -- Added "VerboseDBResponse" global variable to provide control over the
        use of message dialogs in relevant API functions/procedures. The variable
        defaults to True in order to remain consistent with previous versions of
        this API. Functions affected by this variable include "DBCheckAlias",
        "DBConfigureTableStructure", "DBCreateTableFromStructure",
        "DBRestructureTable", "DBDeleteNetFile", and "PublishBDEResult".
   Version 1.15a (10 June 1998)
     -- NEW -- Added "DBRestructureTableFromTableExtended" function that provides
        more complete coverage of restructuring operations from a clone table.
        Careful staged use of this function will allow rebuilding of most tables
        protected by RI rules, for example.
     -- Moded "DBRestructureTableFromTable" function to eliminate duplicate
        allocation of field storage 'FDesc'. Output pointer 'pFldDes' was never
        functional ... now just set to 'nil'. Caller should not use 'pFldDes'
        upon return. Left as a param to avoid syntax problems.
   Version 1.15 (12 January 1998)
     -- NEW -- Added "DBProtectTable" function which sets or clears the master
        password for a specified table. See the SCAPI.HLP for a complete syntax
        description.
     -- Revised "DBCheckIndexes" to remove an unnecessary call to 'DbiOpenTable'.
     -- Cleaned up "DBRebuildTable" to consistently return BDE error string in
        caller-provided 'strError' var error string.
   Version 1.14b (7 December 1997)
     -- Corrected problem in "DBRestructureTable", "DBRestructureTableFromTable",
        and "DBCreateTableFromStructure" routines where calls to 'DbiGetIndexDescs'
        returning DBIERR_NOTINDEXED (i.e., tables were not indexed) was being
        viewed as an error. This condition is now caught and treated as a normal
        condition.
   Version 1.14a (19 November 1997)
     -- NEW ROUTINE -- Added the "DBRestructureTableFromTable" routine which allows
        an existing (or 'target') table to be restructured to bring it in sync
        with a second (or 'base') table. This routine is an extension of the
        "DBRestructureTable" routine which uses a structure definition file
        as the 'base' table definition. This new routine allows the developer
        to accomplish the same task using a 'base' table instead of the structure
        file. See the API help file for complete details. NOTE: This function
        does not currently support table security or referential integrity
        features.
     -- Fixed an issue in the "DBCompareTables" routine in which the 'BaseTable'
        component was not being updated prior to use. Added field and index
        'Update' statements at the start of the routine to make sure the routine
        is working with the latest image of the base table structure.
     -- Rewrite a section of the "DBRestructureTable" routine to more properly
        delete all target table indices before the restructure takes place. Prior
        API versions would assume that deleting the first index (i.e., assumption
        that this was the primary index) would also force deletion of all secondary
        indices. New version more gracefully deletes all secondary indices and
        finally deletes the primary index last.
   Version 1.14 (11 November 1997)
     -- Finalized interim changes since 1.13 release.
     -- Added the 'VerifyOptions' parameter to the "DBCheckTable" routine to
        provide the caller with control over the verification process. The most
        common use is to control whether verification errors overwrite or are
        appended to the specified error table. See the SCAPI.HLP file for a
        complete syntax description. *** IMPORTANT *** This is a change to the
        calling syntax of the "DBCheckTable" function. Update your applications
        which call this function to include the new input parameter. To be
        consistent with previous API versions, simply set this input to zero
        when calling the "DBCheckTable" routine.
     -- Simplified "DBGetTutilityVersion" function to use the Windows path search
        mechanism to locate the TUTILITY.DLL (or TUTIL32.DLL) in use. This change
        eliminates the requirement that this DLL reside in the SYSTEM directory.
        It can now reside in the application directory if desired. This change
        also corrects a problem which would occur in calls to DBRebuildTable on
        16-bit apps if TUTILITY.DLL was not located in the SYSTEM directory. The
        call to "DBGetTutilityVersion" found in DBRebuildTable would return all
        zeros, which would result in the rebuild routine using the wrong call to
        "TURebuildTable". The resulting error message would be 'file or directory
        does not exist.'
     -- Forced the conversion of the 'szUserName' string to Pascal format in the
        "DBBDEUsersList" routine before assigning it to the string list. The
        previous version resulted in an error when using this string value in
        16-bit apps only.
     -- Forced conversion of table type string to Pascal before comparison in
        "DBTableIsProtected" function. In 16-bit apps, this null-terminated string
        to Pascal string comparison always failed. The result was that this routine
        always thought that tables were unprotected in 16-bit apps only.
   Version 1.13b (22 October 1997) *** interim release ***
     -- Fixed a bug in the "DBCloneTableStructure" routine which could result in
        the attempted disposal of an allocated memory structure using an invalid
        size value. On 32-bit systems, the invalid operation usually did not
        immediately result in an error. On 16-bit systems, the invalid operation
        often resulted in a GPF. The problem only occured on calls to this routine
        with the 'Mode' input set to 'cmDropSecondary'.
   Version 1.13a (22 September 1997) *** interim release ***
     -- Reworked 'DBRebuildTable' to correct an invalid pointer exception which
        occurred when there were problems retrieving the table security information
        in 32-bit mode (using the special workaround code in this routine). If the
        workaround retrieval was not successful, the routine would subsequently
        attempt to free memory that had already been freed. Also changed BDE error
        handling slightly to properly return the error code/string.
     -- Special Note: The current version of 'DBRebuildTable' uses a special
        workaround to retrieve table security information. It seems that the TUTILITY
        table description retrieval call returns an invalid image of this security
        information. This workaround uses BDE calls which require that the clone
        table NOT be write protected. If you are trying to use write-protected
        clone tables, send mail to "support@logicprocess.com" to request a code
        sample which illustrates how to temporarily set the clone table family files
        to write-enabled during the repair process.
   Version 1.13 (16 September 1997)
     -- Eliminated "MessageDlg" calls in DBPackTable. If protection copy cannot
        be made, sets 'LastDBError' to DBIERR_WRITEERR, 'LastDBErrorString' with
        an appropriate error information string, and returns False. Moved original
        table restore attempt (occurs after a failed pack operation) outside the
        database operations block. If the restore attempt fails, leaves the
        protection copy in the BDE Session Private directory.
     -- Changes to 'DBGetTableAssociatedFiles' routine to be specific about which
        file extensions are valid table family members. Would previously pick up
        all files with the same root name.
     -- Made changes to callback structure (TUTIL.PAS) and routines (BDEUTIL.PAS)
        to correctly handle callbacks. Also required a new parameter to the
        callback register and unregister functions. Previous callback routines
        could cause unexpected table rebuild failures in 16-bit applications.
        Often these failures were silent with symptoms including fewer than
        expected records in the repaired table. Also added example code in the
        BDEUTIL callback routines which illustrate how to access callback
        information in your own application.
     -- Added a section to the SCAPI.HLP file which describes how to use the
        SelfCheck API in your own applications.

   Version 1.12 (11 August 1997)
     -- Rewrote 'DBGetTableAssociatedFiles' routine to be more cautious when using
        the 'FindFirst/FindNext' method to locate family members. The find method
        was returning incorrect results on certain system configurations when a
        null table name was specified. Problem was first reported for aliases located
        on remote Novell 4.11 networked drive volumes. Symptoms were erroneous file
        removals.
     -- Fixed a quirky problem in 'DBCheckStructureFile' routine where the second
        'Reset(F);' was not repositioning the file pointer to the top. Added a manual
        close and reopen to fix. Only saw this on a single system, and was unable to
        determine the cause.
     -- added 'DBGetAliasPath' routine which returns the full path for a given alias.

   Version 1.11 (14 July 1997)
     -- Better use of "AddSlash" support routine to ensure that trailing slashes
        are present where needed. Replaced manual backslash check with "AddSlash"
        as needed. Routines affected (DBCheckAlias, DBCopyTable, DBCheckTable,
        DBRebuildTable, DBGetCursorPropsProtected, DBTableIsProtected).

   Version 1.10 -- Initial release.

**************************************************************************}

interface

uses DBTables, SysUtils, Forms, Classes, BDEUtil, DB, TUtil,
{$IFDEF WIN32}
BDE, Registry;
{$ELSE}
WinTypes, DbiProcs, DbiTypes, DbiErrs, IniFiles, Ver;
{$ENDIF}

const
  { self-imposed constants ... determined by memory constraints, etc. May be changed as needed }
  MAX_TABLES_IN_STRUCTURE_FILE = 256;               { max tables in alias / structure file }
  MAX_REF_INT_DESCRIPTORS = 20;                     { max referential integrity descriptors per table }

type
  TTableIndices = record
    IndexName            : String;                  { Index Name }
    IndexFields          : String;                  { List of fields in index }
    IndexOptions         : String;                  { Index options, primary, descending etc }
  end;

type
  TStructureRec = record
    AliasName            : String;                  { Alias Name }
    AliasPath            : String;                  { Alias Path }
    { Limit MAX tables in structure file (add 3 for '.DB') }
    Tables               : array[0..(MAX_TABLES_IN_STRUCTURE_FILE - 1)] of String[DBIMAXNAMELEN + 3];
  end;

type
  { holds special table creation info }
  TDBTableSpecialInfo = record
    AutoIncFieldIndex    : Integer;                 { autoinc field index (0 = none) }
  end;

type
  { File Version Info Structure -- convert to string as "MSDW_MSW.MSDW_LSW.LSDW_MSW.LSDW_LSW" }
  TFileVersionRecord = Record
    MSDW_MSW             : Word;                    { high word of upper double-word }
    MSDW_LSW             : Word;                    { low word of upper double-word }
    LSDW_MSW             : Word;                    { high word of lower double-word }
    LSDW_LSW             : Word;                    { low word of lower double-word }
  end;

type
  TCloneMode = (cmNoChange, cmDropAllIndices, cmDropSecondary, cmChangeAutoIncToInt, cmChangeIntToAutoInc);
  TDBExtendedRestructureOption = (eroClearValidityChecks, eroClearReferentialIntegrity, eroClearSecurity,
                                  eroFields, eroIndices, eroValidityChecks, eroReferentialIntegrity,
                                  eroSecurity);
  TDBExtendedRestructureOptions = set of TDBExtendedRestructureOption;

  { Database Functions }
  function DBAddAlias(Alias, Path, DefaultDriver: String): Boolean;
  function DBBDEUsersList(var UserList: TStringList): Boolean;
  function DBCheckAlias(Alias, DefaultDriver: String; var Path: String): Boolean;
  function DBDeleteAlias(strAlias: String): Boolean;
  function DBGetAliasPath(strAlias: String): String;
  function DBOpenLockList(strDataBase, strTableName: String; var LockList: TStringList): Boolean;

  { Table Manipulation Functions }
  function DBCloneTableStructure(strDatabase, strTableName, strCloneDir, strCloneTableName, strPassword: String;
                                         Mode: TCloneMode; var AutoIncField: Integer): Boolean;
  function DBCompareTables(CheckTable, BaseTable: TTable; var FOpType: array of CROptype;
                                         var IOpType: array of CROptype; var pFldDes: pFldDesc): Boolean;
  function DBRestructureTableFromTable(strTargetDataBase, strTargetTableName,
                                         strBaseDatabase, strBaseTableName: String;
                                         FOptype: array of CROptype; IOptype: array of CROptype;
                                         var pFldDes: pFldDesc): Boolean;
  function DBRestructureTableFromTableExtended(strTargetDataBase, strTargetTableName,
                                         strBaseDatabase, strBaseTableName, strPassword: String;
                                         ExtendedOptions: TDBExtendedRestructureOptions): Boolean;
  function DBCopyTable(strDataBase, strTableName, strDestDir, strDestName: String): Boolean;
  function DBCopyTableFileIO(strDataBase, strTableName, strDestDir, strDestName: String): Boolean;
  function DBDeleteTableFileIO(strDataBase, strTableName: String): Boolean;
  function DBPackTable(strDataBase, strTableName, strPassword: String; TableType: DBINAME; Protect: Boolean): Boolean;

  { Table Check & Repair Functions }
  function DBCheckIndexes(strDataBase, strTableName: String; var IndexList: TStringList) : Boolean;
  function DBCheckTable(strDataBase, strTableName, strErrorTable, strPassword: String;
                                         var strResult: String; VerifyOptions: Integer) : Boolean;
  function DBRebuildIndexes(strDataBase, strTableName: string;  var strError: string): Boolean;
  function DBRebuildTable(strDataBase, strTableName, strCloneTable, strErrorTable, strBackupTable,
                                         strKeyViolTable, strProblemTable, strPassword: String;
                                         var strResult: String) : Boolean;

  { Structure File Functions }
  function DBCheckStructureFile(strFileName: String; var ResultsList: TStringList;
                                         var Srec: TStructureRec): Boolean;
  function DBConfigureTableStructure(strDataBase, strTableName, strStructureFile: string;
                                         var Tbl: TTable; var SpecialInfo: TDBTableSpecialInfo): Boolean;
  function DBCreateTableFromStructure(strDataBase, strTableName, strStructureFile: String): Boolean;
  function DBStructGetAlias(S: String; var strAlias, strPath: String): Boolean;
  function DBStructGetField(S: String; var strFieldName, strFieldType, strRequired: String;
                                         var FieldSize: Integer; var SubType: Word): Boolean;
  function DBStructGetIndex(S: String; var strIndexName, strIndexFields, strOptions: String): Boolean;
  function DBStructGetTableName(S: String; var strTableName, strDesc: String): Boolean;
  function DBRestructureTable(strDataBase, strTableName, strStructureFile: String;
                                         FOptype: array of CROptype; IOptype: array of CROptype;
                                         var pFldDes: pFldDesc): Boolean;
  function DBStructProcessTable(var TablePacket: TStringList; var strResult: String; TableIndex: LongInt;
                                         var SRec: TStructureRec): Boolean;
  function DBStructSyncTables(strDataBase, strStructureFile: String; Verbose :Boolean): Boolean;

  { Support Functions }
  function DBAnsiToNative(const NameStr: string; NativeBuf: PChar; MaxLength: Integer): PChar;
  function DBCheckAutoIncTranslationAllowed(strDataBase, strTableName, strPassword: String): Boolean;
  procedure DBCreateTable(var WorkTable: TTable; SpecialInfo: TDBTableSpecialInfo);
  function DBDecodeValCheck(FieldType: TFieldType; FieldSize: Integer; HasFlag: WordBool;
                                         Value: DBIVCHK): String;
  function DBDeleteNetFile: Boolean;
  function DBGetBDEVersion(var VersionInfo: TFileVersionRecord): Boolean;
  function DBGetCursorProps(strDataBase, strTableName: String; var CurProp: CURProps): LongInt;
  function DBGetCursorPropsProtected(strDataBase, strTableName: String; var CurProp: CURProps): Boolean;
  function DBGetRefInt(strDataBase, strTableName: String; SeqNo: Word; var RIntDesc: RIntDesc): Boolean;
  function DBGetTableAssociatedFiles(strDataBase, strTableName: String; var FileList: TStringList): Boolean;
  function DBGetTableType(TableName: String): DBINAME;
  function DBGetTutilityVersion(var VersionInfo: TFileVersionRecord): Boolean;
  function DBGetValCheck(strDataBase, strTableName: String; SeqNo: Word; var VchkDes: VCHKDesc): Boolean;
  function DBSetAutoIncField(strDataBase, strTableName, strPassword: String; FieldIndex: Integer): Boolean;
  function DBTableIsProtected(strDataBase, strTableName: String; var NeedsPassword: Boolean): Boolean;
  function DBProtectTable(strDataBase, strTableName, strPassword: String): Boolean;

const
{$IFDEF WIN32}
  DB_DATA_TYPE_COUNT = 22;
{$ELSE}
  DB_DATA_TYPE_COUNT = 17;
{$ENDIF}
  strDataTypeLong: array[0..(DB_DATA_TYPE_COUNT - 1)] of String =
                                        ('ftUnknown - Unknown or undetermined',
                                         'ftString - Character or string field',
                                         'ftSmallInt - 16-bit integer field',
                                         'ftInteger - 32-bit integer field',
                                         'ftWord - 16-bit unsigned integer field',
                                         'ftBoolean - Boolean field',
                                         'ftFloat - Floating-point numeric field',
                                         'ftCurrency - Money field',
                                         'ftBCD - Binary-Coded Decimal field',
                                         'ftDate - Date field',
                                         'ftTime - Time field',
                                         'ftDateTime - Date and time field',
                                         'ftBytes - Fixed number of bytes (binary storage)',
                                         'ftVarBytes - Variable number of bytes (binary storage)',
{$IFDEF WIN32}
                                         'ftAutoInc - Auto-incrementing 32-bit integer counter field',
                                         'ftBlob - Binary Large OBject field',
                                         'ftMemo - Text memo field',
                                         'ftGraphic - Bitmap field',
                                         'ftFmtMemo - Formatted text memo field',
                                         'ftParadoxOle - Paradox OLE field',
                                         'ftDBaseOle - dBASE OLE field',
                                         'ftTypedBinary - Typed binary field');
{$ELSE}
                                         'ftBlob - Binary Large OBject field',
                                         'ftMemo - Text memo field',
                                         'ftGraphic - Bitmap field');
{$ENDIF}

  strDataType: array[0..(DB_DATA_TYPE_COUNT - 1)] of string =
                                        ('ftUnknown',
                                         'ftString',
                                         'ftSmallInt',
                                         'ftInteger',
                                         'ftWord',
                                         'ftBoolean',
                                         'ftFloat',
                                         'ftCurrency',
                                         'ftBCD',
                                         'ftDate',
                                         'ftTime',
                                         'ftDateTime',
                                         'ftBytes',
                                         'ftVarBytes',
{$IFDEF WIN32}
                                         'ftAutoInc',
                                         'ftBlob',
                                         'ftMemo',
                                         'ftGraphic',
                                         'ftFmtMemo',
                                         'ftParadoxOle',
                                         'ftDBaseOle',
                                         'ftTypedBinary');
{$ELSE}
                                         'ftBlob',
                                         'ftMemo',
                                         'ftGraphic');
{$ENDIF}

var
  ReRaiseDBExceptions: Boolean;           { Indicator: Pass DB Exceptions back to calling routine }
  LastDBError: DBIResult;                 { Last BDE Error code }
  LastDBErrorString: String;              { Last BDE Error string }
  VerboseDBResponse: Boolean;             { True if verbose responses desired }

implementation

uses WinProcs, Dialogs, Controls;

var
  FBDEUtil: TBDEUtil;


procedure PublishBDEResult(DBRslt: DBIResult); forward;
{$IFNDEF WIN32}
function DbiDeleteAlias(hCfg: hDBICfg; pszAliasName: PChar): DBIResult; far; external 'IDAPI01';
function CopyFile(const FileName, DestName: String): Boolean; forward;
{$ENDIF}
function GetDLLVersion(DLLNameStr: String; var VersionInfo: TFileVersionRecord): Boolean; forward;
procedure ClearStructureRec(var SRec: TStructureRec); forward;
function AddSlash(var Path: String): String; forward;
function RemoveFirstWord(var S : String; Delimiter: Char): String; forward;
function KillExt(TableName: PChar): PChar; forward;
function NeedsExt(TableName: PChar): PChar; forward;


{$IFDEF WIN32}
type
  { subclass defining a read-only registry key open }
  TReadOnlyRegistry = class(TRegistry)
  public
    function OpenKeyReadOnly(const Key: string): Boolean;
  end;

{ TReadOnlyRegistry }
function TReadOnlyRegistry.OpenKeyReadOnly(const Key: string): Boolean;
var
  TempKey: HKey;
  S: string;
  //Disposition: Integer;
  Relative: Boolean;
begin
  S := Key;
  Relative := not ((S <> '') and (S[1] = '\'));
  if not Relative then
    Delete(S, 1, 1);
  TempKey := 0;
  Result := RegOpenKeyEx(GetBaseKey(Relative), PChar(S), 0,
                         KEY_READ, TempKey) = ERROR_SUCCESS;
  if Result then
  begin
    if (CurrentKey <> 0) and Relative then
      S := CurrentPath + '\' + S;
    ChangeKey(TempKey, S);
  end;
end;
{$ENDIF}


(*
*******************************************************************************
  Database Functions
*******************************************************************************
*)

{$IFDEF WIN32} { 16 and 32-bit alias maintenance routines are different ... could use
                 16-bit version for both, but the 32-bit Delphi calls provide more
                 error-checking, etc }
{ DBAddAlias --  add a new database alias (see help for complete description) }
function DBAddAlias(Alias, Path, DefaultDriver: String): Boolean;
var
  OldMode : TConfigMode;
begin
  Result := True; { assume success for now }

  with Session do
  begin
    { Save original mode so that it can be restored later }
    OldMode := ConfigMode;
    ConfigMode := cmAll;
    try
      try
        AddStandardAlias(Alias, Path, DefaultDriver);
      except
        on E: EDataBaseError do
        begin
          Result := False;
          LastDBErrorString := E.Message;
          { Re Raise Exception so that it is passed back to the Calling function }
          if ReRaiseDBExceptions then
            raise;
        end;
      end;
    finally
      SaveConfigFile;
      ConfigMode := OldMode;
    end;
  end;
end;

{$ELSE} { 16-bit version of alias maintenance routines }

{ DBAddAlias --  add a new database alias (see help for complete description) }
function DBAddAlias(Alias, Path, DefaultDriver: String): Boolean;
var
  DBRslt      : DBIRESULT;
  AliasName   : DBINAME;
  DriverName  : DBIPATH;
  OptionStr   : Array[0..255] of Char;
begin
  try
    DBAnsiToNative(Alias, AliasName, (SizeOf(AliasName) - 1));
    DBAnsiToNative(DefaultDriver, DriverName, (SizeOf(DriverName) - 1));
    { build option buffer }
    StrPCopy(OptionStr, ('PATH: ' + Path));
    DBRslt := DbiAddAlias(nil, AliasName, DriverName, OptionStr, True);
    PublishBDEResult(DBRslt);
    Result := (DBRslt = DBIERR_NONE);
  except
    on E: EDataBaseError do
    begin
      Result := False;
      LastDBErrorString := E.Message;
      { Re Raise Exception so that it is passed back to the Calling function }
      if ReRaiseDBExceptions then
        raise;
    end;
  end;
end;
{$ENDIF}

{ DBBDEUsersList --  list users logged onto BDE (see help for complete description) }
function DBBDEUsersList(var UserList: TStringList): Boolean;
var
  InMemCursor : hdbicur;
  DbiRslt     : dbiResult;
  UsrDesc     : USERDesc;
begin
  Result := True; { assume sucess for now }

  DbiRslt := DbiOpenUserList(InMemCursor);
  PublishBDEResult(DbiRslt);
  if DbiRslt = DBIERR_NONE then
  begin
    try
      repeat
        DbiRslt:= DbiGetNextRecord(InMemCursor, dbiNOLOCK, @UsrDesc, nil);
        if (DbiRslt = DBIERR_NONE) then
        begin
          UserList.Add('User name: ' + StrPas(UsrDesc.szUserName));
          UserList.Add('Net Session: ' + IntToStr(UsrDesc.iNetSession));
          UserList.Add('Product Class: ' + IntToStr(UsrDesc.iProductClass));
          UserList.Add('');
        end;
      until (DbiRslt <> DBIERR_NONE);
      if (DbiRslt <> DBIERR_EOF) then
      begin
        PublishBDEResult(DbiRslt);
        Result := False;
      end;
    finally
      DbiCloseCursor(InMemCursor);
    end;
  end
  else
    Result := False;
end;

{ DBCheckAlias --  confirms validity of alias (see help for complete description) }
function DBCheckAlias(Alias, DefaultDriver: String; var Path: String): Boolean;
var
  AliasParams     : TStringList;
  i               : Integer;
  strExistingPath : String; { Existing path setting }
  UserOption      : Word;
begin
  { Init }
  Result := True; { assume success for now }
  strExistingPath := '';

  { append directory seperator onto end of path variable if needed}
  Path := AddSlash(Path);

  with Session do
  begin
    AliasParams := TStringList.Create;
    try
      { Get Existing Alias Information }
      try
        GetAliasParams(Alias ,AliasParams);

        { Check Current Alias PATH parameter }
        for i := 0 to AliasParams.Count -1 do
        begin
          if Copy(AliasParams[i], 0, 4) = 'PATH' then
          begin
            strExistingPath := Copy(AliasParams[i], 6, length(AliasParams[i]) -5);
            { Modify parameter, may be used if setting differes }
            AliasParams[i] := 'PATH=' + Path;
          end;
        end;

        { append directory seperator onto end of path variable if needed }
        strExistingPath := AddSlash(strExistingPath);

        { if the existing path setting and new path setting differ then ask for
          confirmation before modifying }
        if CompareText(strExistingPath, Path) <> 0 then
        begin
          if VerboseDBResponse then
            UserOption := MessageDlg('The path specified for the alias differs from the current '
                                     + 'alias configuration. (Existing Path: ' + strExistingPath
                                     + ' New Path: ' + Path + '). Do you wish to modify the existing '
                                     + 'configuration?', mtConfirmation, [mbYes, mbNo, mbCancel], 0)
          else
            UserOption := mrYes;  { assume 'Yes' response }
          case UserOption of
            mrYes: begin { modify existing alias }
{$IFDEF WIN32}
                     ModifyAlias(Alias, AliasParams);
                     Session.SaveConfigFile;
{$ELSE}
                     { must delete and re-add in 16-bit mode }
                     if (not DBDeleteAlias(Alias)) Or (not DBAddAlias(Alias, Path, DefaultDriver)) then
                       Result := False;
{$ENDIF}
                     if VerboseDBResponse then
                       MessageDlg('The Alias path has been altered.', mtINformation, [mbOK], 0);
                   end;
            mrNo: Path := strExistingPath;
            mrCancel: begin
                        Result := False;
                        Exit;
                      end;
          end; { case }
        end;

      except { Alias does not exist, ask user if it should be created. }
        if VerboseDBResponse then
          UserOption := MessageDlg('Alias: ' + Alias + ' does not exist. Do you wish to ' +
                                   'create a new alias?', mtConfirmation, [mbYes, mbNo], 0)
        else
          UserOption := mrYes;  { assume new alias desired }
        if (UserOption = mrYes) then
        begin
          try
            Result := DBAddAlias(Alias, Path, DefaultDriver);
          except
            on E: EDataBaseError do
            begin
              Result := False;
              LastDBErrorString := E.Message;
              { Re Raise Exception so that it is passed back to the Calling function }
              if ReRaiseDBExceptions then
                raise;
            end;
          end;

        end
        else { user does not wish to create new alias }
        begin
          Result := False;
          if VerboseDBResponse then
            MessageDlg('No alias created.', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;

    finally
      AliasParams.Free;
    end;
  end;
end;

{$IFDEF WIN32} { 16 and 32-bit alias maintenance routines are different ... could use
                 16-bit version for both, but the 32-bit Delphi calls provide more
                 error-checking, etc }
{ DBDeleteAlias --  delete alias and save the configuration (see help for complete description) }
function DBDeleteAlias(strAlias: String): Boolean;
begin
  result := True;

  with Session do
  begin
    try
      DeleteAlias(strAlias);
      SaveConfigFile;
    except
      on E: EDataBaseError do
      begin
        Result := False;
        LastDBErrorString := E.Message;
        { Re Raise Exception so that it is passed back to the Calling function }
        if ReRaiseDBExceptions then
         raise;
      end;
    end;
  end;
end;

{$ELSE} { 16-bit version of alias maintenance routines }

{ DBDeleteAlias --  delete alias and save the configuration (see help for complete description) }
function DBDeleteAlias(strAlias: String): Boolean;
var
  AliasName   : DBINAME;
  DBRslt      : DBIRESULT;
begin
  try
    DBAnsiToNative(strAlias, AliasName, (SizeOf(AliasName) - 1));
    DBRslt := DbiDeleteAlias(nil, AliasName);
    PublishBDEResult(DBRslt);
    Result := (DBRslt = DBIERR_NONE);
  except
    on E: EDataBaseError do
    begin
      Result := False;
      LastDBErrorString := E.Message;
      { Re Raise Exception so that it is passed back to the Calling function }
      if ReRaiseDBExceptions then
       raise;
    end;
  end;
end;
{$ENDIF}

{ DBGetAliasPath -- returns the full path for a given alias name }
function DBGetAliasPath(strAlias: String): String;
var
  AliasParamsList : TStringList;
  AliasPath       : String;
begin
  AliasParamsList := TStringList.Create;
  try
    try
      Session.GetAliasParams(strAlias, AliasParamsList);
      AliasPath := AliasParamsList.Values['PATH'];
      { append '\' if not present }
      if (AliasPath[Length(AliasPath)] <> '\') then
        AliasPath := AliasPath + '\';
      Result := AliasPath;
    except
      { will take exception to an invalid alias name ... return null string }
      Result := '';
    end;
  finally
    AliasParamsList.Free;
  end;
end;

{ DBOpenLockList --  returns details of the current locks placed on a table
  (see help for complete description) }
function DBOpenLockList(strDataBase, strTableName: String; var LockList: TStringList): Boolean;
var
  InMemCursor  : hdbicur;
  Lock         : LOCKDesc;
  DbiRslt      : dbiResult;
  hDb          : hDbiDb;
  TCur         : hDBICur;
  DBName       : DBIPATH;
  TableName    : DBITBLNAME;
begin
  { init }
  Result := False; { assume failure for now }

  { Open a NULL database handle }
  DbiRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenShared, nil, 0, nil, nil, hDb);
  PublishBDEResult(DbiRslt);
  if DbiRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DbiRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DbiRslt);
      if DbiRslt = DBIERR_NONE then
      begin
        { Get Table Cursor }
        DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
        DbiRslt := DbiOpenTable(hDb, TableName, nil, nil, nil, 0, dbiREADWRITE, dbiOPENSHARED,
                             xltFIELD, TRUE, nil, TCur);
        PublishBDEResult(DbiRslt);
        if DbiRslt = DBIERR_NONE then
        begin
          try
            DbiRslt := DbiOpenLockList(TCur, True, True, InMemCursor);
            PublishBDEResult(DbiRslt);
            if DbiRslt = DBIERR_NONE then
            begin
              try
                DbiRslt := DbiSetToBegin(InMemCursor);
                PublishBDEResult(DbiRslt);
                if DbiRslt = DBIERR_NONE then
                begin
                  Result := True;

                  LockList.Clear;
                  repeat
                    DbiRslt := DbiGetNextRecord(InMemCursor, dbiNOLOCK, @Lock, nil);
                    PublishBDEResult(DbiRslt);
                    if (DbiRslt <> DBIERR_EOF) then
                    begin
                      LockList.Add('Lock Type: ' + inttostr(Lock.iType));
                      LockList.Add('User Name: ' + StrPas(Lock.szUserName));

                      LockList.Add('Net Session: ' + inttostr(Lock.iNetSession));
                      LockList.Add('Session: ' + inttostr(Lock.iSession));
                      LockList.Add('Record Number: ' + inttostr(Lock.iRecNum));
                      LockList.Add('');
                    end;
                  until DbiRslt <> DBIERR_NONE;

                end;
              finally
                DbiCloseCursor(InMemCursor);
              end;
            end;
          finally
            DbiCloseCursor(TCur);
          end;
        end;
      end;
    finally
      DbiCloseDatabase(hDb);
    end;
  end;

end;


(*
*******************************************************************************
  Table Manipulation Functions
*******************************************************************************
*)

{ DBCloneTableStructure -- create a new table with the same structure as an existing
  table (see help for complete description) }
function DBCloneTableStructure(strDatabase, strTableName, strCloneDir, strCloneTableName, strPassword: String;
                               Mode: TCloneMode; var AutoIncField: Integer): Boolean;
var
  SrcTablePath         : DBITBLNAME;
  DestTablePath        : DBITBLNAME;
  SrcDBPath            : DBIPATH;
  DestDBPath           : DBIPATH;
  iFld, iIdx, iSec, iVal, iRI, iOptP, iOptD: Word;
  DbRslt               : DBIResult;
  TblDesc              : CRTBlDesc;
  hDb                  : hDbiDB;
  TmpCursor            : hdbicur;
  VCheck               : VCHKDesc;
  pVCheckDesc          : pVCHKDesc;
  TmpCount             : LongInt;
  tmpSecDesc           : SECDesc;
  ptmpSecDesc          : pSECDesc;
  pPassword            : PChar;
  NativeStr            : DBITBLNAME;
  i                    : Integer;
  pTestIdxDesc         : pIDXDesc;
  pPrimaryIdxDesc      : pIDXDesc;
  FoundPrimaryIndex    : Boolean;
  pTestFldDesc         : pFLDDesc;
begin
  Result := False;                          { assume failure for now }

  { Convert Password }
  if strPassword <> '' then
    pPassword := AnsiToNative(Session.Locale, strPassword, NativeStr, (SizeOf(DBITBLNAME) - 1))
  else
    pPassword := nil;

  DBAnsiToNative((AddSlash(strDataBase) + strTableName), SrcTablePath, (SizeOf(SrcTablePath) - 1));
  DBAnsiToNative((AddSlash(strCloneDir) + strCloneTableName), DestTablePath, (SizeOf(DestTablePath) - 1));

  FBDEUtil := TBDEUtil.Create;
  try
    DbRslt := TUExit(FBDEUtil.vHtSes);
    PublishBDEResult(DbRslt);
    if DbRslt = DBIERR_NONE then
    begin
      DbRslt := TUInit(FBDEUtil.vHtSes);
      PublishBDEResult(DbRslt);
      if DbRslt = DBIERR_NONE then
      begin
        DbRslt := TUGetCRTblDescCount(FBDEUtil.vhTSes, KillExt(SrcTablePath), iFld, iIdx, iSec,
                                    iVal, iRI, iOptP, iOptD);
        PublishBDEResult(DbRslt);
        if DbRslt = DBIERR_NONE then
        begin
          FillChar(TblDesc, SizeOf(CRTBlDesc), 0);

          TblDesc.iFldCount := iFld;
          GetMem(TblDesc.pFldDesc, (iFld * SizeOf(FldDesc)));

          TblDesc.iIdxCount := iIdx;
          GetMem(TblDesc.pIdxDesc, (iIdx * SizeOf(IdxDesc)));

          TblDesc.iSecRecCount := iSec;  { this comes back corrupted (WIN32 only) ... will refill later }
          GetMem(TblDesc.pSecDesc, (iSec * SizeOf(SecDesc)));

          TblDesc.iValChkCount := iVal;  { always seems to come back zero ... will fill later }
          GetMem(TblDesc.pVchkDesc, (iVal * SizeOf(VCHKDesc)));

          TblDesc.iRintCount := iRI;     { always seems to come back zero ... will fill later }
          GetMem(TblDesc.pRIntDesc, (iRI * SizeOf(RIntDesc)));

          TblDesc.iOptParams := iOptP;
          GetMem(TblDesc.pfldOptParams, (iOptP * sizeOf(FLDDesc)));

          GetMem(TblDesc.pOptData, (iOptD * DBIMAXSCFLDLEN));
          try
             { retrieve table description from source table }
             DbRslt := TUFillCRTblDesc(FBDEUtil.vhTSes, @TblDesc, KillExt(SrcTablePath), pPassword);
             PublishBDEResult(DbRslt);
             if DbRslt = DBIERR_NONE then
             begin
               { replace table name in structure with destination table name }
               StrCopy(TblDesc.szTblName, KillExt(DestTablePath));

               { free any memory allocation for items that will need to be replaced }
{$IFDEF WIN32}
               if (TblDesc.pSecDesc <> nil) then
                 FreeMem(TblDesc.pSecDesc, (iSec * SizeOf(SecDesc)));
{$ENDIF}
               if (TblDesc.pvchkDesc <> nil) then
                 FreeMem(TblDesc.pvchkDesc, (iVal * SizeOf(VCHKDesc)));

               { now fill in all the "holes" in the table description structure }

               DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
               PublishBDEResult(DBRslt);
               if DBRslt = DBIERR_NONE then
               begin
                 try
                   { set the database directory to source for now }
                   DBAnsiToNative(strDatabase, SrcDBPath, (SizeOf(SrcDBPath) - 1));
                   DBRslt := DbiSetDirectory(hDb, SrcDBPath);
                   PublishBDEResult(DBRslt);
                   if DBRslt = DBIERR_NONE then
                   begin

                     { for some reason, validity checks and referential integrity always come back
                       zero from 'TUFillCRTblDescCount'. Must fill in validity checks manually. Do
                       not want RI rules anyway on a clone operation (would be invalid) }
                     DBRslt := DbiOpenVchkList(hDb, NeedsExt(SrcTablePath), nil, TmpCursor);
                     if DBRslt = DBIERR_NONE then
                     begin
                       try
                         DBRslt := DbiSetToBegin(TmpCursor);  { set to start of in-mem table }
                         PublishBDEResult(DBRslt);
                         if DBRslt = DBIERR_NONE then
                         begin
                           { get record count and allocate structure }
                           DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                           PublishBDEResult(DBRslt);
                           if DBRslt = DBIERR_NONE then
                           begin
                             TblDesc.iValChkCount := TmpCount;
                             GetMem(TblDesc.pVchkDesc, (TmpCount * SizeOf(VCHKDesc)));
                             pVCheckDesc := TblDesc.pVchkDesc;
                             repeat
                               DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @VCheck, nil);
                               if (DBRslt <> DBIERR_EOF) then
                               begin
                                 pVCheckDesc^ := VCheck;
                                 inc(pVCheckDesc);
                               end;
                             until DBRslt <> DBIERR_NONE;
                           end;
                         end;
                       finally
                         DBRslt := DbiCloseCursor(TmpCursor);
                         PublishBDEResult(DBRslt);
                       end;
                     end;

{$IFDEF WIN32}
                     { auxilliary security info also comes back corrupted (looks like a
                       "packed record" alignment problem in TUTILITY ... reload }
                     DBRslt := DbiOpenSecurityList(hDb, NeedsExt(SrcTablePath), nil, TmpCursor);
                     if DBRslt = DBIERR_NONE then
                     begin
                       try
                         DBRslt := DbiSetToBegin(TmpCursor);  { set to start of in-mem table }
                         PublishBDEResult(DBRslt);
                         if DBRslt = DBIERR_NONE then
                         begin
                           { get record count and allocate structure }
                           DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                           PublishBDEResult(DBRslt);
                           if DBRslt = DBIERR_NONE then
                           begin
                             TblDesc.iSecRecCount := TmpCount;
                             GetMem(TblDesc.pSECDesc, (TmpCount * SizeOf(SECDesc)));
                             ptmpSecDesc := TblDesc.pSECDesc;
                             repeat
                               DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @tmpSecDesc, nil);
                               if (DBRslt <> DBIERR_EOF) then
                               begin
                                 ptmpSecDesc^ := tmpSecDesc;
                                 inc(ptmpSecDesc);
                               end;
                             until DBRslt <> DBIERR_NONE;
                           end;
                         end;
                       finally
                         DBRslt := DbiCloseCursor(TmpCursor);
                         PublishBDEResult(DBRslt);
                       end;
                     end;
{$ENDIF}

                     { now handle special mode operations }
                     case Mode of
                     cmDropAllIndices:         { drop all indices }
                       begin
                         if (iIdx > 0) then
                         begin
                           TblDesc.iIdxCount := 0;
                           FreeMem(TblDesc.pIdxDesc, (iIdx * SizeOf(IdxDesc)));
                           TblDesc.pIdxDesc := nil;
                         end;
                       end;
                     cmChangeAutoIncToInt:     { change AutoInc field to Integer }
                       begin
                         AutoIncField := 0;    { assume none for now }
                         pTestFldDesc := TblDesc.pFldDesc;
                         for i := 1 to TblDesc.iFldCount do
                         begin
                           if (pTestFldDesc^.iFldType = fldPDXAUTOINC) then
                           begin
                             pTestFldDesc^.iFldType := fldPDXLONG;
                             AutoIncField := pTestFldDesc^.iFldNum;
                             Break;            { only one per table allowed }
                           end;
                           inc(pTestFldDesc);
                         end;
                       end;
                     cmChangeIntToAutoInc:     { change Integer field (saved index) back to AutoInc }
                       begin
                         if (AutoIncField > 0) then
                         begin
                           pTestFldDesc := TblDesc.pFldDesc;
                           for i := 1 to TblDesc.iFldCount do
                           begin
                             if (AutoIncField = i) then
                             begin
                               pTestFldDesc^.iFldType := fldPDXAUTOINC;     { set AutoInc field type }
                               Break;          { only one per table allowed }
                             end;
                             inc(pTestFldDesc);
                           end;
                         end;
                       end;
                     cmDropSecondary:          { drop all secondary indices }
                       begin
                         if (iIdx > 0) then
                         begin
                           pTestIdxDesc := TblDesc.pIdxDesc;    { points to original index desc }
                           FoundPrimaryIndex := False;
                           pPrimaryIdxDesc := nil;
                           for i := 1 to iIdx do
                           begin
                             if pTestIdxDesc^.bPrimary then
                             begin
                               { allocate structure to hold only primary index ... copy }
                               GetMem(pPrimaryIdxDesc, SizeOf(IDXDesc));
                               pPrimaryIdxDesc^ := pTestIdxDesc^;
                               FoundPrimaryIndex := True;
                               Break;                           { can only be one primary index }
                             end;
                             inc(pTestIdxDesc);
                           end;
                           FreeMem(TblDesc.pIdxDesc, (iIdx * SizeOf(IdxDesc))); { free original memory }
                           { if a primary index was located, assign to table descriptor }
                           if FoundPrimaryIndex then
                           begin
                             iIdx := 1;
                             TblDesc.iIdxCount := 1;
                             TblDesc.pIdxDesc := pPrimaryIdxDesc;
                           end
                           else
                           begin
                             iIdx := 0;
                             TblDesc.iIdxCount := 0;
                             TblDesc.pIdxDesc := nil;
                           end;
                         end;
                       end;
                     end; { case }

                     { if all OK so far ... continue to create table }
                     if (DBRslt = DBIERR_NONE) then
                     begin
                       { set the database directory to dest }
                       DBAnsiToNative(strCloneDir, DestDBPath, (SizeOf(DestDBPath) - 1));
                       DBRslt := DbiSetDirectory(hDb, DestDBPath);
                       PublishBDEResult(DBRslt);
                       if DBRslt = DBIERR_NONE then
                       begin
                         DBRslt := DbiCreateTable(hDb, True, TblDesc);
                         PublishBDEResult(DBRslt);
                         Result := (DbRslt = DBIERR_NONE);
                       end;
                     end;

                   end;
                 finally
                   DbiCloseDatabase(hDb);
                 end;
               end;
             end;
          finally
            with TblDesc do
            begin
              if (pFldDesc <> nil) then
                FreeMem(pFldDesc, (iFld * SizeOf(FldDesc)));
              if (pIdxDesc <> nil) then
                FreeMem(pIdxDesc, (iIdx * SizeOf(IdxDesc)));
              if (pSecDesc <> nil) then
                FreeMem(pSecDesc, (iSec * SizeOf(SecDesc)));
              if (pVchkDesc <> nil) then
                FreeMem(pVchkDesc, (iVal * SizeOf(VCHKDesc)));
              if (pRIntDesc <> nil) then
                FreeMem(pRIntDesc, (iRI * SizeOf(RIntDesc)));
              if (pfldOptParams <> nil) then
                FreeMem(pfldOptParams, (iOptP * sizeOf(FLDDesc)));
              if (pOptData <> nil) then
                FreeMem(pOptData, (iOptD * DBIMAXSCFLDLEN));
            end;
          end;
        end;
      end;
    end;
  finally
    FBDEUtil.Free;
  end;
end;

{ DBCompareTables --  compares the table structure of two tables (see help for complete description) }
function DBCompareTables(CheckTable, BaseTable: TTable; var FOpType: array of CROptype;
                         var IOpType: array of CROptype; var pFldDes: pFldDesc): Boolean;
var
  i                      : Integer;
  TableHasChanged        : Boolean;
  CurrentFieldHasChanged : Boolean;
  CurrentIndexHasChanged : Boolean;
  IndexCount             : Integer;
  IndexLookupName        : String;
  IndexID                : Integer;
  CheckList              : TList;
  OrigFldIndex           : Integer;
  OrgFldDefs             : TFieldDef;
  MemSize                : Integer;
  curProp                : CURProps;
  pCurFld                : pFLDDesc;
  DBRslt                 : DBIResult;
begin

  { Update definition records }
  CheckTable.FieldDefs.Update;
  CheckTable.IndexDefs.Update;
  BaseTable.FieldDefs.Update;
  BaseTable.IndexDefs.Update;

  { Allocate memory for Field descriptor and get current decription }
  BaseTable.Open;
  try
    DBRslt := DbiGetCursorProps(BaseTable.Handle, curProp);
    PublishBDEResult(DBRslt);
    if DBRslt = DBIERR_NONE then
    begin
      MemSize := curProp.iFields * SizeOf(FLDDesc);
      pFldDes := AllocMem(MemSize);

      pCurFld := pfldDes;
      DBRslt := DbiGetFieldDescs(BaseTable.Handle, pfldDes);
      PublishBDEResult(DBRslt);
      if DBRslt <> DBIERR_NONE then
      begin
        Result := False;
        Exit;
      end;
    end
    else
    begin
      Result := False;
      Exit;
    end;
  finally
    BaseTable.Close;
  end;

  CheckList := TList.Create;
  try
    { init CheckList with an NOOP entry for each field in CheckTable }
    for i := 0 to CheckTable.FieldDefs.Count - 1 do
      CheckList.Add(Pointer(Ord(crNOOP)));

    { first check the field count }
    TableHasChanged := not (CheckTable.FieldDefs.Count = BaseTable.FieldDefs.Count);

    { Check fields }
    for i := 0 to BaseTable.FieldDefs.Count -1 do { iterate through the new table structure }
    begin
      FOpType[i] := crNOOP;  { init to NOOP ... will always override }
      { Can we find the field (by name) in the original structure }
      try
        OrigFldIndex := CheckTable.FieldDefs.IndexOf(BaseTable.FieldDefs.Items[i].Name);

        { if found, check for modifications }
        if (OrigFldIndex >= 0) then
        begin

          { get field definition reference }
          OrgFldDefs := CheckTable.FieldDefs.Items[OrigFldIndex];

          { Set the Field number to the original field location }
          pCurFld^.iFldNum := OrgFldDefs.FieldNo;

          { Has the field changed ... }

          { DataType }
          CurrentFieldHasChanged := OrgFldDefs.DataType <> BaseTable.FieldDefs.Items[i].DataType;

          { Size }
          if not CurrentFieldHasChanged then
            CurrentFieldHasChanged := OrgFldDefs.Size <> BaseTable.FieldDefs.Items[i].Size;

          { Required }
          if not CurrentFieldHasChanged then
            CurrentFieldHasChanged := OrgFldDefs.Required <> BaseTable.FieldDefs.Items[i].Required;

          { Set the Restructure operation type according to if the field has changed }
          if CurrentFieldHasChanged then
          begin
            TableHasChanged := True;
            FOpType[i] := crMODIFY;
            { flag field in check table as being matched }
            CheckList[OrigFldIndex] := Pointer(Ord(crMODIFY));
          end
          else
          begin
            FOpType[i] := crCOPY;
            { flag field in check table as being matched }
            CheckList[OrigFldIndex] := Pointer(Ord(crCOPY));
          end;
        end;

      except
        { should never happen }
      end;

      inc(pCurFld);

    end;

    { loop back thru to catch renamed fields (which MUST be in the same
      field location and have a matching type)}
    pCurFld := pfldDes;
    for i := 0 to BaseTable.FieldDefs.Count -1 do
    begin
      if (FOpType[i] = crNOOP) then
      begin
        if (i < CheckList.Count) then
        begin
          { if original field is yet to be matched and type is
            the same ... assume field is being renamed }
          if (LongInt(CheckList[i]) = Ord(crNOOP)) And
             (CheckTable.FieldDefs.Items[i].DataType =
              BaseTable.FieldDefs.Items[i].DataType) then
          begin
            FOpType[i] := crModify;
            { Set the Field number to original table field number }
            pCurFld^.iFldNum := CheckTable.FieldDefs.Items[i].FieldNo;
            TableHasChanged := True;
          end
          else  { must be a new field }
          begin
            FOpType[i] := crADD;
            { Set the Field number to ZERO for new fields }
            pCurFld^.iFldNum := 0;
            TableHasChanged := True;
          end;
        end
        else  { must be a new field }
        begin
          FOpType[i] := crADD;
          { Set the Field number to ZERO for new fields }
          pCurFld^.iFldNum := 0;
          TableHasChanged := True;
        end;
      end;
      inc(pCurFld);
    end;

    { Check Indices }

    { first check the Index count }
    if not TableHasChanged then
      TableHasChanged := not (CheckTable.IndexDefs.Count = BaseTable.IndexDefs.Count);

    { check each field, set the field count to the Highers value, drop or add indexes as required }
    if CheckTable.IndexDefs.Count < BaseTable.IndexDefs.Count then
      IndexCount := BaseTable.IndexDefs.Count
    else
      IndexCount := CheckTable.IndexDefs.Count;

    { check each Index }
    for i := 0 to IndexCount -1 do { cannot rely on the index being created in the same order }
    begin
      { Reset }
      CurrentIndexHasChanged := False;

      { If current index is the primary key lookup using a null name }
      try
        if UpperCase(BaseTable.IndexDefs.Items[i].Name) = 'PRIMARY' then
          IndexLookupName := ''
        else
          IndexLookupName := BaseTable.IndexDefs.Items[i].Name;

        { Try to Find Each Index in the compare table 'live' table }
        IndexID := CheckTable.IndexDefs.IndexOF(IndexLookupName);

        if IndexID = -1 then { index was not found }
        begin
          TableHasChanged := True;
          IOPType[i] := crADD; { new Index }
          Continue;
        end;

        { Fields }
        if not CurrentIndexHasChanged then
          CurrentIndexHasChanged := CompareText(CheckTable.IndexDefs.Items[i].Fields,
                                                BaseTable.IndexDefs.Items[IndexID].Fields) <> 0;

        { Options }
        if not CurrentIndexHasChanged then
          CurrentIndexHasChanged := CheckTable.IndexDefs.Items[i].Options <> BaseTable.IndexDefs.Items[IndexID].Options;

        if CurrentIndexHasChanged then
          IOPType[i] := crMODIFY
        else
          IOPType[i] := crREDO;

      except
        CurrentIndexHasChanged := True;
        IOPType[i] := crDROP;
      end;

      if not TableHasChanged then
        TableHasChanged := CurrentIndexHasChanged;

    end;

    { In this version the table restructure routine uses a destructive approach to index
      restructuring and deletes all indices prior to the BDE restructure call. Thus the
      index definition used during the BDE call must all be set to operation type crADD. }
    for i := 0 to 255 do
      IOpType[i] := crADD;

    Result := not TableHasChanged;

  finally
    CheckList.Free;
  end;

end;


{ DBRestructureTableFromTable -- restructures target table to match base table
  (see help for complete description) }
function DBRestructureTableFromTable(strTargetDataBase, strTargetTableName,
                                     strBaseDatabase, strBaseTableName: String;
                                     FOptype: array of CROptype; IOptype: array of CROptype;
                                     var pFldDes: pFldDesc): Boolean;
var
  BaseTable       : TTable;
  TargetTable     : TTable;
  hDb             : hDbiDb;
  CursorProps     : CurProps;
  FDesc           : pFldDesc;
  IDesc           : PIdxDesc;
  pVDesc          : pVCHKDesc;
  ImemSize, VMemSize : Integer;
  TblDesc         : CRTblDesc;
  DBRslt          : DBIResult;
  DBName          : DBIPATH;
begin
  Result := False; { Assume Failure for now }
  FDesc := nil;
  pFldDes := nil;  { this was an error ... do not allocate }

  try
    BaseTable := TTable.Create(Application);
    try
      TargetTable := TTable.Create(Application);
      try
        { Setup BaseTable Table }
        with BaseTable do
        begin
          DataBaseName := strBaseDataBase;
          TableName := strBaseTableName;
          FieldDefs.Update;
          IndexDefs.Update;
        end;

        { Setup TargetTable Table }
        with TargetTable do
        begin
          DataBaseName := strTargetDataBase;
          TableName := strTargetTableName;
          FieldDefs.Update;
          IndexDefs.Update;
        end;

        BaseTable.Open;
        try
          { Open a NULL database handle }
          DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
          PublishBDEResult(DBRslt);
          if DBRslt = DBIERR_NONE then
          begin

            try
              { set the database directory }
              DBAnsiToNative(strTargetDatabase, DBName, (SizeOf(DBName) - 1));
              DBRslt := DbiSetDirectory(hDb, DBName);
              PublishBDEResult(DBRslt);
              if DBRslt = DBIERR_NONE then
              begin
                { get table cursor properties }
                DBRslt := DbiGetCursorProps(BaseTable.Handle, CursorProps);
                PublishBDEResult(DBRslt);
                if DBRslt = DBIERR_NONE then
                begin
                  { Alocate memory for Index descriptor }
                  ImemSize := (CursorProps.iIndexes) * SizeOf(IDXDesc);
                  IDesc := AllocMem(ImemSize);
                  try
                    { Alocate memory for Validity check descriptor }
                    VMemSize := (CursorProps.iValChecks) * SizeOf(pVDesc);
                    pVDesc := AllocMem(VMemSize);
                    try
                      { Get Index descriptions }
{$IFDEF WIN32}
                      DBRslt := DbiGetIndexDescs(BaseTable.Handle, IDesc);
{$ELSE}
                      DBRslt := DbiGetIndexDescs(BaseTable.Handle, IDesc^);
{$ENDIF}
                      PublishBDEResult(DBRslt);
                      if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_NOTINDEXED) then
                      begin
                        FillChar(TblDesc, SizeOf(CRTblDesc), #0);
                        StrPCopy(TblDesc.szTblName, strTargetTableName);
                        TblDesc.szTblType := DBGetTableType(strTargetTableName);

                        { Compare the tables to ensure that the OPtype structures are correct }
                        DBCompareTables(TargetTable, BaseTable, FOpType, IOpType, Fdesc);

                        { Set Table properties }
                        { Fields }

                        with TblDesc do
                        begin
                          iFldCount := CursorProps.iFields;
                          pecrFldOp := @FOpType;
                          pfldDesc := FDesc;
                          { Indices }
                          iIdxCount := CursorProps.iIndexes;
                          pecrIdxOp := @IOpType;
                          pIdxDesc := IDesc;
                        end;

                        { Delete all existing indexes prior to the restructure }
                        with TargetTable do
                        begin
                          Exclusive := True;
                          Open;
                          try
                            IndexDefs.Update;
                            while IndexDefs.Count > 0  do
                            begin
                              { must delete primary index last }
                              if (IndexDefs.Count = 1) Or (IndexDefs.Items[0].Name <> '') then
                                DeleteIndex(IndexDefs.Items[0].Name)
                              else
                                DeleteIndex(IndexDefs.Items[1].Name);
                              IndexDefs.Update;
                            end;
                          finally
                            Close;
                          end;
                        end;

                        { Do the restructure }
                        DBRslt := DbiDoRestructure(Hdb, 1, @TblDesc, nil, nil, nil, False);
                        PublishBDEResult(DBRslt);
                        Result := DBRslt = DBIERR_NONE;

                      end;
                    finally
                      if (pVDesc <> nil) then
                        FreeMem(pVDesc, VMemSize);
                    end;
                  finally
                    if (IDesc <> nil) then
                      FreeMem(IDesc, IMemSize);
                    if (FDesc <> nil) then  { actually allocated by DBCompareTable() }
                      FreeMem(FDesc, CursorProps.iFields);
                  end;

                end;
              end;
            finally
              DbiCloseDatabase(hDb);
            end;
          end;
        finally
          BaseTable.Close;
        end;

      finally
        TargetTable.Free;
      end;
    finally
      BaseTable.Free;
    end;
  except
    on E: EDataBaseError do
    begin
      Result := False;
      LastDBErrorString := E.Message;
      { Re Raise Exception so that it is passed back to the Calling function }
      if ReRaiseDBExceptions then
       raise;
    end;
  end;
end;


{ DBRestructureTableFromTableExtended -- restructures target table to match base table
  in specific stages (see help for complete description) }
function DBRestructureTableFromTableExtended(strTargetDataBase, strTargetTableName,
                                     strBaseDatabase, strBaseTableName, strPassword: String;
                                     ExtendedOptions: TDBExtendedRestructureOptions): Boolean;
var
  BaseTable       : TTable;
  TargetTable     : TTable;
  hDb             : hDbiDb;
  CursorProps     : CurProps;
  FDesc           : pFldDesc;
  IDesc           : PIdxDesc;
  ImemSize, VMemSize : Integer;
  TblDesc         : CRTblDesc;
  DBRslt          : DBIResult;
  DBName          : DBIPATH;
  BaseTablePName  : DBITBLNAME;
  TargetTablePName: DBITBLNAME;
  TmpCursor       : hdbicur;
  TmpCount        : LongInt;
  VCheck          : VCHKDesc;
  pVCheckDesc     : pVCHKDesc;
  pVCheckOp       : pCROpType;
  RI              : RINTDesc;
  pRIDesc         : pRINTDesc;
  pRIOp           : pCROpType;
  SecurityDesc    : SECDesc;
  pSecurityDesc   : pSECDesc;
  pSecurityOp     : pCROpType;
  FOpType         : array[0..255] of CROptype;
  IOpType         : array[0..255] of CROptype;
begin
  Result := False; { Assume Failure for now }
  FDesc := nil;

  { must always remove existing validity checks, RI rules, and security
    info before adding new information from clone }
  if (eroValidityChecks In ExtendedOptions) then
    Include(ExtendedOptions, eroClearValidityChecks);
  if (eroReferentialIntegrity In ExtendedOptions) then
    Include(ExtendedOptions, eroClearReferentialIntegrity);
  if (eroSecurity In ExtendedOptions) then
    Include(ExtendedOptions, eroClearSecurity);

  try
    { use TUTILITY function to retrieve master passwords from
      target and base tables ... assume none if problems }

    { get the table structure from the structure file }
    BaseTable := TTable.Create(Application);
    try
      TargetTable := TTable.Create(Application);
      try
        { Setup BaseTable Table }
        with BaseTable do
        begin
          DataBaseName := strBaseDataBase;
          TableName := strBaseTableName;
          FieldDefs.Update;
          IndexDefs.Update;
        end;

        { Setup TargetTable Table }
        with TargetTable do
        begin
          DataBaseName := strTargetDataBase;
          TableName := strTargetTableName;
          FieldDefs.Update;
          IndexDefs.Update;
        end;

        BaseTable.Open;
        try
          { Open a NULL database handle }
          DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
          PublishBDEResult(DBRslt);
          if DBRslt = DBIERR_NONE then
          begin

            try

              { set the database directory }
              DBAnsiToNative(strTargetDatabase, DBName, (SizeOf(DBName) - 1));
              DBRslt := DbiSetDirectory(hDb, DBName);
              PublishBDEResult(DBRslt);
              if DBRslt = DBIERR_NONE then
              begin
                { get table cursor properties }
                DBRslt := DbiGetCursorProps(BaseTable.Handle, CursorProps);
                PublishBDEResult(DBRslt);
                if DBRslt = DBIERR_NONE then
                begin
                  { Alocate memory for Index descriptor }
                  ImemSize := (CursorProps.iIndexes) * SizeOf(IDXDesc);
                  IDesc := AllocMem(ImemSize);
                  try
                    { Get Index descriptions }
{$IFDEF WIN32}
                    DBRslt := DbiGetIndexDescs(BaseTable.Handle, IDesc);
{$ELSE}
                    DBRslt := DbiGetIndexDescs(BaseTable.Handle, IDesc^);
{$ENDIF}
                    PublishBDEResult(DBRslt);
                    if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_NOTINDEXED) then
                    begin
                      DBRslt := DBIERR_NONE;  { clear and republish error result }
                      PublishBDEResult(DBRslt);

                      FillChar(TblDesc, SizeOf(CRTblDesc), #0);
                      StrPCopy(TblDesc.szTblName, strTargetTableName);
                      TblDesc.szTblType := DBGetTableType(strTargetTableName);
                      StrPCopy(TblDesc.szPassword, strPassword);  { set master password }
                      TblDesc.bProtected := (strPassword <> '');

                      { Compare the tables to ensure that the OPtype structures are correct }
                      DBCompareTables(TargetTable, BaseTable, FOpType, IOpType, FDesc);

                      try
                        { if requested, drop all existing validity checks }
                        if (eroClearValidityChecks In ExtendedOptions) then
                        begin
                          DBAnsiToNative(AddSlash(strTargetDataBase) + strTargetTableName, TargetTablePName,
                                         (SizeOf(TargetTablePName) - 1));
                          DBRslt := DbiOpenVchkList(hDb, NeedsExt(TargetTablePName), nil, TmpCursor);
                          PublishBDEResult(DBRslt);
                          if DBRslt = DBIERR_NONE then
                          begin
                            try
                              DBRslt := DbiSetToBegin(TmpCursor); { start of target table val checks }
                              PublishBDEResult(DBRslt);
                              if DBRslt = DBIERR_NONE then
                              begin
                                { get record counts and allocate structures }
                                DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                                PublishBDEResult(DBRslt);
                                if DBRslt = DBIERR_NONE then
                                begin
                                  TblDesc.iValChkCount := TmpCount;
                                  GetMem(TblDesc.pVchkDesc, (TmpCount * SizeOf(VCHKDesc)));
                                  GetMem(TblDesc.pecrValChkOp, (TmpCount * SizeOf(CROpType)));
                                  pVCheckDesc := TblDesc.pVchkDesc;
                                  pVCheckOp := TblDesc.pecrValChkOp;
                                  { drop (delete) all target table validity checks }
                                  repeat
                                    DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @VCheck, nil);
                                    if (DBRslt <> DBIERR_EOF) then
                                    begin
                                      pVCheckDesc^ := VCheck;
                                      inc(pVCheckDesc);
                                      pVCheckOp^ := crDROP;
                                      inc(pVCheckOp);
                                    end;
                                  until DBRslt <> DBIERR_NONE;
                                end;
                              end;
                            finally
                              if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_EOF) then
                              begin
                                DBRslt := DbiCloseCursor(TmpCursor);
                                PublishBDEResult(DBRslt);
                              end
                              else
                                DbiCloseCursor(TmpCursor);
                            end;
                          end;
                        end;

                        { if requested, drop all existing RI rules }
                        if (DBRslt = DBIERR_NONE) And (eroClearReferentialIntegrity In ExtendedOptions) then
                        begin
                          DBAnsiToNative(AddSlash(strTargetDataBase) + strTargetTableName, TargetTablePName,
                                         (SizeOf(TargetTablePName) - 1));
                          DBRslt := DbiOpenRintList(hDb, NeedsExt(TargetTablePName), nil, TmpCursor);
                          PublishBDEResult(DBRslt);
                          if DBRslt = DBIERR_NONE then
                          begin
                            try
                              DBRslt := DbiSetToBegin(TmpCursor);  { start of target table RI rules }
                              PublishBDEResult(DBRslt);
                              if DBRslt = DBIERR_NONE then
                              begin
                                { get record counts and allocate structures }
                                DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                                PublishBDEResult(DBRslt);
                                if DBRslt = DBIERR_NONE then
                                begin
                                  TblDesc.iRintCount := TmpCount;
                                  GetMem(TblDesc.pRIntDesc, (TmpCount * SizeOf(RIntDesc)));
                                  GetMem(TblDesc.pecrRintOp, (TmpCount * SizeOf(CROpType)));
                                  pRIDesc := TblDesc.pRIntDesc;
                                  pRIOp := TblDesc.pecrRintOp;
                                  { drop (delete) all target table RI rules }
                                  repeat
                                    DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @RI, nil);
                                    if (DBRslt <> DBIERR_EOF) then
                                    begin
                                      pRIDesc^ := RI;
                                      inc(pRIDesc);
                                      pRIOp^ := crDROP;
                                      inc(pRIOp);
                                    end;
                                  until DBRslt <> DBIERR_NONE;
                                end;
                              end;
                            finally
                              if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_EOF) then
                              begin
                                DBRslt := DbiCloseCursor(TmpCursor);
                                PublishBDEResult(DBRslt);
                              end
                              else
                                DbiCloseCursor(TmpCursor);
                            end;
                          end;
                        end;

                        { if requested, drop all security info }
                        if (DBRslt = DBIERR_NONE) And (eroClearSecurity In ExtendedOptions) then
                        begin
                          { clear master password }
                          StrPCopy(TblDesc.szPassword, '');
                          TblDesc.bProtected := False;
                          { drop all auxilliary passwords }
                          DBAnsiToNative(AddSlash(strTargetDataBase) + strTargetTableName, TargetTablePName,
                                         (SizeOf(TargetTablePName) - 1));
                          DBRslt := DbiOpenSecurityList(hDb, NeedsExt(TargetTablePName), nil, TmpCursor);
                          PublishBDEResult(DBRslt);
                          if DBRslt = DBIERR_NONE then
                          begin
                            try
                              DBRslt := DbiSetToBegin(TmpCursor);  { set to start of in-mem table }
                              PublishBDEResult(DBRslt);
                              if DBRslt = DBIERR_NONE then
                              begin
                                { get record count and allocate structures }
                                DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                                PublishBDEResult(DBRslt);
                                if DBRslt = DBIERR_NONE then
                                begin
                                  TblDesc.iSecRecCount := TmpCount;
                                  GetMem(TblDesc.pSECDesc, (TmpCount * SizeOf(SECDesc)));
                                  GetMem(TblDesc.pecrSecOp, (TmpCount * SizeOf(CROpType)));
                                  pSecurityDesc := TblDesc.pSECDesc;
                                  pSecurityOp := TblDesc.pecrSecOp;
                                  repeat
                                    DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @SecurityDesc, nil);
                                    if (DBRslt <> DBIERR_EOF) then
                                    begin
                                      pSecurityDesc^ := SecurityDesc;
                                      inc(pSecurityDesc);
                                      pSecurityOp^ := crDROP;
                                      inc(pSecurityOp);
                                    end;
                                  until DBRslt <> DBIERR_NONE;
                                end;
                              end;
                            finally
                              if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_EOF) then
                              begin
                                DBRslt := DbiCloseCursor(TmpCursor);
                                PublishBDEResult(DBRslt);
                              end
                              else
                                DbiCloseCursor(TmpCursor);
                            end;
                          end;
                        end;

                        { if all is well ...  do the initial restructuring without
                          validity checks, RI Rules, and/or security if necessary }
                        if (DBRslt = DBIERR_NONE) And
                           ((TblDesc.iValChkCount > 0) Or
                            (TblDesc.iRintCount > 0) Or
                            (eroClearSecurity In ExtendedOptions)) then
                        begin
                          DBRslt := DbiDoRestructure(Hdb, 1, @TblDesc, nil, nil, nil, False);
                          PublishBDEResult(DBRslt);
                        end;

                      finally
                        if (TblDesc.pVchkDesc <> nil) then
                          FreeMem(TblDesc.pVchkDesc, (TblDesc.iValChkCount * SizeOf(VCHKDesc)));
                        if (TblDesc.pecrValChkOp <> nil) then
                          FreeMem(TblDesc.pecrValChkOp, (TblDesc.iValChkCount * SizeOf(CROpType)));
                        if (TblDesc.pRIntDesc <> nil) then
                          FreeMem(TblDesc.pRIntDesc, (TblDesc.iRintCount * SizeOf(RIntDesc)));
                        if (TblDesc.pecrRintOp <> nil) then
                          FreeMem(TblDesc.pecrRintOp, (TblDesc.iRintCount * SizeOf(CROpType)));
                        if (TblDesc.pSECDesc <> nil) then
                          FreeMem(TblDesc.pSECDesc, (TblDesc.iSecRecCount * SizeOf(SECDesc)));
                        if (TblDesc.pecrSecOp <> nil) then
                          FreeMem(TblDesc.pecrSecOp, (TblDesc.iSecRecCount * SizeOf(CROpType)));
                      end;

                      { if all is well so far ... perform field and index
                        restructuring }
                      if DBRslt = DBIERR_NONE then
                      begin

                        { rezero table description structure }
                        FillChar(TblDesc, SizeOf(CRTblDesc), #0);
                        StrPCopy(TblDesc.szTblName, strTargetTableName);
                        TblDesc.szTblType := DBGetTableType(strTargetTableName);
                        StrPCopy(TblDesc.szPassword, strPassword);  { set master password }
                        TblDesc.bProtected := (strPassword <> '');

                        { Set Table properties }
                        with TblDesc do
                        begin
                          { if desired, restructure fields }
                          if (eroFields In ExtendedOptions) then
                          begin
                            iFldCount := CursorProps.iFields;
                            pecrFldOp := @FOpType;
                            pfldDesc := FDesc;
                          end;
                          { if desired, restructure indices }
                          if (eroIndices In ExtendedOptions) then
                          begin
                            iIdxCount := CursorProps.iIndexes;
                            pecrIdxOp := @IOpType;
                            pIdxDesc := IDesc;
                          end;
                        end;

                        { if indices are being restructured, delete all existing
                          indexes prior to the restructure }
                        if (eroIndices In ExtendedOptions) then
                        begin
                          with TargetTable do
                          begin
                            Exclusive := True;
                            Open;
                            try
                              IndexDefs.Update;
                              while IndexDefs.Count > 0  do
                              begin
                                { must delete primary index last }
                                if (IndexDefs.Count = 1) Or (IndexDefs.Items[0].Name <> '') then
                                  DeleteIndex(IndexDefs.Items[0].Name)
                                else
                                  DeleteIndex(IndexDefs.Items[1].Name);
                                IndexDefs.Update;
                              end;
                            finally
                              Close;
                            end;
                          end;
                        end;

                        { restructure for field and index changes }
                        if (eroFields In ExtendedOptions) Or (eroIndices In ExtendedOptions) then
                        begin
                          DBRslt := DbiDoRestructure(Hdb, 1, @TblDesc, nil, nil, nil, False);
                          PublishBDEResult(DBRslt);
                        end;

                      end;

                    end;
                  finally
                    if (IDesc <> nil) then
                      FreeMem(IDesc, IMemSize);
                    if (FDesc <> nil) then  { actually allocated by DBCompareTable() }
                      FreeMem(FDesc, CursorProps.iFields);
                  end;

                  { if desired, now apply the validity checks }
                  if (DBRslt = DBIERR_NONE) And (eroValidityChecks In ExtendedOptions) then
                  begin

                    { rezero table description structure }
                    FillChar(TblDesc, SizeOf(CRTblDesc), #0);
                    StrPCopy(TblDesc.szTblName, strTargetTableName);
                    TblDesc.szTblType := DBGetTableType(strTargetTableName);
                    StrPCopy(TblDesc.szPassword, strPassword);  { set master password }
                    TblDesc.bProtected := (strPassword <> '');

                    try
                      { add back all validity checks }
                      DBAnsiToNative(AddSlash(strBaseDataBase) + strBaseTableName, BaseTablePName,
                                     (SizeOf(BaseTablePName) - 1));
                      DBRslt := DbiOpenVchkList(hDb, NeedsExt(BaseTablePName), nil, TmpCursor);
                      PublishBDEResult(DBRslt);
                      if DBRslt = DBIERR_NONE then
                      begin
                        try
                          DBRslt := DbiSetToBegin(TmpCursor); { start of target table val checks }
                          PublishBDEResult(DBRslt);
                          if DBRslt = DBIERR_NONE then
                          begin
                            { get record counts and allocate structures }
                            DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                            PublishBDEResult(DBRslt);
                            if DBRslt = DBIERR_NONE then
                            begin
                              TblDesc.iValChkCount := TmpCount;
                              GetMem(TblDesc.pVchkDesc, (TmpCount * SizeOf(VCHKDesc)));
                              GetMem(TblDesc.pecrValChkOp, (TmpCount * SizeOf(CROpType)));
                              pVCheckDesc := TblDesc.pVchkDesc;
                              pVCheckOp := TblDesc.pecrValChkOp;
                              { add all base table validity checks }
                              repeat
                                DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @VCheck, nil);
                                if (DBRslt <> DBIERR_EOF) then
                                begin
                                  pVCheckDesc^ := VCheck;
                                  inc(pVCheckDesc);
                                  pVCheckOp^ := crADD;
                                  inc(pVCheckOp);
                                end;
                              until DBRslt <> DBIERR_NONE;
                            end;
                          end;
                        finally
                          if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_EOF) then
                          begin
                            DBRslt := DbiCloseCursor(TmpCursor);
                            PublishBDEResult(DBRslt);
                          end
                          else
                            DbiCloseCursor(TmpCursor);
                        end;
                      end;

                      { if all is well ...  do the restructuring with validity
                        checks if necessary }
                      if (DBRslt = DBIERR_NONE) And (TblDesc.iValChkCount > 0) then
                      begin
                        DBRslt := DbiDoRestructure(Hdb, 1, @TblDesc, nil, nil, nil, False);
                        PublishBDEResult(DBRslt);
                      end;

                    finally
                      if (TblDesc.pVchkDesc <> nil) then
                        FreeMem(TblDesc.pVchkDesc, (TblDesc.iValChkCount * SizeOf(VCHKDesc)));
                      if (TblDesc.pecrValChkOp <> nil) then
                        FreeMem(TblDesc.pecrValChkOp, (TblDesc.iValChkCount * SizeOf(CROpType)));
                    end;

                  end;

                  { if desired, now apply the RI rules }
                  if (DBRslt = DBIERR_NONE) And (eroReferentialIntegrity In ExtendedOptions) then
                  begin

                    { rezero table description structure }
                    FillChar(TblDesc, SizeOf(CRTblDesc), #0);
                    StrPCopy(TblDesc.szTblName, strTargetTableName);
                    TblDesc.szTblType := DBGetTableType(strTargetTableName);
                    StrPCopy(TblDesc.szPassword, strPassword);  { set master password }
                    TblDesc.bProtected := (strPassword <> '');

                    try
                      { add back all RI rules }
                      DBAnsiToNative(AddSlash(strBaseDataBase) + strBaseTableName, BaseTablePName,
                                     (SizeOf(BaseTablePName) - 1));
                      DBRslt := DbiOpenRintList(hDb, NeedsExt(BaseTablePName), nil, TmpCursor);
                      PublishBDEResult(DBRslt);
                      if DBRslt = DBIERR_NONE then
                      begin
                        try
                          DBRslt := DbiSetToBegin(TmpCursor);  { start of target table RI rules }
                          PublishBDEResult(DBRslt);
                          if DBRslt = DBIERR_NONE then
                          begin
                            { get record counts and allocate structures }
                            DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                            PublishBDEResult(DBRslt);
                            if DBRslt = DBIERR_NONE then
                            begin
                              TblDesc.iRintCount := TmpCount;
                              GetMem(TblDesc.pRIntDesc, (TmpCount * SizeOf(RIntDesc)));
                              GetMem(TblDesc.pecrRintOp, (TmpCount * SizeOf(CROpType)));
                              pRIDesc := TblDesc.pRIntDesc;
                              pRIOp := TblDesc.pecrRintOp;
                              { add all base table RI rules }
                              repeat
                                DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @RI, nil);
                                if (DBRslt <> DBIERR_EOF) then
                                begin
                                  { remap table name to target directory }
                                  DBAnsiToNative(AddSlash(strTargetDatabase) +
                                                 ExtractFileName(StrPas(RI.szTblName)), RI.szTblName,
                                                 (SizeOf(RI.szTblName) - 1));
                                  pRIDesc^ := RI;
                                  inc(pRIDesc);
                                  pRIOp^ := crADD;
                                  inc(pRIOp);
                                end;
                              until DBRslt <> DBIERR_NONE;
                            end;
                          end;
                        finally
                          if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_EOF) then
                          begin
                            DBRslt := DbiCloseCursor(TmpCursor);
                            PublishBDEResult(DBRslt);
                          end
                          else
                            DbiCloseCursor(TmpCursor);
                        end;
                      end;

                      { if all is well ...  do the restructuring with
                        RI Rules if necessary }
                      if (DBRslt = DBIERR_NONE) And (TblDesc.iRintCount > 0) then
                      begin
                        DBRslt := DbiDoRestructure(Hdb, 1, @TblDesc, nil, nil, nil, False);
                        PublishBDEResult(DBRslt);
                      end;

                    finally
                      if (TblDesc.pRIntDesc <> nil) then
                        FreeMem(TblDesc.pRIntDesc, (TblDesc.iRintCount * SizeOf(RIntDesc)));
                      if (TblDesc.pecrRintOp <> nil) then
                        FreeMem(TblDesc.pecrRintOp, (TblDesc.iRintCount * SizeOf(CROpType)));
                    end;

                  end;

                  { if desired, now apply the security info }
                  if (DBRslt = DBIERR_NONE) And (eroSecurity In ExtendedOptions) then
                  begin

                    { rezero table description structure }
                    FillChar(TblDesc, SizeOf(CRTblDesc), #0);
                    StrPCopy(TblDesc.szTblName, strTargetTableName);
                    TblDesc.szTblType := DBGetTableType(strTargetTableName);
                    StrPCopy(TblDesc.szPassword, strPassword);
                    TblDesc.bProtected := (strPassword <> '');

                    try
                      { add back all auxilliary security info }
                      DBAnsiToNative(AddSlash(strBaseDataBase) + strBaseTableName, BaseTablePName,
                                     (SizeOf(BaseTablePName) - 1));
                      DBRslt := DbiOpenSecurityList(hDb, NeedsExt(BaseTablePName), nil, TmpCursor);
                      PublishBDEResult(DBRslt);
                      if DBRslt = DBIERR_NONE then
                      begin
                        try
                          DBRslt := DbiSetToBegin(TmpCursor);  { start of target table RI rules }
                          PublishBDEResult(DBRslt);
                          if DBRslt = DBIERR_NONE then
                          begin
                            { get record counts and allocate structures }
                            DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                            PublishBDEResult(DBRslt);
                            if DBRslt = DBIERR_NONE then
                            begin
                              TblDesc.iSecRecCount := TmpCount;
                              GetMem(TblDesc.pSECDesc, (TmpCount * SizeOf(SECDesc)));
                              GetMem(TblDesc.pecrSecOp, (TmpCount * SizeOf(CROpType)));
                              pSecurityDesc := TblDesc.pSECDesc;
                              pSecurityOp := TblDesc.pecrSecOp;
                              repeat
                                DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @SecurityDesc, nil);
                                if (DBRslt <> DBIERR_EOF) then
                                begin
                                  pSecurityDesc^ := SecurityDesc;
                                  inc(pSecurityDesc);
                                  pSecurityOp^ := crADD;
                                  inc(pSecurityOp);
                                end;
                              until DBRslt <> DBIERR_NONE;
                            end;
                          end;
                        finally
                          if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_EOF) then
                          begin
                            DBRslt := DbiCloseCursor(TmpCursor);
                            PublishBDEResult(DBRslt);
                          end
                          else
                            DbiCloseCursor(TmpCursor);
                        end;
                      end;

                      { if all is well ...  do the restructuring with security info }
                      if (DBRslt = DBIERR_NONE) then
                      begin
                        DBRslt := DbiDoRestructure(Hdb, 1, @TblDesc, nil, nil, nil, False);
                        PublishBDEResult(DBRslt);
                      end;

                    finally
                      if (TblDesc.pSECDesc <> nil) then
                        FreeMem(TblDesc.pSECDesc, (TblDesc.iSecRecCount * SizeOf(SECDesc)));
                      if (TblDesc.pecrSecOp <> nil) then
                        FreeMem(TblDesc.pecrSecOp, (TblDesc.iSecRecCount * SizeOf(CROpType)));
                    end;

                  end;

                  PublishBDEResult(DBRslt);
                  Result := (DBRslt = DBIERR_NONE);  { set result }

                end;
              end;
            finally
              DbiCloseDatabase(hDb);
            end;
          end;
        finally
          BaseTable.Close;
        end;

      finally
        TargetTable.Free;
      end;
    finally
      BaseTable.Free;
    end;
  except
    on E: EDataBaseError do
    begin
      Result := False;
      LastDBErrorString := E.Message;
      { Re Raise Exception so that it is passed back to the Calling function }
      if ReRaiseDBExceptions then
       raise;
    end;
  end;
end;


{ DBCopyTable -- copies a table (see help for complete description) }
function DBCopyTable(strDataBase, strTableName, strDestDir, strDestName: String): Boolean;
var
  hDb           : hDbiDb;
  DBRslt        : DBIResult;
  DBName        : DBIPATH;
  SrcTableName  : DBITBLNAME;
  DestTableName : DBITBLNAME;
begin
  Result := False; { assume failure for now }

  { Add '\' directory string if not present }
  strDestDir := AddSlash(strDestDir);

  { Convert the filename passed in strTableName to not include the file extension }
  if pos('.', strDestName) > 0 then
    strDestName := Copy(strDestName, 1, pos('.', strDestName) -1);

  { Open a NULL database handle }
  DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenShared, nil, 0, nil, nil, hDb);
  PublishBDEResult(DBRslt);
  if DBRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DBRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        DBAnsiToNative(strTableName, SrcTableName, (SizeOf(SrcTableName) - 1));
        DBAnsiToNative((strDestDir + strDestName + ExtractFileExt(strTableName)),
                       DestTableName, (SizeOf(DestTableName) - 1));
        DBRslt := DbiCopyTable(hDb, TRUE, SrcTableName, nil, DestTableName);
        PublishBDEResult(DBRslt);
        Result := DBRslt = DBIERR_NONE;
      end;
    finally { close the database object }
      DbiCloseDatabase(hDb);
    end;
  end;

end;

{ DBCopyTableFileIO -- copy a table using File I/O instead of BDE API (see help for
  complete description) }
function DBCopyTableFileIO(strDataBase, strTableName, strDestDir, strDestName: String): Boolean;
var
  FileList      : TStringList;
  i             : Integer;
  SrcFileName   : DBITBLNAME;
  DestFileName  : DBITBLNAME;
begin

  { append trailing '\' if not present }
  strDestDir:= AddSlash(strDestDir);

  { Strip any extention from the destination file name }
  if pos('.', strDestName) > 0 then
    strDestName := Copy(strDestName, 1, pos('.', strDestName)-1);

  FileList := TStringList.Create;
  try
    { get list of associated files, files with the same filename less the extention of the table name. }
    DBGetTableAssociatedFiles(strDataBase, strTableName, FileList);

    { if not files exist return bad copy }
    Result := (FileList.Count > 0);

{$IFDEF WIN32}
    for i := 0 to FileList.Count -1 do
    begin
      DBAnsiToNative(FileList[i], SrcFileName, (SizeOf(SrcFileName) - 1));
      DBAnsiToNative((strDestDir + strDestName + ExtractFileExt(FileList[i])),
                     DestFileName, (SizeOf(DestFileName) - 1));
      if not CopyFile(SrcFileName, DestFileName, False) then
        Result := False;
    end;
{$ELSE}
    for i := 0 to FileList.Count -1 do
      if not CopyFile(FileList[i], (strDestDir + strDestName + ExtractFileExt(FileList[i]))) then
        Result := False;
{$ENDIF}

  finally
    FileList.Free;
  end;

end;

{ DBDeleteTableFileIO -- delete data table using file I/O instead of BDE API (see help for
  complete description) }
function DBDeleteTableFileIO(strDataBase, strTableName: String): Boolean;
var
  FileList : TStringList;
  i        : Integer;
begin
  Result := True; { Assume Success For Now }

  FileList := TStringList.Create;
  try
    { Get a list of all associated file names }
    DBGetTableAssociatedFiles(strDataBase, strTableName, FileList);

    for i := 0 to FileList.Count -1 do
      if not SysUtils.DeleteFile(FileList[i])  then
        Result := False;

  finally
    FileList.Free;
  end;

end;

{ DBPackTable -- packs a table (see help for complete description) }
function DBPackTable(strDataBase, strTableName, strPassword: String; TableType: DBINAME; Protect: Boolean): Boolean;
var
  hDb                  : hDbiDb;
  TblDesc              : CRTblDesc;
  TmpFilePath          : String;
  DBRslt               : DBIResult;
  DBName               : DBIPATH;
  TableName            : DBITBLNAME;
  WorkTableType        : DBINAME;
begin
  Result := True; { assume success for now }

  if Protect then { make temp copy, use file I/O in case the table is corrupt }
  begin
    TmpFilePath := Session.PrivateDir + '\';
    if not DBCopyTableFileIO(strDataBase, strTableName, TmpFilePath, strTableName) then
    begin
      LastDBError := DBIERR_WRITEERR;
      LastDBErrorString := 'Failed to create temporary copy table.';
      Result := False;
      Exit;
    end;
  end;

  try
    { Open a NULL database handle }
    DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
    PublishBDEResult(DBRslt);
    if DBRslt = DBIERR_NONE then
    begin
      FillChar(TblDesc, sizeof(CRTblDesc), #0);
      try
        { set the database directory }
        DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
        DBRslt := DbiSetDirectory(hDb, DBName);
        PublishBDEResult(DBRslt);
        if DBRslt = DBIERR_NONE then
        begin
          StrPCopy(TblDesc.szTblName, strTableName);
          WorkTableType := DBGetTableType(strTableName);
          if StrPas(WorkTableType) = szParadox then
            StrPCopy(TblDesc.szTblType, szParadox)
          else
            StrPCopy(TblDesc.szTblType, szDBase);

          if StrPas(TableType) = szPARADOX then
          begin
            { set password information }
            if (Length(strPassword) > 0) then
            begin
              TblDesc.bProtected := True;
              StrPCopy(TblDesc.szPassword, strPassword);
            end
            else
            begin
              TblDesc.bProtected := False;
              StrPCopy(TblDesc.szPassword, '');
            end;

            { Set Flag to pack table }
            TblDesc.bPack := TRUE;

            { Do a Restructure, this will pack the table without making any field or
              index changes }
            if DBRslt = DBIERR_NONE then
            begin
              DBRslt := DbiDoRestructure(hDb, 1, @TblDesc, nil, nil, nil, False);
              PublishBDEResult(DBRslt);
            end;

            Result := (DBRslt = DBIERR_NONE);

          end
          else
          if StrPas(TableType) = szDBASE then
          begin
            DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
            DBRslt := DbiPackTable(hDb, nil, TableName, TableType, True);
            PublishBDEResult(DBRslt);
            Result := (DBRslt = DBIERR_NONE);
          end;

        end
        else
          Result := False;

      finally { Close the database object }
        DbiCloseDatabase(hDb);
        if (TblDesc.pSECDesc <> nil) then
          FreeMem(TblDesc.pSECDesc, (TblDesc.iSecRecCount * SizeOf(SECDesc)));
        if (TblDesc.pecrSecOp <> nil) then
          FreeMem(TblDesc.pecrSecOp, (TblDesc.iSecRecCount * SizeOf(CROpType)));
      end;
    end
    else
      Result := False;
  finally
    { if table protection copy was made, restore on error ... else delete }
    if Protect then
    begin
      if not Result then
      begin
        if not DBCopyTableFileIO(ExtractFilePath(TmpFilePath), strTableName, strDataBase, strTableName) then
          LastDBErrorString := LastDBErrorString +
                               ' Unable to restore original table (copy left in ''' +
                               Session.PrivateDir + '\' + strTableName + ''').';
      end
      else
        DBDeleteTableFileIO(ExtractFilePath(TmpFilePath), strTableName);
    end;
  end;
end;


(*
*******************************************************************************
  Table Check & Repair Functions
*******************************************************************************
*)

{ DBCheckIndexes -- check all table indices (see help for complete description) }
function DBCheckIndexes(strDataBase, strTableName: String; var IndexList: TStringList) : Boolean;
var
  hDb        : hDbiDb;
  TCur       : hDBICur;
  IndexDesc  : IDXDesc;
  IndexName  : String;
  strIndexOK : String;
  DBRslt     : DBIResult;
  DBName     : DBIPATH;
  TableName  : DBITBLNAME;
begin
  Result := True;  { Assume good index for now }

  { Open a NULL database handle }
  DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
  PublishBDEResult(DBRslt);
  if DBRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DBRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        { Get Index details }
        DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
        DBRslt := DbiOpenIndexList(hDb, TableName, nil, TCur);
        PublishBDEResult(DBRslt);
        if DBRslt = DBIERR_NONE then
        begin
          try
            { Position to First Record }
            DBRslt := DbiSetToBegin(TCur);
            PublishBDEResult(DBRslt);
            if DBRslt = DBIERR_NONE then
            begin
              { Iterate through cursor checking the index property }
              while DbiGetNextRecord(TCur, dbiNOLOCK, @IndexDesc, nil) = DBIERR_NONE do
              begin
                IndexName := StrPas(IndexDesc.szName);
                if IndexName = '' then
                  Indexname := 'Primary';

                if not IndexDesc.bOutofDate then
                  strIndexOK := ' Index Integrity OK'
                else
                  strIndexOK := ' Index is out of date and should be regenerated.';

                { build string list containing item for each index and string result }
                IndexList.Add(IndexName + strIndexOK);

                if IndexDesc.bOutofDate then
                  Result := False;
              end;
            end
            else
              Result := False;
          finally
            DbiCloseCursor(TCur); { close cursor }
          end;
        end
        else
          Result := False;
      end
      else
        Result := False;
    finally
      DbiCloseDatabase(hDb); { close database object }
    end;
  end
  else
    Result := False;
end;

{ DBCheckTable -- check table and index integrity (see help for complete description) }
function DBCheckTable(strDataBase, strTableName, strErrorTable, strPassword: String;
                      var strResult: String; VerifyOptions: Integer) : Boolean;
var
  TablePath     : DBITBLNAME;
{$IFDEF WIN32}
  ErrorLevel    : Integer;
{$ELSE}
  ErrorLevel    : Word;
{$ENDIF}
  TableType     : DBINAME;
  DBRslt        : DBIResult;
  pPassword     : PChar;
  NativeStr     : DBITBLNAME;
  ErrorTblName  : DBITBLNAME;
begin
  Result := False; { Assume failure for now }
  strResult := '';

  { Convert Password }
  if strPassword <> '' then
    pPassWord := AnsiToNative(Session.Locale, strPassword, Nativestr, SizeOf(DBITBLNAME) -1)
  else
    pPassWord := nil;

  TableType := DBGetTableType(strTableName);

  FBDEUtil := TBDEUtil.Create;
  try

    DBAnsiToNative((AddSlash(strDataBase) + strTableName), TablePath, (SizeOf(TablePath) - 1));
    DBRslt := TUExit(FBDEUtil.vHtSes);
    PublishBDEResult(DBRslt);
    if DBRslt = DBIERR_NONE then
    begin
      DBRslt := TUInit(FBDEUtil.vHtSes);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        FBDEUtil.RegisterCallBack(tcbtVerify);
        try
          DBAnsiToNative(strErrorTable, ErrorTblName, (SizeOf(ErrorTblName) - 1));
          try
            DBRslt := TUVerifyTable(FBDEUtil.vHtSes, KillExt(TablePath), TableType, ErrorTblName, pPassword,
                                    VerifyOptions, ErrorLevel);
          except
            { have seen exceptions within TUVerifyTable ... trap and return unknown OS error }
            { Sometimes a page fault results and even this trap can't keep app from coming down }
            DBRslt := DBIERR_OSUNKNOWN;
          end;
          PublishBDEResult(DBRslt);
          if DBRslt = DBIERR_NONE then
          begin
            case ErrorLevel of
              0: begin
                   strResult := 'Verification Completed. Table has no errors';
                   Result := True;
                 end;
              1: strResult := 'Verification Completed. Table is damaged';
              2: strResult := 'Verification could not be completed. Table is damaged';
              3: strResult := 'Verification could not be completed. Table must be rebuilt manually';
              4: strResult := 'Verification could not be completed. Table cannot be rebuilt';

            else
              strResult := 'Verification unsuccessful';
            end;
          end
          else
            strResult := LastDBErrorString;
        finally
          FBDEUtil.UnRegisterCallBack(tcbtVerify);
        end;
      end
      else
        strResult := LastDBErrorString;
    end
    else
      strResult := LastDBErrorString;

  finally
    FBDEUtil.Free;
  end;
end;

{ DBRebuildIndexes -- rebuild all table indices (see help for complete description) }
function DBRebuildIndexes(strDataBase, strTableName: string;  var strError: string): Boolean;
var
  hDb         : hDbiDb;
  TCur        : hDBICur;
  DBRslt      : DBIResult;
  DBName      : DBIPATH;
  TableName   : DBITBLNAME;
begin
  Result := False; { Assume Failure for now }
  strError := '';

  { Open a NULL database handle }
  DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
  PublishBDEResult(DBRslt);
  if DBRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DBRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        { Get Table Cursor }
        DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
        DBRslt := DbiOpenTable(hDb, TableName, nil, nil, nil, 0, dbiREADWRITE, dbiOPENEXCL,
                               xltFIELD, TRUE, nil, TCur);
        PublishBDEResult(DBRslt);
        if DBRslt = DBIERR_NONE then
        begin
          try
            { Regen All Indices }
            DBRslt := DbiRegenIndexes(TCur);
            PublishBDEResult(DBRslt);
            Result := DBRslt = DBIERR_NONE;
            if (not Result) then
              strError := LastDBErrorString;
          finally
            DbiCloseCursor(TCur);
          end;
        end
        else
          strError := LastDBErrorString;
      end
      else
        strError := LastDBErrorString;
    finally
      DbiCloseDatabase(hDb); { close database object }
    end;
  end
  else
    strError := LastDBErrorString;

end;

{ DBRebuildTable -- rebuild a table (see help for complete description) }
function DBRebuildTable(strDataBase, strTableName, strCloneTable, strErrorTable, strBackupTable,
                 strKeyViolTable, strProblemTable, strPassword: String; var strResult: String) : Boolean;
var
  TablePath       : DBITBLNAME;
  iFld, iIdx, iSec, iVal, iRI, iOptP, iOptD: word;
  DBRslt          : DBIResult;
{$IFDEF WIN32}
  ErrorLevel      : Integer;
{$ELSE}
  ErrorLevel      : Word;
{$ENDIF}
  TblDesc         : CRTBlDesc;
  TableType       : DBINAME;
  pPassword       : PChar;
  NativeStr       : DBITBLNAME;
  ErrorTblName   : DBITBLNAME;
  CloneTblName    : DBITBLNAME;
  BackupTblName   : DBITBLNAME;
  KeyViolTblName  : DBITBLNAME;
  ProblemTblName  : DBITBLNAME;
{$IFDEF WIN32}
  hDb             : hDbiDB;
  TmpCursor       : hdbicur;
  SrcDBPath       : DBIPATH;
  tmpSecDesc      : SECDesc;
  ptmpSecDesc     : pSECDesc;
  TmpCount        : LongInt;
{$ENDIF}
{$IFNDEF WIN32}
  VersionInfo     : TFileVersionRecord;
{$ENDIF}
begin
  Result := False; { Assume failure for now }
  strResult := '';

  { Convert Password }
  if strPassword <> '' then
  begin
    DBAnsiToNative(strPassword, NativeStr, (SizeOf(NativeStr) -1));
    pPassWord := NativeStr;
  end
  else
    pPassWord := nil;

  TableType := DBGetTableType(strTableName);

  FBDEUtil := TBDEUtil.Create;
  try
    DBRslt := TUExit(FBDEUtil.vHtSes);
    PublishBDEResult(DBRslt);
    if DBRslt = DBIERR_NONE then
    begin
      DBRslt := TUInit(FBDEUtil.vHtSes);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        DBAnsiToNative((AddSlash(strDataBase) + strTableName), TablePath, (SizeOf(TablePath) - 1));
        FBDEUtil.RegisterCallBack(tcbtVerify);
        try
          DBAnsiToNative(strErrorTable, ErrorTblName, (SizeOf(ErrorTblName) - 1));
          try
            DBRslt := TUVerifyTable(FBDEUtil.vHtSes, KillExt(TablePath), TableType, ErrorTblName,
                                    pPassword, 0, ErrorLevel);
          except
            { have seen exceptions within TUVerifyTable ... trap and return unknown OS error }
            { Sometimes a page fault results and even this trap can't keep app from coming down }
            DBRslt := DBIERR_OSUNKNOWN;
          end;
          PublishBDEResult(DBRslt);
        finally
          FBDEUtil.UnRegisterCallBack(tcbtVerify);
        end;
        FBDEUtil.RegisterCallBack(tcbtRebuild);
        try
          if DBRslt = DBIERR_NONE then
          begin
            DBAnsiToNative(strCloneTable, CloneTblName, (SizeOf(CloneTblName) - 1));
            DBRslt := TUGetCRTblDescCount(FBDEUtil.vhTSes, KillExt(CloneTblName), iFld, iIdx, iSec,
                                          iVal, iRI, iOptP, iOptD);
            PublishBDEResult(DBRslt);
            if DBRslt = DBIERR_NONE then
            begin
              FillChar(TblDesc, SizeOf(CRTBlDesc), 0);
              StrCopy(TblDesc.szTblName, KillExt(TablePath));
              StrCopy(TblDesc.szTblType, TableType);
              StrPCopy(TblDesc.szErrTblName, '');

              TblDesc.iFldCount := iFld;
              GetMem(TblDesc.pFldDesc, (iFld * SizeOf(FldDesc)));

              TblDesc.iIdxCount := iIdx;
              GetMem(TblDesc.pIdxDesc, (iIdx * SizeOf(IdxDesc)));

              TblDesc.iSecRecCount := iSec; { this comes back corrupted (WIN32 only) ... will refill later }
              GetMem(TblDesc.pSecDesc, (iSec * SizeOf(SecDesc)));

              TblDesc.iValChkCount := iVal; { always seems to come back zero ... doesn't seem to matter }
              GetMem(TblDesc.pvchkDesc, (iVal * SizeOf(VCHKDesc)));

              TblDesc.iRintCount := iRI;    { always seems to come back zero ... doesn't seem to matter }
              GetMem(TblDesc.pRIntDesc, (iRI * SizeOf(RIntDesc)));

              TblDesc.iOptParams := iOptP;
              GetMem(TblDesc.pfldOptParams, (iOptP * sizeOf(FLDDesc)));

              GetMem(TblDesc.pOptData, (iOptD * DBIMAXSCFLDLEN));
              try
                 DBAnsiToNative(strCloneTable, CloneTblName, (SizeOf(CloneTblName) - 1));
                 DBRslt := TUFillCRTblDesc(FBDEUtil.vhTSes, @TblDesc, KillExt(CloneTblName), pPassword);
                 PublishBDEResult(DBRslt);
                 if DBRslt = DBIERR_NONE then
                 begin

{$IFDEF WIN32}
                   { auxilliary security info also comes back corrupted (looks like a
                     "packed record" alignment problem in TUTILITY ... reload }
                   if (iSec > 0) then
                   begin
                     FreeMem(TblDesc.pSecDesc, (iSec * SizeOf(SecDesc)));
                     iSec := 0;  { assume no secondary passwords until we successfully retrieve }
                     TblDesc.iSecRecCount := 0;
                     TblDesc.pSecDesc := nil;
                     DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
                     PublishBDEResult(DBRslt);
                     if DBRslt = DBIERR_NONE then
                     begin
                       try
                         { set the database directory to source for now }
                         DBAnsiToNative(strDatabase, SrcDBPath, (SizeOf(SrcDBPath) - 1));
                         DBRslt := DbiSetDirectory(hDb, SrcDBPath);
                         PublishBDEResult(DBRslt);
                         if DBRslt = DBIERR_NONE then
                         begin
                           DBRslt := DbiOpenSecurityList(hDb, NeedsExt(CloneTblName), nil, TmpCursor);
                           PublishBDEResult(DBRslt);
                           if DBRslt = DBIERR_NONE then
                           begin
                             try
                               DBRslt := DbiSetToBegin(TmpCursor);  { set to start of in-mem table }
                               PublishBDEResult(DBRslt);
                               if DBRslt = DBIERR_NONE then
                               begin
                                 { get record count and allocate structure }
                                 DBRslt := DbiGetRecordCount(TmpCursor, TmpCount);
                                 PublishBDEResult(DBRslt);
                                 if DBRslt = DBIERR_NONE then
                                 begin
                                   iSec := TmpCount;
                                   TblDesc.iSecRecCount := TmpCount;
                                   GetMem(TblDesc.pSECDesc, (TmpCount * SizeOf(SECDesc)));
                                   ptmpSecDesc := TblDesc.pSECDesc;
                                   repeat
                                     DBRslt := DbiGetNextRecord(TmpCursor, dbiNOLOCK, @tmpSecDesc, nil);
                                     if (DBRslt <> DBIERR_EOF) then
                                     begin
                                       ptmpSecDesc^ := tmpSecDesc;
                                       inc(ptmpSecDesc);
                                     end;
                                   until DBRslt <> DBIERR_NONE;
                                   if (DBRslt = DBIERR_EOF) then  { EOF is expected result }
                                     DBRslt := DBIERR_NONE;
                                   PublishBDEResult(DBRslt);
                                 end;
                               end;
                             finally
                               DbiCloseCursor(TmpCursor);
                             end;
                           end;
                         end;
                       finally
                         DbiCloseDatabase(hDb);
                       end;
                     end;
                     if DBRslt <> DBIERR_NONE then  { exit on error }
                     begin
                       strResult := LastDBErrorString;
                       Exit;
                     end;
                   end;
{$ENDIF}

                   DBAnsiToNative(strBackupTable, BackupTblName, (SizeOf(BackupTblName) - 1));
                   DBAnsiToNative(strKeyViolTable, KeyViolTblName, (SizeOf(KeyViolTblName) - 1));
                   DBAnsiToNative(strProblemTable, ProblemTblName, (SizeOf(ProblemTblName) - 1));
{$IFDEF WIN32}
                   { TUTIL32.DLL does not want table name extensions }
                   DBRslt := TURebuildTable(FBDEUtil.vhTSes,
                                            KillExt(TablePath),
                                            TableType,
                                            KillExt(BackupTblName),
                                            KillExt(KeyViolTblName),
                                            KillExt(ProblemTblName),
                                            @TblDesc);
{$ELSE}
                   { TUTILITY.DLL cannot make up its mind }

                   { seems 16-bit TUTILITY requires a backup file }
                   if (StrLen(BackupTblName) = 0) then
                     StrPCopy(BackupTblName, strDataBase + '_TMP.DB');

                   DBGetTutilityVersion(VersionInfo);
                   if (VersionInfo.LSDW_LSW = 52) then  { version for BDE 2.52 ... Paradox 7 }
                   begin
                     DBRslt := TURebuildTable(FBDEUtil.vhTSes,
                                              NeedsExt(TablePath),
                                              TableType,
                                              NeedsExt(BackupTblName),
                                              NeedsExt(KeyViolTblName),
                                              NeedsExt(ProblemTblName),
                                              @TblDesc);
                   end
                   else
                   begin
                     DBRslt := TURebuildTable(FBDEUtil.vhTSes,
                                              KillExt(TablePath),
                                              TableType,
                                              KillExt(BackupTblName),
                                              KillExt(KeyViolTblName),
                                              KillExt(ProblemTblName),
                                              @TblDesc);
                   end;
                   { delete temporary file (does nothing if not present) }
                   DBDeleteTableFileIO(strDataBase, '_TMP.DB');
{$ENDIF}
                   PublishBDEResult(DBRslt);
                   if DBRslt = DBIERR_NONE then
                     Result := True
                   else
                     strResult := LastDBErrorString;
                 end
                 else
                   strResult := LastDBErrorString;
              finally
                with TblDesc do
                begin
                  if (pFldDesc <> nil) then
                    FreeMem(pFldDesc, (iFld * SizeOf(FldDesc)));
                  if (pIdxDesc <> nil) then
                    FreeMem(pIdxDesc, (iIdx * SizeOf(IdxDesc)));
                  if (pSecDesc <> nil) then
                    FreeMem(pSecDesc, (iSec * SizeOf(SecDesc)));
                  if (pvchkDesc <> nil) then
                    FreeMem(pvchkDesc, (iVal * SizeOf(VCHKDesc)));
                  if (pRIntDesc <> nil) then
                    FreeMem(pRIntDesc, (iRI * SizeOf(RIntDesc)));
                  if (pfldOptParams <> nil) then
                    FreeMem(pfldOptParams, (iOptP * sizeOf(FLDDesc)));
                  if (pOptData <> nil) then
                    FreeMem(pOptData, (iOptD * DBIMAXSCFLDLEN));
                end;
              end;
            end
            else
              strResult := LastDBErrorString;
          end
          else
            strResult := LastDBErrorString;

        finally
          FBDEUtil.UnRegisterCallBack(tcbtRebuild);
        end;

      end
      else
        strResult := LastDBErrorString;

    end
    else
      strResult := LastDBErrorString;

  finally
    FBDEUtil.Free;
  end;

  { Delete temporary work files }
  DBDeleteTableFileIO(strDataBase, '');

end;


(*
*******************************************************************************
  Structure File Functions
*******************************************************************************
*)

{ DBCheckStructureFile -- check structure file for errors (see help for complete description) }
function DBCheckStructureFile(strFileName: String; var ResultsList: TStringList; var SRec: TStructureRec): Boolean;
const
  Keywords: array[0..4] of String = ('DBR_BEGIN', 'ALIAS', 'TABLE_START', 'TABLE_END', 'DBR_END');
  STAGE_DATABASE_START = 0;
  STAGE_ALIAS = 1;
  STAGE_TABLE_START = 2;
  STAGE_TABLE_END = 3;
  STAGE_DATABASE_END = 4;
  STAGE_FILE_OK = 5;
var
  F                : TextFile;
  S                : String;
  strResult        : String;
  Stage            : Byte;
  TableCount       : Integer;
  TablesProcessed  : Integer;

       function CheckLine(Line: String; var Stage: Byte; var strResult: String): Boolean;
       var
         strWork      : String;
         strAlias     : String;
         strPath      : String;
         TablePacket  : TStringList;
       begin
         Result := False; { Assume failure for now }
         strResult := '';

         case Stage of
           STAGE_DATABASE_START: begin  { DBR_BEGIN }
                Result := CompareText(line, KeyWords[Stage]) = 0;
                if Result then
                  Inc(Stage);
              end;
           STAGE_ALIAS: begin { ALIAS }
                strWork := Copy(line, 0, 5);
                { ALIAS STATEMENT FOUND, check rest of line for valid alias }
                if Comparetext(strWork, KeyWords[Stage]) = 0 then
                begin
                  Result := DBStructGetAlias(Line, strAlias, strPath);
                  if Result = False then
                    strResult := 'Invalid ALIAS'
                  else
                  begin
                    SREc.AliasName := strAlias;
                    SRec.AliasPath := strPath;
                    Inc(Stage);
                  end;
                end;
              end;
           STAGE_TABLE_START: begin { TABLE_START }
                if Comparetext(line, KeyWords[Stage]) = 0 then { TABLE START STATEMENT FOUND }
                begin
                  Stage := STAGE_TABLE_END;
                  TablePacket := TStringList.Create;
                  try
                    { read file until next table end marker is found and build table description packet }
                    strWork := '';
                    while (CompareText(strWork, 'TABLE_END') <> 0) and (Not EOF(F)) do
                    begin
                      Readln(F, strWork);

                      if CompareText(strWork, 'TABLE_END') = 0 then { END market found }
                      begin
                        Inc(TablesProcessed);
                        if TablesProcessed < TableCount then
                          Stage := STAGE_TABLE_START;
                        { Process Packet }
                        Result := DBStructProcessTable(TablePacket, strResult, (TablesProcessed - 1), SRec);
                        if not Result then
                          Break;
                      end
                      else
                      begin
                        { Add line to Table Packet }
                        if strWork <> '' then
                          TablePacket.Add(strWork);
                      end;

                    end;
                    if TablesProcessed = TableCount then { Move onto the next stage }
                      Inc(Stage);
                  finally
                    TablePacket.Free;
                  end;
                end;
              end;
           STAGE_DATABASE_END: begin  { DBR_END }
                Result := CompareText(line, KeyWords[Stage]) = 0;
                if Result then
                  Inc(Stage);
              end;

         end; { Case }

       end;

begin
  { Init }
  Stage := 0;
  TableCount := 0;
  TablesProcessed := 0;
  ClearStructureRec(SRec);

  { CurrentKeyWord denotes what keyword should appear next in structure file. }

  S := '';

  { Check that the table exists }
  if not FileExists(strFileName) then
  begin
    Result := False;
    ResultsList.Add(strFileName + ' file does not exist.');
    Exit;
  end;

  { Open File }
  AssignFile(F, strFileName);
  try
    Reset(F);
    { Count the number of TABLE_START }
    while not EOF(F) do
    begin
      Readln(F, S);
      if CompareText(S, 'TABLE_START') = 0 then
        Inc(TableCount);
    end;

    { Move back to first line ... have seen 'reset' alone not work on certain
      OS configurations, so close and reopen to be sure }
    CloseFile(F);
    AssignFile(F, strFileName);
    Reset(F);

    while Not EOF(F) do
    begin
      Readln(F, S);

      if not CheckLine(S, Stage, strResult) then
      begin
        if strResult <> '' then
        begin
          ResultsList.Add('Error Found in structure file: ' + strResult);
          strResult := '';
        end;
      end;

    end; { while }
  finally
    CloseFile(F);

    if Stage <> STAGE_FILE_OK then
      ResultsList.Add('Expected keyword: ' + KeyWords[Stage] + ' not found.');

    Result := (ResultsList.Count = 0);
  end;

end;

{ DBConfigureTableStructure --  configure Table Definition from structure file (see
  help for complete description) }
function DBConfigureTableStructure(strDataBase, strTableName, strStructureFile: string;
                                   var Tbl: TTable; var SpecialInfo: TDBTableSpecialInfo): Boolean;
var
  F                : TextFile;
  S                : String;
  strWork          : String;
  TablePacket      : TStringList;
  i,i2             : Integer;
  CurrentTableName : String;
  strDesc          : String;
  line             : Integer;
  SubType          : Word;
  { field entries }
  strFieldName     : String;
  strFieldType     : String;
  strRequired      : String;
  FieldSize        : Integer;
  { Index Entries }
  strIndexName     : String;
  strIndexFields   : String;
  strOptions       : String;
  strIndexOption   : String;
  IndexOption      : TIndexOptions;
begin
  Result := False; { assume failure for now }

  { init special info structure }
  with SpecialInfo do
  begin
    AutoIncFieldIndex := 0;  { assume no autoinc field for now }
  end;

  { Check if the structure file exists }
  if not FileExists(strStructureFile) then
  begin
    if VerboseDBResponse then
      MessageDlg('Invalid structure file [' + strStructureFile + '], file does not exist.',
                 mtInformation, [mbOK], 0);
    Exit;
  end;

  { scan structure file for TABLE_START tokens }

  { Open File }
  AssignFile(F, strStructureFile);
  try
    Reset(F);
    { Count the number of 'TABLE_START ' tokens and entract table packet }
    while not EOF(F) do
    begin
      Readln(F, S);

      if CompareText(S, 'TABLE_START') = 0 then { Read lines from file until TABLE_END marker }
      begin
        TablePacket := TStringlist.create;
        try
          while (CompareText(S, 'TABLE_END') <> 0) and (Not EOF(F)) do
          begin
            Readln(F, S);
            if (S <> '') and (S <> 'TABLE_END') then
              TablePacket.Add(S);
          end;

          { Get Table name from packet }
          for i := 0 to TablePacket.Count -1 do
          begin
            { test the first five characters and determin if line is TABLE definition,
              FIELD definition or INDEX definition }
            strWork := Copy(TablePacket[i], 0, 5);
            if CompareText(strWork, 'TABLE') = 0 then
            begin
              if not DBStructGetTableName(TablePacket[i], CurrentTableName, strDesc) then
              begin
                if VerboseDBResponse then
                  MessageDlg('An Error occurred during structure file processing: invalid table header entry.',
                             mtInformation, [mbOK], 0);
              end
              else { is this the table we are looking for? }
              begin
                if CompareText(CurrentTableName, strTableName) = 0 then
                begin { process table definition entries }
                  Result := True; { set to success for now }
                  for line := 0 to TablePacket.Count -1 do
                  begin
                    strWork := Copy(TablePacket[line], 0, 5);
                    if CompareText(strWork, 'FIELD') = 0 then { Field entry found }
                    begin
                      if not DBStructGetField(TablePacket[line], strFieldName, strFieldType,
                                                                   strRequired, FieldSize, SubType) then
                      begin
                        Result := False;
                        if VerboseDBResponse then
                          MessageDlg('Invalid Field Definition [' + TablePacket[line] + ']',
                                     mtInformation, [mbOK], 0);
                        Exit;
                      end
                      else
                      begin { good entry, map to table definitions }
                        { Get the ordinal position of the FieldType }
                        for i2 := 0 to High(strDataType) do
                          if CompareText(strDataType[i2], strFieldType) = 0 then
                            Break; { loop integer 'i2' will contain the ordinal field type }
                        if strRequired = 'True' then
                          Tbl.FieldDefs.add(strFieldName, TFieldType(i2), FieldSize, True)
                        else
                          Tbl.FieldDefs.add(strFieldName, TFieldType(i2), FieldSize, False);
                        { set autoinc field index special condition if present }
                        if (SubType = fldstAUTOINC) then
                          SpecialInfo.AutoIncFieldIndex := Tbl.FieldDefs.Count;
                      end;
                    end
                    else
                    if CompareText(strWork, 'INDEX') = 0 then { Index entry found }
                    begin
                      if not DBStructGetIndex(TablePacket[line], strIndexName, strIndexFields, strOptions) then
                      begin
                        Result := False;
                        if VerboseDBResponse then
                          MessageDlg('Invalid Index Definition [' + TablePacket[line] + ']',
                                     mtInformation, [mbOK], 0);
                        Exit;
                      end
                      else
                      begin { good entry, map to table definitions }
                        if strIndexName = '' then
                          strIndexName := 'Primary';

                        { Build Options from string }
                        strIndexOption := '';
                        IndexOption := [];

                        while strIndexOption <> strOptions do
                        begin
                          strIndexOption := RemoveFirstWord(strOptions, '+');
                          if CompareText(strIndexOption, 'ixPrimary') = 0 then
                            IndexOption := IndexOption + [ixPrimary]
                          else if CompareText(strIndexOption, 'ixUnique') = 0 then
                            IndexOption := IndexOption + [ixUnique]
                          else if CompareText(strIndexOption, 'ixDescending') = 0 then
                            IndexOption := IndexOption + [ixDescending]
                          else if CompareText(strIndexOption, 'ixExpression') = 0 then
                            IndexOption := IndexOption + [ixExpression]
                          else if CompareText(strIndexOption, 'ixCaseInsensitive') = 0 then
                            IndexOption := IndexOption + [ixCaseInsensitive];
                        end;

                        Tbl.IndexDefs.add(strIndexName, strIndexFields, IndexOption)

                      end;
                    end;
                  end;

                end;

              end;
            end;
          end;

        finally
          TablePacket.Free;
        end;
      end;

    end;

  finally
    CloseFile(F);
  end;

end;

{ DBCreateTableFromStructure -- create table from ASCII structure file (see help for complete description) }
function DBCreateTableFromStructure(strDataBase, strTableName, strStructureFile: String): Boolean;
const
{$IFDEF WIN32}
  MAX_VCHK_FIELDS = 159;  { upper limit found in Borland's TI2751 }
{$ELSE}
  MAX_VCHK_FIELDS = 63;   { upper limit found in Borland's TI2751 }
{$ENDIF}
var
  MemSize      : Integer;
  curProp      : CURProps;
  pFldDes      : pFldDesc;
  pIdxDes      : pIdxDesc;
  pValDes      : pVCHKDesc;
  pWorkValDes  : pVCHKDesc;
  DBRslt       : DBIResult;
  TblDesc      : CRTblDesc;
  hDb          : hDbiDb;
  TmpTbl       : TTable;
  i            : Integer;
  TblType      : DBINAME;
  DBName       : DBIPATH;
  SpecialInfo  : TDBTableSpecialInfo;
begin
  Result := False; { Assume Failure for now }

  { First get the basic table structure from the structure file }
  TmpTbl := TTable.Create(Application);
  try
    { Setup StructureTable Table }
    with TmpTbl do
    begin
      DataBaseName := strDataBase;
      TblType := DBGetTableType(strTableName);
      if StrPas(TblType) = szPARADOX then
        TableName := '_TMP.DB'
      else
        TableName := '_TMP.DBF';
    end;

    if not DBConfigureTableStructure(strDataBase, strTableName, strStructureFile,
                                     TmpTbl, SpecialInfo) then
    begin
      if VerboseDBResponse then
        MessageDlg('Cannot restructure table. An error occurred during structure file processing. '
                   + 'No changes have been made.', mtInformation, [mbOK], 0);
      Result := False;
      Exit;
    end;

    { create a temp table }
    DBCreateTable(TmpTbl, SpecialInfo);
    try
      TmpTbl.Open;
      try

        try
          DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
          PublishBDEResult(DBRslt);
          if DBRslt = DBIERR_NONE then
          begin
            { set the database directory }
            DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
            DBRslt := DbiSetDirectory(hDb, DBName);
            PublishBDEResult(DBRslt);
            if DBRslt = DBIERR_NONE then
            begin
              DBRslt := DbiGetCursorProps(TmpTbl.Handle, curProp);
              PublishBDEResult(DBRslt);
              if DBRslt = DBIERR_NONE then
              begin
                pFldDes := nil;
                pIdxDes := nil;
                pValDes := nil;
                try
                  FillChar(TblDesc, SizeOf(CRTblDesc), #0);

                  MemSize := curProp.iFields * SizeOf(FLDDesc);
                  pFldDes := AllocMem(MemSize);

                  MemSize := curProp.iIndexes * SizeOf(IDXDesc);
                  pIdxDes := AllocMem(MemSize);

                  MemSize := curProp.iValChecks * SizeOf(VCHKDesc);
                  pValDes := AllocMem(MemSize);

                  { Get field descriptor }
                  DBRslt := DbiGetFieldDescs(TmpTbl.Handle, pFldDes);
                  PublishBDEResult(DBRslt);
                  if DBRslt = DBIERR_NONE then
                  begin

                    { Get Index Descriptor }
{$IFDEF WIN32}
                    DBRslt := DbiGetIndexDescs(TmpTbl.Handle, pIdxDes);
{$ELSE}
                    DBRslt := DbiGetIndexDescs(TmpTbl.Handle, pIdxDes^);
{$ENDIF}
                    PublishBDEResult(DBRslt);
                    if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_NOTINDEXED) then
                    begin
                      DBRslt := DBIERR_NONE;  { clear and republish error result }
                      PublishBDEResult(DBRslt);

                      { Get Validity check Descriptor }
                      pWorkValDes := pValDes;
                      for i := 1 to CurProp.iValChecks do
                      begin
                        DBRslt := DbiGetVchkDesc(TmpTbl.Handle, i, pWorkValDes);
                        PublishBDEResult(DBRslt);
                        inc(pWorkValDes);
                      end;

                      if DBRslt = DBIERR_NONE then
                      begin
                        StrPCopy(TblDesc.szTblName, strTableName);
                        StrCopy(TblDesc.szTblType, TblType);

                        { Fields }
                        TblDesc.iFldCount := curProp.iFields;
                        TblDesc.pfldDesc := pFldDes;

                        { Indices }
                        TblDesc.iIdxCount := curProp.iIndexes;
                        TblDesc.pIdxDesc := pIdxDes;

                        { Validity Checks }
                        TblDesc.iValChkCount := curProp.iValChecks;
                        TblDesc.pvChkDesc := pValDes;

                        { Create Table }
                        DBRslt := DbiCreateTable(hDb, True, TblDesc);
                        PublishBDEResult(DBRslt);
                        Result := DBRslt = DBIERR_NONE;
                      end;
                    end;
                  end;
                finally
                  if (pFldDes <> nil) then
                    FreeMem(pFldDes, (curProp.iFields * SizeOf(FLDDesc)));
                  if (pIdxDes <> nil) then
                    FreeMem(pIdxDes, (curProp.iIndexes * SizeOf(IDXDesc)));
                  if (pValDes <> nil) then
                    FreeMem(pValDes, (curProp.iValChecks * SizeOf(VCHKDesc)));
                end;
              end;
            end;
          end;
        except
          on E: EDataBaseError do
          begin
            Result := False;
            LastDBErrorString := E.Message;
            { Re Raise Exception so that it is passed back to the Calling function }
            if ReRaiseDBExceptions then
             raise;
          end;
        end;

      finally
        TmpTbl.Close;
      end;

    finally
      TmpTbl.DeleteTable;
    end;
  finally
    TmpTbl.Free;
  end;

end;

{ DBStructGetAlias -- returns ALIAS and ALIAS Description from String (see help for complete description) }
function DBStructGetAlias(S: String; var strAlias, strPath: String): Boolean;
var
  strWork : String;
begin
  { Init }
  strAlias := '';
  strPath := '';

  strWork := Copy(S, 0, 5); { read the first 5 characters into strWork }

  if Comparetext(strWork, 'ALIAS') = 0 then { ALIAS STATEMENT FOUND, check rest of line for valid alias }
  begin
    { ALIAS line should look like - ALIAS 'ALIAS' 'DESCRIPTION' }

    { drop the first 5 characters from the string }
    S := Copy(S, 6, length(S) -5);

    { Break up remaining string }
    repeat
      strWork := RemoveFirstWord(S, '''');

      if (strWork <> '') and (strWork <> ' ') then
      begin
        if strAlias = '' then { assign first string to ALIAS }
          strAlias := strWork
        else if strPath = '' then { assign second string to Path }
          strPath := strWork;
      end;

    until strWork = S;
  end;

  Result := (strAlias <> '') and (strPath <> '');

end;

{ DBStructGetField -- returns Field Structure from string (see help for complete description) }
function DBStructGetField(S: String; var strFieldName, strFieldType, strRequired: String;
                          var FieldSize: Integer; var SubType: Word): Boolean;
const
{$IFDEF WIN32}
  ValidFieldTypes = 'ftUnknown;ftString;ftSmallInt;ftInteger;ftWord;ftBoolean;ftFloat;'
                    + 'ftCurrency;ftBCD;ftDate;ftTime;ftDateTime;ftBytes;ftVarBytes;'
                    + 'ftAutoInc;ftBlob;ftMemo;ftGraphic;ftFmtMemo;ftParadoxOle;ftDBaseOle;'
                    + 'ftTypedBinary';
{$ELSE}
  ValidFieldTypes = 'ftUnknown;ftString;ftSmallInt;ftInteger;ftWord;ftBoolean;ftFloat;'
                    + 'ftCurrency;ftBCD;ftDate;ftTime;ftDateTime;ftBytes;ftVarBytes;'
                    + 'ftBlob;ftMemo;ftGraphic;ftFmtMemo';
{$ENDIF}

var
  strWork   : String;
  Delimiter : Char;
begin
  { Init }
  strFieldName := '';
  strFieldType := '';
  FieldSize := -1;
  strRequired := '';
  SubType := 0;

  strWork := Copy(S, 0, 5); { read the first 5 characters into strwork }

  if Comparetext(strWork, 'FIELD') = 0 then { FIELD STATEMENT FOUND, check rest of line for valid Table }
  begin
    { FIELD line should look like - FIELD 'FieldName' FieldType Size Required }

    { drop the first 5 characters from the string }
    S := Copy(S, 6, length(S) -5);

    { Set Delimiter }
    Delimiter := '''';
    { Break up remaining string }
    repeat
      strWork := RemoveFirstWord(S, Delimiter);

      if (strWork <> '') and (strWork <> ' ') then
      begin
        if strFieldName = '' then { assign first string to FieldName }
        begin
          strFieldName := strWork;
          { reset delimiter }
          delimiter := ' ';
        end
        else
        if strFieldType = '' then { assign second string to FieldType }
        begin
{$IFNDEF WIN32}
          { convert autoinc fields to ftInteger }
          if (strWork = 'ftAutoInc') then
          begin
            strWork := 'ftInteger';
            SubType := fldstAUTOINC;  { flag autoinc field type }
          end;
{$ENDIF}
          if pos(UpperCase(strWork), UpperCase(ValidFieldTypes)) > 0 then
            strFieldType := strWork
          else
          begin
            Result := False;
            Exit;
          end;
        end
        else
        if FieldSize = -1 then { assign Third string to FieldSize }
        begin
          try
            FieldSize := StrToInt(strWork)
          except
            Result := False;
            Exit;
          end;
        end
        else
          if (CompareText(strWork, 'True') = 0) or (CompareText(strWork, 'False') = 0) then
            strRequired := strWork;

      end;

    until strWork = S;
  end;

  Result := (strFieldName <> '') and (strFieldType <> '') and (FieldSize <> -1) and (strRequired <> '');

end;

{ DBStructGetIndex -- returns Index Structure from string (see help for complete description) }
function DBStructGetIndex(S: String; var strIndexName, strIndexFields, strOptions: String): Boolean;
var
  strWork   : String;
  Delimiter : Char;
begin
  { Init }
  strIndexName := '';
  strIndexFields := '';
  strOptions := '';

  strWork := Copy(S, 0, 5); { read the first 5 characters into strwork }

  if Comparetext(strWork, 'INDEX') = 0 then { INDEX STATEMENT FOUND, check rest of line for valid Index }
  begin
    { INDEX line should look like - INDEX 'INDEXName' 'Index Fields' Options }

    { drop the first 5 characters from the string }
    S := Copy(S, 6, length(S) -5);

    { Set Delimiter }
    Delimiter := '''';
    { Break up remaining string }
    repeat
      strWork := RemoveFirstWord(S, Delimiter);

      if (strWork <> '') and (strWork <> ' ') then
      begin
        if strIndexName = '' then { assign first string to IndexName }
          strIndexName := strWork
        else
        if strIndexFields = '' then { assign second string to IndexFields }
        begin
          strIndexFields := strWork;
          { reset delimiter }
          delimiter := ' ';
        end
        else { finally the options }
          strOptions := strWork;

      end;

    until strWork = S;
  end;

  Result := (strIndexName <> '') and (strIndexFields <> '');

end;

{ DBStructGetTableName -- returns TableName and Table Description from structure string
  (see help for complete description) }
function DBStructGetTableName(S: String; var strTableName, strDesc: String): Boolean;
var
  strWork : String;
begin
  { Init }
  strTableName := '';
  strDesc := '';
  Result := False; { assume failure for now }

  strWork := Copy(S, 0, 5); { read the first 5 characters into strwork }

  if Comparetext(strWork, 'TABLE') = 0 then { TABLE STATEMENT FOUND, check rest of line for valid Table }
  begin
    { TABLE line should look like - TABLE 'TABLENAME' 'DESCRIPTION' }

    { drop the first 5 characters from the string }
    S := Copy(S, 6, length(S) -5);

    { Break up remaining string }
    repeat
      strWork := RemoveFirstWord(S, '''');

      if (strWork <> '') and (strWork <> ' ') then
      begin
        if strTableName = '' then { assign first string to TableName }
        begin
          strTableName := strWork;
          Result := True; { only a good TableName is required, description is optional }
        end
        else if strDesc = '' then { assign second string to Description }
          strDesc := strWork;
      end;

    until strWork = S;
  end;

end;

{ DBRestructureTable --  restructure a table (see help for complete description) }
function DBRestructureTable(strDataBase, strTableName, strStructureFile: String;
                            FOptype: array of CROptype; IOptype: array of CROptype;
                            var pFldDes: pFldDesc): Boolean;
var
  StructureTable  : TTable;
  TargetTable     : TTable;
  hDb             : hDbiDb;
  CursorProps     : CurProps;
  FDesc           : pFldDesc;
  IDesc           : PIdxDesc;
  pVDesc          : pVCHKDesc;
  FmemSize, ImemSize, VMemSize : Integer;
  TblDesc         : CRTblDesc;
  DBRslt          : DBIResult;
  DBName          : DBIPATH;
  WorkTableType   : DBINAME;
  SpecialInfo     : TDBTableSpecialInfo;
begin
  Result := False; { Assume Failure for now }

  try
    { First get the table structure from the structure file }
    StructureTable := TTable.Create(Application);
    try
      TargetTable := TTable.Create(Application);
      try
        { Setup StructureTable Table }
        with StructureTable do
        begin
          DataBaseName := strDataBase;
          WorkTableType := DBGetTableType(strTableName);
          if StrPas(WorkTableType) = szPARADOX then
            TableName := '_TMP.DB'
          else
            TableName := '_TMP.DBF';
        end;

        { Setup TargetTable Table, this is only used to drop existing indices using
          the Delphi call 'DeleteIndex' }
        with TargetTable do
        begin
          DataBaseName := strDataBase;
          TableName := strTableName;
          Exclusive := True;
          Open;
        end;

        if not DBConfigureTableStructure(strDataBase, strTableName, strStructureFile,
                                         StructureTable, SpecialInfo) then
        begin
          if VerboseDBResponse then
            MessageDlg('Cannot restructure table. An error occurred during structure file processing. '
                       + 'No changes have been made.', mtInformation, [mbOK], 0);
          Result := False;
          Exit;
        end;

        { create a temp table }
        DBCreateTable(StructureTable, SpecialInfo);
        StructureTable.Open;
        try
          { Open a NULL database handle }
          DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
          PublishBDEResult(DBRslt);
          if DBRslt = DBIERR_NONE then
          begin

            try
              { set the database directory }
              DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
              DBRslt := DbiSetDirectory(hDb, DBName);
              PublishBDEResult(DBRslt);
              if DBRslt = DBIERR_NONE then
              begin
                { get table cursor properties }
                DBRslt := DbiGetCursorProps(StructureTable.Handle, CursorProps);
                PublishBDEResult(DBRslt);
                if DBRslt = DBIERR_NONE then
                begin
                  { Alocate memory for field descriptor }
                  FmemSize := (CursorProps.iFields) * SizeOf(FLDDesc);
                  FDesc := AllocMem(FmemSize);
                  try
                    { Alocate memory for Index descriptor }
                    ImemSize := (CursorProps.iIndexes) * SizeOf(IDXDesc);
                    IDesc := AllocMem(ImemSize);
                    try
                      { Alocate memory for Validity check descriptor }
                      VMemSize := (CursorProps.iValChecks) * SizeOf(pVDesc);
                      pVDesc := AllocMem(VMemSize);
                      try
                          { Get Field descriptions }
                          DBRslt := DbiGetFieldDescs(StructureTable.Handle, FDesc);
                          PublishBDEResult(DBRslt);
                          if DBRslt = DBIERR_NONE then
                          begin
                              { Get Index descriptions }
{$IFDEF WIN32}
                              DBRslt := DbiGetIndexDescs(StructureTable.Handle, IDesc);
{$ELSE}
                              DBRslt := DbiGetIndexDescs(StructureTable.Handle, IDesc^);
{$ENDIF}
                              PublishBDEResult(DBRslt);
                              if (DBRslt = DBIERR_NONE) Or (DBRslt = DBIERR_NOTINDEXED) then
                              begin
                                FillChar(TblDesc, SizeOf(CRTblDesc), #0);
                                StrPCopy(TblDesc.szTblName, strTableName);
                                TblDesc.szTblType := DBGetTableType(strTableName);

                                { free FDesc allocation before reusing pointer }
                                if (FDesc <> nil) then
                                  FreeMem(FDesc, FMemSize);

                                { Compare the tables to ensure that the OPtype structures are correct }
                                DBCompareTables(TargetTable, StructureTable, FOpType, IOpType, FDesc);

                                { Set Table properties }

                                { Fields }
                                with TblDesc do
                                begin
                                  iFldCount := CursorProps.iFields;
                                  pecrFldOp := @FOpType;
                                  pfldDesc := FDesc;
                                  { Indices }
                                  iIdxCount := CursorProps.iIndexes;
                                  pecrIdxOp := @IOpType;
                                  pIdxDesc := IDesc;
                                end;

                                { Delete all existing indexes prior to the restructure }
                                with TargetTable do
                                begin
                                  IndexDefs.Update;
                                  while IndexDefs.Count > 0  do
                                  begin
                                    { must delete primary index last }
                                    if (IndexDefs.Count = 1) Or (IndexDefs.Items[0].Name <> '') then
                                      DeleteIndex(IndexDefs.Items[0].Name)
                                    else
                                      DeleteIndex(IndexDefs.Items[1].Name);
                                    IndexDefs.Update;
                                  end;
                                  Close;
                                end;

                                { Do the restructure }
                                DBRslt := DbiDoRestructure(Hdb, 1, @TblDesc, nil, nil, nil, False);
                                PublishBDEResult(DBRslt);
                                Result := DBRslt = DBIERR_NONE;

                                { assign FDesc field list pointer to calling param and invalidate FDesc}
                                pFldDes := FDesc;
                                FDesc := nil;

                              end;
                          end;
                      finally
                        if (pVDesc <> nil) then
                          FreeMem(pVDesc, VMemSize);
                      end;
                    finally
                      if (IDesc <> nil) then
                        FreeMem(IDesc, IMemSize);
                    end;
                  finally
                    if (FDesc <> nil) then
                      FreeMem(FDesc, FMemSize);
                  end;

                end;
              end;
            finally
              DbiCloseDatabase(hDb);
            end;
          end;
        finally
          StructureTable.Close;
          StructureTable.DeleteTable;
        end;

      finally
        TargetTable.Free;
      end;
    finally
      StructureTable.Free;
    end;
  except
    on E: EDataBaseError do
    begin
      Result := False;
      LastDBErrorString := E.Message;
      { Re Raise Exception so that it is passed back to the Calling function }
      if ReRaiseDBExceptions then
       raise;
    end;
  end;
end;

{ DBStructProcessTable -- process a string list containing table data in database structure
  format (see help for complete description) }
function DBStructProcessTable(var TablePacket: TStringList; var strResult: String; TableIndex: LongInt;
                              var SRec: TStructureRec): Boolean;
var
  i                     : Integer;
  strWork               : String;
  strTableName          : String;
  strDesc               : String;
  strFieldName          : String;
  strFieldType          : String;
  FieldSize             : Integer;
  strRequired           : String;
  HeaderFound           : Boolean;
  FieldDefinitionFound  : Boolean;
  strIndexName          : String;
  strIndexFields        : String;
  strOptions            : String;
  SubType               : Word;
begin
  { Init }
  Result := True;
  HeaderFound := False;
  FieldDefinitionFound := False;

  for i := 0 to TablePacket.Count -1 do
  begin
    { test the first five characters and determine if line is TABLE definition, FIELD
      definition or INDEX definition }
    strWork := Copy(TablePacket[i], 0, 5);
    if CompareText(strWork, 'TABLE') = 0 then
    begin
      HeaderFound := True;
      Result := DBStructGetTableName(TablePacket[i], strTableName, strDesc);
      if not Result then
      begin
        strResult := 'Invalid table header [' + TablePacket[i] + ']';
        Exit;
      end
      else
      begin
        SRec.Tables[TableIndex] := strTableName;
      end;
    end
    else
    if CompareText(strWork, 'FIELD') = 0 then
    begin
      FieldDefinitionFound := True;
      Result := DBStructGetField(TablePacket[i], strFieldName, strFieldType, strRequired, FieldSize, SubType);
      if not Result then
      begin
        strResult := 'Invalid Field Definition [' + TablePacket[i] + ']';
        Exit;
      end;
    end
    else
    if CompareText(strWork, 'INDEX') = 0 then
    begin
      Result := DBStructGetIndex(TablePacket[i], strIndexName, strIndexFields, strOptions);
      if not Result then
      begin
        strResult := 'Invalid Index Definition [' + TablePacket[i] + ']';
        Exit;
      end;
    end;
  end;

  { check that a header was found and at least one field definition line }
  if Result then
  begin
    if not HeaderFound then
    begin
      Result := False;
      strResult := 'Table Header not found';
    end;
    if not FieldDefinitionFound then
    begin
      Result := False;
      strResult := 'No field definitions found.';
    end;
  end;
end;

{ DBStructSyncTables -- Sync physical tables with structure file (see help for complete description) }
function DBStructSyncTables(strDataBase, strStructureFile: String; Verbose :Boolean): Boolean;

var
  PhysicalTableList      : TStringList;
  StructureFileTableList : TStringList;
  WorkTableList          : TStringList;
  SRec                   : TStructureRec;
  i                      : Integer;
  TableA                 : TTable;   { physical table }
  TableB                 : TTable;   { structure table }
  FOpTypeArray           : array[0..255] of CROptype;  { Database retructure operation types }
  IOpTypeArray           : array[0..255] of CROptype;  { Database retructure operation types }
  FldDesc                : pFldDesc;                   { Database restructure field definitions }
  NewTable               : TTable;
  SpecialInfo            : TDBTableSpecialInfo;
begin
  { create list objects }
  StructureFileTableList := TStringList.Create;
  try
    PhysicalTableList := TStringList.Create;
    try
      WorkTableList := TStringList.Create;
      try
        { Validate structure file and get structure file tables }
        if DBCheckStructureFile(strStructureFile, StructureFileTableList, Srec) then
        begin
          { map structure files tables into list }
          StructureFileTableList.Clear;
          for i := 0 to High(SRec.Tables) do
            if SRec.Tables[i] <> '' then
              StructureFileTableList.Add(SRec.Tables[i]);

          { Get List of physical tables in database }
          Session.GetTableNames(strDataBase,'', TRUE, True, PhysicalTableList);

          { Check structure of existing tables against structure definition }
          for i := 0 to PhysicalTableList.Count -1 do
          begin
            if StructureFileTableList.IndexOf(PhysicalTableList[i]) > -1 then
            begin
              { Physical table exists in the structure file ... compare }

              TableA := TTable.Create(Application);
              try
                TableB := TTable.Create(Application);
                try
                  { Set Table Properties }
                  TableA.DatabaseName := strDataBase;
                  TableA.TableName := PhysicalTableList[i];
                  TableB.DatabaseName := strDataBase;
                  TableB.TableName := '_TMP.DB';

                  try
                    { get table structure }
                    if DBConfigureTableStructure(strDataBase, PhysicalTableList[i],
                                                 strStructureFile, TableB, SpecialInfo) then
                    begin
                      DBCreateTable(TableB, SpecialInfo);
                      try
                        FldDesc := nil;
                        if not DBCompareTables(TableA, TableB, FOpTypeArray, IOpTypeArray, FldDesc) then
                        begin
                          if Verbose then
                            if MessageDlg('Table [' + PhysicalTableList[i]
                                          + '] differs from structure file. Select ''''Yes'''' to '
                                          + 'restructure this table to conform to the structure file '
                                          + 'definition. It is recommended that a backup of this table '
                                          + 'is taken before restructuring. Selecting ''No'' will leave '
                                          + 'the table unchanged, which may cause the application to '
                                          + 'become unstable.', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                              Continue;

{$IFDEF WIN32}
                          { free table descriptor allocation from DBCompareTables }
                          if (FldDesc <> nil) then
                            FreeMem(FldDesc);
                          FldDesc := nil;
{$ENDIF}

                          { got this far ... attempt the restructure }
                          if DBRestructureTable(strDataBase, PhysicalTableList[i],
                                    strStructureFile, FOpTypeArray, IOpTypeArray, FldDesc) then
                          begin
                            if Verbose then
                              MessageDlg('Table [' + PhysicalTableList[i] + '] has been successfully '
                                         + 'restructured.', mtInformation, [mbOK], 0);
                          end
                          else
                            if Verbose then
                              MessageDlg('Restructure of table [' + PhysicalTableList[i] + '] has Failed.',
                                         mtInformation, [mbOK], 0);

                        end;
                      finally
{$IFDEF WIN32}
                        { free table descriptor allocation from DBRestructureTable }
                        if (FldDesc <> nil) then
                          FreeMem(FldDesc);
{$ENDIF}
                        { attempt to delete table, Restructure operation may already have done this }
                        try
                          TableB.DeleteTable;
                        except
                        end;
                      end;
                    end
                    else
                      if Verbose then
                        MessageDlg('Table [' + PhysicalTableList[i] + '] unable to compare tables. The '
                                   + 'structure file is invalid. ', mtInformation, [mbOK], 0);
                  except
                    on E: EDataBaseError do
                    begin
                      if Verbose then
                        MessageDlg('Table [' + PhysicalTableList[i] + '] database error occurred ['
                                   + E.Message + ']', mtInformation, [mbOK], 0);
                    end;
                  end;
                finally
                  TableB.Free;
                end;
              finally
                TableA.Free;
              end;

            end;
          end;

          { Create any Tables in the structure file but not physically in the database.
            Check structure of existing tables against structure definition }
          for i := 0 to StructureFileTableList.Count -1 do
          begin
            if PhysicalTableList.IndexOf(StructureFileTableList[i]) = -1 then
            begin
              if Verbose then
                if MessageDlg('Table [' + StructureFileTableList[i]
                              + '] is defined in the structure file but is not physically in '
                              + 'the database. Do you want to create the physical table?',
                              mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                  Continue;

              { go ahead and create table }
              NewTable := TTable.Create(Application);
              try
                { Set Table Properties }
                NewTable.DatabaseName := strDataBase;
                NewTable.TableName := StructureFileTableList[i];

                try
                  { get table structure }
                  if DBConfigureTableStructure(strDataBase, StructureFileTableList[i],
                                               strStructureFile, NewTable, SpecialInfo) then
                  begin
                    DBCreateTable(NewTable, SpecialInfo);
                    if Verbose then
                      MessageDlg('Table [' + StructureFileTableList[i] + '] created.',
                                 mtInformation, [mbOK], 0);
                  end
                  else
                    if Verbose then
                      MessageDlg('Table [' + StructureFileTableList[i] + '] unable to create '
                                 + 'table invalid structure file. ', mtInformation, [mbOK], 0);
                except
                  on E: EDataBaseError do
                    if Verbose then
                      MessageDlg('Table [' + StructureFileTableList[i] + '] database error occurred [' +
                                 E.Message + ']', mtInformation, [mbOK], 0);
                end;
              finally
                NewTable.Free;
              end;
            end;
          end;

          { finally delete any physical tables that exist in the database but are not in the structure file.
            Check structure of existing tables against structure definition }
          for i := 0 to PhysicalTableList.Count -1 do
          begin
            if StructureFileTableList.IndexOf(PhysicalTableList[i]) = -1 then
            begin
              if Verbose then
                if MessageDlg('Physical table [' + PhysicalTableList[i] + '] exists in the database '
                              + 'but is not referenced in the structure file. Do you want to delete '
                              + 'this table from the database. This will result in a possible loss '
                              + 'of data.', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                  Continue;

                { Delete the table }
                if DBDeleteTableFileIO(strDataBase, PhysicalTableList[i]) then
                begin
                  if Verbose then
                    MessageDlg('Physical table [' + PhysicalTableList[i] + '] successfully deleted.',
                               mtInformation, [mbOK], 0);
                end
                else
                  if Verbose then
                    MessageDlg('Failed to delete physical table [' + PhysicalTableList[i] + '].',
                               mtInformation, [mbOK], 0);
            end;
          end;

        end
        else
          if Verbose then
            MessageDlg('Structure file is invalid, unable to synchronise tables with structure file.',
                       mtError, [mbOK], 0);

        Result := True;

      finally
        { clean up }
        WorkTableList.Free;
      end;
    finally
      PhysicalTableList.Free;
    end;
  finally
    StructureFileTableList.Free;
  end;
end;


(*
*******************************************************************************
  Support Functions
*******************************************************************************
*)

{ DBAnsiToNative -- converts pascal string to null-terminated string using 'AnsiToNative
  conversion. 'MaxLength' specifies max size of 'NativeBuf'. Places result in 'NativeBuf'
  and returns pointer to result. }
function DBAnsiToNative(const NameStr: string; NativeBuf: PChar; MaxLength: Integer): PChar;
begin
  if (Length(NameStr) > 0) then
    AnsiToNative(Session.Locale, NameStr, NativeBuf, MaxLength)
  else
    StrPCopy(NativeBuf, '');
  Result := NativeBuf;
end;

{ DBCheckAutoIncTranslationAllowed -- returns True if table contains a transformable
  AutoInc field, False otherwise. (see help for complete description) }
function DBCheckAutoIncTranslationAllowed(strDataBase, strTableName, strPassword: String): Boolean;
var
  SrcTablePath    : DBITBLNAME;
  iFld, iIdx, iSec, iVal, iRI, iOptP, iOptD: Word;
  DbRslt          : DBIResult;
  TblDesc         : CRTBlDesc;
  i, j            : Integer;
  pIndexDesc      : pIDXDesc;
  pFieldDesc      : pFLDDesc;
  pPassword       : PChar;
  NativeStr       : DBITBLNAME;
begin
  Result := False;                          { assume none or not transformable for now }

  DBAnsiToNative((AddSlash(strDataBase) + strTableName), SrcTablePath, (SizeOf(SrcTablePath) - 1));

  { Convert Password }
  if strPassword <> '' then
    pPassWord := AnsiToNative(Session.Locale, strPassword, Nativestr, SizeOf(DBITBLNAME) -1)
  else
    pPassWord := nil;

  FBDEUtil := TBDEUtil.Create;
  try
    DbRslt := TUExit(FBDEUtil.vHtSes);
    PublishBDEResult(DbRslt);
    if DbRslt = DBIERR_NONE then
    begin
      DbRslt := TUInit(FBDEUtil.vHtSes);
      PublishBDEResult(DbRslt);
      if DbRslt = DBIERR_NONE then
      begin
        DbRslt := TUGetCRTblDescCount(FBDEUtil.vhTSes, KillExt(SrcTablePath), iFld, iIdx, iSec,
                                    iVal, iRI, iOptP, iOptD);
        PublishBDEResult(DbRslt);
        if DbRslt = DBIERR_NONE then
        begin
          { prepare table description structure }
          FillChar(TblDesc, SizeOf(CRTBlDesc), 0);

          { allocate memory to receive table specifics }
          TblDesc.iFldCount := iFld;
          GetMem(TblDesc.pFldDesc, (iFld * SizeOf(FldDesc)));

          TblDesc.iIdxCount := iIdx;
          GetMem(TblDesc.pIdxDesc, (iIdx * SizeOf(IdxDesc)));

          TblDesc.iSecRecCount := iSec;
          GetMem(TblDesc.pSecDesc, (iSec * SizeOf(SecDesc)));

          TblDesc.iValChkCount := iVal;
          GetMem(TblDesc.pVchkDesc, (iVal * SizeOf(VCHKDesc)));

          TblDesc.iRintCount := iRI;
          GetMem(TblDesc.pRIntDesc, (iRI * SizeOf(RIntDesc)));

          TblDesc.iOptParams := iOptP;
          GetMem(TblDesc.pfldOptParams, (iOptP * sizeOf(FLDDesc)));

          GetMem(TblDesc.pOptData, (iOptD * DBIMAXSCFLDLEN));
          try
            { retrieve table description from table }
            DbRslt := TUFillCRTblDesc(FBDEUtil.vhTSes, @TblDesc, KillExt(SrcTablePath), pPassword);
            PublishBDEResult(DbRslt);
            if DbRslt = DBIERR_NONE then
            begin
              { locate primary index (if there is one) }
              pIndexDesc := TblDesc.pIdxDesc;
              for i := 1 to TblDesc.iIdxCount do
              begin
                if pIndexDesc^.bPrimary then
                begin
                  { check for single-field key }
                  if (pIndexDesc^.iFldsInKey = 1) then
                  begin
                    { check to see if this field is an AutoInc field ... if so, return True }
                    if (pIndexDesc^.aiKeyFld[0] <= TblDesc.iFldCount) then
                    begin
                      pFieldDesc := TblDesc.pFldDesc;
                      { locate field definition structure of interest }
                      for j := 1 to (pIndexDesc^.aiKeyFld[0] - 1) do
                        inc(pFieldDesc);
                      Result := (pFieldDesc^.iFldType = fldPDXAUTOINC);
                    end;
                  end;
                end;
                inc(pIndexDesc);
              end;
            end;
          finally
            with TblDesc do
            begin
              if (pFldDesc <> nil) then
                FreeMem(pFldDesc, (iFld * SizeOf(FldDesc)));
              if (pIdxDesc <> nil) then
                FreeMem(pIdxDesc, (iIdx * SizeOf(IdxDesc)));
              if (pSecDesc <> nil) then
                FreeMem(pSecDesc, (iSec * SizeOf(SecDesc)));
              if (pVchkDesc <> nil) then
                FreeMem(pVchkDesc, (iVal * SizeOf(VCHKDesc)));
              if (pRIntDesc <> nil) then
                FreeMem(pRIntDesc, (iRI * SizeOf(RIntDesc)));
              if (pfldOptParams <> nil) then
                FreeMem(pfldOptParams, (iOptP * sizeOf(FLDDesc)));
              if (pOptData <> nil) then
                FreeMem(pOptData, (iOptD * DBIMAXSCFLDLEN));
            end;
          end;
        end;
      end;
    end;
  finally
    FBDEUtil.Free;
  end;
end;

{ DBCreateTable -- special table creation wrapper which handles certain special conditions. }
procedure DBCreateTable(var WorkTable: TTable; SpecialInfo: TDBTableSpecialInfo);
{$IFNDEF WIN32}
var
  DirName         : DBIPATH;
  pFieldDescList  : pFLDDesc;
  pFieldDesc      : pFLDDesc;
  TblDesc         : CRTblDesc;
  hDb             : HDBIDB;
  OpTypes         : array [1..255] of CROpType;
  curProp         : CURProps;
  i               : Integer;
{$ENDIF}
begin

  { perform standard table creation }
  WorkTable.CreateTable;

  { handle special conditions based on 16/32-bit circumstances }
{$IFNDEF WIN32}
  { if an autoinc field exists in the table, must restructure to relfect }
  if (SpecialInfo.AutoIncFieldIndex <> 0) then
  begin
    StrPCopy(DirName, WorkTable.DataBaseName);
    WorkTable.Open;
    Check(DbiGetCursorProps(WorkTable.Handle, curProp));
    pFieldDescList := AllocMem(curProp.iFields * SizeOf(FLDDesc));
    try
      { retrieve current field structure list }
      Check(DbiGetFieldDescs(WorkTable.Handle, pFieldDescList));

      FillChar(TblDesc, sizeof(CRTblDesc), #0); { prepare table structure for use }

      WorkTable.Close;

      { open table in exclusive mode }
      Check(DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb));
      Check(DbiSetDirectory(hDb, DirName));

      { loop through fields setting operation to NOP. When autoinc field index is
        reached, set subtype appropriately }
      pFieldDesc := pFieldDescList;
      for i := 1 to curProp.iFields do
      begin
        Optypes[i] := crNOOP;
        if (i = SpecialInfo.AutoIncFieldIndex) then  { if this is the autoinc field }
        begin
          OpTypes[i] := crMODIFY;
          with pFieldDesc^ do
          begin
            iSubType := fldstAUTOINC;
            iUnits1 := 0;
            iUnits2 := 0;
          end;
        end;
        inc(pFieldDesc);
      end;

      { assign final table structure pointers and vars }
      TblDesc.iFldCount := curProp.iFields;
      TblDesc.pFLDDesc := pFieldDescList;
      TblDesc.pecrFldOp := @OpTypes;
      StrPCopy(TblDesc.szTblName, WorkTable.TableName);
      TblDesc.szTblType := DBGetTableType(WorkTable.TableName);

      { perform restructure operation }
      Check(DbiDoRestructure(hDb, 1, @TblDesc, nil, nil, nil, False));

    finally
      Check(DbiCloseDatabase(hDb));
      if (pFieldDescList <> nil) then
        FreeMem(pFieldDescList, (curProp.iFields * SizeOf(FLDDesc)));
    end;
  end;
{$ENDIF}
end;

{ DBDecodeValCheck -- Decode the Validity Check DBIVCHK structure based on field type, size,
  and validity flag. Returns string representing value or null-string if unable to decode. }
function DBDecodeValCheck(FieldType: TFieldType; FieldSize: Integer; HasFlag: WordBool; Value: DBIVCHK): String;
var
  IntValue       : LongInt;
  SmallIntValue  : SmallInt;
  WordValue      : Word;
  WordBoolValue  : WordBool;
  DoubleValue    : Double;
{$IFDEF WIN32}
  DateValue      : DBIDATE;
{$ELSE}
  DateValue      : DATE;
{$ENDIF}
  TimeValue      : TIME;
  TimeStampValue : TIMESTAMP;
  BCDValue       : FMTBcd;
  Month, Day, Hour, Min, Sec, MilSec: Word;
{$IFDEF WIN32}
  Year           : SmallInt;
{$ELSE}
  Year           : Integer;
{$ENDIF}
begin
  { assume no value specified for now }
  Result := '';
  try
    if (Integer(HasFlag) > 0) then
    begin
      { decode value based on field type first }
      case FieldType of
      ftString:
        begin
          Result := StrPas(@Value);
        end;
{$IFDEF WIN32}
      ftAutoInc,
{$ENDIF}
      ftInteger:
        begin
          move(Value, IntValue, SizeOf(LongInt));
          Result := IntToStr(IntValue);
        end;
      ftSmallint:
        begin
          move(Value, SmallIntValue, SizeOf(SmallInt));
          Result := IntToStr(SmallIntValue);
        end;
      ftWord:
        begin
          move(Value, WordValue, SizeOf(Word));
          Result := IntToStr(WordValue);
        end;
      ftBoolean:
        begin
          move(Value, WordBoolValue, SizeOf(WordBool));
          if WordBoolValue then
            Result := 'True'
          else
            Result := 'False';
        end;
      ftFloat,
      ftCurrency:
        begin
          move(Value, DoubleValue, SizeOf(Double));
          Result := FloatToStr(DoubleValue);
        end;
      ftBCD:
        begin
          move(Value, BCDValue, SizeOf(FMTBcd));
          DbiBcdToFloat(BCDValue, DoubleValue);
          Result := FloatToStr(DoubleValue);
        end;
      ftDate:
        begin
          { check for special TODAYVAL and NOWVAL flags }
          if (Integer(HasFlag) = TODAYVAL) then
            Result := 'TODAY'
{$IFDEF WIN32}
          else if (Integer(HasFlag) = NOWVAL) then
            Result := 'NOW'
{$ENDIF}
          else
          begin
{$IFDEF WIN32}
            move(Value, DateValue, SizeOf(DBIDATE));
{$ELSE}
            move(Value, DateValue, SizeOf(DATE));
{$ENDIF}
            DbiDateDecode(DateValue, Month, Day, Year);
            Result := DateToStr(EncodeDate(Year, Month, Day));
          end;
        end;
      ftTime:
        begin
          { check for special TODAYVAL and NOWVAL flags }
          if (Integer(HasFlag) = TODAYVAL) then
            Result := 'TODAY'
{$IFDEF WIN32}
          else if (Integer(HasFlag) = NOWVAL) then
            Result := 'NOW'
{$ENDIF}
          else
          begin
            move(Value, TimeValue, SizeOf(TIME));
            DbiTimeDecode(TimeValue, Hour, Min, MilSec);
            Sec := MilSec DIV 1000;		{ convert milliseconds to sec/millisec }
            MilSec := MilSec MOD 1000;
            Result := TimeToStr(EncodeTime(Hour, Min, Sec, MilSec));
          end;
        end;
      ftDateTime:
        begin
          { check for special TODAYVAL and NOWVAL flags }
          if (Integer(HasFlag) = TODAYVAL) then
            Result := 'TODAY'
{$IFDEF WIN32}
          else if (Integer(HasFlag) = NOWVAL) then
            Result := 'NOW'
{$ENDIF}
          else
          begin
            move(Value, TimeStampValue, SizeOf(TIMESTAMP));
            DbiTimeStampDecode(TimeStampValue, DateValue, TimeValue);
            DbiDateDecode(DateValue, Month, Day, Year);
            DbiTimeDecode(TimeValue, Hour, Min, MilSec);
            Sec := MilSec DIV 1000;		{ convert milliseconds to sec/millisec }
            MilSec := MilSec MOD 1000;
            Result := DateTimeToStr(EncodeDate(Year, Month, Day) + EncodeTime(Hour, Min, Sec, MilSec));
          end;
        end;
      else
        begin
          Result := 'N/A';
        end;
      end;
    end;
  except
    Result := 'N/A';
  end;
end;

{ DBDeleteNetFile -- delete the network control file }
function DBDeleteNetFile: Boolean;
const
  NET_FILENAME = 'PDOXUSRS.NET';
begin
  Result := True; { assume success for now }

  if FileExists(Session.NetFileDir + NET_FILENAME) then
  begin
    if not SysUtils.DeleteFile(Session.NetFileDir + NET_FILENAME) then
    begin
      if VerboseDBResponse then
        MessageDlg('Unable to delete network control file [' + Session.NetFileDir + NET_FILENAME + ']',
                   mtError, [mbOK], 0);
      Result := False;
    end
    else
    begin
      if VerboseDBResponse then
        MessageDlg('Network control file [' + Session.NetFileDir + NET_FILENAME + '] deleted.',
                   mtInformation, [mbOK], 0);
    end;
  end
  else
  begin
    if VerboseDBResponse then
      MessageDlg('Network control file [' + Session.NetFileDir + NET_FILENAME + '] does not exist.',
                 mtWarning, [mbOK], 0);
    Result := False;
  end;
end;

{ DBGetBDEVersion -- fills in BDE version structure }
function DBGetBDEVersion(var VersionInfo: TFileVersionRecord): Boolean;
const
{$IFDEF WIN32}
  IDAPI_DLL_NAME = 'IDAPI32.DLL';
{$ELSE}
  IDAPI_DLL_NAME = 'IDAPI01.DLL';
{$ENDIF}
var
{$IFDEF WIN32}
  Win32Reg   : TReadOnlyRegistry;
{$ELSE}
  WinIni     : TIniFile;
{$ENDIF}
  DirPath    : String;
  TestPath   : String;
begin
  Result := False;                                                         { assume failure for now }
{$IFDEF WIN32}
  Win32Reg := TReadOnlyRegistry.Create;
  try
    Win32Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Win32Reg.OpenKeyReadOnly('Software\Borland\Database Engine') then
    begin
      DirPath := Win32Reg.ReadString('DLLPATH');
{$ELSE}
  WinIni := TIniFile.Create('WIN.INI');
  try
    DirPath := WinIni.ReadString('IDAPI', 'DLLPATH', 'NOT_FOUND');
    if (Length(DirPath) > 0) And (CompareText(DirPath, 'NOT_FOUND') <> 0) then
    begin
{$ENDIF}
      { process path segments until a valid one is found or path exhausted }
      while (not Result) And (Length(DirPath) > 0) do
      begin
        if (Pos(';', DirPath) > 0) then                                    { process segment by segment }
        begin
          TestPath := Copy(DirPath, 1, (Pos(';', DirPath) - 1));
          DirPath := Copy(DirPath, (Pos(';', DirPath) + 1), Length(DirPath));
        end
        else
        begin
          TestPath := DirPath;
          DirPath := '';
        end;
        { append '\' if needed and IDAPI DLL name }
        TestPath := AddSlash(TestPath) + IDAPI_DLL_NAME;
        Result := GetDLLVersion(TestPath, VersionInfo);
      end;
    end;
  finally
{$IFDEF WIN32}
    Win32Reg.Free;
{$ELSE}
    WinIni.Free;
{$ENDIF}
  end;
end;

{ DBGetCursorProps --  get the cursor properties for a table ... return record count
  (see help for complete description) }
function DBGetCursorProps(strDataBase, strTableName: String; var CurProp: CURProps): LongInt;
var
  hDb        : hDbiDb;
  TCur       : hDBICur;
  DBRslt     : DBIResult;
  DBName     : DBIPATH;
  TableName  : DBITBLNAME;
begin
  Result := -1;  { assume failure for now }

  { Open a NULL database handle }
  DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenShared, nil, 0, nil, nil, hDb);
  PublishBDEResult(DBRslt);
  if DBRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DBRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        { Get Table Cursor }
        DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
        DBRslt := DbiOpenTable(hDb, TableName, nil, nil, nil, 0, dbiREADWRITE, dbiOPENSHARED,
                               xltFIELD, TRUE, nil, TCur);
        PublishBDEResult(DBRslt);
        if DBRslt = DBIERR_NONE then
        begin
          try
            { Get Cursor Properties }
            DBRslt := DbiGetCursorProps(TCur, CurProp);
            PublishBDEResult(DBRslt);
            if DBRslt = DBIERR_NONE then
            begin
              { Return Record Count in result }
              DBRslt := DbiGetRecordCount(TCur, Result);
              PublishBDEResult(DBRslt);
              if DBRslt <> DBIERR_NONE then
                Result := -1;
            end;
          finally
            DbiCloseCursor(TCur);
          end;
        end;
      end;
    finally
      DbiCloseDatabase(hDb);
    end;
  end;
end;

{ DBGetCursorPropsProtected --  get the cursor properties for a table without opening the
  table (see help for complete description) }
function DBGetCursorPropsProtected(strDataBase, strTableName: String; var CurProp: CURProps): Boolean;
var
  DBRslt     : DBIResult;
  TableName  : DBITBLNAME;
begin
  Result := False;  { assume failure for now }

  FBDEUtil := TBDEUtil.Create;
  try
    DBRslt := TUExit(FBDEUtil.vHtSes);
    PublishBDEResult(DBRslt);
    if DBRslt = DBIERR_NONE then
    begin
      DBRslt := TUInit(FBDEUtil.vHtSes);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        DBAnsiToNative((AddSlash(strDataBase) + strTableName), TableName, (SizeOf(TableName) - 1));
        DBRslt := TUFillCURProps(FBDEUtil.vHtSes, TableName, CurProp);
        PublishBDEResult(DBRslt);
        Result := (DBRslt = DBIERR_NONE);
      end;
    end;
  finally
    FBDEUtil.Free;
  end;
end;

{ DBGetRefInt -- get the table's referential integrity information (see help for complete description) }
function DBGetRefInt(strDataBase, strTableName: String; SeqNo: Word; var RIntDesc: RIntDesc): Boolean;
var
  hDb        : hDbiDb;
  TCur       : hDBICur;
  DBRslt     : DBIResult;
  DBName     : DBIPATH;
  TableName  : DBITBLNAME;
begin
  Result := False;  { assume failure for now }

  { Open a NULL database handle }
  DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenShared, nil, 0, nil, nil, hDb);
  PublishBDEResult(DBRslt);
  if DBRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DBRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        { Get Table Cursor }
        DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
        DBRslt := DbiOpenTable(hDb, TableName, nil, nil, nil, 0, dbiREADWRITE, dbiOPENSHARED,
                               xltFIELD, TRUE, nil, TCur);
        PublishBDEResult(DBRslt);
        if DBRslt = DBIERR_NONE then
        begin
          try
            { Get Val Check Properties }
            DBRslt := DbiGetRIntDesc(TCur, SeqNo, @RIntDesc);
            PublishBDEResult(DBRslt);

            Result := DBRslt = DBIERR_NONE;
          finally
            DbiCloseCursor(TCur);
          end;
        end;
      end;
    finally
      DbiCloseDatabase(hDb);
    end;
  end;

end;

{ DBGetTableAssociatedFiles -- retrieve all files associated with a data table (see help for
  complete description) }
function DBGetTableAssociatedFiles(strDataBase, strTableName: String; var FileList: TStringList): Boolean;
var
  RetVal        : Integer;        { return value of Directory findfirst function }
  Srec          : TSearchRec;     { File Information returned by FindNext etc }
  RootFileName  : String;         { FileName without file extention }
  FileExtension : String;         { FileName extension }
begin
  Result := True; { always successful }

  { Add '\' to directory string if not present }
  strDataBase := AddSlash(strDataBase);
  
  { extract the root file name (up to the '.') to be used for comparison }
  if (Pos('.', strTableName) > 0) then
    RootFileName := Copy(strTableName, 1, (Pos('.', strTableName) - 1))
  else
    RootFileName := strTableName;

  { scan through the database directory returning all files. Only save to list those that
   have a matching root file name. *** IMPORTANT *** Does not specify the root file name
   in the find mask on purpose. This creates a problem for some networked drives when an
   empty table name is specified (i.e., when removing files like ".DB", ".PX", etc) }
  RetVal := FindFirst(strDataBase + '*.*', faAnyFile, Srec);
  while RetVal = 0 do
  begin
    Application.ProcessMessages;
    if (SRec.Attr and (faDirectory OR faVolumeID)) = 0 then {file found}
    begin
      { check root filename }
      if (CompareText(Copy(Srec.Name, 1, (Pos('.', Srec.Name) - 1)), RootFileName) = 0) then
      begin
        { file extension must also match a list of valid extensions/patterns }
        FileExtension := ExtractFileExt(Srec.Name);
        { get rid of leading period if present }
        if (Length(FileExtension) > 0) And (FileExtension[1] = '.') then
        begin
          try
            FileExtension := Copy(FileExtension, 2, Length(FileExtension))
          except
            FileExtension := '';
          end;
        end;
        { if file extension matches a valid PARADOX or DBASE extension, add file to list }
        if (Length(FileExtension) > 0) then
        begin
          if (CompareText(FileExtension, 'DB') = 0) Or   { Paradox file extensions }
             (CompareText(FileExtension, 'PX') = 0) Or
             ((CompareText(Copy(FileExtension, 1, 1), 'X') = 0) And (Length(FileExtension) = 3)) Or
             ((CompareText(Copy(FileExtension, 1, 1), 'Y') = 0) And (Length(FileExtension) = 3)) Or
             (CompareText(FileExtension, 'MB') = 0) Or
             (CompareText(FileExtension, 'VAL') = 0) Or
             (CompareText(FileExtension, 'GDB') = 0) Or
             (CompareText(FileExtension, 'DBF') = 0) Or  { DBASE file extensions }
             (CompareText(FileExtension, 'MDX') = 0) Or
             (CompareText(FileExtension, 'DBT') = 0) then
          begin
           FileList.Add(strDataBase + Srec.Name);
          end;
        end;
      end;
    end;
    RetVal := FindNext(Srec);
  end;
  SysUtils.FindClose(SRec); {32 Bit!!!}
end;

{ DBGetTableType -- returns the table type given the table name }
function DBGetTableType(TableName: String): DBINAME;
var
  Ext : String;
begin
  { get extension from string }
  Ext := UpperCase(ExtractFileExt(TableName));

  if (Ext = '.DB') then
    StrPCopy(Result, szPARADOX)
  else if (Ext = '.DBF') then
    StrPCopy(Result, szDBASE)
  else if Ext = '.TXT' then
    StrPCopy(Result, szASCII)
  else
    StrPCopy(Result, '')
end;

{ DBGetTutilityVersion -- fills in TUtility version structure }
function DBGetTutilityVersion(var VersionInfo: TFileVersionRecord): Boolean;
begin
{$IFDEF WIN32}
  Result := GetDLLVersion('TUTIL32.DLL', VersionInfo);
{$ELSE}
  Result := GetDLLVersion('TUTILITY.DLL', VersionInfo);
{$ENDIF}
end;

{ DBGetValCheck -- get one table validity check information (see help for complete description) }
function DBGetValCheck(strDataBase, strTableName: String; SeqNo: Word; var VchkDes: VCHKDesc): Boolean;
var
  hDb        : hDbiDb;
  TCur       : hDBICur;
  DBRslt     : DBIResult;
  DBName     : DBIPATH;
  TableName  : DBITBLNAME;
begin
  Result := False;  { assume failure for now }

  { Open a NULL database handle }
  DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenShared, nil, 0, nil, nil, hDb);
  PublishBDEResult(DBRslt);
  if DBRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DBRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        { Get Table Cursor }
        DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
        DBRslt := DbiOpenTable(hDb, TableName, nil, nil, nil, 0, dbiREADWRITE, dbiOPENSHARED,
                               xltFIELD, TRUE, nil, TCur);
        PublishBDEResult(DBRslt);
        if DBRslt = DBIERR_NONE then
        begin
          try
            { Get Val Check Properties }
            DBRslt := DbiGetVchkDesc(TCur, SeqNo, @VchkDes);
            PublishBDEResult(DBRslt);

            Result := DBRslt = DBIERR_NONE;
          finally
            DbiCloseCursor(TCur);
          end;
        end;
      end;
    finally
      DbiCloseDatabase(hDb);
    end;
  end;

end;

{ DBSetAutoIncField -- set the field type of the field specified by 1-based field index
  'FieldIndex' to AutoInc. (see help for complete description) }
function DBSetAutoIncField(strDataBase, strTableName, strPassword: String; FieldIndex: Integer): Boolean;
var
  DirName         : DBIPATH;
  pFieldDesc      : pFLDDesc;
  FieldDesc       : FLDDesc;
  TblDesc         : CRTblDesc;
  hDb             : HDBIDB;
  pOpTypes        : pCROpType;
  pPassword       : PChar;
  NativeStr       : DBITBLNAME;
  DBRslt          : DBIRESULT;
  TableName       : DBINAME;
  TCur            : hDBICur;
  TmpCount        : LongInt;
begin
  Result := False; { Assume failure for now }

  { Convert Password }
  if strPassword <> '' then
    pPassword := AnsiToNative(Session.Locale, strPassword, NativeStr, (SizeOf(DBITBLNAME) - 1))
  else
    pPassword := nil;

  { prepare table description structure for use }
  FillChar(TblDesc, SizeOf(CRTblDesc), #0);

  { assign common table structure pointers and vars }
  DBAnsiToNative(strTableName, TblDesc.szTblName, (SizeOf(TblDesc.szTblName) - 1));
  TblDesc.szTblType := DBGetTableType(strTableName);
  if (pPassword <> nil) then
  begin
    TblDesc.bProtected := True;
    StrCopy(TblDesc.szPassword, pPassword);
  end
  else
  begin
    TblDesc.bProtected := False;
    StrPCopy(TblDesc.szPassword, '');
  end;

  try
    { Open a NULL database handle in exclusive mode }
    DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
    PublishBDEResult(DBRslt);
    if DBRslt = DBIERR_NONE then
    begin
      try
        { set the database directory }
        DBAnsiToNative(strDatabase, DirName, (SizeOf(DirName) - 1));
        DBRslt := DbiSetDirectory(hDb, DirName);
        PublishBDEResult(DBRslt);
        if DBRslt = DBIERR_NONE then
        begin
          { Get Table Cursor }
          DBAnsiToNative(strTableName, TableName, (SizeOf(TableName) - 1));
          DBRslt := DbiOpenFieldList(hDb, NeedsExt(TableName), nil, False, TCur);
          PublishBDEResult(DBRslt);
          if DBRslt = DBIERR_NONE then
          begin
            try
              { Position to First Record }
              DBRslt := DbiSetToBegin(TCur);
              PublishBDEResult(DBRslt);
              if DBRslt = DBIERR_NONE then
              begin
                { get record count and allocate field structure and operation type structure}
                DBRslt := DbiGetRecordCount(TCur, TmpCount);
                PublishBDEResult(DBRslt);
                if DBRslt = DBIERR_NONE then
                begin
                  TblDesc.iFldCount := TmpCount;
                  GetMem(TblDesc.pfldDesc, (TmpCount * SizeOf(FLDDesc)));
                  pFieldDesc := TblDesc.pfldDesc;
                  GetMem(TblDesc.pecrFldOp, (TmpCount * SizeOf(CROpType)));
                  pOpTypes := TblDesc.pecrFldOp;
                  repeat
                    DBRslt := DbiGetNextRecord(TCur, dbiNOLOCK, @FieldDesc, nil);
                    if (DBRslt <> DBIERR_EOF) then
                    begin
                      { copy field descriptor structure }
                      pFieldDesc^ := FieldDesc;
                      { if field specified, set operation to crMODIFY ... else,
                        set operation to crNOOP. }
                      if (pFieldDesc^.iFldNum = FieldIndex) then
                      begin
                        pFieldDesc^.iFldType := fldINT32;
                        pFieldDesc^.iSubType := fldstAUTOINC;
                        pOpTypes^ := crMODIFY;
                      end
                      else
                        pOpTypes^ := crNOOP;
                      { increment pointers }
                      inc(pFieldDesc);
                      inc(pOpTypes);
                    end;
                  until DBRslt <> DBIERR_NONE;
                  if (DBRslt = DBIERR_EOF) then
                    DBRslt := DBIERR_NONE;
                end;

                { if all OK  ... proceed }
                if (DBRslt = DBIERR_NONE) then
                begin
                  { perform restructure operation }
                  DBRslt := DbiDoRestructure(hDb, 1, @TblDesc, nil, nil, nil, False);
                  PublishBDEResult(DBRslt);
                end;

                Result := (DBRslt = DBIERR_NONE);

              end;
            finally
              DbiCloseCursor(TCur);
            end;
          end;
        end;
      finally
        DbiCloseDatabase(hDb);
      end;
    end;
  finally
    { dispose of any allocations }
    if (TblDesc.iFldCount > 0) then
    begin
      FreeMem(TblDesc.pfldDesc, (TblDesc.iFldCount * SizeOf(FLDDesc)));
      FreeMem(TblDesc.pecrFldOp, (TblDesc.iFldCount * SizeOf(CROpType)));
    end;
  end;
end;

{ DBTableIsProtected -- sets 'NeedsPassword' True if the table specified by 'strDataBase' and
  'strTableName' is protected, False otherwise. Returns True if the test was successful,
  False otherwise. (see help for complete description) }
function DBTableIsProtected(strDataBase, strTableName: String; var NeedsPassword: Boolean): Boolean;
var
  FBDEUtil   : TBDEUtil;
  DBRslt     : DBIResult;
  TableName  : DBITBLNAME;
  CurProp    : CURProps;
  TableType  : DBINAME;
begin
  Result := False;  { assume failure for now }

  { check for DBASE and ASCII tables ... never password protected }
  TableType := DBGetTableType(strTableName);
  if (StrPas(TableType) <> szParadox) then
  begin
    NeedsPassword := False;
    Result := True;
    Exit;
  end;

  { proceed to check Paradox table protected status }
  FBDEUtil := TBDEUtil.Create;
  try
    DBRslt := TUExit(FBDEUtil.vHtSes);
    PublishBDEResult(DBRslt);
    if DBRslt = DBIERR_NONE then
    begin
      DBRslt := TUInit(FBDEUtil.vHtSes);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        DBAnsiToNative((AddSlash(strDataBase) + strTableName), TableName, (SizeOf(TableName) - 1));
        DBRslt := TUFillCURProps(FBDEUtil.vHtSes, TableName, CurProp);
        PublishBDEResult(DBRslt);
        NeedsPassword := CurProp.bProtected; { set return protected flag }
        Result := (DBRslt = DBIERR_NONE);
      end;
    end;
  finally
    FBDEUtil.Free;
  end;
end;

{ DBProtectTable -- sets the master password for a table (see help for complete description) }
function DBProtectTable(strDataBase, strTableName, strPassword: String): Boolean;
var
  hDb                  : hDbiDb;
  TblDesc              : CRTblDesc;
  DBRslt               : DBIResult;
  DBName               : DBIPATH;
  TableType  : DBINAME;
begin
  Result := False; { assume failure for now }
  { check for Paradox only tables type }
  TableType := DBGetTableType(strTableName);
  if (StrPas(TableType) <> szParadox) then
  begin
    PublishBDEResult(DBIERR_INVALIDTABLE);  { invalid table name }
    Exit;
  end;
  { table is Paradox ... open a NULL database handle }
  DBRslt := DbiOpenDatabase(nil, nil, dbiReadWrite, dbiOpenExcl, nil, 0, nil, nil, hDb);
  PublishBDEResult(DBRslt);
  if DBRslt = DBIERR_NONE then
  begin
    try
      { set the database directory }
      DBAnsiToNative(strDatabase, DBName, (SizeOf(DBName) - 1));
      DBRslt := DbiSetDirectory(hDb, DBName);
      PublishBDEResult(DBRslt);
      if DBRslt = DBIERR_NONE then
      begin
        FillChar(TblDesc, sizeof(CRTblDesc), #0);

        { fill in minimum restructure fields }
        StrPCopy(TblDesc.szTblName, strTableName);
        StrPCopy(TblDesc.szTblType, szParadox);

        { set password information }
        if (Length(strPassword) > 0) then
        begin
          TblDesc.bProtected := True;
          StrPCopy(TblDesc.szPassword, strPassword);
        end
        else
        begin
          TblDesc.bProtected := False;
          StrPCopy(TblDesc.szPassword, '');
        end;

        { Do a Restructure, this will protect the table without making any
          field or index changes because the table descriptor (TblDesc) is null }
        DBRslt := DbiDoRestructure(hDb, 1, @TblDesc, nil, nil, nil, False);

        PublishBDEResult(DBRslt);
        Result := (DBRslt = DBIERR_NONE);

      end;
    finally { Close the database object }
      DbiCloseDatabase(hDb);
    end;
  end;
end;


(*
*******************************************************************************
  Unpublished Support Functions
*******************************************************************************
*)

{ PublishBDEResult -- Ensure published Last BDE Error and String variables are set
  correctly and raise EDataBase exception if ReRaiseDBExceptions is TRUE (see help
  for a complete error handling description)}
procedure PublishBDEResult(DBRslt: DBIResult);
var
  ErrorStr : DBIMSG;
begin
  { Always return Error Code and String }
  LastDBError := DBRslt;
  { Get error string }
  try
    Check(DbiGetErrorString(DBRslt, ErrorStr));
  except
    on E: EDataBaseError do
    begin
      LastDBErrorString := '';
      if VerboseDBResponse then
        MessageDlg('BDE Error occurred: Unable to retrieve message string from result code.',
                   mtInformation, [mbOK], 0);
      if ReRaiseDBExceptions then
        raise;
    end;
  end;
  LastDBErrorString := StrPas(ErrorStr);

  { Re Raise Exception so that it is passed back to the Calling function }
  if ReRaiseDBExceptions then
    Check(DBRslt);
end;

{$IFNDEF WIN32}
{CopyFile -- I/O file copy for 16-bit apps. Adapted from FmxUtils.Pas which ships with Delphi 1 }
function CopyFile(const FileName, DestName: String): Boolean;
var
  CopyBuffer    : Pointer;             { buffer for copying }
  TimeStamp     : LongInt;
  BytesCopied   : LongInt;
  Source, Dest  : Integer;             { handles }
  Destination   : String;              { holder for expanded destination name }
const
  ChunkSize: Longint = 8192;           { copy in 8K chunks }
begin
  Result := True;
  try
    Destination := ExpandFileName(DestName);                        { expand the destination path }
    TimeStamp := FileAge(FileName);                                 { get source's time stamp }
    GetMem(CopyBuffer, ChunkSize);                                  { allocate the buffer }
    try
      Source := FileOpen(FileName, fmShareDenyWrite);               { open source file }
      if Source < 0 then
        raise EAbort.Create('');
      try
        Dest := FileCreate(Destination);                            { create output file; overwrite existing }
        if Dest < 0 then
          raise EAbort.Create('');
        try
          repeat
            BytesCopied := FileRead(Source, CopyBuffer^, ChunkSize); { read chunk }
            if BytesCopied > 0 then                                 { if we read anything... }
              FileWrite(Dest, CopyBuffer^, BytesCopied);            { ...write chunk }
          until BytesCopied < ChunkSize;                            { until we run out of chunks }
        finally
          FileClose(Dest);                                          { close the destination file }
        end;
      finally
        FileClose(Source);                                          { close the source file }
      end;
    finally
      if (CopyBuffer <> nil) then
        FreeMem(CopyBuffer, ChunkSize);                             { free the buffer }
    end;
  except
    Result := False;                                                { just return Fals eon error }
  end;
end;
{$ENDIF}

{ GetDLLVersion -- utilities used to retrieve BDE and TUTILITY Version information }
{$IFDEF WIN32}
function GetDLLVersion(DLLNameStr: String; var VersionInfo: TFileVersionRecord): Boolean;
var
  VersionInfoSize   : DWORD;
  VersionInfoHandle : DWORD;
  DLLFile           : Array [0..255] of Char;
  FileVersionInfo   : Pointer;
  VerQueryInfo      : Pointer;
{$IFDEF VER130}  {Delphi 5}
  VerQuerySize      : UINT;
{$ELSE}
{$IFDEF VER120}  {Delphi 4}
  VerQuerySize      : Cardinal;
{$ELSE}
  VerQuerySize      : UINT;
{$ENDIF}
{$ENDIF}
begin
  Result := False;   { assume failure for now }
  VersionInfoSize := GetFileVersionInfoSize(StrPCopy(DLLFile, DLLNameStr), VersionInfoHandle);
  if (VersionInfoSize > 0) then
  begin
    GetMem(FileVersionInfo, VersionInfoSize);                              { allocate for version info }
    try
      if GetFileVersionInfo(DLLFile, VersionInfoHandle, VersionInfoSize, FileVersionInfo) then
      begin
        if VerQueryValue(FileVersionInfo, '\' , VerQueryInfo, VerQuerySize) then
        begin
          { success ... fill in version structure }
          with VersionInfo do
          begin
            MSDW_MSW := HIWORD(PVSFixedFileInfo(VerQueryInfo)^.dwFileVersionMS);
            MSDW_LSW := LOWORD(PVSFixedFileInfo(VerQueryInfo)^.dwFileVersionMS);
            LSDW_MSW := HIWORD(PVSFixedFileInfo(VerQueryInfo)^.dwFileVersionLS);
            LSDW_LSW := LOWORD(PVSFixedFileInfo(VerQueryInfo)^.dwFileVersionLS);
          end;
          Result := True;
        end;
      end;
    finally
      if (FileVersionInfo <> nil) then
        FreeMem(FileVersionInfo, VersionInfoSize);
    end;
  end;
end;
{$ELSE} { some variable and type definition changes for 16-bit }
function GetDLLVersion(DLLNameStr: String; var VersionInfo: TFileVersionRecord): Boolean;
var
  VersionInfoSize   : LongInt;
  VersionInfoHandle : LongInt;
  DLLFile           : Array [0..255] of Char;
  FileVersionInfo   : Pointer;
  VerQueryInfo      : Pointer;
  VerQuerySize      : Word;
begin
  Result := False;   { assume failure for now }
  VersionInfoSize := GetFileVersionInfoSize(StrPCopy(DLLFile, DLLNameStr), VersionInfoHandle);
  if (VersionInfoSize > 0) then
  begin
    GetMem(FileVersionInfo, VersionInfoSize);                              { allocate for version info }
    try
      if GetFileVersionInfo(DLLFile, VersionInfoHandle, VersionInfoSize, FileVersionInfo) then
      begin
        if VerQueryValue(FileVersionInfo, '\' , VerQueryInfo, VerQuerySize) then
        begin
          { success ... fill in version structure }
          with VersionInfo do
          begin
            MSDW_MSW := HIWORD(PVS_FixedFileInfo(VerQueryInfo)^.dwFileVersionMS);
            MSDW_LSW := LOWORD(PVS_FixedFileInfo(VerQueryInfo)^.dwFileVersionMS);
            LSDW_MSW := HIWORD(PVS_FixedFileInfo(VerQueryInfo)^.dwFileVersionLS);
            LSDW_LSW := LOWORD(PVS_FixedFileInfo(VerQueryInfo)^.dwFileVersionLS);
          end;
          Result := True;
        end;
      end;
    finally
      if (FileVersionInfo <> nil) then
        FreeMem(FileVersionInfo, VersionInfoSize);
    end;
  end;
end;
{$ENDIF}

{ ClearStructureRec -- init structure rec before use. }
procedure ClearStructureRec(var SRec: TStructureRec);
var
  i : Integer;
begin
  { init all table name strings to null }
  for i := 0 to High(SRec.Tables) do
    SRec.Tables[i] := '';
end;

{ AddSlash -- returns 'Path' string with trailing backslash }
function AddSlash(var Path: String): String;
begin
  if Path[Length(Path)] <> '\' then
    Result:= Path + '\'
  else
    Result := Path;
end;

{ RemoveFirstWord --  returns the initial substring up to 'Delimiter'. Adjust 'S'
  to contain remainder of string (skipping over 'Delimiter') }
function RemoveFirstWord(var S : String; Delimiter: Char) : String;
var
  i  : Integer;
  S1 : String;
begin
  i := Pos(delimiter, S);
  if i = 0 then begin
    RemoveFirstWord := S;
    Exit;
  end;
  S1 := Copy(S, 0, i-1);
  S := Copy(S, i + 1, Length(S));
  RemoveFirstWord := S1;
end;

{ KillExt -- make sure table name has NO extension ... works in place}
function KillExt(TableName: PChar): PChar;
var
  WorkExt : String;
begin
  WorkExt := ExtractFileExt(StrPas(TableName));
  if (Length(WorkExt) > 0) then
    StrPCopy(TableName, Copy(StrPas(TableName), 1, (StrLen(TableName) - (Length(WorkExt)))));
  Result := TableName;
end;

{ NeedsExt -- make sure table name has a '.DB' extension ... works in place}
function NeedsExt(TableName: PChar): PChar;
var
  WorkExt : String;
begin
  if (StrLen(TableName) > 0) then         { only convert if not empty }
  begin
    WorkExt := ExtractFileExt(StrPas(TableName));
    if (Length(WorkExt) = 0) then
      StrCat(TableName, '.DB');           { only Paradox rebuild supported }
  end;
  Result := TableName;
end;


{$IFDEF TRIAL_COMPILE}
{$I ..\Common\trialchk.int}
{$ENDIF}

initialization
  ReRaiseDBExceptions := False;           { assume exceptions not desired by calling routine }
  VerboseDBResponse := True;              { assume verbose responses desired }
{$IFDEF TRIAL_COMPILE}
  if not TrialCheck then
    Halt;
{$ENDIF}


end.
