unit EditFrm;

{***************************************}
{   Top Support                         }
{   TtsGrid Example Program 'EditMask'  }
{   Copyright (c) 1998 Top Support      }
{***************************************}

{********************************************************************}
{ This sample program shows the use of edit masks with the TtsGrid   }
{ component.                                                         }
{                                                                    }
{ The tsMaskDefs component placed on the form contains the edit masks}
{ used by the grid. It is linked to the grid through the grid's      }
{ MaskDefs property. In the FormCreate, the edit masks defined in the}
{ tsMaskDefs component are assigned to the a number of columns, by   }
{ setting the column's MaskName property to the name of one of the   }
{ edit masks in the tsMaskDefs component.                            }
{                                                                    }
{ The edit masks are used for data entry validation by the grid.     }
{ If invalid data is entered, the OnInvalidMaskEdit is activated. On }
{ exit from the cell, the OnInvalidMaskValue is activated if the     }
{ value in the cell is incorrect. In this example, both events are   }
{ programmed to display an error message.                            }
{********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids_ts, TSGrid, TSMask, StdCtrls;

type
  TForm1 = class(TForm)
    tsGrid1: TtsGrid;
    tsMaskDefs: TtsMaskDefs;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblInvalid: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CreateTextArray;
    procedure tsGrid1CellLoaded(Sender: TObject; DataCol, DataRow: Longint;
      var Value: Variant);
    procedure tsGrid1UndoRowEdit(Sender: TObject; DataRow: Longint;
      ByUser: Boolean; var Cancel: Boolean);
    procedure tsGrid1StartRowEdit(Sender: TObject; DataRow: Longint;
      var Cancel: Boolean);
    procedure tsGrid1CellEdit(Sender: TObject; DataCol, DataRow: Longint;
      ByUser: Boolean);
    procedure tsGrid1InvalidMaskEdit(Sender: TObject; Keys: String;
      DataCol, DataRow: Longint; var Accept: Boolean);
    procedure tsGrid1InvalidMaskValue(Sender: TObject; DataCol,
      DataRow: Longint; var Accept: Boolean);
    procedure tsGrid1UndoCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; ByUser: Boolean; var Cancel: Boolean);
    procedure tsGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure tsGrid1CellChanged(Sender: TObject; OldCol, NewCol, OldRow,
      NewRow: Longint);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
    NumberOfRows = 4;
    NumberOfCols = 6;

var
  Form1: TForm1;
  Bmp: Array [0..2] of TBitmap;
  TextArray: Array [1..NumberOfCols,1..NumberOfRows] of Variant;
  CurrentTextArray: Array [1..NumberOfCols] of Variant;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
    {Initialize the grid on startup}

    //Setting grid properties
    tsGrid1.Rows := NumberOfRows;
    tsGrid1.Cols := NumberOfCols;
    tsGrid1.FixedColCount := 1;
    tsGrid1.FixedLineColor := clNone;

    //Setting column properties
    tsGrid1.Col[1].Color := cl3DLight;
    tsGrid1.Col[1].Is3D := true;
    tsGrid1.Col[1].AssignFont;
    tsGrid1.Col[1].Font.Style := [fsBold];
    tsGrid1.Col[1].ReadOnly := true;
    tsGrid1.Col[1].Alignment := taCenter;
    tsGrid1.Col[1].Heading := 'Fixed';
    tsGrid1.Col[1].Width := 35;

    tsGrid1.Col[2].Width := 80;
    tsGrid1.Col[2].Heading := 'Date';
    tsGrid1.Col[2].MaskName := 'DateMask';

    tsGrid1.Col[3].Width := 50;
    tsGrid1.Col[3].Heading := 'Time';
    tsGrid1.Col[3].MaskName := 'TimeMask';

    tsGrid1.Col[4].Width := 50;
    tsGrid1.Col[4].Heading := 'Number';
    tsGrid1.Col[4].MaskName := 'NumMask';
    tsGrid1.Col[4].Alignment := taRightJustify;

    tsGrid1.Col[5].Width := 120;
    tsGrid1.Col[5].Heading := 'Upper case';
    tsGrid1.Col[5].MaskName := 'UpperMask';

    tsGrid1.Col[6].Width := 100;
    tsGrid1.Col[6].Heading := 'Title case';
    tsGrid1.Col[6].MaskName := 'TitleMask';

    //Align heading centered
    tsGrid1.HeadingAlignment := taCenter;

    //Create internal array for text display
    CreateTextArray;
end;

procedure TForm1.CreateTextArray;
var
    I, J: Integer;
begin
    {Create an array for storing the grid's contents}

    for I := 1 to NumberOfCols do
        for J := 1 to NumberOfRows do
        begin
            if I = 1 then
                TextArray[I, J] := IntToStr(J)
            else if J = 1 then
            begin
                case I of
                    2: TextArray[I,J] := FormatDateTime('mm"/"dd"/"yyyy', Date);
                    3: TextArray[I,J] := FormatDateTime('hh:nn', Time);
                    4: TextArray[I,J] := '109.25';
                    5: TextArray[I,J] := 'UPPER CASE TEXT';
                    6: TextArray[I,J] := 'Title Case Text';
                end;
            end
            else
                TextArray[I, J] := '';
        end;
end;

procedure TForm1.tsGrid1CellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    {Supply the data for each cell of the grid}
    Value := TextArray[DataCol, DataRow];
end;

procedure TForm1.tsGrid1UndoRowEdit(Sender: TObject; DataRow: Longint;
  ByUser: Boolean; var Cancel: Boolean);
var
    I: Integer;
begin
    {Reset the row's contents to their original values. This event is
     activated when the user presses Escape once or twice}

    for I := 1 to NumberOfCols do
        TextArray[I, DataRow] := CurrentTextArray[I];
end;

procedure TForm1.tsGrid1StartRowEdit(Sender: TObject; DataRow: Longint;
  var Cancel: Boolean);
var
    I: Integer;
begin
    {Save the original contents of the row so they can be restored if the
     editing is canceled. This event is activated when the user starts
     editing one of cells in a row}

    for I := 1 to NumberOfCols do
        CurrentTextArray[I] := TextArray[I, DataRow];
end;

procedure TForm1.tsGrid1CellEdit(Sender: TObject; DataCol,
  DataRow: Longint; ByUser: Boolean);
begin
    {Store changes made to individual cells. This event is activated
     with every change made to the current cell's contents}

    TextArray[DataCol, DataRow] := tsGrid1.CurrentCell.Value;
end;

procedure TForm1.tsGrid1InvalidMaskEdit(Sender: TObject; Keys: String;
  DataCol, DataRow: Longint; var Accept: Boolean);
begin
    lblInvalid.Caption := 'Incorrect ' + tsGrid1.Col[DataCol].Heading + ' character ''' + Keys + '''';
end;

procedure TForm1.tsGrid1InvalidMaskValue(Sender: TObject; DataCol,
  DataRow: Longint; var Accept: Boolean);
begin
    lblInvalid.Caption := 'Incorrect '  + tsGrid1.Col[DataCol].Heading + ' value ''' + tsGrid1.CurrentCell.Value + '''';
end;

procedure TForm1.tsGrid1UndoCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; ByUser: Boolean; var Cancel: Boolean);
begin
    TextArray[DataCol, DataRow] := CurrentTextArray[DataCol];
end;

procedure TForm1.tsGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    lblInvalid.Caption := '';
end;

procedure TForm1.tsGrid1CellChanged(Sender: TObject; OldCol, NewCol,
  OldRow, NewRow: Longint);
begin
    lblInvalid.Caption := '';
end;

end.
