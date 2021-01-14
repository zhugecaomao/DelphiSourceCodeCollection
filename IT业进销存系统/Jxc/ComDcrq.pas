unit ComDcrq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDczl, ActnList, Menus, ComCtrls, DBCtrls, ToolWin, ExtCtrls, StdCtrls,
  Grids, DBGrids, iniFiles;

type
  TfrmComDcrq = class(TfrmComDczl)
    CheckBox1: TCheckBox;
    dtpRqa: TDateTimePicker;
    labRqa: TLabel;
    dtpRqb: TDateTimePicker;
    aViewMode: TAction;
    aSetViewMode: TAction;
    aDefDate: TAction;
    N3: TMenuItem;
    mnuDefDate: TMenuItem;
    mnuViewMode: TMenuItem;
    mnuSetViewMode: TMenuItem;
    procedure aDefDateExecute(Sender: TObject);virtual;
    procedure aViewModeExecute(Sender: TObject);virtual;
    procedure aSetViewModeExecute(Sender: TObject);virtual;
    procedure FormCreate(Sender: TObject);override;
    procedure dtpRqaEnter(Sender: TObject);virtual;
    procedure dtpRqaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);virtual;
    procedure dtpRqaCloseUp(Sender: TObject);virtual;
    procedure CheckBox1Click(Sender: TObject);virtual;
  private
    { Private declarations }
    procedure SetDefDate;
  public
    { Public declarations }
  end;

var
  frmComDcrq: TfrmComDcrq;

implementation

uses DefDate, Main, ComFun;

{$R *.DFM}

//Form.Create
procedure TfrmComDcrq.FormCreate(Sender: TObject);
begin
  inherited;
  SetDefDate;
end;

//aDefDate.Execute
procedure TfrmComDcrq.aDefDateExecute(Sender: TObject);
begin
  frmDefDate := TfrmDefDate.Create(self);
  frmDefDate.ShowModal;
  frmDefDate.Free;
  SetDefDate;
  OpenDataSet;
end;

//aViewMode.Execute
procedure TfrmComDcrq.aViewModeExecute(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox1.Checked;
  aViewMode.Checked := CheckBox1.Checked;
  aSetViewMode.Enabled := CheckBox1.Checked;
end;

//aSetViewMode.Execute
procedure TfrmComDcrq.aSetViewModeExecute(Sender: TObject);
begin
  if dtpRqa.Enabled then
    if screen.ActiveControl.Name = 'dtpRqa' then
      dtpRqb.SetFocus
    else
      dtpRqa.SetFocus;
end;

//dtpRqa.Enter  (dtpRqa, dtpRqb)
procedure TfrmComDcrq.dtpRqaEnter(Sender: TObject);
begin
  aModify.ShortCut := 0;
end;

//dtpRqa.CloseUp
procedure TfrmComDcrq.dtpRqaCloseUp(Sender: TObject);
begin
  aModify.ShortCut := VK_RETURN;
  If dsJbzl <> nil then
    OpenDataSet;
  DBGrid1.SetFocus;
end;

//dtpRqa.KeyDown
procedure TfrmComDcrq.dtpRqaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_RETURN then
  begin
    Key := 0;
    dtpRqaCloseUp(nil);
  end;
end;

//CheckBox1.Click
procedure TfrmComDcrq.CheckBox1Click(Sender: TObject);
begin
  dtpRqa.Enabled := CheckBox1.Checked;
  dtpRqb.Enabled := CheckBox1.Checked;
  labRqa.Enabled := CheckBox1.Checked;
  OpenDataSet;
  DBGrid1.SetFocus;
end;

procedure TfrmComDcrq.SetDefDate;
var
  iniFile: TIniFile;
  evn: TNotifyEvent;
begin
  iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) +
    'System\DefD' + FormatFloat('0000', pintUserId) + '.ini');
  with iniFile do
  begin
    case ReadInteger(self.Name, 'ItemIndex', 0) of
      0:
      begin
        dtpRqa.Date := Date;
        dtpRqb.Date := Date;
      end;
      1:
      begin
        dtpRqa.Date := BOFM(Date);
        dtpRqb.Date := EOFM(Date);
      end;
      2:
      begin
        dtpRqa.Date := Date - ReadInteger(self.Name, 'Day', 0);
        dtpRqb.Date := Date;
      end;
      3:
      begin
        dtpRqa.Date := ReadDate(self.Name, 'DateA', Date);
        dtpRqb.Date := ReadDate(self.Name, 'DateB', Date);
      end;
      4:
      begin
        dtpRqa.Date := Date;
        dtpRqb.Date := Date;
        dtpRqa.Enabled := False;
        dtpRqb.Enabled := False;
        evn := CheckBox1.OnClick;
        CheckBox1.OnClick := nil;
        CheckBox1.Checked := false;
        CheckBox1.OnClick := evn;
      end;
    end;
    Free;
  end;
end;

end.
