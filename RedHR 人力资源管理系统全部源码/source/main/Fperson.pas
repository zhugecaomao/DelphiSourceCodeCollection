unit Fperson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, cxDBData, ComCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ToolWin;

type
  Tperson = class(TForm)
    MainMenu1: TMainMenu;
    r_person: TADOTable;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    r_personDataSource: TDataSource;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    r_staffbranch: TADOTable;
    r_staffpost: TADOTable;
    r_staffbranchDataSource: TDataSource;
    r_staffpostDataSource: TDataSource;
    p_inperson: TADOTable;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    p_inpersonDataSource: TDataSource;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    PopupMenu2: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    ADOTable1: TADOTable;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  person: Tperson;

implementation

uses fmain,Registry, Feditper, Finper;
{$R *.dfm}

procedure Tperson.FormCreate(Sender: TObject);
begin
  self.r_staffbranch.Open;    //部门
  self.r_staffpost.Open;      //职位
  self.r_person.Open;         //人才需求
  self.p_inperson.Open;       //应聘人员
end;

procedure Tperson.FormShow(Sender: TObject);
begin
  self.Height:=main.Height;
  self.Width:=main.Width;
  self.Left:=main.Left;
  self.Top:=main.Top;
  self.WindowState:=main.WindowState;
end;

procedure Tperson.FormResize(Sender: TObject);
begin
  self.cxGrid1.Height:=(self.Height div 2) -20;
end;

procedure Tperson.N3Click(Sender: TObject);
begin
  editper:=teditper.create(application);
  self.r_person.Append;
  editper.showmodal;
end;

procedure Tperson.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  editper:=teditper.create(application);
  self.r_person.edit;
  editper.showmodal;
end;

procedure Tperson.N6Click(Sender: TObject);
begin
  if self.r_person.RecNo=-1 then exit;
  inper:=tinper.create(application);
  self.p_inperson.Append;
  inper.showmodal;
  self.r_person.Close;
  self.r_person.Open;
  self.p_inperson.Close;
  self.p_inperson.Open;
end;

procedure Tperson.cxGridDBTableView1DblClick(Sender: TObject);
begin
  if self.r_person.RecNo=-1 then exit;
  if self.p_inperson.RecNo=-1 then exit;
  inper:=tinper.create(application);
  self.p_inperson.Edit;
  inper.showmodal;
end;

procedure Tperson.N11Click(Sender: TObject);
begin
  if self.r_person.Active=false then exit;
  if self.r_person.RecordCount=0 then exit;
  if self.r_person.RecNo=-1 then exit;
  if Application.MessageBox('确认要删除所选择的数据吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.r_person.Delete;
      self.r_person.Close;
      self.r_person.Open;
    end;
end;

procedure Tperson.N16Click(Sender: TObject);
begin
  if self.p_inperson.Active=false then exit;
  if self.p_inperson.RecordCount=0 then exit;
  if self.p_inperson.RecNo=-1 then exit;
  if Application.MessageBox('确认要删除所选择的数据吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.p_inperson.Delete;
      self.p_inperson.Close;
      self.p_inperson.Open;
    end;
end;

procedure Tperson.N7Click(Sender: TObject);
begin
  self.p_inperson.Close;
  self.p_inperson.Open;
  self.r_person.Close;
  self.r_person.Open;
  if self.ADOTable1.Active=true then
    begin
      self.ADOTable1.Close;
      self.ADOTable1.Open;
    end;
end;

procedure Tperson.N10Click(Sender: TObject);
begin
  if self.N10.Checked=false then
    begin
      self.N10.Checked:=true;
      self.ADOTable1.Open;
      self.p_inpersonDataSource.DataSet:=self.ADOTable1;
    end
    else
    begin
      self.N10.Checked:=false;
      self.ADOTable1.Close;
      self.p_inpersonDataSource.DataSet:=self.p_inperson;
    end;
end;

procedure Tperson.N9Click(Sender: TObject);
begin
  self.Close;
end;

end.
