unit SortFrm;

{***************************************}
{   ObjectSight                         }
{   TtsDBGrid Example Program 'Sorting' }
{   Copyright (c) 2002 ObjectSight      }
{***************************************}

{**********************************************************************}
{ This sample program shows how to use heading buttons to sort the     }
{ data displayed in the grid.                                          }
{                                                                      }
{ The grid on the form has its HeadingButton property set to hbCell,   }
{ indicating that the full heading of each cell acts as a button when  }
{ the user clicks on it. Each click causes an OnHeadingClick event,    }
{ which allows you to sort the data when the user clicks on a column   }
{ heading. The grid itself does not automatically sort the data for    }
{ you. This has to be programmed in the OnHeadingClick event.          }
{                                                                      }
{ This example uses a TQuery to create a query with an order by clause }
{ to sort the data in the order indicated by the column heading the    }
{ user clicks on. If more than one heading is clicked, the data is     }
{ sorted on multiple fields from left to right in the display order of }
{ the columns. In the OnHeadingClick event the procedure SortData is   }
{ called to sort the data. SortData is also called from OnColMoved     }
{ event to rearrange the sort order according to the display order of  }
{ the columns. In the FormCreate some initialisation takes place.      }
{**********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, DBTables, Grids_ts, TSGrid, TSDBGrid, TsGridReport,
  ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    tsDBGrid1: TtsDBGrid;
    DataSource1: TDataSource;
    qryCustomer: TQuery;
    osGridReport1: TosGridReport;
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbPaper: TComboBox;
    cbRows: TComboBox;
    Label5: TLabel;
    edCols: TEdit;
    UpDown1: TUpDown;
    rgMode: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure SortData;
    procedure tsDBGrid1ColMoved(Sender: TObject; ToDisplayCol,
      Count: Longint; ByUser: Boolean);
    procedure tsDBGrid1HeadingClick(Sender: TObject; DataCol: Longint);
    procedure cbPaperClick(Sender: TObject);
    procedure cbRowsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rgModeClick(Sender: TObject);
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
    //Set the query active
    qryCustomer.Active := True;

    //Set the FieldState to fsCustomized to prevent the columns from being
    //removed and added each the TQuery qryCustomer is set from active to
    //inactive and back to active again when changing the query string.
    tsDBGrid1.FieldState := fsCustomized;
end;

procedure TForm1.tsDBGrid1HeadingClick(Sender: TObject; DataCol: Longint);
begin
    {When the user clicks on the heading, set the SortPicture of the column
     and sort the data}

    with tsDBGrid1 do
    begin
        if Col[DataCol].SortPicture = spNone then
            Col[DataCol].SortPicture := spDown
        else if Col[DataCol].SortPicture = spDown then
            Col[DataCol].SortPicture := spUp
        else
            Col[DataCol].SortPicture := spNone;
    end;

    tsDBGrid1.EnablePaint := False;
    try
        SortData;
    finally
        tsDBGrid1.EnablePaint := True;
    end;
end;

procedure TForm1.SortData;
var
    I: Longint;
    Query, Order: string;
    DataCol: Longint;
begin
    {Sort the data by creating a new query string based on the sort order of
     indicated by the SortPicture of the columns. Sorting is from left to
     right in terms of the display order of the columns on the screen.}

    Order := '';
    with tsDBGrid1 do
    begin
        for I := 1 to Cols do
        begin
            DataCol := DataColnr[I];
            if Col[DataCol].SortPicture = spUp then
                Order := Order + ', ' + Col[DataCol].FieldName + ' DESC'
            else if Col[DataCol].SortPicture = spDown then
                Order := Order + ', ' + Col[DataCol].FieldName;
        end;
    end;

    Query := 'Select * From Orders';
    if Order <> '' then Query := Query + ' Order By ' + Copy(Order, 3, Length(Order) - 2);

    if qryCustomer.SQL.Text <> Query then
    begin
        Screen.Cursor := crHourGlass;
        qryCustomer.Active := False;
        qryCustomer.SQL.Text := Query;
        qryCustomer.Active := True;
        Screen.Cursor := crDefault;
    end;
end;

procedure TForm1.tsDBGrid1ColMoved(Sender: TObject; ToDisplayCol,
  Count: Longint; ByUser: Boolean);
begin
    {If a column is moved, make sure the sort order is left to right again.}
    tsDBGrid1.EnablePaint := False;
    try
        SortData;
    finally
        tsDBGrid1.EnablePaint := True;
    end;
end;

procedure TForm1.cbPaperClick(Sender: TObject);
begin
  if cbPaper.Text = 'Letter' then
     osGridReport1.PaperSize := psLetter
  else
     osGridReport1.PaperSize := psLegal;
end;

procedure TForm1.cbRowsClick(Sender: TObject);
begin
  if cbRows.Text = 'Normal' then
     osGridReport1.PrintLineMode := lmNone
  else if cbRows.Text = 'Banded' then
     osGridReport1.PrintLineMode := lmBanded
  else
     osGridReport1.PrintLineMode := lmLine;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  tsDbGrid1.PrintCols := StrToInt(edCols.Text);
  tsDbGrid1.PrintPreview;
end;

procedure TForm1.rgModeClick(Sender: TObject);
begin
  if (rgMode.ItemIndex = 0) then
  begin
    tsDbGrid1.HeadingButton := hbCell;

  end
  else
  begin
    tsDbGrid1.HeadingButton := hbNone;
  end;
end;

end.
