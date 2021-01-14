unit Unitbcjglr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, wwdbdatetimepicker, Buttons, XPMenu,
  ComCtrls;

type
  Tfrmbcjglr = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edtbcbh: TLabeledEdit;
    edtbcmc: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dtswsb: TwwDBDateTimePicker;
    dtxwsb: TwwDBDateTimePicker;
    dtwssb: TwwDBDateTimePicker;
    dtjbsb: TwwDBDateTimePicker;
    dtswxb: TwwDBDateTimePicker;
    dtxwxb: TwwDBDateTimePicker;
    dtwsxb: TwwDBDateTimePicker;
    dtjbxb: TwwDBDateTimePicker;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    flag:integer;
    procedure viewrecord;
  public
    { Public declarations }
    bmbh:string;
  end;

var
  frmbcjglr: Tfrmbcjglr;
implementation

uses untdatadm, func;



{$R *.dfm}
//自定义函数
procedure tfrmbcjglr.viewrecord;
begin
  if dmmain.cdsbcjg.Active  then dmmain.cdsbcjg.Close;
  dmmain.cdsbcjg.Params.ParamByName('no').AsString:=trim(bmbh);
  try
  dmmain.cdsbcjg.Open;
  if dmmain.cdsbcjg.IsEmpty  then
  begin
    flag:=1;
  end else
  begin
    flag:=2;
    edtbcbh.Text:=bmbh;
  end;
  except
  end;
end;
//////////
///////////////////

/////////////
procedure Tfrmbcjglr.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmbcjglr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmbcjglr.FormShow(Sender: TObject);
var
  sql,make:string;
begin
  viewrecord;
  if flag=1 then
  begin
    sql:='select max(bc_no) from dp_bcjg';
    make:='';
    bmbh:=setcode(sql,make);
    edtbcbh.Text:=bmbh;
  end;
end;


procedure Tfrmbcjglr.BitBtn1Click(Sender: TObject);
begin
  if trim(edtbcmc.Text)='' then
  begin
    application.MessageBox('请输入该班次名称！',pchar(application.Title),mb_iconinformation);
    edtbcmc.SetFocus;
    exit;
  end else
  begin
    if flag=1 then
    begin
      dmmain.cdsbcjg.Insert;
      dmmain.cdsbcjg.fieldbyname('bc_name').asstring:=trim(edtbcmc.Text);
      dmmain.cdsbcjg.fieldbyname('bc_no').asstring:=trim(bmbh);
    end else
    begin
      dmmain.cdsbcjg.Edit;
    end;
    dmmain.cdsbcjg.fieldbyname('swsb').asstring :=formatdatetime('hh'':''MM'':''ss',dtswsb.Time);
    dmmain.cdsbcjg.fieldbyname('swxb').asstring:=formatdatetime('hh'':''MM'':''ss',dtswxb.Time);
    dmmain.cdsbcjg.fieldbyname('xwsb').asstring:=formatdatetime('hh'':''MM'':''ss',dtxwsb.Time);
    dmmain.cdsbcjg.fieldbyname('xwxb').asstring:=formatdatetime('hh'':''MM'':''ss',dtxwxb.Time);
    dmmain.cdsbcjg.fieldbyname('wssb').asstring:=formatdatetime('hh'':''MM'':''ss',dtwssb.Time);
    dmmain.cdsbcjg.fieldbyname('wsxb').asstring:=formatdatetime('hh'':''MM'':''ss',dtwsxb.Time);
    dmmain.cdsbcjg.fieldbyname('jbsb').asstring:=formatdatetime('hh'':''MM'':''ss',dtjbsb.Time);
    dmmain.cdsbcjg.fieldbyname('jbxb').asstring:=formatdatetime('hh'':''MM'':''ss',dtjbxb.Time);
    dmmain.cdsbcjg.Post;
    try
      dmmain.cdsbcjg.ApplyUpdates(-1);
      dmmain.cdsbcjg.Close;
      close;
    except
      application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit; 
    end;
  end;
end;

end.
