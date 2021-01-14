unit Unitdwzy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Buttons,db,adodb,comobj,
  ImgList, ComCtrls,inifiles, DBClient, DBGrids;

type
  tbookmake=pointer;
  Tfrmzyll = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel2: TPanel;
    edtbmcx: TLabeledEdit;
    edtygcx: TLabeledEdit;
    spdbmcx: TSpeedButton;
    spdygcx: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    im1: TImage;
    im2: TImage;
    SpeedButton8: TSpeedButton;
    Treebm: TTreeView;
    ImageList1: TImageList;
    dsygda: TDataSource;
    Timer1: TTimer;
    dsview: TDataSource;
    cdsdata: TClientDataSet;
    DBGrid2: TDBGrid;
    Pnltext: TPanel;
    Lbcompany: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbfman: TLabel;
    lbemail: TLabel;
    lbhttp: TLabel;
    lbaddress: TLabel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreebmClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spdygcxClick(Sender: TObject);
    procedure spdbmcxClick(Sender: TObject);
    procedure wwDBGrid2DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    {procedure wwDBGrid1CellChanged(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure wwDBGrid2DblClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);}
  private
    { Private declarations }
    pz:boolean;
    company,Email,Fman,address,https:string;//公司名
    function CheckDw(p_no:string):boolean;
    procedure treeexed;
    procedure treepol( partno:string);
    procedure readdata(sqlpub:string;cds:tclientdataset);
  public
    { Public declarations }
    EditBM:INTEGER;
    procedure kz1(fg:boolean);
    procedure kz2(fg:boolean);
  end;

var
  frmzyll: Tfrmzyll;
  bk:tbookmake;
implementation

uses untdatadm, func, Unitygda, Unitnewbm;

{$R *.dfm}

///////////////////////////////
function Tfrmzyll.CheckDw(p_no:string):boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=true;
  sql:='select managerid from stock_manager where storageid='+''''+trim(p_no)+'''';
  datas:=null;
  try
    ipubtemp.ty_query(sql,datas);
    if not varisnull(datas) then
    begin
      result:=false;
      datas:=null;
    end;
  except
  end;
end;
procedure Tfrmzyll.readdata(sqlpub:string;cds:tclientdataset);
var
  temp:widestring;
  datas:olevariant;
begin
  temp:=sqlpub;
  datas:=null;
  cds.Close;
  cds.Data:=null;
  try
    datas:=adisp.execSql(temp);
    if not varisnull(datas) then
    begin
      cds.Data:=datas;
      datas:=null;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

////////////////////////////////////
procedure Tfrmzyll.treeexed;//加载tree;
var
  sql:widestring;
  comp,node1,node2:ttreenode;
  //f:tinifile;
begin
  treebm.Items.Clear;
  cdsdata.Close;
  cdsdata.Data:=null;
  sql:='select * from headoffice';
  try
    cdsdata.Data:=adisp.execSql(sql);
  except
  end;
  //f:=TIniFile.Create(ExtractFileDir(application.Exename)+'\Base_Set.ini');
  company:=trim(cdsdata.fieldbyname('componyname').AsString);
  email:=trim(cdsdata.fieldbyname('email').AsString);
  fman:=trim(cdsdata.fieldbyname('componyman').AsString);
  address:=trim(cdsdata.fieldbyname('address').AsString);
  https:=trim(cdsdata.fieldbyname('componywww').AsString);
  cdsdata.Data:=null;
  cdsdata.Close;
  if trim(company)='' then company:='总公司';
  //////////////////////////////////////////
  comp:=treebm.Items.Add(nil,trim(company));
  ///////////////////////////////////////////
  if pz then
  begin
    sql:='select part_no,part_name from part where (one_partno is null) or (one_partno='+''''+''+''''+')';
  end else
  begin
    sql:='select part_no,part_name from part where storageid='+''''+trim(shopid)+'''';
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  dmmain.CDSquery.Data:=adisp.GetRecord(sql);
  dmmain.CDSquery.Open;
  if not dmmain.CDSquery.IsEmpty then
  begin
    partname:=tstringlist.Create;
    while not dmmain.CDSquery.Eof do
    begin
      node1:=treebm.Items.AddChild(comp,trim(dmmain.CDSquery.fieldbyname('part_no').AsString)+'_'+trim(dmmain.CDSquery.fieldbyname('part_name').AsString));
      partname.Add(dmmain.CDSquery.fieldbyname('part_name').AsString);
      p_name.Add(dmmain.CDSquery.fieldbyname('part_no').AsString);
      sql:='select part_no,part_name from part where one_partno ='+''''+trim(dmmain.CDSquery.fieldbyname('part_no').AsString)+'''';
      dmmain.CDSexecsql.Close;
      dmmain.CDSexecsql.Data:=null;
      dmmain.CDSexecsql.Data:=adisp.execSql(sql);
      dmmain.CDSexecsql.Open;
      while not dmmain.CDSexecsql.Eof do
      begin
        node2:=treebm.Items.AddChild(node1,trim(dmmain.CDSexecsql.fieldbyname('part_no').AsString)+'_'+trim(dmmain.CDSexecsql.fieldbyname('part_name').AsString));
        dmmain.CDSexecsql.Next;
      end;
      dmmain.CDSquery.Next;
    end;
    dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
  end;
end;
procedure tfrmzyll.treepol(partno:string);
var
  sql:widestring;
begin
  if trim(partno)<>'' then
  begin
    try
    sql:='select * from dp_person where p_workid='+''''+trim(partno)+'''';
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
    dmmain.CDSquery2.Data:=adisp.resultrecord(sql);
    dmmain.CDSquery2.Open;
    sql:='select part_name from part where one_partno='+''''+trim(partno)+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    dmmain.CDSexecsql.Data:=adisp.execSql(sql);
    dmmain.CDSexecsql.Open;
    fpartname.Clear;
    while not dmmain.CDSexecsql.Eof do
    begin
      fpartname.Add(dmmain.CDSexecsql.fieldbyname('part_name').AsString);
      dmmain.CDSexecsql.Next;
    end;
    except
    end;
  end;
end;
procedure tfrmzyll.kz1(fg:boolean);
begin
  speedbutton2.Enabled:=fg;
  speedbutton4.Enabled:=fg;
end;
procedure tfrmzyll.kz2(fg:boolean);
begin
  speedbutton4.Enabled:=fg;
end;
procedure Tfrmzyll.SpeedButton6Click(Sender: TObject);
begin
  p_name.Free;
  partname.Free;
  Fpartname.Free;
  close;
end;

procedure Tfrmzyll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=NULL;
  action:=cafree;
end;

{procedure Tfrmzyll.SpeedButton5Click(Sender: TObject);
begin
  if dm.aqrybm.IsEmpty then
  begin
    application.MessageBox('没有可以删除的记录！',pchar(application.Title),mb_iconwarning);
    exit;
  end else
  begin
    if not dm.Aqryzyll.IsEmpty then
    begin
      application.MessageBox('该部门还有下属员工，请安排员工去向！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
    if application.MessageBox('是否删除该条单位信息？',pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
    begin
      dmmain.CDSquery.Delete;
      try
      dmmain.CDSquery.ApplyUpdates(-1);
      except
        application.MessageBox('该部门还有下属员工，请安排员工去向！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
    end;
  end;
end;}

{procedure Tfrmzyll.spdbmcxClick(Sender: TObject);
begin
  if spdbmcx.Caption='查询'  then
  begin
    if edtbmcx.Text ='' then
    begin
      application.MessageBox('请输入查询内容！',pchar(application.Title),mb_iconwarning);
      edtbmcx.SetFocus;
      exit;
    end;
    if dm.aqrybm.IsEmpty then
    begin
      application.MessageBox('没有查询内容！',pchar(application.Title),mb_iconwarning);
      exit;
    end else
    begin
      dm.aqrybm.Filtered:=false;
      dm.aqrybm.Filter:='dept_name ='+''''+trim(edtbmcx.Text)+'''';
      dm.aqrybm.Filtered:=true;
      im2.Picture.Bitmap:= spdbmcx.Glyph;
      spdbmcx.Glyph:=im1.Picture.Bitmap;
      im1.Picture.Bitmap:=im2.Picture.Bitmap;
      spdbmcx.Caption:='全部';
      if dm.aqrybm.IsEmpty then
      begin
        application.MessageBox('没有搜索到相关内容！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
  end;
  end else
  begin
    dm.aqrybm.Filtered:=false;
    im2.Picture.Bitmap:= spdbmcx.Glyph;
    spdbmcx.Glyph:=im1.Picture.Bitmap;
    im1.Picture.Bitmap:=im2.Picture.Bitmap;
    spdbmcx.Caption:='查询';
  end;
end;

procedure Tfrmzyll.spdygcxClick(Sender: TObject);
begin
  if spdygcx.Caption='查询'  then
  begin
    if edtygcx.Text ='' then
    begin
      application.MessageBox('请输入查询内容！',pchar(application.Title),mb_iconwarning);
      edtygcx.SetFocus;
      exit;
    end;
    if dm.aqryzyll.IsEmpty then
    begin
      application.MessageBox('没有查询内容！',pchar(application.Title),mb_iconwarning);
      exit;
    end else
    begin
      dm.aqryzyll.Filtered:=false;
      dm.aqryzyll.Filter:=dm.Aqryzyll.Filter+' and username ='+''''+trim(edtygcx.Text)+'''';
      dm.Aqryzyll.Filtered:=true;
      im2.Picture.Bitmap:= spdygcx.Glyph;
      spdygcx.Glyph:=im1.Picture.Bitmap;
      im1.Picture.Bitmap:=im2.Picture.Bitmap;
      spdygcx.Caption:='全部';
      if dm.aqryzyll.IsEmpty then
      begin
        application.MessageBox('没有搜索到相关内容！',pchar(application.Title),mb_iconwarning);
        exit;
      end;
  end;
  end else
  begin
    dm.aqryzyll.Filtered:=false;
    dm.aqryzyll.Filter:='dept_no='+''''+dm.aqrybm.FieldByName('dept_no').AsString+'''';
    dm.aqryzyll.Filtered:=true;
    im2.Picture.Bitmap:= spdygcx.Glyph;
    spdygcx.Glyph:=im1.Picture.Bitmap;
    im1.Picture.Bitmap:=im2.Picture.Bitmap;
    spdygcx.Caption:='查询';
  end;
end;}

procedure Tfrmzyll.SpeedButton2Click(Sender: TObject);
var
 sql:widestring;
begin
  if treebm.Selected=nil then
  begin
    application.MessageBox('请先设置部门信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  editbm:=0;
  sql:='select * from part where part_no='+''''+trim(copy(treebm.Selected.Text,1,pos('_',trim(treebm.Selected.Text))-1))+'''';
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  dmmain.CDSquery.Data:=adisp.GetRecord (sql);
  dmmain.CDSquery.Open;
  frmnewbm:=tfrmnewbm.Create(self);
  frmnewbm.flag:=2;
  frmnewbm.edtbmdm.Text:=dmmain.CDSquery.fieldbyname('part_no').AsString;
  frmnewbm.edtbmmc.Text:=dmmain.CDSquery.fieldbyname('part_name').AsString;
  frmnewbm.edtksjc.Text:=dmmain.CDSquery.fieldbyname('part_code').AsString;
  frmnewbm.cmbsjbm.Text:=dmmain.CDSquery.fieldbyname('one_partname').AsString;
  frmnewbm.mremark.Text:=dmmain.CDSquery.fieldbyname('remark').AsString;
  frmnewbm.cmbstock.Text:=dmmain.CDSquery.fieldbyname('storageid').AsString;
  frmnewbm.edtfzr.Text:=dmmain.CDSquery.fieldbyname('fzr').AsString;
  frmnewbm.edtaddress.Text:=dmmain.CDSquery.fieldbyname('address').AsString;
  frmnewbm.edtyb.Text:=dmmain.CDSquery.fieldbyname('yzbm').AsString;
  frmnewbm.edtphone.Text:=dmmain.CDSquery.fieldbyname('phone').AsString;
  frmnewbm.cmbsjbm.Enabled:=false;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  frmnewbm.ShowModal;
  if editbm=1 then
  treeexed;
end;

procedure Tfrmzyll.SpeedButton3Click(Sender: TObject);
var
 i:integer;
begin
  if treebm.Selected=nil then
  begin
    application.MessageBox('请先设置部门信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  frmygda:=tfrmygda.Create(self);
  frmygda.fg:=1;
  for i:=0 to partname.Count-1 do
  begin
    frmygda.cbmmc.Items.Add(partname.Strings[i]);
  end;
  for i:=0 to fpartname.Count-1 do //柜组号
  begin
    frmygda.cgzid.Items.Add(trim(fpartname.Strings[i]));
  end;
  //frmygda.ygidadd;
  frmygda.ShowModal;
  frmygda.Free;
end;

procedure Tfrmzyll.SpeedButton4Click(Sender: TObject);
var
  path:string;
  i:integer;
begin
  if dmmain.CDSquery2.RecordCount=0 then
  begin
    application.MessageBox('没有可以修改的员工信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  frmygda:=tfrmygda.Create(self);
  frmygda.fg:=2;
  frmygda.bm:=dmmain.cdsquery2.fieldbyname('p_no').AsString;
  frmygda.edtygbh.Text:=dmmain.cdsquery2.fieldbyname('p_no').AsString;    //第一page
  frmygda.cbmmc.Text:=dmmain.cdsquery2.fieldbyname('p_workname').AsString;
  //frmygda.cbmmc.Enabled:=false;
   for i:=0 to partname.Count-1 do
  begin
    frmygda.cbmmc.Items.Add(partname.Strings[i]);
  end;
  for i:=0 to fpartname.Count-1 do //柜组号
  begin
    frmygda.cgzid.Items.Add(trim(fpartname.Strings[i]));
  end;
  frmygda.edtygmc.Text:=dmmain.cdsquery2.fieldbyname('p_name').AsString;
  frmygda.edtsfzh.Text:=dmmain.cdsquery2.fieldbyname('p_sfzh').AsString;
  frmygda.cygsex.Text:=dmmain.cdsquery2.fieldbyname('p_sex').AsString;
  frmygda.cjg.Text:=dmmain.cdsquery2.fieldbyname('p_jg').AsString;
  frmygda.cmz.Text:=dmmain.cdsquery2.fieldbyname('p_mz').AsString;
  //frmygda.clb.Text:=dmmain.cdsquery2.fieldbyname('gzlb').AsString;
  frmygda.edtic.Text:=dmmain.cdsquery2.fieldbyname('p_icno').AsString;
  frmygda.edtpym.Text:=dmmain.cdsquery2.fieldbyname('p_english').AsString;
  frmygda.edtaddress.Text:=dmmain.cdsquery2.fieldbyname('p_address').AsString;
  frmygda.edtheadset.Text:=dmmain.cdsquery2.fieldbyname('p_headset').AsString;
  frmygda.dtworkdate.Date:=dmmain.cdsquery2.fieldbyname('p_workdata').AsDateTime;
  frmygda.cgzid.Text:=dmmain.cdsquery2.FieldByName('p_workclass').AsString; //工作柜组35
  frmygda.cbgzlb.Text:=dmmain.cdsquery2.FieldByName('p_worklb').AsString;
  if dmmain.cdsquery2.FieldByName('p_iswork').AsBoolean then frmygda.rb1.Checked:=true
  else frmygda.rb2.Checked:=true;
  //////////////////////////end
  frmygda.ShowModal;
  frmygda.Free;
end;

procedure Tfrmzyll.TreebmClick(Sender: TObject);
var
  sql:string;
begin
  if treebm.Selected <>nil then
  begin
    if treebm.Selected.Parent<> nil then
    begin
      pnltext.Visible:=true;
      pnltext.Height:=5;
      treepol(trim(copy(treebm.Selected.Text,1,pos('_',trim(treebm.Selected.Text))-1)));
    end else
    begin
      //显示总公司信息，及部门信息；
      timer1.Enabled:=true;
      sql:='select part_name,storageid,yzbm,address,fzr,phone from [part] where one_partno is null';
      lbcompany.Caption:=trim(company);
      lbfman.Caption:=trim(fman);
      lbemail.Caption:=trim(email);
      lbhttp.Caption:=trim(https);
      lbaddress.Caption:=trim(address);
      if cdsdata.IsEmpty then readdata(sql,cdsdata);
      pnltext.Visible:=true;
      /////////////////////////////
    end;
  end;
end;

procedure Tfrmzyll.FormShow(Sender: TObject);
begin
  pz:=checkdw(shopid);
  p_name:=tstringlist.Create;
  Fpartname:=tstringlist.Create;
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  treeexed;
end;

procedure Tfrmzyll.SpeedButton1Click(Sender: TObject);
begin
  frmnewbm:=tfrmnewbm.Create(self);
  frmnewbm.flag:=1;
  frmnewbm.ShowModal;
  frmnewbm.free;
  treeexed;
end;

procedure Tfrmzyll.spdygcxClick(Sender: TObject);
begin
  treepol(trim(edtygcx.Text));
end;

procedure Tfrmzyll.spdbmcxClick(Sender: TObject);
var
  i:integer;
begin
  for i:=1 to treebm.Items.Count-1 do
  begin
    if pos(trim(edtbmcx.Text),trim(treebm.Items.Item[i].Text))<>0 then
    begin
      treebm.Selected:=treebm.Items.Item[i];
      treebm.Items.Item[i].Expanded:=true;
    end;
  end;
end;

procedure Tfrmzyll.wwDBGrid2DblClick(Sender: TObject);
begin
  speedbutton4.Click;
end;

procedure Tfrmzyll.Timer1Timer(Sender: TObject);
begin
  if pnltext.Height<405 then
  begin
  pnltext.Height:=pnltext.Height+50;
  end else
  begin
    timer1.Enabled:=false;
  end;
end;

procedure Tfrmzyll.DBGrid1TitleClick(Column: TColumn);
begin
   if (not dbgrid1.DataSource.DataSet.Active ) then exit;
   if trim(column.Field.AsString)='' then exit;
   sortgrid(column.Field.FieldName,cdsdata,dbgrid1,column);
end;

procedure Tfrmzyll.SpeedButton5Click(Sender: TObject);
var
  sql:widestring;
begin
  if treebm.Selected <>nil then
  begin
    if application.MessageBox(pchar('是否确定删除部门 :'+trim(copy(treebm.Selected.Text,pos('_',trim(treebm.Selected.Text))+1,length(trim(treebm.Selected.Text))))+'以及该部门管理的人员信息'),pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
    begin
      sql:='delete from part where one_partno=part_no or part_no='+''''+trim(copy(treebm.Selected.Text,1,pos('_',trim(treebm.Selected.Text))-1))+'''';
      try
        adisp.updatesql(sql);
        sql:='delete from dp_person where p_workid='+''''+trim(copy(treebm.Selected.Text,1,pos('_',trim(treebm.Selected.Text))-1))+'''';
        adisp.updatesql(sql);
        application.MessageBox('删除成功！',pchar(application.Title),mb_iconinformation);
      except
      end;
    end;
  end;
end;

end.
