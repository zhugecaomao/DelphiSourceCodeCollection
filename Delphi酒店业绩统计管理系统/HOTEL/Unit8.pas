unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, XPMan, ADODB, StdCtrls, Mask,
  DBCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    XPManifest1: TXPManifest;
    cxGrid1DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
ADOTable1.Append;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
ADOTable1.Edit;
ADOTable1.Post;
ShowMessage('记录保存成功！');
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
if messagebox(self.Handle ,'确认删除这条记录吗？','系统提示 ！',mb_yesno)=idyes then
  begin
     ADOTable1.delete ;
  end
else   ;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';
ADOTable1.TableName:='菜名';
ADOTable1.Active:=True;
end;

end.
