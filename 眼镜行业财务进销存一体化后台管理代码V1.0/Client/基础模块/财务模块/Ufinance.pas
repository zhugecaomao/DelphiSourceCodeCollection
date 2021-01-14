unit Ufinance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, DBClient, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TfmMoneyGain = class(TfmBase)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    SupGrids1: TStringGrid;
    Panel1: TPanel;
    SpeedButton8: TSpeedButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    btnPrivew: TBitBtn;
    cdsdata: TClientDataSet;
    btnpart: TBitBtn;
    Label1: TLabel;
    Lbcaption: TLabel;
    procedure SpeedButton8Click(Sender: TObject);
    procedure btnpartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SupGrids1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnPrivewClick(Sender: TObject);
  private
    { Private declarations }
    szQueryFlag,bm,captions: string;
    szPeriod: string;
    dAssertTotal: double;
    dDebtAndGainTotal: double;
    procedure OpenDB;
    procedure RefreshGrid;
  public
    { Public declarations }
  end;

var
  fmMoneyGain: TfmMoneyGain;
  Procedure financeFmshow(szFlag,szperiod: string);
implementation

uses UntSQpspart, untdatadm, SysDate, func, Unitreportxf, Storage_Select;

{$R *.dfm}
procedure financeFmshow(szFlag,szperiod: string);
//  szFlag: ASSET(资产负债表,可能存在期初的); GIAN(收入支出表);  bassert(资产负债表平衡表)
//szperiod:表的类型， szPeriod='00'表示是期初。
begin
  fmMoneyGain:=TfmMoneyGain.Create(nil);
  fmMoneyGain.szQueryFlag:= szFlag;
  fmMoneyGain.szPeriod:=szPeriod;
  fmMoneyGain.showmodal;
  fmMoneyGain.free;
end;
procedure TfmMoneyGain.OpenDB;
var
  startdate, enddate: TDate;
  sql:widestring;
  datas:olevariant;
begin

  if szQueryFlag <> 'bassert' then
  begin
    if GetStartEndDate('请输入时间段', startdate, enddate) then
       begin
        cdsdata.Close;
        cdsdata.Data:=null;
        sql:='exec Gp_TotalShopAccount '+szQueryFlag+','''+Formatdatetime('YYYY-MM-DD',startdate)+''','''+Formatdatetime('YYYY-MM-DD',enddate)+''''+','+''''+trim(bm)+'''';
        try
          datas:=adisp.execsql(sql);
          if not varisnull(datas) then
          begin
            cdsdata.data:=datas;
            cdsdata.Open;
          end;
           refreshGrid;
           datas:=null;
        except
        end;
       end;
  end
  else
  begin
        startdate:=now;enddate:=now;
        cdsdata.Close;
        cdsdata.Data:=null;
        sql:='exec Gp_TotalShopAccount '+szQueryFlag+','''+Formatdatetime('YYYY-MM-DD',startdate)+''','''+Formatdatetime('YYYY-MM-DD',enddate)+''''+','+''''+trim(bm)+'''';
        try
          datas:=adisp.execsql(sql);
          if not varisnull(datas) then
          begin
            cdsdata.data:=datas;
            cdsdata.Open;
          end;
           refreshGrid;
           datas:=null;
        except
        end;
  end;
end;

procedure TfmMoneyGain.RefreshGrid;
var
 i,j,nleveal: integer;
 szSpaceTemp,szTempId: string;
 szSpace: array[0..4] of string;
 dTotalGain,dMonthGain,dTotalPayOut,dMonthPayOut: double;
begin
 if szQueryFlag='bassert' then
 begin
        szSpaceTemp:='';
        dDebtAndGainTotal:=0;
        dAssertTotal:=0;
        for j:=0 to 4 do
        begin
          szSpace[j]:=szSpaceTemp;
          szSpaceTemp:=szSpaceTemp+'      ';
        end;
        i:=1;j:=1;
        with cdsdata do
        begin
          if RecordCount< 30 then
            supgrids1.RowCount:=30
          else
            supgrids1.RowCount:= RecordCount+2;
          First;
          while not Eof do
          begin
            szTempId:=trim(Fieldbyname('AccountId').value);
            nleveal:=Fieldbyname('level').value;
            if copy(szTempId,1,5)='00001' then  //资产合计
            begin
              nleveal:=Fieldbyname('level').value;
              supgrids1.cells[0,i] := inttostr(i);
              supgrids1.Cells[1,i]:=  szSpace[nleveal-1]+Fieldbyname('AccountName').value;
              supgrids1.Cells[2,i]:=  Fieldbyname('total').asstring;
              if (szTempId='00001') then dAssertTotal:=dAssertTotal+Fieldbyname('total').value;//如果是资产合计
              i:=i+1;
            end else
            if (copy(szTempId,1,5)='00002') or (copy(szTempId,1,5)='00005') then      //负载  所有者权益
            begin
              supgrids1.cells[0,j] := inttostr(j);
              supgrids1.Cells[3,j]:=  szSpace[nleveal-1]+Fieldbyname('AccountName').value;
              supgrids1.Cells[4,j]:=  Fieldbyname('total').asstring;
              if (szTempId='00002') or (szTempId='00005') then dDebtAndGainTotal:=dDebtAndGainTotal+Fieldbyname('total').value;
                 //如果是 负载  所有者权益
              j:=j+1;
            end;
            Next;
          end;
          if i<j then i:=j;
          supgrids1.Cells[0,i]:=inttostr(i);
          supgrids1.Cells[1,i]:='资产合计:';
          supgrids1.Cells[2,i]:=floattostr(dAssertTotal);
          supgrids1.Cells[3,i]:='负债及权益合计:';
          supgrids1.Cells[4,i]:=floattostr(dDebtAndGainTotal);
        end;
 end
 else
 begin
     i:=1;
     szSpaceTemp:='';
     dTotalGain:=0;
     dMonthGain:=0;
     for j:=0 to 4 do
     begin
      szSpace[j]:=szSpaceTemp;
      szSpaceTemp:=szSpaceTemp+'        ';
     end;
      with cdsdata do
       begin
         if RecordCount< 30 then
              supgrids1.RowCount:=30
         else
              supgrids1.RowCount:= RecordCount+2;
         First;
           while not Eof do
           begin
                nleveal:=Fieldbyname('level').value;
                supgrids1.cells[0,i] := inttostr(i);
                supgrids1.Cells[1,i]:=  Fieldbyname('usercode').value;
                supgrids1.Cells[2,i]:=  szSpace[nleveal-1]+Fieldbyname('AccountName').value;
                if szPeriod='00' then
                begin
                  supgrids1.Cells[3,i]:=  Fieldbyname('total').asstring;
                end else
                begin
                  supgrids1.Cells[3,i]:=  Fieldbyname('bqtotal').asstring;
                  supgrids1.Cells[4,i]:=  Fieldbyname('total').asstring;
                  szTempId:=trim(Fieldbyname('AccountId').value);
                  if '00003'=szTempId then     // 是不是收入类
                  begin
                    dMonthGain:=Fieldbyname('bqtotal').value;
                    dTotalGain:=Fieldbyname('total').value;
                  end;
                  if '00004'=szTempId then  //是不是支出类
                  begin
                    dMonthPayOut:=Fieldbyname('bqtotal').value;
                    dTotalPayOut:=Fieldbyname('total').value;
                  end;
                end;
                  i:=i+1;
                  Next;
           end;
          if szQueryFlag='gain' then
          begin
            supgrids1.Cells[2,i]:= szSpace[0]+'【利润】';
            supgrids1.Cells[3,i]:=floattostr(dMonthGain-dMonthPayOut);
            supgrids1.Cells[4,i]:=floattostr(dTotalGain-dTotalPayOut);
          end;
       end;
   end;
end;
procedure TfmMoneyGain.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmMoneyGain.btnpartClick(Sender: TObject);
begin
  inherited;
  Check_Storage:='';Check_Storage_Result:='';
  Check_Storage:='Storage_Umanage_Fad';
  frm_Storage_Select:=Tfrm_Storage_Select.Create(self);
  frm_Storage_Select.ShowModal;
  frm_Storage_Select.Free;
  bm:=trim(Check_Storage_Result_NO);
  captions:= '仓库『'+trim(Check_Storage_Result)+'』'+caption;
  openDB;
  lbcaption.Caption:=captions;
end;

procedure TfmMoneyGain.FormShow(Sender: TObject);
begin
  inherited;
    if szQueryFlag='bassert' then
     begin
          SupGrids1.cells[0,0]:='行号';
          SupGrids1.cells[1,0]:='资产类';
          supgrids1.ColWidths[1]:=220;
          supgrids1.ColWidths[2]:=90;
          SupGrids1.cells[2,0]:='期末数';
          SupGrids1.cells[3,0]:='负载及所有者权益';
          SupGrids1.cells[4,0]:='期末数';
          supgrids1.ColWidths[3]:=220;
          supgrids1.ColWidths[4]:=90;
          Caption:='［部门资产负载平衡表］';

     end
     else
     begin
        SupGrids1.cells[0,0]:='行号';
        SupGrids1.cells[1,0]:='会计科目编号';
        SupGrids1.cells[2,0]:='会计科目名称';
        supgrids1.ColWidths[2]:=260;
        SupGrids1.cells[3,0]:='本期发生额';
        SupGrids1.cells[4,0]:='总金额';
        supgrids1.ColWidths[3]:=81;
        supgrids1.ColWidths[4]:=81;
        if szQueryFlag='gain' then Caption:='［部门经营情况报表］';
        if szQueryFlag='asset' then
        begin
          Caption:='［部门资产状况］';
          if szPeriod='00' then        //如果存在期初，在此处理列表内容。
          begin
            Caption:='［部门期初资产状况］';
            supgrids1.ColCount:=4;
            supgrids1.ColWidths[3]:=260;
            supgrids1.Cells[3,0]:='期初余额';
            supgrids1.ColWidths[3]:=90;
          end;
        end;
  end;
end;

procedure TfmMoneyGain.SupGrids1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;

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

  if ((ACol = 3) or (acol =4)) and (ARow > 0) then      // 只有后3列才有Bitmap
  begin
  end;

      s:=Cells[ACol,ARow];
      r:=Rect;
//      if ((acol = 1) and (arow > 0) )or ((acol = 2) and (arow > 0)) then   //第一行仍然居中
      if ((acol = 3) or (acol = 4)) then
      DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_RIGHT or DT_SINGLELINE or DT_VCENTER)   //6-8 add
      else
      DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
    end;

end;

procedure TfmMoneyGain.btnPrivewClick(Sender: TObject);
begin
  inherited;
  fastrepxf:=tfastrepxf.Create(self);
  fastrepxf.filenames:='Finance.ini';
  GetCopyGrid(fastrepxf.SGridData,SupGrids1);
  fastrepxf.SGridData.Enabled:=true;
  fastrepxf.ShowModal;
  fastrepxf.Free;
end;

end.
