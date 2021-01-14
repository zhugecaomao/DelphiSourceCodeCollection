unit NBCXUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TNBCXForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NBCXForm: TNBCXForm;

implementation

uses DMUnit;

{$R *.dfm}

procedure TNBCXForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TNBCXForm.Button2Click(Sender: TObject);
begin
  Close;
  DM.MonthQuery.Close;
  DM.MonthQuery.SQL.Clear;
  DM.MonthQuery.SQL.Add('select * from KHFY');
  DM.MonthQuery.Open;
end;

procedure TNBCXForm.Button1Click(Sender: TObject);
var
s:string;
begin
  if Edit1.Text='' then
   begin
    showmessage('请输入完整的查询条件!');
    DM.MonthQuery.Close;
    DM.MonthQuery.SQL.Clear;
    DM.MonthQuery.SQL.Add('select * from KHFY');
    DM.MonthQuery.Open;
    NBCXForm.Close;
   end;
    s:=Edit1.Text;
    DM.MonthQuery.Close;
    DM.MonthQuery.SQL.Clear;
    DM.MonthQuery.SQL.Add('select * from KHFY where KHFY_YEAR='+''''+s+'''');
    DM.MonthQuery.Open;
    NBCXForm.Close;
end;

end.
