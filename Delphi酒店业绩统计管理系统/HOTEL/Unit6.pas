unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, XPMan, ADODB, StdCtrls, Mask,
  DBCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    XPManifest1: TXPManifest;
    cxGrid1DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    Label3: TLabel;
    DBEdit3: TDBEdit;
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
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
ADOTable1.Append;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
ADOTable1.Edit;
ADOTable1.Post;
ShowMessage('记录保存成功！');
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
if messagebox(self.Handle ,'确认删除这个编号吗？','系统提示 ！',mb_yesno)=idyes then
  begin
     ADOTable1.delete ;
  end
else   ;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';
ADOTable1.TableName:='csbh';
ADOTable1.Active:=True;
end;

end.
