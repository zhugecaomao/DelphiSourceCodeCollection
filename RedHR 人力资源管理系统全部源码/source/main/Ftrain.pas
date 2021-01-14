unit Ftrain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, Mask, DBCtrls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit;

type
  Ttrain = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button1: TButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Button3: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    DBRichEdit1: TDBRichEdit;
    Button4: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  train: Ttrain;

implementation

uses fmain;
{$R *.dfm}

procedure Ttrain.Button1Click(Sender: TObject);
begin
  close
end;

procedure Ttrain.Button3Click(Sender: TObject);
begin
  if main.r_staffteach.RecordCount=0 then exit;
  if (main.r_staffteach.State in dsEditModes) then exit;
  if Application.MessageBox('确认要删除选择数据吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      main.r_staffteach.Delete;
      main.r_staffteach.Close;
      main.r_staffteach.Open;
    end;
end;

procedure Ttrain.Button4Click(Sender: TObject);
begin
  if (main.r_staffteach.State in dsEditModes) then exit;
  main.r_staffteach.Append;
end;

procedure Ttrain.Button2Click(Sender: TObject);
begin
  if trim(self.DBEdit1.Text)='' then
    begin
      MessageBox(handle,'培训名称错误！','错误',MB_ICONERROR or MB_OK);
      SELF.DBEdit1.SetFocus;
      exit;       
    end;
  if self.cxDBDateEdit1.Date>self.cxDBDateEdit2.Date then
    begin
      MessageBox(handle,'培训日期设置错误！','错误',MB_ICONERROR or MB_OK);
      exit;       
    end;
  if (main.r_staffteach.State in dsEditModes) then
    main.r_staffteach.Post;  
end;

end.
