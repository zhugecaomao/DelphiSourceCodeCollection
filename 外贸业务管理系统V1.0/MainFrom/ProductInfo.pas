unit ProductInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, SUIButton, SUIImagePanel, GridsEh, DBGridEh,
  SUIPageControl, SUITabControl, DB, ADODB, StdCtrls, Mask, DBCtrls,
  SUIGroupBox, ExtCtrls, SUIForm, DBCtrlsEh, DBLookupEh, ImgList, ComCtrls, JPEG,
  ExtDlgs, Menus, SUIPopupMenu;

type
  TProductInfo_frm = class(TBaseFrm)
    DataSource1: TDataSource;
    Query: TADOQuery;
    PageControl1: TsuiPageControl;
    TabSheet1: TsuiTabSheet;
    DBGridPrice: TDBGridEh;
    TabSheet2: TsuiTabSheet;
    DBGridContract: TDBGridEh;
    suiImagePanel1: TsuiImagePanel;
    btnSelect: TsuiButton;
    btnAdd: TsuiButton;
    btnDelete: TsuiButton;
    btnSave: TsuiButton;
    btnBrower: TsuiButton;
    btnClose: TsuiButton;
    albtnPrint: TsuiArrowButton;
    suiImagePanel2: TsuiImagePanel;
    suiImagePanel4: TsuiImagePanel;
    suiGroupBox1: TsuiGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    suiGroupBox2: TsuiGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    txtOutPackageNum: TDBEdit;
    DBEdit13: TDBEdit;
    txtLengthNum: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    txtWidthNum: TDBEdit;
    txtHeightNum: TDBEdit;
    PageControlPic: TsuiPageControl;
    TabSheetPicBrow: TsuiTabSheet;
    IL_ProductPic: TImageList;
    suiGroupBox3: TsuiGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    Label31: TLabel;
    DBEdit10: TDBEdit;
    suiButton1: TsuiButton;
    suiButton2: TsuiButton;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    txtProductType: TDBLookupComboboxEh;
    OpenPictureDialog1: TOpenPictureDialog;
    ADOQuery1: TADOQuery;
    TabSheetPicEdit: TsuiTabSheet;
    Lv_ProductPic: TListView;
    suiImagePanel3: TsuiImagePanel;
    btnAddPic: TsuiButton;
    btnDelPic: TsuiButton;
    btnBrowPic: TsuiButton;
    imageBrow: TImage;
    menu_listPIC: TsuiPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    menu_BrowPIC: TsuiPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    txtOutPackageUnit: TEdit;
    PopupMenu1: TsuiPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    DBNumberEditEh4: TDBNumberEditEh;
    DBNumberEditEh5: TDBNumberEditEh;
    DBNumberEditEh6: TDBNumberEditEh;
    procedure btnSelectClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBrowerClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddPicClick(Sender: TObject);
    procedure suiButton1Click(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryBeforeEdit(DataSet: TDataSet);
    procedure btnDelPicClick(Sender: TObject);
    procedure btnBrowPicClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure txtOutPackageNumExit(Sender: TObject);
    procedure txtLengthNumExit(Sender: TObject);
    procedure txtWidthNumExit(Sender: TObject);
    procedure txtHeightNumExit(Sender: TObject);
    procedure Lv_ProductPicDblClick(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
  private
        procedure CountStereNum();
  public
        procedure Query_ini(id:string);
        procedure Query_Image(id:string);
  end;

var
  ProductInfo_frm: TProductInfo_frm;

implementation

uses DataModule, BasePage, ProductInfoSel, ImageBrower,
  DictInfo;

{$R *.dfm}

procedure TProductInfo_frm.Query_ini(id:string);
var
    sqlstr, whsql, filepath:string;
begin
  try
    if id <>'' then
    begin
        whsql :=' where ProductID='''+ id + '''';
        Query_Image(id);
    end;
     sqlstr :='select * from ProductInfo ' + whsql;
     Get_Query(Query, sqlstr);
     if (Query.Active ) then
     begin
       if Query.FieldByName('DefaultImage').AsString <>'' then
       begin
         filepath :=SystemFilePath + 'Image\Product\' + Query.FieldByName('DefaultImage').AsString;
         imageBrow.Picture.LoadFromFile(filepath); 
       end;
     end;
     {MemTab_list.Close;
     sqlstr :='select * from ShipInfoPrice where ShipID=''' + id + '''';
     Get_Query(Query_list, sqlstr);
     MemTab_list.Open;}
  except
  end;
end;

procedure TProductInfo_frm.Query_Image(id:string);
var
    sqlstr, whsql, filepath:string;
    i:integer;
    Item:TListItem;
    jpg :TJpegImage;
    bitmap:TBitmap;
begin
  try
    if id <>'' then
    begin
      whsql :=' where ProductID=''' +ID+ '''';
      sqlstr :='select * from ProductInfoImage ' + whsql + ' order by ProductID';
      Get_Query(ADOQuery1, sqlstr);
      Lv_ProductPic.Items.Clear;
      IL_ProductPic.Clear;
      for i:=0 to ADOQuery1.RecordCount -1 do
      begin
         filepath :=SystemFilePath + 'Image\Product\' + ADOQuery1.fieldbyname('ImageName').AsString;
         if fileexists(filepath) then
         begin
           bitmap :=TBitmap.Create;
           if IsJpgFile(filepath) =true then
           begin
              jpg :=TJpegImage.Create;
              jpg.Smoothing :=true;
              JpgToBmp(filepath, jpg, bitmap) ;
           
              jpg.Free;
           end
           else
           begin
              bitmap.LoadFromFile(filepath);
           end;
           IL_ProductPic.Insert(i, bitmap, bitmap);
           bitmap.Free;

           Item :=Lv_ProductPic.Items.Add;
           item.Caption :=ADOQuery1.fieldbyname('ImageName').AsString;
           item.ImageIndex :=i;
         end;
         ADOQuery1.Next;
      end;
    end;
  except
  end;
end;

procedure TProductInfo_frm.btnSelectClick(Sender: TObject);
begin
  inherited;
//
   Application.CreateForm(TProductInfoSel_frm, ProductInfoSel_frm) ;
   ProductInfoSel_frm.ShowModal;
   ProductInfoSel_frm.Free;

end;

procedure TProductInfo_frm.btnAddClick(Sender: TObject);
begin
  inherited;
//
  Query.Append;
  Query.FieldByName('ProductID').AsString :=Get_MaxTabID('ProductInfo', 5);
  Set_MaxTabID('ProductInfo');
  btnsave.Enabled :=true;
  DBEdit2.SetFocus;
end;

procedure TProductInfo_frm.btnDeleteClick(Sender: TObject);
begin
  inherited;
// 删除
  Query.Delete;
end;

procedure TProductInfo_frm.btnSaveClick(Sender: TObject);
begin
  inherited;
//保存
  if Query.State in[dsinsert] then
  begin
    try
     Query.Post;
     btnsave.Enabled :=false;
     if application.MessageBox('保存成功, 是否续继增加','提示信息',mb_yesno+mb_iconinformation)=IDYES then
     begin
        btnAdd.Click;
     end;
    except
       on ex :exception do showmessage(ex.Message);
    end;
  end
  else if Query.State=dsedit then
  begin
    try
       Query.Post;
       btnsave.Enabled :=false;
    except
       on ex :exception do showmessage(ex.Message);
    end;
  end;
end;

procedure TProductInfo_frm.btnBrowerClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TProductInfo_frm.btnCloseClick(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TProductInfo_frm.btnAddPicClick(Sender: TObject);
var sqlstr, filepath, filename, id:string;
begin
  inherited;
//brower picture
  if OpenPictureDialog1.Execute then
  begin
     if application.MessageBox('确定要增加此图片吗','提示信息',mb_yesno+mb_iconinformation)=IDYES then
     begin
       try
         if Query.Active =false then exit;
         id :=Query.fieldbyname('ProductID').AsString ;
         if IsJpgFile(OpenPictureDialog1.FileName) then
           filename :=formatdatetime('yyMMddhhmmss', now) + '.jpg'
         else
           filename :=formatdatetime('yyMMddhhmmss', now) + '.bmp' ;

         filepath :=SystemFilePath + 'Image\Product\' + filename;
        
         sqlstr :='insert into ProductInfoImage(ProductID, ImageName) values(''' + id + ''', ''' + filename +''')' ;
         if DOsql(sqlstr) >0 then
         begin
           CopyFile(pchar(OpenPictureDialog1.FileName),pchar(filepath),true);
           Query_Image(id);
         end;
       except
         showmessage('图片增加失败');
       end;
     end;
  end;
end;

procedure TProductInfo_frm.suiButton1Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TProductInfo_frm.suiButton2Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TProductInfo_frm.FormShow(Sender: TObject);
var id:string;
begin
  inherited;
  Query_ini('');
  if Query.Active then
  begin
    id :=Query.fieldbyname('ProductID').AsString;
    Query_Image(id);
  end;
end;

procedure TProductInfo_frm.QueryBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  btnSave.Enabled :=true;

end;

procedure TProductInfo_frm.btnDelPicClick(Sender: TObject);
var i:integer;
    sqlstr, filename, filepath,id:string;
begin
  inherited;
//
  for i:=0 to Lv_ProductPic.Items.Count -1 do
  begin
    if Lv_ProductPic.Items[i].Selected then
    begin
      if application.MessageBox('确定要删除此图片吗','提示信息',mb_yesno+mb_iconinformation)=IDYES then
      begin
        try
          if Query.Active =false then exit;
            id :=Query.fieldbyname('ProductID').AsString ;
          filename :=Lv_ProductPic.Items[i].Caption ;
          filepath :=SystemFilePath + 'Image\Product\' + filename;
        
          sqlstr :='delete from ProductInfoImage where ProductID=''' +id+''' and ImageName=''' + filename +'''' ;
          if DOsql(sqlstr) >0 then
          begin
            DeleteFile(filepath);
            Query_Image(id);
          end;
        except
        end;
      end;
      break;
    end;
  end;
end;

procedure TProductInfo_frm.btnBrowPicClick(Sender: TObject);
var i:integer;
begin
  inherited;
//
  for i:=0 to Lv_ProductPic.Items.Count -1 do
  begin
    if Lv_ProductPic.Items[i].Selected then
    begin
        application.CreateForm(TImageBrower_frm, ImageBrower_frm);
        ImageBrower_frm.ImagePath :=SystemFilePath + 'Image\Product\';
        ImageBrower_frm.ImageFileName :=Lv_ProductPic.Items[i].Caption;
        ImageBrower_frm.ShowModal;
        ImageBrower_frm.Free;

    end; 
  end;
end;

procedure TProductInfo_frm.N5Click(Sender: TObject);
var i:integer;
    sqlstr, filename,filepath, id:string;
begin
  inherited;
//
  for i:=0 to Lv_ProductPic.Items.Count -1 do
  begin
    if Lv_ProductPic.Items[i].Selected then
    begin
        if Query.Active =false then exit;
          id :=Query.fieldbyname('ProductID').AsString ;
        filename :=Lv_ProductPic.Items[i].Caption ;
        sqlstr :='update ProductInfo set DefaultImage=''' + filename + ''' where ProductID=''' +id+'''' ;
        if DOsql(sqlstr) >0 then
        begin
           sqlstr :='update ProductInfoImage set DefaultFlag=''1'' where ProductID=''' +id+''' and ImageName = ''' + filename +'''' ;
           DOsql(sqlstr);
           sqlstr :='update ProductInfoImage set DefaultFlag=''1'' where ProductID=''' +id+''' and ImageName <> ''' + filename +'''' ;
           DOsql(sqlstr);
           PageControlPic.ActivePageIndex :=0;
           if filename <>'' then
           begin
                filepath :=SystemFilePath + 'Image\Product\' + filename;
                imageBrow.Picture.LoadFromFile(filepath);
           end;
        end;
        break;
    end;
  end;
end;

procedure TProductInfo_frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//
  if Query.State in [dsEdit, dsinsert] then
  begin
     if application.MessageBox(pchar('是否保存当前数据'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
       Query.Post;

  end;

end;

procedure TProductInfo_frm.N6Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TProductInfo_frm.N7Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TProductInfo_frm.DBLookupComboboxEh1Change(Sender: TObject);
begin
  inherited;
//
  //txtOutPackageUnit.Text :=DataModule_frm.Query_PackageUnit.fieldbyname('DIctName').AsString;
end;

procedure TProductInfo_frm.CountStereNum();
var num:real;
    lengthnum, widthnum, heightnum:real;
begin
  inherited;
  //if (Query.FieldByName('LengthNum').AsFloat>0) and (Query.FieldByName('WidthNum').AsFloat>0) and (Query.FieldByName('HeightNum').AsFloat>0) then
  try
     lengthnum :=strtofloat(txtLengthNum.Text) ;
     widthnum :=strtofloat(txtWidthNum.Text) ;
     heightnum :=strtofloat(txtHeightNum.Text) ;
     if (lengthnum>0) and (widthnum>0) and (heightnum>0) then
     begin
        num :=lengthnum *  widthnum * heightnum;
        num :=num * 0.01 * 0.01 * 0.01;
        Query.FieldByName('StereNum').AsFloat:=num;
        Query.FieldByName('Capacity20').AsFloat :=28 * Query.FieldByName('OutPackageNum').AsInteger / num;
        Query.FieldByName('Capacity40').AsFloat :=58 * Query.FieldByName('OutPackageNum').AsInteger / num;
        Query.FieldByName('Capacity40HQ').AsFloat :=65 * Query.FieldByName('OutPackageNum').AsInteger / num;
     end;
  except
  end;
end;

procedure TProductInfo_frm.txtOutPackageNumExit(Sender: TObject);
begin
  inherited;
//
CountStereNum();
end;

procedure TProductInfo_frm.txtLengthNumExit(Sender: TObject);
begin
  inherited;
CountStereNum();
end;

procedure TProductInfo_frm.txtWidthNumExit(Sender: TObject);
begin
  inherited;
CountStereNum();
end;

procedure TProductInfo_frm.txtHeightNumExit(Sender: TObject);
begin
  inherited;
  CountStereNum();
end;

procedure TProductInfo_frm.Lv_ProductPicDblClick(Sender: TObject);
begin
  inherited;
  btnBrowPic.Click;
end;

procedure TProductInfo_frm.Label21Click(Sender: TObject);
begin
  inherited;
//
  application.CreateForm(TDictInfo_frm, DictInfo_frm);
  DictInfo_frm.ShowModal;
  DictInfo_frm.Free;
end;

procedure TProductInfo_frm.Label18Click(Sender: TObject);
begin
  inherited;
//
  application.CreateForm(TDictInfo_frm, DictInfo_frm);
  DictInfo_frm.ShowModal;
  DictInfo_frm.Free;

end;

procedure TProductInfo_frm.Label3Click(Sender: TObject);
begin
  inherited;
//
  application.CreateForm(TDictInfo_frm, DictInfo_frm);
  DictInfo_frm.ShowModal;
  DictInfo_frm.Free;
end;

procedure TProductInfo_frm.Label13Click(Sender: TObject);
begin
  inherited;
//
  application.CreateForm(TDictInfo_frm, DictInfo_frm);
  DictInfo_frm.ShowModal;
  DictInfo_frm.Free;
end;

procedure TProductInfo_frm.Label14Click(Sender: TObject);
begin
  inherited;
//
  application.CreateForm(TDictInfo_frm, DictInfo_frm);
  DictInfo_frm.ShowModal;
  DictInfo_frm.Free;
end;

end.
