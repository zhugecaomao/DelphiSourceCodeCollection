unit ufrmDiscount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxfColorButton, Buttons;

type
  TfrmDiscount = class(TForm)
    bbtnConfirm: TBitBtn;
    bbtnBack: TBitBtn;
    btnNum0: TdxfColorButton;
    btnNum1: TdxfColorButton;
    btnNum2: TdxfColorButton;
    btnNum3: TdxfColorButton;
    btnNum4: TdxfColorButton;
    btnNum5: TdxfColorButton;
    btnNum6: TdxfColorButton;
    btnNum7: TdxfColorButton;
    btnNum8: TdxfColorButton;
    btnNum9: TdxfColorButton;
    btnModify: TdxfColorButton;
    btnClear: TdxfColorButton;
    Label1: TLabel;
    eDisCount: TEdit;
    procedure bbtnConfirmClick(Sender: TObject);
    procedure bbtnBackClick(Sender: TObject);
  private       
    Fi_Flag: Integer;
    procedure prip_IniInterFace;
    procedure prip_IniData;     
    procedure OnEditEnter(Sender: TObject);  
    procedure OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  public
    procedure pubp_Ini;
  end;

var
  frmDiscount: TfrmDiscount;

implementation
uses StrUtils, upubCommon;
{$R *.dfm}

{ TfrmDiscount }

procedure TfrmDiscount.OnBbtnNumClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Length(Trim(eDisCount.Text)) >= 2 then
  begin
    eDisCount.Clear;
  end;
  eDisCount.Text := eDisCount.Text + LeftStr((Sender as TdxfColorButton).Caption.Text, 1); 
end;

procedure TfrmDiscount.OnEditEnter(Sender: TObject);
begin
  if Sender is TEdit then
  begin
    Fi_Flag := (Sender as TEdit).Tag;
    (Sender as TEdit).Clear;
    (Sender as TEdit).SelectAll;
  end;
end;

procedure TfrmDiscount.prip_IniData;
begin
  Fi_Flag := 0;
end;

procedure TfrmDiscount.prip_IniInterFace;
begin
  eDisCount.OnEnter := OnEditEnter;
  btnNum0.OnMouseDown := OnBbtnNumClick;
  btnNum1.OnMouseDown := OnBbtnNumClick;
  btnNum2.OnMouseDown := OnBbtnNumClick;
  btnNum3.OnMouseDown := OnBbtnNumClick;
  btnNum4.OnMouseDown := OnBbtnNumClick;
  btnNum5.OnMouseDown := OnBbtnNumClick;
  btnNum6.OnMouseDown := OnBbtnNumClick;
  btnNum7.OnMouseDown := OnBbtnNumClick;
  btnNum8.OnMouseDown := OnBbtnNumClick;
  btnNum9.OnMouseDown := OnBbtnNumClick;
  btnModify.OnMouseDown := OnBbtnNumClick;
  btnClear.OnMouseDown := OnBbtnNumClick;
  WindowState := wsMaximized;
end;

procedure TfrmDiscount.pubp_Ini;
begin   
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmDiscount.bbtnConfirmClick(Sender: TObject);
begin
  LoginInfo.DisCount := StrToIntDef(eDisCount.Text, 100);
  if LoginInfo.DisCount = 0 then Exit;
  ModalResult := MrOk;
end;

procedure TfrmDiscount.bbtnBackClick(Sender: TObject);
begin
  Close;
end;

end.
