unit UserRight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, fcCombo, fctreecombo, fcTreeView, ExtCtrls, Buttons,
  DB, DBTables, ComCtrls, ImgList, CheckLst;

type
  Tfrm_sysright = class(TForm)
    Panel1: TPanel;
    Query1: TQuery;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    StatusBar1: TStatusBar;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    ImageList1: TImageList;
    Panel2: TPanel;
    Label1: TLabel;
    workcode: TComboBox;
    GroupBox2: TGroupBox;
    Query2: TQuery;
    TV: TfcTreeView;
    tv2: TfcTreeView;
    CheckListBox1: TCheckListBox;
    GroupBox1: TGroupBox;
    CheckListBox2: TCheckListBox;
    procedure tvClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure TVChange(TreeView: TfcCustomTreeView; Node: TfcTreeNode);
  private
   tablename:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_sysright: Tfrm_sysright;

implementation

uses BasePage;


{$R *.dfm}

procedure Tfrm_sysright.tvClick(Sender: TObject);
var i:integer;
begin
  {if tv.Selected.Checked then
  begin
     tv.Selected.Checked :=false;
   end
   else
   begin
      tv.Selected.Checked :=true;

   end;}

   for i:=0 to tv.Items.Count -1 do
   begin
     if tv.Items [i].Checked then
     begin
       tv.Items [i].SelectedIndex :=1;
       tv.Items [i].ImageIndex :=1;

     end
     else
     begin
       tv.Items [i].SelectedIndex :=0;
       tv.Items [i].ImageIndex :=0;
     end;
  end; 
                   
 { if tv.Selected.Expanded then
     exit;
  if tv.Selected.Expanded =false  then
  begin end;}
 
end;

procedure Tfrm_sysright.FormShow(Sender: TObject);
var i,j:integer;  node,node1,node2: tfctreenode;
begin
  tablename:='t_sysright';
  fillitems1(workcode,'t_user','usercode,epleooname',' a left outer join(select epleoocode,epleooname from t_epleoo)b on a.username=b.epleoocode ',' order by usercode');

  begin
    query2.close;
    query2.sql.Clear;
    query2.sql.Add('select menucode,menuname,menuclass from t_SysMenu where menuclass=''1''' );
    query2.open;
    query2.first;
    for i:=0 to query2.RecordCount -1 do
    begin
       node:=TV.Items.Add(nil,query2.fields[1].asstring);
       node.StringData :=query2.Fields [0].AsString ;
       begin
         query1.close;
         query1.sql.Clear ;
         query1.sql.Add('select menucode,menuname,menuclass,menuID,menuOrder from t_SysMenu where substring(menucode,1,2)='''+copy(query2.Fields [0].asstring,1,2)+''' and menuclass=''2'' order by menucode ') ;
         query1.open;
         query1.first;
         for j:=0 to query1.RecordCount -1 do
         begin
           node1:=TV.Items.AddChild (node,query1.fields[1].asstring);
           node1.StringData :=query1.Fields [0].AsString ;

           if query1.Fields [3].AsBoolean =true then
           begin
             node2:=TV.Items.AddChild(node1,'增加');
             node2.StringData :='y1';
             if copy(query1.Fields [4].AsString,1,1) ='1' then
             begin
               //node2.Checked :=true;
               node2.StringData2 :='n1';
             end
             else
             begin
                //node2.Checked :=false;
                node2.StringData2 :='n0';
             end;

             node2:=TV.Items.AddChild(node1,'修改');
           node2.StringData :='y2';
             if copy(query1.Fields [4].AsString,2,1) ='1' then
             begin
               //node2.Checked :=true;
               node2.StringData2 :='n1';
             end
             else
             begin
                //node2.Checked :=false;
                node2.StringData2 :='n0';
             end;

             node2:=TV.Items.AddChild(node1,'删除');
             node2.StringData :='y3';
             if copy(query1.Fields [4].AsString,3,1) ='1' then
             begin
               //node2.Checked :=true;
               node2.StringData2 :='n1';
             end
             else
             begin
                //node2.Checked :=false;
                node2.StringData2 :='n0';
             end;

             node2:=TV.Items.AddChild(node1,'查询');
             node2.StringData :='y4';
             if copy(query1.Fields [4].AsString,4,1) ='1' then
             begin
               //node2.Checked :=true;
               node2.StringData2 :='n1';
             end
             else
             begin
                //node2.Checked :=false;
                node2.StringData2 :='n0';
             end;

             node2:=TV.Items.AddChild(node1,'审核');
             node2.StringData :='y5';
             if copy(query1.Fields [4].AsString,5,1) ='1' then
             begin
               //node2.Checked :=true;
               node2.StringData2 :='n1';
             end
             else
             begin
                //node2.Checked :=false;
                node2.StringData2 :='n0';
             end;

             node1.StringData2 :='1';
           end
           else
           begin
             node1.StringData2 :='0'; //
           end;
           query1.next;
         end;

       end;
       query2.next;
    end;
  end;
end;

procedure Tfrm_sysright.BitBtn1Click(Sender: TObject);
var i,s:integer;
    str,strchar:string;
     menustr:string;
     sqlid:boolean;
begin
with query1 do
begin
  close;
  sql.Clear ;
  sql.Add('select workcode from '+tablename+' where workcode='''+get_dm(workcode.Text )+'''');
  open;
  if isempty then
  begin
    close;
    sql.Clear ;
    strchar:=format('你确定要保存【工作组】为%s的管理权限记录吗?',[workcode.Text]);
    if Application.MessageBox(pchar(strchar),'提示信息',mb_yesno+mb_iconinformation)=idno then exit;

  end
  else
  begin
    close;
    sql.Clear ;
    strchar:=format('你确定要修改【工作组】为%s的管理权限记录吗?',[workcode.Text]);
    if Application.MessageBox(pchar(strchar),'提示信息',mb_yesno+mb_iconinformation)=idno then exit;
    sql.Add('delete '+tablename+' where workcode='''+get_dm(workcode.Text)+'''');
  end;
  begin
    s:=0;
    for i:=0 to tv.Items.Count -1 do
    begin
       //showmessage(tv.items[i].Text );                               (tv.Items [i].StringData2 ='0')or
      if (copy(tv.Items [i].StringData,3,4)='0000') then     //如果只有一节树的,只把selectedindex置 为0
      begin
        if tv.Items [i].Checked then
        begin
          sql.Add('insert into '+tablename+' (workcode,menucode,menuadd,menudelete,menumodify,menuquery,menush) values('''+get_dm(workcode.Text) +''','''+tv.Items [i].StringData +''',1,1,1,1,1)');
          continue;
        end
      end;          // and(copy(tv.Items [i].StringData,3,4)<>'0000')
      if (copy(tv.Items [i].StringData,3,4)<>'0000') and(copy(tv.Items [i].StringData,1,1)<>'y')and(tv.Items [i].StringData2<>'1') then     //如果只有一节树的,只把selectedindex置 为0
      begin
        if tv.Items [i].Checked then
        begin
          sql.Add('insert into '+tablename+' (workcode,menucode,menuadd,menudelete,menumodify,menuquery,menush) values('''+get_dm(workcode.Text) +''','''+tv.Items [i].StringData +''',1,1,1,1,1)');
          continue;
        end
      end;
      if (tv.Items [i].Checked)and(tv.Items [i].StringData2='1') then
      begin
          sqlid:=true;
          s:=0;
          menustr:=tv.Items [i].StringData+''',' ;
      end
      else if (tv.Items [i].StringData ='y1')and(sqlid) then
      begin
        if (tv.Items [i].Checked)and(tv.Items [i].StringData2 ='n1')then
           menustr:=menustr+'1,'
        else
           menustr:=menustr+'0,';
      end                                   //
      else if  (tv.Items [i].StringData ='y2')and(sqlid) then
      begin
        if (tv.Items [i].Checked)and(tv.Items [i].StringData2 ='n1') then
           menustr:=menustr+'1,'
        else
           menustr:=menustr+'0,';
      end                                                    //
      else if  (tv.Items [i].StringData ='y3')and(sqlid) then
      begin
        if (tv.Items [i].Checked)and(tv.Items [i].StringData2 ='n1') then
           menustr:=menustr+'1,'
        else
           menustr:=menustr+'0,';
      end                           //
      else if  (tv.Items [i].StringData ='y4')and(sqlid) then
      begin
        if (tv.Items [i].Checked)and(tv.Items [i].StringData2 ='n1') then
           menustr:=menustr+ '1,'
        else
           menustr:=menustr+'0,' ;
      end
      else if  (tv.Items [i].StringData ='y5')and(sqlid) then
      begin
        if (tv.Items [i].Checked)and(tv.Items [i].StringData2 ='n1') then
           menustr:=menustr+ '1'
        else
           menustr:=menustr+'0';
       end;
       s:=s+1;
      if (sqlid) and (s=6) then
      begin
        if copy(menustr,length(menustr),1)=',' then menustr:=copy(menustr,1,length(menustr)-1);
         sql.Add('insert into '+tablename+' (workcode,menucode,menuadd,menumodify,menudelete,menuquery,menush) values('''+
                  get_dm(workcode.Text)+''','''+menustr+')');
         sqlid:=false;

      end;

    end;
    execsql;
   end;
end;
end;

procedure Tfrm_sysright.BitBtn2Click(Sender: TObject);
var i,j:integer;
    addid,modifyid,deleteid,queryid,shid,yesid:boolean;
begin

  with query1 do
  begin
    close;
    sql.Clear ;
    sql.Add('select workcode,menucode,menuadd,menumodify,menudelete,menuquery,menush from '+tablename+' where workcode='''+get_dm(workcode.Text) +'''');
    open;
    if not isempty then
    begin
      BitBtn4.Click ;
      for j:=0 to tv.Items.Count -1 do
      begin

        first;
        for i:=0 to RecordCount -1 do
        begin
          if (tv.Items [j].StringData =fields[1].AsString) then
          begin
            if  (tv.Items [j].StringData2 <>'1')  then
            begin
              tv.Items [j].Checked :=true;
              break;
            end
            else if tv.Items [j].StringData2 ='1' then
            begin;
              tv.Items [j].Checked :=true;
              yesid:=true;
              addid:=fields[2].AsBoolean;
              modifyid:=fields[3].AsBoolean  ;
              deleteid:=fields[4].AsBoolean;
              queryid:=fields[5].AsBoolean ;
              shid:=fields[6].AsBoolean ;
              break;
            end;
          end
          else if (copy(tv.Items [j].StringData,1,1) ='y')and (yesid) then
          begin
             if tv.Items [j].StringData ='y1' then
             begin
               if addid then
               begin
                 tv.Items [j].Checked :=true;
                end ;
              break;
             end
             else if tv.Items [j].StringData ='y2' then
             begin
               if modifyid then
                 tv.Items [j].Checked :=true ;
              break;
             end
             else if tv.Items [j].StringData ='y3' then
             begin
               if deleteid then
                 tv.Items [j].Checked :=true;
              break;
             end
             else if tv.Items [j].StringData ='y4' then
             begin
               if queryid then
                 tv.Items [j].Checked :=true;
              break;
             end
             else if tv.Items [j].StringData ='y5' then
             begin
               if shid then
                 tv.Items [j].Checked :=true;
                 yesid:=false;
              break;
             end;

          end;
          next;
        end;
      end;
    end
    else
    begin
      showmessage('此记录权限为空');
    end;
  end;

   for i:=0 to tv.Items.Count -1 do
   begin
     if tv.Items [i].Checked then
     begin
       tv.Items [i].SelectedIndex :=1;
       tv.Items [i].ImageIndex :=1;

     end
     else
     begin
       tv.Items [i].SelectedIndex :=0;
       tv.Items [i].ImageIndex :=0;
     end;
  end; 

end;

procedure Tfrm_sysright.BitBtn3Click(Sender: TObject);
var i:integer;
begin
   for i:=0 to tv.Items.Count -1 do
   begin
     tv.Items [i].Checked :=true;
   end;
   for i:=0 to tv.Items.Count -1 do
   begin
     if tv.Items [i].Checked then
     begin
       tv.Items [i].SelectedIndex :=1;
       tv.Items [i].ImageIndex :=1;
     end
     else
     begin
       tv.Items [i].SelectedIndex :=0;
       tv.Items [i].ImageIndex :=0;
     end;
  end; 

end;

procedure Tfrm_sysright.BitBtn4Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to tv.Items.Count -1 do
  begin
    tv.Items [i].Checked :=false;
  end;
   for i:=0 to tv.Items.Count -1 do
   begin
     if tv.Items [i].Checked then
     begin
       tv.Items [i].SelectedIndex :=1;
       tv.Items [i].ImageIndex :=1;

     end
     else
     begin
       tv.Items [i].SelectedIndex :=0;
       tv.Items [i].ImageIndex :=0;
     end;
  end; 

end;

procedure Tfrm_sysright.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_sysright.BitBtn7Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to tv.Items.Count -1 do
     tv.Items[i].Expanded :=true;
     
   for i:=0 to tv.Items.Count -1 do
   begin
     if tv.Items [i].Checked then
     begin
       tv.Items [i].SelectedIndex :=1;
       tv.Items [i].ImageIndex :=1;

     end
     else
     begin
       tv.Items [i].SelectedIndex :=0;
       tv.Items [i].ImageIndex :=0;
     end;
  end; 

end;

procedure Tfrm_sysright.BitBtn6Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to tv.Items.Count -1 do
     tv.Items[i].Expanded :=false;
     
   for i:=0 to tv.Items.Count -1 do
   begin
     if tv.Items [i].Checked then
     begin
       tv.Items [i].SelectedIndex :=1;
       tv.Items [i].ImageIndex :=1;

     end
     else
     begin
       tv.Items [i].SelectedIndex :=0;
       tv.Items [i].ImageIndex :=0;
     end;
  end; 

end;

procedure Tfrm_sysright.BitBtn8Click(Sender: TObject);
var strchar:string;
begin
  with query1 do
  begin
     close;
     sql.Clear ;
     sql.Add('select workcode from '+tablename+' where workcode='''+get_dm(workcode.Text )+'''');
     open;
     if not isempty then
     begin
       close;
       sql.Clear ;
       strchar:=format('你确定要删除【工作组】为  %s  的管理权限记录吗?',[workcode.Text]);
       if Application.MessageBox(pchar(strchar),'提示信息',mb_yesno+mb_iconinformation)=idno then exit;
       sql.Add('delete '+tablename+' where workcode='''+get_dm(workcode.Text)+'''');
       try
         execsql;
       except
         showmessage('SQL语言错误');
         exit;
       end;
     end;
  end;
end;


procedure Tfrm_sysright.TVChange(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode);
begin
  tv.Selected.SelectedIndex :=1;
end;

end.
