unit Stock_Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, XPMenu;

type
  Tfrm_Stock_Report = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Shape1: TShape;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    DateTimePicker1: TDateTimePicker;
    TabSheet2: TTabSheet;
    Shape2: TShape;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    dtpmonth: TDateTimePicker;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    CheckBox1: TCheckBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure dtpmonthChange(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    tempsql:widestring;
    procedure readdata(sql:widestring);
  public
    { Public declarations }
  end;

var
  frm_Stock_Report: Tfrm_Stock_Report;

implementation

uses Data, func, untdatadm, UntQuerycontract;

{$R *.dfm}
procedure Tfrm_Stock_Report.readdata(sql:widestring);
begin
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  try
  dmmain.CDSquery.Data:=adisp.GetRecord(sql);
  dmmain.CDSquery.Open;
  except
  end;
end;
procedure Tfrm_Stock_Report.DateTimePicker1Change(Sender: TObject);
begin
    MaskEdit1.Text:=formatdatetime('yyyy''-''mm''-''dd',DateTimePicker1.Date);
end;

procedure Tfrm_Stock_Report.dtpmonthChange(Sender: TObject);
begin
    MaskEdit2.Text:=formatdatetime('yyyy''-''mm',dtpmonth.Date);
end;

procedure Tfrm_Stock_Report.DateTimePicker2Change(Sender: TObject);
begin
    MaskEdit3.Text:=formatdatetime('yyyy''-''mm''-''dd',DateTimePicker2.Date);
end;

procedure Tfrm_Stock_Report.DateTimePicker3Change(Sender: TObject);
begin
    MaskEdit4.Text:=formatdatetime('yyyy''-''mm''-''dd',DateTimePicker3.Date);
end;

procedure Tfrm_Stock_Report.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=Cafree;
end;

procedure Tfrm_Stock_Report.BitBtn3Click(Sender: TObject);
begin
  if Trim(MaskEdit1.Text)='' then
  begin
    application.MessageBox('请选择采购时间！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
   //tempsql:='Select * from [Stock_contract] where ';
    if Trim(MaskEdit1.Text)<>'' then
    begin
        tempSql:=tempSql+'  and Copy_Date ='+''''+ Trim(MaskEdit1.Text)+''''+' group by b.goods_no,goods_name,price,barcode,provider';
    end;

    try
        readdata(tempsql);

        if dmmain.CDSquery.IsEmpty  then
        begin
            Application.MessageBox('对不起系统还没有符合条件的【采购合同单】！请确认！',pchar(application.Title),mb_iconwarning);
          exit;
        end;
        fmQuerycontract:=tfmQuerycontract.Create(self);
        fmQuerycontract.ShowModal;
        fmQuerycontract.Free;
    except
        Application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        Exit;
    end;
end;

procedure Tfrm_Stock_Report.btnOkClick(Sender: TObject);
begin
  if Trim(MaskEdit3.Text)='' then
  begin
    application.MessageBox('请选择开始时间！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
   if Trim(MaskEdit4.Text)='' then
  begin
    application.MessageBox('请选择结束时间！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
   //tempsql:='Select sum(goods_amount),goods_no,goods_name,price,barcode,provider from [Stock_contract] as a,[Stock_contract_detail] as b,[goods_code] as c where a.Contract_No=b.Contract_No and b.goods_no=c.goods_no ';
    if (Trim(MaskEdit3.Text)<>'') and (Trim(MaskEdit4.Text)<>'') then
    begin
        tempSql:=tempSql+'  and Copy_Date >='+''''+ Trim(MaskEdit3.Text)+''''+' and  Copy_Date <='+''''+ Trim(MaskEdit4.Text)+''''+' group by b.goods_no,goods_name,price,barcode,provider';
    end;

    try
        readdata(tempsql);
        if dmmain.CDSquery.IsEmpty  then
        begin
            Application.MessageBox('对不起系统还没有符合条件的【采购合同单】！请确认！',pchar(application.Title),mb_iconwarning);
          exit;
        end;
        fmQuerycontract:=tfmQuerycontract.Create(self);
        fmQuerycontract.ShowModal;
        fmQuerycontract.Free;
    except
        Application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        Exit;
    end;

end;

procedure Tfrm_Stock_Report.BitBtn1Click(Sender: TObject);
begin
   if Trim(MaskEdit2.Text)='' then
  begin
    application.MessageBox('请选择采购月份！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
     //tempsql:='Select sum(goods_amount),goods_no,goods_name,price,barcode,provider from [Stock_contract] as a,[Stock_contract_detail] as b,[goods_code] as c where a.Contract_No=b.Contract_No and b.goods_no=c.goods_no ';
    if Trim(MaskEdit2.Text)<>'' then
    begin
        tempSql:=tempSql+' and datepart(yyyy,Copy_Date)='+''''+formatdatetime('yyyy',dtpmonth.Date )+''''+' and datepart(mm,Copy_Date)='+''''+formatdatetime('mm',dtpmonth.Date)+''''+' group by b.goods_no,goods_name,price,barcode,provider';
    end;
    try
        readdata(tempsql);
      if dmmain.CDSquery.IsEmpty  then
      begin
        Application.MessageBox('对不起系统还没有符合条件的【采购合同单】！请确认！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
      fmQuerycontract:=tfmQuerycontract.Create(self);
      fmQuerycontract.ShowModal;
      fmQuerycontract.Free;
    except
        Application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
        Exit;
    end;

end;

procedure Tfrm_Stock_Report.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Stock_Report.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=date;
  DateTimePicker2.Date:=date;
  DateTimePicker3.Date:=date;
  dtpmonth.Date:=date;
  tempsql:='Select sum(goods_amount) as goods_amount ,b.goods_no,goods_name,price,barcode,provider from [Stock_contract] as a,[Stock_contract_detail] as b,[goods_code] as c where a.Contract_No=b.Contract_No and b.goods_no=c.goods_no ';
end;

end.
