unit admin_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ExtCtrls;

type
  TAdmin_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Admin_Form: TAdmin_Form;

implementation

uses datamodule;

{$R *.dfm}

procedure TAdmin_Form.Button1Click(Sender: TObject);
begin
adoquery1.insert;
end;

procedure TAdmin_Form.Button2Click(Sender: TObject);
begin
 adoquery1.edit;
end;

procedure TAdmin_Form.Button3Click(Sender: TObject);
begin
adoquery1.delete;
end;

procedure TAdmin_Form.Button4Click(Sender: TObject);
begin
adoquery1.prior;
end;

procedure TAdmin_Form.Button5Click(Sender: TObject);
begin
adoquery1.next;
end;

procedure TAdmin_Form.Button6Click(Sender: TObject);
begin
 adoquery1.post;
end;

procedure TAdmin_Form.Button7Click(Sender: TObject);
begin
adoquery1.close;
adoquery2.close;
close;
end;

procedure TAdmin_Form.Button8Click(Sender: TObject);
begin
adoquery2.insert;
end;

procedure TAdmin_Form.Button9Click(Sender: TObject);
begin
adoquery2.edit;
end;

procedure TAdmin_Form.Button10Click(Sender: TObject);
begin
adoquery2.delete;
end;

procedure TAdmin_Form.Button11Click(Sender: TObject);
begin
adoquery2.prior;
end;

procedure TAdmin_Form.Button12Click(Sender: TObject);
begin
adoquery2.next;
end;

procedure TAdmin_Form.Button13Click(Sender: TObject);
begin
 adoquery2.post;
end;

procedure TAdmin_Form.Button14Click(Sender: TObject);
begin
adoquery1.close;
adoquery2.close;
close;
end;

procedure TAdmin_Form.FormActivate(Sender: TObject);
begin
if not adoquery1.active then
adoquery1.open;
if not adoquery2.active then
adoquery2.open;
end;

end.
