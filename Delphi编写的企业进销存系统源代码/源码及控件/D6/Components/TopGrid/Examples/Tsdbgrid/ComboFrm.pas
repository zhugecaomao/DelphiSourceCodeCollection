unit ComboFrm;

{***************************************}
{   Top Support                         }
{   TtsDBGrid Example Program 'Combos'  }
{   Copyright (c) 1997-1999 Top Support }
{***************************************}

{**********************************************************************}
{ This sample program shows how to use combo boxes in the TtsDBGrid.   }
{ It demonstrates a combo box bound to a datasource and a combo box    }
{ not bound to a datasource. In addition, an unbound column containing }
{ a picture is added to the grid.                                      }
{                                                                      }
{ The FormCreate method contains the code for initializing the grid    }
{ and for adding the unbound column. The tsDBGrid1ComboInit event      }
{ handler sets up the unbound combo box each time the combo is about   }
{ to be displayed. The data-aware combo box for the 'Category' field   }
{ is setup at design time. The tsDBGrid1ComboCellLoaded event handler  }
{ supplies the data for the unbound combo box.                         }
{**********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids_ts, TSGrid, TSDBGrid, StdCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    tsDBGrid1: TtsDBGrid;
    DataSource1: TDataSource;
    Table1: TTable;
    DataSource2: TDataSource;
    Query1: TQuery;
    Table1SpeciesNo: TFloatField;
    Table1Category: TStringField;
    Table1Common_Name: TStringField;
    Table1SpeciesName: TStringField;
    Table1Lengthcm: TFloatField;
    Table1Length_In: TFloatField;
    Table1Notes: TMemoField;
    Table1Graphic: TGraphicField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tsDBGrid1ComboInit(Sender: TObject; Combo: TtsDBComboGrid;
      DataCol: Longint; DataRow: Variant);
    procedure tsDBGrid1ComboCellLoaded(Sender: TObject;
      Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant;
      var Value: Variant);
    procedure CreateBitmaps;
    procedure tsDBGrid1CellLoaded(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var Value: Variant);
    procedure tsDBGrid1CellEdit(Sender: TObject; DataCol: Longint;
      DataRow: Variant; ByUser: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Bmp: Array [0..2] of TBitmap;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
    Table1.Active := True;
    Query1.Active := True;

    //Add combo to Length (cm) column
    TSDBGrid1.Col['Length (cm)'].Buttontype := btCombo;
    TSDBGrid1.Col['Length (cm)'].DropDownStyle := ddDropDown;

    //Set Graphic column readonly so the column will be skipped when editing
    TSDBGrid1.Col['Graphic'].Readonly := true;
    TSDBGrid1.Col['Graphic'].Width := 80;

    //Add unbound field to bound grid
    TSDBGrid1.InsertCol ( 1, 'Unbound picture');
    TSDBGrid1.Col['Unbound picture'].ControlType := ctPicture;
    TSDBGrid1.Col['Unbound picture'].Readonly := true;

    //Create bitmaps for display in picture column
    CreateBitmaps;
end;

procedure TForm1.tsDBGrid1ComboInit(Sender: TObject; Combo: TtsDBComboGrid;
  DataCol: Longint; DataRow: Variant);
begin
    {Initialise the Length (cm) Combo at runtime using the OnComboInit event. The
     Category combo is setup at design time and need no further initialisation.}

    if tsDBGrid1.Col[DataCol].FieldName = 'Length (cm)' then
    begin
        Combo.Grid.HeadingOn := true;
        Combo.Autosearch := asTop;
        Combo.CompareType := ctCaseInsensitive;
        Combo.DropDownRows := 5;

        Combo.DropDownCols := 2;
        Combo.ValueCol := 1;
        Combo.Grid.Rows := 50;
        Combo.Grid.Cols := 2;
        Combo.Grid.Col[1].Heading := 'Length (cm)';
        Combo.Grid.Col[1].ControlType := ctText;

        Combo.Grid.Col[2].Heading := 'Picture';
        Combo.Grid.Col[2].ControlType := ctPicture;
        Combo.Grid.Col[2].Width := 50;
    end;
end;

procedure TForm1.tsDBGrid1ComboCellLoaded(Sender: TObject;
  Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant;
  var Value: Variant);
begin
    //Display the combo values for the unbound combo for 'Length (cm)'
    if (tsDBGrid1.Col[tsDBGrid1.CurrentCell.DataCol].FieldName = 'Length (cm)') then
    begin
        if DataCol = 1 then
            Value := IntToStr( 10 * DataRow )
        else
        begin
            Combo.Grid.StretchPicture := false;

            if 10 * DataRow < 50 then
                Value := BitmapToVariant(Bmp[0])
            else if 10 * DataRow < 100 then
                Value := BitmapToVariant(Bmp[1])
            else
                Value := BitmapToVariant(Bmp[2]);
        end
    end;

end;

procedure TForm1.CreateBitmaps;
begin
    Bmp[0] := TBitmap.Create;
    Bmp[0].LoadFromFile('Red.bmp');
    Bmp[1] := TBitmap.Create;
    Bmp[1].LoadFromFile('Green.bmp');
    Bmp[2] := TBitmap.Create;
    Bmp[2].LoadFromFile('Yellow.bmp');
end;

procedure TForm1.tsDBGrid1CellLoaded(Sender: TObject; DataCol: Longint;
  DataRow: Variant; var Value: Variant);
begin
    if (tsDBGrid1.Col[DataCol].FieldName = 'Graphic') then
    begin
        //Set the drawing properties required
        tsDBGrid1.StretchPicture := true;
        tsDBGrid1.CenterPicture := true;
    end
    else if (tsDBGrid1.Col[DataCol].FieldName = 'Unbound picture') then
    begin
        //Set the drawing properties required
        tsDBGrid1.StretchPicture := false;
        tsDBGrid1.CenterPicture := true;

        //Set the Unbound Picture depending on the 'Length (cm)' field
        if tsDBGrid1.Col['Length (cm)'].Field.AsInteger < 50 then
            Value := BitmapToVariant(Bmp[0])
        else if tsDBGrid1.Col['Length (cm)'].Field.AsInteger < 100 then
            Value := BitmapToVariant(Bmp[1])
        else
            Value := BitmapToVariant(Bmp[2]);
    end;

end;

procedure TForm1.tsDBGrid1CellEdit(Sender: TObject; DataCol: Longint;
  DataRow: Variant; ByUser: Boolean);
begin
    //The following code changes the unbound picture immediately when the
    //'Length (cm)' field changes. Try typing 500 in a cell and see the
    //picture changing at 5, 50 and 500. If you don't include this code
    //the picture will only change when the user leaves the cell.

    if (tsDBGrid1.Col[tsDBGrid1.CurrentCell.DataCol].FieldName = 'Length (cm)') then
    begin
        //First update the field in the dataset because the CellLoaded for the
        //Unbound picture sets the picture depending on the 'Length (cm)' field
        //In the dataset
        Table1.FieldByName('Length (cm)').AsString := tsDBGrid1.CurrentCell.Value;

        //Now make sure that the Unbound picture is invalidated so the CellLoaded
        //will be called again.
        tsDBGrid1.CellInvalidate (tsDBGrid1.Col['Unbound picture'].DisplayCol, tsDBGrid1.DisplayRownr[DataRow]);
    end;
end;

end.
