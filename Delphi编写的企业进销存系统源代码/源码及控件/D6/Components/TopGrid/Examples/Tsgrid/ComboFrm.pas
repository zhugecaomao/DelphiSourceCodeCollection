unit ComboFrm;

{********************************************}
{   Top Support                              }
{   TtsGrid Example Program 'Combos'         }
{   Copyright (c) 1997-1999 Top Support      }
{********************************************}

{**********************************************************************}
{ This sample program shows how to use a combo box and buttons in the  }
{ TtsGrid.                                                             }
{                                                                      }
{ The FormCreate method contains the code for initializing the TtsGrid.}
{ The grid contains two columns with a combo box. The ButtonType for   }
{ both columns is set to btCombo at design time. The first combo, in   }
{ the second column of the grid, has been setup at design time using   }
{ the grid's component editor. The second combo, in the third column,  }
{ is setup using the OnComboInit event below. The OnComboInit event    }
{ handler initializes the combo box each time the combo is about to    }
{ be displayed. The OnComboCellLoaded event handler supplies the data  }
{ for the second combo box. The data for the first combo has been      }
{ entered at design time by setting the combo's StoreData property to  }
{ True and then typing in the values.                                  }
{                                                                      }
{ In addition to the combo boxes, the grid also contains two columns   }
{ with a normal button. When one of the buttons is pressed, the        }
{ OnButtonDown event is activated and pops up a form with a message.   }
{**********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids_ts, TSGrid, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    tsGrid1: TtsGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure InitData;
    procedure tsGrid1ComboCellLoaded(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint; var Value: Variant);
    procedure tsGrid1ComboInit(Sender: TObject; Combo: TtsComboGrid;
      DataCol, DataRow: Longint);
    procedure tsGrid1ButtonDown(Sender: TObject; DataCol,
      DataRow: Longint);
    procedure tsGrid1StartCellEdit(Sender: TObject; DataCol,
      DataRow: Longint; var Cancel: Boolean);  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
    NumberOfRows = 40;

var
  Form1: TForm1;
  Form2: TForm;
  tsGrid2: TtsGrid;
  butOK, butCancel: TButton;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
    I: Integer;
begin
    {Initialize the main grid on the form}

    //Setting grid properties
    tsGrid1.Rows := NumberOfRows;

    //See StartCellEdit event how editing is disallowed

    //Set column headings
    for I := 1 to tsGrid1.Cols do
        if tsGrid1.Col[I].Heading = '' then
            tsGrid1.Col[I].Heading := 'Column ' + IntToStr(I);

    //Initialize the data in the grid
    InitData;
end;

procedure TForm1.InitData;
var
    I, J: Integer;
begin
    {Assign the initial values to the Cell property}

    for I := 1 to tsGrid1.Cols do
        for J := 1 to tsGrid1.Rows do
            tsGrid1.Cell[I,J] := IntToStr(I) + ', ' + IntToStr(J);
end;

procedure TForm1.tsGrid1ComboCellLoaded(Sender: TObject;
  Combo: TtsComboGrid; DataCol, DataRow: Longint; var Value: Variant);
begin
    {Supply the data for each cell of the grid of the combo box. The DataCol
     and DataRow refer to the column and row of the combo's grid.}

    if tsGrid1.CurrentDataCol = 3 then
        Value := 'Combo ' + IntToStr(DataCol) + ', ' + IntToStr(DataRow);
end;

procedure TForm1.tsGrid1ComboInit(Sender: TObject; Combo: TtsComboGrid;
  DataCol, DataRow: Longint);
begin
    {Initialize the combo box in the third column. This event, the OnComboInit
     event, is only activated when the combo is displayed in a different cell
     than the cell the combo was last displayed in. The OnComboDropDown, which
     is not used in this example program, is activated each time the combo is
     about to be shown, whether in the same or another cell.}

    if DataCol = 3 then
    begin
        //Set the number of rows displayed to 5 and the return value column to 1
        Combo.DropDownRows := 5;
        Combo.ValueCol := 1;

        //Set AutoSearch on so user input or drop down causes automatic positioning
        Combo.AutoSearch := asTop;

        //Set the number of columns displayed to 2
        Combo.DropDownCols := 2;
        Combo.Grid.Cols := 2;
        Combo.Grid.HeadingOn := False;
        Combo.Grid.RowBarOn := False;
        Combo.Grid.Rows := 20;
    end;
end;

procedure TForm1.tsGrid1ButtonDown(Sender: TObject; DataCol,
  DataRow: Longint);
begin
    {Activate a dialog box. }

    if tsGrid1.Col[DataCol].ButtonType <> btCombo then
        ShowMessage ('User clicked on button in cell '
                    + IntToStr(DataCol) + ', ' + IntToStr(DataRow));
end;

procedure TForm1.tsGrid1StartCellEdit(Sender: TObject; DataCol,
  DataRow: Longint; var Cancel: Boolean);
begin
    {Prevent cell editing in the fifth column.} 
    if DataCol = 5 then Cancel := true;
end;

end.
