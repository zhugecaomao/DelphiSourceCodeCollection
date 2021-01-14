unit BackupDB;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ADOBackUP, ExtCtrls,FileCtrl,Registry,
  XPMenu;

type
  Tfrm_Data = class(TForm)
    ADOBackUP: TADOBackUP;
    OpenDialog1: TOpenDialog;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    SpeedButton1: TSpeedButton;
    edt_Path: TEdit;
    Bevel1: TBevel;
    lbl_Caption: TLabel;
    Panel_Hide: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DT_st: TDateTimePicker;
    DT_end: TDateTimePicker;
    CheckDate: TCheckBox;
    Edt_FileName: TEdit;
    ProgressBar: TProgressBar;
    XPMenu1: TXPMenu;
    procedure btnCancelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ADOBackUPProcession(Sender: TObject; Ratio: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FOK: Boolean;
  public
    
  end;
   function Show_Backup: Boolean;
     function Show_Restore: Boolean;{ Public declarations }
var
  frm_Data: Tfrm_Data;

implementation

uses dm;

{$R *.dfm}

{ TForm1 }

function Show_Backup: Boolean;
begin
  with Tfrm_data.Create(Application) do
    begin
      Caption := 'Databackup';
      lbl_Caption.Caption := 'backup path:';
      DT_st.DateTime := Now;
      DT_end.DateTime := DT_st.DateTime;
      Edt_FileName.Text := FormatdateTime('yyyy-mm-dd', now) + '.dat';
      FOK := False;
      try
        Showmodal;
      finally
        Result := FOK;
        free;
      end;
    end;
 end;


function Show_Restore: Boolean;
var
    mHeight: Integer;
begin
    with Tfrm_data.Create(Application) do
    begin
      Caption := 'Data restore';
      mHeight := Panel_Hide.Height;
      panel_Hide.Visible := False;
      Bevel1.Height := Bevel1.Height - mHeight;
      ProgressBar.Top := ProgressBar.Top - mHeight;
      btnOK.Top := btnOK.Top - mHeight;
      btnCancel.Top := btnCancel.Top - mHeight;
      Height := Height - mHeight;
      lbl_Caption.Caption := 'Backup file:';
      FOK := False;
      try
        Showmodal;
      finally
        Result := FOK;
        free;
      end;
    end;
end;

procedure Tfrm_Data.btnCancelClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Data.SpeedButton1Click(Sender: TObject);
var
  mPath, mFile: string;
begin
  if caption = '数据备份' then
  begin
    if Selectdirectory('请选择要备份的文件目录', 'C:', mPath) then
      edt_Path.Text := mPath;
  end
  else if caption = '数据恢复' then
  begin
    mFile := ADOBackup.BrowseBackFile;
    if mFile <> '' then
      edt_Path.Text := mFile;
  end;
end;

procedure Tfrm_Data.btnOKClick(Sender: TObject);
function mIsWrong: Boolean;
  begin
    edt_path.Text := trim(edt_Path.text);
    Result := True;
    if edt_Path.Text = '' then
    begin
      application.messagebox('备份文件不存在，请重新选择', '提示', MB_ICONINFORMATION);
      exit;
    end;
    try
      ForceDirectories(edt_path.Text);
    except
      application.messagebox('数据不存在，请重新选择', '警告', MB_ICONINFORMATION);
      exit;
    end;
    Result := False;
  end;
var
  Reg: TRegistry;
  mPath: string;
  mTables, mSql: TStrings;
  i: integer;
begin
  FOK := True;
  if caption = '数据备份' then
  begin
    mSql := TStringList.Create;
    mTables := TStringlist.Create;
    try
      dm1.cn.GetTableNames(mTables); //得到表格 get table
      for i := mtables.Count - 1 downto 0 do
      begin
        if CheckDate.checked then //选择要备份的数据  select backup data
        begin
          if mtables[i] = '****' then
            msql.Add('select * from ****')
          else
            msql.Add('Select * from ' + mtables[i]);
        end
        else //备份全部数据  backup all data
          msql.Add('Select * from ' + mtables[i]);
      end;
      ADOBackUP.SQLStrings.Assign(mSql);
    finally
      msql.Free;
      mtables.Free;
    end;
    mPath := edt_Path.Text;
    if mPath[Length(mPath)] <> '\' then
      mPath := mPath + '\';
    Edt_fileName.Text := Trim(Edt_FileName.text);
    if Edt_fileName.Text = '' then
      ADOBackup.BackUpFileName := FormatdateTime('yyyy-mm-dd', now) + '.dat'
    else
      ADOBackup.BackUpFileName := Edt_FileName.Text;
    ADOBackup.Info.Add('backup file:' + ADOBackup.BackUpFileName);
    ADOBackup.Info.Add('backup time:');
    if CheckDate.Checked then
    begin
      ADOBackup.Info.Add('* ' + FormatDateTime('dddddd', DT_st.DateTime) + ' 至');
      ADOBackup.Info.Add(' ' + FormatDateTime('dddddd', DT_end.DateTime));
    end
    else
      ADOBackup.Info.Add('* all data');
    if ADOBackUP.Backup(mPath) then
    begin
      Reg := TRegistry.Create;
      try
        Reg.RootKey := HKey_Local_Machine;
        if Reg.OpenKey('\Software\Wolfsoft\Student\1.0', True) then
          Reg.WriteString('BackupPath', mPath + ADOBackup.BackUpFileName);
      finally
        Reg.Free;
      end;
      application.messagebox('数据备份成功', '提示', MB_ICONINFORMATION);
    end
    else
    begin
      FOK := False;
      application.messagebox('数据备份失败', '警告', MB_ICONINFORMATION);
    end;
  end
  else if Caption = '数据恢复' then
  begin
    try
      if ADOBackUP.Restore(edt_Path.text) then
        application.messagebox('数据恢复成功', '提示', MB_ICONINFORMATION)
      else
      begin
        FOK := False;
        application.messagebox('数据恢复失败','警告', MB_ICONINFORMATION);
      end;
    except
        application.messagebox('数据恢复失败', '警告', MB_ICONINFORMATION);
    end;
  end;
  Self.Close;
end;

procedure Tfrm_Data.ADOBackUPProcession(Sender: TObject; Ratio: Integer);
begin
ProgressBar.Position := Ratio;
end;

procedure Tfrm_Data.FormShow(Sender: TObject);
var
  Reg: TRegistry;
  mFile: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKey_Local_Machine;
    if Reg.OpenKey('\Software\WolfSoft\Student\1.0', True) then
    begin
      mFile := Reg.ReadString('BackupPath');
      if mFile <> '' then
      begin
        try
          if Caption = '数据备份' then
            edt_path.text := mFile
          else if Caption = '数据恢复' then
            edt_Path.Text := extractfilePath(mFile);
        except
        end;
      end;
    end;
  finally
    Reg.Free;
  end;
end;


end.
