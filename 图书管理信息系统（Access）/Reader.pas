unit Reader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TReaderForm = class(TForm)
    GroupBox3: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox4: TGroupBox;
    Edit3: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Button2: TButton;
    Button1: TButton;
    ListView1: TListView;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var
  ReaderForm: TReaderForm;

implementation

uses DataModule;

{$R *.dfm}

procedure TReaderForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TReaderForm.Button4Click(Sender: TObject);
var
  i : integer;
  Checked : integer;
begin
  for i := ListView1.Items.Count -1 downto 0 do
    if ListView1.Items[i].Selected then
    try
      try
        with DataModuleADO.ADOQuery1 do
        begin
          SQL.Clear;
          SQL.Add('select Code from Lend  where ReaderID =:ReaderID ');
          Parameters.ParamByName('ReaderID').Value := ListView1.Items[i].Caption;
          Open;
          if RecordCount = 0 then
             Checked := IDYES
          else begin
                 if MessageDlg('此读者还有图书没有归还，是否删除?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 begin
                   SQL.Clear;
                   SQL.Add('delete from Lend where ReaderID=:ReaderID');
                   Parameters.ParamByName('ReaderID').Value := ListView1.Items[i].Caption;
                   ExecSQL;
                   Checked := IDYES;
                 end
                 else Checked := IDNO;
               end;
          Close;
        end;
      except
        Checked := IDNO;
      end;

      if Checked = IDYES then
      begin
        with DataModuleADO.ADOQuery1 do    // delete reader
        begin
          SQL.Clear;
          SQl.Add('delete from Reader where ReaderID=:ReaderID');
          Parameters.ParamByName('ReaderID').Value :=ListView1.Items[i].Caption;
          ExecSQL;
        end;
        ListView1.Items.Delete(i);
      end else
          if Checked = IDNO then
             Exit;
    except
      MessageDlg('删除<'+ListView1.Items[i].Caption+'>出错',mtError,[mbok],0);
    end;
end;

procedure TReaderForm.Button3Click(Sender: TObject);
begin
  try
    with DataModuleADO.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('select * from Reader order by ReaderID');
      Open;

      ListView1.Items.Clear;
      while not Eof do
      begin
        with ListView1.Items.Add do
        begin
          Caption := FieldByName('ReaderID').AsString;
          SubItems.Add(FieldByName('Name').AsString);
          if FieldByName('Sex').AsString = '1' then
            SubItems.Add('女')
          else SubItems.Add('男');
          SubItems.Add(FieldByName('IDCardNo').AsString);
        end;
        Next;
      end;
      Close;
    end;
  except
    ListView1.Items.Clear;
    MessageDlg('刷新出错',mtError,[mbok],0);
  end;
end;

procedure TReaderForm.RadioButton1Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  ComboBox1.ItemIndex := 0;
end;

procedure TReaderForm.Button2Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    if Length(Edit1.Text)<> 10 then
    begin
      MessageDlg('读者借书证号不正确',mtError,[mbok],0);
      Exit;
    end;
    
    with DataModuleADO.ADOQuery1 do
    begin
      SQL.Clear;
      SQl.Add('select ReaderID from Reader where ReaderID=:ReaderID');
      Parameters.ParamByName('ReaderID').value := Edit1.Text;
      Open;
      if  RecordCount <> 0 then
      begin
        MessageDlg('借书证号<'+Edit1.Text+'>已经存在',mtError,[mbok],0);
        Exit;
      end;
      Close;
    end;

    try
      with DataModuleADO.ADOQuery1 do
      begin
        SQL.Clear;
        SQl.Add('insert into Reader(ReaderID,Name,Sex,IDCardNo) '+
              'values(:ReaderID,:ReaderName,:Sex,:IDCardNo)');
        Parameters.ParamByName('ReaderID').Value := Edit1.Text;
        Parameters.ParamByName('ReaderName').Value := Edit2.Text;
        Parameters.ParamByName('Sex').Value := IntToStr(ComboBox1.ItemIndex);
        Parameters.ParamByName('IDCardNo').Value := Edit3.Text;
        ExecSQL;
      end;
    except
      MessageDlg('添加<'+Edit1.Text+'>失败',mtError,[mbok],0);
      Exit;
    end;
  end;

  if RadioButton2.Checked then
  begin
    if Length(Edit1.Text)<> 10 then
    begin
      MessageDlg('读者借书证号不正确',mtError,[mbok],0);
      Exit;
    end;
    try
      with DataModuleADO.ADOQuery1 do
      begin
        SQL.Clear;
        SQl.Add('update Reader set Name=:ReaderName,Sex=:Sex,IDCardNo=:IDCardNo '+
                ' where ReaderID= :ReaderID');
        Parameters.ParamByName('ReaderID').Value := Edit1.Text;
        Parameters.ParamByName('ReaderName').Value := Edit2.Text;
        Parameters.ParamByName('Sex').Value := IntToStr(ComboBox1.ItemIndex);
        Parameters.ParamByName('IDCardNo').Value := Edit3.Text;
        ExecSQL;
      end;
    except
      MessageDlg('修改<'+Edit1.Text+'>失败',mtError,[mbok],0);
      Exit;
    end;
  end;

  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  ComboBox1.ItemIndex := 0;
end;

procedure TReaderForm.ListView1Click(Sender: TObject);
var
  i : integer;
begin
 for i :=0 to ListView1.Items.Count-1 do
   if ListView1.Items[i].Selected then
   begin
     RadioButton2.Checked:=True;

     Edit1.Text:= ListView1.Items[i].Caption;
     Edit2.Text:=ListView1.Items[i].SubItems.Strings[0];
     if ListView1.Items[i].SubItems.Strings[1]='男' then
       ComboBox1.ItemIndex:=0
     else ComboBox1.ItemIndex:=1;
     Edit3.Text:=ListView1.Items[i].SubItems.Strings[2];
   end;
end;

end.
