unit testDBCal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, DB, ADODB, Grids, SampleCalendar, DBCalendar, ExtCtrls,
  DBCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    DBCalendar1: TDBCalendar;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure refreshLabel;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.refreshLabel;
begin
   Label1.Caption := '当前日期为' + IntToStr(DBCalendar1.Year ) + '年'
    + IntToStr(DBCalendar1.Month ) + '月' + IntToStr(DBCalendar1.Day) + '日';  
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  refreshLabel ;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  DBCalendar1.PrevYear ;
  refreshLabel ;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DBCalendar1.PrevMonth ;
  refreshLabel ;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DBCalendar1.NextMonth ;
  refreshLabel ;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  DBCalendar1.NextYear ;
  refreshLabel ;
end;

end.
