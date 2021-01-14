unit Flistico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  Tlistico = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listico: Tlistico;

implementation

uses fmain, Fchartbm;

{$R *.dfm}

procedure Tlistico.Button1Click(Sender: TObject);
begin
  close
end;

procedure Tlistico.FormCreate(Sender: TObject);
var i:integer;
begin
  self.ListView1.Items.Clear;
  for i:=0 to main.Branchimage.Count-1 do
    begin
      self.ListView1.Items.Add.ImageIndex:=i;
    end;
end;

procedure Tlistico.FormDestroy(Sender: TObject);
begin
  //main.branch.Cancel;
end;

procedure Tlistico.Button2Click(Sender: TObject);
begin
  if self.ListView1.SelCount<>0 then
    chartbm.DBTree.Selected.ImageIndex:=self.ListView1.Selected.ImageIndex;
  (*main.branch.FieldByName('image').AsInteger:=self.ListView1.Selected.ImageIndex;
  main.branch.Post;
  main.branch.Refresh;   *)
  self.Close;
end;

end.
