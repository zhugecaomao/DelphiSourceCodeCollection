unit uFM_3050;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ToolEdit, Spin, ExtCtrls;

type
  TFM_3050 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    ComboBox1: TComboBox;
    ComboEdit1: TComboEdit;
    Edit1: TEdit;
    SB6: TSpeedButton;
    SB2: TSpeedButton;
    procedure SB6Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_3050: TFM_3050;

implementation

uses uRP_3050, uRP_3050A,utilities;

{$R *.DFM}

procedure TFM_3050.SB6Click(Sender: TObject);
begin
  self.close;
end;

procedure TFM_3050.SB2Click(Sender: TObject);
begin

    if Application.FindComponent('Rp_3050')=nil then
       Rp_3050 := TRp_3050.Create(Application);
    with Rp_3050 do
    begin
     Query1.close;
     Query1.Params[0].AsString := copy(SpinEdit1.Text,3,2)+Combobox1.Text;
     Query1.Params[1].AsString := ComboEdit1.Text+'%';
     Query1.open;
     PreviewModal;
    end ;

  
 
end;

procedure TFM_3050.ComboEdit1ButtonClick(Sender: TObject);
var
  xS : TStringList;
begin
  xs := select_text('厂商点选窗口','Select distinct F01 AS 厂商编号, F03 AS 厂商简称 '
                                  +' From T1020' ,'STK0311',[0,1],[]);
                                 
  if Assigned(xS) then
  try
    ComboEdit1.Text := xs.strings[0];
    Edit1.Text := xs.Strings[1];
  finally
    xs.free;
  end;
end;

procedure TFM_3050.FormCreate(Sender: TObject);
begin
  Top := 100; Left := 156; Width :=280; Height := 235;
  SpinEdit1.Text := formatdatetime('yyyy',date);
  ComboBox1.ItemIndex := strtoint(formatdatetime('mm',date))-1;
end;

end.
