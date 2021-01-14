unit Udlgtotalselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, ComCtrls;

type
  Tdlgtotalselect = class(TfmBase)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    ckbCode: TCheckBox;
    ckbMonth: TCheckBox;
    ckbyear: TCheckBox;
    cmbsel: TComboBox;
    edtyear: TComboBox;
    edtmonth: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure ckbMonthClick(Sender: TObject);
    procedure ckbyearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  dlgtotalselect: Tdlgtotalselect;

implementation

uses func, untdatadm, UntTotalStaff;

{$R *.dfm}


procedure Tdlgtotalselect.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tdlgtotalselect.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbCmb(ckbcode,cmbsel);
end;

procedure Tdlgtotalselect.ckbMonthClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbmonth,edtmonth);
end;

procedure Tdlgtotalselect.ckbyearClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbyear,edtyear);
end;

procedure Tdlgtotalselect.btnOkClick(Sender: TObject);
var
  avgs:string;
  str,temp:widestring;
  datas:olevariant;
  i:double;
  m:integer;
begin
  inherited;
  str:='';
  temp:='';
  IF CKBCODE.Checked then
  begin
    temp:=formatdatetime('YYYY',Date);
    if not ckbmonth.Checked then
    begin
      application.MessageBox('请选择查询月份！',pchar(application.Title)mb_iconinformation);
      ckbmonth.SetFocus;
      exit; 
    end;
    if ckbyear.Checked then
    begin
      temp:=trim(edtyear.Text);
    end;
    avgs:=trim(edtmonth.Text);
    m:=strtoint(avgs);

    str:=' exec LS_MoneyTotalStaff'+''''+avgs+''''+','+''''+temp+'''';
    fmTotalStaff.gridtitle(fmTotalStaff.DBGrid2,cmbsel.ItemIndex+1,m);
    fmtotalstaff.DBGrid1.Visible:=false;
    fmtotalstaff.DBGrid2.Visible:=true;
  end;
  if  not ckbcode.Checked then
  begin
    if ckbyear.Checked then
    begin
      str:='select part_name,isnull(onemoney,0) as '+''''+'01月'+''''+',isnull(twomoney,0) as '+''''+'02月'+''''+',isnull(threemoney,0) as '+''''+'03月'+''''+',isnull(fourmoney,0) as '+''''+'04月'+''''+',isnull(fivemoney,0) as '+''''+'05月'+''''+',isnull(sixmoney,0) as '+''''+'06月'+''''+',isnull(sevenmoney,0) as '+''''+'07月'+''''+',isnull(eightmoney,0) as '+''''+'08月'+''''+',isnull(ninemoney,0) as '+''''+'09月'+''''+',isnull(tenmoney,0) as '+''''+'10月'+''''+',isnull(elevenmoney,0) as '+''''+'11月'+''''+',isnull(towtymoney,0) as '+''''+'12月'+''''
      +'from part  as a'
      +' left join'
      +'(select sum(c_paymoney) as onemoney,c_shopid,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='+''''+'01'+''''+'  and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime))'
       +'as b on b.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as twomoney,c_shopid,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)= '
      +''''+'02'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as c on c.c_shopid=a.part_no '
      +' left join (select sum(c_paymoney) as threemoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'03'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as d on d.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as fourmoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'04'+''''+'  and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as e on e.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as fivemoney,c_shopid,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'05'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as f on f.c_shopid=a.part_no'

      +' left join (select sum(c_paymoney) as sixmoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'06'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as g on g.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as sevenmoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'07'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as h on h.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as eightmoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'08'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as i on i.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as ninemoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'09'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as j on j.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as tenmoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'10'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as k on k.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as elevenmoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'11'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as l on l.c_shopid=a.part_no'
      +' left join (select sum(c_paymoney) as towtymoney,c_shopid ,datepart(yyyy,c_datetime) as byears from dp_charge where datepart(mm,c_datetime)='
      +''''+'12'+''''+' and  datepart(yyyy,c_datetime)='+''''+trim(edtyear.text)+''''+'group by c_shopid,datepart(yyyy,c_datetime)) as m on m.c_shopid=a.part_no ';
      fmtotalstaff.DBGrid1.Visible:=true;
      fmtotalstaff.DBGrid2.Visible:=false;
    end;
  end;
  dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
  datas:=null;
  try
    ipubtemp.ty_query(str,datas); 
    if not varisnull(datas) then
    begin
      dmmain.dsquery.Data:=datas;
      dmmain.dsquery.Open;
      datas:=null;
    end;
  except
  end;
end;

end.
