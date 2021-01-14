unit yrqd_bbgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, XPMenu;

type
  Tyiqd_bb = class(TForm)
    GroupBox1: TGroupBox;
    DTPyrqd_bb: TDateTimePicker;
    Ebrid: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    XPMenu1: TXPMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  yiqd_bb: Tyiqd_bb;

implementation

uses DM_zygl_, yrqd_bb_f_, rygl_bb_;

{$R *.dfm}

procedure Tyiqd_bb.BitBtn1Click(Sender: TObject);
begin
  if Ebrid.Text='' then
    begin
      showmessage('请填写病人id');
      Ebrid.SetFocus;
      exit;
    end
  else
    begin
      //查询打开病人一日清单表
      yrqd_bb_f.ADOQyrqd_bb.Close;
      yrqd_bb_f.ADOQyrqd_bb.Parameters.ParamByName('病人id').Value:=Ebrid.Text;
      yrqd_bb_f.ADOQyrqd_bb.Parameters.ParamByName('日期').Value:=datetostr(DTPyrqd_bb.Date);
      yrqd_bb_f.ADOQyrqd_bb.Open;
      yrqd_bb_f.QuickRep1.Preview;

    end;

end;

procedure Tyiqd_bb.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
