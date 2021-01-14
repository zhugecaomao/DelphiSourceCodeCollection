unit data;

interface

uses
  SysUtils,
  Classes,
  DB,
  Wwdatsrc,
  ADODB,
  Wwintl,
  Dialogs,
  Controls,
  ADOConEd,
  DBTables,
  Wwquery;

type
  TDM = class(TDataModule)
    DB: TADOConnection;
    wwIntl1: TwwIntl;
    tabEmp: TADOTable;
    dsEmp: TwwDataSource;
    qryOwner: TADOQuery;
    dsOwner: TwwDataSource;
    tabCust: TADOQuery;
    dsCust: TwwDataSource;
    tabSupp: TADOQuery;
    dsSupp: TwwDataSource;
    tabType: TADOQuery;
    tabGoods: TADODataSet;
    dsGoods: TwwDataSource;
    dsType: TwwDataSource;
    dsOut: TwwDataSource;
    dsOutItems: TwwDataSource;
    tabFirstStore: TADOTable;
    dsFirstStore: TwwDataSource;
    tabFirstStoregdsid: TWideStringField;
    tabFirstStorestoreid: TWideStringField;
    tabStore: TADOTable;
    tabFirstStorestorename: TStringField;
    tabFirstStoregdsName: TStringField;
    tabFirstStoreamo: TBCDField;
    tabFirstStorequa: TFloatField;
    tabNextId: TADOTable;
    tabOut: TADOTable;
    tabOutItems: TADOTable;
    tabOutItemsautoid: TAutoIncField;
    tabOutItemsSheetID: TWideStringField;
    tabOutItemsGdsID: TWideStringField;
    tabOutItemsUnit: TWideStringField;
    tabOutItemsQua: TFloatField;
    tabOutItemsPrice: TBCDField;
    tabOutItemsbigPrice: TBCDField;
    tabOutItemsstoreid: TStringField;
    tabOutItemsNotes: TMemoField;
    tabOutItemsstorename: TStringField;
    tabOutItemsgdsname: TStringField;
    tabOutItemsamo: TCurrencyField;
    tabOutItemsbigAmo: TCurrencyField;
    dsOutPrice: TwwDataSource;
    qryOutPrice: TADOQuery;
    qryUnit: TADOQuery;
    tabOutcustname: TStringField;
    tabOutempname: TStringField;
    tabOutType: TStringField;
    tabOutStatus: TWordField;
    tabOutIsBack: TBooleanField;
    tabOutSheetID: TWideStringField;
    tabOutCustID: TWideStringField;
    tabOutDate: TDateTimeField;
    tabOutEmpId: TStringField;
    tabOutOrderID: TWideStringField;
    tabOutDiscount: TFloatField;
    tabOutAmo: TBCDField;
    tabOutPayAmo: TBCDField;
    tabOutdefaultStoreId: TStringField;
    tabOutNotes: TMemoField;
    tabOutStatusDate: TDateTimeField;
    dsIn: TwwDataSource;
    dsInItems: TwwDataSource;
    tabIn: TADOTable;
    StringField2: TStringField;
    WordField1: TWordField;
    BooleanField1: TBooleanField;
    WideStringField1: TWideStringField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    WideStringField3: TWideStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    StringField5: TStringField;
    MemoField1: TMemoField;
    DateTimeField2: TDateTimeField;
    tabInItems: TADODataSet;
    tabInItemsGdsId: TWideStringField;
    StringField6: TStringField;
    WideStringField5: TWideStringField;
    FloatField2: TFloatField;
    BCDField3: TBCDField;
    CurrencyField1: TCurrencyField;
    MemoField2: TMemoField;
    WideStringField6: TWideStringField;
    StringField7: TStringField;
    AutoIncField1: TAutoIncField;
    StringField8: TStringField;
    dsInprice: TwwDataSource;
    qryInPrice: TADOQuery;
    tabInSuppID: TWideStringField;
    tabInType: TStringField;
    tabGoodsgdsid: TStringField;
    tabGoodsgdsname: TStringField;
    tabGoodsunit: TStringField;
    tabGoodsmaxres: TFloatField;
    tabGoodsminres: TFloatField;
    tabGoodsinprice: TBCDField;
    tabGoodsoutprice1: TBCDField;
    tabGoodsoutprice2: TBCDField;
    tabGoodsoutprice3: TBCDField;
    tabGoodsoutprice4: TBCDField;
    tabGoodsgdstypeid: TStringField;
    tabGoodsinUse: TBooleanField;
    tabGoodsnotes: TMemoField;
    tabGoodsgdstypename: TStringField;
    procedure tabCustAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tabBeforeDelete(DataSet: TDataSet);
    procedure tabEmpBeforeDelete(DataSet: TDataSet);
    procedure tabPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabGoodsAfterOpen(DataSet: TDataSet);
    procedure tabOutNewRecord(DataSet: TDataSet);
    procedure tabOutItemsNewRecord(DataSet: TDataSet);
    procedure tabOutItemsCalcFields(DataSet: TDataSet);
    procedure tabOutItemsGdsIDChange(Sender: TField);
    procedure tabInNewRecord(DataSet: TDataSet);
    procedure tabInItemsBeforePost(DataSet: TDataSet);
    procedure tabInItemsCalcFields(DataSet: TDataSet);
    procedure tabInItemsNewRecord(DataSet: TDataSet);
    procedure tabInItemsGdsIdChange(Sender: TField);
    procedure tabOutBeforePost(DataSet: TDataSet);
    procedure tabInBeforePost(DataSet: TDataSet);
    procedure tabOutItemsBeforePost(DataSet: TDataSet);
    procedure tabGoodsAfterPost(DataSet: TDataSet);
    procedure tabGoodsNewRecord(DataSet: TDataSet);
  private
    CurrentEmpID, CurrentUser: string;
    CurrentComputer: string;
    procedure ShowADOErrors;
    function Is_Valid_unit(gdsid: string; unitname: string): boolean; //检查单位是否合格
    procedure updateouthistory(); //全用sql语句的话，当一次选很多数据时，总是会有麻烦 :(
    procedure updateInHistory();

  public
    SL: TStringList;
    tmpgdstypeid   : string   ;
    function DateNextValue(tmpStr: string): string;
    //按日期产生下一个自动编号如2000009010001
    function GetCurrentEmpId: string;
    function SetCurrentEmpId(const tmp: string): boolean;
    function GetCurrentUser: string;
    function SetCurrentUser(const tmp: string): boolean;
    function GetCurrentComputer: string;
    function SetCurrentComputer(const tmp: string): boolean;
    function ConfigDB(): boolean;

    { Public declarations }
  end;

var
  DM: TDM;
  FileName: string;

const
  {Declare constants we're interested in}
  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;
  AdoeKeyViol = 2627; //-2147217873;
  eAdoequiredFieldMissing = 515;

implementation

uses common;

{$R *.dfm}

function Tdm.DateNextValue(tmpStr: string): string;
//按日期产生下一个自动编号如2000009010001
var
  tmps, tmpbegin, tmpend: string;
  reset: boolean; //用来判断是否重置值
begin
  reset := false;
  with tabNextId do
    begin
      if not active then
        open;
      db.BeginTrans; //开始事务
      try

        if not Locate('tablename', tmpStr, [loPartialKey]) then
          //如果找不到，即加入表      find
          begin
            append;
            fieldbyname('tablename').asstring := tmpStr;
            fieldbyname('nextvalue').asstring := FormatDateTime('yyyymmdd', now)
              + '0002';
            post;
            result := FormatDateTime('yyyymmdd', now) + '0001';
          end
        else //如果找到，即判断是否今天，是即加1，不是，即重新由0001开始，且更新下一个值
          begin
            tmps := fieldbyname('nextvalue').asstring;
            tmpbegin := copy(tmps, 0, 8);
            tmpend := copy(tmps, 9, 4);
            if tmpbegin = FormatDateTime('yyyymmdd', now) then //是今天的值
              begin
                result := fieldbyname('nextvalue').asstring;
                edit;
                fieldbyname('nextvalue').asstring := tmpbegin + format('%4.4d',
                  [strtoint(tmpend) + 1]);
                post;
              end
            else //不是今天的值
              begin
                edit;
                fieldbyname('tablename').asstring := tmpStr;
                fieldbyname('nextvalue').asstring := FormatDateTime('yyyymmdd',
                  now) + '0002';
                post;
                result := FormatDateTime('yyyymmdd', now) + '0001';
              end; //end of else
          end; //end of else of if if not gotokey then
      finally
        if db.Errors.Count > 0 then
          begin
            db.RollbackTrans;
            showmessage('自动生成编号是事务出错，可能其实用户在用 ！');
          end
        else
          db.CommitTrans;
      end; //end of try
    end; //end of with
end; //end of function

function Tdm.GetCurrentUser: string;
begin
  Result := CurrentUser;
end;

function Tdm.SetCurrentUser(const tmp: string): boolean;
begin
  CurrentUser := tmp;
  Result := true;
end;

function Tdm.GetCurrentEmpID: string;
begin
  Result := CurrentEmpID;
end;

function Tdm.SetCurrentEmpID(const tmp: string): boolean;
begin
  CurrentEmpID := tmp;
  Result := true;
end;

function Tdm.GetCurrentComputer: string;
begin
  Result := CurrentComputer;
end;

function Tdm.SetCurrentComputer(const tmp: string): boolean;
begin
  CurrentComputer := tmp;
  Result := true;
end;

procedure TDM.tabCustAfterOpen(DataSet: TDataSet);
begin
  with tabCust do
    begin
      if not active then
        open;
      Findfield('CustID').DisplayLabel := '客户编号';
      Findfield('CustName').DisplayLabel := '客户名称';
      Findfield('LocationID').displaylabel := '地点编号';
      Findfield('Amo').displaylabel := '应付款';
      Findfield('Credit').displaylabel := '信用度';
      Findfield('Discount').displaylabel := '折扣';
      Findfield('Tel').displaylabel := '电话';
      Findfield('Fax').displaylabel := '传真';
      Findfield('Email').displaylabel := '电子邮件';
      Findfield('PostCode').displaylabel := '邮政编码';
      Findfield('Address').displaylabel := '地址';
      Findfield('Bank').displaylabel := '开户银行';
      Findfield('BankNo').displaylabel := '银行账号';
      Findfield('Notes').displaylabel := '备注';
    end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Con: string;
begin
  LongDateFormat := 'yyyy-mm-dd';
  ShortDateFormat := 'yyyy-mm-dd';
  DateSeparator := '-';
  SetCurrentUser(GetCurrentUser);
  SetCurrentComputer(GetComputerName);

  {fileName := ExtractFilePath(ParamStr(0)) + 'ConStr.ini';
  if FileExists(FileName) then
  begin
    SL := TStringList.Create;
    SL.LoadFromFile(FileName);
    Con := SL.Text;
    try
      db.Connected := false;
      db.ConnectionString := Con;
      db.Connected := true;
    except
      showmessage('数据库初始化错误，无法找到数据库' + #13 + Con);
    end;
  end;
}
end;

procedure TDM.tabBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('真的要删除这条记录吗?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      abort;
    end;
end;

procedure TDM.tabEmpBeforeDelete(DataSet: TDataSet);
begin
  {    if 6=application.messagebox('你真的想删除此员工的资料吗?','',4+32) then begin
          userlog.ShowModal;
          if not login(userlog.pass_user,userlog.pass,true) then abort
          else if not pubboss then begin
             application.MessageBox('权限不够,不能删除!','',48);
             abort;
          end;
          end
      else
         abort;
  }
end;

procedure TDM.tabPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  Adoerrors: error;
begin
  Adoerrors := db.Errors.item[0];
  case Adoerrors.NativeError of
    AdoeKeyViol:
      begin
        MessageDlg('这个编号已经存在,请用另一个编号！', mtWarning, [mbOK], 0);
        Abort;
      end;

    eAdoequiredFieldMissing:
      begin
        MessageDlg('有些位置不能为空！', mtWarning, [mbOK], 0);
        Abort;
      end;

  end; //end of case
end;

procedure TDM.ShowADOErrors;
var
  adoErrors: Errors;
  adoError: Error;
  iCount: Integer;
  str: string;
begin
  adoErrors := db.Errors;

  for iCount := 0 to adoErrors.Count - 1 do // Iterate
    begin
      adoError := adoErrors.Item[iCount];

      str := 'Error Number : ' + IntToStr(adoError.Number) + '   ' +
        'Error Source : ' + adoError.Source + '   ' +
        'Error Description : ' + adoError.Description + '   ' +
        'Error HelpFile : ' + adoError.HelpFile + '   ' +
        'Error SQLState : ' + adoError.SQLState + '   ' +
        'Error NativeError : ' + IntToStr(adoError.NativeError);
      showmessage(str);
    end; // for
end;

procedure TDM.tabGoodsAfterOpen(DataSet: TDataSet);
begin
  with tabGoods do
    begin
      if not active then
        open;
      Findfield('GdsID').DisplayLabel := '商品编号';
      Findfield('gdstypeID').DisplayLabel := '类型编号';
      Findfield('GdsName').DisplayLabel := '商品名称';
      Findfield('unit').DisplayLabel := '单位';
      Findfield('maxres').DisplayLabel := '库存上限';
      Findfield('minres').DisplayLabel := '库存下限';
      Findfield('inprice').DisplayLabel := '入货价';
      Findfield('outprice1').DisplayLabel := '出货价1';
      Findfield('outprice2').DisplayLabel := '出货价2';
      Findfield('outprice3').DisplayLabel := '出货价3';
      Findfield('outprice4').DisplayLabel := '出货价4';
      Findfield('notes').DisplayLabel := '备注';
      Findfield('inuse').DisplayLabel := '使用中';
    end; //end of with tabgoods
end;

procedure TDM.tabOutNewRecord(DataSet: TDataSet);
begin
  with DataSet do
    begin
      fieldbyname('sheetid').asstring := DateNextValue('tabSale');
      fieldbyname('date').value := strtodate(datetostr(now));
      fieldbyname('EmpId').value := CurrentEmpID;
      fieldbyname('defaultstoreid').value := 0;
      fieldbyname('type').value := '收据';
      fieldbyname('status').value := 0; //单据状态 ，0 草稿     1 单据正确
      //           2 已收完   3 末付清
    end;
end;

function TDM.ConfigDB(): boolean; //config the database source
begin
  EditConnectionString(DM.db);
  SL.Text := db.ConnectionString;
  SL.SaveToFile(Filename);
end;

procedure TDM.tabOutItemsNewRecord(DataSet: TDataSet);
begin
  with dm.taboutitems do
    begin
      FieldByName('sheetId').value := dm.tabout.FieldByName('sheetId').value;
      FieldByName('storeid').value := dm.tabout.FieldByName('defaultstoreid').value;
    end;
end;

procedure TDM.tabOutItemsCalcFields(DataSet: TDataSet);
begin
  with dm.tabOutItems do
    begin
      Fieldbyname('amo').AsFloat := Fieldbyname('price').AsFloat *
        Fieldbyname('qua').AsFloat;
      Fieldbyname('bigamo').AsFloat := Fieldbyname('bigprice').AsFloat *
        Fieldbyname('qua').AsFloat;
    end;
end;

procedure TDM.tabOutItemsGdsIDChange(Sender: TField);
var
  SavePlace: TBookmark;
begin
  with dm.tabOutItems do //商品的出货价 及单位
    begin
      if not dm.tabgoods.active then dm.tabgoods.open;
      SavePlace := dm.tabgoods.GetBookmark;
      dm.tabgoods.First;
      if dm.tabgoods.Locate('gdsid', fieldbyname('gdsId').Asstring, []) then
        begin
          edit;
          fieldbyname('unit').value := dm.tabgoods.fieldbyname('unit').value;
          fieldbyname('gdsName').value := dm.tabgoods.fieldbyname('gdsname').value;
          FieldByName('Price').value := dm.tabgoods.fieldbyname('outprice1').value;
          FieldByName('BigPrice').value := dm.tabgoods.fieldbyname('outprice1').value;
        end;
      dm.tabgoods.GotoBookmark(SavePlace);
      dm.tabgoods.FreeBookmark(SavePlace);
    end;

  //  qryPset.fieldbyname('outPriceHist').asBoolean and
  if tabOut.fieldbyname('CustId').value <> '0' then //不是零售，还要再查找历史价
    with qryOutPrice do
      begin
        close;
        sql.clear;
        Prepared := false;
        sql.Add('select * from outPriceHistory');
        sql.add('where (custid = :tmpCustID)');
        sql.add('and (gdsId =:tmpGdsID)');

        Parameters.ParamByName('tmpcustid').value := tabOut.fieldbyname('CustId').value;
        Parameters.ParamByName('tmpGdsID').value := tabOutItems.fieldbyname('gdsId').value;
        Prepared := true;
        open;
        if recordcount > 0 then //有历史价记录
          begin
            tabOutItems.edit;
            taboutItems.FieldByName('Price').value := fieldbyname('price').value;
            taboutItems.FieldByName('BigPrice').value := fieldbyname('bigprice').value;
          end;
      end;
end;

procedure TDM.updateouthistory(); //全用sql语句的话，当一次选很多数据时，总是会有麻烦 :(
//所以修改为用部分算了。
begin
   if tabOutItems.fieldbyname('price').value <= 0 then exit;

  if tabOut.fieldbyname('CustId').value <> '0' then //不是零售的话
    // 修改历史价记录，没有的话即，后加入新记录
    with qryOutPrice do
      begin
        close;
        sql.clear;
        sql.Add('select * from outPriceHistory');
        sql.add('where (custid = :tmpCustID)');
        sql.add('and (GdsID =:tmpGdsID)');
        Parameters.ParamByName('tmpcustid').value := tabOut.fieldbyname('CustId').value;
        Parameters.ParamByName('tmpGdsID').value := tabOutItems.fieldbyname('gdsId').value;
        open;
        if recordcount > 0 then //有历史价记录
          begin
            if tabOutItems.fieldbyname('price').value <> fieldbyname('price').value then //如存在记录，即修改
              begin
                if
                  MessageDlg(format('现在价(%s , %s)和上次历史价(%s ,  %s)不同，以后用现在的价位出货吗?',
                  [tabOutItems.fieldbyname('price').asstring, tabOutItems.fieldbyname('bigprice').asstring,
                  fieldbyname('price').asstring, fieldbyname('bigprice').asstring]),
                    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
                edit;
                fieldbyname('price').value := tabOutItems.fieldbyname('price').value;
                fieldbyname('bigPrice').value := tabOutItems.fieldbyname('bigprice').value;
                post;
              end; //end of if <>
          end
        else //没有历史价的话，insert new;
         begin
            append;
            fieldbyname('gdsid').value := tabOutItems.fieldbyname('gdsid').value;
            fieldbyname('custid').value := tabOut.fieldbyname('custid').value;
            fieldbyname('price').value := tabOutItems.fieldbyname('price').value;
            fieldbyname('bigPrice').value := tabOutItems.fieldbyname('bigprice').value;
            post;
          end;
     end; //end of with
 end; //end of procedure



procedure TDM.updateInHistory(); //全用sql语句的话，当一次选很多数据时，总是会有麻烦 :(
//所以修改为用部分算了。
begin
  if tabInItems.fieldbyname('price').value <= 0 then exit;

  // 修改历史价记录，没有的话即，后加入新记录
  with qryInPrice do
    begin
      close;
      sql.clear;
      sql.Add('select * from InPriceHistory');
      sql.add('where (suppid = :tmpsuppID)');
      sql.add('and (GdsID =:tmpGdsID)');
      Parameters.ParamByName('tmpsuppID').value := tabIn.fieldbyname('SuppId').value;
      Parameters.ParamByName('tmpGdsID').value := tabInItems.fieldbyname('gdsId').value;
      open;
      if recordcount > 0 then //有历史价记录
        begin
          if tabInItems.fieldbyname('price').value <> fieldbyname('price').value then //如存在记录，即修改
            begin
              if
                MessageDlg(format('现在价(%s)和上次历史价(%s)不同，以后用现在的价位出货吗?',
                [tabInItems.fieldbyname('price').asstring, fieldbyname('price').asstring]),
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
              edit;
              fieldbyname('price').value := tabInItems.fieldbyname('price').value;
              post;
            end; //end of if <>
        end
      else //没有历史价的话，insert new;
        begin
          append;
          fieldbyname('gdsid').value := tabInItems.fieldbyname('gdsid').value;
          fieldbyname('suppid').value := tabIn.fieldbyname('suppid').value;
          fieldbyname('price').value := tabInItems.fieldbyname('price').value;
          post;
        end;
    end; //end of with
end; //end of procedure


function TDM.Is_Valid_unit(gdsid: string; unitname: string): boolean; //检查单位是否合格 ,不合格，可以新增
var
  bFind: boolean;
  tmp, s: string;
  qry: tadoquery;
begin
  bFind := false;
  with qryunit do
    begin
      close;
      Parameters.ParamByName('GdsID').value := gdsId;
      open;
      while (not bfind) and (not eof) do
        begin
          if (unitname = FieldByName('baseunit').value) or //如果值等于基本值或等价值，即找以罗
          (unitname = FieldByName('unit').value) then
            bfind := true
          else
            next;
        end;

      s := format('公式：%s =       %s', [unitname, FieldByName('baseunit').asstring]);
      if (not bfind) and (MessageDlg('没有这个单位，你要新增吗？', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          if (InputQuery(format('商品编号 %s 新增单位', [gdsid]), s, tmp)) and (tmp <> '') then
            begin
              qry := tadoquery.Create(self);
              qry.Connection := dm.DB;
              sql.Clear;
              sql.Add('insert unit values (:unit,:gdsid,:equal)');
              Parameters.ParamByName('GdsID').value := gdsid;
              Parameters.ParamByName('unit').value := unitname;
              Parameters.ParamByName('equal').value := strtofloat(tmp);
              ExecSQL;
              bfind := true;
            end; //end of if inputquwry
        end; //end of if not bfind
    end; //end of with
  result := bfind;
end;


procedure TDM.tabInNewRecord(DataSet: TDataSet);
begin
  with DataSet do
    begin
      fieldbyname('sheetid').asstring := DateNextValue(DataSet.Name);
      fieldbyname('date').value := strtodate(datetostr(now));
      fieldbyname('EmpId').value := CurrentEmpID;
      fieldbyname('defaultstoreid').value := 0;
      fieldbyname('type').value := '收据';
      fieldbyname('status').value := 0; //单据状态 ，0 草稿     1 单据正确
      //       由payamo和amo可知收款情况    2 已收完   3 末付清
    end;
end;

procedure TDM.tabInItemsCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    begin
      Fieldbyname('amo').AsFloat := Fieldbyname('price').AsFloat *
        Fieldbyname('qua').AsFloat;
    end;
end;

procedure TDM.tabInItemsNewRecord(DataSet: TDataSet);
begin
 with DataSet do
    begin
      FieldByName('sheetId').value := dm.tabIn.FieldByName('sheetId').value;
      FieldByName('storeid').value := dm.tabIn.FieldByName('defaultstoreid').value;
    end;
end;

procedure TDM.tabInItemsGdsIdChange(Sender: TField);
var
  SavePlace: TBookmark;
begin
  with dm.tabInItems do //商品的出货价 及单位
    begin
      if not dm.tabgoods.active then dm.tabgoods.open;
      SavePlace := dm.tabgoods.GetBookmark;
      dm.tabgoods.First;
      if dm.tabgoods.Locate('gdsid', fieldbyname('gdsId').Asstring, []) then
        begin
          edit;
          fieldbyname('unit').value := dm.tabgoods.fieldbyname('unit').value;
          fieldbyname('gdsName').value := dm.tabgoods.fieldbyname('gdsname').value;
          FieldByName('Price').value := dm.tabgoods.fieldbyname('InPrice').value;
        end;
      dm.tabgoods.GotoBookmark(SavePlace);
      dm.tabgoods.FreeBookmark(SavePlace);
    end;

  //  qryPset.fieldbyname('outPriceHist').asBoolean and
  with qryInPrice do
    begin
      close;
      sql.clear;
      Prepared := false;
      sql.Add('select * from InPriceHistory');
      sql.add('where (suppid = :tmpsuppID)');
      sql.add('and (gdsId =:tmpGdsID)');

      Parameters.ParamByName('tmpsuppID').value := tabIn.fieldbyname('suppID').value;
      Parameters.ParamByName('tmpGdsID').value := tabInItems.fieldbyname('gdsId').value;
      Prepared := true;
      open;
      if recordcount > 0 then //有历史价记录
        begin
          tabInItems.edit;
          tabInItems.FieldByName('Price').value := fieldbyname('price').value;
        end;
    end;
end;

procedure TDM.tabOutBeforePost(DataSet: TDataSet);
begin
  {  if tabout.FieldByName('status').value > 0 then
      begin
        Showmessage('单据已经审核过，不能再修改');
        Dataset.Cancel;
        abort;
      end;
}end;

procedure TDM.tabInBeforePost(DataSet: TDataSet);
begin
  {  if tabIn.FieldByName('status').value > 0 then
      begin
        Showmessage('单据已经审核过，不能再修改');
        Dataset.Cancel;
        abort;
      end;
}end;

procedure TDM.tabOutItemsBeforePost(DataSet: TDataSet);
begin
  if tabOut.FieldByName('status').value > 0 then
    begin
      Showmessage('单据已经审核过，不能再修改');
      Dataset.Cancel;
      abort;
{    end
  else
    with dm.tabOutItems do
      begin
        if Fieldbyname('bigprice').Value < Fieldbyname('price').Value then
        begin
          edit ;
          Fieldbyname('bigprice').Value := Fieldbyname('price').Value;
        end;
 //      updateouthistory(); //检查出货历吏价，看有没有必要修改下 :(
 }     end;
end;

procedure TDM.tabInItemsBeforePost(DataSet: TDataSet);
begin
  if tabIn.FieldByName('status').value > 0 then
    begin
      Showmessage('单据已经审核过，不能再修改');
      Dataset.Cancel;
      abort;
    end   ;
 // else
 //   updateInHistory(); //检查入货历吏价，看有没有必要修改下 :(
end;  

procedure TDM.tabGoodsAfterPost(DataSet: TDataSet);
begin
   tmpgdstypeid := tabgoods.Fieldbyname('gdstypeid').Value ;
//   tabgoods.Refresh ;
end;

procedure TDM.tabGoodsNewRecord(DataSet: TDataSet);
begin
     showmessage(tmpgdstypeid);
     tabgoods.Fieldbyname('gdstypeid').Value := tmpgdstypeid;
end;

end.

