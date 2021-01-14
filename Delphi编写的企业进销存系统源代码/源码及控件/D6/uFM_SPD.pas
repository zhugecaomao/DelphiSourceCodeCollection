unit uFM_SPD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uFM_SEP, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFM_SPD = class(TFM_SEP)
    BitBtn3: TBitBtn;
    Qry1: TQuery;
    Query1BDEDesigner6: TFloatField;
    Edit6: TEdit;
    Label6: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   
  private
    { Private declarations }
  public
    iF01,iF02,iF03,iF04,iF05,xCustNo:String;
    { Public declarations }
  end;

var
  FM_SPD: TFM_SPD;
  function SelProd(CustNo : string;inF01,inF02,inF03,inF04,inF05:String;var iOut:Integer; sWhere:string=''):Boolean;

implementation

uses uFM_2010, uDM,utilities;

{$R *.DFM}

function SelProd(CustNo : string;inF01,inF02,inF03,inF04,inF05:String;var iOut:Integer; sWhere:string=''):Boolean;
var
  xFM:TFM_SPD;
begin
  Result := false;
  xFM := TFM_SPD.Create(Application);
  try
    xFM.Query1.Close;
    xFM.Query1.SQL.Add(sWhere);
    xFM.iF01 := inF01;
    xFM.iF02 := inF02;
    xFM.iF03 := inF03;
    xFM.iF04 := inF04;
    xFM.iF05 := inF05;
    xFm.xCustNO := CustNo ;
    xFM.Query1.Open;
    if xFM.ShowModal=mrOK then
    begin
      iOut := xFM.Query1.Fields[0].asinteger;
      Result := True;
    end;
  finally
    xFM.free;
  end;


end;


procedure TFM_SPD.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin

  if (Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='')  then
  begin
    R_OKMessage(['<型号>,<品名>,<材质> 必须输入!']);
    Edit1.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

   //加入到基本资料中
   QryExec(Qry1,'Select * from T1080 Where F01='''+Edit1.Text+''' and F02='''+Edit2.Text+''' and F03='''+Edit3.Text+'''and F04='''+Edit4.Text+'''and F05='''+Edit5.Text+''' and F10=''' +xCustNo+'''');
   if Qry1.RecordCount > 0 then
   begin
     R_OKMessage(['资料重复,请重新输入']);
     ModalResult := mrNone;
     exit;
   end;

   QryExec(Qry1,'select max(AutoNo) from T1080');
   i := Qry1.Fields[0].asinteger+1  ;
   With Qry1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('insert into T1080(AutoNo,F01,F02,F03,F04,F05,F07,F10) values(:AutoNo,:F01,:F02,:F03,:F04,:F05,:F07,:F10)');
     ParambyName('AutoNo').asinteger := i;
     Params[1].asstring := Edit1.Text;
     Params[2].asstring := Edit2.Text;
     Params[3].asstring := Edit3.Text;
     Params[4].asstring := Edit4.Text;
     Params[5].asstring := Edit5.Text;
     Params[6].asstring := Edit6.Text;
     Params[7].asstring := xCustNo;
     ExecSQL;
   end;
   DM.Q_T1080.Close;
   DM.Q_T1080.Open;


  With Query1 do
  begin
    Close;
      ParamByName('sF01').AsString := Edit1.Text;
      ParamByName('sF02').AsString := Edit2.Text;
      ParamByName('sF03').AsString := Edit3.Text;
      ParamByName('sF04').AsString := Edit4.Text;
      ParamByName('sF05').AsString := Edit5.Text;
    Open;
  end;
end;




procedure TFM_SPD.FormCreate(Sender: TObject);
begin
 // inherited;
  Width:=680; Height:=480;
end;

end.
