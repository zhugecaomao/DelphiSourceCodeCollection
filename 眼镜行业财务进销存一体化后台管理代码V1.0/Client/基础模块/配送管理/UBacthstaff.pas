unit UBacthstaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Menus, DB, DBClient, StdCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, ComCtrls;

type
  TfmBacthStaff = class(TfmBase)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    CBType: TComboBox;
    cbBrand: TComboBox;
    CbBreed: TComboBox;
    ckbtype: TCheckBox;
    ckbbreed: TCheckBox;
    ckbbrand: TCheckBox;
    cbamount: TCheckBox;
    edtamount: TEdit;
    ckbCode: TCheckBox;
    edtCode: TEdit;
    dsview: TDataSource;
    cdsdata: TClientDataSet;
    Label3: TLabel;
    Label8: TLabel;
    ckbnewDate: TCheckBox;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    procedure BitBtn7Click(Sender: TObject);
    procedure ckbtypeClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure ckbbrandClick(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure ckbbreedClick(Sender: TObject);
    procedure ckbCodeClick(Sender: TObject);
    procedure ckbnewDateClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    querys,vbegin,vend:string;
    LocalCount:integer;
  public
    { Public declarations }
  end;

var
  fmBacthStaff: TfmBacthStaff;

implementation

uses fm_SetColumn, func;

{$R *.dfm}

procedure TfmBacthStaff.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmBacthStaff.ckbtypeClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbtype,cbtype);
   CBTypeChange(cbtype);
end;

procedure TfmBacthStaff.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  t_sql:='select  distinct brand from  [goods_code] where type ='+''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBrand,t_sql,'brand');
  cbBrand.ItemIndex := -1;
  cbbreed.Clear;

end;

procedure TfmBacthStaff.ckbbrandClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbrand,cbbrand);
   cbbrandchange(cbbrand);
end;

procedure TfmBacthStaff.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
  //调品种
  if cbtype.Text = '' then exit;
  t_sql:='select distinct breed  from  [goods_code] where brand ='+''''+trim(cbbrand.text)+'''' +' and type =' +''''+trim(cbtype.text)+'''';
  GetDataToComBoX(cbBreed,t_sql,'breed');
  cbBreed.ItemIndex := -1;

end;

procedure TfmBacthStaff.ckbbreedClick(Sender: TObject);
begin
  inherited;
  ckbcmb(ckbbreed,cbbreed);
end;

procedure TfmBacthStaff.ckbCodeClick(Sender: TObject);
begin
  inherited;
  ckbedit(ckbcode,edtcode);
end;

procedure TfmBacthStaff.ckbnewDateClick(Sender: TObject);
begin
  inherited;
  ckbDtps(ckbnewdate,dtpbegin,dtpend);
end;

procedure TfmBacthStaff.BitBtn5Click(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
begin
  inherited;
  querys:=' and 1=1';
  localcount:=0;
  vbegin:='';
  vend:='';
  if ckbtype.Checked then
  begin
    querys:=querys+' and a.type='+''''+''''+trim(cbtype.Text)+''''+'''';
  end;
  if ckbbrand.Checked then
  begin
    querys:=querys+' and a.brand='+''''+''''+trim(cbbrand.Text )+''''+'''';
  end;
  if ckbbreed.Checked then
  begin
    querys:=querys+' and a.breed='+''''+''''+trim(cbbreed.Text )+''''+'''';
  end;
  if ckbcode.Checked then
  begin
    querys:=querys+' and a.goods_no='+''''+''''+trim(edtcode.Text)+''''+'''';
  end;
  if ckbnewdate.Checked then
  begin
    vbegin:=formatdatetime('yyyy-mm-dd',dtpbegin.Date);
    vend:=formatdatetime('yyyy-mm-dd',dtpend.Date);
  end;
  try
    temp:=' exec BacthStaff '+''''+trim(vbegin)+''''+','+''''+trim(vend)+''''+','+''''+trim(shopid)+''''+','+''''+trim(querys)+''''+','+inttostr(LocalCount);
    screen.Cursor :=  crHourGlass;
    datas:=null;
    cdsdata.Close;
    cdsdata.Data:=null;
    cdsdata.IndexName:='';
    cdsdata.IndexDefs.Clear;
    datas:=adisp.execSql(TEMP);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      cdsdata.Open;
      datas:=null;
      cdsdata.Last;
      if not cdsdata.IsEmpty then
      LocalCount:=GetKeyFieldValue('id',cdsdata);
      btnpagedown.Enabled:=true;
    end;
     screen.Cursor :=  crdefault;
  except
    screen.Cursor :=  crdefault;
  end;
end;

procedure TfmBacthStaff.FormShow(Sender: TObject);
var
  t_sql:string;
begin
  inherited;
 ///////调类别
  t_sql:='select * from  [goods_type]';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
   dbgCur:=dbgrid1;
   dtpbegin.Date:=date-30;
   dtpend.Date:=date;
end;

procedure TfmBacthStaff.btnpagedownClick(Sender: TObject);
var
  temp:widestring;
  datas:olevariant;
begin
  inherited;
   try
    temp:=' exec BacthStaff '+''''+trim(vbegin)+''''+','+''''+trim(vend)+''''+','+''''+trim(shopid)+''''+','+''''+trim(querys)+''''+','+inttostr(LocalCount);
    screen.Cursor := crhourglass;
    cdsdata.DisableControls;
    datas:=null;
    datas:=adisp.execSql(TEMP);
    if not varisnull(datas) then
    begin
      cdsdata.Close;
      cdsdata.AppendData(datas,true);
      cdsdata.Open;
      datas:=null;
      cdsdata.Last;
      if not cdsdata.IsEmpty then
      LocalCount:=GetKeyFieldValue('id',cdsdata);
      btnpagedown.Enabled:=true;
    end  else
    begin
       //不再有数据
        cdsdata.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
      cdsdata.EnableControls;
     screen.Cursor :=  crdefault;
  except
    cdsdata.EnableControls;
    screen.Cursor :=  crdefault;
  end;
end;

procedure TfmBacthStaff.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
   if not cdsdata.Active then exit;
   if trim(column.Field.AsString)='' then exit;
 sortgrid(column.Field.FieldName,cdsdata,dbgrid1,column);
end;

end.
