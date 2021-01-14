unit BookSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TBookSetting = class(TParent)
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    ADOQuery2: TADOQuery;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookSetting: TBookSetting;

implementation

{$R *.dfm}

procedure TBookSetting.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //设置表的字段宽度
  dbgrid1.Columns[0].Width:=64;
  dbgrid1.Columns[1].Width:=256;

end;

procedure TBookSetting.ToolButton6Click(Sender: TObject);
var
 maxnum:integer;
 newnum,max:string;
begin
  inherited;
  //自动确定新用户编号
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select max(类型编号) 最大编号 from 图书类型');
adoquery2.Open;
adoquery2.FieldByName('最大编号');
//trim函数用于去掉结果字符串中的空格
max:=trim(adoquery2.Fieldbyname('最大编号').asstring);
maxnum:=strtoint(max);
maxnum:=maxnum+1;
newnum:=inttostr(maxnum);
if length(newnum)=1 then
 dbedit1.Text:='00'+newnum;
if length(newnum)=2 then
 dbedit1.Text:='0'+newnum;
if length(newnum)=3 then
 dbedit1.Text:=newnum;

end;

end.
