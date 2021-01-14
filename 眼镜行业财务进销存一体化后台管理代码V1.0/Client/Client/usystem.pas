unit usystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, ExtCtrls, Buttons, ComCtrls,
  LabeledEditint, DB, DBClient;

type
  Tfm_system = class(TfmBase)
    PageC1: TPageControl;
    Tab1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmbskin: TComboBox;
    rbwarning: TRadioGroup;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox2: TGroupBox;
    edtfloat: TLabeledEditint;
    edtaddjf: TLabeledEditint;
    cdsdata: TClientDataSet;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    CmbDays: TComboBox;
    Label3: TLabel;
    cmbtime: TComboBox;
    Label4: TLabel;
    CmbWDay: TComboBox;
    Label5: TLabel;
    CmbReport: TComboBox;
    RDGEdit: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure cmbskinChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    flag:boolean;
    procedure forminit;
  public
    { Public declarations }
  end;

var
  fm_system: Tfm_system;

implementation

uses untdatadm, func;

{$R *.dfm}
procedure Tfm_system.forminit;
var
  sqlpub:widestring;
  datas:olevariant;
begin
  inherited;
  sqlpub:='select * from systeminit';
  cdsdata.Close;
  cdsdata.Data:=null;
  datas:=null;
  try
    datas:=adisp.execSql(sqlpub);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      cdsdata.Open;
      datas:=null;
      with cdsdata do
      begin
        if not cdsdata.IsEmpty then
        begin
        cmbskin.ItemIndex:=fieldbyname('Pfindex').AsInteger;
        rbwarning.ItemIndex:=fieldbyname('kcjk').AsInteger;
        edtfloat.Text:=fieldbyname('datasize').AsString ;
        edtaddjf.Text:=fieldbyname('addfs').AsString;
        Rdgedit.ItemIndex :=fieldbyname('Isedit').AsInteger;
        cmbdays.ItemIndex:=fieldbyname('htdays').AsInteger;
        cmbtime.ItemIndex:=fieldbyname('qjtime').AsInteger;
        cmbwday.ItemIndex:=fieldbyname('wjdays').AsInteger;
        cmbreport.ItemIndex:=fieldbyname('report').AsInteger;
        flag:=true;
        end else
        begin
          cmbskin.ItemIndex:=0;
          rbwarning.ItemIndex:=1;
          edtfloat.Text:='2';
          edtaddjf.Text:='1';
          cmbdays.ItemIndex:=  0;
          cmbtime.ItemIndex:= 0 ;
          cmbwday.ItemIndex:=0 ;
          cmbreport.ItemIndex:=0;
          flag:=false;
        end;
        Close;
      end;
    end else
    begin
      cmbskin.ItemIndex:=0;
      rbwarning.ItemIndex:=1;
      rdgedit.ItemIndex:=1;
      edtfloat.Text:='2';
      edtaddjf.Text:='1';
      cmbdays.ItemIndex:=  0;
      cmbtime.ItemIndex:= 0 ;
      cmbwday.ItemIndex:=0 ;
      cmbreport.ItemIndex:=0;
      flag:=false;
    end;
  except
  end;
end;
procedure Tfm_system.FormShow(Sender: TObject);
begin
  inherited;
  forminit;
  pagec1.ActivePageIndex:=0;
end;

procedure Tfm_system.cmbskinChange(Sender: TObject);
begin
  inherited;
  dmmain.SkinData1.LoadFromCollection(dmmain.SkinStore1,cmbskin.ItemIndex);
  Skinid:=cmbskin.ItemIndex;
end;

procedure Tfm_system.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfm_system.btnOkClick(Sender: TObject);
var
  sql:widestring;
begin
  inherited;
  if flag then
  begin
    sql:=' update systeminit set pfindex='+inttostr(cmbskin.ItemIndex)+',kcjk='+inttostr(rbwarning.ItemIndex)+',datasize='+trim(edtfloat.Text)+',addfs='+trim(edtaddjf.Text)+',isedit='+inttostr(rdgedit.ItemIndex)+',htdays='+inttostr(cmbdays.ItemIndex)+',qjtime='+inttostr(cmbtime.ItemIndex)+',wjdays='+inttostr(cmbwday.ItemIndex)+',Report='+inttostr(cmbreport.ItemIndex);
  end else
  begin
    sql:='insert into systeminit values('+inttostr(cmbskin.ItemIndex)+','+inttostr(rbwarning.ItemIndex)+','+trim(edtfloat.Text)+','+trim(edtaddjf.Text)+','+inttostr(cmbdays.ItemIndex)+','+inttostr(cmbtime.ItemIndex)+','+inttostr(cmbwday.ItemIndex)+','+inttostr(cmbreport.ItemIndex)+','+inttostr(rdgedit.ItemIndex)+')';
  end;
  try
    adisp.updatesql(sql);
    close;
  except
  end;
end;

end.
