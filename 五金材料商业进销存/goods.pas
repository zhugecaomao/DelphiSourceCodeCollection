unit goods;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Wwkeycb, StdCtrls, DBCtrls, Mask, ExtCtrls,
  TFlatComboBoxUnit, KvLabel, TFlatSpeedButtonUnit, TFlatTabControlUnit,
  TFlatPanelUnit, DBGrids, TFlatButtonUnit, fcCombo, fctreecombo, DosMove, common,
  wwSpeedButton, wwDBNavigator, wwclearpanel, ImgList, fcTreeView, wwdbedit,
  RegControls, Wwdotdot;

type
  TfrmGoods = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Notebook1: TNotebook;
    tabControl1: TFlatTabControl;
    Panel5: TPanel;
    KvLabel2: TKvLabel;
    Label1: TKvLabel;
    Label2: TKvLabel;
    edName: TDBEdit;
    Label3: TKvLabel;
    edUnit: TDBEdit;
    Label4: TKvLabel;
    Label5: TKvLabel;
    DBEdit4: TDBEdit;
    Label6: TKvLabel;
    DBEdit5: TDBEdit;
    Label7: TKvLabel;
    DBEdit6: TDBEdit;
    Label8: TKvLabel;
    DBEdit7: TDBEdit;
    Label9: TKvLabel;
    DBEdit8: TDBEdit;
    Label10: TKvLabel;
    DBEdit9: TDBEdit;
    Label11: TKvLabel;
    DBEdit10: TDBEdit;
    Label12: TKvLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DosMove1: TDosMove;
    btnAdd: TFlatButton;
    btnSave: TFlatButton;
    btnDelete: TFlatButton;
    btnNext: TFlatButton;
    btnPrior: TFlatButton;
    Image1: TImage;
    KvLabel9: TKvLabel;
    labTotal: TKvLabel;
    Label13: TKvLabel;
    DBEdit11: TDBEdit;
    Label14: TKvLabel;
    DBEdit12: TDBEdit;
    Label15: TKvLabel;
    DBEdit13: TDBEdit;
    KvLabel1: TKvLabel;
    btnFind: TFlatButton;
    stateImage: TImageList;
    cmbTypeTree: TfcTreeCombo;
    DBEdit1: TDBEdit;
    RegForm1: TRegForm;
    procedure tabControl1TabChanged(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbTypeTreeSelectionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private
    FDataLink: TwDataLink;
    procedure SetButton();
    procedure DataChange(sender: TObject);
    procedure LoadTree(); //cmbtypeTree的装入
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGoods: TfrmGoods;

implementation

uses data, gdstype;

{$R *.DFM}

procedure TfrmGoods.LoadTree(); //cmbtypeTree的装入
var Level: integer;
  preNode: TfcTreeNode;
  CurNode: TfcTreeNode;
  tmpstr: string;
begin
  cmbTypeTree.Items.BeginUpdate;
  prenode := cmbTypeTree.items.add(nil, '商品种类');
  prenode.ImageIndex := 0; //
  prenode.Selectedindex := 1; //
  dm.tabtype.First;
  with dm.tabtype do
    with cmbTypeTree do
      while not eof do
        begin
          level := length(trim(fieldbyname('typeid').asstring)) div 4;
          tmpstr := fieldbyname('typeName').asstring;
          if preNode.level = level then
            CurNode := items.addchild(prenode.parent, tmpstr);
          if level < preNode.level then
            CurNode := items.addchild(cmbTypeTree.items[0], tmpstr);
          if level > preNode.level then
            CurNode := items.addchild(prenode, tmpstr);
          CurNode.ImageIndex := 2;
          curNode.SelectedIndex := 3;
          curNode.StringData := trim(fieldbyname('typeid').asstring);
          next;
          preNode := CurNode;
        end;
  cmbTypeTree.Items.EndUpdate;
end;

procedure TfrmGoods.tabControl1TabChanged(Sender: TObject);
begin
  notebook1.PageIndex := tabControl1.ActiveTab;
end;

procedure TfrmGoods.DataChange(sender: Tobject);
begin
  SetButton;
  labTotal.Caption := inttostr(FDataLink.DataSet.RecordCount);
  // labGdsID.caption := FDataLink.DataSet.fieldbyname('gdsId').asstring;
end;

procedure TfrmGoods.FormCreate(Sender: TObject);
begin
  if not dm.tabType.active then dm.tabType.active := true;
  if not dm.tabGoods.active then dm.tabGoods.active := true;
  FDataLink := TwDataLink.Create();
  FDataLink.DataSource := dm.dsGoods;
  FDataLink.OnStateChange := DataChange;
  FDataLink.OnEditing := DataChange;
  DataChange(sender);
  LoadTree;
end;

procedure TfrmGoods.FormDestroy(Sender: TObject);
begin
  FDataLink.Free;
  FDataLink := nil;
end;

procedure TfrmGoods.SetButton();
var
  UpEnable, DnEnable: Boolean;
  CanModify: Boolean;
begin
  UpEnable := FDataLink.Active and not FDataLink.DataSet.BOF;
  DnEnable := FDataLink.Active and not FDataLink.DataSet.EOF;

  btnPrior.Enabled := UpEnable;
  btnNext.Enabled := DnEnable;
  btnDelete.Enabled := FDataLink.Active and FDataLink.DataSet.CanModify and
    not (FDataLink.DataSet.BOF and FDataLink.DataSet.EOF);
  CanModify := FDataLink.Active and FDataLink.DataSet.CanModify;
  btnAdd.Enabled := CanModify;
  btnSave.Enabled := CanModify and FDataLink.Editing;
end;

procedure TfrmGoods.btnPriorClick(Sender: TObject);
begin
  FDataLink.DataSet.Prior;
end;

procedure TfrmGoods.btnNextClick(Sender: TObject);
begin
  FDataLink.DataSet.next;
end;

procedure TfrmGoods.btnAddClick(Sender: TObject);
begin
  FDataLink.DataSet.append;
end;

procedure TfrmGoods.btnSaveClick(Sender: TObject);
begin
  FDataLink.DataSet.post
end;

procedure TfrmGoods.btnDeleteClick(Sender: TObject);
begin
  FDataLink.DataSet.delete;
end;

procedure TfrmGoods.cmbTypeTreeSelectionChange(Sender: TObject);
begin
  if trim(cmbTypeTree.SelectedNode.StringData) = '' then exit;
  with FDataLink.Dataset do
    begin
      edit;
      fieldbyname('gdsTypeID').asstring := trim(cmbTypeTree.SelectedNode.StringData);
    end;
end;

procedure TfrmGoods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FDataLink.Editing then
    begin
      if MessageDlg('认可修改吗? ', mtConfirmation, [mbYes, mbNO], 0) = mrYes then
        try
          FDataLink.DataSet.Post;
        except
          ShowMessage('更新失败 !');
          abort;
        end; //end of try
    end //end of then
  else FDataLink.dataset.Cancel;
  Action := caFree;
end;

procedure TfrmGoods.cbClick(Sender: TObject);
var frmtype: TfrmType;
begin
  { frmtype := Tfrmtype.create(self);
   frmtype.showmodal;
   dm.tabGoods.FieldByName('gdstypeid').asstring := frmtype.treeview1.selected.StringData;
   frmtype.close;
 }
end;

procedure TfrmGoods.DBEdit1Change(Sender: TObject);
begin
  cmbTypeTree.text := Dm.tabGoods.fieldbyname('gdstypename').asstring;
end;

end.
