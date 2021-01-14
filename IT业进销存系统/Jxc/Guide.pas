unit Guide;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, ImgList, menus;

type
  TfrmGuide = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    labTitle: TLabel;
    Image1: TImage;
    PageScroller1: TPageScroller;
    Panel1: TPanel;
    Shape1: TShape;
    imgActive: TImage;
    Label1: TLabel;
    pnlTop: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ListView1: TListView;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGuide: TfrmGuide;

implementation

uses Main, Dm;

{$R *.DFM}

//Form.Show
procedure TfrmGuide.FormShow(Sender: TObject);
var
  i, intIndex: integer;
  strFileName: string;
  icoTmp: TIcon;
  c: TComponent;
  ListItem: TListItem;
  CShape: TShape;
  CLabel: TLabel;
  CTabSheet: TTabSheet;
  CListView: TListView;
begin
  self.Top := 0;
  self.Left := 0;
  self.Width := frmMain.ClientWidth - 4;
  self.Height := frmMain.ClientHeight - frmMain.StatusBar1.Height - 4;
  self.labTitle.Caption := Application.Title;
  self.labTitle.Width := Panel3.Width;
  self.PageControl1.TabHeight := 1;
  self.pnlTop.Top := 0;
  self.pnlTop.Left := 0;
  self.pnlTop.Width := self.Width + 4;
  icoTmp := TIcon.Create;
  //InCommonUse
  with Data.Tmpl do
  begin
    Close;
    if pDataBaseType = 'SERVER' then
      CommandText := 'select top 10 m.*, c.UseCount, i.mIcon ' +
        'from AppMenu as m inner join AppInCommonUse as c on m.mName = c.mName ' +
        'left outer join AppMenuIcon as i on c.mName = i.mName ' +
        'where c.uID = ' + IntToStr(pintUserId) +
        'order by c.UseCount desc'
    else
      CommandText := 'select top 15 m.*, i.mIcon ' +
        'from AppMenu as m, AppInCommonUse as c, AppMenuIcon as i, ' +
        'm inner join c on m.mName = c.mName, ' +
        'c left join i on c.mName = i.mName ' +
        'where c.uID = ' + IntToStr(pintUserId) + ' ' +
        'order by c.UseCount desc';
    Open;
    while not Eof do
    begin
      c := frmMain.FindComponent(FieldByName('mName').AsString);
      if (c <> nil) and (c is TMenuItem) and TMenuItem(c).Visible then
      begin
        //Add ImageList
        strFileName := ExtractFilePath(Application.ExeName) + 'ICON\' +
          FieldByName('mIcon').AsString;
        if FileExists(strFileName) then
        begin
          icoTmp.LoadFromFile(strFileName);
          intIndex := self.ImageList1.AddIcon(icoTmp);
        end
        else
          intIndex := 0;
        //Add ListItem
        ListItem := ListView1.Items.Add;
        ListItem.Caption := FieldByName('mCaption').AsString;
        ListItem.SubItems.Text := FieldByName('mName').AsString;
        ListItem.ImageIndex := intIndex;
      end;
      Next;
    end;
    if ListView1.Items.Count >= 1 then
    begin
      ListView1.Selected := ListView1.Items[0];
      ListView1.SetFocus;
    end;
  end;
  //set Item
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select * from AppGroupDesktopClass ' +
      'where gName = ''' + pstrUserGroup + '''';
    Open;
    for i := 1 to RecordCount do
    begin
      CShape := TShape.Create(self);
      with CShape do
      begin
        Parent := self.Panel1;
        Tag := i + 1;
        Top := self.Shape1.Top + i * (self.Shape1.Height + 5);
        Left := self.Shape1.Left;
        Width := self.Shape1.Width;
        Height := self.Shape1.Height;
        Shape := stRoundRect;
        Brush.Color := $00EFEFEF;
        Pen.Style := psClear;
        Pen.Color := self.Shape1.Pen.Color;
        Pen.Width := self.Shape1.Pen.Width;
      end;
      CLabel := TLabel.Create(self);
      with CLabel do
      begin
        Parent := self.Panel1;
        Tag := i + 1;
        AutoSize := false;
        Top := self.Label1.Top + i * (self.Label1.Height + 5);
        Left := self.Label1.Left;
        Width := self.Label1.Width;
        Height := self.Label1.Height;
        Caption := '&' + IntToStr(Tag) + ' ' + FieldByName('cName').AsString;
        Font := self.Label1.Font;
        Font.Color := clTeal;
        Cursor := self.Label1.Cursor;
        Layout := tlCenter;
        Transparent := true;
        OnClick := LabelClick;
      end;
      CTabSheet := TTabSheet.Create(self);
      with CTabSheet do
      begin
        Parent := self.PageControl1;
        PageControl := self.PageControl1;
        Caption := FieldByName('cName').AsString;
      end;
      CListView := TListView.Create(self);
      with CListView do
      begin
        Parent := CTabSheet;
        CListView.Align := alClient;
        ReadOnly := true;
        LargeImages := self.ListView1.LargeImages;
        BorderStyle := self.ListView1.BorderStyle;
        OnDblClick := ListViewDblClick;
        OnKeyDown := ListViewKeyDown;
        dm.Data.Tmpf.Close;
        if pDataBaseType = 'SERVER' then
          dm.Data.Tmpf.CommandText := 'select a.*, m.mCaption, i.mIcon ' +
            'from AppGroupDesktop as a left join AppMenu as m on a.mName = m.mName ' +
            'left join AppMenuIcon as i on a.mName = i.mName ' +
            'where gName="' + pstrUserGroup + '" and ' +
            'cName = ''' + dm.Data.Tmpl.FieldByName('cName').AsString + ''''
        else
          dm.Data.Tmpf.CommandText := 'select a.*, m.mCaption, i.mIcon ' +
            'from AppGroupDesktop as a, AppMenu as m, AppMenuIcon as i, ' +
            'a left join m on a.mName = m.mName,' +
            'a left join i on a.mName = i.mName ' +
            'where a.gName = ''' + pstrUserGroup + ''' and ' +
            'a.cName = ''' + dm.Data.Tmpl.FieldByName('cName').AsString + '''' +
            'order by m.mIndex';
        dm.Data.Tmpf.Open;
        while not dm.Data.Tmpf.Eof do
        begin
          c := frmMain.FindComponent(dm.Data.Tmpf.FieldByName('mName').AsString);
          if (c <> nil) and (c is TMenuItem) and TMenuItem(c).Visible then
          begin
            //Add ImageList
            strFileName := ExtractFilePath(Application.ExeName) + 'ICON\' +
              dm.Data.Tmpf.FieldByName('mIcon').AsString;
            if FileExists(strFileName) then
            begin
              icoTmp.LoadFromFile(strFileName);
              intIndex := self.ImageList1.AddIcon(icoTmp);
            end
            else
              intIndex := 0;
            //Add ListItem
            ListItem := CListView.Items.Add;
            ListItem.Caption := dm.Data.Tmpf.FieldByName('mCaption').AsString;
            ListItem.SubItems.Text := dm.Data.Tmpf.FieldByName('mName').AsString;
            ListItem.ImageIndex := intIndex;
          end;
          dm.Data.Tmpf.Next;
        end;
        if Items.Count >= 1 then
          Selected := Items[0];
        Update;
      end;
      if (CShape.Top + CShape.Height) > self.panel1.Height then
        self.panel1.Height := CShape.Top + CShape.Height;
      Next;
    end;
  end;
end;

//Form.Activate
procedure TfrmGuide.FormActivate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to frmMain.tlbAForm.ButtonCount - 1 do
    frmMain.tlbAForm.Buttons[i].ImageIndex := 0
end;

//Form.KeyDown
procedure TfrmGuide.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  if (Shift = [ssAlt]) and (Char(Key) in ['0'..'9']) then
    for i := 0 to self.ComponentCount - 1 do
      if (self.Components[i] is TLabel) and (IntToStr(TLabel(self.Components[i]).Tag) = Char(Key)) then
      begin
        LabelClick(self.Components[i]);
        abort;
      end;
end;

//Form.Close
procedure TfrmGuide.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//LabelClick
procedure TfrmGuide.LabelClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to self.ComponentCount - 1 do
  begin
    if (self.Components[i] is TShape) then
      if TShape(self.Components[i]).Tag = TLabel(Sender).Tag then
      begin
        TShape(self.Components[i]).Pen.Style := psSolid;
        TShape(self.Components[i]).Brush.Color := $00F7FFFF;
      end
      else
      begin
        TShape(self.Components[i]).Pen.Style := psClear;
        TShape(self.Components[i]).Brush.Color := $00EFEFEF;
      end;
    if (self.Components[i] is TLabel) then
      if TLabel(self.Components[i]).Font.Color = clMaroon then
        TLabel(self.Components[i]).Font.Color := clTeal;
  end;
  TLabel(Sender).Font.Color := clMaroon;
  self.imgActive.Top := TLabel(Sender).Top + 6;
  self.imgActive.BringToFront;
  self.PageControl1.ActivePageIndex := TLabel(Sender).Tag - 1;
end;

//ListViewDblClick
procedure TfrmGuide.ListViewDblClick(Sender: TObject);
var
  c: TComponent;
begin
  if (Sender is TListView) and (TListView(Sender).Selected <> nil) then
  begin
    c := frmMain.FindComponent(Copy(TListView(Sender).Selected.SubItems.Text, 1, Length(TListView(Sender).Selected.SubItems.Text) - 2) );
    if (c <> nil) and (c is TMenuItem) and TMenuItem(c).Visible then
      TMenuItem(c).Click;
  end;
end;

//ListView.KeyDown
procedure TfrmGuide.ListViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Sender is TListView) and (Key = VK_RETURN) then
    ListViewDblClick(Sender);
end;

end.
