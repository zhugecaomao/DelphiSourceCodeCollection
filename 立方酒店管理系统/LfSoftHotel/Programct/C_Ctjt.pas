unit C_Ctjt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DosMove;

type
  TCtjtForm = class(TForm)
    lblTitle: TLabel;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    edtSl: TEdit;
    DosMove1: TDosMove;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CtjtForm: TCtjtForm;

procedure Ctjt;

implementation

uses C_CtDefine, C_CtData, DBTables, C_ctmain;

{$R *.dfm}

procedure Ctjt;
begin
  CtjtForm := TCtjtForm.Create(Application);
  try
    with CtjtForm do
    begin
      with CtData.qrySysData do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from CTDM where D_CTLB="餐厅"');
        Open;
        ComboBox1.Items.Clear;
        First;
        while not Eof do
        begin
          ComboBox1.Items.Add(FieldByName('D_CTMC').AsString);
          Next;
        end;
        Close;
        ComboBox1.ItemIndex := 0;
      end;
      //CtData.ListMc(ComboBox1,'CTDM','D_CTMC');
      ShowModal;
    end;
  finally
    CtjtForm.Free;
  end;

end;

procedure TCtjtForm.btnOKClick(Sender: TObject);
var
  ACtbh,ACtmc: string;
  ANewCtbh,ANewCtmc: string;
  ASl : Integer;
  i : Integer;
begin
  ASl := StrToInt(edtSl.Text);
  if ASl<=0 then
  begin
    ShowWarning('台数必须大于零');
    Exit;
  end;

  ACtmc := ComboBox1.Items[ComboBox1.ItemIndex];
  ACtbh := CtData.FindBh('CTDM','D_CTBH','D_CTMC',ACtmc);
  for i:=1 to ASl do
  with CtData.qrySysData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(D_CTBH) from CTDM where D_CTBH like "'+ACtbh+'%"');
    Open;
    if Fields[0].IsNull then ANewCtbh := ACtbh+'01'
    else ANewCtbh := IntToStr(Fields[0].AsInteger+1);
    ANewCtmc := ACtmc+Copy(ANewCtbh,2,2);

    Close;
    SQL.Clear;
    SQL.Add('insert into CTDM (D_CTBH,D_CTMC,D_CTLB,D_DM) values ("'+ANewCtbh+'","'+ANewCtmc+'","台号","'+ANewCtbh+'")');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('insert into CTZT (D_CTBH,D_CTMC,D_CTZT) values ("'+ANewCtbh+'","'+ANewCtmc+'","'+CTZT_OK+'")');
    ExecSQL;

  end;
  CtMainForm.ShowCtzt;
end;

end.
