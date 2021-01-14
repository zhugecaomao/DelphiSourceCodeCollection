unit uConstant;

interface

const
  rKeyViol = 9729; //键值重覆
  rMinValErr = 9730;//小於栏位最小值限制
  rMaxValErr = 9731;//大於栏位最大值限制
  rRequiredField = 9732;//必须输入值的栏位,不能是空的
  rForeignKey = 9733;//找不到一对多关联的主资料表
  rDetailExist = 9734;//不能修改或删除一对多关联的主资料表记录
  rLookupTableErr = 9736;//栏位值超出LOOKUP范围


resourcestring

//for database error message
rValue_IsnotNull = '请输入"%s"栏位值';
rValue_OverThanZero = '"%s"必须大於或是等於 0';
rValue_InvalidKey = '"%s"的记录已存在资料表中, 您不能输入两笔相同的资料';
rValue_NotFind = '对不起! 找不到您所要的资料';



var
  sCompanyName : String;  //公司名称
  sCompanyTel  : String;  //公司电话
  sCompanyFax  : String;  //公司传真
  sCompanyAddr : String;  //公司地址
  sAliasName   : String;  //资料库别名
  sComPanySName: string;  //公司简称

implementation

end.
