unit Stock_Write_Check;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMenu, Grids, DBGrids, Buttons;

type
  Tfrm_Stock_Write_Check = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Cmd_Check: TSpeedButton;
    Cmd_Close: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure Cmd_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cmd_CheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Stock_Write_Check: Tfrm_Stock_Write_Check;

implementation

uses Data, func, untdatadm;

{$R *.dfm}
procedure Tfrm_Stock_Write_Check.FormShow(Sender: TObject);
var
    sqlsub:widestring;
    i:integer;
begin        
    //sqlsub:='Select receipt_no,receipt_name,copy_date,proposer,Condense from [receipt] where flag_sign='+''''+'单据'+''''+' and Check_Result=6  and receipt_name='+''''+'来货登记单'+''''+' and Re_Part='+''''+trim(Handle_Part)+'''';
    sqlsub:='Select receipt_no,receipt_name,copy_date,proposer,Condense from [receipt] where flag_sign='+''''+'单据'+''''+' and Check_Result=6  and receipt_name='+''''+'来货登记单'+'''';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=adisp.execSql(sqlsub);
    dmmain.CDSexecsql.Open;
end;

procedure Tfrm_Stock_Write_Check.Cmd_CloseClick(Sender: TObject);
begin
     DMMAIN.CDSexecsql.Close;
    dmmain.CDSexecsql .Data:=null;
    Close;
end;

procedure Tfrm_Stock_Write_Check.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DMMAIN.CDSexecsql.Close;
    dmmain.CDSexecsql .Data:=null;
    Action:=Cafree;
end;

procedure Tfrm_Stock_Write_Check.Cmd_CheckClick(Sender: TObject);
begin
    if dmmain.CDSexecsql.IsEmpty  then
    begin
        Application.MessageBox('请选择单据编号！',pchar(application.Title),mb_iconinformation);
        Exit;
    end
    else
    begin
        if LHXZ_Str='Quality_Check_001' then
        begin
            LHXZ_Str_Result:='Quality_Check_001';
            LHXZ_Str_List_NO:=Trim(dmmain.CDSexecsql.fieldbyname('receipt_NO').AsString);
            Close;
        end;
    end;
end;

end.
