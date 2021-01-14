///////////Fastreport公用打印
unit Unitreportxf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_DSet, FR_DBSet, FR_Desgn, FR_Class, StdCtrls, Grids,
  Buttons, ComCtrls,inifiles, Menus, ImgList, FR_E_CSV, FR_E_TXT, FR_E_RTF;

type
  Tfastrepxf = class(TForm)
    LVxreport: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ImageList1: TImageList;
    N3: TMenuItem;
    EXCLE1: TMenuItem;
    WORD1: TMenuItem;
    frReportxf: TfrReport;
    frdesignerxf: TfrDesigner;
    frtoword: TfrRTFExport;
    frtoexcle: TfrCSVExport;
    RepSGrid: TfrUserDataset;
    SGriddata: TStringGrid;
    ColRepGrid: TfrUserDataset;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure EXCLE1Click(Sender: TObject);
    procedure LVxreportDblClick(Sender: TObject);
    procedure WORD1Click(Sender: TObject);
    procedure frReportxfGetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
    filenames:string;
  end;

var
  fastrepxf: Tfastrepxf;
implementation

uses Unitaddreport, untdatadm, func, Goods_Requirement, UntPosSendBill;

{$R *.dfm}

procedure Tfastrepxf.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure Tfastrepxf.BitBtn2Click(Sender: TObject);
var
  vlist:tlistitem;
  str:string;
begin
  if lvxreport.Selected<> nil then
  begin
    vlist:=lvxreport.Selected;
    str:=extractfilepath(application.ExeName)+'reports\'+trim(VLIST.Caption)+'.frf';
    frreportxf.LoadFromFile(str);
    frreportxf.PrepareReport;
    frreportxf.ShowReport;
  end ;
end;

procedure Tfastrepxf.BitBtn3Click(Sender: TObject);
var
  vlist:tlistitem;
  str:string;
begin
  if lvxreport.Selected<> nil then
  begin
    vlist:=lvxreport.Selected;
    str:=extractfilepath(application.ExeName)+'reports\'+trim(VLIST.Caption)+'.frf';
    frreportxf.LoadFromFile(str);
    frreportxf.PrepareReport;
    frreportxf.PrintPreparedReportDlg;
  end ;
end;

procedure Tfastrepxf.BitBtn1Click(Sender: TObject);
var
  vlist:tlistitem;
  str:string;
begin
  if lvxreport.Selected<> nil then
  begin
    vlist:=lvxreport.Selected;
    str:=extractfilepath(application.ExeName)+'reports\'+trim(VLIST.Caption)+'.frf';
    frreportxf.LoadFromFile(str);
    frReportxf.DesignReport;
  end ;
end;

procedure Tfastrepxf.FormShow(Sender: TObject);
var
  fl:tinifile;
  vlist:tlistitem;
  counts,i:integer;
  title,ramak,f:string;
begin
  //SkinData1.Active:=true;
  //SkinData1.LoadFromCollection(dmmain.SkinStore1,skinid);
  if sgriddata.Enabled then
  begin
    ColRepGrid.RangeEndCount:=sgriddata.ColCount;
    RepSGrid.RangeEndCount:=sgriddata.RowCount;
  end;
  /////////////////////
  fl:=tinifile.Create(extractfilepath(application.ExeName)+'reports\'+trim(filenames));
  f:=trim(fl.ReadString('number','count',''));
  if f='' then
  begin
    counts:=0;
  end else
  begin
    counts:=strtoint(f);
  end;
  for i:=1 to counts do
  begin
    title:='';
    title:=fl.ReadString('reportname','name'+inttostr(i),'');
    if trim(title)<>'' then
    begin
      ramak:=fl.ReadString('reportname','ramak'+inttostr(i),'');
      vlist:=lvxreport.Items.Add;
      vlist.Caption:=trim(title);
      vlist.SubItems.Text:=trim(ramak);
    end;
  end;
  fl.Free;
  fl:=nil;
  //vlist.Free;
end;

procedure Tfastrepxf.N1Click(Sender: TObject);
begin
  frmaddreport:=tfrmaddreport.Create(self);
  frmaddreport.filenames:=filenames;
  frmaddreport.ShowModal;
end;

procedure Tfastrepxf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  //SkinData1.Active:=false;
  action:=cafree;
  except
  end;
end;

procedure Tfastrepxf.N2Click(Sender: TObject);
var
  vlist:tlistitem;
  fs:tinifile;
  f,oldf:string;
  counts,i:integer;
begin
  if lvxreport.Selected=nil then exit;
  vlist:=lvxreport.Selected;
  if application.MessageBox(pchar('是否删除'+'【'+TRIM(vlist.Caption)+'】报表文件？'),pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
  begin
    fs:=tinifile.Create(extractfilepath(application.ExeName)+'reports\'+trim(filenames));
    f:=trim(fs.ReadString('number','count',''));
    if f='' then
    begin
      counts:=0;
    end else
    begin
      counts:=strtoint(f);
    end;
    i:=lvxreport.ItemIndex+1;
    while i<=(counts-1) do  //找到位置，，覆盖删除报表
    begin
      oldf:=fs.ReadString('reportname','name'+inttostr(i+1),'');
      fs.WriteString('reportname','name'+inttostr(i),trim(oldf));
      inc(i);
    end;
    if counts<>0 then
    begin
      fs.WriteString('number','count',inttostr(counts-1));
      if application.MessageBox(pchar('是否删除磁盘内保存'+'【'+TRIM(vlist.Caption)+'】报表文件？'),pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
      begin
        deletefile(extractfilepath(application.ExeName)+'reports\'+trim(vlist.Caption)+'.frf')
      end;
    end;
    lvxreport.DeleteSelected;
    fs.Free;
  end;
end;

procedure Tfastrepxf.EXCLE1Click(Sender: TObject);
var
  vlist:tlistitem;
  str:string;
begin
  if LVxreport.Selected <> nil then
  begin
    vlist:=lvxreport.Selected;
    str:=extractfilepath(application.ExeName)+'reports\'+trim(VLIST.Caption)+'.frf';
    frreportxf.LoadFromFile(str);
    frReportxf.PrepareReport;
    frreportxf.ExportTo(frtoexcle,trim(vlist.Caption)+'.xls');
  end;
end;

procedure Tfastrepxf.LVxreportDblClick(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure Tfastrepxf.WORD1Click(Sender: TObject);
var
  vlist:tlistitem;
  str:string;
begin
  if LVxreport.Selected <> nil then
  begin
    vlist:=lvxreport.Selected;
    str:=extractfilepath(application.ExeName)+'reports\'+trim(VLIST.Caption)+'.frf';
    frreportxf.LoadFromFile(str);
    frReportxf.PrepareReport;
    frreportxf.ExportTo(frtoword,trim(vlist.Caption)+'.rtf');
  end;

end;

procedure Tfastrepxf.frReportxfGetValue(const ParName: String;
  var ParValue: Variant);
var
  i:integer;
begin
 if SGriddata.Enabled then
  begin
    if AnsiCompareText(ParName, 'Cell') = 0 then
        ParValue := SGriddata.Cells[ColRepGrid.RecNo, RepSGrid.RecNo];
  end;
end;
/////////////////////////////////////////
end.

