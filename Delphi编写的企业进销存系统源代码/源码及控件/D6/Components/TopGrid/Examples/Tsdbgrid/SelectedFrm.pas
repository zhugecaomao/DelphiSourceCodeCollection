unit SelectedFrm;

{*********************************************}
{   Top Support                               }
{   TtsDBGrid Example Program 'SelectedRows'  }
{   Copyright (c) 1999 Top Support            }
{*********************************************}

{**********************************************************************}
{ This sample program shows how to loop through and process selected   }
{ rows in a data-aware TtsDBGrid.                                      }
{                                                                      }
{ This example allows the user to select rows and then calculate the   }
{ total of the AmountPaid field in the dataset for the selected rows.  }
{                                                                      }
{ In the FormCreate an unbound field is added to the grid called       }
{ AmountDue. The value of this field is calculated in the OnCellLoaded }
{ event as ItemsTotal minus AmountPaid.                                }
{**********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids_ts, Variants, TSGrid, TSDBGrid, StdCtrls, TsGridReport;

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
    butTotal: TButton;
    Label1: TLabel;
    tblCustomer: TTable;
    tblOrdersCompany: TStringField;
    osGridReport1: TosGridReport;
    procedure FormCreate(Sender: TObject);
    procedure tsDBGrid1CellLoaded(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var Value: Variant);
    procedure butTotalClick(Sender: TObject);
    procedure tsDBGrid1SelectChanged(Sender: TObject;
      SelectType: TtsSelectType; ByUser: Boolean);
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
    //Set the tables active
    tblCustomer.Active := True;
    tblOrders.Active := True;

    //Insert an unbound column
    tsDBGrid1.InsertCol(6, 'AmountDue');
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

            //Format the value to a string. This is required. The grid
            //only accepts string values for text columns.
            Value := CurrToStrF(AmountDue, ffCurrency, 2);
        end;
    end;
end;

procedure TForm1.butTotalClick(Sender: TObject);
var
    OldBkm, Bkm: Variant;
    Total: Double;
begin
    {Calculates the total of the AmountPaid field for the selected rows. The
     selected rows are looped using the grid's SelectedRows property.}

    Total := 0;
    with tsDBGrid1, tsDBGrid1.Datasource do
    begin
        Dataset.DisableControls;
        EnablePaint := False;
        try
            OldBkm := Dataset.Bookmark;

            //Get the first selected row. Selected rows are identified by bookmarks.
            //If there are no selected rows, SelectedRows.First returns Unassigned.
            Bkm := SelectedRows.First;
            while not VarIsEmpty(Bkm) do
            begin
                //Position the dataset
                Datasource.Dataset.Bookmark := Bkm;

                //Add the AmountPaid value
                Total := Total + Datasource.Dataset.FieldByName('AmountPaid').Value;

                //Get the next selected row. Returns Unassigned if there are no
                //more selected rows.
                Bkm := SelectedRows.Next(Bkm);
            end;

            //Set the dataset back to its old position
            Dataset.Bookmark := OldBkm;
        finally
            EnablePaint := True;
            Dataset.EnableControls;
        end;
    end;

    ShowMessage('Total AmountPaid is: ' + FloatToStrF(Total, ffNumber, 15, 2));
end;

procedure TForm1.tsDBGrid1SelectChanged(Sender: TObject;
  SelectType: TtsSelectType; ByUser: Boolean);
begin
    {This event is activated when selections change in the grid. It is
     used here to Enable/Disable the total color button depending
     on the current selection. The GridStatus property indicates if any rows
     or columns are selected in the grid.}

    butTotal.Enabled := (tsDBGrid1.GridStatus = grRowSelect);
end;

end.

