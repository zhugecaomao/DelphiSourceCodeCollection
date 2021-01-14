unit Adminfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RzBckgnd, ExtCtrls, RzForms, RzPanel, RzButton, StdCtrls, RzEdit, RzLabel,
  ActnList;

type
  TfrmAdmin = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzShapeButton1: TRzShapeButton;
    RzSeparator1: TRzSeparator;
    RzShapeButton2: TRzShapeButton;
    LText: TRzMemo;
    BText: TRzMemo;
    RzBitBtn1: TRzBitBtn;
    RzLabel1: TRzLabel;
    ActionList1: TActionList;
    Action1: TAction;
    RzLabel2: TRzLabel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzShapeButton1Click(Sender: TObject);
    procedure RzShapeButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SendMsg(Command:string);
  protected
    procedure CreateParams(var Params:TCreateParams);override;
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses mainfrm;

{$R *.DFM}

procedure TfrmAdmin.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := WS_POPUP or WS_SYSMENU or WS_MINIMIZEBOX;
  Params.WndParent :=GetDesktopWindow;
end;

procedure TfrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TfrmAdmin.RzShapeButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAdmin.RzShapeButton2Click(Sender: TObject);
begin
  CloseWindow(handle);
end;

procedure TfrmAdmin.FormDestroy(Sender: TObject);
begin
  frmAdmin:=nil;
end;

procedure TfrmAdmin.SendMsg(Command: string);
begin
  if trim(BText.Lines.Text)<>'' then
  begin
    frmmain.Send(Command,'',frmmain.MyName+'('+datetimetoStr(Now)+'): '+#13#10+'  '+BText.Text+#13,
                 '','','','','');
    frmmain.DisplayText(LText.lines,BText.lines.Text,frmmain.myName);
    SendMessage(LText.Handle,EM_SCROLL,SB_BOTTOM,0);
    BText.Clear ;
  end
  else
    frmmain.Information('对不起，你不能发送空消息！');
  BText.SetFocus ;
end;

procedure TfrmAdmin.RzBitBtn1Click(Sender: TObject);
begin
  SendMsg('admin');
end;

end.
