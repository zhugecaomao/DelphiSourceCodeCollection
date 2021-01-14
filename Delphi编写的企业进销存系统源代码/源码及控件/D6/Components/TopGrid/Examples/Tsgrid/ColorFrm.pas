unit ColorFrm;

{***************************************}
{   Top Support                         }
{   TtsGrid Example Program 'Colors'    }
{   Copyright (c) 1997 Top Support      }
{***************************************}

{**********************************************************************}
{ This sample program shows how to set color properties for rows,      }
{ columns and cells and how to use the OnGetDrawInfo event to set      }
{ colors and fonts.                                                    }
{                                                                      }
{ This example allows the user to select rows, columns and cells and   }
{ to select a color to which the selection should be set using a       }
{ button. It also demonstrates the use of the OnGetDrawInfo event.     }
{ This event allows you to set colors, fonts, alignment and word       }
{ wrapping on the fly, i.e. to change the way a cell is displayed as   }
{ it is being drawn on the screen based on the cell's. In the          }
{ FormCreate an array is filled with random numbers, which is used in  }
{ then OnGetDrawInfo to set the font color. The OnSelectChanged event  }
{ is used to Enable/Disable the buttons for setting colors, based on   }
{ the current selection in the grid.                                   }
{**********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids_ts, TSGrid;

type
  TForm1 = class(TForm)
    tsGrid1: TtsGrid;
    butRowColor: TButton;
    butColColor: TButton;
    butCellColor: TButton;
    ColorDialog1: TColorDialog;
    Button4: TButton;
    chkDrawInfo: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure butRowColorClick(Sender: TObject);
    procedure tsGrid1CellLoaded(Sender: TObject; DataCol, DataRow: Longint;
      var Value: Variant);
    procedure Button4Click(Sender: TObject);
    procedure butColColorClick(Sender: TObject);
    procedure tsGrid1SelectChanged(Sender: TObject;
      SelectType: TtsSelectType; ByUser: Boolean);
    procedure butCellColorClick(Sender: TObject);
    procedure tsGrid1GetDrawInfo(Sender: TObject; DataCol,
      DataRow: Longint; var DrawInfo: TtsDrawInfo);
    procedure FormCreate(Sender: TObject);
    procedure chkDrawInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TextArray: array[1..50, 1..100] of Variant;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
    I, J: Integer;
begin
    {Fill in a TextArray with random values for display in the grid and
     set the heading text}

    with tsGrid1 do
    begin
        for I := 1 to Cols do
        begin
            Col[I].Heading := 'Column ' + IntToStr(I);
            for J := 1 to Rows do
                TextArray[I, J] := IntToStr(Random(1000) - 250);
        end;
    end;
end;

procedure TForm1.butRowColorClick(Sender: TObject);
var
    I: Longint;
    SelColor: TColor;
begin
    {Allows the user to select a color and then applies that color to all
     selected rows.}

    if not ColorDialog1.Execute then Exit;

    SelColor := ColorDialog1.Color;
    with tsGrid1 do
    begin
        //Loop through the selected rows and set the color
        I := SelectedRows.First;
        while I <> -1 do
        begin
            RowColor[DataRownr[I]] := SelColor;
            I := SelectedRows.Next(I);
        end;

        //Reset the current row selection
        ResetRowProperties([prSelected]);
    end;
end;

procedure TForm1.tsGrid1CellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    Value := TextArray[DataCol, DataRow];
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    //Reset all the colors to their default values
    tsGrid1.ResetProperties([prColor]);
end;

procedure TForm1.butColColorClick(Sender: TObject);
var
    I: Longint;
    SelColor: TColor;
begin
    {Allows the user to select a color and then applies that color to all
     selected columns.}

    if not ColorDialog1.Execute then Exit;

    SelColor := ColorDialog1.Color;
    with tsGrid1 do
    begin
        I := SelectedCols.First;
        while I <> -1 do
        begin
            Col[DataColnr[I]].Color := SelColor;
            I := SelectedCols.Next(I);
        end;

        ResetColProperties([prSelected]);
    end;
end;

procedure TForm1.butCellColorClick(Sender: TObject);
var
    I, J: Longint;
    SelColor: TColor;
begin
    {Allows the user to select a color and then applies that color to all
     selected cells.}

    if not ColorDialog1.Execute then Exit;

    SelColor := ColorDialog1.Color;
    with tsGrid1 do
    begin
        for I := SelectedCells.Left to SelectedCells.Right do
        begin
            for J := SelectedCells.Top to SelectedCells.Bottom do
                CellColor[I, J] := SelColor;
        end;

        ResetCellProperties([prSelected]);
    end;
end;

procedure TForm1.tsGrid1SelectChanged(Sender: TObject;
  SelectType: TtsSelectType; ByUser: Boolean);
begin
    {This event is activated when selections change in the grid. It is
     used here to Enable/Disable the row, column and cell color buttons
     depending on the current selection. The GridStatus property indicates
     if any rows, columns or cells are selected in the grid.}

    butRowColor.Enabled := (tsGrid1.GridStatus = grRowSelect);
    butColColor.Enabled := (tsGrid1.GridStatus = grColSelect);
    butCellColor.Enabled := (tsGrid1.GridStatus = grCellSelect);
end;

procedure TForm1.tsGrid1GetDrawInfo(Sender: TObject; DataCol,
  DataRow: Longint; var DrawInfo: TtsDrawInfo);
begin
    {The OnGetDrawInfo can be used to set cell color, font, alignment and
     word wrapping on the fly by setting one of the fields in the DrawInfo
     parameter passed to this event. This is particularly usefull when the
     effect you want to achieve is based on the value of the cell's. The values
     set in this event are not stored in the grid. They are anly used for
     drawing the current cell and then forgotten again, so you need to supply
     the values each time this event is activated.

     The main difference in using this event as against setting row, column
     or cell properties such as RowColor, Col[..].Color, etc, is that when
     setting properties the property values are remembered by the grid. This
     allows you to easily set properties in advance or with a button, but
     requires more memory.}


    //Check if the OnGetDrawInfo should be carried out.
    if not chkDrawInfo.Checked then Exit;

    if TextArray[DataCol, DataRow] < 0 then
    begin
        DrawInfo.Font.Color := clRed;
        DrawInfo.Color := clAqua;
        DrawInfo.Font.Style := [fsBold];
    end;

    //if TextArray[1, DataRow] < 0 then DrawInfo.Color := clRed;
end;

procedure TForm1.chkDrawInfoClick(Sender: TObject);
begin
    //REedraw the grid. If the checkbox is checked, negative
    //numbers will be highlighted in the OnGetDrawInfo event.
    tsGrid1.Refresh;
end;

end.
