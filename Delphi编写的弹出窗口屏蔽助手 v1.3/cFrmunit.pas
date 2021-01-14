unit cFrmunit;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    function IsValidGUID(Astr: string):boolean;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
  uses MainFrm;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if Assigned(Form1.ListView1.selected) then
  begin
    if not IsValidGUID(Edit2.Text) then
    begin
      ShowMessage('CLSID格式不正确');
      Edit2.SetFocus;
    end else if Edit1.Text = '' then
    begin
      ShowMessage('请输入名称');
      Edit1.SetFocus;
    end
    else
    begin
      with Form1.ListView1.Selected do
      begin
        Caption := Edit1.Text;
        SubItems[0] := Edit2.Text;
      end;
      close;
    end;
  end
  else begin
    if not IsValidGUID(Edit2.Text) then
    begin
      ShowMessage('CLSID格式不正确');
      Edit2.SetFocus;
    end else if Edit1.Text = '' then
    begin
      ShowMessage('请输入名称');
      Edit1.SetFocus;
    end
    else begin
      With Form1.ListView1.Items.Add do
      begin
        Caption := Edit1.Text;
        SubItems.Add(Edit2.Text);
      end;
      close;
    end;
  end;
end;

function TForm2.IsValidGUID(Astr: string):boolean;
// 检查Astr是否合法的GUID格式
var
  s: string;
  guid1: TGUID;
begin
  s := '{'+Astr+'}';
  result := false;
  try
    guid1 := StringToGUID(s);
    result := true;
  except
  end;
end;

end.
