unit Uwpxs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  Buttons, Grids, DBGrids;

type
  TF_wuxs = class(TForm)
    dswply: TDataSource;
    pgc1: TPageControl;
    ts1: TTabSheet;
    dbgrd1: TDBGrid;
    pgc2: TPageControl;
    ts2: TTabSheet;
    ts3: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dtp1: TDateTimePicker;
    lbl5: TLabel;
    edtbh: TEdit;
    edtmc: TEdit;
    btn1: TSpeedButton;
    dxCurrencyEdit1: TdxCurrencyEdit;
    edtsl: TEdit;
    btn2: TButton;
    btn3: TButton;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    edtxbh: TEdit;
    edtxmc: TEdit;
    dxCurrencyEdit2: TdxCurrencyEdit;
    edtxsl: TEdit;
    dtp2: TDateTimePicker;
    btn4: TSpeedButton;
    btn5: TBitBtn;
    btn6: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edtxslExit(Sender: TObject);
    procedure edtslExit(Sender: TObject);
    procedure edtslKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtp1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtxslKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtp2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_wuxs: TF_wuxs;

implementation
uses UDM,Uwply, Uwpsz;
{$R *.dfm}

procedure TF_wuxs.FormShow(Sender: TObject);
begin
  edtbh.Enabled:=False;
  edtbh.Color:=clScrollBar;

  edtxbh.Enabled:=False;
  edtxbh.Color:=clScrollBar;

  dtp1.Date:=date;
  dtp2.Date:=Date;

  if Caption='领用' then
  begin
    pgc2.TabIndex:=0;
  end
  else
  if Caption='销售' then
  begin
    pgc2.TabIndex:=1;
  end;

end;

procedure TF_wuxs.btn6Click(Sender: TObject);
begin
  Close;
end;

procedure TF_wuxs.btn3Click(Sender: TObject);
begin
 Close;
end;

procedure TF_wuxs.btn2Click(Sender: TObject);
begin
  //----------领用名细----------------
 if edtmc.Text <> '' then
 begin
   dm.qrylymx.Append;
   dm.qrylymxbm.Value:=edtbh.Text;
   dm.qrylymxmc.Value:=edtmc.Text;
   dm.qrylymxdanja.Value:=dxCurrencyEdit1.Value;
   dm.qrylymxshuliang.Value:=StrToInt(edtsl.Text);
   dm.qrylymxwubh.Value:=dm.Qwpszbm.Value;
   dm.qrylymxlx.Value:='领用';
   dm.qrylymxrq.Value:=dtp1.Date;
   dm.qrylymx.Post;
 end
 else
 MessageBox(Handle,'物品名称不能为空！','系统提示',MB_ICONINFORMATION+MB_OK);

 edtbh.Text:='';
 edtmc.Text:='';
 dxCurrencyEdit1.Value:=0;
 edtsl.Text:='0';



end;

procedure TF_wuxs.btn5Click(Sender: TObject);
begin
 //------------销售明细-----------------
   if  edtxbh.Text <>'' then
   begin
     DM.qrylymx.Append;
     DM.qrylymxbm.Value:=edtxbh.Text;
     dm.qrylymxmc.Value:=edtxmc.Text;
     dm.qrylymxdanja.Value:=dxCurrencyEdit2.Value;
     dm.qrylymxshuliang.Value:=-StrToInt(edtxsl.Text);
     dm.qrylymxwubh.Value:=dm.Qwpszbm.Value;
     dm.qrylymxlx.Value:='销售';
     dm.qrylymxrq.Value:=dtp2.Date;
     dm.qrylymx.Post;
   end
   else
   MessageBox(Handle,'物品名称不能为空！','系统提示',MB_ICONINFORMATION+MB_OK);

 edtxmc.Text:='';
 edtxbh.Text:='';
 edtxsl.Text:='0';
 dxCurrencyEdit2.Value:=0;


end;

procedure TF_wuxs.btn1Click(Sender: TObject);
begin
 F_wpxm:=TF_wpxm.Create(Self);
 F_wpxm.Caption:='领用';
 DM.Qwpsz.Open;
 F_wpxm.ShowModal;
 FreeAndNil(F_wpxm);
end;

procedure TF_wuxs.btn4Click(Sender: TObject);
begin
 F_wpxm:=TF_wpxm.Create(Self);
 F_wpxm.Caption:='销售';
 DM.Qwpsz.Open;
 F_wpxm.ShowModal;
 FreeAndNil(F_wpxm);

end;

procedure TF_wuxs.edtxslExit(Sender: TObject);
var
  counter:Integer;
  id:string;
begin

     with DM.qrycount do
     begin
      Filter:='id=''XS''';
      Filtered:=true;
      open;
      counter:=fieldbyname('countervalues').AsInteger;
      inc(counter);
      edit;
      fieldbyname('countervalues').AsInteger:=counter;
      post;
      close;
     end;
     id:='000'+inttostr(counter);
     id:=copy(id,length(id)-3,4);
     id:=formatdatetime('yyyy',now)+id;
     edtxbh.Text:=id;
end;

procedure TF_wuxs.edtslExit(Sender: TObject);
var
  counter:Integer;
  id:string;
begin
     with DM.qrycount do
     begin
      Filter:='id=''LY''';
      Filtered:=true;
      open;
      counter:=fieldbyname('countervalues').AsInteger;
      inc(counter);
      edit;
      fieldbyname('countervalues').AsInteger:=counter;
      post;
      close;
     end;
     id:='000'+inttostr(counter);
     id:=copy(id,length(id)-3,4);
     id:=formatdatetime('yyyy',now)+id;
     edtbh.Text:=id;
    end;

procedure TF_wuxs.edtslKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=$0D then
  dtp1.SetFocus;
end;

procedure TF_wuxs.dtp1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
 btn1Click(Sender);
end;

procedure TF_wuxs.edtxslKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=$0D then
 dtp2.SetFocus;
end;

procedure TF_wuxs.dtp2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
 btn5Click(Sender);
end;

end.
