{*******************************************************}
{ 更新此单元的代码，可能要同时更新ComDcrq的代码         }
{*******************************************************}

unit ComDjzb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ComDj, ActnList, iniFiles;

type
  TfrmComDjzb = class(TfrmComJbzl)
    smnView: TMenuItem;
    pmnView: TMenuItem;
    CheckBox1: TCheckBox;
    dtpRqa: TDateTimePicker;
    dtpRqb: TDateTimePicker;
    labRqa: TLabel;
    aView: TAction;
    aViewMode: TAction;
    aSetViewMode: TAction;
    LineE5: TMenuItem;
    mnuViewMode: TMenuItem;
    mnuSetViewMode: TMenuItem;
    aDefDate: TAction;
    mnuDefDate: TMenuItem;
    procedure FormCreate(Sender: TObject);override;
    procedure SetButton;override;
    procedure CheckBox1Click(Sender: TObject);virtual;
    procedure dtpRqaCloseUp(Sender: TObject);virtual;
    procedure LoadEditForm(strState:string);override;
    procedure dtpRqaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);virtual;
    procedure dtpRqaEnter(Sender: TObject);virtual;
    procedure aDelExecute(Sender: TObject);override;
    procedure aViewExecute(Sender: TObject);virtual;
    procedure aViewModeExecute(Sender: TObject);virtual;
    procedure aSetViewModeExecute(Sender: TObject);virtual;
    procedure aDefDateExecute(Sender: TObject);virtual;
  private
    { Private declarations }
    procedure SetDefDate;
  public
    { Public declarations }
    frmDj:TfrmComDj;
  end;

var
  frmComDjzb: TfrmComDjzb;

implementation

uses DefDate, Common, ComFun, Main;

{$R *.DFM}

//Form.Create
procedure TfrmComDjzb.FormCreate(Sender: TObject);
begin
  inherited;
  SetDefDate;
end;

//aDel.Execute
procedure TfrmComDjzb.aDelExecute(Sender: TObject);
begin
  if not dsJbzl.IsEmpty Then
  begin
    If HaveDetail(dsJbzl, strDetailTables, strDetailWheres) Then
      Application.MessageBox('已有明细资料,不能删除!', '资料删除', MB_OK + MB_ICONWARNING)
    else
    begin
      if Application.MessageBox('确定要删除此单吗',
        '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        dsJbzl.Delete;
        dsJbzl.ApplyUpdates(0);
        SetButton;
      end;
    end;
  end;
end;

//aView.Execute
procedure TfrmComDjzb.aViewExecute(Sender: TObject);
begin
  LoadEditForm('V');
end;

//dtpRqa.Enter  (dtpRqa, dtpRqb)
procedure TfrmComDjzb.dtpRqaEnter(Sender: TObject);
begin
  aModify.ShortCut := 0;
end;

//dtpRqa.CloseUp
procedure TfrmComDjzb.dtpRqaCloseUp(Sender: TObject);
begin
  aModify.ShortCut := VK_RETURN;
  If dsJbzl <> nil then
    OpenDataSet;
  DBGrid1.SetFocus;
end;

//dtpRqa.KeyDown
procedure TfrmComDjzb.dtpRqaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_RETURN then
  begin
    Key := 0;
    dtpRqaCloseUp(nil);
  end;
end;

//aViewMode.Execute
procedure TfrmComDjzb.aViewModeExecute(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox1.Checked;
  aViewMode.Checked := CheckBox1.Checked;
  aSetViewMode.Enabled := CheckBox1.Checked;
end;

//aSetViewMode.Execute
procedure TfrmComDjzb.aSetViewModeExecute(Sender: TObject);
begin
  if dtpRqa.Enabled then
    if screen.ActiveControl.Name = 'dtpRqa' then
      dtpRqb.SetFocus
    else
      dtpRqa.SetFocus;
end;

//CheckBox1.Click
procedure TfrmComDjzb.CheckBox1Click(Sender: TObject);
begin
  dtpRqa.Enabled := CheckBox1.Checked;
  dtpRqb.Enabled := CheckBox1.Checked;
  labRqa.Enabled := CheckBox1.Checked;
  OpenDataSet;
  DBGrid1.SetFocus;
end;

//aDefDateExecute
procedure TfrmComDjzb.aDefDateExecute(Sender: TObject);
begin
  frmDefDate := TfrmDefDate.Create(self);
  frmDefDate.ShowModal;
  frmDefDate.Free;
  SetDefDate;
  OpenDataSet;
end;

{*****自定义过程*****}

//SetButton
procedure TfrmComDjzb.SetButton;
begin
  inherited;
  aView.Enabled := (aView.Tag = 0) and not (dsJbzl.IsEmpty);
  if aModify.Enabled then
  begin
    aModify.ShortCut := VK_RETURN;
    aView.ShortCut := 0;
  end else
  begin
    aModify.ShortCut := 0;
    aView.ShortCut := VK_RETURN;
  end;
end;

//LoadEditForm
procedure TfrmComDjzb.LoadEditForm(strState:string);
begin
  frmDj.strState := strState;
  frmDj.ShowModal;
  frmDj.Free;
  SetButton;
end;

procedure TfrmComDjzb.SetDefDate;
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
