unit yhgl_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, DBCtrls, Buttons, Mask;

type
  Tfrm_yhgl = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    ADOTable1userid: TWideStringField;
    ADOTable1yhm: TWideStringField;
    ADOTable1mm: TWideStringField;
    ADOTable1bm: TWideStringField;
    ADOTable1bgdh: TWideStringField;
    ADOTable1sj: TWideStringField;
    ADOTable1qx: TIntegerField;
    ADOTable1bz: TWideMemoField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label8: TLabel;
    Edit1: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBComboBox1: TDBComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_yhgl: Tfrm_yhgl;
Const
  connstr='Provider=Microsoft.Jet.OLEDB.4.0;'+
          'Data Source=%s;Persist Security Info=False;'+
          'Jet OLEDB:Database Password=%s';

implementation

{$R *.dfm}

procedure Tfrm_yhgl.BitBtn2Click(Sender: TObject);
begin
  self.close;
end;

procedure Tfrm_yhgl.DBEdit3Exit(Sender: TObject);
begin
  edit1.SetFocus;
end;

procedure Tfrm_yhgl.Edit1Exit(Sender: TObject);
begin
  if dbedit3.Text<>edit1.Text then
  begin
    showmessage('两次密码输入不一致，请重新输入');
    edit1.SetFocus;
  end;
end;

procedure Tfrm_yhgl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Free;
end;

procedure Tfrm_yhgl.FormCreate(Sender: TObject);
var
  dbfilename:string;
begin
  dbfilename:=extractfilepath(application.ExeName)+'database\sfgl.mdb';
  adoconnection1.ConnectionString:=format(connstr,[dbfilename,'tjz929']);
  if datasource1.DataSet.State=dsinactive then datasource1.DataSet.Open;
end;

end.
