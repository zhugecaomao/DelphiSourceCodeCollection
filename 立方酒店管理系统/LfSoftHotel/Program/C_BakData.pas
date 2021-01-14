unit C_BakData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, C_Define;

type
  TBakDataForm = class(TStdJdForm)
    edtSdir: TLabeledEdit;
    edtDdir: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FSDir: string;
    FDDir: string;
  public
    { Public declarations }
  end;

var
  BakDataForm: TBakDataForm;

procedure BakDbfData;

implementation

uses C_SelectDir, C_Wait;

{$R *.dfm}

procedure BakDbfData;
begin
  BakDataForm := TBakDataForm.Create(Application);
  try
    with BakDataForm do
    begin
      FSDir := DBF_DIR;
      FDDir := BAK_DIR;
      edtSdir.Text := FSDir;
      edtDdir.Text := FDDir;
      ShowModal;
    end;
  finally
    BakDataForm.Free;
  end;
end;

procedure TBakDataForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if (FSDir='')or(FDDir='') then
  begin
    ShowWarning('请选择路径！');
    Exit;
  end;
  WaitForm := TWaitForm.Create(Application);
  try
    WaitForm.FTitle := '备份数据';
    WaitForm.Show;
    WaitForm.Update;
    if DirectoryExists(FSDir) then
      if CopyDir(FSDir,FDDir) then
        ShowInfo('数据备份成功！');

  finally
    WaitForm.Hide;
    WaitForm.Free;
  end;

  Close;
end;

procedure TBakDataForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
    edtSDir.Text := SelectDir;
end;

procedure TBakDataForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    edtDDir.Text := SelectDir;
end;

end.
