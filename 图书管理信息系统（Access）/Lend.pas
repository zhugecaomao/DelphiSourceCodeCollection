unit Lend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, DB, ADODB;

type
  TOwnBook = record
    Code : string;
    Name : string;
    Price : string;
    OwnDays : integer;
  end;

  TLendForm = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    Panel1: TPanel;
    Bevel2: TBevel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    ReaderIDEdit: TEdit;
    StaticText11: TStaticText;
    OwnTimeEdit: TEdit;
    StaticText12: TStaticText;
    FineEdit: TEdit;
    StaticText10: TStaticText;
    TotalEdit: TEdit;
    Panel3: TPanel;
    StaticText0: TStaticText;
    ComboBox1: TComboBox;
    DBName: TDBEdit;
    DBAuthor: TDBEdit;
    DBPress: TDBEdit;
    DBOutDate: TDBEdit;
    DBCost: TDBEdit;
    DBMemo: TDBMemo;
    DataSource1: TDataSource;
    tempADOQuery1: TADOQuery;
    tempADOQuery2: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ReaderIDEditChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CanLand : boolean;
  end;

var
  LendForm: TLendForm;

implementation

uses DataModule, OwnBook;

{$R *.dfm}

procedure TLendForm.FormShow(Sender: TObject);
var
  i : integer;
begin
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

procedure TLendForm.ComboBox1Change(Sender: TObject);
var
  FDate : TDate;
  OwnTime : TDate;
begin
  ReaderIDEdit.Text:='';
  TotalEdit.Text:='';
  OwnTimeEdit.Text:='';
  FineEdit.Text:='';

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
        if not Locate('code',ComboBox1.Text,[])then
        begin
          MessageDlg('没有数据或数据库操作失败',mtError,[mbok],0);
          Panel1.Visible := False;
          Exit;
        end;
        Panel1.Visible := True;
      end;
    except
      MessageDlg('数据操作出错',mtError,[mbok],0);
    end;

    try
      with DataModuleADO.ADOQuery1 do
      begin
        SQL.Clear;
        SQL.Add('select * from Lend where Code = :Code');
        Parameters.ParamByName('Code').Value := ComboBox1.Text;
        Open;

        if RecordCount <> 0 then
        begin
          FDate := FieldByName('OutDate').AsDateTime;
          OwnTime := Date - FDate;
          OwnTimeEdit.Text := FloatToStr(OwnTime);
          ReaderIDEdit.Text := FieldByName('ReaderID').AsString;

          StaticText10.Visible := True;

          OwnTimeEdit.Visible := True;

          if StrToInt(OwnTimeEdit.Text)>60 then
          begin
            FineEdit.Visible := True;
            StaticText11.Visible := True;
            FineEdit.Text := FloatToStr((StrToInt(OwnTimeEdit.Text)-60)*0.1);
          end;
          Button1.Enabled := False;
          Button2.Enabled := True;
          Button2.SetFocus;
          Close;
        end
        else begin
               ReaderIDEdit.SetFocus;
               Button1.Enabled := True;
               Button2.Enabled := False;
             end;
      end;
    except
      ReaderIDEdit.SetFocus;
    end;
  end;
end;

procedure TLendForm.Button1Click(Sender: TObject);
var
  tempOwnBook : TOwnBook;
begin
  if  ReaderIDEdit.Text <>'' then
  begin
  try
    with DataModuleADO.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('select Code from Lend where ReaderID =:ReaderID');
      Parameters.ParamByName('ReaderID').Value := ReaderIDEdit.Text;
      Open;
      CanLand := True;
      OwnBookForm.ListView1.Items.Clear;
      while not Eof do
      begin
        with tempADOQuery1 do
        begin
          SQL.Clear;
          SQL.Add('select * from Book where Code =:Code');
          Parameters.ParamByName('Code').Value :=
                      DataModuleADO.ADOQuery1.FieldByName('Code').AsString;
          Open;
          tempOwnBook.Code := FieldByName('Code').AsString;
          tempOwnBook.Name :=  FieldByName('Name').AsString;
          tempOwnBook.Price :=  FieldByName('Cost').AsString;

          try
            with tempADOQuery2 do
            begin
              SQL.Clear;
              SQL.Add('select * from Lend where Code = :Code and ReaderID =:ReaderID');
              Parameters.ParamByName('Code').Value :=
                     DataModuleADO.ADOQuery1.FieldByName('Code').AsString;
              Parameters.ParamByName('ReaderID').Value := ReaderIDEdit.Text;
              Open;
              tempOwnBook.OwnDays := Round(Date-FieldByName('OutDate').AsDateTime);
              Close;
            end;
          except
            tempOwnBook.OwnDays := 0;
          end;
          Close;
        end;

        if tempOwnBook.OwnDays >60 then
        begin
          with OwnBookForm.ListView1.Items.Add do
          begin
            Caption := tempOwnBook.Code;
            SubItems.Add(tempOwnBook.Name);
            SubItems.Add(tempOwnBook.Price);
            SubItems.Add(IntToStr(tempOwnBook.OwnDays));
            SubItems.Add(FloatToStr((tempOwnBook.OwnDays-60)*0.1));
          end;
          CanLand := False;
        end;
      Next;
    end;
      Close;
    end;
  except
    CanLand := False;
  end;

  if CanLand = False then
  begin
    OwnBookForm.Caption := ReaderIDEdit.Text+'有以下书籍没按时归还';
    OwnBookForm.ShowModal;
    Exit;
  end;

  try
    with DataModuleADO.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('insert into Lend'+'  values(:Code,:ReaderID,:OutDate)');
      Parameters.ParamByName('Code').Value := ComboBox1.Text;
      Parameters.ParamByName('ReaderID').Value:=ReaderIDEdit.Text;
      Parameters.ParamByName('OutDate').Value := DateToStr(now);
      ExecSQL;
    end;
  except
    MessageDlg('借书不成功',mtError,[mbok],0);
  end;

  Panel1.Visible := False;
  end
  else begin
         ShowMessage('请输入借书证号！');
         ReaderIDEdit.Setfocus;
       end;
end;

procedure TLendForm.ReaderIDEditChange(Sender: TObject);
begin
  if Length(ReaderIDEdit.Text) = 10 then
  begin
    with DataModuleADO.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('select ReaderID from Reader where ReaderID =:ReaderID');
      Parameters.ParamByName('ReaderID').Value := ReaderIDEdit.Text;
      Open;
      if  RecordCount =0 then
      begin
        Button1.Enabled := False;
        MessageDlg('借书证号<'+ReaderIDEdit.Text+'>不存在',mtError,[mbok],0);
        Close;
        Exit;
      end;
      Close;
    end;

    try
      with DataModuleADO.ADOQuery1 do
      begin
        SQL.Clear;
        SQL.Add('select Count(ReaderID) from Lend where ReaderID =:ReaderID');
        Parameters.ParamByName('ReaderID').Value := ReaderIDEdit.Text;
        Open;
        TotalEdit.Text :=IntToStr(Fields[0].Value);
        Close;
      end;
    except
      TotalEdit.Text :='0';
    end;

    Button2.Enabled:=False;
    Button1.Enabled := True;
    Button1.SetFocus;
  end;
end;

procedure TLendForm.Button2Click(Sender: TObject);
begin
  try
    with DataModuleADO.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('delete from Lend where Code =:Code');
      Parameters.ParamByName('Code').Value := ComboBox1.Text;
      ExecSQL;
      Close;
    end;
  except
    MessageDlg('还书不成功',mtError,[mbok],0);
  end;

  ReaderIDEdit.Text:='';
  TotalEdit.Text:='';
  OwnTimeEdit.Text:='';
  FineEdit.Text:='';
  Panel1.Visible := False;
end;

procedure TLendForm.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
    ComboBox1Change(Sender);
end;

procedure TLendForm.Button3Click(Sender: TObject);
begin
  Close;
end;

end.
