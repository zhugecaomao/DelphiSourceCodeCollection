unit ufrmHR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, dxCntner, dxEditor,
  CSCustomdxDateEdit, CSdxDBDateEdit, DBLookupEh, StdCtrls, Mask,
  DBCtrlsEh, CSDBBase, CSDBFind, DB, dxmdaset, CSScrCtrlChild,
  CSBarMDIChild, ImgList, ExtCtrls, ComCtrls, dxtree, dxdbtree, DBCtrls,
  CSDBNavigator, Buttons, ADODB, CSADOQuery;

type
  TfrmHR = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    bbtnPrint: TBitBtn;
    bbtnHelp: TBitBtn;
    bbtnClose: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    bbtnAddGroup: TBitBtn;
    bbtnAddUser: TBitBtn;
    bbtnDelete: TBitBtn;
    navPersonMge: TCSDBNavigator;
    bbtnFind: TBitBtn;
    bbtnCopy: TBitBtn;
    bbtnCut: TBitBtn;
    bbtnPaste: TBitBtn;
    tvPersonMge: TdxDBTreeView;
    Splitter1: TSplitter;
    scrbUserDetail: TScrollBox;
    ImageList: TImageList;
    CSBarMDIChild1: TCSBarMDIChild;
    ScrChild: TCSScrCtrlChild;
    Find: TCSDBFind;
    bbtnSave: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnPerDefine: TBitBtn;
    Label2: TLabel;
    eName: TDBEditEh;
    Label13: TLabel;
    eCardid: TDBEditEh;
    Label11: TLabel;
    lcmbSex: TDBLookupComboboxEh;
    Label20: TLabel;
    ePassid: TDBEditEh;
    Label3: TLabel;
    dteBirthday: TCSdxDBDateEdit;
    Label10: TLabel;
    lcmbNation: TDBLookupComboboxEh;
    Label12: TLabel;
    ePolity: TDBEditEh;
    Label21: TLabel;
    lcmbEdudegree: TDBLookupComboboxEh;
    Label16: TLabel;
    lcmbMarry: TDBLookupComboboxEh;
    Label17: TLabel;
    eMate: TDBEditEh;
    Label22: TLabel;
    ePost: TDBEditEh;
    Label15: TLabel;
    lcmbZzqk: TDBLookupComboboxEh;
    Label7: TLabel;
    eGraSchool: TDBEditEh;
    Label18: TLabel;
    eSpecial: TDBEditEh;
    Label4: TLabel;
    lcmbDegree: TDBLookupComboboxEh;
    Label5: TLabel;
    dteGratime: TCSdxDBDateEdit;
    Label14: TLabel;
    eAddr: TDBEditEh;
    Label6: TLabel;
    eTel: TDBEditEh;
    Label8: TLabel;
    eZip: TDBEditEh;
    Label32: TLabel;
    eTitleofpast: TDBEditEh;
    Label9: TLabel;
    dteZcpdtime: TCSdxDBDateEdit;
    Label19: TLabel;
    ePic: TdxDBGraphicEdit;
    Label23: TLabel;
    e_loginname: TDBEditEh;
    l_password: TLabel;
    e_password: TDBEditEh;
    Label28: TLabel;
    e_customid: TDBEditEh;
    l_confirmpwd: TLabel;
    e_confirmpwd: TEdit;
    scrbGroupDetail: TScrollBox;
    Label24: TLabel;
    Label25: TLabel;
    e_deptid: TDBEditEh;
    e_deptname: TDBEditEh;
    hr: TCSADOQuery;
    person_baseinfo: TCSADOQuery;
    scr_items_bpaspr: TCSADOQuery;
    hrd: TDataSource;
    scr_items_bpasprd: TDataSource;
    person_baseinfod: TDataSource;
    nation: TCSADOQuery;
    nationd: TDataSource;
    marrystatus: TCSADOQuery;
    marrystatusd: TDataSource;
    sex: TCSADOQuery;
    sexd: TDataSource;
    edudegree: TCSADOQuery;
    edudegreed: TDataSource;
    zzqk: TCSADOQuery;
    zzqkd: TDataSource;
    degree: TCSADOQuery;
    degreed: TDataSource;
    hrsysid: TStringField;
    hrname: TStringField;
    hritemcode: TStringField;
    hrscr_user: TStringField;
    hrparent_sysid: TStringField;
    hrcode_level: TStringField;
    hrperson_sysid: TStringField;
  private
    procedure prip_IniData;
    procedure prip_IniInterface;
  public
    procedure pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings = nil);
  end;

var
  frmHR: TfrmHR;

implementation

{$R *.dfm}

{ TfrmHR }

procedure TfrmHR.prip_IniData;
begin

end;

procedure TfrmHR.prip_IniInterface;
begin

end;

procedure TfrmHR.pubp_Ini(const Ab_SelectOn: Boolean; Ac_Args: TStrings);
begin

end;

end.
