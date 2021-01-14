unit ContrFrm;

{********************************************}
{   Top Support                              }
{   TtsGrid Example Program 'Controls'       }
{   Copyright (c) 1997-1999 Top Support      }
{********************************************}

{********************************************************************}
{ This sample program shows how to use different control styles in   }
{ the TtsGrid. The grid is setup to use a text box, a check box,     }
{ a picture box, a spin edit and a date/time control. It also shows  }
{ how to use the grid as a 'virtual' grid, where the StoreData       }
{ property is false and the data is stored outside the grid.         }
{                                                                    }
{ The controls are all set at runtime. They can of also be set at    }
{ design time by double clicking on the grid and setting the         }
{ properties of the columns.                                         }
{                                                                    }
{ The grid's StoreData is set to False, so the grid's data is stored }
{ outside the grid, using an array. The values are loaded from the   }
{ array into the grid using the OnCellLoaded event.                  }
{                                                                    }
{ The FormCreate method below contains the code for initializing the }
{ TtsGrid. The tsGrid1CellLoaded method shows how to use the         }
{ OnCellLoaded event to supply data to the grid. The OnStartRowEdit, }
{ OnUndoRowEdit and OnCellEdit events are used to store and/or       }
{ undo the editing that occurs in the grid.                          }
{                                                                    }
{ Note: Storing data outside the grid is not needed when the grid's  }
{       StoreData is set to true. The data is then be stored in the  }
{       grid itself. When StoreData set to true, data can be loaded  }
{       into the grid by assigning the values to the grid's          }
{       Cell[Col,Row] property.                                      }
{********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids_ts, TSGrid, TSDateTimeDef, TSDateTime;

type
  TForm1 = class(TForm)
    tsGrid1: TtsGrid;
    tsDateTimeDef1: TtsDateTimeDef;
    procedure FormCreate(Sender: TObject);
    procedure CreateBitmaps;
    procedure CreateTextArray;
    procedure tsGrid1CellLoaded(Sender: TObject; DataCol, DataRow: Longint;
      var Value: Variant);
    procedure tsGrid1UndoRowEdit(Sender: TObject; DataRow: Longint;
      ByUser: Boolean; var Cancel: Boolean);
    procedure tsGrid1StartRowEdit(Sender: TObject; DataRow: Longint;
      var Cancel: Boolean);
    procedure tsGrid1CellEdit(Sender: TObject; DataCol, DataRow: Longint;
      ByUser: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
    NumberOfRows = 40;
    NumberOfCols = 10;

var
  Form1: TForm1;
  Bmp: Array [0..2] of TBitmap;
  TextArray: Array [1..NumberOfCols,1..NumberOfRows] of Variant;
  CurrentTextArray: Array [1..NumberOfCols] of Variant;
  PictureColumn : Integer;
  CheckBoxColumn: Integer;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
    I: Integer;
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

    tsGrid1.Col[2].Width := 100;
    tsGrid1.Col[2].Heading := 'Text box';

    tsGrid1.Col[3].ControlType := ctCheck;
    tsGrid1.Col[3].Is3D := true;
    tsGrid1.Col[3].Heading := 'Check box';
    tsGrid1.Col[3].AllowGrayed := true;
    CheckBoxColumn := 3;

    tsGrid1.Col[4].ControlType := ctPicture;
    tsGrid1.Col[4].Heading := 'Picture box';
    PictureColumn := 4;

    tsGrid1.Col[5].ButtonType := btVertSpin;
    tsGrid1.Col[5].ControlType := ctText;
    tsGrid1.Col[5].Heading := 'Spin edit';

    tsGrid1.Col[6].ButtonType := btDateTimeDropDown;
    tsGrid1.Col[6].ControlType := ctText;
    tsGrid1.Col[6].Heading := 'Date/time';
    tsGrid1.Col[6].Width := 100;

    //Set heading text
    for I := 7 to tsGrid1.Cols do
        tsGrid1.Col[I].Heading := 'Column ' + IntToStr(I);

    //Align heading centered
    tsGrid1.HeadingAlignment := taCenter;

    //Create bitmaps for display in picture column
    CreateBitmaps;

    //Create internal array for text display
    CreateTextArray;
end;

procedure TForm1.CreateBitmaps;
begin
    {Read the bitmaps for the picture box}

    Bmp[0] := TBitmap.Create;
    Bmp[0].LoadFromFile('Red.bmp');
    Bmp[1] := TBitmap.Create;
    Bmp[1].LoadFromFile('Green.bmp');
    Bmp[2] := TBitmap.Create;
    Bmp[2].LoadFromFile('Yellow.bmp');
end;

procedure TForm1.CreateTextArray;
var
    I, J: Integer;
begin
    {Create an array for storing the grid's contents}

    for I := 1 to NumberOfCols do
        for J := 1 to NumberOfRows do
            case tsGrid1.Col[I].ControlType of
                ctText, ctDefault:
                    if I = 1 then
                        TextArray[I, J] := IntToStr(J)
                    else if tsGrid1.Col[I].ButtonType = btVertSpin then
                        TextArray[I, J] := '0'
                    else if tsGrid1.Col[I].ButtonType = btDateTimeDropDown then
                        TextArray[I, J] := ''
                    else
                        TextArray[I, J] := IntToStr(I) + ', ' + IntToStr(J);
                ctCheck:    TextArray[I, J] := J mod 3;
                ctPicture:  TextArray[I, J] := BitmapToVariant(Bmp[J mod 3]);
            end;
end;

procedure TForm1.tsGrid1CellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    {Supply the data for each cell of the grid}

    if tsGrid1.Col[DataCol].ControlType = ctPicture then
    begin
        //Set picture drawing options; this is optional
        tsGrid1.CenterPicture := true;
        tsGrid1.TransparentColor := clNone;
        tsGrid1.StretchPicture := false;
    end;

    //Assign the cell's contents to the Value parameter
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

    if DataCol = CheckBoxColumn then
    begin
        //If the check box changes, change the bitmap in the picture column
        TextArray[PictureColumn, DataRow] := BitmapToVariant(Bmp[Integer(TextArray[DataCol, DataRow])]);
        tsGrid1.Cell[PictureColumn, DataRow] := BitmapToVariant(Bmp[Integer(TextArray[DataCol, DataRow])]);
    end;
end;

end.
