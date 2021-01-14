unit uFM_SCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Db, DBTables;

type
  TFM_SCM = class(TS_Form)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Query1AutoNo: TIntegerField;
    Query1BDEDesigner: TStringField;
    Query1BDEDesigner2: TStringField;
    Query1BDEDesigner3: TStringField;
    Query1BDEDesigner4: TStringField;
    Query1BDEDesigner5: TStringField;
    Qry1: TQuery;
    Qry2: TQuery;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Query1BDEDesigner6: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
  private
    Procedure AddFormData(inCNo1,inCNo2:string);
    { Private declarations }
  public
    iNo,iCNo1,iCNo2,iF01,iF02,iF03,iF04,iF05:String;
    ilkF07:integer;
    isInsert:Boolean;
    { Public declarations }
  end;

var
  FM_SCM: TFM_SCM;
  iAutoNo:integer;

function SelComeMaterial(inNo,inCNo1,inCNo2,inF01,inF02,inF03,inF04,inF05:String;inlkF07:integer;var iOut:Integer; isInsert:Boolean=true):Boolean;

implementation

uses utilities, uDM;

{$R *.DFM}

function SelComeMaterial(inNo,inCNo1,inCNo2,inF01,inF02,inF03,inF04,inF05:String;inlkF07:integer;var iOut:Integer; isInsert:Boolean=true):Boolean;
var
  xFM:TFM_SCM;
begin
  Result := false;
  xFM := TFM_SCM.Create(Application);
  try
    xFM.isInsert := isInsert;
    xFM.iNo := inNo;
    xFM.iCNo1 := inCNo1;
    xFM.iCNo2 := inCNo2;
    xFM.iF01 := inF01;
    xFM.iF02 := inF02;
    xFM.iF03 := inF03;
    xFM.iF04 := inF04;
    xFM.iF05 := inF05;
    xFM.ilkF07 := inlkF07;
    if xFM.ShowModal=mrOK then
    begin
      iOut := iAutoNo;
      Result := True;
    end;
  finally
    xFM.free;
  end;
end;



procedure TFM_SCM.FormCreate(Sender: TObject);
begin
  // inherited;
  Width:=680; Height:=480;
end;

procedure TFM_SCM.Edit1Exit(Sender: TObject);
begin
  inherited;
  With Query1 do
  begin
    Close;
    if TEdit(Sender).Text='' then
      ParamByName('sF0'+IntToStr(TEdit(Sender).Tag)).AsString := '%'
    else
      ParamByName('sF0'+IntToStr(TEdit(Sender).Tag)).AsString := TEdit(Sender).Text;
    Open;
  end;
end;

procedure TFM_SCM.FormShow(Sender: TObject);
begin
  inherited;
  Query1.Close;
  Query1.Parambyname('sF10').AsString := iCNo1;
  Query1.Parambyname('sF11').AsString := iCNo2;
  Query1.Open;

  Edit1.text := iF01;
  Edit2.text := iF02;
  Edit3.text := iF03;
  Edit4.text := iF04;
  Edit5.text := iF05;
  Edit6.Text := inttostr(ilkF07);
  BitBtn3.Visible := isInsert;
end;

procedure TFM_SCM.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BitBtn1.Click;
end;


Procedure TFM_SCM.AddFormData(inCNo1,inCNo2:string);
var
  i:integer;
begin
  if (Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='') or (Edit6.text='') then
  begin
    R_OKMessage(['<型号>,<品名>,<材质>,<单重> 必须输入!']);
    Edit1.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

   //加入到基本资料中
   QryExec(Qry1,'Select * from T1090 Where F01='''+Edit1.Text+''' and F02='''+Edit2.Text+''' and F03='''+Edit3.Text+''' and F04='''+Edit4.Text+''' and F05='''+Edit5.Text+''' and F10=''' +iCNo1+''' and F11='''+iCNo2+'''');
   if Qry1.RecordCount > 0 then
   begin
     R_OKMessage(['资料重复,请重新输入']);
     ModalResult := mrNone;
     exit;
   end;
   QryExec(Qry1,'select max(AutoNo) from T1090');
   i := Qry1.Fields[0].asinteger+1  ;
   With Qry1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('insert into T1090(AutoNo,F01,F02,F03,F04,F05,F10,F11,F07) values(:AutoNo,:F01,:F02,:F03,:F04,:F05,:F10,:F11,:F07)');
     ParambyName('AutoNo').asinteger := i;
     Params[1].asstring := Edit1.Text;
     Params[2].asstring := Edit2.Text;
     Params[3].asstring := Edit3.Text;
     Params[4].asstring := Edit4.Text;
     Params[5].asstring := Edit5.Text;
     Params[6].asstring := iCNo1;
     Params[7].asstring := iCNo2;
     Params[8].asfloat := strtofloat(Edit6.text);
     ExecSQL;
   end;
   iAutoNo := i;
   DM.Q_T1090.Close;
   DM.Q_T1090.Open; 
end;


procedure TFM_SCM.Query1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  iAutoNo := Query1.fieldbyname('AutoNo').asinteger;
end;

procedure TFM_SCM.BitBtn3Click(Sender: TObject);
begin
  inherited;
  AddFormData(iCNo1,iCNo2);
end;

end.
