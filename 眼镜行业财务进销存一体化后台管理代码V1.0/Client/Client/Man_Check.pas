unit Man_Check;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, XPMenu, StdCtrls, Buttons;

type
  Tfrm_Man_Check = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ViewVerify(LISTv:TLISTVIEW;Sno:STRING);
  public
    { Public declarations }
    Sno:string;
  end;

var
  frm_Man_Check: Tfrm_Man_Check;

implementation

uses Data, func, Examine_Verify, untdatadm;

{$R *.dfm}
 /////////////////////////
procedure Tfrm_Man_Check.ViewVerify(LISTv:TLISTVIEW;Sno:STRING);
VAR
  I,j:INTEGER;
  Sm:string;
BEGIN
  if trim(Sno)<>'' then
  begin
    i:=pos(',',Sno);
    Sm:=copy(sno,1,i-1);
    if i=0 then
    begin
      sm:=sno;
      i:=1;
    end;
  end;
  while i>0 do
  begin
    for j:=0 to listv.Items.Count-1 do
    begin
      if sm=trim(listv.Items.Item[j].Caption) then
      begin
        listv.Items.Item[j].Checked:=true;
      end;
    end;
    sno:=copy(sno,i+1,length(sno)-i);
    i:=pos(',',Sno);
    Sm:=copy(sno,1,i-1);
  end;
END;
 ///////////////////////////
procedure Tfrm_Man_Check.FormShow(Sender: TObject);
var
    ListItems: TListItem;
    sql:widestring;
begin
    ListView1.Clear;
    sql:='Select p_no,p_name,p_workname from dp_person';
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=adisp.execSql(sql);
    dmmain.CDSexecsql.Open;
    while not dmmain.CDSexecsql.Eof  do
    begin
        with ListView1 do
        begin
            ListItems := Items.Add;
            Listitems.Caption :=dmmain.CDSexecsql.fieldbyname('p_no').AsString;
            Listitems.SubItems.Add(dmmain.CDSexecsql.fieldbyname('p_name').AsString);
            Listitems.SubItems.Add(dmmain.CDSexecsql.fieldbyname('p_workname').AsString);
       end;
       dmmain.CDSexecsql.Next;
    end;
    dmmain.CDSexecsql.Close;
    dmmain.CDSexecsql.Data:=null;
    ViewVerify(listview1,Sno);
end;

procedure Tfrm_Man_Check.btnOkClick(Sender: TObject);
var
  list:tlistitem;
  i:integer;
begin
  if listview1.Selected<>nil then
  begin
    list:= listview1.Selected;
    man_select:=list.SubItems[0];
    man_no:=list.Caption;
  end else
  begin
    man_select:='';
    man_no:='';
    for i:=0 to listview1.Items.Count-1 do
    begin
      list:= listview1.Items[i];
      if list.Checked then
      begin
        if trim(man_select)='' then
        begin
          man_select:=list.SubItems[0];
          man_no:=list.Caption;
        end else
        begin
          man_select:=man_select+','+list.SubItems[0];
          man_no:=man_no+','+list.Caption;
        end;
      end;
    end;
    man_select:=man_select+',';
    man_no:=man_no+',';
    if trim(man_select)=',' then
    begin
      application.MessageBox('«Î—°‘Ò…Û∫À»À‘±£°',pchar(application.Title),mb_iconinformation);
      exit;
    end;
  end;

    if Man_Public_Code='SH_01' then
    begin
        man_Select:=man_Select;
        frm_Examine_Verify.Edit11.Text:=man_no;
        frm_Examine_Verify.Edit1.Text:=man_select;

    end;
    if Man_Public_Code='SH_02' then
    begin
        man_Select:=man_Select;
        frm_Examine_Verify.Edit2.Text:=man_select;
        frm_Examine_Verify.Edit22.Text:=man_no;

    end;
    if Man_Public_Code='SH_03' then
    begin
        man_Select:=man_Select;
        frm_Examine_Verify.Edit3.Text:=man_select;
        frm_Examine_Verify.Edit33.Text:=man_no;

    end;
    if Man_Public_Code='SH_04' then
    begin
        man_Select:=man_Select;
        frm_Examine_Verify.Edit4.Text:=man_select;
        frm_Examine_Verify.Edit44.Text:=man_no;
    end;
    if Man_Public_Code='SH_05' then
    begin
        man_Select:=man_Select;
        frm_Examine_Verify.Edit5.Text:=man_select;
        frm_Examine_Verify.Edit55.Text:=man_no;
    end;
  list.Free;
  list:=nil;
  close;
end;

procedure Tfrm_Man_Check.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Man_Check.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

end.
