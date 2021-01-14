unit meinju;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, DBTables, Grids, DBGrids,comobj, StdCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DBGrid2: TDBGrid;
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

  var
        SQLServer:Variant;  
        ServerList:Variant;
        i,nServers:integer;  
        sRetValue:String;
  begin  

      SQLServer   :=   CreateOleObject('SQLDMO.Application');
      ServerList:=   SQLServer.ListAvailableSQLServers;
      nServers:=ServerList.Count;
      for   i   :=   1   to   nservers   do
              ListBox1.Items.Add(ServerList.Item(i));
      SQLServer:=NULL;
      serverList:=NULL;
  end;

end.
