unit Unitaddmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, Buttons, StdCtrls, ComCtrls, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ExtCtrls, DB;

type
  TFormaddmx = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    dxDBall_name: TdxDBGrid;
    dxDBl_assist: TdxDBGrid;
    RichEdit1: TRichEdit;
    exit: TSpeedButton;
    hz: TSpeedButton;
    DSl_assist: TDataSource;
    DSall_name: TDataSource;
    dxDBall_nameColumn1: TdxDBGridColumn;
    dxDBl_assistColumn1: TdxDBGridColumn;
    dxDBl_assistColumn2: TdxDBGridColumn;
    dxDBl_assistColumn3: TdxDBGridColumn;
    dxDBl_assistColumn4: TdxDBGridColumn;
    dxDBl_assistColumn5: TdxDBGridColumn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBall_nameDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dxDBl_assistDblClick(Sender: TObject);
    procedure hzClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formaddmx: TFormaddmx;

implementation
uses UDM,Unitaddpag,Unitsumvalues,Unitvalueadd,Unithuz,Unitmain;
{$R *.dfm}

procedure TFormaddmx.exitClick(Sender: TObject);
begin
   close;
end;

procedure TFormaddmx.FormShow(Sender: TObject);
begin
   dm.ADOalllname.Open;
   dm.ADOl_assist.Open;

   dxDBall_name.FullExpand;
   dxDBl_assist.FullExpand;


end;

procedure TFormaddmx.dxDBall_nameDblClick(Sender: TObject);
begin
 Formaddpage:=TFormaddpage.Create(self);
 with Formaddpage do
 begin
   Edmc.Text:=dm.ADOalllname.fieldbyname('fymx').AsString;
   dm.hm:=dm.ADOalllname.fieldbyname('id').AsInteger;
   dm.pyn:=dm.ADOalllname.fieldbyname('fyxm').AsString;
   if dm.bmmc<>'' then
   begin
     Cbm.Text:=dm.bmmc;
   end;
 end;
 Formaddpage.ShowModal;
 FreeAndNil(Formaddpage);
end;

procedure TFormaddmx.SpeedButton1Click(Sender: TObject);
begin
  F_sumvalues:=TF_sumvalues.Create(Self);
  F_sumvalues.ShowModal;
  FreeAndNil(F_sumvalues);

end;

procedure TFormaddmx.dxDBl_assistDblClick(Sender: TObject);
begin
 Formvalueadd:=TFormvalueadd.Create(Self);
 with Formvalueadd DO
 begin
   Edmc.Text:=dm.ADOl_assist.fieldbyname('zsname').AsString;
   Edlx.Text:=dm.ADOl_assist.fieldbyname('bm').AsString;
   DM.sl:=dm.ADOl_assist.fieldbyname('je').AsInteger;
 end;
 Formvalueadd.ShowModal;
 FreeAndNil(Formvalueadd);
end;

procedure TFormaddmx.hzClick(Sender: TObject);
begin
   Formhuz:=TFormhuz.Create(Self);
   Formhuz.ShowModal;
   FreeAndNil(Formhuz);
end;

procedure TFormaddmx.SpeedButton2Click(Sender: TObject);
begin
  f_main:=Tf_main.Create(self);
  f_main.ShowModal;
  freeandnil(f_main);

end;

procedure TFormaddmx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.qry1.Close;
end;

end.
