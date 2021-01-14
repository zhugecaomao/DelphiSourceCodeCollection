unit RecIdFrm;

{****************************************}
{   Top Support                          }
{   TtsDBGrid Example Program 'RecIds'   }
{   Copyright (c) 1997 Top Support       }
{****************************************}

{********************************************************************}
{ This sample program shows how to use record ids and how to access  }
{ selected rows in the TtsDBGrid.                                    }
{                                                                    }
{ Record ids provide an alternative for identifying records in the   }
{ TtsDBGrid. Normally, records are identified using bookmarks. The   }
{ TtsDBGrid allows you use any field or combination of fields for    }
{ identifying records and setting record properties.                 }
{                                                                    }
{ Using record ids allows you to keep row and cell properties in     }
{ place even when the order of the data changes. While sorting       }
{ would change the bookmarks, it will not change the record ids.     }
{ Another advantage is that with some databases a bookmark can get   }
{ quite large. In that case using bookmarks will save memory.        }
{********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids_ts, TSGrid, TSDBGrid, DB, DBTables, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    dsCustomer: TDataSource;
    tbCustomer: TTable;
    grCustomer: TtsDBGrid;
    Button2: TButton;
    Label2: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure grCustomerGetRecordID(Sender: TObject; DataRow: Variant;
      var RecordID: Variant);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
    {Set the TTables active.}
    tbCustomer.Active := True;
end;

procedure TForm1.grCustomerGetRecordID(Sender: TObject; DataRow: Variant;
  var RecordID: Variant);
begin
    {Use the OnGetRecordID to return the record id of a record to the grid.
     This event is activated each time the grid needs a record id for a record.
     This is either when a record is displayed on the screen or when the
     BookmarkRecordID property is used.

     To return the record id, use the grid's column field property, as shown
     below, to return the value of a field (or combination of fields if
     required). The field property accesses the field of the current active
     record, which is the record for which a record id is needed. (The grid
     places its internal dataset on the active record just before this event
     is activated.)}

    RecordID := grCustomer.Col['CustNo'].Field.AsVariant;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
    Bkm, RecID: Variant;
begin
   {Set the color of all selected rows}

    with grCustomer do
    begin
        {Get the bookmark of the first selected record. If there are no
         selected records, the returned value is Unassigned.}
        Bkm := SelectedRows.First;
        while not VarIsEmpty(Bkm) do
        begin
            {Get the RecordID corresponding to the bookmark and place it in
             the SelectedIds StringList.}
            RecID := BookmarkRecordID[Bkm];

            //Set the color of the record to aqua
            RowColor[RecID] := clAqua;

            {Get the bookmark of the next selected record. If there are no
             more selected records, Unassigned is returned.}
            Bkm := SelectedRows.Next(Bkm);
        end;
    end;

    grCustomer.ResetRowProperties([prSelected]);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    if tbCustomer.IndexName = '' then
        tbCustomer.IndexName := 'ByCompany'
    else
        tbCustomer.IndexName := '';

    tbCustomer.First;
end;

end.
