unit InfoQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ADODB;

type
  TQueryForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    CheckBox1: TCheckBox;
    StaticText1: TStaticText;
    Button2: TButton;
    StaticText2: TStaticText;
    ListView1: TListView;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    CheckBox2: TCheckBox;
    StaticText3: TStaticText;
    Edit1: TEdit;
    Button3: TButton;
    ListView2: TListView;
    StaticText4: TStaticText;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    RadioButton7: TRadioButton;
    CheckBox3: TCheckBox;
    Edit2: TEdit;
    Button4: TButton;
    ListView3: TListView;
    StaticText6: TStaticText;
    Button1: TButton;
    StaticText5: TStaticText;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryForm: TQueryForm;

implementation

uses DataModule;

{$R *.dfm}

procedure TQueryForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TQueryForm.Button3Click(Sender: TObject);
var
  Content: string;
begin
  ListView2.Items.Clear;

  with DataModuleADO.ADOQuery1 do
  begin
    Content := Edit1.Text;
    if CheckBox2.Checked then
      Content :='%'+Content +'%';
    SQL.Clear;
    if RadioButton5.Checked then
    begin
      SQL.Add('select * from Reader where ReaderID like :ReaderID');
      Parameters.ParamByName('ReaderID').value := Content;
    end;
    if RadioButton6.Checked then
    begin
      SQL.Add('select * from Reader where Name like :Name');
      Parameters.ParamByName('Name').value := Content;
    end;

    Open;

    while not Eof do
    begin
      with ListView2.Items.Add do
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

    StaticText4.Caption:= '共'+IntToStr(RecordCount)+'条记录';
    Close;
  end;
end;

procedure TQueryForm.RadioButton5Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit1.MaxLength := 10;
end;

procedure TQueryForm.RadioButton2Click(Sender: TObject);
begin
  Edit3.Text := '';
  Edit3.MaxLength := 0;
end;

procedure TQueryForm.RadioButton3Click(Sender: TObject);
begin
  Edit3.Text := '';
  Edit3.MaxLength := 0;
end;

procedure TQueryForm.RadioButton4Click(Sender: TObject);
begin
  Edit3.Text := '';
  Edit3.MaxLength := 0;
end;

procedure TQueryForm.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    Button2Click(Sender);
end;

procedure TQueryForm.Button2Click(Sender: TObject);
var
  Content : string;
begin
 try
  ListView1.Items.Clear;

  with DataModuleADO.ADOQuery1 do
  begin
    Content:=Edit3.Text;
    if CheckBox1.Checked then
      Content := '%'+Content +'%';

    SQL.Clear;
    if RadioButton1.Checked then
    begin
      SQL.Add('select * from Book where Code like :Code');
      Parameters.ParamByName('Code').value := Content;
    end;
    if RadioButton2.Checked then
    begin
      SQL.Add('select * from Book where Name like :Name');
      Parameters.ParamByName('Name').value := Content;
    end;
    if RadioButton3.Checked then
    begin
      SQL.Add('select * from Book where Press like :Press');
      Parameters.ParamByName('Concern').value := Content;
    end;
    if RadioButton4.Checked then
    begin
      SQL.Add('select * from Book where Author like :Author');
      Parameters.ParamByName('Author').value := Content;
    end;

    Open;

    while not Eof do
    begin
      with ListView1.Items.Add do
      begin
        Caption := FieldByName('Code').AsString;
        SubItems.Add(FieldByName('Name').AsString);
        SubItems.Add(FieldByName('Author').AsString);
        SubItems.Add(FieldByName('Press').AsString);
        SubItems.Add(FieldByName('OutDate').AsString);
        SubItems.Add(FieldByName('Cost').AsString);
        SubItems.Add(FieldByName('Memo').AsString);
      end;
    Next;
  end;

  StaticText2.Caption:= '共'+IntToStr(RecordCount)+'条记录';
  Close;
  end;
  except
    MessageDlg('查询失败',mtError,[mbok],0);
 end;
end;

procedure TQueryForm.RadioButton1Click(Sender: TObject);
begin
  Edit3.Text := '';
  Edit3.MaxLength := 10;
end;

procedure TQueryForm.RadioButton6Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit1.MaxLength := 0;
end;

procedure TQueryForm.Button4Click(Sender: TObject);
var
  Content : string;
begin
  try
    ListView3.Items.Clear;

    with DataModuleADO.ADOQuery1 do
    begin
      Content := Edit2.Text;
      if CheckBox3.Checked then
        Content :='%'+Content +'%';
      SQL.Clear;
      if RadioButton7.Checked then
      begin
        SQL.Add('select Reader.ReaderID, Reader.Name, Reader.Sex, Reader.IDCardNo, Lend.OutDate, Lend.Code from Lend,Reader'+
                  'where Lend.ReaderID like :ReaderID and Reader.ReaderID = Lend.ReaderID'+
                  'order by Lend.ReaderID');
        Parameters.ParamByName('ReaderID').value := Content;
     end;
     Open;

     while not Eof do
     begin
       with ListView3.Items.Add do
       begin
         Caption := FieldByName('ReaderID').AsString;
         SubItems.Add(FieldByName('Name').AsString);
         if FieldByName('Sex').AsString = '1' then
           SubItems.Add('女')
         else SubItems.Add('男');
         SubItems.Add(FieldByName('Code').AsString);
         SubItems.Add(FieldByName('OutDate').AsString);
         SubItems.Add(FloatToStr(Date-FieldByName('OutDate').AsDateTime));
         SubItems.Add(FieldByName('IDCardNo').AsString);
         if Date-FieldByName('OutDate').AsDateTime >60 then
           SubItems.Add(FloatToStr((Date-FieldByName('OutDate').AsDateTime-60)*0.1))
         else SubItems.Add('0')
       end;
       Next;
     end;
     StaticText6.Caption:= '共'+IntToStr(RecordCount)+'条记录';
     Close;
   end;
  except
    MessageDlg('查询失败',mtError,[mbok],0);
  end;
end;

end.
