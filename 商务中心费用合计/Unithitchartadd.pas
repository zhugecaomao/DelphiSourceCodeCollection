unit Unithitchartadd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, ComCtrls;

type
  TF_hitchartadd = class(TForm)
    cbb1: TComboBox;
    dtp1: TDateTimePicker;
    pnl1: TPanel;
    btn2: TBitBtn;
    btn1: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_hitchartadd: TF_hitchartadd;

implementation
uses  UDM;


{$R *.dfm}

procedure TF_hitchartadd.FormShow(Sender: TObject);
  begin
    edt1.Text:='';
    edt2.Text:='';
    cbb1.Text:='';
    dtp1.Date:=Date;
    with dm.qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from bumen_table');
      Prepared;
      Open;
    end;
    cbb1.Items.Clear;
    while not dm.qry1.Eof do
    begin
      cbb1.Items.Append(dm.qry1.fieldbyname('bumen').AsString);
      DM.qry1.Next;
    end;
  end;

procedure TF_hitchartadd.btn2Click(Sender: TObject);
  begin
   close;
  end;

procedure TF_hitchartadd.btn1Click(Sender: TObject);
 begin
   with dm.ADOTEMP do
   begin
     Close;
     SQL.Clear;
     SQL.Add('insert into center');
     SQL.Add('values(:npage,:wpage,:t_time)');
     Parameters.ParamByName('npage').Value:=StrToInt(edt1.Text);
     Parameters.ParamByName('wpage').Value:=StrToInt(edt2.Text);
     Parameters.ParamByName('t_time').Value:=dtp1.Date;
     try
      ExecSQL;
      except
      MessageBox(Handle,'插入数据失败!','系统提示',MB_ICONINFORMATION+MB_OK);
      Exit;
     end;
   end;
   dm.qryadoq2.Close;
   dm.qryadoq2.Open;
   
 end;

end.
