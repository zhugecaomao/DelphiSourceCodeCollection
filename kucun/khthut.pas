unit khthut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DB, ADODB, Buttons;

type
  Tkhthfm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    clmcbox: TComboBox;
    clbhedit: TEdit;
    clplbox: TComboBox;
    sledit: TEdit;
    dwbox: TComboBox;
    zjeedit: TEdit;
    clggbox: TComboBox;
    cldjedit: TEdit;
    clksbox: TComboBox;
    ADOQuery: TADOQuery;
    rkbt: TSpeedButton;
    qxbt: TSpeedButton;
    gbbt: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure clmcboxChange(Sender: TObject);
    procedure clmcboxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clggboxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clksboxChange(Sender: TObject);
    procedure clksboxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  khthfm: Tkhthfm;

implementation

{$R *.dfm}

procedure Tkhthfm.FormCreate(Sender: TObject);
var
mypath:string;
gg,ks,mc:string;
begin
//mypath:=extractfilepath(paramstr(0));
//ADOquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+mypath+'data\kcgl.mdb;Persist Security Info=False';
//ADOquery.active:=true;

with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb');
open;
first;
gg:='';
ks:='';
mc:='';
while not eof do
begin
if (mc<>fieldbyname('名称').AsString) then
clmcbox.Items.Add(fieldbyname('名称').AsString);
if (gg<>fieldbyname('规格').AsString) then
clggbox.Items.Add(fieldbyname('规格').AsString);
if ks<>fieldbyname('款式').AsString then
clksbox.Items.Add(fieldbyname('款式').AsString);
mc:=fieldbyname('名称').AsString;
gg:=fieldbyname('规格').AsString;
ks:=fieldbyname('款式').AsString;
next;
end;
end;
end;

procedure Tkhthfm.clmcboxChange(Sender: TObject);
begin
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb where 名称=:mc');
Parameters.ParamByName('mc').Value:=trim(clmcbox.Text);
open;
if recordcount>=1 then
begin
first;
clggbox.Clear;
clksbox.Clear;
while not eof do
begin
clggbox.Items.Add(fieldbyname('规格').AsString);
clksbox.Items.Add(fieldbyname('款式').AsString);
next;
end;
end;
end;
end;

procedure Tkhthfm.clmcboxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var
  str:string;
begin
if key=13 then
begin
if (clmcbox.Text='') then
 begin
  showmessage('请输入材料名称!');
  clmcbox.SetFocus;
  exit;
 end;
str:='select * from bhb where 编码=:bm or 名称=:mc';
with ADOQuery do
  begin
    close;
    sql.Clear;
    sql.Add(str);
    Parameters.ParamByName('bm').Value:=trim(clmcbox.Text);
    Parameters.ParamByName('mc').Value:=trim(clmcbox.Text);
    open;
   if recordcount>=1 then
     begin
       //if recordcount>=2 then
         //begin
           //clmcbox.Clear;
            //first;
         //  while not eof do
              //begin
                clmcbox.Items.Add(fieldbyname('名称').AsString);
               // next;
              //end;
                 //clmcbox.SetFocus;
                // clmcbox.DroppedDown:=true;
                // clmcbox.AutoDropDown:=true;

//   end
        //else
           //begin
             clmcbox.AutoDropDown:=false;
             clmcbox.text:=fieldbyname('名称').AsString;
             clggbox.SetFocus;
          // end;
        end
      else
     begin
     if (clmcbox.Text>='0') and (clmcbox.Text<='z') then
     begin
       showmessage('不存在你输入的材料编码名称!');
       clmcbox.SetFocus;
    end
     else
      clggbox.SetFocus;
  end;
    end;
    end;
end;

procedure Tkhthfm.clggboxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
if (clggbox.Text='') then
 begin
  showmessage('请选择规格!');
  clggbox.SetFocus;
  exit;
 end
else
clksbox.SetFocus;
end;

procedure Tkhthfm.clksboxChange(Sender: TObject);
begin
if (clksbox.Text='') then
 begin
  showmessage('请选择款式!');
  clksbox.SetFocus;
  exit;
 end;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb where 名称=:mc and 规格=:gg and 款式=:ks');
Parameters.ParamByName('mc').Value:=trim(clmcbox.Text);
Parameters.ParamByName('gg').Value:=trim(clggbox.Text);
Parameters.ParamByName('ks').Value:=trim(clksbox.Text);
open;
clbhedit.Text:=fieldbyname('编号').AsString;
clplbox.Text:=fieldbyname('品类').AsString;
dwbox.Text:=fieldbyname('单位').AsString;
//hwedit.Text:=fieldbyname('货位').AsString;
end;

end;

procedure Tkhthfm.clksboxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
begin
if (clksbox.Text='') then
 begin
  showmessage('请选择款式!');
  clksbox.SetFocus;
  exit;
 end
else
clbhedit.SetFocus;
//jhdwbox.Clear;
with adoquery do
begin
close;
sql.Clear;
sql.Add('select * from bhb where 名称=:mc and 规格=:gg and 款式=:ks');
Parameters.ParamByName('mc').Value:=trim(clmcbox.Text);
Parameters.ParamByName('gg').Value:=trim(clggbox.Text);
Parameters.ParamByName('ks').Value:=trim(clksbox.Text);
open;
if recordcount=1 then
begin
clbhedit.Text:=fieldbyname('编号').AsString;
clplbox.Text:=fieldbyname('品类').AsString;
dwbox.Text:=fieldbyname('单位').AsString;
end
else
 showmessage('不存在你输入的名称和规格款式的编号,请核对或则自己输入编号！');
end;

end;
end;

end.
