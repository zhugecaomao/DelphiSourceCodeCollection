unit Mailfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RzPanel, RzForms, RzSndMsg, RzBckgnd, RzButton, StdCtrls,
  RzLabel, Mask, RzEdit, Buttons, RzSpnEdt;

type
  Tfrmmail = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzFormShape1: TRzFormShape;
    Mail: TRzSendMessage;
    RzSeparator1: TRzSeparator;
    RzShapeButton1: TRzShapeButton;
    RzShapeButton2: TRzShapeButton;
    edR: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel1: TRzLabel;
    edC: TRzEdit;
    RzLabel2: TRzLabel;
    edSubject: TRzEdit;
    RzLabel4: TRzLabel;
    edText: TRzMemo;
    RzRapidFireButton1: TRzRapidFireButton;
    RzBitBtn1: TRzBitBtn;
    edAttach: TRzEdit;
    Open1: TOpenDialog;
    RzLabel5: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzShapeButton1Click(Sender: TObject);
    procedure RzShapeButton2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RzRapidFireButton1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params:TCreateParams);override;  
  public
    { Public declarations }
  end;

var
  frmmail: Tfrmmail;

implementation

uses mainfrm;

{$R *.DFM}

procedure Tfrmmail.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent :=GetDeskTopWindow;
  Params.Style :=WS_Popup or WS_MinimizeBox or WS_SysMenu;
end;

procedure Tfrmmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  frmmail:=nil;
end;

procedure Tfrmmail.RzShapeButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmmail.RzShapeButton2Click(Sender: TObject);
begin
  CloseWindow(handle);
end;

procedure Tfrmmail.RzBitBtn1Click(Sender: TObject);
var
  i:integer;
  ToRec:string;
  ToCcr:string;
  Attach:string;
begin
  if trim(edR.Text)='' then
  begin
     frmmain.Information('请输入收件人！');
  end
  else
  begin
    ToRec:=edR.Text;
    for i:=1 to length(ToRec) do
    begin
      if ToRec[i]=';' then
        ToRec[i]:=#13
    end;
    Mail.ToRecipients.Text :=ToRec;

    ToCcr:=edC.Text;
    for i:=1 to length(ToCcr) do
    begin
      if ToCcr[i]=';' then
        ToCcr[i]:=#13
    end;
    Mail.CcRecipients.Text :=ToCcr;

    Attach:=edAttach.Text;
    for i:=1 to length(Attach) do
    begin
      if Attach[i]=';' then
        Attach[i]:=#13
    end;
    Mail.Attachments.Text :=Attach;
    Mail.Send;
    frmmain.Information('邮件发送完毕！');
  end;
end;

procedure Tfrmmail.FormCreate(Sender: TObject);
begin
  Mail.Logon ;
end;

procedure Tfrmmail.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Mail.Logoff;
end;

procedure Tfrmmail.RzRapidFireButton1Click(Sender: TObject);
var
  i:integer;
begin
  if open1.Execute then
  begin
    for i:=0 to open1.Files.Count-1 do
    begin
      if trim(edAttach.Text)='' then
        edAttach.Text :=edAttach.Text +open1.Files.Strings[i]
      else
        edAttach.Text :=edAttach.Text+';'+open1.Files.Strings[i]
    end;
  end;
end;

end.
