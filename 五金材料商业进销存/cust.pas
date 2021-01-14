unit cust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TFlatComboBoxUnit, ExtCtrls, KvLabel, TFlatSpeedButtonUnit, ComCtrls, DBCtrls, Mask, Wwkeycb, Grids,
  Wwdbigrd, Wwdbgrid, DBActns, Db, ActnList, wwSpeedButton, wwDBNavigator,
  DBGrids, TFlatButtonUnit, DosMove, wwclearpanel, Wwdatsrc, common,
  RegControls;

type
  TfrmCust = class(TForm)
    Panel1: TPanel;
    btnAbout: TFlatButton;
    btnAdd: TFlatButton;
    btnSave: TFlatButton;
    btnDelete: TFlatButton;
    btnFind: TFlatButton;
    btnPrior: TFlatButton;
    btnNext: TFlatButton;
    KvLabel9: TKvLabel;
    labTotal: TKvLabel;
    KvLabel10: TKvLabel;
    labCurrent: TKvLabel;
    Bevel2: TBevel;
    Status: TStatusBar;
    copyright: TKvLabel;
    Notebook1: TNotebook;
    Label1: TKvLabel;
    edCustID: TDBEdit;
    Label2: TKvLabel;
    edName: TDBEdit;
    Label3: TKvLabel;
    DBEdit3: TDBEdit;
    Label4: TKvLabel;
    edAddr: TDBEdit;
    Label5: TKvLabel;
    edPhone: TDBEdit;
    Label6: TKvLabel;
    edFax: TDBEdit;
    Label7: TKvLabel;
    edLocation: TDBLookupComboBox;
    Label8: TKvLabel;
    edDisc: TDBEdit;
    Label9: TKvLabel;
    edCredit: TDBEdit;
    KvLabel1: TKvLabel;
    Bevel1: TBevel;
    Label10: TKvLabel;
    edBankNo: TDBEdit;
    Label11: TKvLabel;
    edBank: TDBEdit;
    Label12: TKvLabel;
    edMemo: TDBMemo;
    Label13: TKvLabel;
    edZip: TDBEdit;
    Label14: TKvLabel;
    edEmail: TDBEdit;
    KvLabel2: TKvLabel;
    wwIncrementalSearch1: TwwIncrementalSearch;
    DBGrid1: TDBGrid;
    btnBase: TFlatButton;
    btnDetail: TFlatButton;
    DosMove1: TDosMove;
    Bevel3: TBevel;
    RegForm1: TRegForm;
    procedure btnAddClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure btnBaseClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDataLink: TwDataLink;
    procedure SetButton();
    procedure DataChange(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCust: TfrmCust;

implementation

uses data;

{$R *.DFM}

procedure TfrmCust.DataChange(sender: Tobject);
begin
  SetButton;
  labTotal.Caption := inttostr(FDataLink.DataSet.RecordCount);
  labCurrent.caption := inttostr(FDataLink.DataSet.recno);
end;

procedure TfrmCust.SetButton();
var
  UpEnable, DnEnable: Boolean;
  CanModify: Boolean;
begin
  UpEnable := FDataLink.Active and not FDataLink.DataSet.BOF;
  DnEnable := FDataLink.Active and not FDataLink.DataSet.EOF;

  //btnFirst.Enabled  := UpEnable;
  //btnLast.Enabled   := DnEnable;
  btnPrior.Enabled := UpEnable;
  btnNext.Enabled := DnEnable;
  btnDelete.Enabled := FDataLink.Active and FDataLink.DataSet.CanModify and
    not (FDataLink.DataSet.BOF and FDataLink.DataSet.EOF);

  CanModify := FDataLink.Active and FDataLink.DataSet.CanModify;
  btnAdd.Enabled := CanModify;
  btnSave.Enabled := CanModify and FDataLink.Editing;
  //  btnCancel.Enabled := CanModify and FDataLink.Editing;
  //  btnEdit.Enabled := CanModify and not FDataLink.Editing;
  //btnRefresh.Enabled := CanModify;

end;


//another way to do this . but is not so good than the first
{
procedure TfrmCust.SetButton();
var
  UpEnable, DnEnable: Boolean;
  isCanModify: Boolean;
begin
  with dm.tabcust do
    begin
        UpEnable :=  Active and not BOF;
        DnEnable :=  Active and not EOF;
        btnPrior.Enabled  := UpEnable;
        btnNext.Enabled   := DnEnable;
        btnDelete.Enabled := Active and CanModify and
                           not (BOF and EOF);
        isCanModify := Active and CanModify;
        btnAdd.Enabled  := isCanModify;
        btnSave.Enabled := isCanModify and (state in [dsedit,dsinsert]);
    end;
end;
}

procedure TfrmCust.btnAddClick(Sender: TObject);
begin
  FDataLink.DataSet.append;
end;

procedure TfrmCust.FormCreate(Sender: TObject);
begin
  with dm.tabCust do
    if not active then open;
  FDataLink := TwDataLink.Create();
  FDataLink.DataSource := dm.dsCust;
  FDataLink.OnStateChange := DataChange;
  FDataLink.OnEditing := DataChange;
end;

procedure TfrmCust.FormDestroy(Sender: TObject);
begin
  FDataLink.Free;
  FDataLink := nil;
end;

procedure TfrmCust.FormShow(Sender: TObject);
begin
  SetButton;
end;

procedure TfrmCust.btnSaveClick(Sender: TObject);
begin
  FDataLink.DataSet.post;
end;

procedure TfrmCust.btnDetailClick(Sender: TObject);
begin
  notebook1.PageIndex := 1;
end;

procedure TfrmCust.btnBaseClick(Sender: TObject);
begin
  notebook1.PageIndex := 0;
end;

procedure TfrmCust.btnDeleteClick(Sender: TObject);
begin
  FDataLink.DataSet.delete;
end;

procedure TfrmCust.btnFindClick(Sender: TObject);
begin
  ShowMessage('这个功能还没做哦*_*');
end;

procedure TfrmCust.btnAboutClick(Sender: TObject);
begin
  ShowMessage('也没什么好说的嘛 ^_^ ');
end;

procedure TfrmCust.btnNextClick(Sender: TObject);
begin
  FDataLink.DataSet.Next;
end;

procedure TfrmCust.btnPriorClick(Sender: TObject);
begin
  FDataLink.DataSet.Prior;
end;

procedure TfrmCust.btnEditClick(Sender: TObject);
begin
  FDataLink.dataset.edit;
end;

procedure TfrmCust.btnCancelClick(Sender: TObject);
begin
  FDataLink.dataset.cancel;
end;

procedure TfrmCust.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
