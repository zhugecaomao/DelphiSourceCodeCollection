unit xtcshut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls, ComCtrls;

type
  Txtcshfm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ADOQuery: TADOQuery;
    OpenDialog1: TOpenDialog;
    ftpado: TADOQuery;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure scbtClick(Sender: TObject);
  private
  procedure shujuchuli(str:string;adoquery:TADOQUERY);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  xtcshfm: Txtcshfm;
  mypath,str:string;
implementation

uses ftput, mainut;

{$R *.dfm}
procedure Txtcshfm.shujuchuli(str:string;adoquery:TADOQUERY);
begin
with adoquery do
begin
 close;
 sql.clear;
 sql.add(str);
 try

 if messagedlg('警告！数据删除后不可以恢复，确定操作吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  execsql;
  showmessage('操作成功！');
  end;
 except
  showmessage('操作失败！');
  end;
  end;
end;
procedure Txtcshfm.BitBtn1Click(Sender: TObject);
begin
str:='delete from rkb';
shujuchuli(str,adoquery);
str:='delete from rkdb';
shujuchuli(str,adoquery);
str:='delete from cprkb';
shujuchuli(str,adoquery);
str:='delete from cprkdb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn2Click(Sender: TObject);
begin
str:='delete from ckb';
shujuchuli(str,adoquery);
str:='delete from ckdb';
shujuchuli(str,adoquery);
str:='delete from cpckb';
shujuchuli(str,adoquery);
str:='delete from cpckdb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn3Click(Sender: TObject);
begin
str:='delete from kcb';
shujuchuli(str,adoquery);
str:='delete from cpkcb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn4Click(Sender: TObject);
begin
str:='delete from hzb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn5Click(Sender: TObject);
begin
str:='delete from bhb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn6Click(Sender: TObject);
begin
str:='delete from czyb where 姓名<>"admin"';
shujuchuli(str,adoquery);
str:='delete from gzyb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn7Click(Sender: TObject);
begin
str:='delete from ghdwb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn8Click(Sender: TObject);
begin
str:='delete from tlb';
shujuchuli(str,adoquery);
str:='delete from tldb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.BitBtn9Click(Sender: TObject);
begin
str:='delete from thb';
shujuchuli(str,adoquery);
str:='delete from thdb';
shujuchuli(str,adoquery);
end;

procedure Txtcshfm.scbtClick(Sender: TObject);
var s,s1,s2:string;
 i:integer;
 num:array[0..100] of string;
 str:string;
begin


end;

end.
