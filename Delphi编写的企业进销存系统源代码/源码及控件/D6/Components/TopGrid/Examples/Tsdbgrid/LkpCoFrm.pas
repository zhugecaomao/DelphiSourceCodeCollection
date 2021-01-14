unit LkpCoFrm;

{*****************************************}
{   Top Support                           }
{   TtsDBGrid Example Program 'LkpCombo'  }
{   Copyright (c) 1997-1999 Top Support   }
{*****************************************}

{**********************************************************************}
{ This sample program shows how to use a combo box for a lookup field  }
{ in the TtsDBGrid.                                                    }
{                                                                      }
{ In this example the grid is attached to the orders table in the      }
{ DBDEMOS database. In the orders table a lookup field for the company }
{ name is included from the customer table, using the CustNo field to  }
{ link the two tables.                                                 }
{                                                                      }
{ The CustNo field is set invisible in the orders table so it does     }
{ not show up in the grid. For the lookup company name a combo box is  }
{ defined to allow the user to select a company from all the available }
{ companies in the customer table. The combo box is attached to the    }
{ customer table. Two seperate TTables are used for the lookup field   }
{ and the combo box. This is not a requirement, but it allows the      }
{ values in the combo box to be sorted on company name rather than on  }
{ the CustNo field, making it easier to find a comany in the list. You }
{ can however use a single table for both if you want.                 }
{                                                                      }
{ In the FormCreate the tables are set active and the combo is set for }
{ the company name lookup field. In the OnComboInit event the combo is }
{ initialised. This event is activated each time the combo box is      }
{ about to be displayed in a cell for the first time. When the user    }
{ selects a value from the combo box the OnComboGetValue is activated. }
{ The event handler for this event determines the CustNo of the        }
{ selected customer and changes the orders table CustNo field to that  }
{ value.                                                               }
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
    tblCustomer: TTable;
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
    tblOrdersLkpCustomer: TStringField;
    tblCustomerCustNo: TFloatField;
    tblCustomerCompany: TStringField;
    tblCustomerAddr1: TStringField;
    tblCustomerAddr2: TStringField;
    tblCustomerCity: TStringField;
    tblCustomerState: TStringField;
    tblCustomerZip: TStringField;
    tblCustomerCountry: TStringField;
    tblCustomerPhone: TStringField;
    tblCustomerFAX: TStringField;
    tblCustomerTaxRate: TFloatField;
    tblCustomerContact: TStringField;
    tblCustomerLastInvoiceDate: TDateTimeField;
    DataSource2: TDataSource;
    tblCustomerCombo: TTable;
    tblCustomerComboCustNo: TFloatField;
    tblCustomerComboCompany: TStringField;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tsDBGrid1ComboInit(Sender: TObject; Combo: TtsDBComboGrid;
      DataCol: Longint; DataRow: Variant);
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
    //Open the tables
    tblCustomer.Active := True;
    tblCustomerCombo.Active := True;
    tblOrders.Active := True;

    //Set the combo box in the lookup field column 'Company'.
    tsDBGrid1.Col['Company'].ButtonType := btCombo;
    tsDBGrid1.Col['Company'].DropDownStyle := ddDropDownList;
end;

procedure TForm1.tsDBGrid1ComboInit(Sender: TObject; Combo: TtsDBComboGrid;
  DataCol: Longint; DataRow: Variant);
begin
    {Initialize the combo box. This event is activated each time the
     combo is about to be displayed for the first time in a particular
     cell. At this point, the combo is already set as an auto lookup combo,
     with its datasource attached to the lookup table of the lookup field.}

    //Set the number of visible rows and columns
    Combo.DropDownRows := 5;
    Combo.DropDownCols := 2;

    //Set the return value column
    Combo.ValueCol := 1;

    //Set autosearch on to automatically locate the current value in the
    //drop down list
    Combo.AutoSearch := asTop;

    //Indicate that the data is sorted on the return value column for better
    //performance
    Combo.ValueColSorted := True;

    //Add an additional column at display position 1. Column nr will be 2.
    Combo.Grid.InsertCol(1, 'CustNo');
    Combo.Grid.Col[2].Is3D := True;
    Combo.Grid.Col[2].Width := 40;

    //Set the combo box's grid properties
    Combo.Grid.HeadingOn := True;
    Combo.Grid.RowBarOn := True;
end;

end.
