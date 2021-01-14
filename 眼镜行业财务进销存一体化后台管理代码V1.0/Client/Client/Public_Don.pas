unit Public_Don;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, XPMenu, ImgList, StdCtrls;

type
  Tfrm_Public_Don = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ImageList1: TImageList;
    Image1: TImage;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    no:string;
  end;

var
  frm_Public_Don: Tfrm_Public_Don;

implementation

uses func;

{$R *.dfm}

procedure Tfrm_Public_Don.SpeedButton1Click(Sender: TObject);
begin
    //单据过帐
    if Cmd_Check_Filsh(trim(no)) then
    begin
    func.Public_Do_Result:='';
    func.Public_Do_Result:='01';
    Close;
    end else
    begin
      application.MessageBox('该单据尚未完全审核，不能入帐！',pchar(application.Title),mb_iconinformation);
      exit; 
    end;
end;

procedure Tfrm_Public_Don.SpeedButton2Click(Sender: TObject);
begin
    func.Public_Do_Result:='';
    func.Public_Do_Result:='02';
    Close;
end;

procedure Tfrm_Public_Don.SpeedButton3Click(Sender: TObject);
begin
    Public_Do_Result:='';
    Public_Do_Result:='03';
    Close;
end;

procedure Tfrm_Public_Don.SpeedButton4Click(Sender: TObject);
begin
  Public_Do_Result:='';
  Close;
end;

end.
