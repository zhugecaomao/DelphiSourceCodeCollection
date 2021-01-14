unit C_LybEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, DBCtrls;

type
  TLybEditForm = class(TForm)
    tblLyb: TTable;
    dsLyb: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText3: TDBText;
    tblLybD_LYBID: TIntegerField;
    tblLybD_XM: TStringField;
    tblLybD_RQ: TDateTimeField;
    tblLybD_SJ: TDateTimeField;
    tblLybD_NR: TBlobField;
    tblLybD_YDR: TBlobField;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBMemo2: TDBMemo;
    btnOk: TButton;
    btnCancel: TButton;
    procedure tblLybNewRecord(DataSet: TDataSet);
    procedure OnCancel(Sender: TObject);
    procedure OnOk(Sender: TObject);
  private
    { Private declarations }
    FYd : Boolean;
  public
    { Public declarations }
  end;

var
  LybEditForm: TLybEditForm;

procedure NewLyb;
procedure EditLyb(const aId: Integer);

implementation

uses C_Define, C_HotelData;

{$R *.dfm}
procedure NewLyb;
begin
  LybEditForm := TLybEditForm.Create(Application);
  try
    with LybEditForm do
    begin
      FYd := False;
      Caption := '–¬‘ˆ¡Ù—‘';
      tblLyb.Open;
      tblLyb.Insert;
      ShowModal;
    end;
  finally
    LybEditForm.Free;
  end;

end;

procedure EditLyb(const aId: Integer);
begin
  LybEditForm := TLybEditForm.Create(Application);
  try
    with LybEditForm do
    begin
      FYd := True;
      Caption := '‘ƒ∂¡¡Ù—‘';
      tblLyb.Open;
      tblLyb.Locate('D_LYBID',aId,[]);
      tblLyb.Edit;
      if CZY.CzyXm <> tblLybD_XM.Value then
      begin
        DBMemo1.ReadOnly := True;
        DBMemo2.ReadOnly := True;
      end;
      ShowModal;
    end;
  finally
    LybEditForm.Free;
  end;

end;


procedure TLybEditForm.tblLybNewRecord(DataSet: TDataSet);
begin
  tblLybD_LYBID.Value := HotelData.GetMaxId('select max(D_LYBID) from LYB');
  tblLybD_RQ.Value := Date;
  tblLybD_SJ.Value := Time;
  tblLybD_XM.Value := CZY.CzyXm;
end;

procedure TLybEditForm.OnCancel(Sender: TObject);
begin
  tblLyb.Cancel;
end;

procedure TLybEditForm.OnOk(Sender: TObject);
begin
  if FYd then
    tblLybD_YDR.Value := tblLybD_YDR.Value + CZY.CzyXm +',';
  tblLyb.Post;
  Close;
end;

end.
