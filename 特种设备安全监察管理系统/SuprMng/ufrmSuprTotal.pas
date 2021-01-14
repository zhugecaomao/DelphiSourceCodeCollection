unit ufrmSuprTotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, CSScrCtrlChild, CSBarMDIChild, DB, dxmdaset, ADODB,
  CSADOQuery, dxCntner, dxEditor, dxEdLib, CSCustomdxDateEdit,
  CSdxDBDateEdit, CSAdxDBDateEdit, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSuprTotal = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    bbtnPrint: TBitBtn;
    List: TCSADOQuery;
    memList: TdxMemData;
    memListitem: TStringField;
    memListamount: TIntegerField;
    memListstart_date: TStringField;
    memListend_date: TStringField;
    memListd: TDataSource;
    grdList: TdxDBGrid;
    Panel2: TPanel;
    memListid: TIntegerField;
    grdListRecId: TdxDBGridColumn;
    grdListid: TdxDBGridColumn;
    grdListitem: TdxDBGridColumn;
    grdListstart_date: TdxDBGridColumn;
    grdListend_date: TdxDBGridColumn;
    grdListamount: TdxDBGridColumn;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    deStartDate: TCSAdxDBDateEdit;
    deEndDate: TCSAdxDBDateEdit;
    memListexecute: TStringField;
    grdListexecute: TdxDBGridButtonColumn;
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListClick(Sender: TObject);
    procedure memListAfterScroll(DataSet: TDataSet);
    procedure grdListexecuteEditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure pubp_Ini;
  end;

var
  frmSuprTotal: TfrmSuprTotal;

implementation

uses
  CSVCLUtils, udmData, CommonLib;

{$R *.dfm}

{ TfrmSuprTotal }

procedure TfrmSuprTotal.pubp_Ini;
begin
  ScrChild.SetSecurity(Self);
  try
    Gp_ProgressHint(Format('正在打开%s，请稍候...', [Caption]));
    FormStyle := fsMDIChild;
    if MAXIMIZEDBYDEFAULT then WindowState := wsMaximized else ClientTile(Self);
  finally
    Gp_ProgressHint;
  end;
end;

procedure TfrmSuprTotal.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSuprTotal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmSuprTotal := nil;
end;

procedure TfrmSuprTotal.grdListClick(Sender: TObject);
begin
  with memList do
    if FieldByName('id').AsInteger <> 1 then
    begin
      deStartDate.PopupDate(grdList);
      deEndDate.PopupDate(grdList);
    end;
end;

procedure TfrmSuprTotal.memListAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  begin
    grdListstart_date.DisableEditor := FieldByName('id').AsInteger = 1;
    grdListend_date.DisableEditor := FieldByName('id').AsInteger = 1;
  end;
end;

procedure TfrmSuprTotal.grdListexecuteEditButtonClick(Sender: TObject);
var
  li_ID: Integer;
  ls_StartDate, ls_EndDate: string;
begin
  with memList do
  begin
    li_ID := FieldByName('id').AsInteger;
    ls_StartDate := VarToStr(FieldValues['start_date']);
    ls_EndDate := VarToStr(FieldValues['end_date']);

    if li_ID <> 1 then
      if (ls_StartDate = '') or (ls_EndDate = '') then
      begin
        Application.MessageBox('开始日期或结束日期不能为空', PChar(Caption),
          MB_OK + MB_ICONWARNING);
        Exit;
      end;

    with List do
    begin
      if Active then Close;
      SQL.Text := Format('device.usp_getsuprtotal %d, ''%s'', ''%s''',
        [li_ID, ls_StartDate, ls_EndDate]);
      Open;
    end;

    Edit;
    FieldValues['amount'] := List.FieldValues['total'];
    Post;
  end;

end;

end.
