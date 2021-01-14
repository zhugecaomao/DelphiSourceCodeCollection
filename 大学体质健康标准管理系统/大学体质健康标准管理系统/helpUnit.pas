unit helpUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, bsSkinCtrls,
  BusinessSkinForm;

type
  Thelpinfo = class(TForm)
    GroupBox2: TGroupBox;
    richedit: TRichEdit;
    GroupBox4: TGroupBox;
    RichEdit2: TRichEdit;
    PopupMenu1: TPopupMenu;
    GroupBox5: TGroupBox;
    RichEdit3: TRichEdit;
    GroupBox3: TGroupBox;
    RichEdit1: TRichEdit;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinPanel1: TbsSkinPanel;
    Bevel3: TBevel;
    BitBtn4: TbsSkinButton;
    Bevel4: TBevel;
    BitBtn2: TbsSkinButton;
    Bevel2: TBevel;
    Bevel1: TBevel;
    BitBtn1: TbsSkinButton;
    BitBtn3: TbsSkinButton;
    procedure RichEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure richeditKeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  helpinfo: Thelpinfo;

implementation
uses mainunit;

{$R *.dfm}

procedure Thelpinfo.RichEdit2KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Thelpinfo.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Thelpinfo.richeditKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Thelpinfo.RichEdit3KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Thelpinfo.FormCreate(Sender: TObject);
begin
helpinfo.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-helpinfo.Width div 2;
helpinfo.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-helpinfo.Height div 2;
end;


procedure Thelpinfo.BitBtn1Click(Sender: TObject);
begin
GroupBox2.Visible:=true;
GroupBox3.Visible:=false;
GroupBox4.Visible:=false;
GroupBox5.Visible:=false;
end;

procedure Thelpinfo.BitBtn2Click(Sender: TObject);
begin
GroupBox2.Visible:=false;
GroupBox3.Visible:=true;
GroupBox4.Visible:=false;
GroupBox5.Visible:=false;
end;

procedure Thelpinfo.BitBtn3Click(Sender: TObject);
begin
GroupBox2.Visible:=false;
GroupBox3.Visible:=false;
GroupBox4.Visible:=true;
GroupBox5.Visible:=false;
end;

procedure Thelpinfo.BitBtn4Click(Sender: TObject);
begin
GroupBox2.Visible:=false;
GroupBox3.Visible:=false;
GroupBox4.Visible:=false;
GroupBox5.Visible:=true;
end;



procedure thelpinfo.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
    with msg.minmaxinfo^ do
   
    begin
      ptMinTrackSize:=point(696,411);//  限定大小
      ptMaxTrackSize:=point(696,411); // 限定大小
    end;
end;




end.
