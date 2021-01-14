unit C_Yskjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Mask, C_Define;

type
  TYskjzForm = class(TStdJdForm)
    Label1: TLabel;
    lblKhmc: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtJzrq: TMaskEdit;
    edtJzsj: TMaskEdit;
    radJzfs: TRadioGroup;
    cmbJz: TComboBox;
    procedure radJzfsClick(Sender: TObject);
    procedure edtJzrqExit(Sender: TObject);
    procedure edtJzsjExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FJzxx: TYskJzxx;
    FKhbh: string;
    FJzfs: string;
    FXykbh: string;
    FJzrq: TDateTime;
    FJzsj: TDateTime;
    procedure ShowKhxx;
    function IsValid: Boolean;
  public
    { Public declarations }
  end;

var
  YskjzForm: TYskjzForm;

function Yskjz(const AKhbh: string): TYskJzxx;

implementation

uses C_HotelData;

{$R *.dfm}

function Yskjz(const AKhbh: string): TYskJzxx;
begin
  YskjzForm := TYskjzForm.Create(Application);
  try
    with YskjzForm do
    begin
      FKhbh := AKhbh;
      edtJzrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtJzsj.Text := FormatDateTime('hh:mm',Time);
      FJzrq := Date;
      FJzsj := Time;
      FJzfs := JZFS_RMB;
      ShowKhxx;
      ShowModal;
      if ModalResult = mrOK then
        FJzxx.AJzfs := '';
      Result := FJzxx;
    end;
  finally
    YskjzForm.Free;
  end;
end;

function TYskjzForm.IsValid: Boolean;
begin
  Result := False;
  case radJzfs.ItemIndex of
    1:
      begin
        FXykbh := HotelData.FindBh('XYK.DB','D_XYKBH','D_XYKMC',cmbJz.Text);
        if FXykbh<>'' then
          Result := True
        else
          ShowInfo('«Î—°‘Ò–≈”√ø®£°');
      end;
    else
      Result := True;
  end;
end;

procedure TYskjzForm.ShowKhxx;
begin
  lblKhmc.Caption := HotelData.FindMc('KHDA.DB','D_KHBH','D_KHMC',FKhbh);
end;

procedure TYskjzForm.radJzfsClick(Sender: TObject);
begin
  inherited;
  cmbJz.Items.Clear;
  cmbJz.Style := csDropDownList;
  case radJzfs.ItemIndex of
    0: FJzfs := JZFS_RMB;
    1:
      begin
        HotelData.ListMc(cmbJz,'XYK.DB','D_XYKMC');
        FJzfs := JZFS_XYK;
      end;
    2: FJzfs := JZFS_ZP;
  end;
end;

procedure TYskjzForm.edtJzrqExit(Sender: TObject);
begin
  inherited;
  FJzrq := StrToDate(edtJzrq.Text);
end;

procedure TYskjzForm.edtJzsjExit(Sender: TObject);
begin
  inherited;
  FJzsj := StrToTime(edtJzsj.Text);
end;


procedure TYskjzForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not IsValid then Exit;
  FJzxx.AKhbh := FKhbh;
  FJzxx.AJzrq := FJzrq;
  FJzxx.AJzsj := FJzsj;
  FJzxx.AJzfs := Fjzfs;
  FJzxx.AXykbh:= FXykbh;
  Close;
end;

end.
