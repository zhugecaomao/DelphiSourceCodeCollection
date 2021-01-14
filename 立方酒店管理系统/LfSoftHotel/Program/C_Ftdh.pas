unit C_Ftdh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, C_Define, DB, DBTables;

type
  TFtdhForm = class(TForm)
    ComboBoxEx1: TComboBoxEx;
    ComboBoxEx2: TComboBoxEx;
    ComboBox1: TComboBox;
    btnAll: TBitBtn;
    procedure ComboBoxEx1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxEx2Change(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FtdhForm: TFtdhForm;

implementation

uses C_HotelData, C_Main;

{$R *.dfm}

procedure TFtdhForm.ComboBoxEx1Change(Sender: TObject);
begin
  MainForm.tblKfzt.DisableControls;
  case ComboBoxEx1.ItemIndex of
    0: MainForm.tblKfzt.Filter := '';
    1: MainForm.tblKfzt.Filter := 'D_KFZT='''+KFZT_OK+'''';
    2: MainForm.tblKfzt.Filter := 'D_KFZT='''+KFZT_BF+'''';
    3: MainForm.tblKfzt.Filter := 'D_KFZT='''+KFZT_TD+'''';
    4: MainForm.tblKfzt.Filter := 'D_KFZT='''+KFZT_WX+'''';
    5: MainForm.tblKfzt.Filter := 'D_KFZT='''+KFZT_MF+'''';
    6: MainForm.tblKfzt.Filter := 'D_KFZT='''+KFZT_ZK+'''';
  end;
  MainForm.tblKfzt.Filtered := True;
  MainForm.tblKfzt.EnableControls;
  MainForm.Ftdh;
end;

procedure TFtdhForm.FormCreate(Sender: TObject);
begin
  Left := 350;
  Top  := 520;
  ComboBoxEx2.ItemsEx.AddItem('È«²¿',-1,-1,-1,-1,nil);
  with HotelData.tblLCDM do
  begin
    Open;
    First;
    while not Eof do
    begin
      ComboBoxEx2.ItemsEx.AddItem(FieldByName('D_LCMC').AsString,0,0,-1,-1,nil);
      Next;
    end;
    Close;
  end;
  ComboBOxEx2.ItemIndex := 0;
  ComboBoxEx1.ItemIndex := 0;
end;

procedure TFtdhForm.ComboBoxEx2Change(Sender: TObject);
var
  ALcbh: string;
begin
  MainForm.tblKfzt.DisableControls;
  if ComboBoxEx2.ItemIndex=0 then
    MainForm.tblKfzt.Filter := ''
  else
  begin
    ALcbh := HotelData.FindBh('LCDM','D_LCBH','D_LCMC',ComboBoxEx2.Items[ComboBoxEx2.ItemIndex]);
    MainForm.tblKfzt.Filter := 'D_LCBH='''+ALcbh+'''';
  end;
  MainForm.tblKfzt.Filtered := True;
  MainForm.tblKfzt.EnableControls;
  MainForm.Ftdh;
end;

procedure TFtdhForm.btnAllClick(Sender: TObject);
begin
  MainForm.tblKfzt.Filter := '';
  MainForm.tblKfzt.Filtered := False;
  MainForm.Ftdh;
end;

procedure TFtdhForm.FormActivate(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  with HotelData.tblKrxx do
  begin
    Open;
    Filter := 'D_KRLX='''+KRLX_TD+'''';
    Filtered := True;
    First;
    while not Eof do
    begin
      ComboBox1.Items.Add(FieldByName('D_KRXM').AsString);
      Next;
    end;
    Filter := '';
    Filtered := False;
    Close;
  end;
end;

procedure TFtdhForm.ComboBox1Change(Sender: TObject);
var
  AKrbh: string;
begin
  if ComboBox1.ItemIndex>=0 then
  begin
    AKrbh := HotelData.FindUserBh('KRXX','D_KRBH','D_KRXM',ComboBox1.Items[ComboBox1.ItemIndex]);
    MainForm.tblKfzt.Filter := 'D_KRBH='''+AKrbh+'''';
    MainForm.tblKfzt.Filtered := True;
    MainForm.Ftdh;
  end;
end;

end.
