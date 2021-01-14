unit ufrmSysUserView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, DB, ADODB, CSADOQuery, ActnList, ImgList,
  ComCtrls, ToolWin, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCore;

type
  TfrmSysUserView = class(TfrmViewDataBase)
    Viewquser_id: TStringField;
    Viewquser_name: TStringField;
    Viewqpassword: TStringField;
    Viewqcreate_time: TDateTimeField;
    Viewqmodify_time: TDateTimeField;
    grdListuser_id: TdxDBGridMaskColumn;
    grdListuser_name: TdxDBGridMaskColumn;
    grdListpassword: TdxDBGridMaskColumn;
    grdListcreate_time: TdxDBGridDateColumn;
    grdListmodify_time: TdxDBGridDateColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmSysUserView: TfrmSysUserView;

implementation
uses udmData, ufrmSysUserModify;
{$R *.dfm}

{ TfrmSysUserView }

procedure TfrmSysUserView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM sys_user';
    Open;
  end;
end;

procedure TfrmSysUserView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmSysUserView := nil;
end;

procedure TfrmSysUserView.atNewExecute(Sender: TObject);
begin
  inherited;
  frmSysUserModify := TfrmSysUserModify.Create(nil);
  try
    frmSysUserModify.pubp_Ini(Viewq, 1);
    frmSysUserModify.ShowModal;
  finally
    FreeAndNil(frmSysUserModify);
  end;
end;

procedure TfrmSysUserView.atEditExecute(Sender: TObject);
begin
  inherited;
  frmSysUserModify := TfrmSysUserModify.Create(nil);
  try
    frmSysUserModify.pubp_Ini(Viewq, 2);
    frmSysUserModify.ShowModal;
  finally
    FreeAndNil(frmSysUserModify);
  end;
end;

procedure TfrmSysUserView.atDelExecute(Sender: TObject);
begin
  inherited;
  frmSysUserModify := TfrmSysUserModify.Create(nil);
  try
    frmSysUserModify.pubp_Ini(Viewq, 3);
    frmSysUserModify.ShowModal;
  finally
    FreeAndNil(frmSysUserModify);
  end;
end;

end.
