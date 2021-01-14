unit ubase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,db,DBGrids,Grids,ExtCtrls;

type
  Tfrmbase = class(TForm)
    spbexit: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbexitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbase: Tfrmbase;

implementation


{$R *.dfm}

procedure Tfrmbase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (ActiveControl is TDBGrid)  then
 case Key of
    VK_ESCAPE: Close;
    VK_RETURN:
      begin
        if Shift = [ssShift] then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_F4, VK_DOWN:
      if screen.ActiveControl is TCustomEdit then
        if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          TCustomEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0);
  end;

end;

procedure Tfrmbase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmbase.spbexitClick(Sender: TObject);
var
  i,j:integer;
begin
  for i:=0 to self.ComponentCount-1 do
  begin
  if (self.Components[i] Is TLabeledEdit) then
    (self.Components[i] as TLabeledEdit).Clear;
  if (self.Components[i] Is TStringGrid) then
  begin
    for j:=1 to (self.Components[i] as TStringGrid).RowCount-1 do   //清空网格，不能只减去行，避免下次新建时数据重复出现
      (self.Components[i] as TStringGrid).Rows[j].Clear;
    (self.Components[i] as TStringGrid).RowCount:=2;
  end;
  end;
end;

procedure Tfrmbase.FormShow(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to self.ComponentCount-1 do
  begin
    if (self.Components[i] is TLabel) then
    begin
      (self.Components[i] as TLabel).Transparent :=true;
    end;
  end;

end;

end.
