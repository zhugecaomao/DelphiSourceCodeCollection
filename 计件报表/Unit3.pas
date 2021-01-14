unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
self.ADOQuery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+form1.getdir+'data.mdb;Persist Security Info=False';
self.ADOQuery1.Active:=true;
end;

procedure TForm3.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=chr(39) then
   begin
    showmessage('不能输入单引号！');
    Key :=#10 ;
   end;

  if key=chr(13) then
     self.DBEdit2.SetFocus;
end;

procedure TForm3.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(13)) and ((ADOQuery1.State=dsEdit) or (ADOQuery1.State=dsInsert)) then
    begin
      self.ADOQuery1.Post;
      self.DBNavigator1.BtnClick(nbInsert);
      self.DBEdit1.SetFocus;
    end;

end;

procedure TForm3.ADOQuery1BeforePost(DataSet: TDataSet);
var
  proq:TADOQuery;

begin
    if (self.DBEdit1.Text='') or (self.DBEdit2.Text='') then
       abort;
       
    proq:=form1.Doadosql(proq,'select * from 品名 where product='''+self.DBEdit1.Text+'''');
    if not proq.IsEmpty then
      begin
       showmessage('该品名已经存在！');
       self.DBEdit1.SetFocus;
       abort
      end

end;

procedure TForm3.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
if Button=nbInsert then
   self.DBEdit1.SetFocus;
end;

end.
