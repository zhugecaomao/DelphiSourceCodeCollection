unit Tutil;

interface

{$IFDEF WIN32}
uses Bde;
{$ELSE}
uses DbiProcs, DbiTypes, DbiErrs;
{$ENDIF}

{ TUtility (TUVerifyTable) Session Options }
const
  TU_Append_Errors = 1;
  TU_No_Secondary  = 2;
  TU_No_Warnings   = 4;
  TU_Header_Only   = 8;
  TU_Dialog_Hide   = 16;
  TU_No_Lock       = 32;

{ TUtility type definitions }
type
  hTUses  = Word;
  phTUses = ^hTUses;
  { Verify Callback processes }
  TUVerifyProcess = (TUVerifyHeader, TUVerifyIndex, TUVerifyData, TUVerifySXHeader,
                     TUVerifySXIndex, TUVerifySXData, TUVerifySXIntegrity,
                     TUVerifyTableName, TURebuild);
  { Call back info for Verify Callback function }
  TUVerifyCallBack = record
    PercentDone:     Word;
    TableName:       DBIPath;
    Process:         TUVerifyProcess;
{$IFDEF WIN32}
    Dummy1:          Byte;
    Dummy2:          Byte;
    Dummy3:          Byte;
    CurrentIndex:    Byte;
    Dummy4:          Byte;
    TotalIndex:      Byte;
{$ELSE}
    Dummy1:          Byte;
    CurrentIndex:    Byte;
    Dummy2:          Byte;
    TotalIndex:      Byte;
{$ENDIF}
  end;

{ TUtility functions }
{$IFDEF WIN32}
function TUInit(var hTUSession: hTUses): DBIResult;  stdcall;

function TUVerifyTable(hTUSession: hTUses;
                       pszTableName,
                       pszDriverType,
                       pszErrTableName,
                       pszPassword: PChar;
                       iOptions: integer;
                       var piErrorLevel: Integer): DBIResult; stdcall;

function TURebuildTable(hTUSession: hTUses;
                        pszTableName,
                        pszDriverType,
                        pszBackupTableName,
                        pszKeyviolName,
                        pszProblemTableName: PChar;
                        pCrDesc: pCRTblDesc): DBIResult; stdcall;

function TUGetCRTblDescCount(hTUSession: hTUses;
                             pszTableName: PChar;
                             var iFldCount,
                             iIdxCount,
                             iSecRecCount,
                             iValChkCount,
                             iRintCount,
                             iOptParams,
                             iOptDataLen: word): DBIResult; stdcall;

function TUFillCRTblDesc(hTUSession: hTUses;
                         pCrDesc: pCRTblDesc;
                         pszTableName,
                         pszPassword: PChar): DBIResult; stdcall;

function TUFillCURProps(hTUSession: hTUses;
                        pszTableName: PChar;
                        var tblProps: CURProps): DBIResult; stdcall;

function TUGetExtTblProps(hTUSession: hTUses;
                          pszTableName: PChar;
                          var pTS: TimeStamp;
                          var pbReadOnly: Boolean): DBIResult; stdcall;

function TUExit(hTUSession: hTUses): DBIResult; stdcall;

function TUGetErrorString(iErrorcode: DBIResult;
                          pszError: PChar): DBIResult; stdcall;
{$ELSE}
function TUInit(var hTUSession: hTUses): DBIResult;

function TUVerifyTable(hTUSession: hTUses;
                       pszTableName,
                       pszDriverType,
                       pszErrTableName,
                       pszPassword: PChar;
                       iOptions: integer;
                       var piErrorLevel: Word): DBIResult;

function TURebuildTable(hTUSession: hTUses;
                        pszTableName,
                        pszDriverType,
                        pszBackupTableName,
                        pszKeyviolName,
                        pszProblemTableName: PChar;
                        pCrDesc: pCRTblDesc): DBIResult;

function TUGetCRTblDescCount(hTUSession: hTUses;
                             pszTableName: PChar;
                             var iFldCount,
                             iIdxCount,
                             iSecRecCount,
                             iValChkCount,
                             iRintCount,
                             iOptParams,
                             iOptDataLen: word): DBIResult;

function TUFillCRTblDesc(hTUSession: hTUses;
                         pCrDesc: pCRTblDesc;
                         pszTableName,
                         pszPassword: PChar): DBIResult;

function TUFillCURProps(hTUSession: hTUses;
                        pszTableName: PChar;
                        var tblProps: CURProps): DBIResult;

function TUGetExtTblProps(hTUSession: hTUses;
                          pszTableName: PChar;
                          var pTS: TimeStamp;
                          var pbReadOnly: Boolean): DBIResult;

function TUExit(hTUSession: hTUses): DBIResult;

function TUGetErrorString(iErrorcode: DBIResult;
                          pszError: PChar): DBIResult;
{$ENDIF}

implementation

const
{$IFDEF WIN32}
  TU_DLL = 'TUTIL32.DLL';
{$ELSE}
  TU_DLL = 'TUTILITY';
{$ENDIF}

function TUInit;              external TU_DLL name 'TUInit';
function TUVerifyTable;       external TU_DLL name 'TUVerifyTable';
function TURebuildTable;      external TU_DLL name 'TURebuildTable';
function TUGetCRTblDescCount; external TU_DLL name 'TUGetCRTblDescCount';
function TUFillCRTblDesc;     external TU_DLL name 'TUFillCRTblDesc';
function TUFillCURProps;      external TU_DLL name 'TUFillCURProps';
function TUGetExtTblProps;    external TU_DLL name 'TUGetExtTblProps';
function TUExit;              external TU_DLL name 'TUExit';
function TUGetErrorString;    external TU_DLL name 'TUGetErrorString';

end.









