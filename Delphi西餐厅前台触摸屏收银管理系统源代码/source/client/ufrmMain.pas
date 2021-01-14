unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, WinSkinData, dxfColorButton,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer;

type
  TfrmMain = class(TForm)
    MonthSet: TMonthCalendar;
    bbtnConfirm: TBitBtn;
    Label1: TLabel;
    bbtnChange: TBitBtn;
    eHour: TEdit;
    Label2: TLabel;
    eMinute: TEdit;
    Label3: TLabel;
    eSecond: TEdit;
    SkinData1: TSkinData;
    btnNum0: TdxfColorButton;
    btnNum1: TdxfColorButton;
    btnNum2: TdxfColorButton;
    btnNum3: TdxfColorButton;
    btnNum4: TdxfColorButton;
    btnNum5: TdxfColorButton;
    btnNum6: TdxfColorButton;
    btnNum7: TdxfColorButton;
    btnNum8: TdxfColorButton;
    btnNum9: TdxfColorButton;
    IdUDPServer1: TIdUDPServer;
    procedure bbtnChangeClick(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
  private
    Fs_Hour, Fs_Minute, Fs_Second: String;
    Fi_Flag: Integer;
    procedure prip_IniInterFace;
    procedure prip_IniData;
    procedure OnEditEnter(Sender: TObject);
    //procedure OnEditExit(Sender: TObject);
    procedure OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function prif_CheckTime: Boolean;
  public
    procedure pubp_Ini; 
  end;

var
  frmMain: TfrmMain;

implementation
uses StrUtils, DateUtils, ufrmLogin, udmData, upubCommon, uPubClient;
{$R *.dfm}

procedure TfrmMain.prip_IniData;
var
  ls_Time: String;
begin
  ls_Time := FormatDateTime('HH:MM:SS', Now);
  Fs_Hour := MidStr(ls_Time, 1, 2);
  Fs_Minute := MidStr(ls_Time, 4, 2);
  Fs_Second := MidStr(ls_Time, 7, 2);
  eHour.Text := Fs_Hour;
  eMinute.Text := Fs_Minute;
  eSecond.Text := Fs_Second;
  MonthSet.Date := Date;
  MonthSet.Refresh;
  Fi_Flag := 0;
end;

procedure TfrmMain.prip_IniInterFace;
begin
  eHour.OnEnter := OnEditEnter;
  eMinute.OnEnter := OnEditEnter;
  eSecond.OnEnter := OnEditEnter;
  btnNum0.OnMouseDown := OnBbtnNumClick;
  btnNum1.OnMouseDown := OnBbtnNumClick;
  btnNum2.OnMouseDown := OnBbtnNumClick;
  btnNum3.OnMouseDown := OnBbtnNumClick;
  btnNum4.OnMouseDown := OnBbtnNumClick;
  btnNum5.OnMouseDown := OnBbtnNumClick;
  btnNum6.OnMouseDown := OnBbtnNumClick;
  btnNum7.OnMouseDown := OnBbtnNumClick;
  btnNum8.OnMouseDown := OnBbtnNumClick;
  btnNum9.OnMouseDown := OnBbtnNumClick;
  bbtnChange.Visible := PowerInfo.ChangeDateTime;
  WindowState := wsMaximized;
end;

procedure TfrmMain.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmMain.OnEditEnter(Sender: TObject); 
begin
  if Sender is TEdit then
  begin
    Fi_Flag := (Sender as TEdit).Tag;
    //(Sender as TEdit).Clear;
    (Sender as TEdit).SelectAll;
  end;
end;

procedure TfrmMain.OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
begin
  Case Fi_Flag of
    0:
    begin
      if Length(Trim(eHour.Text)) >= 2 then
      begin
        Fs_Hour := '';
        eHour.Clear;
      end;
      Fs_Hour := Fs_Hour + LeftStr((Sender as TdxfColorButton).Caption.Text, 1);
      eHour.Text := Fs_Hour
      //StringReplace(Fs_Hour, #10, '', [rfReplaceAll, rfIgnoreCase]);
    end;
    1:
    begin   
      if Length(Trim(eMinute.Text)) >= 2 then
      begin
        Fs_Minute := '';
        eMinute.Clear;
      end;
      Fs_Minute := LeftStr((Sender as TdxfColorButton).Caption.Text, 1);
      eMinute.Text := eMinute.Text + Fs_Minute;
        {StringReplace(Fs_Minute, #13, '',
        [rfReplaceAll, rfIgnoreCase]);}
    end;
    2:
    begin
      if Length(Trim(eSecond.Text)) >= 2 then
      begin
        Fs_Second := '';
        eSecond.Clear;
      end;
      Fs_Second := Fs_Second + LeftStr((Sender as TdxfColorButton).Caption.Text, 1);
      eSecond.Text := Fs_Second;
      //StringReplace(Fs_Second, #13, '', [rfReplaceAll, rfIgnoreCase]);;
    end;
  end;
end;

{procedure TfrmMain.OnEditExit(Sender: TObject);
begin
  if Sender is TEdit then
  begin
    Case (Sender as TEdit).Tag of
      0:
      begin
      end;
      1:
      begin
        if StrToInt((Sender as Tedit).Text) > 59 then
        begin
          Application.MessageBox('时钟最大不能超过59', '错误', MB_OK + MB_ICONWARNING); 
          (Sender as TEdit).SelectAll;
        end;
      end;
      2:
      begin
        if StrToInt((Sender as Tedit).Text) > 59 then
        begin
          Application.MessageBox('时钟最大不能超过59', '错误', MB_OK + MB_ICONWARNING); 
          (Sender as TEdit).SelectAll;
        end;
      end;
    end;
  end;
end;  }

function TfrmMain.prif_CheckTime: Boolean;
begin
  if StrToInt(eHour.Text) > 23 then
  begin
    Application.MessageBox('时钟最大不能超过23', '错误', MB_OK + MB_ICONWARNING);
    eHour.SelectAll;
    Result := False;
    Exit;
  end;
  if StrToInt(eMinute.Text) > 59 then
  begin
    Application.MessageBox('分钟最大不能超过59', '错误', MB_OK + MB_ICONWARNING);
    eMinute.SelectAll;    
    Result := False;
    Exit;
  end;
  if StrToInt(eSecond.Text) > 59 then
  begin
    Application.MessageBox('秒钟最大不能超过59', '错误', MB_OK + MB_ICONWARNING);
    eSecond.SelectAll; 
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmMain.bbtnChangeClick(Sender: TObject);
var
  ls_DateTime: TSystemTime;
begin
  if not prif_CheckTime then Exit;
  DecodeDate(MonthSet.Date, ls_DateTime.wYear, ls_DateTime.wMonth, ls_DateTime.wDay);
  DecodeTime(StrToTime(eHour.Text + ':' +  eMinute.Text + ':' + eSecond.Text),
    ls_DateTime.wHour, ls_DateTime.wMinute, ls_DateTime.wSecond,
    ls_DateTime.wMilliseconds);
  {ls_DateTime.wYear := YearOf(MonthSet.Date);
  ls_DateTime.wMonth := MonthOf(MonthSet.Date);
  ls_DateTime.wDay := DayOf(MonthSet.Date);
  ls_DateTime.wDayOfWeek := WeekOf(MonthSet.Date);
  ls_DateTime.wHour := StrToInt(eHour.Text);
  ls_DateTime.wMinute := StrToInt(eMinute.Text);
  ls_DateTime.wSecond := StrToInt(eSecond.Text);
  ls_DateTime.wMilliseconds := 100; }
  //howMessage(IntToStr(ls_DateTime.wMinute));
  if ls_DateTime.wHour < 8 then
  begin
    ls_DateTime.wDay := ls_DateTime.wDay - 1;
    ls_DateTime.wHour := 16 + ls_DateTime.wHour;
  end
  else
  begin
    ls_DateTime.wHour := ls_DateTime.wHour - 8;
  end;
  Windows.SetSystemTime(ls_DateTime);
  prip_IniData;
end;

procedure TfrmMain.bbtnConfirmClick(Sender: TObject);
begin
  ModalResult := mrOk;
end; 

end.
