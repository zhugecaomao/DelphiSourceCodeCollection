unit UPresent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntgoodCodeSelStr, DB, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons;

type
  TFmPresentQuery = class(TfmgoodCodeSelStr)
    procedure CbBreedChange(Sender: TObject);
    procedure btnpagedownClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure cbBrandChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    LocalCount:integer;
  public
    { Public declarations }
  end;

var
  FmPresentQuery: TFmPresentQuery;

implementation

uses func, untdatadm;

{$R *.dfm}

procedure TFmPresentQuery.CbBreedChange(Sender: TObject);
var
  t_sql:string;
  quedata:olevariant;
begin
  //inherited;
////////////查询数据
    quedata:=null;
    btnpagedown.Enabled :=true;
   if cbbrand.Text = '' then exit;
   screen.Cursor := crhourglass;
   dmmain.dsquery.DisableControls;
   t_sql:='select top 20 *  from  [Vselectgoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';   //5-11修改  OLD  vSelectGoods
   T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and not (Award_amount is null) and Award_amount>0';
   try
  if dmmain.DSquery.Active then dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;
   ipubtemp.ty_query(t_sql,quedata);  //.qurrecords(t_sql,quedata);
   if not varisnull(quedata) then
    begin
      dmmain.dsquery.Data:=quedata;
      dmmain.dsquery.Open;
      quedata:=null;
      dmmain.dsquery.Last;
      edtRecNo.Text := '当前已下载: '+inttostr(dmmain.dsquery.recordcount)+'条';

      dmmain.dsquery.EnableControls;
      dbgrid1.Refresh;
      //得到此次查询的键值
     LocalCount := GetKeyFieldValue('id');   //传入具体字段

    end else
    begin
        dmmain.dsquery.EnableControls;
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
    dmmain.dsquery.EnableControls;
    dbgrid1.Refresh;
  end;
  dbgrid1.Refresh;
  screen.Cursor :=  crdefault;

end;

procedure TFmPresentQuery.btnpagedownClick(Sender: TObject);
var
  i:Integer;
  t_sql,str1,strend:wideString;
  quedata:olevariant;
  //2004-2-10为了优化程序性能   速度已提高到52秒
  lStart, lEnd : Integer;
begin
  //inherited;
    quedata:=null;
   if not dmmain.DSquery.Active then exit;

    screen.Cursor := crhourglass;
   dmmain.dsquery.DisableControls;
    if combobox1.Text = '全部' then
    begin
    t_sql:='select  *  from  [Vselectgoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';   //5-11修改 old:vselectgoods
    T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+'''';
    end else
    begin
    t_sql:='select top ' + trim(ComboBox1.Text) +' *  from  [Vselectgoods] where type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
    end;
      T_sql := t_sql + ' and breed = ' + ''''+trim(cbbreed.text)+''''+' and not (Award_amount is null) and Award_amount>0';
    str1 := ' and  id > '+ inttostr(localcount);

    strend := T_sql + str1;

///getmore 必须判断LOCALCOUNT是否大于RECORDCOUNT，如果大于则不执行。 条件更改以后必须重新为0

  try
   ipubtemp.ty_query(strend,quedata);
    if not varisnull(quedata) then
    begin
      dmmain.dsquery.EnableControls;
     if dmmain.dsquery.Active then dmmain.dsquery.Close;
      dmmain.dsquery.Open;
      dmmain.dsquery.AppendData(quedata,true);
      quedata:=null;
       dmmain.dsquery.Last;
      LocalCount := GetKeyFieldValue('id');   //传入具体字段
    edtRecNo.Text := '当前共有'+inttostr(dmmain.dsquery.recordcount) +'条';
    end else
    begin
       //不再有数据
        dmmain.dsquery.EnableControls;        //ydy  必须要
       btnpagedown.Enabled := false;
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
    dmmain.dsquery.EnableControls;
    dbgrid1.Refresh;
  end;
  dbgrid1.Refresh;
  screen.Cursor :=  crdefault;


end;

procedure TFmPresentQuery.btnExitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFmPresentQuery.CBTypeChange(Sender: TObject);
var
  t_sql:string;
begin
  //inherited;
 ///////调类别
  if dmmain.DSquery.Active then dmmain.DSquery.Close;
  t_sql:='select distinct brand from  [vselectgoods] where Award_amount>0 and type ='+''''+trim(cbtype.text)+'''';
//  t_sql:='select distinct type  from  [goods_code]';
  GetDataToComBoX(cbbrand,t_sql,'brand');
  cbbrand.ItemIndex := -1;
  combobox1.ItemIndex:=0;
end;

procedure TFmPresentQuery.cbBrandChange(Sender: TObject);
var
  t_sql:string;
begin
  //inherited;
 ///////调类别
 if dmmain.DSquery.Active then dmmain.DSquery.Close;
  t_sql:='select distinct breed from  [vselectgoods] where Award_amount>0 and type ='+''''+trim(cbtype.text)+'''' +' and brand =' +''''+trim(cbbrand.text)+'''';
//  t_sql:='select distinct type  from  [goods_code]';
  GetDataToComBoX(cbbreed,t_sql,'breed');
  cbbreed.ItemIndex := -1;
  combobox1.ItemIndex:=0;

end;

procedure TFmPresentQuery.FormShow(Sender: TObject);
var
  t_sql:string;
begin
  //inherited;
 ///////调类别
  t_sql:='select distinct type from  [vselectgoods] where Award_amount>0';
  GetDataToComBoX(cbtype,t_sql,'type');
  cbtype.ItemIndex := -1;
  combobox1.ItemIndex:=0;
  dmmain.dsquery.Close;
  dmmain.dsquery.Data:=null;

end;

end.
