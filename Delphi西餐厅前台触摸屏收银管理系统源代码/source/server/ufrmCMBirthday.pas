unit ufrmCMBirthday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  DB, ADODB, CSADOQuery, dxCntner, dxEditor, dxEdLib;

type
  TfrmCMBirthday = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbtnExit: TBitBtn;
    Panel3: TPanel;
    grdList: TdxDBGrid;
    Birthdayq: TCSADOQuery;
    Birthdayd: TDataSource;
    Birthdayqcm_id: TStringField;
    Birthdayqcard_id: TStringField;
    Birthdayqcm_name: TStringField;
    Birthdayqcm_address: TStringField;
    Birthdayqcm_sex: TStringField;
    Birthdayqcm_tel: TStringField;
    grdListcard_id: TdxDBGridMaskColumn;
    grdListcm_name: TdxDBGridMaskColumn;
    grdListcm_sex: TdxDBGridMaskColumn;
    grdListcm_address: TdxDBGridMaskColumn;
    grdListcm_tel: TdxDBGridMaskColumn;
    Label1: TLabel;
    eDate: TdxDateEdit;
    bbtnView: TBitBtn;
    procedure bbtnExitClick(Sender: TObject);
    procedure bbtnViewClick(Sender: TObject);
  private
    procedure prip_IniData;
    procedure prip_IniInterFace;
  public
    procedure pubp_Ini;
  end;

var
  frmCMBirthday: TfrmCMBirthday;

implementation
uses udmData, ufrmBase;
{$R *.dfm}

procedure TfrmCMBirthday.bbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCMBirthday.prip_IniData;
var
  ls_Date: String;
begin
  if not CheckDate(eDate.Text) then
  begin
    Exit;
  end;
  ls_Date := DateToStr(eDate.Date);
  with Birthdayq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT a.card_id, b.cm_id, b.cm_name, b.cm_sex, b.cm_address, b.cm_tel FROM ' +
      'cardinfo a, customerinfo b WHERE a.cm_id = b.cm_id AND SUBSTRING(b.cm_birthday, 6, '+
      'LEN(b.cm_birthday) - 5) = ''%s''', [Copy(ls_Date, 6, Length(ls_Date) - 5)]);
    //SQL.SaveToFile('birthday.sql');
    Open;
  end;
end;

procedure TfrmCMBirthday.prip_IniInterFace;
begin
  Position := poScreenCenter;
end;

procedure TfrmCMBirthday.pubp_Ini;
begin
  eDate.Date := Date;
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmCMBirthday.bbtnViewClick(Sender: TObject);
begin
  prip_IniData;
end;

end.
