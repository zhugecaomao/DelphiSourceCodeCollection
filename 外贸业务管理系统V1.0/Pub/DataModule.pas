unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB,Windows, Forms, Dialogs,ComCtrls, Controls,
  StdCtrls, myClass, fcTreeView;

type
  TDataModule_frm = class(TDataModule)
    ADOConnection1: TADOConnection;
    Query: TADOQuery;
    ProcQuery: TADOQuery;
    PubQuery: TADOQuery;
    ds_ProductType: TDataSource;
    Query_ProductType: TADOQuery;
    Query_PackageUnit: TADOQuery;
    ds_PackageUnit: TDataSource;
    Query_WeightUnit: TADOQuery;
    ds_WeightUnit: TDataSource;
    Query_AmountUnit: TADOQuery;
    ds_AmountUnit: TDataSource;
    ds_ExchangeRate: TDataSource;
    Query_ExchangeRate: TADOQuery;
    ds_CurrencySort: TDataSource;
    Query_CurrencySort: TADOQuery;
    ds_GoodsBox: TDataSource;
    Query_GoodsBox: TADOQuery;
    ds_Color: TDataSource;
    Query_Color: TADOQuery;
    ds_InsuranceItem: TDataSource;
    Query_InsuranceItem: TADOQuery;
    ds_ProductCode: TDataSource;
    Query_ProductCode: TADOQuery;
    ds_FactoryInfo: TDataSource;
    Query_FactoryInfo: TADOQuery;
    ds_RemitMode: TDataSource;
    Query_RemitMode: TADOQuery;
    ds_CompanyInfo: TDataSource;
    Query_CompanyInfo: TADOQuery;
    ds_Port: TDataSource;
    Query_Port: TADOQuery;
    ds_Country: TDataSource;
    Query_Country: TADOQuery;
    qPerson: TADOQuery;
    dsPerson: TDataSource;
    qTemp: TADOQuery;
    qUserLogin: TADOQuery;
    dsUserLogin: TDataSource;
    cTemp: TADOCommand;
    qSecurityGroup_UserLogin: TADOQuery;
    dsSecurityGroup_UserLogin: TDataSource;
    Query_CurrencySortDictID: TWideStringField;
    Query_CurrencySortDictName: TWideStringField;
    Query_CurrencySortDictCode: TWideStringField;
    Query_CurrencySortDictEnName: TWideStringField;
    Query_CurrencySortUSBRate: TFloatField;
    Query_ExchangeRateDictID: TWideStringField;
    Query_ExchangeRateDictName: TWideStringField;
    Query_ExchangeRatePriceRate: TFloatField;
    ds_UserInfo: TDataSource;
    Q_UserInfo: TADOQuery;
    ds_InsuranceSurrogate: TDataSource;
    Q_InsuranceSurrogate: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    { Public declarations }
    procedure Get_Dict();

    procedure BuildDeptTree(parentNode:TTreeNode;deptTree:TTreeView);
    procedure BuildSecurityGroupTree(parentNode:TTreeNode;tv:TTreeView);
    procedure BuildCheckSecurityGroupTree(TreeView:TfcTreeView);
    procedure BuildCheckSubSecurityGroupTree(parentNode:TfcTreeNode;TreeView:TfcTreeView);
    procedure BuildDeptComboBox(dept:TDepartment;ComboBox:TCustomComboBox);
    function GetSequenceValue(seqName:String;default:Integer):Integer;
    function GetPerson(partyId:String):TPerson;
    function GetSecurityPermissions:TList;
    function GetSecurityGroupPermissions(groupId:Integer):TList;
    function GetUserLogin(userLoginId:String):TUserLogin;
    function GetUserLoginSecurityGroups(userLoginId:String):TList;
    function GetUserLoginSecurityPermissions(userLoginId:String):TList;
    procedure SearchPerson(wheretxt:String);
    procedure SearchPartyUserLogin(partyId:String);
    procedure SearchSecurityGroupUserLogin(groupId:Integer);
    procedure Insert_SecurityGroupPermission(groupId,permissionId:Integer;flag:Boolean);
    procedure insert_department(department:Tdepartment);
    procedure update_department(department:Tdepartment);
    procedure delete_department(department:Tdepartment);
    procedure insert_person(person:TPerson);
    procedure update_person(person:TPerson);
    procedure delete_person(person:TPerson);
    procedure insert_UserLogin(userlogin:TUserLogin);
    procedure update_UserLogin(userlogin:TUserLogin);
    procedure delete_UserLogin(userlogin:TUserLogin);
    procedure insert_SecurityGroup(securitygroup:TSecurityGroup);
    procedure update_SecurityGroup(securitygroup:TSecurityGroup);
    procedure delete_SecurityGroup(securitygroup:TSecurityGroup);
    procedure insert_UserLoginSecurityGroup(groupId:Integer;userLoginId:String;CheckValue:Boolean);
    procedure SecurityGroupPermissionToUserLogin(groupId:Integer;userLoginId:String;CheckValue:Boolean);
    procedure insert_UserLoginPermission(userLoginId:String;permissionId:Integer;CheckValue:Boolean);
  end;

const
  PARTY_DEPARTMENT=1;
  PARTY_PERSON=0;
  PARTY_RELATIONSHIP_DEPARTMENT=1;
  PARTY_RELATIONSHIP_PERSON=0;

var
  DataModule_frm: TDataModule_frm;

implementation

uses BasePage;



{$R *.dfm}

procedure TDataModule_frm.Get_Dict();
begin
  //打开字典
  try
      Get_Query(Query_ProductType, 'select * from DictProductType');
      Get_Query(Query_PackageUnit, 'select * from DictPackageUnit');
      Get_Query(Query_WeightUnit, 'select * from DictWeightUnit');
      Get_Query(Query_AmountUnit, 'select * from DictAmountUnit');
      Get_Query(Query_ExchangeRate, 'select * from DictExchangeRate');
      Get_Query(Query_CurrencySort, 'select * from DictCurrencySort');
      Get_Query(Query_GoodsBox, 'select * from DictGoodsBox');
      Get_Query(Query_Color, 'select * from DictColor');
      Get_Query(Query_ProductCode, 'select * from DictProductCode');
      Get_Query(Query_InsuranceItem, 'select * from DictInsuranceItem');
      Get_Query(Q_InsuranceSurrogate, 'select * from DictInsuranceSurrogate');
      Get_Query(Query_Country, 'select * from DictCountry');
      Get_Query(Query_RemitMode, 'select * from DictRemitMode');
      Get_Query(Query_Port, 'select * from DictPort where 1<>1');
      Get_Query(Query_FactoryInfo, 'select * from FactoryInfo');
      Get_Query(Query_CompanyInfo, 'select * from CompanyInfo');
      Get_Query(Q_UserInfo, 'select * from UserInfo');
  except
     on ex :exception do  showmessage(ex.Message);
  end ;

end;
procedure TDataModule_frm.DataModuleCreate(Sender: TObject);
var user_sa, user_pwd, sqlstr:string;
begin
  try
        SystemFilePath  :=extractfilepath(application.exename);
        UIFormStyle     := trim(GetFileCFG(SystemFilePath + IniFileName, 'DefaultStyle', 'UIFormStyle'));

        {DbName :=trim(GetFileCFG(SystemFilePath + IniFileName, 'SYSTEM', 'DATABASENAME'));
        ServerName :=trim(GetFileCFG(SystemFilePath + IniFileName, 'SYSTEM', 'SERVERNAME'));
        //user_sa :=trim(GetFileCFG(SystemFilePath + IniFileName, 'SYSTEM', 'USERNAME'));
        //user_pwd :=trim(GetFileCFG(SystemFilePath + IniFileName, 'SYSTEM', 'PASSWORD'));
        SysName :=trim(GetFileCFG(SystemFilePath + IniFileName, 'SYSTEM', 'SystemTitle'));
        }
  except
    showmessage('读取配置文件出错');
    exit;
  end;
  ADOConnection1.Connected :=false ;
  ADOConnection1.ConnectionString :='';
  ADOConnection1.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ SystemFilePath+ 'Data\Demo.mdb;Persist Security Info=False';
  //showmessage(ADOConnection1.ConnectionString);
  //ADOConnection1.ConnectionString :='Provider=SQLOLEDB.1;Persist Security Info=False;User ID=' + user_sa+ ';Initial Catalog=' + DbName + ';Password=' +user_pwd+ ';Data Source=' + ServerName;
  try
      ADOConnection1.Connected :=true;
  except
     on E: Exception do
     begin
       WriteLog(E.Message);
       showmessage('数据库连接不上');
     end;
  end ;
  Get_Dict();
end;

procedure TDataModule_frm.BuildCheckSecurityGroupTree(
  TreeView: TfcTreeView);
var
  aNode:TfcTreeNode;
  SecurityGroup:TSecurityGroup;
begin
  with qTemp do
  begin
    Close;
    SQL.Text:='select * from SecurityGroup where parentId=-1';
    Open;
    TreeView.Items.Clear;
    while not Eof do
    begin
      SecurityGroup:=TSecurityGroup.Create;
      SecurityGroup.groupId:=FieldByName('groupId').AsInteger;
      SecurityGroup.parentId:=FieldByName('parentId').AsInteger;
      SecurityGroup.description:=FieldByName('description').AsString;
      aNode:=TreeView.Items.AddChild(nil,SecurityGroup.description);
      aNode.Data:=SecurityGroup;
      aNode.CheckboxType:=tvctCheckbox;
      aNode.Checked:=false;
      aNode.MakeVisible;
      BuildCheckSubSecurityGroupTree(aNode,TreeView);
      Next;
    end;
  end;

end;

procedure TDataModule_frm.BuildCheckSubSecurityGroupTree(
  parentNode: TfcTreeNode; TreeView: TfcTreeView);
var
  q:TADOQuery;
  aNode:TfcTreeNode;
  SecurityGroup:TSecurityGroup;
begin
  SecurityGroup:=TSecurityGroup(parentNode.Data);
  q:=TADOQuery.Create(nil);
  try
    with q do
    begin
      Connection:=ADOConnection1;
      Close;
      SQL.Text:='select * from SecurityGroup where parentId='+IntToStr(SecurityGroup.groupId);
      Open;
      while not Eof do
      begin
        SecurityGroup:=TSecurityGroup.Create;
        SecurityGroup.groupId:=FieldByName('groupId').AsInteger;
        SecurityGroup.parentId:=FieldByName('parentId').AsInteger;
        SecurityGroup.description:=FieldByName('description').AsString;
        aNode:=TreeView.Items.AddChild(parentNode,SecurityGroup.description);
        aNode.Data:=SecurityGroup;
        aNode.CheckboxType:=tvctCheckbox;
        aNode.Checked:=false;
        aNode.MakeVisible;
        BuildCheckSubSecurityGroupTree(aNode,TreeView);
        Next;
      end;
    end;
  finally
    q.Free;
  end;


end;

procedure TDataModule_frm.BuildDeptComboBox(dept: TDepartment;
  ComboBox: TCustomComboBox);
var
  q:TADOQuery;
begin
  q:=TADOQuery.Create(nil);
  try
    with q do
    begin
      Connection:=ADOConnection1;
      Close;
      SQL.Text:='select * from V_Department where parentId='''+dept.partyId+'''';
      Open;
      while not Eof do
      begin
        dept:=TDepartment.Create;
        dept.partyId:=FieldByName('partyId').AsString;
        dept.parentId:=FieldByName('parentId').AsString;
        dept.description:=FieldByName('description').AsString;
        ComboBox.AddItem(dept.description,dept);
        BuildDeptComboBox(dept,ComboBox);
        Next;
      end;
    end;
  finally
    q.Free;
  end;
end;

procedure TDataModule_frm.BuildDeptTree(parentNode: TTreeNode;
  deptTree: TTreeView);
var
  q:TADOQuery;
  aNode:TTreeNode;
  dept:TDepartment;
begin
  dept:=TDepartment(parentNode.Data);
  q:=TADOQuery.Create(nil);
  try
    with q do
    begin
      Connection:=ADOConnection1;
      Close;
      SQL.Text:='select * from V_Department where parentId='''+dept.partyId+'''';
      Open;
      while not Eof do
      begin
        dept:=TDepartment.Create;
        dept.partyId:=FieldByName('partyId').AsString;
        dept.parentId:=FieldByName('parentId').AsString;
        dept.description:=FieldByName('description').AsString;
        aNode:=deptTree.Items.AddChild(parentNode,dept.description);
        aNode.Data:=dept;
        BuildDeptTree(aNode,deptTree);
        Next;
      end;
    end;
  finally
    q.Free;
  end;

end;

procedure TDataModule_frm.BuildSecurityGroupTree(parentNode: TTreeNode;
  tv: TTreeView);
var
  q:TADOQuery;
  aNode:TTreeNode;
  SecurityGroup:TSecurityGroup;
begin
  SecurityGroup:=TSecurityGroup(parentNode.Data);
  q:=TADOQuery.Create(nil);
  try
    with q do
    begin
      Connection:=ADOConnection1;
      Close;
      SQL.Text:='select * from SecurityGroup where parentId='+IntToStr(SecurityGroup.groupId);
      Open;
      while not Eof do
      begin
        SecurityGroup:=TSecurityGroup.Create;
        SecurityGroup.groupId:=FieldByName('groupId').AsInteger;
        SecurityGroup.parentId:=FieldByName('parentId').AsInteger;
        SecurityGroup.description:=FieldByName('description').AsString;
        aNode:=tv.Items.AddChild(parentNode,SecurityGroup.description);
        aNode.Data:=SecurityGroup;
        BuildSecurityGroupTree(aNode,tv);
        Next;
      end;
    end;
  finally
    q.Free;
  end;

end;

procedure TDataModule_frm.delete_department(department: Tdepartment);
begin
  cTemp.CommandText:='delete from Party where partyId='''+department.partyId+'''';
  cTemp.Execute;
  cTemp.CommandText:='delete from Department where partyId='''+department.partyId+'''';
  cTemp.Execute;
  cTemp.CommandText:='delete from PartyRelationship where partyIdFrom='''+department.partyId
                    +''' or partyIdTo='''+department.partyId+'''';
  cTemp.Execute;
end;

procedure TDataModule_frm.delete_person(person: TPerson);
begin
  cTemp.CommandText:='delete from Party where partyId='''+person.partyId+'''';
  cTemp.Execute;
  cTemp.CommandText:='delete from Person where partyId='''+person.partyId+'''';
  cTemp.Execute;
  cTemp.CommandText:='delete from PartyRelationship where partyIdFrom='''+person.partyId
                    +''' or partyIdTo='''+person.partyId+'''';
  cTemp.Execute;
end;

procedure TDataModule_frm.delete_SecurityGroup(
  securitygroup: TSecurityGroup);
begin
  cTemp.CommandText:='delete from SecurityGroup where groupId='+IntToStr(securitygroup.groupId);
  cTemp.Execute;
end;

procedure TDataModule_frm.delete_UserLogin(userlogin: TUserLogin);
begin
  cTemp.CommandText:='delete from UserLoginSecurityPermission where userLoginId='''+userlogin.userLoginId+'''';
  cTemp.Execute;
  cTemp.CommandText:='delete from UserLoginSecurityGroup where userLoginId='''+userlogin.userLoginId+'''';
  cTemp.Execute;
  cTemp.CommandText:='delete from UserLogin where userLoginId='''+userlogin.userLoginId+'''';
  cTemp.Execute;
end;

function TDataModule_frm.GetPerson(partyId: String): TPerson;
begin
  result:=nil;
  with qTemp do
  begin
    Close;
    SQL.Text:='select * from V_Person where partyId='''+partyId+'''';
    Open;
    if not IsEmpty then
    begin
      result:=TPerson.Create;
      result.partyId:=partyId;
      result.certNo:=FieldByName('certNo').AsString;
      result.name:=FieldByName('name').AsString;
      result.Gender:=FieldByName('Gender').AsString;
      result.birthDate:=FieldByName('birthDate').AsDateTime;
      result.maritalStatus:=FieldByName('maritalStatus').AsString;
      result.deptId:=FieldByName('deptId').AsString;
      result.comments:=FieldByName('comments').AsString;
    end;
  end;
end;

function TDataModule_frm.GetSecurityGroupPermissions(
  groupId: Integer): TList;
var
  SecurityPermission:TSecurityPermission;
begin
  result:=TList.Create;
  with qTemp do
  begin
    Close;
    SQL.Text:='select * from V_SecurityGroupPermission where groupId='+IntToStr(groupId);
    Open;
    while not Eof do
    begin
      SecurityPermission:=TSecurityPermission.Create;
      SecurityPermission.permissionId:=FieldByName('permissionId').AsInteger;
      SecurityPermission.parentId:=FieldByName('parentId').AsInteger;
      SecurityPermission.description:=FieldByName('description').AsString;
      result.Add(SecurityPermission);
      Next;
    end;
  end;

end;

function TDataModule_frm.GetSecurityPermissions: TList;
var
  SecurityPermission:TSecurityPermission;
begin
  result:=TList.Create;
  with qTemp do
  begin
    Close;
    SQL.Text:='select * from SecurityPermission';
    Open;
    while not Eof do
    begin
      SecurityPermission:=TSecurityPermission.Create;
      SecurityPermission.permissionId:=FieldByName('permissionId').AsInteger;
      SecurityPermission.parentId:=FieldByName('parentId').AsInteger;
      SecurityPermission.description:=FieldByName('description').AsString;
      result.Add(SecurityPermission);
      Next;
    end;
  end;

end;

function TDataModule_frm.GetSequenceValue(seqName: String;
  default: Integer): Integer;
begin
  result:=default;
  with qTemp do
  begin
    Close;
    SQL.Text:='select seqId from SequenceValueItem where seqName='''+seqName+'''';
    Open;
    if IsEmpty then
    begin
      cTemp.CommandText:='insert into SequenceValueItem(seqName,seqId) values('''+seqName+''','+InttoStr(result)+')';
      cTemp.Execute;
    end
    else
    begin
      result:=FieldByName('seqId').AsInteger;
      cTemp.CommandText:='update SequenceValueItem set seqId='+IntTostr(result+1)+' where seqName='''+seqName+'''';
      cTemp.Execute;
    end;
  end;
end;

function TDataModule_frm.GetUserLogin(userLoginId: String): TUserLogin;
begin
  result:=nil;
  with qTemp do
  begin
    Close;
    SQL.Text:='select * from UserLogin where userLoginId='''+userLoginId+'''';
    Open;
    if not IsEmpty then
    begin
      result:=TUserLogin.Create;
      result.userLoginId:=userLoginId;
      result.partyId:=FieldByName('partyId').AsString;;
      result.description:=FieldByName('description').AsString;
      result.password:=FieldByName('password').AsString;
      result.enabled:=FieldByName('enabled').AsBoolean;
    end;
  end;
end;

function TDataModule_frm.GetUserLoginSecurityGroups(
  userLoginId: String): TList;
var
  SecurityGroup:TSecurityGroup;
begin
  result:=TList.Create;
  with qTemp do
  begin
    Close;
    SQL.Text:='select * from SecurityGroup where groupId '
             +'in (select groupId from UserLoginSecurityGroup where userloginId='''+userloginId+''')';
    Open;
    while not Eof do
    begin
      SecurityGroup:=TSecurityGroup.Create;
      SecurityGroup.groupId:=FieldByName('groupId').AsInteger;
      SecurityGroup.parentId:=FieldByName('parentId').AsInteger;
      SecurityGroup.description:=FieldByName('description').AsString;
      result.Add(SecurityGroup);
      Next;
    end;
  end;

end;

function TDataModule_frm.GetUserLoginSecurityPermissions(
  userLoginId: String): TList;
var
  SecurityPermission:TSecurityPermission;
begin
  result:=TList.Create;
  with qTemp do
  begin
    Close;
    SQL.Text:='select * from SecurityPermission where permissionId '
             +'in (select permissionId from UserLoginSecurityPermission where userloginId='''+userloginId+''')';
    Open;
    while not Eof do
    begin
      SecurityPermission:=TSecurityPermission.Create;
      SecurityPermission.permissionId:=FieldByName('permissionId').AsInteger;
      SecurityPermission.parentId:=FieldByName('parentId').AsInteger;
      SecurityPermission.description:=FieldByName('description').AsString;
      result.Add(SecurityPermission);
      Next;
    end;
  end;

end;

procedure TDataModule_frm.insert_department(department: Tdepartment);
var
  partyId:String;
begin
  partyId:=IntToStr(GetSequenceValue('PARTY_DEPARTMENT',10000));
  department.partyId:=partyId;
  cTemp.CommandText:='insert into Party(partyId,partyTypeId,createDate) values('''
                    +partyId+''','+IntToStr(PARTY_DEPARTMENT)+','''+DateToStr(Date())+''')';
  cTemp.Execute;
  cTemp.CommandText:='insert into Department(partyId,description) values('''+partyId+''','''+department.description+''')';
  cTemp.Execute;
  cTemp.CommandText:='insert into PartyRelationship(partyIdFrom,partyIdTo,PartyRelationshipTypeId)'
                    +' values('''+department.parentId+''','''+partyId+''','+IntToStr(PARTY_RELATIONSHIP_DEPARTMENT)+')';
  cTemp.Execute;

end;

procedure TDataModule_frm.insert_person(person: TPerson);
var
  partyId:String;
begin
  partyId:=IntToStr(GetSequenceValue('PARTY_PERSON',20000));
  person.partyId:=partyId;
  cTemp.CommandText:='insert into Party(partyId,partyTypeId,createDate) values('''
                    +partyId+''','+IntToStr(PARTY_PERSON)+','''+DateToStr(Date())+''')';
  cTemp.Execute;
  with person do
  begin
  cTemp.CommandText:='insert into Person(partyId,certNo,name,gender,birthDate,maritalStatus,comments)'
                    +' values('''+partyId+''','''+certNo+''','''+name+''','''+gender+''','''
                    +DateToStr(birthDate)+''','''+maritalStatus+''','''+comments+''')';
  cTemp.Execute;
  end;
  cTemp.CommandText:='insert into PartyRelationship(partyIdFrom,partyIdTo,PartyRelationshipTypeId)'
                    +' values('''+person.deptId+''','''+partyId+''','+IntToStr(PARTY_RELATIONSHIP_PERSON)+')';
  cTemp.Execute;

end;

procedure TDataModule_frm.insert_SecurityGroup(
  securitygroup: TSecurityGroup);
begin
  cTemp.CommandText:='insert into SecurityGroup(parentId,description)'
                    +' values('+IntToStr(securitygroup.parentId)+','''+securitygroup.description+''')';
  cTemp.Execute;
end;

procedure TDataModule_frm.Insert_SecurityGroupPermission(groupId,
  permissionId: Integer; flag: Boolean);
begin
  cTemp.CommandText:='delete from SecurityGroupPermission where  groupId='+inttostr(groupId)
                    +' and permissionId='+IntToStr(permissionId);
  cTemp.Execute;
  if flag then
  begin
    cTemp.CommandText:='insert into SecurityGroupPermission(groupId,permissionId) values('
                      +inttostr(groupId)+','+IntToStr(permissionId)+')';
    cTemp.Execute;
  end
end;

procedure TDataModule_frm.insert_UserLogin(userlogin: TUserLogin);
begin
  with userlogin do
  begin
    cTemp.CommandText:='insert into UserLogin(userLoginId,partyId,[password],description,enabled) values('''
                      +userLoginId+''','''+partyId+''','''+password+''','''+description+''','+BoolToStr(enabled)+')';
    cTemp.Execute;
  end;
end;

procedure TDataModule_frm.insert_UserLoginPermission(userLoginId: String;
  permissionId: Integer; CheckValue: Boolean);
begin
  cTemp.CommandText:='delete from UserLoginSecurityPermission where permissionId='+IntToStr(permissionId)
                   +' and UserLoginId='''+userLoginId+'''';
  cTemp.Execute;
  if not CheckValue then exit;
  cTemp.CommandText:='insert into UserLoginSecurityPermission(permissionId,UserLoginId)'
                    +' values('+IntToStr(permissionId)+','''+userLoginId+''')';
  cTemp.Execute;
end;

procedure TDataModule_frm.insert_UserLoginSecurityGroup(groupId: Integer;
  userLoginId: String; CheckValue: Boolean);
begin
  cTemp.CommandText:='delete from UserLoginSecurityGroup where groupId='+IntToStr(groupId)
                   +' and UserLoginId='''+userLoginId+'''';
  cTemp.Execute;
  if not CheckValue then exit;
  cTemp.CommandText:='insert into UserLoginSecurityGroup(groupId,UserLoginId)'
                    +' values('+IntToStr(groupId)+','''+userLoginId+''')';
  cTemp.Execute;
end;

procedure TDataModule_frm.SearchPartyUserLogin(partyId: String);
begin
  with qUserLogin do
  begin
    Close;
    SQL.Text:='select userLoginId,description,enabled from UserLogin where partyId='''+partyId+'''';
    Open;
  end;
end;

procedure TDataModule_frm.SearchPerson(wheretxt: String);
begin
  with qPerson do
  begin
    Close;
    SQL.Text:='select * from V_Person where '+wheretxt;
    Open;
  end;
end;

procedure TDataModule_frm.SearchSecurityGroupUserLogin(groupId: Integer);
begin
  with qSecurityGroup_UserLogin do
  begin
    Close;
    SQL.Text:='select * from V_SecurityGroup_UserLogin where groupId='+IntToStr(groupId);
    Open;
  end;
end;

procedure TDataModule_frm.SecurityGroupPermissionToUserLogin(
  groupId: Integer; userLoginId: String; CheckValue: Boolean);
begin
  cTemp.CommandText:='delete from UserLoginSecurityPermission where UserLoginId='''+userLoginId
                    +''' and permissionId in (select permissionId from SecurityGroupPermission where groupId='+IntToStr(groupId)+')';
  cTemp.Execute;
  if CheckValue then
  begin
    cTemp.CommandText:='insert into UserLoginSecurityPermission(UserLoginId,permissionId) select '''
             +userLoginId+''' as userloginId,permissionId from SecurityGroupPermission where groupId='+IntToStr(groupId);
    cTemp.Execute;
  end;
end;

procedure TDataModule_frm.update_department(department: Tdepartment);
begin
  cTemp.CommandText:='update Department set description='''+department.description+''' where partyId='''+department.partyId+'''';
  cTemp.Execute;
end;

procedure TDataModule_frm.update_person(person: TPerson);
begin
  with person do
  begin
    cTemp.CommandText:='update Person set certNo='''+certNo+''',name='''+name
                      +''',gender='''+gender+''',birthDate='''+DateToStr(birthDate)
                      +''',maritalStatus='''+maritalStatus+''',comments='''+comments
                      +''' where partyId='''+partyId+'''';
    cTemp.Execute;
  end;
end;

procedure TDataModule_frm.update_SecurityGroup(
  securitygroup: TSecurityGroup);
begin
  with securitygroup do
  begin
    cTemp.CommandText:='update SecurityGroup set description='''+description
                      +''' where groupId='+IntToStr(groupId);
    cTemp.Execute;
  end;
end;

procedure TDataModule_frm.update_UserLogin(userlogin: TUserLogin);
begin
  with userlogin do
  begin
    cTemp.CommandText:='update UserLogin set description='''+description+''',enabled='+BoolToStr(enabled)
                      +' where userLoginId='''+userLoginId+'''';
    cTemp.Execute;
  end;
end;

end.
