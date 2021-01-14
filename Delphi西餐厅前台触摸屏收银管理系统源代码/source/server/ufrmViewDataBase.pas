unit ufrmViewDataBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBase, ImgList, ComCtrls, ToolWin, ActnList, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, DB, ADODB, CSADOQuery, dxTL, dxDBCtrl,
  dxDBGrid, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCore;

type
  TfrmViewDataBase = class(TfrmBase)
    ActionList1: TActionList;
    atNew: TAction;
    atEdit: TAction;
    atSave: TAction;
    atDel: TAction;
    atCancel: TAction;
    atExit: TAction;
    ToolBar1: TToolBar;
    tbNew: TToolButton;
    tbEdit: TToolButton;
    tbDel: TToolButton;
    ToolButton6: TToolButton;
    tbExit: TToolButton;
    atFindData: TAction;
    tbFindData: TToolButton;
    Viewd: TDataSource;
    Viewq: TCSADOQuery;
    atConfirm: TAction;
    tbConfirm: TToolButton;
    atExport: TAction;
    tbExport: TToolButton;
    atPreview: TAction;
    atPrint: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    grdList: TdxDBGrid;
    tbSave: TToolButton;
    tbCancel: TToolButton;
    grdPrint: TdxComponentPrinter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atExitExecute(Sender: TObject);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure atCancelExecute(Sender: TObject);
    procedure atFindDataExecute(Sender: TObject);
    procedure atExportExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    Rb_Find: Boolean;
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmViewDataBase: TfrmViewDataBase;

implementation


{$R *.dfm}

{ TfrmViewDataBase }

procedure TfrmViewDataBase.prop_IniInterFace;
begin
  inherited;
  if Ri_Flag = 1 then
  begin
    FormStyle := fsMDIChild;
  end;
  Position := poScreenCenter;  
  tbNew.Visible := Ri_Flag = 1;
  tbEdit.Visible := Ri_Flag = 1;
  tbDel.Visible:= Ri_Flag = 1;
  tbConfirm.Visible := Ri_Flag = 2;
end;

procedure TfrmViewDataBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := Cafree;
end;

procedure TfrmViewDataBase.atExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmViewDataBase.atNewExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmViewDataBase.atEditExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmViewDataBase.atSaveExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmViewDataBase.atDelExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmViewDataBase.atCancelExecute(Sender: TObject);
begin
  inherited;
  //
  if (not Viewq.IsEmpty) and (Viewq.State <> dsBrowse) then
  begin
    Viewq.Cancel;
    Viewq.Last;
  end;
end;

procedure TfrmViewDataBase.atFindDataExecute(Sender: TObject);
begin
  inherited;
  {frmFindData := TfrmFindData.Create(nil);
  try
    frmFindData.pubp_Ini(Viewq, 6);
    if frmFindData.ShowModal = mrOk then
    begin
      Viewq.Locate(frmFindData.As_FieldName, frmFindData.As_Value, []);
    end;
  finally
    FreeAndNil(frmFindData);
  end; }
end;

procedure TfrmViewDataBase.atExportExecute(Sender: TObject);
//var
  //lc_Time: TSystemTime;
var
  lc_SaveDlg: TSaveDialog;
begin
  inherited;
  if (not grdList.DataSource.DataSet.Active) or grdList.DataSource.DataSet.IsEmpty then
  begin
    DispInfo('当前无数据, 无法导出');
    Exit;
  end;
  if grdList.DataSource.DataSet.State <> dsBrowse then
  begin
    DispInfo('当前正在编辑数据,请保存后再导出');
  end;
  lc_SaveDlg := TSaveDialog.Create(nil);
  try
    lc_SaveDlg.Filter := 'Excel表格文件 (*.xls)|*.XLS';
    if lc_SaveDlg.Execute then
    begin
      grdList.SaveToXLS(lc_SaveDlg.FileName, True);
    end;
  finally
    lc_SaveDlg.Free;
  end; 
  //
end;

procedure TfrmViewDataBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{F2-增加、F3-修改、F4-删除、F5-查询、F6-打印预览、F7-打印
F9-确认、F11-放弃，F12-退出
}
  inherited;
  case Key of
    VK_F2:
    begin
      if atNew.Visible then
      atNew.OnExecute(Sender);
    end;
    VK_F3:
    begin
      if atEdit.Visible then
      atEdit.OnExecute(Sender);
    end;
    VK_F4:
    begin
      if atDel.Visible then
      atDel.OnExecute(Sender);
    end;
    VK_F5:
    begin
      if atFindData.Visible then
      atFindData.OnExecute(Sender);
    end;
    VK_F6:
    begin
      if atExport.Visible then
      atExport.OnExecute(Sender);
    end;
    VK_F9:
    begin
      if atSave.Visible then
      atSave.OnExecute(Sender);
    end;
    VK_F11:
    begin
      if atCancel.Visible then
      atCancel.OnExecute(Sender);
    end;
    VK_F12:
    begin  
      if atExit.Visible then
      atExit.OnExecute(Sender);
    end;
  end;
end;

end.
