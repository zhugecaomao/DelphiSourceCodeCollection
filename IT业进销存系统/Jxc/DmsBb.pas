unit DmsBb;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, JxcS_TLB, StdVcl, Provider, Db, ADODB;

type
  TDatasBb = class(TRemoteDataModule, IDatasBb)
    KhXsHz: TADOQuery;
    pKhXsHz: TDataSetProvider;
    KhXsMx: TADOQuery;
    pKhXsMx: TDataSetProvider;
    HpXsHz: TADOQuery;
    pHpXsHz: TDataSetProvider;
    HpXsMx: TADOQuery;
    pHpXsMx: TDataSetProvider;
    YwyXsHz: TADOQuery;
    pYwyXsHz: TDataSetProvider;
    YwyXsMx: TADOQuery;
    pYwyXsMx: TDataSetProvider;
    DqXsHz: TADOQuery;
    pDqXsHz: TDataSetProvider;
    DqXsMx: TADOQuery;
    pDqXsMx: TDataSetProvider;
    HplbXsHz: TADOQuery;
    pHplbXsHz: TDataSetProvider;
    HplbXsMx: TADOQuery;
    pHplbXsMx: TDataSetProvider;
    HpXsMlHz: TADOQuery;
    pHpXsMlHz: TDataSetProvider;
    HpXsMlMx: TADOQuery;
    pHpXsMlMx: TDataSetProvider;
    pXsMlAdjs: TDataSetProvider;
    XsMlAdjs: TADOQuery;
    YwyYjtj: TADOQuery;
    pYwyYjtj: TDataSetProvider;
    XsddQk: TADOQuery;
    pXsddQk: TDataSetProvider;
    XsMsdj: TADOQuery;
    pXsMsdj: TDataSetProvider;
    XsMlNb: TADOQuery;
    pXsMlNb: TDataSetProvider;
    XsMlNbMx: TADOQuery;
    pXsMlNbMx: TDataSetProvider;
    GysGhHz: TADOQuery;
    pGysGhHz: TDataSetProvider;
    GysGhMx: TADOQuery;
    pGysGhMx: TDataSetProvider;
    HpCgHz: TADOQuery;
    pHpCgHz: TDataSetProvider;
    HpCgMx: TADOQuery;
    pHpCgMx: TDataSetProvider;
    YwyCgHz: TADOQuery;
    pYwyCgHz: TDataSetProvider;
    YwyCgMx: TADOQuery;
    pYwyCgMx: TDataSetProvider;
    CgddQk: TADOQuery;
    pCgddQk: TDataSetProvider;
    CgMfDj: TADOQuery;
    pCgMfDj: TDataSetProvider;
    CkkcHz: TADOQuery;
    pCkkcHz: TDataSetProvider;
    CkkcMx: TADOQuery;
    pCkkcMx: TDataSetProvider;
    HpCwb: TADOQuery;
    pHpCwb: TDataSetProvider;
    YskZb: TADOQuery;
    pYskZb: TDataSetProvider;
    YskZlfx: TADOQuery;
    pYskZlfx: TDataSetProvider;
    YfkZb: TADOQuery;
    pYfkZb: TDataSetProvider;
    YfkZlfx: TADOQuery;
    pYfkZlfx: TDataSetProvider;
    YskMx: TADOQuery;
    pYskMx: TDataSetProvider;
    YfkMx: TADOQuery;
    pYfkMx: TDataSetProvider;
    YskZlMx: TADOQuery;
    pYskZlMx: TDataSetProvider;
    YfkZlMx: TADOQuery;
    pYfkZlMx: TDataSetProvider;
    Fxt: TADOQuery;
    pFxt: TDataSetProvider;
    RqLsz: TADOQuery;
    pRqLsz: TDataSetProvider;
    GysLsz: TADOQuery;
    pGysLsz: TDataSetProvider;
    KhLsz: TADOQuery;
    pKhLsz: TDataSetProvider;
    SzLsz: TADOQuery;
    pSzLsz: TDataSetProvider;
    CkLsz: TADOQuery;
    pCkLsz: TDataSetProvider;
    SzHz: TADOQuery;
    pSzHz: TDataSetProvider;
    XjyhHz: TADOQuery;
    pXjyhHz: TDataSetProvider;
    YyqkHz: TADOQuery;
    pYyqkHz: TDataSetProvider;
    SzMx: TADOQuery;
    pSzMx: TDataSetProvider;
    XjyhMx: TADOQuery;
    pXjyhMx: TDataSetProvider;
    Yylrb: TADOQuery;
    pYylrb: TDataSetProvider;
    JdqYsk: TADOQuery;
    pJdqYsk: TDataSetProvider;
    CqYsk: TADOQuery;
    pCqYsk: TDataSetProvider;
    JdqYfk: TADOQuery;
    pJdqYfk: TDataSetProvider;
    CqYfk: TADOQuery;
    pCqYfk: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure SetFilter(Filter: OleVariant); safecall;
  public
    { Public declarations }
  end;

implementation

uses Variants, Dms;

{$R *.DFM}

class procedure TDatasBb.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TDatasBb.SetFilter(Filter: OleVariant);
var
  DataSet : TDataSet;
begin
  DataSet := TDataSet( Self.FindComponent( VarToStr(Filter[0]) ) );
  DataSet.Filter := VarToStr(Filter[1]);
  DataSet.Filtered := DataSet.Filter <> '';
end;

initialization
  TComponentFactory.Create(ComServer, TDatasBb,
    Class_DatasBb, ciMultiInstance, tmApartment);
end.
