unit Fweal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, Buttons, DB, ADODB;

type
  Tweal = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    vleLeft: TValueListEditor;
    GroupBox2: TGroupBox;
    vleRight: TValueListEditor;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    r_staffinfo: TADOTable;
    r_staffclasscode: TADOTable;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure vleLeftMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    etype:integer;  //1.应用薪资福利　　2.应用合同
  end;

var
  weal: Tweal;

implementation

uses fmain;
{$R *.dfm}

procedure Tweal.Button2Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tweal.FormCreate(Sender: TObject);
begin
  self.ADOQuery1.Open;
  self.ADOQuery1.First;
  while not self.ADOQuery1.Eof do
    begin
      self.vleLeft.InsertRow(self.ADOQuery1.fieldbyname('name').AsString,self.ADOQuery1.fieldbyname('id').AsString,true);
      self.ADOQuery1.Next;
    end;
  self.ADOQuery1.Close;
end;

procedure Tweal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  self.ADOQuery1.Close;
end;

procedure Tweal.SpeedButton1Click(Sender: TObject);
var
  i,intIndex : integer;
begin
  intIndex := self.vleLeft.row;

  if ( not self.vleRight.FindRow(self.vleLeft.Keys[intIndex],i)) and (self.vleLeft.Keys[intIndex] <> '')then
  begin
    self.vleRight.InsertRow(self.vleLeft.Keys[intIndex],self.vleLeft.Values[self.vleLeft.Keys[intIndex]],true );
    self.vleLeft.DeleteRow(intIndex);
  end;
end;

procedure Tweal.SpeedButton3Click(Sender: TObject);
var
  i ,intIndex: integer;
begin
  
  for i := self.vleLeft.RowCount - 1 downto 1 do
  begin
    if ((not self.vleRight.FindRow(self.vleLeft.Keys[i],intIndex)) and (self.vleLeft.Keys[i] <> '')) then
    begin
      self.vleRight.InsertRow(self.vleLeft.Keys[i],self.vleLeft.Values[self.vleLeft.Keys[i]],true );
      self.vleLeft.DeleteRow(i);
    end;
  end;
end;

procedure Tweal.SpeedButton2Click(Sender: TObject);
var
  i,intIndex : integer;
begin

  intIndex := self.vleRight.row;

  if ((not self.vleLeft.FindRow(self.vleRight.Keys[intIndex],i)) and (self.vleRight.Keys[intIndex] <> '')) then
  begin
    self.vleLeft.InsertRow(self.vleRight.Keys[intIndex],self.vleRight.Values[self.vleRight.Keys[intIndex]],true );
    self.vleRight.DeleteRow(intIndex);
  end;
end;

procedure Tweal.SpeedButton4Click(Sender: TObject);
var
  i ,intIndex: integer;
begin
  for i := self.vleRight.RowCount - 1 downto 1 do
  begin
    if ((not self.vleLeft.FindRow(self.vleRight.Keys[i],intIndex)) and (self.vleRight.Keys[i] <> '')) then
    begin
      self.vleLeft.InsertRow(self.vleRight.Keys[i],self.vleRight.Values[self.vleRight.Keys[i]],true );
      self.vleRight.DeleteRow(i);
    end;
  end;
end;

procedure Tweal.Button1Click(Sender: TObject);
var i:integer;
    tmpid:string;
begin
  if ((self.vleRight.RowCount <= 2) and (self.vleRight.Keys[1] = '')) then
    begin
      MessageBox(handle,'没有选择数据！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  if self.etype=1 then          ///套用薪水福利
    begin
      self.ADOTable1.TableName:='r_staffpay';
      for i:=1 to self.vleRight.RowCount - 1 do
        begin
          tmpid:=self.vleRight.Values[self.vleRight.Keys[i]];//读出员工ＩＤ
          try
            self.ADOTable1.Close;
            self.ADOTable1.Open;
            self.ADOTable1.Append;
            self.ADOTable1.FieldByName('staffid').AsString:=tmpid;
            self.ADOTable1.FieldByName('paytype').AsString:=main.r_staffpay.fieldbyname('paytype').AsString;
            self.ADOTable1.FieldByName('payedit').AsString:=main.r_staffpay.fieldbyname('payedit').AsString;
            self.ADOTable1.FieldByName('payfloat').AsFloat:=main.r_staffpay.fieldbyname('payfloat').AsFloat;
            self.ADOTable1.FieldByName('ifpercent').AsString:=main.r_staffpay.fieldbyname('ifpercent').AsString;
            self.ADOTable1.FieldByName('accounttype').AsString:=main.r_staffpay.fieldbyname('accounttype').AsString;
            self.ADOTable1.FieldByName('pstardate').AsDateTime:=main.r_staffpay.fieldbyname('pstardate').AsDateTime;
            self.ADOTable1.FieldByName('penddate').AsDateTime:=main.r_staffpay.fieldbyname('penddate').AsDateTime;
            self.ADOTable1.FieldByName('pmemo').AsVariant:=main.r_staffpay.fieldbyname('pmemo').AsVariant;
            self.ADOTable1.Post;
          except
          end;
        end;
        main.r_staffpay.Close;
        main.r_staffpay.Open;
    end;
  if self.etype=2 then          ///套用合同
    begin
      self.ADOTable1.TableName:='r_staffcontract';
      for i:=1 to self.vleRight.RowCount - 1 do
        begin
          tmpid:=self.vleRight.Values[self.vleRight.Keys[i]];//读出员工ＩＤ
          try
            self.ADOTable1.Close;
            self.ADOTable1.Open;
            self.ADOTable1.Append;
            self.ADOTable1.FieldByName('staffid').AsString:=tmpid;
            self.ADOTable1.FieldByName('cname').AsString:=main.r_staffcontract.fieldbyname('cname').AsString;
            self.ADOTable1.FieldByName('cstartdate').AsDateTime:=main.r_staffcontract.fieldbyname('cstartdate').AsDateTime;
            self.ADOTable1.FieldByName('cenddate').AsDateTime:=main.r_staffcontract.fieldbyname('cenddate').AsDateTime;
            self.ADOTable1.FieldByName('cmemo').AsString:=main.r_staffcontract.fieldbyname('cmemo').AsString;
            self.ADOTable1.Post;
          except
          end;
        end;
        main.r_staffcontract.Close;
        main.r_staffcontract.Open;
    end;
  MessageBox(handle,'数据套用完成！','提示',MB_ICONINFORMATION or MB_OK);
  self.Close;
end;

procedure Tweal.vleLeftMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var tmpid:string;
    i,intIndex : integer;
begin
  if ((self.vleLeft.RowCount <= 2) and (self.vleLeft.Keys[1] = '')) then exit;
  intIndex := self.vleLeft.Row;
  if ( not self.vleRight.FindRow(self.vleLeft.Keys[intIndex],i)) and (self.vleLeft.Keys[intIndex] <> '')then
    begin
      tmpid:=self.vleLeft.Values[self.vleLeft.Keys[intIndex]];
      self.r_staffinfo.Close;
      self.r_staffinfo.Filtered:=false;
      self.r_staffinfo.Filter:=format('id'+'='+'''%s''',[tmpid]);
      self.r_staffinfo.Filtered:=true;
      self.r_staffinfo.Open;
      if self.r_staffinfo.RecordCount=0 then exit;
      tmpid:=self.r_staffinfo.fieldbyname('classcodeID').AsString;
      self.r_staffclasscode.Close;
      self.r_staffclasscode.Filtered:=false;
      self.r_staffclasscode.Filter:=format('id'+'='+'''%s''',[tmpid]);
      self.r_staffclasscode.Filtered:=true;
      self.r_staffclasscode.Open;
      self.vleLeft.Hint:='姓名：'+self.r_staffinfo.fieldbyname('name').AsString+'　性别：'+self.r_staffinfo.fieldbyname('sex').AsString+'　出生日期：'+datetostr(self.r_staffinfo.fieldbyname('birthday').AsDateTime)
                        +#13#13+'入职时间：'+datetostr(self.r_staffinfo.fieldbyname('intime').AsDateTime)+'　职工类别：'+self.r_staffclasscode.fieldbyname('classcodename').AsString;
    end;
end;

end.
