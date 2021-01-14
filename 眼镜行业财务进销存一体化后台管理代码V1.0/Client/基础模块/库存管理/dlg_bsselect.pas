unit dlg_bsselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, ExtCtrls, StdCtrls, Buttons;

type
  Tfmbsselect = class(TfmBase)
    GroupBox1: TGroupBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    rddjselect: TRadioGroup;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmbsselect: Tfmbsselect;
  values:integer;
implementation

uses  fm_Scrap,untdatadm, func;

{$R *.dfm}

procedure Tfmbsselect.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmbsselect.btnOkClick(Sender: TObject);
var
  sql:widestring;
  quedata:olevariant;
  i:integer;
  dou:double;
begin
  inherited;
  case rddjselect.ItemIndex of
    0:  begin  //盘亏单
          sql:='select * from [vcheckdata] where count<0 and c_shop='+''''+trim(Handle_Part)+''''+' and cd_state='+''''+'2'+'''';  // 加工的定单；
          fmscrap.state:=1;
        end;
  end;
  values:=rddjselect.ItemIndex;
  if trim(sql)<>'' then
  begin
    //执行方法；
    if dmmain.CDSexecsql.Active then dmmain.CDSexecsql.Close;
    try
      dmmain.CDSexecsql.data:=null;
      dmmain.CDSexecsql.data:=adisp.execsql(sql);
    except
    end;
    dmmain.CDSexecsql.Open;
    if dmmain.CDSexecsql.IsEmpty then
    begin
      application.MessageBox('没有盘点报损的商品！',pchar(application.Title),mb_iconinformation);
      exit; 
    end;
    dmmain.CDSexecsql.First;
    i:=1;
    while not dmmain.CDSexecsql.Eof do //加载显示(thing)
    begin
      fmscrap.sgorder.Cells[1,i]:=trim(dmmain.CDSexecsql.fieldbyname('code').AsString );
      fmscrap.sgorder.Cells[2,i]:=trim(dmmain.CDSexecsql.fieldbyname('name').AsString );
      if values<>0 then
      begin
        dou:=1-dmmain.CDSexecsql.fieldbyname('agio').AsFloat;
        if dou<>0 then
        begin
          fmscrap.sgorder.Cells[3,i]:=floattostr(dmmain.CDSexecsql.fieldbyname('agioprice').AsFloat/(1-dmmain.CDSexecsql.fieldbyname('agio').AsFloat) );
        end else
        begin
          fmscrap.sgorder.Cells[3,i]:=floattostr(dmmain.CDSexecsql.fieldbyname('agioprice').AsFloat);
        end;
        fmscrap.sgorder.Cells[5,i]:=trim(dmmain.CDSexecsql.fieldbyname('agio').AsString);
        fmscrap.sgorder.Cells[6,i]:=trim(dmmain.CDSexecsql.fieldbyname('agioprice').AsString);
        fmscrap.sgorder.Cells[7,i]:=floattostr(dmmain.CDSexecsql.fieldbyname('agioprice').AsFloat*dmmain.CDSexecsql.fieldbyname('count').AsFloat);
        fmscrap.sgorder.Cells[4,i]:=trim(dmmain.CDSexecsql.fieldbyname('count').AsString);
      end else
      begin
        fmscrap.sgorder.Cells[4,i]:=inttostr(0-dmmain.CDSexecsql.fieldbyname('count').asinteger);
      end;
      fmscrap.sgorder.Cells[8,i]:=trim(dmmain.CDSexecsql.fieldbyname('baseprice').Asstring);
      dmmain.CDSexecsql.Next;
      if i<>1 then
      begin
        fmscrap.sgorder.RowCount:= fmscrap.sgorder.RowCount+1;
      end;
      inc(i);
    end;
   ////////////
     fmscrap.showmedel :='1';
  end;
  close;
end;

end.
