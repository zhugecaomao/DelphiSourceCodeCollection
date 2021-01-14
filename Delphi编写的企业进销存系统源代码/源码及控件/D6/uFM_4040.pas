unit uFM_4040;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ExtCtrls,
  DBCtrls, ToolEdit, Mask;

type
  TFM_4040 = class(TS_Form)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1MF01: TStringField;
    Query1MF02: TDateTimeField;
    Query1MF03: TStringField;
    Query1MF04: TStringField;
    Query1MF10: TFloatField;
    Query1MF12: TStringField;
    Query1MF13: TStringField;
    Query1MF14: TStringField;
    Query1DF02: TIntegerField;
    Query1DF03: TFloatField;
    Query1DF04: TFloatField;
    Query1DF05: TFloatField;
    Query1DF06: TStringField;
    Query1DF07: TStringField;
    Query1DF08: TDateTimeField;
    Query1PF01: TStringField;
    Query1PF02: TStringField;
    Query1PF03: TStringField;
    Query1PFO4: TStringField;
    Query1PF05: TStringField;
    Query1CF03: TStringField;
    Query1FF03: TStringField;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    ComboEdit1: TComboEdit;
    DBEdit4: TDBEdit;
    ComboEdit2: TComboEdit;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label13: TLabel;
    BitBtn4: TBitBtn;
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure ComboEdit2ButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_4040: TFM_4040;

implementation

uses uDM,utilities;

{$R *.DFM}

procedure TFM_4040.ComboEdit1ButtonClick(Sender: TObject);
Var
XS : TStringlist;
begin
  inherited;
  XS := select_text('客户资料选取','Select F01 as ''客户编号'',F03 AS ''客户简称'' From T1010 order by f01 ','STK0311',[0,1],[]);
  if assigned(XS) then
  try
    ComboEdit1.Text := XS.Strings[0];
    DBEdit4.Text := XS[1];
  finally
    XS.Free ;
  end;
end;

procedure TFM_4040.ComboEdit2ButtonClick(Sender: TObject);
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
end;

procedure TFM_4040.BitBtn1Click(Sender: TObject);
begin
  inherited;
  query1.Close;
  query1.sql.Clear;
  query1.sql.Add('SELECT M.F01 AS MF01,M.F02 AS MF02,M.F03 AS MF03,M.F04 AS MF04,M.F10 AS MF10,'
                  +' M.F12 AS MF12,M.F13 AS MF13,M.F14 AS MF14,D.F02 AS DF02,D.F03 AS DF03,'
                  +' D.F04 AS DF04,D.F05 AS DF05,D.F06 AS DF06,D.F07 AS DF07,D.F08 AS DF08,'
                  +' P.F01 AS PF01,P.F02 AS PF02,P.F03 AS PF03,P.F04 AS PFO4,P.F05 AS PF05,'
                  +' C.F03 AS CF03,F.F03 AS FF03'
                  +' FROM T2160 AS M '
                  +' LEFT JOIN T2160A AS D ON M.F01=D.F01'
                  +' LEFT JOIN T1080 AS P ON D.F02=P.AUTONO'
                  +' LEFT JOIN T1010 AS C ON M.F03=C.F01'
                  +' LEFT JOIN T1011 AS F ON M.F14=F.F01'
                  +' where 0=0');
                 // +' WHERE m.f02>='''+DateEdit1.text+''' and m.f02<='''+DateEdit2.Text+'''');
 query1.open;

 if ComboBox1.Text = '出' then
   begin
    query1.close;
    query1.sql.Add(' and m.f01 like ''A%''');
    query1.open;
   end
 else
   begin
    query1.close;
    query1.sql.Add(' and m.f01 like ''B%''');
    query1.open;
   end;
 if Dateedit1.Text <> '    /  /  '  then
 begin
   query1.close;
   query1.sql.Add(' and m.f02>='''+Dateedit1.text+'''');
   query1.open;
 end;
 if DateEdit2.Text <> '    /  /  '  then
 begin
   query1.close;
   query1.sql.Add('and m.f02<='''+Dateedit2.text+'''');
   query1.Open;
 end;
 if ComboEdit1.Text <> '' then
 begin
   query1.close;
   query1.sql.Add(' and m.f03='''+ComboEdit1.Text+'''');
   query1.open;
 end;
 if ComboEdit2.Text <> '' then
 begin
   query1.close;
   query1.sql.Add(' and m.f14='''+ComboEdit2.Text+'''');
   query1.open;
 end;
 if Edit2.Text <> '' then
 begin
   query1.close;
   query1.sql.Add(' and p.f01='''+Edit2.Text+'''');
   query1.open;
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
   if edit6.Text <> '' then
   begin
     query1.close;
     query1.SQL.Add(' and p.f05='''+edit6.text+'''');
     query1.open;
   end;
   if edit1.Text <> '' then
   begin
     query1.Close;
     query1.sql.Add(' and m.f12='''+edit1.text+'''');
     query1.Open;
   end;
   if edit7.Text <> '' then
   begin
     query1.Close;
     query1.sql.Add(' and d.f06='''+edit7.text+'''');
     query1.Open;
   end;
   if edit8.Text <> '' then
   begin
     query1.Close;
     query1.sql.Add(' and d.f03='''+edit8.text+'''');
     query1.Open;
   end;
 end;

procedure TFM_4040.BitBtn4Click(Sender: TObject);
begin
  inherited;
close;
end;

procedure TFM_4040.FormCreate(Sender: TObject);
begin
  inherited;
  Width:=784; Height:=524;
  DateEdit1.Date := date;
  DateEdit2.Date := date;
  ComboBox1.text := '出';
end;


end.
