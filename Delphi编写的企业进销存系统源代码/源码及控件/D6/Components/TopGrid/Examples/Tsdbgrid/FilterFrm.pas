unit FilterFrm;

{****************************************}
{   Top Support                          }
{   TtsDBGrid Example Program 'Filter'   }
{   Copyright (c) 1999 Top Support       }
{****************************************}

{********************************************************************}
{ This sample program shows how to filter data using two grids.      }
{                                                                    }
{ The form in this example contains two grids, one with a single row }
{ for entering a filter condition, and one for displaying the        }
{ filtered data. The columns of the single row filter grid are       }
{ aligned with the data grid at program startup, and are kept aligned}
{ using the grid's OnColResized, OnColMoved and OnTopLeftChanged     }
{ events. The data grid is attached to a TTable and displays the     }
{ records from that table. When filter values are entered for one or }
{ more fields { and the Enter key is pressed, a new filter condition }
{ is calculated and assigned to the Filter property of the TTable,   }
{ resulting in the display of the data that meets the filter         }
{ condition to be displayed.                                         }
{                                                                    }
{ Filter values for the different fields in the table can be         }
{ typed in using plain text values, or they can be combined with     }
{ comparison operators such as '>', '=>', '<' and '<='. For the      }
{ Country field, a combo drop down is included for selecting         }
{ a country from the drop down list. The combo is setup at design    }
{ time and is data-aware. It is attached to a TQuery which selects   }
{ the different countries from the main table.                       }
{********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, TSDBGrid, Grids_ts, TSGrid, TSImageList, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    grdData: TtsDBGrid;
    dsCustomers: TDataSource;
    tbCustomers: TTable;
    grdFilter: TtsDBGrid;
    qryCountries: TQuery;
    dsCountries: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure grdFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure grdDataColMoved(Sender: TObject; ToDisplayCol,
      Count: Longint; ByUser: Boolean);
    procedure grdDataColResized(Sender: TObject; RowColnr: Longint);
    procedure grdDataTopLeftChanged(Sender: TObject; OldCol: Longint;
      OldRow: Variant; NewCol: Longint; NewRow: Variant; ByUser: Boolean);
    procedure grdFilterTopLeftChanged(Sender: TObject; OldCol: Longint;
      OldRow: Variant; NewCol: Longint; NewRow: Variant; ByUser: Boolean);
    procedure grdFilterComboDropDown(Sender: TObject;
      Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant);
    procedure grdFilterComboGetValue(Sender: TObject;
      Combo: TtsDBComboGrid; GridDataCol: Longint; GridDataRow,
      ComboDataRow: Variant; var Value: Variant);
    procedure grdFilterComboRollUp(Sender: TObject; Combo: TtsDBComboGrid;
      DataCol: Longint; DataRow: Variant);
  private
    FSettingTopLeft: Boolean;
    FComboValueSelected: Boolean;

    function  GetFilter: string;
    procedure SetFilter;
    procedure InitFilterGrid;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.InitFilterGrid;
var
    I: Integer;
begin
    {Sets the widths of the columns in the filter grid grdFilter equal to those
     of the data grid grdData.}

    grdFilter.Cols := grdData.Cols;
    for I := 1 to grdFilter.Cols do
    begin
        grdFilter.Col[I].Width := grdData.Col[I].Width;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    {Initializes the grids on the form and opens the datasets.}

    FSettingTopLeft := False;
    FComboValueSelected := False;
    InitFilterGrid;
    tbCustomers.Open;
    qryCountries.Open;

    grdFilter.Cell[1,1] := '> 1500';
    grdFilter.Cell[2,1] := 'US';
    SetFilter;
end;

procedure TForm1.grdDataColMoved(Sender: TObject; ToDisplayCol,
  Count: Longint; ByUser: Boolean);
var
    ACol: Longint;
begin
    {Sets the display positions of the columns in the filter grid grdFilter
     if one or more columns in the data grid have been moved.}

    for ACol := 1 to grdData.Cols do
        grdFilter.Col[grdData.DataColnr[ACol]].DisplayCol := ACol;
end;

procedure TForm1.grdDataColResized(Sender: TObject; RowColnr: Longint);
begin
    {Resizes a column in the filter grid grdFilter if the width of
     the corresponding columns in data grid changes.}

    grdFilter.Col[RowColnr].Width := grdData.Col[RowColnr].Width;
end;

procedure TForm1.grdDataTopLeftChanged(Sender: TObject; OldCol: Longint;
  OldRow: Variant; NewCol: Longint; NewRow: Variant; ByUser: Boolean);
begin
    {Adjusts the LeftCol of the filter grid grdFilter is the LeftCol of the
     data grid changes.}

    if not FSettingTopLeft then
    begin
        FSettingTopLeft := True;
        grdFilter.LeftCol := NewCol;
        grdFilter.Update;
        FSettingTopLeft := False;
    end;
end;

procedure TForm1.grdFilterTopLeftChanged(Sender: TObject; OldCol: Longint;
  OldRow: Variant; NewCol: Longint; NewRow: Variant; ByUser: Boolean);
begin
    {Adjusts the LeftCol of the data grid grdData is the LeftCol of the filter
     grid changes.}

    if not FSettingTopLeft then
    begin
        FSettingTopLeft := True;
        grdData.LeftCol := NewCol;
        grdData.Update;
        FSettingTopLeft := False;
    end;
end;

procedure TForm1.grdFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    {Sets the new filter condition when the Enter key is hit.}

    if (Key = VK_RETURN) and not grdFilter.ComboVisible then
    begin
        SetFilter;
        Key := 0;
    end;
end;

procedure TForm1.grdFilterComboDropDown(Sender: TObject;
  Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant);
begin
    {Initialize FComboValueSelected to False to indicate that no value has been
     selected from the combo drop down list.}

    FComboValueSelected := False;
end;

procedure TForm1.grdFilterComboGetValue(Sender: TObject;
  Combo: TtsDBComboGrid; GridDataCol: Longint; GridDataRow,
  ComboDataRow: Variant; var Value: Variant);
begin
    {Sets FComboValueSelected to True to indicate that a value from the combo's
     drop down list has been selected. This is then used in the ComboRollUp
     event to set a new filter.}

    FComboValueSelected := True;
end;

procedure TForm1.grdFilterComboRollUp(Sender: TObject;
  Combo: TtsDBComboGrid; DataCol: Longint; DataRow: Variant);
begin
    {Sets the filter condition for the table if a value has been selected
     from the drop down list.}

    if FComboValueSelected then
    begin
        SetFilter;
        FComboValueSelected := False;
    end;
end;

function TForm1.GetFilter: string;
var
    I, J, K: Integer;
    SearchString: string;
    SearchStringStart: string;
    TekenFound: Boolean;
    QuoteChecked: Boolean;
    FirstCharacter: Integer;
    NumberOfQuotes: Integer;
    FieldName: string;
begin
    {Calculates the filter condition, given the values entered in the filter
     grid grdFilter.

     The filter grid has it's StoreData property set to true, so any value
     typed into the grid is automatically saved. This routine then uses the
     values to calculate the filter.}

    Result := '';
    for I := 1 to grdFilter.Cols do
    begin
        SearchString := string(grdFilter.Cell[I,1]);
        FieldName := grdData.Col[I].FieldName;
        if (SearchString <> '') and (FieldName <> '') then
        begin
            SearchStringStart := '';
            TekenFound := false;
            QuoteChecked := false;
            FirstCharacter := 1;
            NumberOfQuotes := 0;
            J := 1;
            while J <= StrLen(PChar(SearchString)) do
            begin
                if not TekenFound then
                begin
                    if Searchstring[J] <> ' ' then
                    begin
                        if not (SearchString[J] in ['<', '>', '=']) then
                        begin
                            SearchStringStart := '= ';
                            if not (dsCustomers.DataSet.FieldByName(FieldName).DataType in
                                [ftInteger, ftSmallInt, ftWord, ftDate, ftTime, ftFloat]) then
                            begin
                                if SearchString[J] <> '''' then
                                begin
                                    SearchStringStart := SearchStringStart + '''';
                                    Inc(NumberOfQuotes);
                                end;
                            end;
                            QuoteChecked := true;
                            FirstCharacter := J;
                            J := StrLen(PChar(SearchString));
                        end
                        else
                        begin
                            for K := 1 to J do
                                SearchStringStart := SearchStringStart + SearchString[K];
                        end;
                        TekenFound := true;
                    end;
                    Inc(J);
                end
                else
                begin
                    if Searchstring[J] <> ' ' then
                    begin
                        if not QuoteChecked then
                        begin
                            if not (SearchString[J] in ['<', '>', '=']) then
                            begin
                                if not (dsCustomers.DataSet.FieldByName(FieldName).DataType in
                                    [ftInteger, ftSmallInt, ftWord, ftDate, ftTime, ftFloat]) then
                                begin
                                    if SearchString[J] <> '''' then
                                    begin
                                        SearchStringStart := SearchStringStart + '''';
                                        Inc(NumberOfQuotes);
                                    end;
                                end;
                                QuoteChecked := true;
                                FirstCharacter := J;
                                J := StrLen(PChar(SearchString));
                            end
                            else
                            begin
                                SearchStringStart := SearchStringStart + SearchString[J];
                            end;
                        end;
                    end;
                    Inc(J);
                end;
            end;

            for K := FirstCharacter to StrLen(PChar(Searchstring)) do
            begin
                if SearchString[K] = '''' then Inc(NumberOfQuotes);
                SearchStringStart := SearchStringStart + SearchString[K];
            end;
            if not (dsCustomers.DataSet.FieldByName(FieldName).DataType in
                [ftInteger, ftSmallInt, ftWord, ftDate, ftTime, ftFloat]) then
            begin
                if (NumberOfQuotes mod 2) <> 0 then
                begin
                    SearchStringStart := SearchStringStart + '''';
                    Inc(NumberOfQuotes);
                end;
            end;

            if (NumberOfQuotes mod 2) <> 0 then
                SearchStringStart := SearchStringStart + '''';

            if Result <> '' then Result := Result + ' AND ';
            Result := Result + '(' + FieldName;
            Result := Result + ' ' + SearchStringStart + ')';
        end;
    end;
end;

procedure TForm1.SetFilter;
var
    FilterString: string;
    OldLeftCol: Longint;
    OldFilter: string;
begin
    {Calculates the filter condition given the filter values entered, and
     assigns the filter to the table.}

    Screen.Cursor := crHourGlass;

    OldLeftCol := grdData.LeftCol;
    grdData.EnableRedraw := false;
    OldFilter := dsCustomers.DataSet.Filter;

    FilterString := GetFilter;
    dsCustomers.DataSet.Filtered := false;
    try
        try
            dsCustomers.DataSet.Filter := Filterstring;
            dsCustomers.DataSet.Filtered := true;
            dsCustomers.DataSet.First;
            grdData.LeftCol := OldLeftCol;
        finally
            grdData.EnableRedraw := true;
        end;
    except
        dsCustomers.DataSet.Filter := OldFilter;
        dsCustomers.DataSet.Filtered := true;
        dsCustomers.DataSet.First;
        grdData.Rows := dsCustomers.DataSet.RecordCount;

        grdData.LeftCol := OldLeftCol;
        grdData.EnableRedraw := true;
        ShowMessage('Filter is incorrect. Please try again.');
    end;

    grdData.Refresh;
    Screen.Cursor := crDefault;
end;

end.
