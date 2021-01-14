unit KHFYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, TFlatComboBoxUnit, Grids, DBGrids, AAFont,
  AACtrls, TFlatButtonUnit, ExtCtrls,DB, TFlatPanelUnit, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppCache, ppDB, ppProd, ppReport, ppEndUsr,
  ppComm, ppRelatv, ppDBPipe;

type
  TKHFYForm = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    FlatPanel2: TFlatPanel;
    AALabel45: TAALabel;
    AALabel46: TAALabel;
    AALabel47: TAALabel;
    AALabel48: TAALabel;
    AALabel49: TAALabel;
    AALabel50: TAALabel;
    AALabel51: TAALabel;
    AALabel58: TAALabel;
    AALabel52: TAALabel;
    AALabel59: TAALabel;
    AALabel54: TAALabel;
    AALabel53: TAALabel;
    AALabel56: TAALabel;
    AALabel55: TAALabel;
    AALabel57: TAALabel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    FlatComboBox1: TFlatComboBox;
    FlatComboBox2: TFlatComboBox;
    FlatComboBox3: TFlatComboBox;
    FlatComboBox4: TFlatComboBox;
    FlatComboBox5: TFlatComboBox;
    FlatComboBox6: TFlatComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit7: TEdit;
    Edit8: TEdit;
    FlatButton7: TFlatButton;
    FlatComboBox7: TFlatComboBox;
    FlatComboBox8: TFlatComboBox;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline2: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLine20: TppLine;
    ppShape7: TppShape;
    ppShape6: TppShape;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppShape5: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel12: TppLabel;
    ppLine3: TppLine;
    ppLabel13: TppLabel;
    ppLine8: TppLine;
    ppLine12: TppLine;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel23: TppLabel;
    ppLine2: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine11: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine21: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline3: TppDBPipeline;
    Edit4: TEdit;
    AALabel1: TAALabel;
    Edit5: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton6Click(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure FlatButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox8KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
  private
    YEAR,YUE,WW:word;
    { Private declarations }
  public
    { Public declarations }

  end;

  const
  digits:array[0..9] of string=('零','壹','贰','叁','肆','伍','陆','柒','捌','玖');
  poses:array[1..14] of string=('仟','佰','拾','亿','仟','佰','拾','万','仟','佰','拾','元','角','分');
  illegals:array[1..8,1..2] of string=(
   ('零亿','亿'),
   ('零万','万'),
   ('零仟','零'),
   ('零佰','零'),
   ('零拾','零'),
   ('零元','元'),
   ('零角','零'),
   ('零分','')
   );


var
  KHFYForm: TKHFYForm;

  function MoneyUpcap(V:currency):string;

implementation


uses DMUnit, KHFYQueryUnit, CallPrint, PrintUnit, MainUnit, BangZhuUnit;

{$R *.dfm}

function MoneyUpcap(V:currency):string;
var
  i:integer;
  j:integer;
  s:string;
begin
  Result := '';
  if V=0 then
  Exit;
  s:=formatfloat('0',V*100);
  while pos('00',s)<>0 do
  s[pos('00',s)]:=' ';
  s:=stringofchar(' ',14-length(s))+s;
  for i:=1 to length(s) do
  if (s[i]=' ') and (i in [4,8,12]) then
   result:=result+poses[i]
   else if s[i] in ['0','1','2','3','4','5','6','7','8','9'] then
   begin
    j:=ord(s[i])-ord('0');
    result:=result+digits[j]+poses[i];
   end;
   for i:=1 to 8 do
     while pos(illegals[i,1],result)<>0 do
     begin
      j:=pos(illegals[i,1],result);
      delete(result,j,4);
      insert(illegals[i,2],result,j);
     end;
     if copy(result,1,2)='亿' then
     result:=copy(result,3,length(result));
     if copy(result,1,2)='万' then
      result:=copy(result,3,Length(result));
     if copy(result,1,2)='元' then
     result:=copy(result,3,length(result));
     if copy(result,length(result)-1,2)<>'分' then
  result:=result+'整';
end;

procedure TKHFYForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure TKHFYForm.FlatButton6Click(Sender: TObject);
begin
close;
end;

procedure TKHFYForm.FlatButton5Click(Sender: TObject);
begin
  KHFYQueryForm:=TKHFYQueryForm.Create(application);
  KHFYQueryForm.ShowModal;
end;

procedure TKHFYForm.FlatButton7Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  PrintFile:=5;
  PrintForm:=TPrintForm.Create(application);
  PrintForm.Show;
end;

procedure TKHFYForm.FormCreate(Sender: TObject);
var
  i:integer;
begin
  with DM.YWYQuery do
    begin
    Close;
    SQL.Clear;
    SQL.Add('select * from YWY_XX');
    Open;
    end;
  with DM.KHFYQuery do
    begin
    Close;
    SQL.Clear;
    SQL.Add('select * from KHFY');
    Open;
    end;
 // if DM.KHFYQuery.Active=false then
  // Dm.KHFYQuery.Active:=true;
   decodedate(date,YEAR,YUE,ww);
  // if DM.YWYQuery.Active=false then
   //  DM.YWYQuery.Active:=true;
     with DM.YWYQuery do
     while not DM.YWYQuery.Eof do
     begin
     FlatComBoBox6.Items.Add(DM.YWYQuery.FieldByName('YWYNAME').AsString);
     DM.YWYQuery.Next;
     end;
   //if DM.CD_XXQuery.Active=false then
   // Dm.CD_XXQuery.Active:=true;
   with DM.CD_XXQuery do
     begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CD_XX');
      Open;
     end;
    with DM.CD_XXQuery do
    begin
    while  not DM.CD_XXQuery.Eof do
    begin
      if Flatcombobox7.Items.IndexOf(DM.CD_XXQuery.FieldByName('CD_ADDRESS').AsString)=-1 then
        begin
          FlatComBoBox7.Items.Add(DM.CD_XXQuery.FieldByName('CD_ADDRESS').AsString);
        end;
      if Flatcombobox8.Items.IndexOf(DM.CD_XXQuery.FieldByName('CD_BEGIN').AsString)=-1 then
        begin
          FlatComBoBox8.Items.Add(DM.CD_XXQuery.FieldByName('CD_BEGIN').AsString);
        end;
       DM.CD_XXQuery.Next;
    end;
    end;
   // if DM.FhxxQuery.Active=false then
   //  DM.FhxxQuery.Active:=true;
    with DM.FhxxQuery do
      begin
        Close;
        SQl.Clear;
        SQl.Add('select * from FHXX');
        Open;
      end;
     with DM.FhxxQuery do
     begin
     while not DM.FhxxQuery.Eof do
     begin
     FlatComBoBox1.Items.Add(DM.FhxxQuery.FieldByName('FH_GONGSI').AsString);
     FlatComBoBox2.Items.Add(DM.FhxxQuery.FieldByName('FH_NAME').AsString);
     DM.FhxxQuery.Next;
     end;
     end;
end;

procedure TKHFYForm.FlatButton4Click(Sender: TObject);
var
DJ,DJ1,TT:real;
Profit:Real;
HH,HH1,HH2,HH3:real;
begin
  Profit:=0;
  if (Edit6.Text='') or (FlatComBoBox1.Text='') or (FlatComBoBox2.Text='') then
  begin
   showmessage('数据不完整请输入完整数据!');
   Exit;
  end;
  if (DM.KHFYQuery.State=dsinsert) or (DM.KHFYQuery.State=dsedit) then
  try
   with DM.kFyQuery do
   begin
   close;
   sql.clear;
   sql.add('select CD_PRICE from CD_XX where CD_NAME='''+FlatCombobox1.Text+''' and CD_ADDRESS='''+FlatComBoBOx7.text+
   '''and CD_BEGIN='''+FlatComBOBox8.text+''' and CD_TYTK='''+FlatComBOBox4.text+
   '''and CD_BOX='''+FlatComBoBox3.text+'''and CD_YWY='''+Flatcombobox6.text+'''');
   open;
   DJ:=DM.kfyquery.fieldbyname('CD_PRICE').AsCurrency;
   if DJ=0 then
     begin
       showmessage('没有与此相对应的数据,请到客户信息表中录入数据!');
       Exit;
     end;
   if (FlatComBoBOx3.Text='40') or (FlatCOmBoBox3.Text='40HC') then
     begin
       TT:=DJ*Strtoint(Edit6.Text);
     end;
   if FlatComBoBox3.Text='20' then
     begin
     if strtoint(Edit6.Text)=1 then
       begin
         TT:=DJ;
       end;
     if Strtoint(Edit6.Text) mod 2=0 then
       begin
         with DM.KFY1Query do
           begin
             Close;
             SQL.Clear;
             sql.add('select CD_PRICE from CD_XX where CD_NAME='''+Flatcombobox1.Text+''' and  CD_ADDRESS='''+FlatComBoBOx7.text+
             '''and CD_BEGIN='''+FlatComBOBox8.text+''' and CD_TYTK='''+FlatComBOBox4.text+
             '''and CD_BOX='''+'20X2'+''' and CD_YWY='''+Flatcombobox6.text+'''');
             Open;
             DJ1:=DM.KFY1Query.FieldByName('CD_PRICE').AsCurrency;
             if DJ1=0 then
               begin
                 showmessage('没有与此相对应的数据,请到客户信息表中录入数据!');
                 Exit;
               end;
             end;
             TT:=Strtoint(Edit6.Text)/2*DJ1;
       end;
       if (strtoint(Edit6.Text) mod 2<>0) and (strtoint(Edit6.text)<>1) then
         begin
            with DM.KFY1Query do
           begin
             Close;
             SQL.Clear;
             sql.add('select CD_PRICE from CD_XX where CD_NAME='''+Flatcombobox1.Text+''' and CD_ADDRESS='''+FlatComBoBOx7.text+
             '''and CD_BEGIN='''+FlatComBOBox8.text+''' and CD_TYTK='''+FlatComBOBox4.text+
             '''and CD_BOX='''+'20X2'+''' and CD_YWY='''+Flatcombobox6.text+'''');
             Open;
             DJ1:=DM.KFY1Query.FieldByName('CD_PRICE').AsCurrency;
             if DJ1=0 then
               begin
                 showmessage('没有与此相对应的数据,请到客户信息表中录入数据!');
                 Exit;
               end;
             end;
             TT:=(Strtoint(Edit6.Text)-1)/2*DJ1+DJ;
         end;
     end;
     with DM.ADOQuery1 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('select HY_TIT from HY_FYXX where HY_TD='''+Edit1.text+'''');
         open;
         HH:=FieldByName('HY_TIT').AsCurrency;
       end;
     with DM.ADOQuery2 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('select CD_TIT from CD_FYXX where CD_ID='''+Edit1.text+'''');
         open;
         HH1:=FieldByName('CD_TIT').AsCurrency;
       end;
     with DM.ADOQuery3 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('select DL_TiT from DL_FYXX where DL_ID='''+Edit1.text+'''');
         open;
         HH2:=FieldByName('DL_TiT').AsCurrency;
       end;
     with DM.ADOQuery4 do
       begin
         Close;
         SQl.Clear;
         SQL.Add('select OTHER_TIT from OTHER_FYXX where OTHER_ID='''+Edit1.text+'''');
         open;
         HH3:=FieldByName('OTHER_TIT').AsCurrency;
       end;
       Profit:=HH+HH1+HH2+HH3;
   end;
    DM.KHFYQuery.FieldByName('KHFY_ID').AsString:=Edit1.Text;
    DM.KHFYQuery.FieldByName('KHFY_NAME').AsString:=FlatComBoBox1.Text;
    DM.KHFYQuery.FieldByName('KHFY_CALL').AsString:=FlatComBoBox2.Text;
    DM.KHFYQuery.FieldByName('KHFY_CHAN').AsString:=Edit2.Text;
    DM.KHFYQuery.FieldByName('KHFY_HUO').AsString:=Edit3.Text;
    DM.KHFYQuery.FieldByName('KHFY_TYADD').AsString:=FlatComBoBox7.Text;
    DM.KHFYQuery.FieldByName('KHFY_MUDI').AsString:=FlatComBoBox8.Text;
    DM.KHFYQuery.FieldByName('KHFY_BOX').AsString:=FlatComBoBox3.Text;
    DM.KHFYQuery.FieldByName('KHFY_MDG').AsString:=Edit5.Text;
    DM.KHFYQuery.FieldByName('KHFY_NUM').AsString:=Edit6.Text;
    DM.KHFYQuery.FieldByName('KHFY_DCTK').AsString:=FlatComBoBox4.Text;
    DM.KHFYQuery.FieldByName('KHFY_YWY').AsString:=FlatComBoBox6.Text;
    DM.KHFYQuery.FieldByName('KHFY_JSZT').AsString:=FlatComBoBox5.Text;
    DM.KHFYQuery.FieldByName('KHFY_TYSJ').AsString:=datetostr(Datetimepicker1.Date);
    DM.KHFYQuery.FieldByName('KHFY_YUE').AsString:=inttostr(YUE);
    DM.KHFYQuery.FieldByName('KHFY_YEAR').AsString:=inttostr(YEAR);
    Edit7.Text:=Floattostr(TT);
    DM.KHFYQuery.FieldByName('KHFY_TIT').AsFloat:=strtofloat(Edit7.Text);
    Edit4.Text:=MoneyUpcap(StrtoFloat(Edit7.Text));
    DM.KHFYQuery.FieldByName('KHFY_LIRUNDAXIE').AsString :=Edit4.Text;
    Edit8.Text:=Floattostr(strtofloat(edit7.Text)-profit);
    DM.KHFYQuery.FieldByName('KHFY_LIRONG').AsCurrency:=strtofloat(Edit8.Text);
    DM.KHFYQuery.Post;
  except
  showmessage('操作有误保存失败!');
  end;
  Edit1.Color:=clwindow;
  Flatcombobox1.Color:=clwindow;
  Flatcombobox2.Color:=clwindow;
  Flatcombobox4.Color:=clwindow;
  Flatcombobox3.Color:=clwindow;
  Flatcombobox5.Color:=clwindow;
  Flatcombobox6.Color:=clwindow;
  Flatcombobox7.Color:=clwindow;
  Flatcombobox8.Color:=clwindow;
  Edit2.Color:=clwindow;
  Edit3.Color:=clwindow;
  edit5.Color:=clwindow;
  Edit6.Color:=clwindow;
  DateTimePicker1.Color:=clwindow;
end;

procedure TKHFYForm.FlatButton1Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.KHFYQuery.state=dsbrowse then
  Edit1.Color:=clmoneygreen;
  edit2.Color:=clmoneygreen;
  edit3.Color:=clmoneygreen;
  edit6.Color:=clmoneygreen;
  Flatcombobox1.Color:=clmoneygreen;
  Flatcombobox2.Color:=clmoneygreen;
  Flatcombobox3.Color:=clmoneygreen;
  Flatcombobox4.Color:=clmoneygreen;
  edit5.Color:=clmoneygreen;
  Flatcombobox5.Color:=clmoneygreen;
  Flatcombobox6.Color:=clmoneygreen;
  Flatcombobox7.Color:=clmoneygreen;
  Flatcombobox8.Color:=clmoneygreen;
  Datetimepicker1.Color:=clmoneygreen;
  edit1.SetFocus;
  DM.KHFYQuery.Append;
  
end;

procedure TKHFYForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.KHFYQuery.RecordCount=0 then
   begin
    showmessage('表中无数据,无法修改!');
    exit;
   end;
   if DM.KHFYQuery.State=dsbrowse then
   begin
      Edit1.Color:=clmoneygreen;
  edit2.Color:=clmoneygreen;
  edit3.Color:=clmoneygreen;
  edit6.Color:=clmoneygreen;
  edit5.Color:=clmoneygreen;
  Flatcombobox1.Color:=clmoneygreen;
  Flatcombobox2.Color:=clmoneygreen;
  Flatcombobox3.Color:=clmoneygreen;
  Flatcombobox4.Color:=clmoneygreen;
  Flatcombobox5.Color:=clmoneygreen;
  Flatcombobox6.Color:=clmoneygreen;
  Flatcombobox7.Color:=clmoneygreen;
  Flatcombobox8.Color:=clmoneygreen;
  Datetimepicker1.Color:=clmoneygreen;
  edit1.SetFocus;
  DM.KHFYQuery.Edit;
   end;
end;

procedure TKHFYForm.FlatButton3Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.KHFYQuery.RecordCount=0 then
   begin
   showmessage('表中无数据无法删除!');
   Exit;
   end;
   if Application.MessageBox('是否删除数据!','系统提示',mb_yesno)=mryes then
    try
    DM.KHFYQuery.Delete;
    except
     showmessage('操作有误,删除失败!');
    end;
end;

procedure TKHFYForm.DBGrid1CellClick(Column: TColumn);
begin
    Edit1.Text:=DM.KHFYQuery.FieldByName('KHFY_ID').AsString;
    FlatComBoBox1.ItemIndex:=FlatComBoBOx1.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_NAME').AsString);
    FlatComBoBox2.ItemIndex:=FlatComBoBOx2.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_CALL').AsString);
    Edit2.Text:=DM.KHFYQuery.FieldByName('KHFY_CHAN').AsString;
    Edit3.Text:=DM.KHFYQuery.FieldByName('KHFY_HUO').AsString;
    Edit5.Text:=DM.KHFYQuery.FieldByName('KHFY_MDG').AsString;
    FlatComBoBox7.ItemIndex:=FlatcomBoBox7.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_TYADD').AsString);
    FlatComBoBox8.ItemIndex:=FlatComBoBOx8.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_MUDI').AsString);
    FlatComBoBox3.ItemIndex:=FlatComBoBOx3.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_BOX').AsString);
    Edit6.Text:=DM.KHFYQuery.FieldByName('KHFY_NUM').AsString;
    FlatComBoBox4.ItemIndex:=FlatComBoBOx4.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_DCTK').AsString);
    FlatComBoBox6.ItemIndex:=FlatComBoBOx6.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_YWY').AsString);
    FlatComBoBox5.ItemIndex:=FlatComBoBOx5.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_JSZT').AsString);
    Datetimepicker1.Date:=strtodate(DM.KHFYQuery.FieldByName('KHFY_TYSJ').AsString);
    Edit7.Text:=Floattostr(DM.KHFYQuery.FieldByName('KHFY_TIT').AsFloat);
    Edit8.Text:=Floattostr(DM.KHFYQuery.FieldByName('KHFY_LIRONG').AsFloat);
end;

procedure TKHFYForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Edit1.Text:=DM.KHFYQuery.FieldByName('KHFY_ID').AsString;
    FlatComBoBox1.ItemIndex:=FlatComBoBOx1.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_NAME').AsString);
    FlatComBoBox2.ItemIndex:=FlatComBoBOx2.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_CALL').AsString);
    Edit2.Text:=DM.KHFYQuery.FieldByName('KHFY_CHAN').AsString;
    Edit3.Text:=DM.KHFYQuery.FieldByName('KHFY_HUO').AsString;
    Edit5.Text:=DM.KHFYQuery.FieldByName('KHFY_MDG').AsString;
    FlatComBoBox7.ItemIndex:=FlatcomBoBox7.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_TYADD').AsString);
    FlatComBoBox8.ItemIndex:=FlatComBoBOx8.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_MUDI').AsString);
    FlatComBoBox3.ItemIndex:=FlatComBoBOx3.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_BOX').AsString);
    Edit6.Text:=DM.KHFYQuery.FieldByName('KHFY_NUM').AsString;
    FlatComBoBox4.ItemIndex:=FlatComBoBOx4.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_DCTK').AsString);
    FlatComBoBox6.ItemIndex:=FlatComBoBOx6.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_YWY').AsString);
    FlatComBoBox5.ItemIndex:=FlatComBoBOx5.Items.IndexOf(DM.KHFYQuery.FieldByName('KHFY_JSZT').AsString);
    Datetimepicker1.Date:=strtodate(DM.KHFYQuery.FieldByName('KHFY_TYSJ').AsString);
    Edit7.Text:=Floattostr(DM.KHFYQuery.FieldByName('KHFY_TIT').AsFloat);
    Edit8.Text:=Floattostr(DM.KHFYQuery.FieldByName('KHFY_LIRONG').AsFloat);
end;

procedure TKHFYForm.FormShow(Sender: TObject);
begin
  DM.YWYQuery.Close;
  DM.YWYQuery.SQL.Clear;
  DM.YWYQuery.SQL.Add('select * from YWY_XX');
  DM.YWYQuery.Open;
  DM.CD_XXQuery.Close;
  DM.CD_XXQuery.SQL.Clear;
  DM.CD_XXQuery.SQL.Add('select * from CD_XX');
  DM.CD_XXQuery.Open;
  DM.FhxxQuery.Close;
  DM.FhxxQuery.SQL.Clear;
  DM.FhxxQuery.SQL.Add('select * from FHXX');
  DM.FhxxQuery.Open;
  DM.KHFYQuery.Close;
  DM.KHFYQuery.SQL.Clear;
  DM.KHFYQuery.SQL.Add('select * from KHFY');
  DM.KHFYQuery.Open;
end;

procedure TKHFYForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   Flatcombobox1.SetFocus;
end;

procedure TKHFYForm.FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
   Flatcombobox2.SetFocus;
end;

procedure TKHFYForm.FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   Edit2.SetFocus;
end;

procedure TKHFYForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   Edit3.SetFocus;
end;

procedure TKHFYForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Flatcombobox7.SetFocus;
end;

procedure TKHFYForm.FlatComboBox7KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   Flatcombobox8.SetFocus;
end;

procedure TKHFYForm.FlatComboBox8KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    Flatcombobox3.SetFocus;
end;

procedure TKHFYForm.FlatComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   Edit6.SetFocus;
end;

procedure TKHFYForm.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   Flatcombobox4.SetFocus;
end;

procedure TKHFYForm.FlatComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   Flatcombobox6.SetFocus;
end;

procedure TKHFYForm.FlatComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    Flatcombobox5.SetFocus;
end;

procedure TKHFYForm.FlatComboBox5KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  DateTimePicker1.setFocus;
end;

procedure TKHFYForm.DateTimePicker1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    Edit5.SetFocus;
end;

end.
