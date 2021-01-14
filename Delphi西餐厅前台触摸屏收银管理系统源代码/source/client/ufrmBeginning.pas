unit ufrmBeginning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxfColorButton, DB, ADODB, CSADOQuery;

type
  TfrmBeginning = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    labCompany: TLabel;
    labShopName: TLabel;
    labNum: TLabel;
    labEmpCd: TLabel;
    labEmpName: TLabel;
    labOnDate: TLabel;
    labWork: TLabel;
    labOnTime: TLabel;
    eMoney: TEdit;
    bbtnConfirm: TBitBtn;
    bbtnCancel: TBitBtn;
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
    btnDot: TdxfColorButton;
    OnLineq: TCSADOQuery;
    OnLineqI_MACHINES_CD: TStringField;
    OnLineqI_LOGIN_CD: TStringField;
    OnLineqI_DATE: TStringField;
    OnLineqI_TIME: TStringField;
    OnLineqI_WORK_CD: TStringField;
    OnLineqI_AMOUNT: TBCDField;
    OnLineqI_FLAG: TIntegerField;
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnConfirmClick(Sender: TObject);
  private
    procedure OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer); 
    procedure prip_IniInterFace;
    procedure prip_IniData;
  public
    procedure pubp_Ini;
  end;

var
  frmBeginning: TfrmBeginning;

implementation
uses StrUtils, ufrmFrontPay, upubCommon, udmData;
{$R *.dfm}

//{$DEFINE DEBUG}
{ TfrmBeginning }

procedure TfrmBeginning.OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
var
  li_Tag: Integer;
begin
  li_Tag := (Sender as TdxfColorButton).Tag;
  Case li_Tag of
    10:  //Ð¡Êýµã
    begin
      if Pos(eMoney.Text, '.') = 0 then
      begin
        eMoney.Text := eMoney.Text + '.';
      end;
    end;
    11:
    begin
      eMoney.Text := LeftStr(eMoney.Text, Length(eMoney.Text) - 1);
    end;
    12:
    begin
      eMoney.Clear;
    end;
    else
    begin
      eMoney.Text := eMoney.Text + LeftStr((Sender as TdxfColorButton).Caption.Text, 1);
    end;
  end;
end;

procedure TfrmBeginning.prip_IniData;
begin
  labEmpCD.Caption := LoginInfo.UserId;
  labEmpName.Caption := LoginInfo.UserName;
  labOnDate.Caption := FormatDateTime('YYYY-MM-DD', Date);
  labOnTime.Caption := FormatDateTime('HH:MM:SS', Time);
  labNum.Caption := MachinesInfo.MachinesCD;
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_SHOP_MS WHERE I_SHOP_CD = ''%s''',
      [ShopInfo.ShopCD]);
    {$IF DEFINED(DEBUG)}
      ShowMessage(SQL.Text);
    {$IFEND}
    Open;
    if not IsEmpty then
    begin
      ShopInfo.CompanyName := FieldByName('I_COMPANY_NAME').AsString;
      ShopInfo.ShopName := FieldByName('I_SHOP_NAME').AsString;
      labCompany.Caption := ShopInfo.CompanyName;
      labShopName.Caption := ShopInfo.ShopName;
    end;
    Close;
    SQL.Clear;
    SQL.Text := Format('SELECT I_WORK_CD FROM T_WORK_MS WHERE I_START_TIME <= ' +
      '''%s'' AND I_END_TIME >= ''%s''',[Trim(labOnTime.Caption),
      Trim(labOnTime.Caption)]);
    Open;
    {$IF DEFINED(DEBUG)}
      SQL.SaveToFile('1.txt');
      ShowMessage(SQL.Text);
    {$IFEND}
    if not IsEmpty then
    begin
      LoginInfo.WorkCD := FieldByName('I_WORK_CD').AsString;
    end;
    labWork.Caption := LoginInfo.WorkCD;
    Close;
  end;
end;

procedure TfrmBeginning.prip_IniInterFace;
begin
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
  btnDot.OnMouseDown := OnBbtnNumClick;
  btnModify.OnMouseDown := OnBbtnNumClick;
  btnClear.OnMouseDown := OnBbtnNumClick;
  WindowState := wsMaximized;
end;

procedure TfrmBeginning.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmBeginning.bbtnCancelClick(Sender: TObject);
var
  ls_SQL: String;
begin
  Close;
  pubCommon.OnOffLine := False;
  ls_SQL := Format('UPDATE T_MACHINES_MS SET I_MACHINES_FREE = 1, ' +
    ' I_LAST_ON_TIME = ''%s'' WHERE I_MACHINES_CD = ''%s''', 
    [FormatDateTime('YYYY-MM-DD HH:MM:SS', Now), MachinesInfo.MachinesCD]);
  dmData.pubp_ExecSQL(ls_SQL);
end;

procedure TfrmBeginning.bbtnConfirmClick(Sender: TObject);
begin
  LoginInfo.LYMoney := StrToCurrDef(eMoney.Text, 0.00);
  with OnLineq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_LOGIN_WORK_MS WHERE 1 = 2';
    Open;
    Append;
    FieldByName('I_MACHINES_CD').AsString := MachinesInfo.MachinesCD;
    FieldByName('I_LOGIN_CD').AsString := LoginInfo.UserId;
    FieldByName('I_DATE').AsString := labOnDate.Caption;
    FieldByName('I_TIME').AsString := labOnTime.Caption;
    FieldByName('I_WORK_CD').AsString := LoginInfo.WorkCD;
    FieldByName('I_AMOUNT').AsCurrency := LoginInfo.LYMoney;  
    FieldByName('I_FLAG').AsCurrency := AI_ONLINE;
    Post;
    Close;
  end;
  ModalResult := MrOk;
end;

end.
