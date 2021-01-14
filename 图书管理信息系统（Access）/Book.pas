unit Book;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, DBCtrls, Mask;

type
  TBookForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Bevel2: TBevel;
    StaticText1: TStaticText;
    CodeEdit: TEdit;
    NameEdit: TEdit;
    StaticText3: TStaticText;
    AuthorEdit: TEdit;
    PressEdit: TEdit;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    CostEdit: TEdit;
    Memo1: TMemo;
    StaticText7: TStaticText;
    StaticText6: TStaticText;
    OutTimeEdit: TEdit;
    StaticText2: TStaticText;
    Button1: TButton;
    Button2: TButton;
    TabSheet2: TTabSheet;
    Button4: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Bevel1: TBevel;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText8: TStaticText;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBName: TDBEdit;
    DBAuthor: TDBEdit;
    DBPress: TDBEdit;
    DBOutDate: TDBEdit;
    DBCost: TDBEdit;
    DBMemo: TDBMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  BookForm: TBookForm;

implementation

uses DataModule;

{$R *.dfm}

procedure TBookForm.Button1Click(Sender: TObject);
begin
  if Length(CodeEdit.Text)<> 10 then
  begin
    MessageDlg('书号不正确',mtError,[mbok],0);
    CodeEdit.SetFocus;
    Exit;
  end;

  with DataModuleADO.ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select Code from Book where Code =:Code');
    Parameters.ParamByName('Code').Value :=CodeEdit.Text;
    Open;
    if RecordCount <> 0 then
    begin
      MessageDlg('书号<'+CodeEdit.Text+'>已经存在',mtError,[mbok],0);
      CodeEdit.SetFocus;
      Exit;
    end;
    Close;
  end;

  try
    with DataModuleADO.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('insert into book(Code,Name,Author,Press,OutDate,Cost)'+
                ' values (:Code,:Name,:Author,:Press,:OutDate,:Cost)');
      Parameters.ParamByName('Code').value := CodeEdit.Text;
      Parameters.ParamByName('Name').value := NameEdit.Text;
      Parameters.ParamByName('Author').value := AuthorEdit.Text;
      Parameters.ParamByName('Press').value := PressEdit.Text;
      try
        Parameters.ParamByName('OutDate').value := StrToDate(OutTimeEdit.Text);
      except
        MessageDlg('参数<出版时间>设置错误',mtError,[mbok],0);
        Exit;
      end;
      try
        Parameters.ParamByName('Cost').value := StrToFloat(CostEdit.Text);
      except
        MessageDlg('参数<价格>设置错误',mtError,[mbok],0);
        Exit;
      end;
      ExecSQL;
    end;
    TabSheet1Show(Sender);
  except
    MessageDlg('入库出错',mtError,[mbok],0);
  end;
end;

procedure TBookForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TBookForm.TabSheet1Show(Sender: TObject);
begin
  CodeEdit.SetFocus;
  CodeEdit.SelectAll;
  NameEdit.Text := '';
  AuthorEdit.Text := '';
  OutTimeEdit.Text := '';
  CostEdit.Text := '';
  PressEdit.Text := '';
  Memo1.Lines.Clear;
end;

procedure TBookForm.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TBookForm.Button3Click(Sender: TObject);
begin
  try
    DataModuleADO.ADOTable1.Post;
    DataModuleADO.ADOTable1.Active:=False;
  except
    MessageDlg('保存出错',mtError,[mbok],0);
  end;
  ComboBox1.SetFocus;
end;

procedure TBookForm.TabSheet2Show(Sender: TObject);
var
  i : integer;
begin
  ComboBox1.Items.Clear;
  with DataModuleADO.ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select Code  from book ');
    Open;
    First;
    for i:=0 to RecordCount-1 do
    begin
      ComboBox1.Items.Add(FieldbyName('Code').AsString);
      Next;
    end;
    Close;
  end;
end;

procedure TBookForm.ComboBox1Change(Sender: TObject);
begin
  if Length(ComboBox1.Text) = 10 then
  begin
    try
      with DataModuleADO.ADOTable1 do
      begin
        TableName:='book';

        DBOutDate.DataField:= 'OutDate';
        DBName.DataField:= 'Name';
        DBAuthor.DataField:= 'Author';
        DBPress.DataField:= 'Press';
        DBCost.DataField:= 'Cost';
        DBMemo.DataField:= 'Memo';

        Active:=True;
        Locate('code',ComboBox1.Text,[]);
        Edit;
      end;
    except
      MessageDlg('数据操作出错',mtError,[mbok],0);
    end;
  end;
end;

procedure TBookForm.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    ComboBox1Change(Sender);
end;

end.
