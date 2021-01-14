unit Unitaddreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,inifiles, StdCtrls, Buttons, ComCtrls;

type
  TFrmaddreport = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtreportname: TLabeledEdit;
    edtbz: TLabeledEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     filenames:string;
  end;

var
  Frmaddreport: TFrmaddreport;

implementation

uses Unitreportxf;

{$R *.dfm}

procedure TFrmaddreport.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmaddreport.BitBtn1Click(Sender: TObject);
var
  fs:tinifile;
  counts:integer;
  vlist:tlistitem;
  F,fname:string;
begin
  if edtreportname.Text<>'' then
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
    fs.WriteString('number','count',inttostr(counts+1));
    fs.WriteString('reportname','name'+inttostr(counts+1),trim(edtreportname.Text));
    fs.WriteString('reportname','ramak'+inttostr(counts+1),trim(edtbz.Text));
    fname:=fs.ReadString('reportname','name'+inttostr(1),'');
    fastrepxf.frReportxf.LoadFromFile(extractfilepath(application.ExeName)+'reports\'+trim(fname)+'.frf');
    fastrepxf.frReportxf.PrepareReport;
    fastrepxf.frReportxf.SaveToFile(extractfilepath(application.ExeName)+'reports\'+trim(edtreportname.Text)+'.frf');
    vlist:=fastrepxf.lvxreport.Items.Add;
    vlist.Caption:=trim(edtreportname.Text);
    vlist.SubItems.Text:=trim(edtbz.Text);
    fs.Free;
    close;
  end else
  begin
    application.MessageBox('请输入报表名称！',pchar(application.Title),mb_iconinformation);
    edtreportname.SetFocus;
    exit;
  end;
end;

procedure TFrmaddreport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

end.
