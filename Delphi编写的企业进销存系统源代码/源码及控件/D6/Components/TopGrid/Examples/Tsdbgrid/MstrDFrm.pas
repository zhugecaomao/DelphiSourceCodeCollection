unit MstrDFrm;

{*****************************************}
{   Top Support                           }
{   TtsDBGrid Example Program 'MstrDetl'  }
{   Copyright (c) 1997 Top Support        }
{*****************************************}

{***********************************************************************}
{ This sample program is an example of a master/detail relationship     }
{ between two tables using the TtsDBGrid as a data bound control for    }
{ displaying and editing data in database tables. In addition, it shows }
{ how to use an unbound column in the grid and how to format the        }
{ display value of a field from within the grid's OnCellLoaded event.   }
{                                                                       }
{ The program has been created using the standard Delphi TTable and     }
{ TDataSource components to provide access to the data in the Customer  }
{ and Order tables on disk and to display and edit the data using the   }
{ TtsDBGrid. The tables are connected to the TtsDBGrids via their       }
{ DataSource properties and are set active in the FormCreate of the     }
{ Form.                                                                 }
{                                                                       }
{ An unbound column, labeled 'Days since last invoice', is added in     }
{ the FormCreate and its value is computed in the OnCellLoaded event    }
{ of the grid. The LastInvoiceDate field of the Customer table is       }
{ formatted in the OnCellLoaded event to display the date without its   }
{ corresponding time part.                                              }
{***********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, ExtCtrls, DBCtrls, Grids_ts, TSGrid, TSDBGrid;

type
  TForm1 = class(TForm)
    grCustomer: TtsDBGrid;
    grOrder: TtsDBGrid;
    DBNavigator1: TDBNavigator;
    dsCustomer: TDataSource;
    tbCustomer: TTable;
    tbOrder: TTable;
    dsOrder: TDataSource;
    DBNavigator2: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure grCustomerCellLoaded(Sender: TObject; DataCol: Longint;
      DataRow: Variant; var Value: Variant);
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
    {Set the tables active and add an unbound field}

    tbCustomer.Active := true;
    tbOrder.Active := true;

    //Add an unbound column to the master grid
    grCustomer.InsertCol(grCustomer.Cols + 1, 'Days since last invoice');
    grCustomer.Col[grCustomer.Cols].ControlType := ctText;
    grCustomer.Col[grCustomer.Cols].Width := 115;
    grCustomer.Col[grCustomer.Cols].ReadOnly := true;
    grCustomer.Col[grCustomer.Cols].Alignment := taRightJustify;

    //Set the alignment for the LastInvoiceDate to right justify
    grCustomer.Col['LastInvoiceDate'].Alignment := taRightJustify
end;

procedure TForm1.grCustomerCellLoaded(Sender: TObject; DataCol: Longint;
  DataRow: Variant; var Value: Variant);
begin
    {Compute the value for the unbound column 'Days since last invoice' and
     remove the time from the 'LastInvoiceDate' datetime field}

    if grCustomer.Col[DataCol].FieldName = 'Days since last invoice' then
        //compute 'Days since last invoice'
        Value := IntToStr(Trunc(Now - grCustomer.Col['LastInvoiceDate'].Field.AsDateTime))

    else if grCustomer.Col[DataCol].FieldName = 'LastInvoiceDate' then
        //format the LastInvoiceDate field
        Value := DateToStr(Trunc(grCustomer.Col['LastInvoiceDate'].Field.AsDateTime));
end;

end.
