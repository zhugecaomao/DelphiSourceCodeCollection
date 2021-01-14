unit gdsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, wwdblook, DB, ADODB, Mask,
  wwdbedit, Wwdbspin, RegControls;

type
  TfrmGdsUnit = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lvUnit: TListView;
    Button2: TButton;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    edUnit: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Button3: TButton;
    Panel2: TPanel;
    StaticText4: TStaticText;
    GroupBox3: TGroupBox;
    StaticText5: TStaticText;
    labgdsName: TStaticText;
    btnAdd: TButton;
    wwDBLookupCombo1: TwwDBLookupCombo;
    lcGdsId: TwwDBLookupCombo;
    wwDBEdit1: TwwDBEdit;
    edBaseUnit: TwwDBEdit;
    spExpr: TwwDBSpinEdit;
    Qry: TADOQuery;
    labSelect: TStaticText;
    RegForm1: TRegForm;
    procedure FormActivate(Sender: TObject);
    procedure lcGdsIdChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lvUnitSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    selectedunit: string;
    { Public declarations }
  end;

var
  frmGdsUnit: TfrmGdsUnit;

implementation

uses data;

{$R *.dfm}

procedure TfrmGdsUnit.FormActivate(Sender: TObject);
begin
  {  if not cbGdsId.Enabled then exit; //如果外面已传来参数，可以不做这个。节省时间
    with qry do
      begin
        if not active then open;
        while not eof do
          begin
            cbGdsId.Items.Clear;
            cbGdsId.Items.Add(fieldbyname('gdsid').value);
            next;
          end;
      end;
  }
end;

procedure TfrmGdsUnit.lcGdsIdChange(Sender: TObject);
var listItem: TListItem;
begin
  with dm.qryunit, lvUnit do
    begin
      close;
      Parameters.ParamByName('GdsID').value := lcGdsId.text;
      open;

      lvUnit.Clear;
      listItem := items.Add;
      listItem.Caption := FieldByName('baseunit').value;
      listItem.SubItems.add('1');
      listItem.SubItems.add(FieldByName('baseunit').asstring);

      while (not eof) do
        begin
          if FieldByName('unit').IsNull then exit;
          listItem := items.Add;
          listItem.Caption := FieldByName('unit').value;
          listItem.SubItems.add(FieldByName('equal').asstring);
          listItem.SubItems.add(FieldByName('baseunit').value);
          next;
        end;
    end;
end;

procedure TfrmGdsUnit.btnAddClick(Sender: TObject);
var
  listItem: TListItem;
begin
  if (edUnit.Text = '') or (spExpr.Value <= 0) then
    begin
      showmessage('单位或公式数值设计不对');
      edunit.SetFocus;
      exit;
    end;

  with qry, lvUnit do
    begin
      sql.Clear;
      sql.Add('insert unit values (:unit,:gdsid,:equal)');
      Parameters.ParamByName('GdsID').value := lcgdsid.text;
      Parameters.ParamByName('unit').value := edUnit.Text;
      Parameters.ParamByName('equal').value := spExpr.Value;
      try
        ExecSQL;
        listItem := items.Add;
        listItem.Caption := edUnit.Text;
        listItem.SubItems.add(floattostr(spExpr.Value));
        listItem.SubItems.add(edBaseUnit.Text);
      except
        showmessage('增加单位失败！');
        raise;
      end; //end of try
    end; //end of with
end;

procedure TfrmGdsUnit.Button2Click(Sender: TObject);
var
  listItem: TListItem;
begin
  with lvUnit, qry do
    begin
      listItem := Selected;
      if (lvUnit <> nil) and (lvunit.TopItem <> listItem) then
        begin
          qry.Close;
          sql.Clear;
          sql.Add('delete from unit where (gdsid = :gdsid) and');
          sql.Add('(unit = :unit)');
          Parameters.ParamByName('GdsID').value := lcgdsid.text;
          Parameters.ParamByName('unit').value := listItem.caption;
          try
            execsql;
            Selected.Delete;
          except
            showmessage('删除单位失败！');
            raise;
          end; //end of try
        end; //end of if
    end; //end of with
end;

procedure TfrmGdsUnit.lvUnitSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  selectedunit := item.Caption;
  labSelect.Caption := '选定的单位 :' + selectedunit;
  labSelect.Visible := true;
end;

procedure TfrmGdsUnit.FormCreate(Sender: TObject);
begin
  selectedunit := '';
end;

procedure TfrmGdsUnit.Button3Click(Sender: TObject);
begin
  close;
end;

end.
