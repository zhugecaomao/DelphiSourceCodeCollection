unit lrdy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tlrdyfm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ayf: TRadioButton;
    yf: TComboBox;
    ajd: TRadioButton;
    jd: TComboBox;
    Label1: TLabel;
    bybb: TBitBtn;
    bjdbb: TBitBtn;
    tjbb: TBitBtn;
    bnbb: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ayfClick(Sender: TObject);
    procedure ajdClick(Sender: TObject);
    procedure yfChange(Sender: TObject);
    procedure jdChange(Sender: TObject);
    procedure bybbClick(Sender: TObject);
    procedure bjdbbClick(Sender: TObject);
    procedure bnbbClick(Sender: TObject);
    procedure tjbbClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lrdyfm: Tlrdyfm;

implementation

uses mainut,  lrbbdy;

{$R *.dfm}

procedure Tlrdyfm.FormCreate(Sender: TObject);
begin
 yf.Enabled:=false;
 jd.Enabled:=false;
 tjbb.Enabled:=false;
end;

procedure Tlrdyfm.ayfClick(Sender: TObject);
begin
 if ayf.Checked=true then
 yf.Enabled:=true;
 jd.Text:='';
 jd.Enabled:=false;
end;

procedure Tlrdyfm.ajdClick(Sender: TObject);
begin
if ajd.Checked=true then
jd.Enabled:=true;
yf.Text:='';
 yf.Enabled:=false;
end;

procedure Tlrdyfm.yfChange(Sender: TObject);
begin
 if yf.Text<>'' then
   begin
     mainfm.iyf:=strtoint(yf.Text);
     mainfm.sxz:='按月份';
      tjbb.Enabled:=true;
    
   end;
 
end;

procedure Tlrdyfm.jdChange(Sender: TObject);
begin
if jd.Text<>'' then
   begin
      if jd.Text='1' then
     mainfm.iyf:=1;
     if jd.Text='2' then
     mainfm.iyf:=4;
     if jd.Text='3' then
     mainfm.iyf:=7;
     if jd.Text='4' then
     mainfm.iyf:=10;
     mainfm.sxz:='按季度';
     tjbb.Enabled:=true;
     mainfm.s_jd:=trim(jd.Text);
     end;
end;

procedure Tlrdyfm.bybbClick(Sender: TObject);
begin
 mainfm.sxz:='本月报表';
ylrbbfm:=Tylrbbfm.Create(self);

ylrbbfm.QuickRep1.Preview;

ylrbbfm.Free;
end;

procedure Tlrdyfm.bjdbbClick(Sender: TObject);
begin
mainfm.sxz:='本季度报表';
ylrbbfm:=Tylrbbfm.Create(self);

ylrbbfm.QuickRep1.Preview;

ylrbbfm.Free;
end;

procedure Tlrdyfm.bnbbClick(Sender: TObject);
begin
mainfm.sxz:='本年报表';
ylrbbfm:=Tylrbbfm.Create(self);

ylrbbfm.QuickRep1.Preview;

ylrbbfm.Free;
end;

procedure Tlrdyfm.tjbbClick(Sender: TObject);
begin
ylrbbfm:=Tylrbbfm.Create(self);
ylrbbfm.QuickRep1.Preview;

ylrbbfm.Free;
end;

procedure Tlrdyfm.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
