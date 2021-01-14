unit ufrmCardKindView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, DB, ADODB, CSADOQuery, ActnList, ImgList,
  ComCtrls, ToolWin, dxExEdtr, dxDBGrid, dxTL, dxDBCtrl, dxCntner, ExtCtrls,
  dxDBTLCl, dxGrClms, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCore;

type
  TfrmCardKindView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Viewqkind_id: TIntegerField;
    Viewqkind_name: TStringField;
    Viewqis_saving: TBooleanField;
    Viewqis_discount: TBooleanField;
    Viewqdiscount_point: TFloatField;
    grdListkind_id: TdxDBGridMaskColumn;
    grdListkind_name: TdxDBGridMaskColumn;
    grdListis_saving: TdxDBGridCheckColumn;
    grdListis_discount: TdxDBGridCheckColumn;
    grdListdiscount_point: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atExportExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure grdListCustomDraw(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxDBTreeListColumn;
      const AText: String; AFont: TFont; var AColor: TColor; ASelected,
      AFocused: Boolean; var ADone: Boolean);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure atConfirmExecute(Sender: TObject);
  private
    Fi_KindId: Integer;
  protected
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    property Ai_KindId: Integer read Fi_KindId;
  end;

var
  frmCardKindView: TfrmCardKindView;

implementation
uses udmData, ufrmBase, ufrmCardKindModify;
{$R *.dfm}

{ TfrmCardKindView }

procedure TfrmCardKindView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM cardkind';
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmCardKindView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Ri_Flag = 1 then
  begin
    inherited;
    frmCardKindView := nil;
  end;
end;

procedure TfrmCardKindView.atExportExecute(Sender: TObject);
begin
  inherited;
  if ExportExcel(grdList) then
  begin
    DispInfo('数据导出完成', 2);
  end;
end;

procedure TfrmCardKindView.prop_IniInterFace;
begin
  inherited;  
  Position := poScreenCenter;
  //WindowState := wsMaximized;
end;

procedure TfrmCardKindView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F1:
    begin
      atNew.OnExecute(Sender);
    end;
    VK_F2:
    begin
      atEdit.OnExecute(Sender);
    end;
    VK_F3:
    begin
      atDel.OnExecute(Sender);
    end;
    VK_F4:
    begin
      atFindData.OnExecute(Sender);
    end;  
    VK_F11:
    begin
      if Ri_Flag = 1 then Exit;
      atConfirm.OnExecute(Sender);
    end;
    VK_F12:
    begin
      atExit.OnExecute(Sender);
    end;
  end;
end;

procedure TfrmCardKindView.atNewExecute(Sender: TObject);
begin
  inherited;
  frmCardKindModify := TfrmCardKindModify.Create(nil);
  try
    frmCardKindModify.pubp_Ini('', 1);
    frmCardKindModify.ShowModal;
  finally
    FreeAndNil(frmCardKindModify);
  end;
  prop_IniData;
end;

procedure TfrmCardKindView.atEditExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then
  begin
    DispInfo('当前无数据，不能编辑!');
    Exit;
  end;
  frmCardKindModify := TfrmCardKindModify.Create(nil);
  try
    frmCardKindModify.pubp_Ini(IntToStr(Viewq.FieldByName('kind_id').AsInteger), 2);
    frmCardKindModify.ShowModal;
  finally
    FreeAndNil(frmCardKindModify);
  end;
  prop_IniData;
end;

procedure TfrmCardKindView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then
  begin
    DispInfo('当前无数据，不能删除!');
    Exit;
  end;    
  frmCardKindModify := TfrmCardKindModify.Create(nil);
  try
    frmCardKindModify.pubp_Ini(IntToStr(Viewq.FieldByName('kind_id').AsInteger), 3);
    frmCardKindModify.ShowModal;
  finally
    FreeAndNil(frmCardKindModify);
  end;
  prop_IniData;
end;

procedure TfrmCardKindView.grdListCustomDraw(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
{var
  li_Index: Integer;
  lb_IsModify: Boolean;  }
begin
  {inherited;
  if ANode.HasChildren then Exit;
  li_Index := grdList.ColumnByFieldName('is_modify').Index;
  lb_IsModify := StrToBoolDef(ANode.Strings[li_Index], False);
  if lb_IsModify then
  begin
    AFont.Color := clBlue;
  end else begin
    AFont.Color := clYellow;
    AFont.Style := [fsBold];
  end;}
end;

procedure TfrmCardKindView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited; 
  Fi_KindId := Viewq.FieldByName('kind_id').AsInteger;
end;

procedure TfrmCardKindView.atConfirmExecute(Sender: TObject);
begin
  inherited;
  if (Viewq.IsEmpty) or (Viewq.FieldByName('kind_id').IsNull) then Exit;
  ModalResult := mrOk;
end;

end.
