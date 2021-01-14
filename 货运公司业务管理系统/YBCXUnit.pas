unit YBCXUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, AAFont, AACtrls, TFlatComboBoxUnit;

type
  TYBCXForm = class(TForm)
    AALabel1: TAALabel;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FlatComboBox1: TFlatComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YBCXForm: TYBCXForm;

implementation

uses DMUnit, KHFYQueryUnit, MainUnit;

{$R *.dfm}

procedure TYBCXForm.BitBtn1Click(Sender: TObject);
var
  Str:String;
 s1:String;
begin
  if (Flatcombobox1.Text='') or (Edit2.Text='') then
   begin
     showmessage('请输入完整查询条件!');
     DM.MonthQuery.Close;
     DM.MonthQuery.SQL.Clear;
     DM.MonthQuery.SQL.Add('select * from KHFY');
     DM.MonthQuery.Open;
      YBCXForm.Close;
   end;
   Str:='select * from KHFY';
    S1:=Edit2.Text;
  if FlatComBoBox1.Text='提单号' then
    begin
      Str:=Str+' where KHFY_ID like '''+s1+'%'+'''';
    end;
  if FlatComBoBox1.Text='发货公司' then
    begin
      Str:=Str+' where KHFY_NAME like '''+s1+'%'+'''';
    end;
  if FlatComBoBox1.Text='业务员' then
    begin
      Str:=Str+' where KHFY_YWY like '''+s1+'%'+'''';
    end;
  if FlatComBoBox1.Text='船名/船次' then
    begin
      Str:=Str+' where KHFY_CHAN like '''+s1+'%'+'''';
    end;
  if FlatComBoBox1.Text='年' then
    begin
      Str:=Str+' where KHFY_YEAR like '''+s1+'%'+'''';
    end;
  if FlatComBoBox1.Text='月' then
    begin
      Str:=Str+' where KHFY_YUE like '''+s1+'%'+'''';
    end;
    DM.MonthQuery.Close;
    DM.MonthQuery.SQL.Clear;
    DM.MonthQuery.SQL.Add(str);
    DM.MonthQuery.Open;
    YBCXForm.Close;
end;

procedure TYBCXForm.BitBtn2Click(Sender: TObject);
begin
  close;
  DM.MonthQuery.Close;
  DM.MonthQuery.SQL.Clear;
  DM.MonthQuery.SQL.Add('select * from KHFY');
  DM.MonthQuery.Open;
end;

end.
