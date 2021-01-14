unit ReportStyleSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, SUIImagePanel, GridsEh, DBGridEh, ExtCtrls, SUIForm,
  DB, ADODB, MemTableDataEh, DataDriverEh, MemTableEh, SUIButton;

type
  TReportStyleSet_frm = class(TBaseFrm)
    DBGridEh1: TDBGridEh;
    suiImagePanel1: TsuiImagePanel;
    ds_DocumentsReport: TDataSource;
    tbl_DocumentsReport: TADOTable;
    mteh_DocumentsReport: TMemTableEh;
    tbl_DocumentsType: TADOTable;
    DataSource1: TDataSource;
    btnNew: TsuiButton;
    btnSave: TsuiButton;
    btnDelete: TsuiButton;
    mteh_DocumentsReportDictID: TWideStringField;
    mteh_DocumentsReportDictName: TWideStringField;
    mteh_DocumentsReportFilePath: TWideStringField;
    mteh_DocumentsReportTypeName: TWideStringField;
    btnClose: TsuiButton;
    mteh_DocumentsReportTypeID: TWideStringField;
    DataSetDriverEh1: TDataSetDriverEh;
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
     procedure Query_ini(id:string);
  end;

var
  ReportStyleSet_frm: TReportStyleSet_frm;

implementation

uses DataModule;

{$R *.dfm}
procedure TReportStyleSet_frm.Query_ini(id:string);
begin
   mteh_DocumentsReport.Active :=true;
   tbl_DocumentsType.Active :=true;
end;
procedure TReportStyleSet_frm.btnNewClick(Sender: TObject);
begin
  inherited;
//
  mteh_DocumentsReport.Append;
  btnSave.Enabled :=true;
end;

procedure TReportStyleSet_frm.btnSaveClick(Sender: TObject);
begin
  inherited;
//
  mteh_DocumentsReport.Post;
  btnNew.Enabled :=true;
  btnSave.Enabled :=false;
end;

procedure TReportStyleSet_frm.btnDeleteClick(Sender: TObject);
begin
  inherited;
//
  mteh_DocumentsReport.Delete;
  btnSave.Enabled :=true;
end;

procedure TReportStyleSet_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  Query_ini('');
end;

procedure TReportStyleSet_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
  close();
end;

end.
