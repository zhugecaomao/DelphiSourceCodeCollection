unit zycsf_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, ExtCtrls,
  ComCtrls, XPMenu;

type
  Tzycsf = class(TForm)
    Panel8: TPanel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit30: TDBEdit;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Button9: TButton;
    Button10: TButton;
    Eyjf: TEdit;
    Esjf: TEdit;
    Ezb: TEdit;
    Button11: TButton;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    REzycsf: TRichEdit;
    BitBtn2: TBitBtn;
    XPMenu1: TXPMenu;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure EyjfKeyPress(Sender: TObject; var Key: Char);
    procedure EsjfKeyPress(Sender: TObject; var Key: Char);
    procedure Button11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    STRyjf,STRsjf:string;
  end;

var
  zycsf: Tzycsf;

implementation

uses DM_zygl_, zysf_bb_, zygl_, denglu_;

{$R *.dfm}

procedure Tzycsf.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
     button9.Click;
end;

procedure Tzycsf.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
     button10.Click;
end;

procedure Tzycsf.Button9Click(Sender: TObject);
begin
 if Edit1.Text<>'' then
  begin
   DMzygl.ADOTbab.Locate('病人id',Edit1.Text,[]);  //查询id
     if DBEdit1.Text <> Edit1.Text then
       begin
         showmessage('没有找到这个id');
         Edit1.Text:='';
         Edit1.SetFocus;
         exit;
       end;
   //Edit1.Text:='';
   Eyjf.Enabled:=true;
   Eyjf.SetFocus;    //获取焦点
   Ezb.Text:='';

   edit1.Enabled:=false;
   edit2.Enabled:=false;
   button9.Enabled:=false;
   button10.Enabled:=false;
  end
 else
  begin
   showmessage('没填查询值');
   Edit1.SetFocus;   //获取焦点
  end;
end;

procedure Tzycsf.Button10Click(Sender: TObject);
begin
 if Edit2.Text<>'' then
  begin
   DMzygl.ADOTbab.Locate('姓名',Edit2.Text,[]);  //查询id
     if DBEdit4.Text <> Edit2.Text then
       begin
         showmessage('没有找到这个姓名');
       end;
   //Edit2.Text:='';
   Eyjf.SetFocus;    //获取焦点
   Ezb.Text:='';
   edit1.Enabled:=false;
   edit2.Enabled:=false;
   button9.Enabled:=false;
   button10.Enabled:=false;
  end
 else
  begin
   showmessage('没填查询值');
   Edit2.SetFocus;   //获取焦点
  end;
end;

procedure Tzycsf.EyjfKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
    begin
     Esjf.Enabled:=true;
     Esjf.SetFocus;
     Eyjf.Enabled:=false;
    end;
end;

procedure Tzycsf.EsjfKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
    begin
     button11.Enabled:=true;
     button11.SetFocus;
     Esjf.Enabled:=false;
    end;
end;

procedure Tzycsf.Button11Click(Sender: TObject);
begin
  if Eyjf.Text='' then
    begin
      //判断应交费是否为空
      showmessage('请填写应交费');
      Eyjf.Enabled:=true;
      Esjf.Enabled:=false;
      Eyjf.SetFocus;
      exit;
    end
  else
    begin
      if Esjf.Text='' then
        begin
          //判断实交费是否为空
          showmessage('请填写实交费');
          Esjf.Enabled:=true;
          Eyjf.Enabled:=false;
          Esjf.SetFocus;
          exit;
        end
         else
           begin
                 try
                    Ezb.Text:=floattostr(strtofloat(Esjf.Text)-strtofloat(Eyjf.Text));
                 except
                  begin
                    showmessage('请正确填写数值');
                    Eyjf.Enabled:=true;
                    Eyjf.SetFocus;
                    Esjf.Enabled:=false;
                    exit;
                  end;
                 end;

                 //更病案表改押金
                 DMzygl.ADOTbab.Edit;
                 DMzygl.ADOTbab.FieldByName('押金').AsString:=floattostr(strtofloat(DBedit30.Text)+strtofloat(Esjf.Text));
                 DMzygl.ADOTbab.UpdateBatch;

                 //记录收费
                 DMzygl.ADOTzysf.Append;
                 DMzygl.ADOTzysf.FieldByName('病人id').AsString:=DBEdit1.Text;
                 DMzygl.ADOTzysf.FieldByName('住院费').AsString:=Esjf.Text;
                 DMzygl.ADOTzysf.FieldByName('交费时间').AsDateTime:=DateTimePicker1.Date;
                 DMzygl.ADOTzysf.Post;

                 //全局变量添如
                 STRyjf:='';
                 STRsjf:='';
                 STRyjf:=Eyjf.Text;
                 STRsjf:=Esjf.Text;
                 REzycsf.Lines.Strings[3]:='    '+STRyjf+'     '+STRsjf+'      '+Ezb.Text;

                 Eyjf.Text:='';
                 Esjf.Text:='';
                 Edit1.Text:='';
                 Edit2.Text:='';
                 edit1.Enabled:=true;
                 edit2.Enabled:=true;
                 edit1.SetFocus;
                 button9.Enabled:=true;
                 button10.Enabled:=true;
                 button11.Enabled:=false;

                 


                end;
    end;
end;

procedure Tzycsf.BitBtn1Click(Sender: TObject);
begin
  edit1.Enabled:=true;
  edit2.Enabled:=true;
  Eyjf.Enabled:=false;
  Eyjf.Text:='';
  Esjf.Enabled:=false;
  Esjf.Text:='';
  edit1.SetFocus;
  button9.Enabled:=true;
  button10.Enabled:=true;
  button11.Enabled:=false;
end;

procedure Tzycsf.BitBtn2Click(Sender: TObject);
begin
   zysf_bb.QuickRep1.Preview;
end;

procedure Tzycsf.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;
end;

end.
