unit BDEUtil;

{*************************************************************************

  BDEUtil.PAS -- Database Maintenance callback unit which accompanies
                 the Delphi Database Maintenance API for Paradox and DBASE
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

                 Copyright (c) 1997 by Logic Process Corporation,
                 Dallas, Texas USA. Protected by international law.
                 All rights reserved.

 IMPORTANT: This API carries no warranties, either expressed or implied.
            Use of this API and the underlying Borland International
            Database Engine and TUTILITY.DLL (TUTIL32.DLL) table maintenance
            libraries are at your own risk. Logic Process Corporation
            assumes no responsibility for any loss of information resulting
            from the use of this API or the Borland products aforementioned.

**************************************************************************}

interface

uses DB, DBTables, Tutil,
{$IFDEF WIN32}
BDE;
{$ELSE}
WinTypes, WinProcs, DbiProcs, DbiTypes, DbiErrs;
{$ENDIF}

type

  TCBType = (tcbtVerify, tcbtRebuild);

  TBDEUtil = class;

  TBDEUtil = class
    CbInfo: TUVerifyCallback;
    TUProps: CURProps;
    hDb: hDBIDb;
    vhTSes: hTUSes;
{$IFNDEF WIN32}
    FCBProcInst: TFarProc;
{$ENDIF}
    constructor Create;
    destructor Destroy; override;
    function GetTCursorProps(szTable: String): Boolean;
    procedure RegisterCallBack(CallbackType: TCBType);
    procedure UnRegisterCallBack(CallbackType: TCBType);
  end;

implementation

uses Forms, SysUtils,
{$IFDEF TRIAL_VERSION}
{ only one actual source unit, but shipped 4 DCUs for demo convenience }
{$IFDEF WIN32}
{$IFDEF VER130} { Delphi 5 }
  DBUnit5;
{$ELSE}
{$IFDEF VER120} { Delphi 4 }
  DBUnit4;
{$ELSE}
{$IFDEF VER100} { Delphi 3 }
  DBUnit3;
{$ELSE}         { Delphi 2 }
  DBUnit;
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ELSE}         { Delphi 1 }
  DBUnit16;
{$ENDIF}
{$ELSE}         { Non-trial ... all use 'DBUnit.PAS' }
  DBUnit;
{$ENDIF}

{ Sample Call back function ... application specific }
{$IFDEF WIN32}
function GenProgressCallBack(ecbType: CBType; Data: LongInt; pcbInfo: Pointer): CBRType; stdcall;
{$ELSE}
function GenProgressCallBack(ecbType: CBType; Data: LongInt; pcbInfo: Pointer): CBRType; export;
{$ENDIF}
var
  CBInfo: TUVerifyCallBack;
begin
  CBInfo := TUVerifyCallBack(pcbInfo^);
  if ecbType = cbGENPROGRESS then
  begin
    case CBInfo.Process of
     TUVerifyHeader:
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Header Verification: ' + IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TUVerifyIndex:
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Primary Index Verification: ' + IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TUVerifyData:
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Data Verification: ' + IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TUVerifySXHeader:
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Secondary Index Header: ' + IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TUVerifySXIndex:
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Secondary Index: ' + IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TUVerifySXData:
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Secondary Index Data: ' + IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TUVerifySXIntegrity:
     begin
       { place application-specific code here *** NOTE: Current/Total Index Counts available here ***
       Form1.Label1.Caption := 'Secondary Index [' + IntToStr(CBInfo.CurrentIndex) + ' of ' +
                               IntToStr(CBInfo.TotalIndex) + '] Header Verification: ' +
                               IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TUVerifyTableName:
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Verify Table Name: ' + IntToStr(CBInfo.PercentDone) + ' percent complete';
       }
     end;
     TURebuild:
     begin
       { place application-specific code here *** NOTE: Rebuild callback slightly different ***
       if (CBInfo.PercentDone >= 0) And (CBInfo.PercentDone <= 100) then
         Form1.Label1.Caption := 'Table Rebuild: ' + IntToStr(CBInfo.PercentDone) + ' percent complete'
       else
         Form1.Label1.Caption := StrPas(pCBPROGRESSDesc(@CBInfo)^.szMsg);
       }
     end;
     else
     begin
       { place application-specific code here
       Form1.Label1.Caption := 'Unknown Callback';
       }
     end;

    end;

  end;

  Application.ProcessMessages;

  Result := cbrUSEDEF;
end;

{$IFNDEF WIN32}
{ 16-bit Rebuild callback requires a special routine }
function GenRebuild16ProgressCallBack(ecbType: CBType; Data: LongInt; pcbInfo: Pointer): CBRType; export;
var
  CBInfo: CBPROGRESSDesc;
begin
  CBInfo := CBPROGRESSDesc(pcbInfo^);
  if ecbType = cbGENPROGRESS then
  begin
    { place application-specific code here
    if (CBInfo.iPercentDone >= 0) then
      Form1.Label1.Caption := 'Rebuilding Table: ' + IntToStr(CBInfo.iPercentDone) + ' percent complete'
    else
      Form1.Label1.Caption := StrPas(CBInfo.szMsg);
    }
  end;
  Application.ProcessMessages;
  Result := cbrUSEDEF;
end;
{$ENDIF}


constructor TBDEUtil.Create;
begin
{$IFNDEF WIN32}
  FCBProcInst := nil;
{$ENDIF}
  Check(TUInit(vhtSes));
end;

destructor TBDEUtil.Destroy;
begin
  Check(TUExit(vhtSes));
  inherited Destroy;
end;

function TBDEUtil.GetTCursorProps(szTable: String): Boolean;
var
  TableName: DBITBLNAME;
begin
  if TUFillCURProps(vHtSes, DBANSIToNative(szTable, TableName, (SizeOf(TableName) - 1)), TUProps) = DBIERR_NONE then
    Result := True
  else Result := False;
end;

{$IFDEF WIN32}
procedure TBDEUtil.RegisterCallback(CallbackType: TCBType);
begin
  Check(DbiRegisterCallBack(nil, cbGENPROGRESS, 0, sizeof(TUVerifyCallBack), @CbInfo,
        GenProgressCallback));
end;

procedure TBDEUtil.UnRegisterCallback(CallbackType: TCBType);
begin
  Check(DbiRegisterCallBack(nil, cbGENPROGRESS, 0, sizeof(TUVerifyCallBack), @CbInfo, nil));
end;
{$ELSE}
procedure TBDEUtil.RegisterCallback(CallbackType: TCBType);
begin
  case CallbackType of
  tcbtVerify:
    begin
      FCBProcInst := MakeProcInstance(@GenProgressCallback, HInstance);
      if (FCBProcInst <> nil) then
        Check(DbiRegisterCallBack(nil, cbGENPROGRESS, 0, sizeof(TUVerifyCallBack), @CbInfo,
              pFDBICallBack(FCBProcInst)));
    end;
  tcbtRebuild:
    begin
      FCBProcInst := MakeProcInstance(@GenRebuild16ProgressCallBack, HInstance);
      if (FCBProcInst <> nil) then
        Check(DbiRegisterCallBack(nil, cbGENPROGRESS, 0, sizeof(CBPROGRESSDesc), @CbInfo,
              pFDBICallBack(FCBProcInst)));
    end;
  end;
end;

procedure TBDEUtil.UnRegisterCallback(CallbackType: TCBType);
begin
  if (FCBProcInst <> nil) then
  begin
    case CallbackType of
    tcbtVerify:
      begin
        Check(DbiRegisterCallBack(nil, cbGENPROGRESS, 0, sizeof(TUVerifyCallBack), @CbInfo, nil));
      end;
    tcbtRebuild:
      begin
        Check(DbiRegisterCallBack(nil, cbGENPROGRESS, 0, sizeof(CBPROGRESSDesc), @CbInfo, nil));
      end;
    end;
    FreeProcInstance(FCBProcInst);
    FCBProcInst := nil;
  end;
end;
{$ENDIF}

end.
