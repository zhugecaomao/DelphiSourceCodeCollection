unit limit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, XPMenu, LabeledEditint;

type
  Tfrm_limit = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtup: TLabeledEditint;
    edtdown: TLabeledEditint;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure init;
  public
    { Public declarations }
    stockid,goods_no : string;
  end;

var
  frm_limit: Tfrm_limit;

implementation

uses untdatadm;

{$R *.dfm}
procedure tfrm_limit.init;
begin
  if dmmain.cdsstockwarn.Active then  dmmain.cdsstockwarn.Close;
  dmmain.cdsstockwarn.Params.ParamByName('no').AsString:=trim(stockid);
  dmmain.cdsstockwarn.Params.ParamByName('bh').AsString:=trim(goods_no);
  dmmain.cdsstockwarn.Open;
  if not dmmain.cdsstockwarn.IsEmpty then
  begin
    edtup.Text:=inttostr(dmmain.cdsstockwarn.FieldByName('up_amount').Asinteger);
    edtdown.Text:=inttostr(dmmain.cdsstockwarn.FieldByName('down_amount').Asinteger);
  end;
end;
procedure Tfrm_limit.SpeedButton1Click(Sender: TObject);
begin
  if trim(edtup.Text)='' then
  begin
    application.MessageBox('请输入上限数量！',pchar(application.Title),mb_iconinformation);
    edtup.SetFocus;
    exit;
  end;
  if trim(edtdown.Text)='' then
  begin
    application.MessageBox('请输入上限数量！',pchar(application.Title),mb_iconinformation);
    edtdown.SetFocus;
    exit;
  end;
  dmmain.cdsstockwarn.edit;
  dmmain.cdsstockwarn.FieldByName('up_amount').AsString:=trim(edtup.Text);
  dmmain.cdsstockwarn.FieldByName('down_amount').AsString:=trim(edtdown.Text);
  dmmain.cdsstockwarn.Post;
  try
    dmmain.cdsstockwarn.ApplyUpdates(-1);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  close;
end;

procedure Tfrm_limit.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_limit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrm_limit.FormShow(Sender: TObject);
begin
  init;
end;

procedure Tfrm_limit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
    VK_ESCAPE: Close;
    VK_RETURN:
      begin
        if Shift = [ssShift] then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_F4, VK_DOWN:
      if (screen.ActiveControl is TCustomEdit) then
        if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          TCustomEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0);
  end;        
end;

end.
