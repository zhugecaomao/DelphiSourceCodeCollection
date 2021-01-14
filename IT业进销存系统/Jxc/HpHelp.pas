unit HpHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComHelp, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls, Dbclient, db;

type
  TfrmHpHelp = class(TfrmComHelp)
    BitBtn1: TBitBtn;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    procedure LoadEditForm(Para1: string);override;
    procedure btnDelClick(Sender: TObject);override;
    function GetFilter: string;override;
    procedure FormShow(Sender: TObject);override;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);override;
  private
    procedure SetCommandText;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHpHelp: TfrmHpHelp;

implementation

uses HpEdit, Dm, MyLib;

{$R *.DFM}

{ TfrmKhHelp }

procedure TfrmHpHelp.FormShow(Sender: TObject);
begin
  if not ( TCLientDataSet(DBGrid1.DataSource.DataSet).Active ) then
  begin
    SetCommandText;
    TCLientDataSet(DBGrid1.DataSource.DataSet).Open;
  end;
  ValuesToStrings(ComboBox1.Items, 'select MC from HPLB');
  inherited;
end;

procedure TfrmHpHelp.LoadEditForm(Para1: string);
begin
  frmEdit := TfrmHpEdit.Create(Application);
  inherited;
end;

procedure TfrmHpHelp.btnDelClick(Sender: TObject);
begin
  //同时更新 HpHelp.Del
  StrDetailTables := 'CGDD; CGSH';
  StrDetailWheres := 'HPID = [ID]';
  inherited;
end;

function TfrmHpHelp.GetFilter: string;
var
  s: string;
begin
  s := '';
  case RadioGroup1.ItemIndex of
    0: s := '';
    1: s := 'HPSXID = 1';
    2: s := 'HPSXID <> 1';
  end;
  if CheckBox1.Checked then
    s := s + ' and ' + ' aZKCL <> 0';
  if UpperCase(Trim(Copy(s, 1, 4))) = 'AND' then
    s := Trim(Copy(s, 5, Length(s) - 4));
  result := s;
end;

procedure TfrmHpHelp.Edit1Change(Sender: TObject);
begin
  if dsHelp = nil then
  begin
    dsHelp := TCLientDataSet(DBGrid1.DataSource.DataSet);
    if not dsHelp.Active then
    begin
      SetCommandText;
      dsHelp.Active := True;
    end;
  end;
  if not dsHelp.Locate('BH', Edit1.Text, [loPartialKey]) then
    dsHelp.First;
end;

procedure TfrmHpHelp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssAlt]) and (Key = VK_RETURN) then
    BitBtn1.Click;
end;

procedure TfrmHpHelp.BitBtn1Click(Sender: TObject);
begin
  dsEditing.Append;
  dsEditing['aBH'] := dsHelp['BH'];
  dsEditing['SL'] := 1;
end;

procedure TfrmHpHelp.SetCommandText;
begin
  TCLientDataSet(DBGrid1.DataSource.DataSet).CommandText :=
    'select H.*, ' +
    '(select ID from HP where HP.ID=H.ID) as Tmp, ' +
    '(select sum(JCS) from HPKC where HPID=H.ID) as aZKCL, ' +
    'iif(ZT,''是'',''否'') as aZT, ' +
    'switch(HPSXID=1,''库存商品'', HPSXID=2,''服务/劳务'', ' +
    'HPSXID=3,''其它收入'', HPSXID=4,''其它支出'', ' +
    'HPSXID=5,''折扣'') as aHPSX, ' +
    'L.MC as aHPLBMC ' +
    'from HP H inner join HPLB L on H.HPLBID=L.ID where not H.ZT ' +
    'order by BH';
end;

end.
