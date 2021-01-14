unit U_fzlr_clbm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Db, DBClient, MConnect, Grids, DBGrids, StdCtrls,
  Buttons, ADODB;


type
  TfrmCLBM_FZLR = class(TForm)
    Panel2: TPanel;
    DataSource1: TDataSource;
    Panel4: TPanel;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnQuery: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBGrid: TDBGrid;
    aqCLBM: TADOQuery;
    procedure btnQueryClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TClbmRec = record
    clbm: string[11];
    clmc: string[40];
    ggxh: string[40];
    jldw: string[20];
    djdw: string[20];
    jhdj: real;
  end;

var
  frmCLBM_FZLR: TfrmCLBM_FZLR;
  ClbmRec: array of TClbmRec;
implementation

uses uDB;

{$R *.DFM}

procedure TfrmCLBM_FZLR.btnQueryClick(Sender: TObject);
begin
  aqCLBM.filter := 'MatCode like' + '''' + trim(edit1.text) + '%''' + ' and MatName like ' + '''%' + trim(edit2.text) + '%''' + ' and Size like' + '''%' + trim(edit3.text) + '%''';
  aqCLBM.filtered := true;
end;

procedure TfrmCLBM_FZLR.btnOKClick(Sender: TObject);
var
  I: integer;
begin
  //设置动态数组长度
  setLength(ClbmRec, dbgrid.SelectedRows.Count);
  //将DbGrid里的数据传进到全局数组clbmRec中
  for i := 0 to dbgrid.SelectedRows.Count - 1 do
  begin
    DBGrid.DataSource.DataSet.GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
    clbmRec[i].clbm := aqCLBM.fieldbyname('MatCode').asstring;
    clbmRec[i].clmc := aqCLBM.fieldbyname('MatName').asstring;
    clbmRec[i].ggxh := aqCLBM.fieldbyname('Size').asstring;
    clbmRec[i].jldw := aqCLBM.fieldbyname('CUnit').asstring;
    clbmRec[i].jhdj := aqCLBM.fieldbyname('Price').value;
    clbmRec[i].djdw := aqCLBM.fieldbyname('PUnit').asstring;
  end;
  close;
end;

procedure TfrmCLBM_FZLR.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCLBM_FZLR.FormCreate(Sender: TObject);
begin
//初始化变量
  setLength(clbmRec,0);
  aqCLBM.Active := True;
end;

end.

