unit uFM_3090;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Spin, Buttons;

type
  TFM_3090 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    SB6: TSpeedButton;
    SB2: TSpeedButton;
    SpinEdit1: TSpinEdit;
    ComboBox1: TComboBox;
    ComboEdit1: TComboEdit;
    Edit1: TEdit;
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure SB6Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_3090: TFM_3090;

implementation

uses
  utilities, uRP_3090;

{$R *.DFM}

procedure TFM_3090.ComboEdit1ButtonClick(Sender: TObject);
var
  xS : TStringList;
begin
  xs := select_text('委外厂商点选窗口','Select distinct A.F03 AS 厂商编号, T1.F03 AS 厂商简称 '
                                  +' From T2151 AS A'
                                  +' Left Join T1030 as T1 on A.F03=T1.F01 ','STK0311',[0,1],[]);
  if Assigned(xS) then
  try
    ComboEdit1.Text := xs.strings[0];
    Edit1.Text := xs.Strings[1];
  finally
    xs.free;
  end;

end;

procedure TFM_3090.SB6Click(Sender: TObject);
begin
  self.close;
end;

procedure TFM_3090.SB2Click(Sender: TObject);
begin
    if Application.FindComponent('Rp_3090')=nil then
       Rp_3090 := TRp_3090.Create(Application);
    with Rp_3090 do
    begin
     Query1.close;
     Query1.Params[0].AsString := copy(SpinEdit1.Text,3,2)+Combobox1.Text;
     Query1.Params[1].AsString := ComboEdit1.Text+'%';
     Query1.open;
     PreviewModal;
    end
end;

procedure TFM_3090.FormCreate(Sender: TObject);
begin
  Top := 100; Left := 156; Width := 300; Height := 200;
  SpinEdit1.Text := formatdatetime('yyyy',date);
  ComboBox1.ItemIndex := strtoint(formatdatetime('mm',date))-1;
end;

end.
