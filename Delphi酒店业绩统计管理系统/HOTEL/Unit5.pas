unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, XPMan, ADODB, StdCtrls, Mask,
  DBCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView1pas: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    XPManifest1: TXPManifest;
    dbedit2: TDBEdit;
    dbedit1: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';
ADOTable1.TableName:='用户';
ADOTable1.Active:=True;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
ADOTable1.Append;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
ADOTable1.Edit;
ADOTable1.Post;
ShowMessage('记录保存成功！');
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
if messagebox(self.Handle ,'确认删除这个用户吗？','系统提示 ！',mb_yesno)=idyes then
  begin
     ADOTable1.delete ;
  end
else   ;
end;

end.
