unit C_Krxx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TKrxxForm = class(TForm)
    tblKrxx: TTable;
    dsKrxx: TDataSource;
    btnClose: TBitBtn;
    tblKrxxD_KRBH: TStringField;
    tblKrxxD_KRXM: TStringField;
    tblKrxxD_KRLX: TStringField;
    tblKrxxD_DDRQ: TDateTimeField;
    tblKrxxD_DDSJ: TDateTimeField;
    tblKrxxD_LDRQ: TDateTimeField;
    tblKrxxD_LDSJ: TDateTimeField;
    tblKrxxD_YWX: TStringField;
    tblKrxxD_YWM: TStringField;
    tblKrxxD_XB: TStringField;
    tblKrxxD_MZBH: TStringField;
    tblKrxxD_DQBH: TStringField;
    tblKrxxD_GBBH: TStringField;
    tblKrxxD_NZTS: TIntegerField;
    tblKrxxD_TLSY: TStringField;
    tblKrxxD_ZJBH: TStringField;
    tblKrxxD_ZJHM: TStringField;
    tblKrxxD_CSNY: TDateTimeField;
    tblKrxxD_HCL: TStringField;
    tblKrxxD_HCQ: TStringField;
    tblKrxxD_QZBH: TStringField;
    tblKrxxD_QZYXQ: TDateTimeField;
    tblKrxxD_ZY: TStringField;
    tblKrxxD_LXDH: TStringField;
    tblKrxxD_DWMC: TStringField;
    tblKrxxD_JTDZ: TStringField;
    tblKrxxD_JDR: TStringField;
    tblKrxxD_JDDW: TStringField;
    tblKrxxD_BZ: TStringField;
    tblKrxxD_QDR1: TStringField;
    tblKrxxD_QDR2: TStringField;
    tblKrxxD_QDR3: TStringField;
    tblKrxxD_QDR4: TStringField;
    tblKrxxD_MZMC: TStringField;
    tblKrxxD_DQMC: TStringField;
    tblKrxxD_ZJMC: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KrxxForm: TKrxxForm;

procedure KrxxEnter(const aKrbh: string);
procedure LdKrxxEnter(const aKrbh: string);

implementation

uses C_HotelData;

{$R *.dfm}
procedure KrxxEnter(const aKrbh: string);
begin
  KrxxForm := TKrxxForm.Create(Application);
  try
    with KrxxForm do
    begin
      tblKrxx.Close;
      tblKrxx.TableName := 'KRXX';
      tblKrxx.Open;
      tblKrxx.Locate('D_KRBH',aKrbh,[]);
      ShowModal;
    end;
  finally
    KrxxForm.tblKrxx.Close;
    KrxxForm.Free;
  end;
end;

procedure LdKrxxEnter(const aKrbh: string);
begin
  KrxxForm := TKrxxForm.Create(Application);
  try
    with KrxxForm do
    begin
      tblKrxx.Close;
      tblKrxx.TableName := 'KRXXDA';
      tblKrxx.Open;
      tblKrxx.Locate('D_KRBH',aKrbh,[]);
      ShowModal;
    end;
  finally
    KrxxForm.tblKrxx.Close;
    KrxxForm.Free;
  end;
end;

end.
