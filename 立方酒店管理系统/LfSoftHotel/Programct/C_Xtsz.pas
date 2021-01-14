unit C_Xtsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, IniFiles, C_CtDefine;

type
  TXtszForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    btnClose: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    ComboBox1: TComboBox;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure ReadIniFile;
    procedure WriteIniFile;
    procedure ShowIni;
    procedure ExcuteIni;
  public
    { Public declarations }
  end;

var
  XtszForm: TXtszForm;

procedure Xtsz;

implementation

{$R *.dfm}

procedure Xtsz;
begin
  XtszForm := TXtszForm.Create(Application);
  try
    with XtszForm do
    begin
      ReadIniFile;
      ShowIni;
      ShowModal;
    end;
  finally
    XtszForm.Free;
  end;
end;

procedure TXtszForm.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  PORTNUM := IniFile.ReadInteger('PORT','ICPORTNUM',0);
  IniFile.Free;
end;

procedure TXtszForm.ShowIni;
begin
  ComboBox1.ItemIndex := PORTNUM;
end;

procedure TXtszForm.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  IniFile.WriteInteger('PORT','ICPORTNUM',PORTNUM);
  IniFile.Free;
end;

procedure TXtszForm.ExcuteIni;
begin
  PORTNUM := ComboBox1.ItemIndex;
end;


procedure TXtszForm.btnOkClick(Sender: TObject);
begin
  ExcuteIni;
  WriteIniFile;
  Close;
end;

end.
