unit aboutUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, BusinessSkinForm, bsSkinCtrls;

type
  Taboutform = class(TForm)
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinPanel1: TbsSkinPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  aboutform: Taboutform;

implementation
uses mainunit;

{$R *.dfm}

procedure Taboutform.FormCreate(Sender: TObject);
var
  computername:pchar;
  size:Cardinal;
  re:Boolean;
begin
aboutform.Left:=GetSystemMetrics(SM_CXSCREEN) div 2-aboutform.Width div 2;
aboutform.Top:=GetSystemMetrics(SM_CYSCREEN) div 2-aboutform.Height div 2;
try
size:=MAX_COMPUTERNAME_LENGTH;
Getmem(ComputerName,Size);
re:=GetComputerName(ComputerName, Size);
if re then
  Label6.Caption:=StrPas(Computername)
else
  abort;
FreeMem(Computername);
except
  abort;
end;
end;

procedure taboutform.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
    with msg.minmaxinfo^ do
   
    begin
      ptMinTrackSize:=point(500,333);//  限定大小
      ptMaxTrackSize:=point(500,333); // 限定大小
    end;
end;



procedure Taboutform.FormShow(Sender: TObject);
begin
if mainform.runtag=true then
  Label13.Caption:='已注册'+'　'
else
  Label13.Caption:='未注册'+'　';
end;

end.
