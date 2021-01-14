unit C_Ctxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, C_CtDefine, DosMove;

type
  TCtxtForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnOk: TBitBtn;
    btnCanc: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    edtCtbh: TEdit;
    Label2: TLabel;
    lblCtmc: TLabel;
    DosMove1: TDosMove;
    procedure edtCtbhExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
  private
    { Private declarations }
    FCtzt: TCtzt;
    FCzlx: Integer;
    FCtbh: string;
  public
    { Public declarations }
  end;

var
  CtxtForm: TCtxtForm;

function Ctxt: TCtzt;
function Ctzt: string;
function Ctbt: string;

implementation

uses C_CtData, C_Ctkt, C_ctdc, C_ctmain;

{$R *.dfm}

function Ctbt: string;
begin
  CtxtForm := TCtxtForm.Create(Application);
  try
    with CtxtForm do
    begin
      FCzlx := 2;
      Caption := '并台';
      lblTitle.Caption := '餐厅并台';
      lblCtmc.Caption := '';
      edtCtbh.Text := '';
      FCtbh := '';
      ShowModal;
      Result := FCtbh;
    end;
  finally
    CtxtForm.Free;
  end;
end;

function Ctzt: string;
begin
  CtxtForm := TCtxtForm.Create(Application);
  try
    with CtxtForm do
    begin
      FCzlx := 1;
      Caption := '转台';
      lblTitle.Caption := '餐厅转台';
      lblCtmc.Caption := '';
      edtCtbh.Text := '';
      FCtbh := '';
      ShowModal;
      Result := FCtbh;
    end;
  finally
    CtxtForm.Free;
  end;
end;

function Ctxt: TCtzt;
begin
  CtxtForm := TCtxtForm.Create(Application);
  try
    with CtxtForm do
    begin
      FCzlx := 0;
      Caption := '选台';
      lblTitle.Caption := '餐厅选台';
      lblCtmc.Caption := '';
      edtCtbh.Text := '';
      FCtzt.ACtbh := '';
      ShowModal;
      Result := FCtzt;
    end;
  finally
    CtxtForm.Free;
  end;
end;

procedure TCtxtForm.edtCtbhExit(Sender: TObject);
var
  ACtbh: string;
  ACtmc: string;
begin
  if edtCtbh.Text<>'' then
  begin
    ACtbh := UpperCase(edtCtbh.Text);
    ACtmc := CtData.IsValidCtbh(ACtbh);
    if ACtmc='' then
    begin
      ShowWarning('请输入正确的餐厅编号！');
      edtCtbh.SetFocus;
    end
    else
    begin
      FCtbh := UpperCase(edtCtbh.Text);
      lblCtmc.Caption := ACtmc;
    end;
  end;
end;

procedure TCtxtForm.btnOkClick(Sender: TObject);
begin
  if edtCtbh.Text='' then
  begin
    ShowWarning('请输入餐台编号！');
    Exit;
  end;
  case FCzlx of
    0:
      begin
        FCtzt := CtData.GetCtzt(FCtbh);
      end;
    1:
      begin
        FCtzt := CtData.GetCtzt(FCtbh);
        if FCtzt.ACtzt<>CTZT_OK then
        begin
          ShowWarning('该餐台正在使用中，请重选！');
          FCtbh := '';
          Exit;
        end;
      end;
    2:
      begin
        FCtzt := CtData.GetCtzt(FCtbh);
        if FCtzt.ACtzt<>CTZT_USE then
        begin
          ShowWarning('该餐台没有客人，请重选！');
          FCtbh := '';
          Exit;
        end;
      end;
  end;
  Close;
end;

procedure TCtxtForm.FormShow(Sender: TObject);
begin
  edtCtbh.SetFocus;
end;

procedure TCtxtForm.btnCancClick(Sender: TObject);
begin
  FCtbh := '';
end;

end.
