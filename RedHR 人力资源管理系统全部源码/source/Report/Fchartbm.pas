unit Fchartbm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxorgchr, dxdborgc, DB, ADODB, ImgList, Menus, ComCtrls,
  ToolWin, ExtCtrls, dxtree, dxdbtree, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSdxDBOCLnk, dxPSCore, dxPSGraphicLnk, dxPSdxOCLnk;

type
  Tchartbm = class(TForm)
    DBTree: TdxDbOrgChart;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N3D1: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    N24: TMenuItem;
    N25: TMenuItem;
    ColorDialog1: TColorDialog;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link2: TdxDBOrgChartReportLink;
    procedure dxDbOrgChart1CreateNode(Sender: TObject; Node: TdxOcNode);
    procedure N1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N3D1Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure DBTreeChanging(Sender: TObject; Node: TdxOcNode;
      var Allow: Boolean);
    procedure DBTreeChange(Sender: TObject; Node: TdxOcNode);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure DBTreeClick(Sender: TObject);
    procedure DBTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure N29Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    selid:integer;
    function GetShape(ShapeName : String) : TdxOcShape;
    function GetNodeAlign(AlignName : String) : TdxOcNodeAlign;
    function GetImageAlign(AlignName : String) : TdxOcImageAlign;
  end;

var
  chartbm: Tchartbm;

implementation

uses fmain, Flistico, Fbranch, Fbrmess;
{$R *.dfm}
function Tchartbm.GetShape(ShapeName : String) : TdxOcShape;
const ShapeArray: array[0..3] of string = ('Rectange', 'Round Rect', 'Ellipse', 'Diamond');
var i : integer;
begin
  Result := TdxOcShape(0);
  for i := 0 to 3 do
    if AnsiUpperCase(ShapeArray[i]) = AnsiUpperCase(ShapeName) then  begin
      Result := TdxOcShape(i);
      break;
    end;
end;


function Tchartbm.GetNodeAlign(AlignName : String) : TdxOcNodeAlign;
const AlignArray: array[0..2] of string = ('Left', 'Center', 'Right');
var i : integer;
begin
  Result := TdxOcNodeAlign(0);
  for i := 0 to 2 do
    if AnsiUpperCase(AlignArray[i]) = AnsiUpperCase(AlignName) then  begin
      Result := TdxOcNodeAlign(i);
      break;
    end;
end;

function Tchartbm.GetImageAlign(AlignName : String) : TdxOcImageAlign;
const AlignArray: array[0..12] of string = (
   'None',
   'Left-Top', 'Left-Center', 'Left-Bottom',
   'Right-Top', 'Right-Center', 'Right-Bottom',
   'Top-Left', 'Top-Center', 'Top-Right',
   'Bottom-Left', 'Bottom-Center', 'Bottom-Right'
   );
var i : integer;
begin
  Result := TdxOcImageAlign(0);
  for i := 0 to 12 do
    if AnsiUpperCase(AlignArray[i]) = AnsiUpperCase(AlignName) then  begin
      Result := TdxOcImageAlign(i);
      break;
    end;
end;

procedure Tchartbm.dxDbOrgChart1CreateNode(Sender: TObject;
  Node: TdxOcNode);
begin
  with Node, main.branch do
  begin
      node.Color:=main.branch.fieldbyname('color').AsInteger;
      node.ImageIndex:=main.branch.fieldbyname('image').AsInteger;
      Node.ChildAlign := GetNodeAlign('Center');
  end;
end;

procedure Tchartbm.N1Click(Sender: TObject);
begin
    if (DBTree.Selected <> nil) then
      DBTree.ShowEditor;
end;

procedure Tchartbm.N13Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tchartbm.N22Click(Sender: TObject);
begin
DBTree.FullExpand;
end;

procedure Tchartbm.N23Click(Sender: TObject);
begin
DBTree.FullCollapse;
end;

procedure Tchartbm.N19Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  DBTree.Zoom := TMenuItem(Sender).Checked;
end;

procedure Tchartbm.N20Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
   if TMenuItem(Sender).Checked then
     DBTree.Options := DBTree.Options + [ocAnimate]
   else
     DBTree.Options := DBTree.Options - [ocAnimate];
end;

procedure Tchartbm.N3D1Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
   if TMenuItem(Sender).Checked then
     DBTree.Options := DBTree.Options + [ocRect3D]
   else
     DBTree.Options := DBTree.Options - [ocRect3D];
end;

procedure Tchartbm.N25Click(Sender: TObject);
var tmpid:string;
    tmpstr:string;
begin
  if self.DBTree.Selected=nil then exit;
  brmess:=tbrmess.create(application);
  brmess.GroupBox1.Caption:='['+self.DBTree.Selected.Text+']的统计信息';
  //...隶属
  if (main.branch.fieldbyname('pid').AsString='0') or (main.branch.fieldbyname('pid').AsString='') or (main.branch.fieldbyname('pid').AsString=main.branch.fieldbyname('id').AsString) then
    begin
      tmpstr:='无上级部门';
    end
    else
    begin
      tmpid:=main.branch.fieldbyname('pid').AsString;
      brmess.ADOQuery1.Close;
      brmess.ADOQuery1.SQL.Clear;
      brmess.ADOQuery1.SQL.Add('select * from r_staffbranch');
      brmess.ADOQuery1.Filtered:=false;
      brmess.ADOQuery1.Filter:=format('id'+'='+'''%s''',[tmpid]);
      brmess.ADOQuery1.Filtered:=true;
      brmess.ADOQuery1.Open;
      if brmess.ADOQuery1.RecordCount=0 then
          tmpstr:='无上级部门'
        else
          tmpstr:='隶属于：'+brmess.ADOQuery1.fieldbyname('branchname').AsString;
    end;
  tmpstr:=tmpstr+#13+'---------------------------------'+#13#13;
  //...下属部门
  tmpstr:=tmpstr+'下属部门：'+#13#13;
  tmpid:=main.branch.fieldbyname('id').AsString;
  brmess.ADOQuery1.Close;
  brmess.ADOQuery1.SQL.Clear;
  brmess.ADOQuery1.SQL.Add('select * from r_staffbranch');
  brmess.ADOQuery1.Filtered:=false;
  brmess.ADOQuery1.Filter:=format('pid'+'='+'''%s''',[tmpid]);
  brmess.ADOQuery1.Filtered:=true;
  brmess.ADOQuery1.Open;
  if brmess.ADOQuery1.RecordCount=0 then
      tmpstr:=tmpstr+'无下属部门'
    else
    begin
      brmess.ADOQuery1.First;
      while not brmess.ADOQuery1.Eof do
        begin
          tmpstr:=tmpstr+brmess.ADOQuery1.fieldbyname('branchname').AsString+' ';
          brmess.ADOQuery1.Next;
        end;
    end;
  tmpstr:=tmpstr+#13+'---------------------------------'+#13#13;
  //..本部人数
  brmess.Label2.Caption:=tmpstr;
  brmess.showmodal;
end;

procedure Tchartbm.DBTreeChanging(Sender: TObject; Node: TdxOcNode;
  var Allow: Boolean);
begin
//  self.StatusBar1.Panels[0].Text:='选择部门：'+self.DBTree.Selected.Text;
//  if node.Level=0 then allow:=false;
end;

procedure Tchartbm.DBTreeChange(Sender: TObject; Node: TdxOcNode);
begin
//  self.StatusBar1.Panels[0].Text:='选择部门：'+self.DBTree.Selected.Text;
end;

procedure Tchartbm.N9Click(Sender: TObject);
begin
  if self.DBTree.Selected.Level=0 then
    begin
      MessageBox(handle,'最高级部门只能唯一！','提示',MB_ICONinformation or MB_OK);
      exit;   
    end;
  bran:=tbran.create(application);
  bran.etype:=1;
  bran.GroupBox2.Visible:=false;
  bran.GroupBox3.Visible:=false;
  bran.Height:=150;
  bran.Button1.Top:=80;
  bran.Button2.Top:=80;
  bran.GroupBox1.Caption:='部门名称';
  bran.showmodal;
end;

procedure Tchartbm.N10Click(Sender: TObject);
begin
  bran:=tbran.Create(application);
  bran.etype:=2;//增加分部
  bran.GroupBox2.Visible:=false;
  bran.GroupBox3.Visible:=false;
  bran.Height:=150;
  bran.Button1.Top:=80;
  bran.Button2.Top:=80;
  bran.GroupBox1.Caption:='分部名称';
  bran.ShowModal;
end;

procedure Tchartbm.N16Click(Sender: TObject);
begin
  if main.branch.RecordCount=0 then exit;
  if self.DBTree.Selected.Level=0 then
    begin
      MessageBox(handle,'最高级部门不可删除！','提示',MB_ICONinformation or MB_OK);
      exit;   
    end;
  if Application.MessageBox('确认要删除这个部门设置吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      DBTree.Delete(DBTree.Selected);
  main.Branch.Close;
  main.branch.Open;
    end;

end;

procedure Tchartbm.N14Click(Sender: TObject);
begin
  bran:=tbran.Create(application);
  bran.Edit1.Text:=self.DBTree.Selected.Text;
  bran.etype:=3;
  bran.Memo1.Lines.Text:=self.DBTree.DataSet.fieldbyname('bmemo').AsString;
  bran.ShowModal;
end;

procedure Tchartbm.N15Click(Sender: TObject);
begin
  listico:=Tlistico.Create(application);
  listico.ShowModal;
end;

procedure Tchartbm.N26Click(Sender: TObject);
begin
  if self.ColorDialog1.Execute then
    begin
      self.DBTree.Selected.Color:=self.ColorDialog1.Color;
    end;
end;

procedure Tchartbm.N27Click(Sender: TObject);
begin
 TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
   DBTree.Rotated := TMenuItem(Sender).Checked;
end;

procedure Tchartbm.DBTreeClick(Sender: TObject);
begin
  self.selid:=self.DBTree.Selected.Level;
end;

procedure Tchartbm.DBTreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if self.DBTree.Selected.Level=0 then
    begin
      accept:=false;
      exit;
    end;

end;

procedure Tchartbm.N29Click(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True,nil);
end;

end.
