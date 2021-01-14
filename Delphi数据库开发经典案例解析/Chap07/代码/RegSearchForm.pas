unit RegSearchForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, DB, ADODB, Buttons;

type
  TRegSearch = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegSearch: TRegSearch;

implementation

{$R *.dfm}

//---------根据输入，查询门诊挂号信息 ----------
procedure TRegSearch.BitBtn1Click(Sender: TObject);
var
time1,time2:string;
begin
   if trim(edit1.Text)='' then
    time1:='1900-1-1 01:00:00'
    else
    time1:=edit1.Text;

   if trim(edit2.Text)='' then
    time2:='2099-1-1 01:00:00'
   else
    time2:=edit2.Text;

   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select 挂号科室,count(编号) 人数,sum(挂号费用) 挂号金额 from 门诊挂号');
   adoquery1.SQL.Add('where (时间>'''+time1+''')and(时间<'''+time2+''')');
   adoquery1.SQL.Add('group by 挂号科室');
   adoquery1.Open;



end;

//----双击文本框，显示前一天此时时间和当前时间--------
procedure TRegSearch.Edit1Click(Sender: TObject);
begin
edit1.Text:=datetostr(date-1)+' '+timetostr(time);
end;

procedure TRegSearch.Edit2Click(Sender: TObject);
begin
edit2.Text:=datetostr(date)+' '+timetostr(time);
end;

//-----初始化窗体时显示所有挂号科室的人数和挂号金额---------
procedure TRegSearch.FormShow(Sender: TObject);
begin
   //请读者注意sql语句group by的用法
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select 挂号科室,count(编号) 人数,sum(挂号费用) 挂号金额 from 门诊挂号');
   adoquery1.SQL.Add('where 时间>''1900-1-1 01:00:00''');
   adoquery1.SQL.Add('group by 挂号科室');
   adoquery1.Open;
end;

procedure TRegSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
