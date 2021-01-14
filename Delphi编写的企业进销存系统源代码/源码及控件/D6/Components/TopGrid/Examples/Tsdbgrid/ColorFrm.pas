unit ColorFrm;

{***************************************}
{   Top Support                         }
{   TtsDBGrid Example Program 'Colors'  }
{   Copyright (c) 1997 Top Support      }
{***************************************}

{**********************************************************************}
{ This sample program shows how to set color properties for rows and   }
{ columns and how to use the OnGetDrawInfo event to set colors.        }
{                                                                      }
{ This example allows the user to select rows and columns and to       }
{ select a color to which the selection should be set using a button.  }
{ It also demonstrates the use of the OnGetDrawInfo event. This event  }
{ allows you to set colors, fonts, alignment and word wrapping on the  }
{ fly, i.e. to change the way a cell is displayed as it is being drawn }
{ on the screen based on the cell's contents. In the FormCreate an     }
{ unbound field is added to the grid called AmountDue. The value of    }
{ this field is calculated in the OnCellLoaded event as ItemsTotal     }
{ minus AmountPaid. The check box at the bottom of the screen allows   }
{ you to toggle the color of records with an AmountDue <> 0. The color }
{ for these records is set in the OnGetDrawInfo event. This example    }
{ also uses the OnSelectChanged event to Enable/Disable the buttons    }
{ for setting colors, based on the current selection in the grid.      }
{**********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids_ts, TSGrid, TSDBGrid, StdCtrls;

type
  TForm1 = class(TForm)
    tsDBGrid1: TtsDBGrid;
    DataSource1: TDataSource;
    tblOrders: TTable;
    tblOrdersOrderNo: TFloatField;
    tblOrdersCustNo: TFloatField;
    tblOrdersSaleDate: TDateTimeField;
    tblOrdersShipDate: TDateTimeField;
    tblOrdersEmpNo: TIntegerField;
    tblOrdersShipToContact: TStringField;
    tblOrdersShipToAddr1: TStringField;
    tblOrdersShipToAddr2: TStringField;
    tblOrdersShipToCity: TStringField;
    tblOrdersShipToState: TStringField;
    tblOrdersShipToZip: TStringField;
    tblOrdersShipToCountry: TStringField;
    tblOrdersShipToPhone: TStringField;
    tblOrdersShipVIA: TStringField;
    tblOrdersPO: TStringField;
    tblOrdersTerms: TStringField;
    tblOrdersPaymentMethod: TStringField;
    tblOrdersItemsTotal: TCurrencyField;
    tblOrdersTaxRate: TFloatField;
    tblOrdersFreight: TCurrencyField;
    tblOrdersAmountPaid: TCurrencyField;
    chkAmountDue: TCheckBox;
    butRowColor: TButton;
    butColColor: TButton;
    Button3: TButton;
    ColorDialog1: TColorDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure tsDBGrid1GetDrawInfo(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var DrawInfo: TtsDrawInfo);
    procedure FormCreate(Sender: TObject);
    procedure tsDBGrid1CellLoaded(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var Value: Variant);
    procedure chkAmountDueClick(Sender: TObject);
    procedure butRowColorClick(Sender: TObject);
    procedure tsDBGrid1SelectChanged(Sender: TObject;
      SelectType: TtsSelectType; ByUser: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure butColColorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
    //Set the table active
    tblOrders.Active := True;

    //Insert an unbound column
    tsDBGrid1.InsertCol(5, 'AmountDue');
    tsDBGrid1.Col['AmountDue'].ReadOnly := True;
    tsDBGrid1.Col['AmountDue'].Width := 80;
    tsDBGrid1.Col['AmountDue'].Alignment := taRightJustify;
end;

procedure TForm1.tsDBGrid1CellLoaded(Sender: TObject; DataCol: Longint;
  DataRow: Variant; var Value: Variant);
var
    AmountDue: Currency;
begin
    {Calculate the value of the inserted unbound column as
     AmountDue = ItemsTotal - AmountPaid}

    with tsDBGrid1 do
    begin
        if Col[DataCol].FieldName = 'AmountDue' then
        begin
            //Calculate the value
            AmountDue := Col['ItemsTotal'].Field.AsFloat -
                         Col['AmountPaid'].Field.AsFloat;

            //Format the value to string. This is required. The grid
            //only accepts string values for text columns.
            Value := CurrToStrF(AmountDue, ffCurrency, 2);
        end;
    end;
end;

procedure TForm1.tsDBGrid1GetDrawInfo(Sender: TObject; DataCol: Longint;
  DataRow: Variant; var DrawInfo: TtsDrawInfo);
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
     using RowColor, Col[..].Color, etc properties the property values are
     stored by the grid. This allows you to easily set properties in advance
     or with a button, but requires more memory.}

    if not chkAmountDue.Checked then Exit;

    with tsDBGrid1 do
    begin
        //If ItemsTotal <> AmountPaid set the background color to clAqua.
        //To access the fields, use the column's Field property as indicated
        //below. This allows you to access the active record in the grid, which
        //is the record currently being drawn.
        if Col['ItemsTotal'].Field.AsFloat <> Col['AmountPaid'].Field.AsFloat then
            DrawInfo.Color := clAqua;
    end;
end;

procedure TForm1.chkAmountDueClick(Sender: TObject);
begin
    //Redraw the grid, so the color will be set in the onGetDrawInfo event
    tsDBGrid1.Refresh;
end;

procedure TForm1.butRowColorClick(Sender: TObject);
var
    Bkm: Variant;
    SelColor: TColor;
begin
    {Allows the user to select a color and then applies that color to all
     selected rows. The selected rows are looped through using the SelectedRows
     property of the grid.}

    if not ColorDialog1.Execute then Exit;

    SelColor := ColorDialog1.Color;
    with tsDBGrid1 do
    begin
        //Get the first selected rows. Selected rows are identified by bookmarks.
        //If there are no selected rows, SelectedRows.First returns Unassigned.
        Bkm := SelectedRows.First;
        while not VarIsEmpty(Bkm) do
        begin
            //Set the row color
            RowColor[Bkm] := SelColor;

            //Get the next selected row. Returns Unassigned if there are no
            //more selected rows.
            Bkm := SelectedRows.Next(Bkm);
        end;

        //Reset the selected rows.
        ResetRowProperties([prSelected]);
    end;
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
    with tsDBGrid1 do
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

procedure TForm1.tsDBGrid1SelectChanged(Sender: TObject;
  SelectType: TtsSelectType; ByUser: Boolean);
begin
    {This event is activated when selections change in the grid. It is
     used here to Enable/Disable the row and column color buttons depending
     on the current selection. The GridStatus property indicates if any rows
     or columns are selected in the grid.}

    butRowColor.Enabled := (tsDBGrid1.GridStatus = grRowSelect);
    butColColor.Enabled := (tsDBGrid1.GridStatus = grColSelect);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    //Reset the colors to their default values
    tsDBGrid1.ResetProperties([prColor]);
end;

end.

