unit ufrmSysUserModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModifyDataBase, ImgList, StdCtrls, Buttons, dxEditor,
  dxExEdtr, dxEdLib, dxCntner;

type
  TfrmSysUserModify = class(TfrmModifyDataBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    eUserId: TdxEdit;
    eUserName: TdxEdit;
    eUserPass: TdxEdit;
    eCreateTime: TdxDateEdit;
    eModifyTime: TdxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmSysUserModify: TfrmSysUserModify;

implementation
uses ufrmBase;
{$R *.dfm}

{ TfrmSysUserModify }

procedure TfrmSysUserModify.prop_IniData;
begin
  inherited;
  case Ri_Flag of
    1:
    begin
      eUserId.Clear;
      eUserName.Clear;
      eUserPass.Clear;
      eCreateTime.Clear;
      eModifyTime.Clear;
    end;
    2:
    begin
      eUserId.Text := Rc_MainDataSet.FieldByName('user_id').AsString;
      eUserName.Text := Rc_MainDataSet.FieldByName('user_name').AsString;
      eUserPass.Text := Rc_MainDataSet.FieldByName('password').AsString;
      eCreateTime.Text := Rc_MainDataSet.FieldByName('create_time').AsString;
      eModifyTime.Text := Rc_MainDataSet.FieldByName('modify_time').AsString;
    end;
    3:
    begin
      eUserId.Text := Rc_MainDataSet.FieldByName('user_id').AsString;
      eUserName.Text := Rc_MainDataSet.FieldByName('user_name').AsString;
      eUserPass.Text := Rc_MainDataSet.FieldByName('password').AsString;
      eCreateTime.Text := Rc_MainDataSet.FieldByName('create_time').AsString;
      eModifyTime.Text := Rc_MainDataSet.FieldByName('modify_time').AsString;
    end;
  end;
end;

procedure TfrmSysUserModify.FormShow(Sender: TObject);
begin
  inherited;
  if Ri_Flag = 3 then bbtnConfirm.Enabled := True;
end;

procedure TfrmSysUserModify.bbtnConfirmClick(Sender: TObject);
begin
  inherited;
  case Ri_Flag of
    1:
    begin
      try
        Rc_MainDataSet.Append;
        Rc_MainDataSet.FieldByName('user_id').AsString := eUserId.Text;
        Rc_MainDataSet.FieldByName('user_name').AsString := eUserName.Text;
        Rc_MainDataSet.FieldByName('password').AsString := eUserPass.Text;
        Rc_MainDataSet.FieldByName('create_time').AsString := FormatDateTime('YYYY-MM-DD',
          StrToDate(eCreateTime.Text));
        Rc_MainDataSet.Post;
        if DispInfo('新数据保存完成，您是否要继续添加？', 3) = 'y' then
        begin
          eUserId.Clear;
          eUserName.Clear;
          eUserPass.Clear;
          eCreateTime.Clear;
          eModifyTime.Clear;
        end else ModalResult := mrOk;
      except
        DispInfo('数据添加失败');
      end;
    end;
    2:
    begin
      try
        Rc_MainDataSet.Edit;
        Rc_MainDataSet.FieldByName('user_id').AsString := eUserId.Text;
        Rc_MainDataSet.FieldByName('user_name').AsString := eUserName.Text;
        Rc_MainDataSet.FieldByName('password').AsString := eUserPass.Text;
        Rc_MainDataSet.FieldByName('create_time').AsString := FormatDateTime('YYYY-MM-DD',
          StrToDate(eCreateTime.Text));
        Rc_MainDataSet.Post;
        DispInfo('数据修改完成', 2);
        ModalResult := mrOk;
      except
        DispInfo('数据修改失败');
      end;
    end;
    3:
    begin
      try
        if DispInfo('您是否真的要删除当前数据？', 3) = 'y' then
        begin
          Rc_MainDataSet.Delete;
          ModalResult := mrOk;
        end;
      except
        DispInfo('数据删除失败');
      end;
    end;
  end;
end;

end.
