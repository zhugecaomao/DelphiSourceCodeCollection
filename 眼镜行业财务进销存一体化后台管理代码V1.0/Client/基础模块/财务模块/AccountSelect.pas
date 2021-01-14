unit AccountSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, Menus, ImgList,
   Db, DBClient,Variants;

type


  TAccountSelectFm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel4: TPanel;
    Label2: TLabel;
    Bevel3: TBevel;
    BtnQuit: TSpeedButton;
    Panel6: TPanel;
    BtnSelect: TSpeedButton;
    SupGrids1: TStringGrid;
    BtnEdit: TSpeedButton;
    BtnAdd: TSpeedButton;
    ModifyExeCuter: TClientDataSet;
    BtnClassify: TSpeedButton;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    procedure BtnQuitClick(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure SupGrids1DblClick(Sender: TObject);
    procedure SupGrids1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SupGrids1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnEditClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    szParentValue:string;
    nParentRow  :integer;
    szIniParid,szAccountType  :string;
    procedure OpenDB(cParid:string);
    procedure RefreshGrid;
     procedure GoParent;
    { Private declarations }
  public
    czTypeid,czParid,szSysFlag:string;
    lyLevel,czSonNum  : integer;
    czList : TStringList;
    { Public declarations }
  end;

var
  AccountSelectFm: TAccountSelectFm;
  function AccountSelectShow(var UserCode,AccountId,AccountName:string;AccountType:string):integer;

implementation

uses ModifyAccount, func, untdatadm, Data;


{$R *.DFM}
{需要先赋值的变量
     AccountId        账户类型：
     00000                   会计科目
     0000100004              银行账户
     0000100002              固定资产
     0000300003              其他收入
     0000400003              费用合计

     AccountType:
        1:银行帐户

 }
function AccountSelectShow(var UserCode,AccountId,AccountName:string;AccountType:string):integer;
begin
  AccountSelectFm:=TAccountSelectFm.Create(nil);
  if (Copy(AccountId,1,10)='0000400003') then AccountSelectFm.czParid:='0000400003'
  else
  if (Copy(AccountId,1,10)='0000300003') then AccountSelectFm.czParid:='0000300003'
  else
  if (Copy(AccountId,1,10)='0000100002') then AccountSelectFm.czParid:='0000100002'
  else AccountSelectFm.czParid := AccountId;
  AccountSelectFm.szAccountType:=AccountType;
  AccountSelectFm.szIniParid := AccountSelectFm.czParid;
  AccountSelectFm.ShowModal;
  if AccountSelectFm.ModalResult = mrok then
     begin
       dmmain.cdsdata.RecNo := AccountSelectFm.supgrids1.Row;
       with dmmain.cdsdata Do
         begin
           AccountId   := Fieldbyname('AccountId').value;
           AccountName := Fieldbyname('AccountName').value;
           UserCode    := Fieldbyname('UserCode').value;
         end;
       AccountSelectFm.Free;
       Result := 1;
     end
  else
     begin
       AccountSelectFm.Free;
       Result := 0;
     end;
end;

procedure TAccountSelectFm.OpenDB(cParid:string);
var
  sqlpub:widestring;
  datas:olevariant;
begin
  if szAccountType='' then szAccountType:='%%';
  screen.Cursor:=crSQLWait;
  sqlpub:='select * from AccountTable where parid='''+cParid+''' and deleted=0 and AccountType like '''+szAccountType+'''';
  dmmain.cdsdata.Close;
  dmmain.cdsdata.data:=null;
  datas:=null;
  try
    ipubtemp.ty_query(sqlpub,datas);
    if not varisnull(datas) then
    begin
      dmmain.cdsdata.Data:=datas;
      dmmain.cdsdata.open;
    end;
  except
  end;
  datas:=null;
  screen.Cursor:=crDefault;
end;


procedure TAccountSelectFm.GoParent;
var
 i:integer;
 s:string;
begin
        if czlist.Count=0 then exit;
        if dmmain.cdsdata.RecordCount>=1 then
        begin
          dmmain.cdsdata.recno := 1;
          szParentValue:=dmmain.cdsdata.fieldbyname('parid').value;
        end;

          if length(szIniParid)=10 then
             begin
               opendb(czList.strings[lylevel-4]);
               czlist.Delete(lyLevel-4);
              end
           else if szIniParid<>'00000' then
             begin
               opendb(czList.strings[lylevel-3]);
               czlist.Delete(lyLevel-3);
              end
           else
             begin
               opendb(czList.strings[lylevel-2]);
               czlist.Delete(lyLevel-2);
              end;
          lyLevel:= dmmain.cdsdata.fieldbyname('Level').AsInteger;  //.value;

          s:=label2.Caption;
           for  i:=length(s)  downto 1 do
             begin
               if s[i]='\' then break;
             end;
             s:=copy(s,0,i-1);
          label2.caption :=s;

          refreshGrid;
          supgrids1.Row:=nParentRow;
end;

procedure TAccountSelectFm.RefreshGrid;
var
 i: integer;
begin
 i:=1;
  screen.Cursor:=crHourGlass;
  clearGrid(supgrids1);
  with dmmain.cdsdata do
   begin
     First;
     if RecordCount< 18 then
          supgrids1.RowCount:=18
     else
          supgrids1.RowCount:= RecordCount+1;
          while not Eof do
          begin
            if fieldbyname('sonCount').value<>0 then
               supgrids1.Cells[0,i]:= inttostr(i)+'..↓'
            else
            supgrids1.cells[0,i] := inttostr(i);
            if (szParentValue<>'') and (Fieldbyname('AccountId').value=szParentValue) then
               nParentRow:=i;
            supgrids1.Cells[1,i]:=  Fieldbyname('AccountName').value;
            supgrids1.Cells[2,i]:=  Fieldbyname('usercode').value;
            supgrids1.Cells[3,i]:=  Fieldbyname('comment').value;
            i:=i+1;
            Next;
          end;
   end;
  supgrids1.Row:=1;
  supgrids1.Refresh;
  screen.Cursor:=crDefault;
end;

procedure TAccountSelectFm.BtnQuitClick(Sender: TObject);
begin
 close;
end;

procedure TAccountSelectFm.BtnSelectClick(Sender: TObject);
begin
 if trim(supgrids1.Cells[0,supgrids1.row]) = inttostr(supgrids1.row)+'..↓' then
    supgrids1dblclick(Sender)
 else
   if supgrids1.Cells[0,supgrids1.row]= '' then
       exit
   else
       begin
       dmmain.cdsdata.RecNo:=SupGrids1.row;
       czTypeid:=trim(dmmain.cdsdata.fieldbyname('AccountId').value);
       ModalResult := mrOK;
       end;
end;

procedure TAccountSelectFm.SupGrids1DblClick(Sender: TObject);
var
 cparid,cTypeId:string;
begin
 if Trim(SupGrids1.Cells[1,SupGrids1.Row])='' then Exit;
 if trim(supgrids1.Cells[0,supgrids1.row]) = inttostr(supgrids1.row)+'..↓' then
 begin
         label2.Caption := label2.Caption+'\'+trim(supgrids1.cells[1,supgrids1.row]);
         dmmain.cdsdata.recno := supgrids1.row;
         cparid := dmmain.cdsdata.fieldbyname('parid').asstring;  //value;
         ctypeid := trim(dmmain.cdsdata.fieldbyname('AccountId').AsString);  //.value);
         OpenDB(cTypeid);
         czList.Add(cParid);
         lyLevel := dmmain.cdsdata.FieldbyName('level').AsInteger;  // .value;
          ///ydy add 空值时要出错
//         if  cdsdata.FieldbyName('level').value <> null then

         RefreshGrid;
 end
 else
  if BtnSelect.Visible then BtnSelectClick(sender) else BtnEditClick(BtnEdit);
end;

procedure TAccountSelectFm.SupGrids1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then  BtnSelectClick(sender);
 if Key = VK_ESCAPE then
       if czlist.Count=0 then
          close
       else
           GoParent;
end;

procedure TAccountSelectFm.SupGrids1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 i:integer;
 s:string;
begin
  if button = mbRight then
     begin
        if czlist.Count=0 then exit;
        if dmmain.cdsdata.RecordCount>=1 then
        begin
          dmmain.cdsdata.recno := 1;
          szParentValue:=dmmain.cdsdata.fieldbyname('parid').value;
        end;

          if length(szIniParid)=10 then
             begin
               opendb(czList.strings[lylevel-4]);
               czlist.Delete(lyLevel-4);
              end
           else if szIniParid<>'00000' then 
             begin
               opendb(czList.strings[lylevel-3]);
               czlist.Delete(lyLevel-3);
              end
           else
             begin
               opendb(czList.strings[lylevel-2]);
               czlist.Delete(lyLevel-2);
              end;
          lyLevel:= dmmain.cdsdata.fieldbyname('level').AsInteger;  //.value;
          s:=label2.Caption;
           for  i:=length(s)  downto 1 do
             begin
               if s[i]='\' then break;
             end;
             s:=copy(s,0,i-1);
          label2.caption :=s;
          refreshGrid;
          supgrids1.Row:=nParentRow;
     end;
end;

procedure TAccountSelectFm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 czlist.Free;
end;

procedure TAccountSelectFm.FormShow(Sender: TObject);
var
  nWidth:integer;
begin
  if czParid = '00000' then
     begin
        BtnEdit.Visible:=true;
        BtnAdd.Visible:=true;
        BtnClassify.Visible:=true;
        SpeedButton1.Visible:=true;
        BtnSelect.Visible:=false;
     end;
  SupGrids1.Cells[0,0]:='行号';
  SupGrids1.ColWidths[0] := 50;
  SupGrids1.Cells[1,0]:='帐户名称';
  SupGrids1.ColWidths[1] := 220;
  SupGrids1.Cells[2,0]:='帐户编号';
  SupGrids1.Cells[3,0]:='说明';
  nWidth := SupGrids1.Width;
  czList :=TstringList.Create;
  lyLevel:=2;
  szParentValue:='';
  nParentRow:=1;
  if szIniParid = '0000100004' then
     caption:='【银行帐户】选择'
  else if szIniParid = '0000300003' then
     caption:='【其他收入项目】选择'
  else if szIniParid = '0000400003' then
//     caption:='[费用合计]选择'
     caption:='【费用项目】选择'
  else if szIniParid = '0000100002' then
     caption:='【固定资产】选择'
  else caption:='【账户选择】';
//  else caption:='账户管理和维护';
  openDB(czParid);
  refreshGrid;
  label2.Caption := '\';
end;


procedure TAccountSelectFm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  nWidth:integer;
begin
  nWidth := SupGrids1.Width;
end;

procedure TAccountSelectFm.BtnEditClick(Sender: TObject);
var czTypeid,czParid,czAccountName,czComment,czUserCode:string;
    ccParid:string;
begin
       czParid:='00000';
       if  dmmain.cdsdata.RecordCount>=SupGrids1.row then
         begin
           if (trim(supgrids1.Cells[0,supgrids1.row]) = inttostr(supgrids1.row)+'..↓')
              and (trim((Sender as TSpeedButton).Caption)<> '添加') then
             begin
              //supgrids1dblclick(Sender);
              //exit;
             end;
           dmmain.cdsdata.RecNo:=SupGrids1.row;
           czTypeid:=trim(dmmain.cdsdata.fieldbyname('AccountId').asstring);
           czParid :=trim(dmmain.cdsdata.fieldbyname('Parid').asstring);
           czAccountName :=trim(dmmain.cdsdata.fieldbyname('AccountName').asstring);
           czComment :=trim(dmmain.cdsdata.fieldbyname('Comment').asstring);
           czUserCode :=trim(dmmain.cdsdata.fieldbyname('UserCode').asstring);
         end;
       if trim((Sender as TSpeedButton).Caption)= '添加' then
          begin
            if supgrids1.Cells[0,supgrids1.row]= '' then
               exit;
            czTypeid:='';
            czAccountName:='';
            czComment:='';
            czUserCode:='';
          end;
       ccParid:=czParid;
       if trim((Sender as TSpeedButton).Caption)= '分类' then
       begin
           if supgrids1.Cells[0,supgrids1.row]= '' then
               exit;
           czParid  := czTypeid;
           czTypeid:='';
           czAccountName:='';
           czComment:='';
           czUserCode:='';
       end;
       ModifyShow(czParid,czTypeid,czAccountName,czUserCode,czComment);
       openDB(ccParid);
       refreshGrid;
end;

procedure TAccountSelectFm.SpeedButton1Click(Sender: TObject);
var
  czTypeid,czParid:string;
  sql:widestring;
begin
  czTypeid:=trim(dmmain.cdsdata.fieldbyname('AccountId').asstring);
  czParid :=trim(dmmain.cdsdata.fieldbyname('Parid').asstring);
  sql:='update accounttable set deleted=1 where accountid='''+czTypeid+'''';
  try
    adisp.updatesql(sql);
  except
  end;
  opendb(czParid);
  refreshGrid;
end;

end.
