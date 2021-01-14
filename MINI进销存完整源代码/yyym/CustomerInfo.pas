unit CustomerInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons,CustomerRep,
  ExtCtrls;

type
  TCustomerForm = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    BtnFirst: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure BtnFirstClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerForm: TCustomerForm;

implementation

{$R *.dfm}


procedure TCustomerForm.BtnFirstClick(Sender: TObject);
begin
    Table1.First;
end;

procedure TCustomerForm.BitBtn1Click(Sender: TObject);
begin
   Table1.last;
end;

procedure TCustomerForm.BitBtn2Click(Sender: TObject);
begin
   Table1.Next;
end;

procedure TCustomerForm.BitBtn3Click(Sender: TObject);
begin
   Table1.Prior;
end;

procedure TCustomerForm.BitBtn4Click(Sender: TObject);
begin
   Table1.Refresh;
end;

procedure TCustomerForm.BitBtn5Click(Sender: TObject);
begin
  Table1.Insert;
end;

procedure TCustomerForm.BitBtn6Click(Sender: TObject);
begin
  Table1.Delete;
end;

procedure TCustomerForm.BitBtn7Click(Sender: TObject);
begin
  Table1.Post;
end;

procedure TCustomerForm.BitBtn8Click(Sender: TObject);
begin
      Close;

end;

procedure TCustomerForm.BitBtn9Click(Sender: TObject);
begin
     Application.CreateForm(TForm1, Form1);
     CustomerRep.Form1.QuickRep1.Preview;
end;

procedure TCustomerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

end.
