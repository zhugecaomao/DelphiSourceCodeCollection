unit FootrFrm;

{***************************************}
{   Top Support                         }
{   TtsGrid Example Program 'Footer'    }
{   Copyright (c) 1997 Top Support      }
{***************************************}

{**********************************************************************}
{ This sample program demonstrates how to place a footer below a grid  }
{ for displaying totals. It also shows an example of using the editing }
{ events OnStartRowEdit, OnStartCellEdit, OnEndCellEdit and            }
{ OnEndRowEdit to keep the totals in the footer corresponding with the }
{ data in the grid.                                                    }
{                                                                      }
{ This example uses two TtsGrids placed above each other. The grid on  }
{ the top (grdData in the source) contains data, the grid below that   }
{ (grdFooter) contains the totals for each of the columns in the data  }
{ grid. A number of events are used in both grids to let the grids     }
{ operate together. The OnTopLeftChanged of both grids is used to      }
{ keep the columns aligned. The OnColResized event of the grdData grid }
{ is used to adjust the size of the grdFooter columns when the user    }
{ resizes columns. The OnStartRowEdit, OnStartCellEdit,                }
{ OnUndoRowEdit and the OnEndCellEdit of the grdData grid is used to   }
{ adjust the totals in the footer when the user types in new values in }
{ in the grid.                                                         }
{                                                                      }
{ At startup, the FormCreate fills in a TextArray with random numbers  }
{ for the data grid and computes the initial totals. As the user types }
{ in new values, the totals are dynamically adjusted to reflect the    }
{ changes.                                                             }
{**********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids_ts, TSGrid, StdCtrls;

type
  TForm1 = class(TForm)
    grdData: TtsGrid;
    grdFooter: TtsGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure grdDataCellLoaded(Sender: TObject; DataCol, DataRow: Longint;
      var Value: Variant);
    procedure grdDataColMoved(Sender: TObject; ToDisplayCol,
      Count: Longint; ByUser: Boolean);
    procedure grdDataColResized(Sender: TObject; RowColnr: Longint);
    procedure grdDataEndCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; var Cancel: Boolean);
    procedure grdDataEndRowEdit(Sender: TObject; DataRow: Longint;
      var Cancel: Boolean);
    procedure grdDataStartCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; var Cancel: Boolean);
    procedure grdFooterCellLoaded(Sender: TObject; DataCol,
      DataRow: Longint; var Value: Variant);
    procedure grdFooterTopLeftChanged(Sender: TObject; OldCol, OldRow,
      NewCol, NewRow: Longint; ByUser: Boolean);
    procedure grdDataTopLeftChanged(Sender: TObject; OldCol, OldRow,
      NewCol, NewRow: Longint; ByUser: Boolean);
    procedure grdDataStartRowEdit(Sender: TObject; DataRow: Longint;
      var Cancel: Boolean);
    procedure grdDataUndoRowEdit(Sender: TObject; DataRow: Longint;
      ByUser: Boolean; var Cancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TextArray: array[1..20, 1..100] of string;
  Totals: array[1..20] of Double;
  FOldRow: array[1..20] of string;
  FOldCellValue: string;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
    I, J: Longint;
    Total: Longint;
    Value: Integer;
begin
    {Initialize the grids, fill in a TextArray with random values for
     the data grid and compute the initial total values.}

    with grdData do
    begin
        Randomize;
        for I := 1 to Cols do
        begin
            //Set the alignment to right justify
            Col[I].Alignment := taRightJustify;
            grdFooter.Col[I].Alignment := taRightJustify;

            //Set the heading of the data grid
            Col[I].Heading := 'Column ' + IntToStr(I);

            //Compute random numbers and the initial footer totals
            Total := 0;
            for J := 1 to Rows do
            begin
                Value := Random(1000) - 250;
                TextArray[I, J] := IntToStr(Value);
                Total := Total + Value;
            end;

            //Assign the total for column I
            Totals[I] := Total;
        end;
    end;

    //Align the width of columns of the foooter grid with those of the data grid
    for I := 1 to grdData.Cols do
    begin
        grdFooter.Col[I].Width := grdData.Col[I].Width;
    end;
end;

procedure TForm1.grdDataCellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    Value := TextArray[DataCol, DataRow];
end;

procedure TForm1.grdDataColMoved(Sender: TObject; ToDisplayCol,
  Count: Longint; ByUser: Boolean);
var
    I: Longint;
begin
    //Move the footer columns to the same position as the columns in the
    //data grid if they are moved by the user
    for I := grdData.Cols downto 1 do
    begin
        grdFooter.Col[grdData.DataColnr[I]].DisplayCol := I;
    end;
end;

procedure TForm1.grdDataColResized(Sender: TObject; RowColnr: Longint);
var
    I: Longint;
begin
    {Resize the columns of the footer to match those of the data grid if
     they have been resized by the user.}

    if RowColnr = -1 then
    begin
        //RowColnr = -1 indicates all columns have been resized
        for I := 1 to grdData.Cols do
            grdFooter.Col[I].Width := grdData.Col[I].Width;
    end
    else if RowColnr = 0 then
        //RowColnr = 0 indicates the rowbar has been resized
        grdFooter.RowBarWidth := grdData.RowBarWidth
    else
        //RowColnr > 0 indicates an individual column has been resized
        grdFooter.Col[RowColnr].Width := grdData.Col[RowColnr].Width;
end;

procedure TForm1.grdDataEndCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; var Cancel: Boolean);
var
    OldValue, Value: Double;
    CellValue: string;
begin
    {Checks for a valid number when the user leaves the cell after editing
     its contents and recalculates the totals for the column the current
     cell is in.}

    Cancel := False;
    try
        //Get the old and the new cell value. An empty string indicates
        //a value of 0. If the StrToFloat fails then the input was invalid and
        //the cancel parameter is set to true in the exception block.
        CellValue := grdData.CurrentCell.Value;
        if CellValue = ''
            then Value := 0
            else Value := StrToFloat(CellValue);
        if FOldCellValue = ''
            then OldValue := 0
            else OldValue := StrToFloat(FOldCellValue);

        //Store new value in the TextArray
        TextArray[DataCol, DataRow] := CellValue;

        //Compute new total
        Totals[DataCol] := Totals[DataCol] - OldValue + Value;

        //Invalidate the totals cell for the current column
        grdFooter.CellInvalidate(grdFooter.Col[DataCol].DisplayCol, 1);
    except
        on Exception do
        begin
            //If an exception is raised, the input is invalid. Set the Cancel
            //parameter to True in that case.
            Cancel := True;
            ShowMessage(grdData.CurrentCell.Value + ' is not a valid number.');
        end;
    end
end;

procedure TForm1.grdDataEndRowEdit(Sender: TObject; DataRow: Longint;
  var Cancel: Boolean);
begin
    //Reset the changed status of the edited row.
    grdData.RowChanged[DataRow] := False;
end;

procedure TForm1.grdDataStartCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; var Cancel: Boolean);
begin
    //Store the old value of the cell before it is edited.
    FOldCellValue := grdData.CurrentCell.Value;
end;

procedure TForm1.grdFooterCellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    Value := FloatToStr(Totals[DataCol]);
end;

procedure TForm1.grdFooterTopLeftChanged(Sender: TObject; OldCol, OldRow,
  NewCol, NewRow: Longint; ByUser: Boolean);
begin
    //Align the left column of the footer grid with that of the data grid.
    grdData.LeftCol := grdFooter.LeftCol;
end;

procedure TForm1.grdDataTopLeftChanged(Sender: TObject; OldCol, OldRow,
  NewCol, NewRow: Longint; ByUser: Boolean);
begin
    //Align the left column of the data grid with that of the footer grid.
    grdFooter.LeftCol := grdData.LeftCol;
end;

procedure TForm1.grdDataStartRowEdit(Sender: TObject; DataRow: Longint;
  var Cancel: Boolean);
var
    I: Longint;
begin
    //Save the old row values at the start of editing a row. The old values
    //are used to reset the data when the user cancels the editing with the
    //Escape key.
    for I := 1 to grdData.Cols do
    begin
        FOldRow[I] := TextArray[I, DataRow];
    end;
end;

procedure TForm1.grdDataUndoRowEdit(Sender: TObject; DataRow: Longint;
  ByUser: Boolean; var Cancel: Boolean);
var
    I: Longint;
    OldValue, Value: Double;
begin
    {The user has canceled the editing with the Escape key. The row's old values
     values are restored as well as the totals.}

    for I := 1 to grdData.Cols do
    begin
        if FOldRow[I] <> TextArray[I, DataRow] then
        begin
            if FOldRow[I] = ''
                then OldValue := 0
                else OldValue := StrToFloat(FOldRow[I]);
            if TextArray[I, DataRow] = ''
                then Value := 0
                else Value := StrToFloat(TextArray[I, DataRow]);

            //Reset the total to its old value for column I
            Totals[I] := Totals[I] + OldValue - Value;

            //Reset the old value in the TextArray for the data grid
            TextArray[I, DataRow] := FOldRow[I];

            //Invalidate the total's cell
            grdFooter.CellInvalidate(grdFooter.Col[I].DisplayCol, 1);
        end;
    end;
end;

end.
