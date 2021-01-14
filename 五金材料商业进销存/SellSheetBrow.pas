unit sellsheetBrow;

//功是执行后，在tabGoods上的selected上勾记所选
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TFlatPanelUnit, TFlatSplitterUnit, fcTreeView, Grids, DBGrids,
  ComCtrls, Db, Wwdatsrc, DBTables, Wwtable, Wwdbigrd, Wwdbgrid,common,
  Wwquery, Buttons, TFlatRadioButtonUnit, TFlatGroupBoxUnit, StdCtrls,
  TFlatEditUnit, TFlatButtonUnit, KvLabel, RegControls, ImgList,
  TFlatTabControlUnit, TFlatComboBoxUnit, wwDBGridEx;

type
  TfrmSellBrow = class(TForm)
    FlatPanel1: TFlatPanel;
    Notebook1: TNotebook;
    RegForm1: TRegForm;
    ImageList1: TImageList;
    qryFilter: TwwQuery;
    dsFilter: TwwDataSource;
    wwDBGrid2: TwwDBGridEx;
    tabFun: TFlatTabControl;
    Panel1: TPanel;
    Label9: TLabel;
    edSearch: TFlatEdit;
    gbSearchType: TFlatGroupBox;
    rbShort: TFlatRadioButton;
    rbName: TFlatRadioButton;
    btnSearch: TFlatButton;
    wwDBGrid1: TwwDBGridEx;
    cbUser: TFlatComboBox;
    KvLabel1: TKvLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure rbShortKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure tabFunTabChanged(Sender: TObject);
    function  getid(const s : string):string;
    procedure cbUserChange(Sender: TObject);
  private
  procedure UpdateList();
    { Private declarations }
  public
    custid : string;
    { Public declarations }
  end;

const divsign = '''';
var
  frmSellBrow: TfrmSellBrow;

implementation

uses data;

{$R *.DFM}

procedure TfrmSellBrow.UpdateList();
begin
  custid := getid(cbUser.text) ;
  if tabfun.ActiveTab  = 3 then notebook1.PageIndex := 1
  else
    with qryFilter do
     begin
       notebook1.PageIndex := 0;
       close;
       sql.clear;
       unprepare;
       sql.add('SELECT A.SheetID,A.Amo-A.PayAmo AS leftamo, A.Amo, A.PayAmo,B.CustName,A.IsOk,A.IsBack');
       sql.add('FROM Outsheet A, Customer B  ');
       Sql.add('WHERE  (A.CustID = B.CustID)');
       if custid <> '' then      //不是显示所有客户
       sql.add('and (A.custid = :custid)');
       case tabfun.ActiveTab of
        0 : sql.add('and (A.isok <> true)') ;
        1 : begin
              sql.add('and (A.isok = true)');
              sql.add('and (A.amo <> A.payamo)') ;
            end;
       2  : begin
              sql.add('and (A.isok = true)');
              sql.add('and (A.amo = A.payamo)') ;
            end;
       end;
       sql.add('order by a.sheetid');

       if custid <> '' then
       parambyname('custid').value := custid;
       prepare;
       open;
       fieldbyname('sheetid').displayLabel := '单据号';
       fieldbyname('sheetid').displaywidth := 12  ;
       fieldbyname('leftamo').displayLabel := '佘额';
       fieldbyname('amo').displayLabel     := '总额';
       fieldbyname('CustName').displayLabel := '客户名称';
       fieldbyname('payamo').displayLabel := '已付';
       fieldbyname('isok').displayLabel := '已完成';
       fieldbyname('isback').displayLabel  := '退货否';
     end;    //end of with
end;


procedure TfrmSellBrow.btnSearchClick(Sender: TObject);
begin
  if trim(edSearch.text) <> '' then
   with qryFilter do
     begin
       close;
       sql.clear;
       unprepare;
       sql.add('SELECT A.SheetID,A.Amo-A.PayAmo AS leftamo, A.Amo, A.PayAmo,B.CustName,A.IsOk,A.IsBack');
       sql.add('FROM Outsheet A, Customer B  ');
       Sql.add('WHERE  (A.CustID = B.CustID)');
       if rbShort.Enabled then
         begin
          if custid <> '' then      //不是显示所有客户
          sql.add('and (a.custid = :custid)');
          sql.add(format('and (a.sheetid like %s*%s*%s)',[divsign,trim(edSearch.text),divsign]));
        end
       else
         sql.add(format('and (b.custname like %s*%s*%s)',[divsign,trim(edSearch.text),divsign])) ;
       sql.add('order by a.sheetid');
       if custid <> '' then      //不是显示所有客户
       parambyname('custid').value := custid;
       prepare;
       open;
       fieldbyname('sheetid').displayLabel := '单据号';
       fieldbyname('sheetid').displaywidth := 12  ;
       fieldbyname('leftamo').displayLabel := '佘额';
       fieldbyname('amo').displayLabel     := '总额';
       fieldbyname('CustName').displayLabel := '客户名称';
       fieldbyname('payamo').displayLabel := '已付';
       fieldbyname('isok').displayLabel := '已完成';
       fieldbyname('isback').displayLabel  := '退货否';
    end;
end;

procedure TfrmSellBrow.rbShortKeyPress(Sender: TObject; var Key: Char);
begin
   btnSearchClick(Sender);
end;

procedure TfrmSellBrow.edSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
     begin
       key := word(#0);
       btnSearchClick(Sender);
     end;
end;

function TfrmSellBrow.getid(const s : string):string;
begin
  if s = '所有客户' then result := ''
  else
    begin
      result := copy(s,2,Pos(')', s)-2);
    end;
end;

procedure TfrmSellBrow.FormCreate(Sender: TObject);
var SavePlace: TBookmark;
begin
  custid :='';
  UpdateList;
  tabfun.ActiveTab := 0;
  notebook1.PageIndex := 0;
  with dm.tabcust do
   begin
     if not Active then open;
     SavePlace := GetBookmark;
     first;
     cbUser.Items.Clear ;
     cbuser.items.Add('所有客户');
     while not eof do
      begin
        cbuser.items.Add(format('(%s) %s',[fieldbyname('custid').asstring,fieldbyname('custname').asstring]));
        next;
      end;        //end of while
    GotoBookmark(SavePlace);
    FreeBookmark(SavePlace);
    cbuser.Text := '所有客户';
    end;         //end of with
end;

procedure TfrmSellBrow.tabFunTabChanged(Sender: TObject);
begin
   UpdateList ;
end;

procedure TfrmSellBrow.cbUserChange(Sender: TObject);
begin
  UpdateList ;
end;

end.
