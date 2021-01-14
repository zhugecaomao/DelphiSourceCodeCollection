unit Fpworks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ADODB;

type
  Tpworks = class(TForm)
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    p_tools: TADOTable;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pworks: Tpworks;

implementation
uses fmain, Fptools;
{$R *.dfm}

procedure Tpworks.Button1Click(Sender: TObject);
begin
  close
end;

procedure Tpworks.Button2Click(Sender: TObject);
begin
  if self.p_tools.RecNo=-1 then exit;
  if Application.MessageBox('本次删除操作将不能恢复，是否继续？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.p_tools.Delete;
      self.p_tools.Close;
      self.p_tools.Open;
    end;
end;

procedure Tpworks.Button3Click(Sender: TObject);
begin
  ptools:=tptools.create(application);
  self.p_tools.Append;
  ptools.showmodal;
end;

procedure Tpworks.Button4Click(Sender: TObject);
begin
  if self.p_tools.RecNo=-1 then exit;
  ptools:=tptools.create(application);
  self.p_tools.Edit;
  ptools.showmodal;
end;

end.
