unit EventFrm;

{***************************************}
{   Top Support                         }
{   TtsGrid Example Program 'Events'    }
{   Copyright (c) 1997 Top Support      }
{***************************************}

{********************************************************************}
{ This sample program displays a number of events that are activated }
{ by the TtsGrid when a user works with the grid. Most of these      }
{ events also apply to the TtsDBGrid.                                }
{                                                                    }
{ The events activated are edit events, row, column and cell         }
{ selection events, row and column moving events, mouse events,      }
{ keyboard events, and others. The event handlers for these events   }
{ simply display a message in a text box below the grid.             }
{********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids_ts, TSGrid, StdCtrls;

type
  TForm1 = class(TForm)
    tsGrid1: TtsGrid;
    memMessages: TMemo;
    lblMessages: TLabel;
    grpactivate: TGroupBox;
    chkMouseStatus: TCheckBox;
    chkTopLeftChanged: TCheckBox;
    chkRowColChanged: TCheckBox;
    chkShowarguments: TCheckBox;
    chkCellEdit: TCheckBox;
    chkKeyMessages: TCheckBox;
    chkSelectChanged: TCheckBox;
    grpMethods: TGroupBox;
    butInsertRow: TButton;
    butInsertCol: TButton;
    butDeleteRow: TButton;
    butDeleteCol: TButton;
    chkMouseMessages: TCheckBox;
    procedure tsGrid1CellLoaded(Sender: TObject; DataCol, DataRow: Longint;
      var Value: Variant);
    procedure tsGrid1CellEdit(Sender: TObject; DataCol, DataRow: Longint;
      ByUser: Boolean);
    function BooleanToText(Value: Boolean): string;
    procedure chkMouseStatusClick(Sender: TObject);
    procedure chkTopLeftChangedClick(Sender: TObject);
    procedure chkRowColChangedClick(Sender: TObject);
    procedure chkCellEditClick(Sender: TObject);
    procedure chkShowargumentsClick(Sender: TObject);
    procedure tsGrid1Click(Sender: TObject);
    procedure tsGrid1ClickCell(Sender: TObject; DataColDown, DataRowDown,
      DataColUp, DataRowUp: Longint; DownPos, UpPos: TtsClickPosition);
    procedure tsGrid1ColChanged(Sender: TObject; OldCol, NewCol: Longint);
    procedure tsGrid1RowChanged(Sender: TObject; OldRow, NewRow: Longint);
    procedure tsGrid1ColMoved(Sender: TObject; ToDisplayCol,
      Count: Longint; ByUser: Boolean);
    procedure tsGrid1ColResized(Sender: TObject; RowColnr: Longint);
    procedure tsGrid1DblClickCell(Sender: TObject; DataCol,
      DataRow: Longint; Pos: TtsClickPosition);
    procedure tsGrid1EndCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; var Cancel: Boolean);
    procedure tsGrid1EndRowEdit(Sender: TObject; DataRow: Longint;
      var Cancel: Boolean);
    procedure tsGrid1GridStatusChanged(Sender: TObject; OldStatus,
      NewStatus: TtsGridStatus);
    procedure tsGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkKeyMessagesClick(Sender: TObject);
    procedure tsGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure tsGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tsGrid1MouseStatusChanged(Sender: TObject; OldStatus,
      NewStatus: TtsMouseStatus);
    procedure tsGrid1RowMoved(Sender: TObject; ToDisplayRow,
      Count: Longint; ByUser: Boolean);
    procedure tsGrid1RowResized(Sender: TObject; RowColnr: Longint);
    procedure tsGrid1SelectChanged(Sender: TObject;
      SelectType: TtsSelectType; ByUser: Boolean);
    procedure chkSelectChangedClick(Sender: TObject);
    procedure tsGrid1StartCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; var Cancel: Boolean);
    procedure tsGrid1StartRowEdit(Sender: TObject; DataRow: Longint;
      var Cancel: Boolean);
    procedure tsGrid1TopLeftChanged(Sender: TObject; OldCol, OldRow,
      NewCol, NewRow: Longint; ByUser: Boolean);
    procedure tsGrid1UndoCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; ByUser: Boolean; var Cancel: Boolean);
    procedure tsGrid1UndoRowEdit(Sender: TObject; DataRow: Longint;
      ByUser: Boolean; var Cancel: Boolean);
    procedure butInsertRowClick(Sender: TObject);
    procedure butInsertColClick(Sender: TObject);
    procedure butDeleteRowClick(Sender: TObject);
    procedure butDeleteColClick(Sender: TObject);
    procedure tsGrid1ColCountChanged(Sender: TObject; OldCount,
      NewCount: Longint);
    procedure tsGrid1DeleteCol(Sender: TObject; DataCol: Longint;
      ByUser: Boolean);
    procedure tsGrid1RowCountChanged(Sender: TObject; OldCount,
      NewCount: Longint);
    procedure tsGrid1DeleteRow(Sender: TObject; DataRow: Longint;
      ByUser: Boolean);
    procedure tsGrid1InsertCol(Sender: TObject; DataCol: Longint;
      ByUser: Boolean);
    procedure tsGrid1InsertRow(Sender: TObject; DataRow: Longint;
      ByUser: Boolean);
    procedure chkMouseMessagesClick(Sender: TObject);
    procedure tsGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tsGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.tsGrid1CellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    {Supply the data for all the cells in the grid}
    Value := IntToStr(DataCol) + ', ' + IntToStr(DataRow);
end;

procedure TForm1.chkMouseStatusClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

procedure TForm1.chkTopLeftChangedClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

procedure TForm1.chkRowColChangedClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

procedure TForm1.chkCellEditClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

procedure TForm1.chkShowargumentsClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

function TForm1.BooleanToText(Value: Boolean): string;
begin
    if Value then Result := 'True'
             else Result := 'False';
end;

procedure TForm1.tsGrid1CellEdit(Sender: TObject; DataCol,
  DataRow: Longint; ByUser: Boolean);
var
    Msg: string;
begin
    {OnCellEdit event}

    if not chkCellEdit.checked then Exit;

    Msg := 'CellEdit';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataCol) + ',' + IntToStr(DataRow) + ',' +
                BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1Click(Sender: TObject);
var
    Msg: string;
begin
    {OnClick event}

    Msg := 'Click';
    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1ClickCell(Sender: TObject; DataColDown,
  DataRowDown, DataColUp, DataRowUp: Longint; DownPos,
  UpPos: TtsClickPosition);
var
    Msg: string;
begin
    {OnClickCell event}

    Msg := 'ClickCell';

    if chkShowArguments.Checked then
    begin
        Msg := Msg + '(' + IntToStr(DataColDown) + ',' + IntToStr(DataRowDown) + ',' +
                IntToStr(DataColUp) + ',' + IntToStr(DataRowUp) + ',';
        case DownPos of
            cpHeading:   Msg := Msg + 'cpHeading,';
            cpRowBar:    Msg := Msg + 'cpRowBar,';
            cpUpperLeft: Msg := Msg + 'cpUpperLeft,';
            cpCell:      Msg := Msg + 'cpCell,';
            cpNone:      Msg := Msg + 'cpNone,';
        end;
        case UpPos of
            cpHeading:   Msg := Msg + 'cpHeading)';
            cpRowBar:    Msg := Msg + 'cpRowBar)';
            cpUpperLeft: Msg := Msg + 'cpUpperLeft)';
            cpCell:      Msg := Msg + 'cpCell)';
            cpNone:      Msg := Msg + 'cpNone)';
        end;
    end;

    memMessages.Lines.Add(Msg);

end;

procedure TForm1.tsGrid1ColChanged(Sender: TObject; OldCol,
  NewCol: Longint);
var
    Msg: string;
begin
    {OnColChanged event}

    if not chkRowColChanged.checked then Exit;

    Msg := 'ColChanged';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(OldCol) + ',' + IntToStr(NewCol) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1RowChanged(Sender: TObject; OldRow,
  NewRow: Longint);
var
    Msg: string;
begin
    {OnRowChanged event}

    if not chkRowColChanged.checked then Exit;

    Msg := 'RowChanged';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(OldRow) + ',' + IntToStr(NewRow) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1ColMoved(Sender: TObject; ToDisplayCol,
  Count: Longint; ByUser: Boolean);
var
    Msg: string;
begin
    {OnColMoved event}

    Msg := 'ColMoved';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(ToDisplayCol) + ',' + IntToStr(Count) + ',' +
                BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1ColResized(Sender: TObject; RowColnr: Longint);
var
    Msg: string;
begin
    {OnColResized event}

    Msg := 'ColResized';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(RowColnr) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1DblClickCell(Sender: TObject; DataCol,
  DataRow: Longint; Pos: TtsClickPosition);
var
    Msg: string;
begin
    {OnDblClickCell event}

    Msg := 'DblClickCell';

    if chkShowArguments.Checked then
    begin
        Msg := Msg + '(' + IntToStr(DataCol) + ',' + IntToStr(DataRow);
        case Pos of
            cpHeading:   Msg := Msg + 'cpHeading)';
            cpRowBar:    Msg := Msg + 'cpRowBar)';
            cpUpperLeft: Msg := Msg + 'cpUpperLeft)';
            cpCell:      Msg := Msg + 'cpCell)';
            cpNone:      Msg := Msg + 'cpNone)';
        end;
    end;

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1EndCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; var Cancel: Boolean);
var
    Msg: string;
begin
    {OnEndCellEdit event}

    Msg := 'EndCellEdit';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataCol) + ',' + IntToStr(DataRow) + ',' +
                BooleanToText(Cancel) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1EndRowEdit(Sender: TObject; DataRow: Longint;
  var Cancel: Boolean);
var
    Msg: string;
begin
    {OnEndRowEdit event}

    Msg := 'EndRowEdit';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataRow) + ',' + BooleanToText(Cancel) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1GridStatusChanged(Sender: TObject; OldStatus,
  NewStatus: TtsGridStatus);
var
    Msg: string;
begin
    {OnGridStatusChanged event}

    Msg := 'GridStatusChanged';

    if chkShowArguments.Checked then
    begin
        case OldStatus of
            grNormal    : Msg := Msg + '(grNormal,';
            grColSelect : Msg := Msg + '(grColSelect,';
            grRowSelect : Msg := Msg + '(grRowSelect,';
            grCellSelect: Msg := Msg + '(grCellSelect,';
        end;
        case NewStatus of
            grNormal    : Msg := Msg + 'grNormal)';
            grColSelect : Msg := Msg + 'grColSelect)';
            grRowSelect : Msg := Msg + 'grRowSelect)';
            grCellSelect: Msg := Msg + 'grCellSelect)';
        end;
    end;

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    Msg: string;
    Added: Boolean;
begin
    {OnKeyDown event}

    if not chkKeyMessages.checked then Exit;

    Msg := 'KeyDown';

    if chkShowArguments.Checked then
    begin
        Msg := Msg + '(' + Char(Key) + ',[';
        Added := false;

        if (ssShift in Shift) then
        begin
            Msg := Msg + 'ssShift';
            Added := true;
        end;
        if (ssAlt in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssAlt';
            Added := true;
        end;
        if (ssCtrl in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssCtrl';
            Added := true;
        end;
        if (ssLeft in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssLeft';
            Added := true;
        end;
        if (ssRight in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssRight';
            Added := true;
        end;
        if (ssMiddle in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssMiddle';
            Added := true;
        end;
        if (ssDouble in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssDouble';
        end;

        Msg := Msg + '])';
    end;

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.chkKeyMessagesClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

procedure TForm1.tsGrid1KeyPress(Sender: TObject; var Key: Char);
var
    Msg: string;
begin
    {OnKeyPress event}

    if not chkKeyMessages.checked then Exit;

    Msg := 'KeyPress';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + Char(Key) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    Msg: string;
    Added: Boolean;
begin
    {OnKeyUp event}

    if not chkKeyMessages.checked then Exit;

    Msg := 'KeyUp';

    if chkShowArguments.Checked then
    begin
        Msg := Msg + '(' + Char(Key) + ',[';
        Added := false;

        if (ssShift in Shift) then
        begin
            Msg := Msg + 'ssShift';
            Added := true;
        end;
        if (ssAlt in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssAlt';
            Added := true;
        end;
        if (ssCtrl in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssCtrl';
            Added := true;
        end;
        if (ssLeft in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssLeft';
            Added := true;
        end;
        if (ssRight in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssRight';
            Added := true;
        end;
        if (ssMiddle in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssMiddle';
            Added := true;
        end;
        if (ssDouble in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssDouble';
        end;

        Msg := Msg + '])';
    end;

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1MouseStatusChanged(Sender: TObject; OldStatus,
  NewStatus: TtsMouseStatus);
var
    Msg: string;
begin
    {OnKeyDown event}

    if not chkMouseStatus.checked then Exit;

    Msg := 'MouseStatusChanged';

    if chkShowArguments.Checked then
    begin
        case OldStatus of
            msNormal        : Msg := Msg + '(msNormal,';
            msRowSelect     : Msg := Msg + '(msRowSelect,';
            msColSelect     : Msg := Msg + '(msColSelect,';
            msCellSelect    : Msg := Msg + '(msCellSelect,';
            msAllRowSelect  : Msg := Msg + '(msAllRowSelect,';
            msRowResize     : Msg := Msg + '(msRowResize,';
            msColResize     : Msg := Msg + '(msColResize,';
            msHeadingResize : Msg := Msg + '(msHeadingResize,';
            msRowBarResize  : Msg := Msg + '(msRowBarResize,';
            msRowMove       : Msg := Msg + '(msRowMove,';
            msColMove       : Msg := Msg + '(msColMove,';
            msButtonDown    : Msg := Msg + '(msButtonDown,';
        end;
        case NewStatus of
            msNormal        : Msg := Msg + 'msNormal)';
            msRowSelect     : Msg := Msg + 'msRowSelect)';
            msColSelect     : Msg := Msg + 'msColSelect)';
            msCellSelect    : Msg := Msg + 'msCellSelect)';
            msAllRowSelect  : Msg := Msg + 'msAllRowSelect)';
            msRowResize     : Msg := Msg + 'msRowResize)';
            msColResize     : Msg := Msg + 'msColResize)';
            msHeadingResize : Msg := Msg + 'msHeadingResize)';
            msRowBarResize  : Msg := Msg + 'msRowBarResize)';
            msRowMove       : Msg := Msg + 'msRowMove)';
            msColMove       : Msg := Msg + 'msColMove)';
            msButtonDown    : Msg := Msg + 'msButtonDown)';
        end;
    end;

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1RowMoved(Sender: TObject; ToDisplayRow,
  Count: Longint; ByUser: Boolean);
var
    Msg: string;
begin
    {OnRowMoved event}

    Msg := 'RowMoved';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(ToDisplayRow) + ',' + IntToStr(Count) + ',' +
                BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1RowResized(Sender: TObject; RowColnr: Longint);
var
    Msg: string;
begin
    {OnRowResized event}

    Msg := 'RowResized';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(RowColnr) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1SelectChanged(Sender: TObject;
  SelectType: TtsSelectType; ByUser: Boolean);
var
    Msg: string;
begin
    {OnSelectChanged event}

    if not chkSelectChanged.checked then Exit;

    Msg := 'SelectChanged';

    if chkShowArguments.Checked then
    begin
        case SelectType of
            stRowSelect : Msg := Msg + '(' + 'stRowSelect,';
            stColSelect : Msg := Msg + '(' + 'stColSelect,';
            stCellSelect: Msg := Msg + '(' + 'stCellSelect,';
        end;
        Msg := Msg + BooleanToText(ByUser) + ')';
    end;

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.chkSelectChangedClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

procedure TForm1.tsGrid1StartCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; var Cancel: Boolean);
var
    Msg: string;
begin
    {OnStartCellEdit event}

    Msg := 'StartCellEdit';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataCol) + ',' + IntToStr(DataRow) + ',' +
                BooleanToText(Cancel) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1StartRowEdit(Sender: TObject; DataRow: Longint;
  var Cancel: Boolean);
var
    Msg: string;
begin
    {OnStartRowEdit event}

    Msg := 'StartRowEdit';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataRow) + ',' + BooleanToText(Cancel) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1TopLeftChanged(Sender: TObject; OldCol, OldRow,
  NewCol, NewRow: Longint; ByUser: Boolean);
var
    Msg: string;
begin
    {OnTopLeftChanged event}

    if not chkTopLeftChanged.checked then Exit;

    Msg := 'TopLeftChanged';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(OldCol) + ',' + IntToStr(OldRow) + ',' +
                IntToStr(NewCol) + ',' + IntToStr(NewRow) + ',' +
                BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1UndoCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; ByUser: Boolean; var Cancel: Boolean);
var
    Msg: string;
begin
    {OnUndoCellEdit event}

    Msg := 'UndoCellEdit';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataCol) + ',' + IntToStr(DataRow) + ',' +
                BooleanToText(ByUser) + ',' + BooleanToText(Cancel) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1UndoRowEdit(Sender: TObject; DataRow: Longint;
  ByUser: Boolean; var Cancel: Boolean);
var
    Msg: string;
begin
    {OnUndoRowEdit event}

    Msg := 'UndoRowEdit';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataRow) + ',' + BooleanToText(ByUser) + ',' +
                BooleanToText(Cancel) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.butInsertRowClick(Sender: TObject);
var
    InsertPos: Longint;
begin
    tsGrid1.ResetSelection;
    if tsGrid1.Rows > 0 then InsertPos := tsGrid1.DisplayRownr[tsGrid1.CurrentDataRow]
                        else InsertPos := 1;
    tsGrid1.InsertRow(InsertPos);
    tsGrid1.SetFocus;
end;

procedure TForm1.butInsertColClick(Sender: TObject);
var
    InsertPos: Longint;
begin
    tsGrid1.ResetSelection;
    if tsGrid1.Cols > 0 then InsertPos := tsGrid1.Col[tsGrid1.CurrentCell.DataCol].DisplayCol
                        else InsertPos := 1;
    tsGrid1.InsertCol(InsertPos);
    tsGrid1.SetFocus;
end;

procedure TForm1.butDeleteRowClick(Sender: TObject);
begin
    tsGrid1.ResetSelection;
    if tsGrid1.Rows > 0 then
        tsGrid1.DeleteRows(tsGrid1.Rows, tsGrid1.Rows);
    tsGrid1.SetFocus;
end;

procedure TForm1.butDeleteColClick(Sender: TObject);
begin
    tsGrid1.ResetSelection;
    if tsGrid1.Cols > 0 then
        tsGrid1.DeleteCols(tsGrid1.Cols, tsGrid1.Cols);
    tsGrid1.SetFocus;
end;

procedure TForm1.tsGrid1ColCountChanged(Sender: TObject; OldCount,
  NewCount: Longint);
var
    Msg: string;
begin
    {OnColCountChanged event}

    if csLoading in ComponentState then Exit;

    Msg := 'ColCountChanged';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(OldCount) + ',' + IntToStr(NewCount) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1DeleteCol(Sender: TObject; DataCol: Longint;
  ByUser: Boolean);
var
    Msg: string;
begin
    {OnDeleteCol event}

    Msg := 'DeleteCol';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataCol) + ',' + BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1RowCountChanged(Sender: TObject; OldCount,
  NewCount: Longint);
var
    Msg: string;
begin
    {OnRowCountChanged event}

    if csLoading in ComponentState then Exit;

    Msg := 'RowCountChanged';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(OldCount) + ',' + IntToStr(NewCount) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1DeleteRow(Sender: TObject; DataRow: Longint;
  ByUser: Boolean);
var
    Msg: string;
begin
    {OnDeleteRow event}

    Msg := 'DeleteRow';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataRow) + ',' + BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1InsertCol(Sender: TObject; DataCol: Longint;
  ByUser: Boolean);
var
    Msg: string;
begin
    {OnInsertCol event}

    Msg := 'InsertCol';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataCol) + ',' + BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1InsertRow(Sender: TObject; DataRow: Longint;
  ByUser: Boolean);
var
    Msg: string;
begin
    {OnInsertRow event}

    Msg := 'InsertRow';

    if chkShowArguments.Checked then
        Msg := Msg + '(' + IntToStr(DataRow) + ',' + BooleanToText(ByUser) + ')';

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.chkMouseMessagesClick(Sender: TObject);
begin
    tsGrid1.SetFocus;
end;

procedure TForm1.tsGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Msg: string;
    Added: Boolean;
begin
    {OnMouseDown event}

    if not chkMouseMessages.Checked then Exit;

    Msg := 'MouseDown';

    if chkShowArguments.Checked then
    begin
        case Button of
            mbLeft  : Msg := Msg + '(mbLeft,[';
            mbRight : Msg := Msg + '(mbRight,[';
            mbMiddle: Msg := Msg + '(mbMiddle,[';
        end;

        Added := false;
        if (ssShift in Shift) then
        begin
            Msg := Msg + 'ssShift';
            Added := true;
        end;
        if (ssAlt in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssAlt';
            Added := true;
        end;
        if (ssCtrl in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssCtrl';
            Added := true;
        end;
        if (ssLeft in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssLeft';
            Added := true;
        end;
        if (ssRight in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssRight';
            Added := true;
        end;
        if (ssMiddle in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssMiddle';
            Added := true;
        end;
        if (ssDouble in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssDouble';
        end;

        Msg := Msg + '],' + IntToStr(X) + ',' + IntToStr(Y) + ')';
    end;

    memMessages.Lines.Add(Msg);
end;

procedure TForm1.tsGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Msg: string;
    Added: Boolean;
begin
    {OnMouseUp event}

    if not chkMouseMessages.Checked then Exit;

    Msg := 'MouseUp';

    if chkShowArguments.Checked then
    begin
        case Button of
            mbLeft  : Msg := Msg + '(mbLeft,[';
            mbRight : Msg := Msg + '(mbRight,[';
            mbMiddle: Msg := Msg + '(mbMiddle,[';
        end;

        Added := false;
        if (ssShift in Shift) then
        begin
            Msg := Msg + 'ssShift';
            Added := true;
        end;
        if (ssAlt in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssAlt';
            Added := true;
        end;
        if (ssCtrl in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssCtrl';
            Added := true;
        end;
        if (ssLeft in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssLeft';
            Added := true;
        end;
        if (ssRight in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssRight';
            Added := true;
        end;
        if (ssMiddle in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssMiddle';
            Added := true;
        end;
        if (ssDouble in Shift) then
        begin
            if Added then Msg := Msg + ',';
            Msg := Msg + 'ssDouble';
        end;

        Msg := Msg + '],' + IntToStr(X) + ',' + IntToStr(Y) + ')';
    end;

    memMessages.Lines.Add(Msg);
end;

end.
