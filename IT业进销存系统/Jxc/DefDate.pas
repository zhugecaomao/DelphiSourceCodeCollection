unit DefDate;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Spin, iniFiles;

type
  TfrmDefDate = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    RadioGroup1: TRadioGroup;
    edtDay: TSpinEdit;
    dtpRqa: TDateTimePicker;
    dtpRqb: TDateTimePicker;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FileName, KeyName: string;
  public
    { Public declarations }
  end;

var
  frmDefDate: TfrmDefDate;

implementation

uses Main;

{$R *.DFM}

procedure TfrmDefDate.FormShow(Sender: TObject);
var
  iniFile: TIniFile;
begin
  FileName := ExtractFilePath(Application.ExeName) + 'System\DefD' +
    FormatFloat('0000', pintUserId) + '.ini' ;
  KeyName := screen.ActiveCustomForm.Name;
  iniFile := TiniFile.Create(FileName);
  with iniFile do
  begin
    RadioGroup1.ItemIndex := ReadInteger(KeyName, 'ItemIndex', 0);
    edtDay.Value := ReadInteger(KeyName, 'Day', 1);
    dtpRqa.Date := ReadDate(KeyName, 'DateA', Date);
    dtpRqb.Date := ReadDate(KeyName, 'DateB', Date);
  end;
end;

procedure TfrmDefDate.OKBtnClick(Sender: TObject);
var
  iniFile: TIniFile;
begin
  iniFile := TiniFile.Create(FileName);
  with iniFile do
  begin
    WriteInteger(KeyName, 'ItemIndex', RadioGroup1.ItemIndex);
    WriteInteger(KeyName, 'Day', edtDay.Value);
    WriteDate(KeyName, 'DateA', dtpRqa.Date);
    WriteDate(KeyName, 'DateB', dtpRqb.Date);
  end;
  Close;
end;

procedure TfrmDefDate.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDefDate.RadioGroup1Click(Sender: TObject);
begin
  edtDay.Enabled := RadioGroup1.ItemIndex = 2;
  dtpRqa.Enabled := RadioGroup1.ItemIndex = 3;
  dtpRqb.Enabled := dtpRqa.Enabled;
end;

end.
