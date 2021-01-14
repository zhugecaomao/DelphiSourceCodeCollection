unit uFM_4030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ToolEdit, Mask, DBCtrls, RXDBCtrl;

type
  TFM_4030 = class(TS_Form)
    Panel1: TPanel;
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Query1mF01: TStringField;
    Query1MF02: TDateTimeField;
    Query1MF03: TStringField;
    Query1MF12: TStringField;
    Query1MF14: TStringField;
    Query1DF02: TIntegerField;
    Query1DF03: TFloatField;
    Query1DF04: TFloatField;
    Query1DF05: TFloatField;
    Query1DF06: TDateTimeField;
    Query1DF07: TFloatField;
    Query1DF08: TFloatField;
    Query1PF02: TStringField;
    Query1PF03: TStringField;
    Query1PF04: TStringField;
    Query1PF05: TStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1PF01: TStringField;
    Query1DCal21: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    Query1CF03: TStringField;
    Query1FF03: TStringField;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DateEdit3: TDateEdit;
    ComboEdit2: TComboEdit;
    ComboEdit1: TComboEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    procedure ComboEdit2ButtonClick(Sender: TObject);
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_4030: TFM_4030;

implementation

uses uDM,utilities;

{$R *.DFM}

procedure TFM_4030.ComboEdit2ButtonClick(Sender: TObject);
Var
XS : TStringlist;
begin
  xs := Select_text('厂商资料选取','Select distinct F01 As ''厂商编号'',F03 as ''厂商简称'' from T1011 order by F01','STK0311',[0,1],[]);
  if assigned(XS) then
  try
    ComboEdit2.Text := XS.Strings[0];
    Dbedit2.Text := XS[1];
  finally
    XS.Free;
  end;
  inherited;

end;

procedure TFM_4030.ComboEdit1ButtonClick(Sender: TObject);
Var
XS : TStringlist;
begin
  xs := select_text('客户资料选取','Select distinct F01 As ''客户编号'',F03 as ''客户简称'' from T1010 order by F01','STK0311',[0,1],[]);
  if assigned(XS) then
  try
    ComboEdit1.Text := XS.Strings[0];
    dbedit4.Text := XS[1];
  finally
    XS.Free;
  end;
  inherited;

end;

procedure TFM_4030.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFM_4030.BitBtn1Click(Sender: TObject);
begin
  query1.close;
  query1.SQL.Clear;
  Query1.SQL.Add('Select m.f01 as mF01,m.f02 AS MF02,M.F03 AS MF03,M.F12 AS MF12,M.F14 AS MF14,'
               +' D.F02 AS DF02,D.F03 AS DF03,D.F04 AS DF04,D.F03-D.F07 AS DCal21,D.F05 AS DF05,D.F06 AS DF06,D.F07 AS DF07,D.F08 AS DF08,'
               +' P.F01 AS PF01,P.F02 AS PF02,P.F03 AS PF03,P.F04 AS PF04,P.F05 AS PF05,'
               +' C.F03 AS CF03,F.F03 AS FF03 '
               +' FROM T2010A AS D'
               +' LEFT JOIN T2010 AS M ON M.F01 = D.F01'
               +' LEFT JOIN T1080 AS P ON D.F02 = P.Autono'
               +' LEFT JOIN T1010 AS C ON M.F03 = C.F01'
               +' LEFT JOIN T1011 AS F ON M.F14 = F.F01'
               +' where 0=0');
             //  +' Where m.f02 >= '''+DateEdit1.Text+''' and m.f02 <= '''+DateEdit2.Text+'''');
  query1.Open;

  if Edit1.Text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and m.f12='''+Edit1.Text+'''');
     query1.Open;
   end;
  if ComboEdit1.Text <> '' then
   begin
     query1.Close;
     query1.sql.add(' and m.f03='''+ComboEdit1.Text+''' ');
     query1.Open;
   end;
  if DateEdit1.Text <> '    /  /  ' then
    begin
     query1.close;
     query1.sql.add(' and m.f02>='''+DateEdit1.text+'''');
     query1.open;
    end;
   if DateEdit2.Text <> '    /  /  ' then
   begin
     query1.close;
     query1.sql.add(' and m.f02<='''+DateEdit2.text+'''');
     query1.Open;
   end;
   if ComboEdit1.Text <> '' then
   begin
     query1.close;
     query1.sql.add(' and m.f03='''+ComboEdit1.Text+'''');
     query1.open;
   end;
   if comboedit2.Text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and m.f14='''+comboedit2.Text+'''');
     query1.open;
   end;
   if edit2.text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and p.f01='''+edit2.text+'''');
     query1.Open;
   end;
   if edit3.text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and p.f02='''+edit3.text+'''');
     query1.open;
   end;
   if edit4.text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and p.f03='''+edit4.text+'''');
     query1.open;
   end;
   if edit5.text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and p.f04='''+edit5.text+'''');
     query1.open;
   end;
   if edit6.text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and p.f05='''+edit6.text+'''');
     query1.open;
   end;
   if edit7.text <> '' then
   begin
     query1.close;
     query1.sql.Add(' and D.f03='''+edit7.text+'''');
     query1.open;
   end;
   if ComboBox1.text = '未交' then
   begin
     query1.close;
     query1.sql.Add(' and D.F03-D.F07>0');
     query1.open;
   end
   else
     if ComboBox1.Text = '已交' then
      begin
        query1.close;
        query1.sql.Add(' and D.F03-D.F07=0');
        query1.Open;
      end
     else
      begin
        query1.Close;
        query1.sql.Add(' and D.F03-D.F07<0');
        QUERY1.Open;
      end;
   if DateEdit3.Text <>'    /  /  '   then
   begin
     query1.close;
     query1.sql.Add(' and D.F06='''+Dateedit3.text+'''');
     query1.open;
   end;
    inherited;
end;

procedure TFM_4030.FormCreate(Sender: TObject);
begin
  inherited;
  Width:=784; Height:=524;
  DateEdit1.Date := date;
  DateEdit2.Date := date;
  ComboBox1.Text := '未交';
end;

end.





