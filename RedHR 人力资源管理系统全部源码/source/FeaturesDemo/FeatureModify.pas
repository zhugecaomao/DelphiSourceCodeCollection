unit FeatureModify;

interface

uses
  SysUtils, Classes,  Windows, Messages, Graphics, Controls, Forms, StdCtrls, ExtCtrls,
  cxSSCtrls, cxSSTypes, cxSSRes;

type
  TFeatureModifyForm = class(TForm)
    gpPanel: TPanel;
    rbShiftCol: TRadioButton;
    rbShiftRw: TRadioButton;
    rbRw: TRadioButton;
    rbCol: TRadioButton;
    btnOk: TButton;
    btnCancel: TButton;
    cxLB: TcxLabelBevel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FModifySheet: TcxSSCellsModify;
  public
    function Execute(AModifySheet: TcxSSModifyType): Boolean;
    property Modify: TcxSSCellsModify read FModifySheet write FModifySheet;
  end;


implementation

  {$R *.dfm}

function TFeatureModifyForm.Execute(AModifySheet: TcxSSModifyType): Boolean;
begin
  if AModifySheet = mtInsert then
    SetCaptions([Self, cxLB, rbShiftCol, rbShiftRw, rbRw, rbCol, btnOk, btnCancel],
      [scxSpreadSheetInsertCells, scxSpreadSheetInsertCells,
      scxSpreadSheetShiftCellRight, scxSpreadSheetShiftCellTop,
      scxSpreadSheetAllRow,  scxSpreadSheetAllColumn, scxFormOk, scxFormCancel])
  else
    SetCaptions([Self, cxLB, rbShiftCol, rbShiftRw, rbRw, rbCol, btnOk, btnCancel],
       [scxSpreadSheetDeleteCells, scxSpreadSheetDeleteCells,
       scxSpreadSheetShiftCellLeft, scxSpreadSheetShiftCellTop,
       scxSpreadSheetAllRow,  scxSpreadSheetAllColumn, scxFormOk, scxFormCancel]);
  Result := inherited ShowModal = mrOk;
  if Result then
  begin
    if rbShiftCol.Checked then
      FModifySheet := msShiftCol
    else
      if rbShiftRw.Checked then
        FModifySheet := msShiftRow
      else
        if rbRw.Checked then
          FModifySheet := msAllRow
        else
          FModifySheet := msAllCol
  end;
end;

procedure TFeatureModifyForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

end.
