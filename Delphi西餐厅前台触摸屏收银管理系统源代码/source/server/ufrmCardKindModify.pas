unit ufrmCardKindModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModifyDataBase, ImgList, StdCtrls, Buttons, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, dxCntner, DB, ADODB, CSADOQuery;

type
  TfrmCardKindModify = class(TfrmModifyDataBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eKindId: TdxDBEdit;
    eKindName: TdxDBEdit;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    eChbisSaving: TdxDBCheckEdit;
    Viewqkind_id: TIntegerField;
    Viewqkind_name: TStringField;
    Viewqis_saving: TBooleanField;
    Viewqis_discount: TBooleanField;
    Viewqdiscount_point: TFloatField;
    Label4: TLabel;
    eChbIsDiscount: TdxDBCheckEdit;
    Label5: TLabel;
    eDiscount: TdxDBEdit;
    procedure bbtnConfirmClick(Sender: TObject);
  private
    function prif_CanSave: Boolean;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmCardKindModify: TfrmCardKindModify;

implementation
uses udmData, ufrmBase;
{$R *.dfm}

{ TfrmCardKindModify }

procedure TfrmCardKindModify.prop_IniData;
begin
  inherited;
  case Ri_Flag of
    1:
    begin
      Caption := Format(Caption, ['[添加]']);
      with Viewq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := 'SELECT * FROM cardkind WHERE 1 = 2';
        Open;
        Append;
        FieldByName('is_saving').AsBoolean := True;
        FieldByName('is_discount').AsBoolean := True;
      end;
    end;
    2:
    begin
      Caption := Format(Caption, ['[修改]']);
      with Viewq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM cardkind WHERE kind_id = %d', [StrToInt(Rs_Id)]);
        Open;
        Edit;
      end;
    end;
    3:
    begin
      Caption := Format(Caption, ['[删除]']);
      with Viewq do
      begin
        if Active then Close;
        Connection := dmData.adocon;
        SQL.Text := Format('SELECT * FROM cardkind WHERE kind_id = %d', [StrToInt(Rs_Id)]);
        Open;
      end;
    end;
  end;
end;

function TfrmCardKindModify.prif_CanSave: Boolean;
begin
  if (Length(Trim(Viewq.FieldByName('kind_name').AsString)) = 0) or
    (Viewq.FieldByName('kind_name').IsNull) then
  begin
    eKindName.SetFocus;
    DispInfo('名称不能为空!');
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmCardKindModify.bbtnConfirmClick(Sender: TObject);
begin
  inherited;
  case Ri_Flag of
    1:
    begin
      if not prif_CanSave then Exit; 
      Viewq.Post;
      if DispInfo('添加数据完成，是否继续添加？', 3) = 'y' then
      begin
        Viewq.Append;    
        Viewq.FieldByName('is_saving').AsBoolean := True;
        Viewq.FieldByName('is_discount').AsBoolean := True;
      end else ModalResult := mrOk;
    end;
    2:
    begin
      if not prif_CanSave then Exit;
      Viewq.Post;
      DispInfo('数据修改完成', 2);
      ModalResult := mrOk;
    end;
    3:
    begin
      if DispInfo('您是否要确认删除当前数据？', 3) = 'y' then
      begin
        Viewq.Delete;
        ModalResult := mrOk;
      end;
    end;
  end;
end;

end.
