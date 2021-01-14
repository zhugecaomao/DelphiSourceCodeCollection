unit Fshowpic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxImage, cxDBEdit;

type
  Tshowpic = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Image1: TImage;
    DBEdit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  showpic: Tshowpic;

implementation

uses fmain;
{$R *.dfm}

procedure Tshowpic.Button1Click(Sender: TObject);
begin
  main.r_staffpict.Cancel;
  close
end;

procedure Tshowpic.Button3Click(Sender: TObject);
begin
  if self.OpenDialog1.Execute then
    begin
      self.Image1.Picture.LoadFromFile(self.OpenDialog1.FileName);
    end;
end;

procedure Tshowpic.Button2Click(Sender: TObject);
begin
  if self.DBEdit1.Text='' then
    begin
      MessageBox(handle,'图片说明不能为空！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  main.r_staffpict.FieldByName('memo').AsString:=self.DBEdit1.Text;
  main.r_staffpict.FieldByName('staffid').AsString:=main.staffinfo.fieldbyname('r_staffinfo.id').AsString;
  main.r_staffpict.FieldByName('pict').Assign(self.Image1.Picture);
  main.r_staffpict.Post;
  main.r_staffpict.Close;
  main.r_staffpict.Open;
  self.Close;
end;

end.
