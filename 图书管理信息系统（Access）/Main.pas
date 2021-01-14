unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, jpeg;

type
  TMainForm = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    BitBtn8: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    Logined:Boolean;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  MyPath:String;

const
  MyPassW='123456';

implementation

uses Book, Reader, Lend, InfoQuery;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MyPath:=ExtractFilePath(ParamStr(0));
  ShortDateFormat:='yyyy/mm/dd';
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  BookForm.Show;
end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
begin
  ReaderForm.Show;
end;

procedure TMainForm.BitBtn3Click(Sender: TObject);
begin
  LendForm.Show;
end;

procedure TMainForm.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BitBtn5Click(Sender: TObject);
begin
  QueryForm.Show;
end;

end.
