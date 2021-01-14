unit ExportRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, CheckLst, DB, ADODB;

type
  TExportRecord_frm = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    memosql: TMemo;
    btnRun: TBitBtn;
    txtwheresql: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtTabID: TEdit;
    lboxfield: TCheckListBox;
    btnGetfield: TSpeedButton;
    ADOQuery1: TADOQuery;
    btnClose: TBitBtn;
    SaveDialog1: TSaveDialog;
    btnexp: TBitBtn;
    RG_Type: TRadioGroup;
    procedure btnRunClick(Sender: TObject);
    procedure btnGetfieldClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure btnexpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
        procedure getsql(field, id, wheresql:string);
        procedure getSelect(field, id, wheresql:string);
        procedure getUpdate(field, id, wheresql:string);
  public
    TabID :string;
  end;

var
  ExportRecord_frm: TExportRecord_frm;

implementation

uses DataModule;

{$R *.dfm}

procedure TExportRecord_frm.getsql(field, id, wheresql:string);
var i,j :integer;
    insfield, insvalue, sqlstr:string;
begin
   memosql.Lines.Clear;
   with ADOQuery1 do
   begin
      close;
      sql.Clear;
      sqlstr :='select ' + field + ' from ' + txtTabID.Text + ' where 1=1' + wheresql ;
      sql.Add(sqlstr);
      memosql.Lines.Add(sql.Text);
      try
        open();
        memosql.Lines.Clear;
        for i:=0 to RecordCount -1 do
        begin
          insfield :='';
          insvalue :='';
          for j:=0 to FieldCount -1 do
          begin
            if Fields[j].DataType in[ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency] then
            begin
               insfield :=insfield + Fields[j].FieldName ;
               if not Fields[j].IsNull then
                  insvalue :=insvalue +Fields[j].AsString
               else
                  insvalue :=insvalue +'0';
            end
            else begin
               insfield :=insfield + Fields[j].FieldName ;
               if not Fields[j].IsNull then
                 insvalue :=insvalue + '''' + Fields[j].AsString + ''''
               else
                  insvalue :=insvalue +'''''';
            end;
            if j < FieldCount -1 then
            begin
              insvalue :=insvalue + ',';
              insfield :=insfield + ',';
            end;
          end;
          sqlstr:='Insert Into ' + id + '(' + insfield + ') Values(' + insvalue + ')';
          memosql.Lines.Add(sqlstr);
          next;
        end;
      except
         showmessage('打开表' +txtTabID.Text+ '出错');
         exit;
      end;
   end;

end;

procedure TExportRecord_frm.getSelect(field, id, wheresql:string);
var i,j :integer;
    insfield, insvalue, sqlstr:string;
begin
   memosql.Lines.Clear;
   sqlstr :='select ' + field + ' from ' + txtTabID.Text + ' where 1=1' + wheresql ;
   memosql.Lines.Add(sqlstr);
end;

procedure TExportRecord_frm.getUpdate(field, id, wheresql:string);
var i,j :integer;
    insfield, insvalue, sqlstr:string;
begin
   memosql.Lines.Clear;
   with ADOQuery1 do
   begin
      close;
      sql.Clear;
      sqlstr :='select ' + field + ' from ' + txtTabID.Text + ' where 1<>1';
      sql.Add(sqlstr);
      memosql.Lines.Add(sql.Text);
      try
        open();
        memosql.Lines.Clear;
          for j:=0 to FieldCount -1 do
          begin
            if Fields[j].DataType in[ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency] then
            begin
               insfield :=insfield + Fields[j].FieldName ;
               if not Fields[j].IsNull then
                  insvalue :=insvalue + Fields[j].FieldName + '='+ Fields[j].AsString
               else
                  insvalue :=insvalue + Fields[j].FieldName + '=0';
            end
            else begin
               insfield :=insfield + Fields[j].FieldName ;
               if not Fields[j].IsNull then
                 insvalue :=insvalue + Fields[j].FieldName + '=''' + Fields[j].AsString + ''''
               else
                  insvalue :=insvalue + Fields[j].FieldName + '=''''';
            end;
            if j < FieldCount -1 then
            begin
              insvalue :=insvalue + ',';
              insfield :=insfield + ',';
            end;
          end;
          sqlstr:='Update ' + id + ' Set ' + insvalue + ' where 1=1' + wheresql ;
          memosql.Lines.Add(sqlstr);
          next;
      except
         showmessage('打开表' +txtTabID.Text+ '出错');
         exit;
      end;
   end;

end;

procedure TExportRecord_frm.btnRunClick(Sender: TObject);
var i:integer; sqlstr,   fields:string;
begin
  if lboxfield.Items.Count =0 then exit;
  if RG_Type.ItemIndex=0 then
  begin
    fields :='';
    for I:=0 to lboxfield.Items.Count -1 do     //获取字段
    begin
      if lboxfield.Checked[i] then
      begin
        fields :=fields + lboxfield.Items[i] + ',';
      end;
    end;
    if fields <>''  then
    begin
       fields :=copy(fields, 0, length(fields) -1);
    end;
    getsql(fields, txtTabID.Text, txtwheresql.Text);
  end
  else if RG_Type.ItemIndex =1 then
  begin
    fields :='';
    for I:=0 to lboxfield.Items.Count -1 do     //获取字段
    begin
      if lboxfield.Checked[i] then
      begin
        fields :=fields + lboxfield.Items[i] + ',';
      end;
    end;
    if fields <>''  then
    begin
       fields :=copy(fields, 0, length(fields) -1);
    end;
    memosql.Lines.Clear;
    sqlstr :='select ' + fields + ' from ' + txtTabID.Text + ' where 1=1' + txtwheresql.Text ;
    memosql.Lines.Add(sqlstr);
  end
  else if RG_Type.ItemIndex =2 then
  begin
    fields :='';
    for I:=0 to lboxfield.Items.Count -1 do     //获取字段
    begin
      if lboxfield.Checked[i] then
      begin
        fields :=fields + lboxfield.Items[i] + ',';
      end;
    end;
    if fields <>''  then
    begin
       fields :=copy(fields, 0, length(fields) -1);
    end;
    getUpdate(fields, txtTabID.Text, txtwheresql.Text);
  end
  else if RG_Type.ItemIndex=3 then
  begin
  end;
end;

procedure TExportRecord_frm.btnGetfieldClick(Sender: TObject);
var i:integer;
begin
   with ADOQuery1 do
   begin
      close;
      sql.Clear;
      sql.Add('select * from ' + txtTabID.Text + ' where 1<> 1');
      try
        open();
        lboxfield.Items.Clear;
        for i:=0 to ADOQuery1.FieldCount -1 do
        begin
          lboxfield.Items.Add(ADOQuery1.Fields[i].FieldName);
          lboxfield.Checked[i] :=true;
        end;
      except
         showmessage('打开表' +txtTabID.Text+ '出错');
         exit;
      end;
   end;
end;

procedure TExportRecord_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    //VK_F9  : if btnTabInfoFieldadd.Enabled then  btnTabInfoFieldadd.Click;
    //VK_F4 : if btnTabInfoFieldedit.Enabled then  btnTabInfoFieldedit.Click;
    VK_ESCAPE : if btnClose.Enabled then  btnClose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TExportRecord_frm.btnCloseClick(Sender: TObject);
begin
  close();
end;

procedure TExportRecord_frm.btnexpClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    memosql.Lines.SaveToFile(SaveDialog1.FileName);
  end;

end;

procedure TExportRecord_frm.FormShow(Sender: TObject);
begin
  txttabid.Text :=TabID;
end;

end.
