unit Goods_Requirement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, FR_DSet,
  FR_DBSet, DBGrids, DB;

type
  Tfrm_Goods_Requirement = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    Edit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    Cmd_Select_Storage: TSpeedButton;
    Cmd_Select_Login: TSpeedButton;
    Cmd_Select_JSR: TSpeedButton;
    Cmd_Select_Shop: TSpeedButton;
    Edit_Storage_Name: TLabeledEdit;
    Edit5: TLabeledEdit;
    Edit6: TLabeledEdit;
    Edit7: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit3: TLabeledEdit;
    Edit_Shop_Name: TLabeledEdit;
    Edit4: TLabeledEdit;
    Edit2: TLabeledEdit;
    Panel7: TPanel;
    spbprint: TSpeedButton;
    Panel6: TPanel;
    StringGrid1: TStringGrid;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    edtgoodsremark: TLabeledEdit;
    Label1: TLabel;
    procedure Cmd_Select_ShopClick(Sender: TObject);
    procedure Cmd_Select_StorageClick(Sender: TObject);
    procedure Cmd_Select_JSRClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure Cmd_AddClick(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Cmd_Select_LoginClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure spbprintClick(Sender: TObject);
    procedure edtgoodsremarkChange(Sender: TObject);
  private
    { Private declarations }
    Pcol,Prow:integer;
    fl:string;   //判断是否草稿操作，见程序(FormShow)事件中
    procedure init;
    procedure DeleteRow(Row:Integer);
  public
    { Public declarations }
  end;

var
  frm_Goods_Requirement: Tfrm_Goods_Requirement;
  Total_Count:Integer;
implementation

uses ChildShop_Select, Storage_Select, Login_Man, func,  Data,
  untdatadm, Public_Don, Main, Business_Draft, UntgoodCodeSelStr,
  Goods_Requipment_Search, Unitreportxf, Unt_PubStrGrid;

{$R *.dfm}
procedure tfrm_goods_requirement.init;
var
  temp,make:string;
begin
  InitialStrGrid(stringgrid1,'商品需求');
  if Public_Do<>'Goods_Requirement_str' then exit;
  temp:='select max(right(stock_no,4)) from goods_requirement where copy_date='+''''+formatdatetime('yyyy''-''mm''-''dd',date)+''''+' and part_no='+''''+trim(Handle_Part)+'''';
  make:='SQ-'+trim(Handle_Part)+trim(handle_no);   //5-11 编码中用部门编号
  edit2.Text:=setcode(temp,make);
  edit1.Text:=formatdatetime('yyyy''-''mm''-''dd',date);
  edit6.Text:=trim(Handle_Man);
end;
procedure Tfrm_Goods_Requirement.DeleteRow(Row:Integer);
var
    i : integer;
begin
    //最后一列直接删除
    if (Row = StringGrid1.RowCount-1) and (row >1) then
        StringGrid1.RowCount := StringGrid1.RowCount - 1;
    //自动上移
    if (Row < StringGrid1.RowCount) and (Row > StringGrid1.FixedRows-1) then
    begin
        if Row < StringGrid1.RowCount - 1 then
        begin
            for i := Row to StringGrid1.RowCount-1 do
            StringGrid1.Rows[i] := StringGrid1.Rows[i+1];
            StringGrid1.RowCount :=StringGrid1.RowCount - 1;
        end;
    end;
end;
procedure Tfrm_Goods_Requirement.Cmd_Select_ShopClick(Sender: TObject);
begin
    ChildShop_Str:='';
    ChildShop_Result_NO:='';
    ChildShop_Result_Name:='';
    ChildShop_Str:='Goods_Requirement_str';
    frm_ChildShop_Select:=Tfrm_ChildShop_Select.Create(self);
    frm_ChildShop_Select.ShowModal;
    Edit4.Text:=ChildShop_Result_NO;
    Edit_Shop_Name.Text:=ChildShop_Result_Name;
    frm_ChildShop_Select.Free;
end;

procedure Tfrm_Goods_Requirement.Cmd_Select_StorageClick(Sender: TObject);
begin
    Check_Storage:='';
    Check_Storage_Result:='';
    Check_Storage:='Goods_Requirement_str';
    frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
    frm_Storage_Select.ShowModal;
    Edit_Storage_Name.Text:=Trim(Check_Storage_Result);
    Edit3.Text:=Trim(Check_Storage_Result_NO);
    frm_Storage_Select.Free;
end;

procedure Tfrm_Goods_Requirement.Cmd_Select_JSRClick(Sender: TObject);
begin
    Employe_Check:='';
    Employe_Check:='Goods_Requirement_str';
    Employe_Check_Result:='';
    frm_Login_Man:=Tfrm_Login_Man.Create(self);
    frm_Login_Man.Caption:='经手人选择';
    frm_Login_Man.ShowModal;
    Edit5.Text:=Employe_Check_Result;
    frm_Login_Man.Free;
end;

procedure Tfrm_Goods_Requirement.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
//ydy add 设置显示颜色
 with Sender as Tstringgrid do
        begin
        if gdSelected in State then
        Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
        Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
        if gdFocused in State then
        Canvas.DrawFocusRect(Rect);
        end;

//不但水平居中，还垂直居中
with Sender as Tstringgrid do
    begin
      Canvas.FillRect(Rect);
      s:=Cells[ACol,ARow];
      r:=Rect;
      DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
    end;
end;

procedure Tfrm_Goods_Requirement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMMAIN.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  dmmain.cdsprintmaster.Close;
  dmmain.cdsprintmaster.Data:=null;
  Action:=Cafree;
end;

procedure Tfrm_Goods_Requirement.FormCreate(Sender: TObject);
var
    FWidth:integer;
begin
    Scaled:=TRUE;
end;

procedure Tfrm_Goods_Requirement.FormShow(Sender: TObject);
var
  i:integer;
  tempstr:widestring;
begin
    init;
    if Public_Do='Goods_Requirement_str' then
    begin
        fl:='';
        StringGrid1.RowCount:=2;
    end;
    if (Public_Do='Requirement_0001')  then
    begin
//      tempstr:='Select a.*,b.*,c.* from Goods_Requirement as a ,Goods_Requirement_detail as b, goods_code as c where c.goods_no=b.goods_no and a.Contract_No=b.Contract_No and a.Contract_No='+''''+trim(List_No)+'''';
      fl:='edit';
      edit2.ReadOnly:=true;  //wy 草稿中不能修改单据编号，否则要乱套
      tempstr:='Select a.*,b.*,c.* from Goods_Requirement as a, Goods_Requirement_detail as b, Goods_code as c where a.stock_no=b.stock_no and b.goods_no=c.goods_no and a.Stock_NO='+''''+trim(List_No)+'''';
      dmmain.CDSquery2.Data:=null;
      dmmain.CDSquery2.Close;
      //dmmain.cdsprintmaster.Close;
      //dmmain.cdsprintmaster.Data:=null;
      try
      dmmain.CDSquery2.Data:=adisp.resultrecord(tempstr);
      dmmain.CDSquery2.Open;
      stringgrid1.RowCount:= dmmain.CDSquery2.RecordCount+1;
      except
      end;
      if not dmmain.CDSquery2.IsEmpty then       //返回记录集为空时在往下走要报错，Wy
      begin
          //
          edit1.Text:=ForMatDateTime('yyyy''-''mm''-''dd',dmmain.CDSquery2.FieldValues['Copy_Date']);
          edit2.Text:=dmmain.CDSquery2.FieldValues['Stock_NO'];
          edit3.Text:=dmmain.CDSquery2.FieldValues['Storage_NO'];
          Edit_Storage_Name.Text:=dmmain.CDSquery2.FieldValues['Shop_NO'];
          edit5.Text:=dmmain.CDSquery2.FieldValues['Transactor'];
          edit6.Text:=dmmain.CDSquery2.FieldValues['Proposer'];
          edit7.Text:=dmmain.CDSquery2.FieldValues['Condense'];
          edit8.Text:=dmmain.CDSquery2.FieldValues['R_Remark'];
          //******************
          for i:=1 to dmmain.CDSquery2.RecordCount  do //wy edit;
          begin
            StringGrid1.Cells[0,i]:=IntTostr(i); //表示第0列第i行的名称
            StringGrid1.Cells[1,i]:=trim(dmmain.CDSquery2.FieldByName('Goods_NO').AsString);
            StringGrid1.Cells[2,i]:=trim(dmmain.CDSquery2.FieldByName('Goods_Name').AsString);
            StringGrid1.Cells[3,i]:=trim(dmmain.CDSquery2.fieldbyname('R_Amount').AsString);
            StringGrid1.Cells[4,i]:=trim(dmmain.CDSquery2.FieldByName('Base_unit').AsString);
            StringGrid1.Cells[5,i]:=trim(dmmain.CDSquery2.FieldByName('Norms_Type').AsString);
            StringGrid1.Cells[6,i]:=trim(dmmain.CDSquery2.FieldByName('type').AsString);
            StringGrid1.Cells[7,i]:=trim(dmmain.CDSquery2.FieldByName('brand').AsString);
            StringGrid1.Cells[8,i]:=trim(dmmain.CDSquery2.FieldByName('breed').AsString);
            StringGrid1.Cells[9,i]:=trim(dmmain.CDSquery2.FieldByName('Color').AsString);
            StringGrid1.Cells[10,i]:=trim(dmmain.CDSquery2.FieldByName('ball').AsString);
            StringGrid1.Cells[11,i]:=trim(dmmain.CDSquery2.FieldByName('poll').AsString);
            StringGrid1.Cells[12,i]:=trim(dmmain.CDSquery2.FieldByName('provider').AsString);
            StringGrid1.Cells[13,i]:=trim(dmmain.CDSquery2.FieldByName('barcode').AsString);
            StringGrid1.Cells[14,i]:=trim(dmmain.CDSquery2.FieldByName('brand').AsString);
            StringGrid1.Cells[15,i]:=trim(dmmain.CDSquery2.FieldByName('Remark').AsString);
            dmmain.CDSquery2.Next;
          end;
          dmmain.cdsprintmaster.Close;
          dmmain.cdsprintmaster.Data:=null;
          dmmain.cdsprintmaster.Data:=dmmain.CDSquery2.data; //将数据转入打印
          dmmain.cdsprintmaster.Open;
          dmmain.CDSquery2.Close;
          dmmain.CDSquery2.Data:=null;
          spbprint.Enabled:=true;
      end else
      begin
          application.MessageBox('此需求单已不存在，请核对后更正！',pchar(application.Title),mb_iconinformation);
      end;
    end;

end;

procedure Tfrm_Goods_Requirement.Cmd_DeleteClick(Sender: TObject);
var
    i:shortint;
begin
   { if StringGrid1.col<>0 then
    begin
        StringGrid1.Rows[StringGrid1.Row].Clear; //删除选中行的所有列 ,用右键弹出菜单
        DeleteRow(StringGrid1.Row);
    end;
    for i:=1 to StringGrid1.RowCount do
    StringGrid1.cells[0,i]:=inttostr(i);}
    deletegridrows(stringgrid1,prow);
end;

procedure Tfrm_Goods_Requirement.Cmd_AddClick(Sender: TObject);
var
    i:integer;
begin
    StringGrid1.RowCount:=StringGrid1.RowCount+1;
    Total_Count:=StringGrid1.RowCount;
    for i:=1 to StringGrid1.RowCount-1 do
    begin
        StringGrid1.Cells[0,i]:=IntTostr(i); //表示第0列第i行
    end;
end;

procedure Tfrm_Goods_Requirement.Edit1DblClick(Sender: TObject);
begin
    Edit1.Text:=ForMatDateTime('yyyy''-''mm''-''dd',now);
end;

procedure Tfrm_Goods_Requirement.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key=#13 then
    begin
        Edit1.Text:=ForMatDateTime('yyyy''-''mm''-''dd',now);
    end;
end;

procedure Tfrm_Goods_Requirement.StringGrid1DblClick(Sender: TObject);
var
    SqlText:string;
    sqlsub:widestring;
    i:integer;
begin
  if pcol in [1,2] then
  begin
   fmgoodCodeSelStr:= TfmgoodCodeSelStr.Create(self);
   try
   fmgoodcodeselStr.show_mode:='10';
   fmgoodcodeselStr.ShowModal;
   finally
   fmgoodcodeselStr.Free;
   end;
  end;
  if pcol = 3 then  //复制数量
  begin
   for i := prow+1 to STRINGGRID1.rowcount -1 do
   begin
   STRINGGRID1.cells[3,i]:= STRINGGRID1.cells[3,prow];
   //同时要计算金额
   end;
  end;
end;


procedure Tfrm_Goods_Requirement.SpeedButton4Click(Sender: TObject);
var
  i:integer;
  sqlpub:widestring;
  flag:olevariant;
begin
    //wyedit
    frm_Public_Don:=Tfrm_Public_Don.Create(self);
    frm_Public_Don.no:=trim(edit2.Text);
    frm_Public_Don.ShowModal;
{    if Public_Do_Result='01' then  //单据过帐
    begin

    end;  }
    if Public_Do_Result='02' then  //存入草稿
    begin
        if Trim(Edit1.Text)='' then
        begin
            Application.MessageBox('操作错误,【录单日期】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
            Edit1.SetFocus;
            Exit;
        end;
        if Trim(Edit3.Text)='' then
        begin
            Application.MessageBox('操作错误,【需求仓库】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
            Edit3.SetFocus;
            Exit;
        end;
        {if Trim(Edit_Shop_Name.Text)='' then
        begin
            Application.MessageBox('操作错误,【需求店面】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
            Edit4.SetFocus;
            Exit;
        end;}
        if Trim(Edit5.Text)='' then
        begin
            Application.MessageBox('操作错误,【经手人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
            Edit5.SetFocus;
            Exit;
        end;
        if Trim(Edit6.Text)='' then
        begin
            Application.MessageBox('操作错误,【制单人】不能为空！，请确认！',pchar(application.Title),mb_iconwarning);
            Edit6.SetFocus;
            Exit;
        end;
        for i:=1 to StringGrid1.RowCount-1 do
        begin
            if trim(StringGrid1.Cells[3,i])='' then
            begin
                Application.MessageBox(pchar('操作错误,第<'+inttostr(i)+'>行【需求数量】为空！，请确认！'),pchar(application.Title),mb_iconwarning);
                stringgrid1.Row:=i;
                stringgrid1.Col:=3;
                Exit;
            end;
        end;
        if fl='edit' then
        begin
            ///////先删除数据再重新保存,如当修改操作
            //删除商品需求单
            if bedit then
            begin
              sqlpub:='delete  from [Goods_Requirement] where Copy_Date='''+Trim(Edit1.Text)+''' and Stock_NO='''+Trim(Edit2.Text)+'''';
              flag:=adisp.updatesql(sqlpub);
              if vartostr(flag)<>'1' then
              begin
                  Application.MessageBox('修改数据表时出错'+#13#10+'请检查远程服务器连接是否正常？请确认！',pchar(application.Title),mb_iconwarning);
                  exit;
              end;
              //删除商品需求单明细表
              sqlpub:='delete  from [Goods_Requirement_Detail] where Stock_NO='''+Trim(Edit2.Text)+'''';
              flag:=adisp.updatesql(sqlpub);
              if vartostr(flag)<>'1' then
              begin
                  Application.MessageBox('修改数据表时出错'+#13#10+'请检查远程服务器连接是否正常？请确认！',pchar(application.Title),mb_iconwarning);
                  exit;
              end;
            end else
            begin
              if trim(Handle_Man)<>trim(edit6.Text) then
              begin
                Application.MessageBox('不能修改数据！',pchar(application.Title),mb_iconinformation);
                exit;
              end;
            end;
        end;
        sqlpub:='Select * from [Goods_Requirement] where Copy_Date='''+Trim(Edit1.Text)+''' and Stock_NO='''+Trim(Edit2.Text)+'''';
        dmmain.CDSquery2.Close;
        dmmain.CDSquery2.Data:=adisp.resultrecord(sqlpub);
        try
            dmmain.CDSquery2.Open;
        except
            Application.MessageBox('数据初始出错'+#13#10+'请检查远程服务器连接是否正常？请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        if not dmmain.CDSquery2.IsEmpty then
        begin
            Application.MessageBox('操作失败,该【需求合同】记录在数据库中已经存在，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end else
        begin
            dmmain.cdsGoods_Requirement.Close;
            dmmain.cdsGoods_Requirement.Open;
            dmmain.cdsGoods_Requirement.Append;
            dmmain.cdsGoods_Requirement.FieldByName('Copy_Date').AsString:=edit1.Text; //录单日期
            dmmain.cdsGoods_Requirement.FieldByName('Stock_NO').AsString:=edit2.Text;  //单据编号
  //          dmmain.cdsGoods_Requirement.FieldByName('Requirment_Name').AsString:= //单据名称
            dmmain.cdsGoods_Requirement.FieldByName('Storage_NO').AsString:=edit3.Text;     //仓库编号
            dmmain.cdsGoods_Requirement.FieldByName('Shop_NO').AsString:=Edit_Storage_Name.Text;        //店面名称
            dmmain.cdsGoods_Requirement.FieldByName('Transactor').AsString:=edit5.Text;     //经手人
            dmmain.cdsGoods_Requirement.FieldByName('Proposer').AsString:=edit6.Text;      //制单人
            dmmain.cdsGoods_Requirement.FieldByName('Condense').AsString:=edit7.Text;       //摘要
            dmmain.cdsGoods_Requirement.FieldByName('R_Remark').AsString:=edit8.Text;       //说明
            dmmain.cdsGoods_Requirement.FieldByName('Part_no').AsString:=Handle_Part; //部门编号
            dmmain.cdsGoods_Requirement.Post;

            if fl<>'edit' then
            begin
                dmmain.cdsReceipt.Close;
                dmmain.cdsReceipt.Open;
                dmmain.cdsReceipt.Append;
                dmmain.cdsReceipt.FieldByName('Receipt_NO').AsString:=trim(edit2.Text);
                dmmain.cdsReceipt.FieldByName('Receipt_Name').AsString:='商品需求单';
                dmmain.cdsReceipt.FieldByName('Copy_Date').AsString:=trim(edit1.Text);
                dmmain.cdsReceipt.FieldByName('Proposer').AsString:=trim(edit6.Text);
                dmmain.cdsReceipt.FieldByName('Condense').AsString:=trim(edit7.Text);
                dmmain.cdsReceipt.FieldByName('Check_Result').Asinteger:=0;
                dmmain.cdsReceipt.FieldByName('Flag_Sign').AsString:='草稿';
                dmmain.cdsReceipt.FieldByName('Re_part').AsString:=trim(Handle_Part);
                dmmain.cdsReceipt.Post;
                try
                    dmmain.cdsReceipt.ApplyUpdates(-1);
                except
                    Application.MessageBox('保存数据表时出错'+#13#10+'请检查远程服务器连接是否正常？请确认！',pchar(application.Title),mb_iconwarning);
                    Exit;
                end;
            end;

            dmmain.cdsGoods_Requirement_Detail.Close;
            dmmain.cdsGoods_Requirement_Detail.Open;
            for i:=1 to stringgrid1.RowCount-1 do
            begin
                dmmain.cdsGoods_Requirement_Detail.Append;
                dmmain.cdsGoods_Requirement_Detail.FieldByName('Stock_NO').AsString:=edit2.Text; //单据编号
                dmmain.cdsGoods_Requirement_Detail.FieldByName('Goods_NO').AsString:=trim(stringgrid1.Cells[1,i]);  //商品编号
                dmmain.cdsGoods_Requirement_Detail.FieldByName('R_Amount').AsString:=trim(stringgrid1.Cells[3,i]);  //需求数量
                dmmain.cdsGoods_Requirement_Detail.FieldByName('Remark').AsString:=trim(stringgrid1.Cells[15,i]);    //需求说明
                dmmain.cdsGoods_Requirement_Detail.Post;
            end;
            edit1.Clear;
            edit2.Clear;
            edit3.Clear;
            edit4.Clear;
            edit5.Clear;
            edit6.Clear;
            edit7.Clear;
            edit8.Clear;
            Edit_Storage_Name.Clear;
            Edit_Shop_Name.Clear;
            for i:=1 to stringgrid1.RowCount-1 do
                stringgrid1.Rows[i].Text:='';
            stringgrid1.RowCount:=2;
            init;
            try
                dmmain.cdsGoods_Requirement.ApplyUpdates(-1);
                dmmain.cdsGoods_Requirement_Detail.ApplyUpdates(-1);
            except
                Application.MessageBox('保存数据表时出错'+#13#10+'请检查远程服务器连接是否正常？请确认！',pchar(application.Title),mb_iconwarning);
                Exit;
            end;
        end;
    frm_Main.Panel_Title.Caption:='[连锁管理系统]->[采购信息管理]';
    end;
    if Public_Do_Result='03' then
    begin
        dmmain.CDSquery2.Close;
        if fl='edit' then frm_Business_Draft.FormShow(nil);  //刷新业务草稿中的数据
        Close;
    end;
end;

procedure Tfrm_Goods_Requirement.Cmd_Select_LoginClick(Sender: TObject);
begin
//    Edit6.Text:=Handle_Man;
  frm_Login_Man:=Tfrm_Login_Man.Create(self);
  frm_Login_Man.Caption:='制单人选择';
  frm_Login_Man.ShowModal;
  Edit6.Text:=Employe_Check_Result;
  frm_Login_Man.Free;
end;

procedure Tfrm_Goods_Requirement.Edit6KeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key=#13 then
        Edit6.Text:=Handle_Man;
end;

procedure Tfrm_Goods_Requirement.StringGrid1SelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
    if ARow>0 then    //wyedit;
      if ACol=3 then stringgrid1.Options:=stringgrid1.Options+[goediting] else stringgrid1.Options:=stringgrid1.Options-[goediting];
    pcol:=acol;
    prow:=arow;
  edtgoodsremark.Text:=trim(stringgrid1.Cells[15,prow]);
end;

procedure Tfrm_Goods_Requirement.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if pcol in [3] then
    begin
        if not (key in ['0'..'9',#8]) then
        begin
            key:=#0;
        end
        else
        begin
            if key<>#8 then
            begin
                if pcol=4 then  StringGrid1.Cells[4,prow]:=StringGrid1.Cells[4,prow]+key;
            end
            else
            begin
            if pcol=4 then
            begin
                StringGrid1.Cells[4,prow]:='';  //不加退格符号;
            end;
            exit;
            end;
        end;
    end;
end;

procedure Tfrm_Goods_Requirement.SpeedButton2Click(Sender: TObject);
var
  user,tablename:widestring;
  flag:olevariant;
begin
  if trim(stringgrid1.Cells[1,1])='' then exit;
  no:=trim(edit2.Text);
  typed:='商品需求单';
  user:=trim(Handle_No);
  flag:=adisp.receipted(no,typed,user,1,Handle_Part);
  tablename:='select a.storage_no,b.goods_no,b.stock_no,b.r_amount as amount from Goods_Requirement as a ,Goods_Requirement_detail as b where a.stock_no=b.stock_no and a.stock_no='+''''+trim(No)+'''';
  flag:=inttostr(adisp.UpdateOrder(tablename) );
  if flag='1' then
  begin
    application.MessageBox('审核成功！',pchar(application.Title),mb_iconinformation);
    close;
    exit;
  end;
  if flag='2' then
  begin
    application.MessageBox('无权进行进行审核',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='3' then
  begin
    application.MessageBox('审核完毕！',pchar(application.Title),mb_iconinformation);
    close;
    exit;
  end;
  if flag='4' then
  begin
    application.MessageBox('反审核完毕！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='5' then
  begin
    application.MessageBox('反审核成功！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  if flag='6' then
  begin
    application.MessageBox('单据过帐后，不能进行审核或反审核！',pchar(application.Title),mb_iconinformation);
    exit;
  end;
end;

procedure Tfrm_Goods_Requirement.SpeedButton10Click(Sender: TObject);
begin

    Stock_Contract_NO:='';
    Stock_Contract_Str:='';
    frm_Goods_Requipment_Search:=Tfrm_Goods_Requipment_Search.Create(self);
    frm_Goods_Requipment_Search.ShowModal;
    frm_Goods_Requipment_Search.Free;
end;

procedure Tfrm_Goods_Requirement.spbprintClick(Sender: TObject);
begin
  if dmmain.cdsprintmaster.IsEmpty then exit;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='Requirement.ini';
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

procedure Tfrm_Goods_Requirement.edtgoodsremarkChange(Sender: TObject);
begin
  if prow<>0 then 
  stringgrid1.Cells[15,prow]:=trim(edtgoodsremark.Text);
end;

end.
