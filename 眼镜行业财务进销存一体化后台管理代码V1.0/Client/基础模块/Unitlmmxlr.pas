unit Unitlmmxlr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,db,DBClient;

type
  Tfrmlmmxlr = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtlmzt: TLabeledEdit;
    cbno: TComboBox;
    Label1: TLabel;
    edtdir: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    mmemo: TMemo;
    Open1: TOpenDialog;
    Label3: TLabel;
    Label4: TLabel;
    lsize: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbnoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    //procedure xslmno;
  public
    { Public declarations }
    fg:integer;
  end;

var
  frmlmmxlr: Tfrmlmmxlr;
  fjtype,fjnames,fjbz:string;
  fjfile:tFileStream;
implementation

uses  func, UMsgmanager;

{$R *.dfm}
procedure Tfrmlmmxlr.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmlmmxlr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmlmmxlr.BitBtn1Click(Sender: TObject);
var
  values1,values2,values3,values4:string;
  TEMP:WIDESTRING;
begin
  if (trim(cbno.Text)='') and (trim(edtlmzt.Text)='') and (trim(mmemo.Text)='') then
  begin
    if trim(cbno.Text)='' then
    begin
      application.MessageBox('请选择栏目编号！',pchar(application.Title),mb_iconinformation);
      cbno.SetFocus;
      exit;
    end;
    if trim(edtlmzt.Text)='' then
    begin
      application.MessageBox('请输入栏目主题！',pchar(application.Title),mb_iconinformation);
      edtlmzt.SetFocus;
      exit;
    end;
    if trim(mmemo.Text)='' then
    begin
      application.MessageBox('请输入栏目内容！',pchar(application.Title),mb_iconinformation);
      mmemo.SetFocus;
      exit;
    end;
  end else
  begin
    if fg=1 then
    begin
      //dm.Cdsview.Insert;
      temp:='insert into lmmx (lmno,lmzt,memo) values ('+''''+trim(cbno.text)+''''+','+''''+trim(edtlmzt.text)+''''+','+''''+trim(mMEmo.Text)+''''+')';
    end else
    begin
      temp:='update lmmx set lmno='+''''+trim(cbno.text)+''''+',lmzt='+''''+trim(edtlmzt.text)+''''+',memo='+''''+trim(mMEmo.Text)+''''+' where id='+trim(fmMsgmanager.Cdsview.fieldbyname('id').AsString);
    end;
    {if fjbz='1' then
    begin
      values3:=addstr(trim(fjnames));
      dm.Cdsview.FieldByName('fjname').AsString:=trim(values3);
      values4:=addstr(trim(fjtype));
      dm.Cdsview.FieldByName('fjtype').AsString:=trim(values4);
      tblobfield(dm.Cdsview.FieldByName('fj')).LoadFromStream(fjfile); //加入附件；
      fjfile.Free;
      fjfile:=nil;
    end;}
    try
       adisp.updatesql(temp);
   except

    end;
    close;
  end;
end;

procedure Tfrmlmmxlr.cbnoKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then
  begin
    key:=chr(0);
  end;
end;

procedure Tfrmlmmxlr.SpeedButton1Click(Sender: TObject);
begin
  if open1.Execute then
  begin
    edtdir.Text:=trim(open1.FileName);
    SpeedButton2.Enabled:=true;
  end;
end;

procedure Tfrmlmmxlr.SpeedButton2Click(Sender: TObject);
begin
  if trim(edtdir.Text)='' then
  begin
    application.MessageBox('请指定附件路径和附件名！',pchar(application.Title),mb_iconinformation);
    fjbz:='0';
    exit;
  end else
  begin
    fjbz:='1';
    fjnames:=ExtractFileName(trim(edtdir.Text));
    fjtype:=ExtractFileExt(trim(edtdir.Text));
    fjfile.Free;
    fjfile:=nil;
    fjfile:=tFileStream.Create(trim(edtdir.Text),fmOpenRead);
  end;
end;

procedure Tfrmlmmxlr.FormShow(Sender: TObject);
begin
  fjbz:='0';
end;

end.
