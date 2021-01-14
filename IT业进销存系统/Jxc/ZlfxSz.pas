unit ZlfxSz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm, IniFiles;

type
  TfrmZlfxSz = class(TfrmComForm)
    btnCancel: TBitBtn;
    labRq: TLabel;
    btnOk: TBitBtn;
    dtpRq: TDateTimePicker;
    GroupBox1: TGroupBox;
    BT1: TEdit;
    TS1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    BT2: TEdit;
    TS2: TEdit;
    BT3: TEdit;
    TS3: TEdit;
    BT4: TEdit;
    TS4: TEdit;
    BT5: TEdit;
    TS5: TEdit;
    BT6: TEdit;
    TS6: TEdit;
    BT7: TEdit;
    TS7: TEdit;
    BT8: TEdit;
    TS8: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    btnIni: TBitBtn;
    procedure FormShow(Sender: TObject);virtual;
    procedure btnOkClick(Sender: TObject);virtual;
    procedure btnIniClick(Sender: TObject);virtual;
    procedure TS1Exit(Sender: TObject);virtual;
    procedure TS1Change(Sender: TObject);virtual;
  private
    { Private declarations }
    iniPos : TIniFile;
    procedure SetBT;
  public
    { Public declarations }
    IniName: string;
  end;

var
  frmZlfxSz: TfrmZlfxSz;

implementation

uses ComFun;

{$R *.DFM}

procedure TfrmZlfxSz.FormShow(Sender: TObject);
begin
  dtpRq.Date := Date;
  iniPos := TiniFile.Create( ExtractFilePath(Application.ExeName) + 'System\' +
          IniName + '.ini');
  with iniPos do
  begin
    TS1.Text := ReadString('TS', 'TS1', '30');
    TS2.Text := ReadString('TS', 'TS2', '60');
    TS3.Text := ReadString('TS', 'TS3', '90');
    TS4.Text := ReadString('TS', 'TS4', '180');
    TS5.Text := ReadString('TS', 'TS5', '270');
    TS6.Text := ReadString('TS', 'TS6', '365');
    TS7.Text := ReadString('TS', 'TS7', '730');
    Free;
  end;
  SetBT;
end;

procedure TfrmZlfxSz.btnOkClick(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to 7 do
    TS1Exit(self.FindComponent('TS' + IntToStr(i)));
  iniPos := TiniFile.Create( ExtractFilePath(Application.ExeName) + 'System\' +
          IniName + '.ini');
  with iniPos do
  begin
    WriteString('TS', 'TS1', TS1.Text);
    WriteString('TS', 'TS2', TS2.Text);
    WriteString('TS', 'TS3', TS3.Text);
    WriteString('TS', 'TS4', TS4.Text);
    WriteString('TS', 'TS5', TS5.Text);
    WriteString('TS', 'TS6', TS6.Text);
    WriteString('TS', 'TS7', TS7.Text);
    Free;
  end;
  Close;
  self.ModalResult := MROK;
end;

procedure TfrmZlfxSz.btnIniClick(Sender: TObject);
begin
  TS1.Text := '30';
  TS2.Text := '60';
  TS3.Text := '90';
  TS4.Text := '180';
  TS5.Text := '270';
  TS6.Text := '365';
  TS7.Text := '730';
  SetBT;
end;

procedure TfrmZlfxSz.SetBT;
var
  i, b, e: integer;
begin
  b := 1;
  for i := 1 to 7 do
  begin
    e := StrToInt(TEdit(self.FindComponent('TS' + IntToStr(i))).Text);
    TEdit(self.FindComponent('BT' + IntToStr(i))).Text := Format('%d至%d天', [b, e]);
    b := e + 1;
  end;
  BT8.Text := Format('%d天以上', [e]);
end;

procedure TfrmZlfxSz.TS1Exit(Sender: TObject);
var
  s: string;
begin
  if Sender <> TS1 then
  begin
    s := 'TS' + IntTostr(StrToInt(Copy(TEdit(Sender).Name, 3 , 1)) - 1);
    if StrToInt(TEdit(Sender).Text) <= StrToInt(TEdit(self.FindComponent(s)).Text) then
    begin
      Application.MessageBox('此次输入的天数不能小于或等于上条记录输入的天数!', '帐龄分组设置', MB_OK + MB_ICONWARNING);
      TEdit(Sender).SetFocus;
      Abort;
    end;
  end;
  SetBT;
end;

procedure TfrmZlfxSz.TS1Change(Sender: TObject);
var
  i: integer;
  s: string;
begin
  s := '';
  for i := 1 to Length(TEdit(Sender).Text) do
    if Pos(TEdit(Sender).Text[i], '0123456789') > 0 then
      s := s + TEdit(Sender).Text[i];
  TEdit(Sender).Text := s;
end;

end.
