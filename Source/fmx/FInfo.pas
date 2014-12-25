unit FInfo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.TabControl, FMX.Layouts, FMX.ListBox, FMX.Memo,
  //GLX
  GLS.GLScene, GLS.OpenGLTokens, GLS.Context;

type
  TInfoForm = class(TForm)
    TabControl: TTabControl;
    TabItemGLScene: TTabItem;
    TabItemInformation: TTabItem;
    TabItemExtensions: TTabItem;
    TabItemContributors: TTabItem;
    TabItemAbout: TTabItem;
    ButtonClose: TButton;
    ImageControl1: TImageControl;
    ScrollBoxInfo: TScrollBox;
    LabelCommon: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CopyLabel: TLabel;
    AccLabel: TLabel;
    StereoLabel: TLabel;
    DoubleLabel: TLabel;
    VersionLabel: TLabel;
    RendererLabel: TLabel;
    VendorLabel: TLabel;
    LabelDepths: TLabel;
    Label9: TLabel;
    ColorLabel: TLabel;
    Label11: TLabel;
    DepthLabel: TLabel;
    Label13: TLabel;
    StencilLabel: TLabel;
    Label15: TLabel;
    AccumLabel: TLabel;
    Label17: TLabel;
    AuxLabel: TLabel;
    Label19: TLabel;
    SubLabel: TLabel;
    Label21: TLabel;
    OverlayLabel: TLabel;
    ListBoxExtensions: TListBox;
    Label23: TLabel;
    UnderlayLabel: TLabel;
    LabelMaxValues: TLabel;
    Label8: TLabel;
    ViewLabel: TLabel;
    Label26: TLabel;
    ModelLabel: TLabel;
    Label28: TLabel;
    ListLabel: TLabel;
    LightLabel: TLabel;
    Label31: TLabel;
    EvalLabel: TLabel;
    Label33: TLabel;
    ClipLabel: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    NameLabel: TLabel;
    Label39: TLabel;
    PixelLabel: TLabel;
    ProjLabel: TLabel;
    TexSizeLabel: TLabel;
    Label43: TLabel;
    TexStackLabel: TLabel;
    Label45: TLabel;
    TexUnitsLabel: TLabel;
    Label47: TLabel;
    MemoContributors: TMemo;
    MemoAbout: TMemo;
    LabelOfficial: TLabel;
    WebSiteLbl: TLabel;
    LabelDevelopment: TLabel;
    DevSiteLbl: TLabel;
    Label10: TLabel;
    VersionLbl: TLabel;
    procedure ButtonCloseClick(Sender: TObject);
    procedure WebSiteLblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBoxExtensionsDblClick(Sender: TObject);
  private
    { Private declarations }

  protected
    { Protected declarations }
    procedure LoadContributors;
    function GetSceneVersion: string;
  public
    { Public declarations }
    procedure GetInfoFrom(aSceneBuffer: TGLSceneBuffer);
  end;

var
  InfoForm: TInfoForm;

implementation

{$R *.fmx}

// ShowInfoForm
//
procedure ShowInfoForm(aSceneBuffer: TGLSceneBuffer; Modal: boolean);
var
  infoForm: TInfoForm;
begin
  infoForm := TInfoForm.Create(nil);
  try
    infoForm.GetInfoFrom(aSceneBuffer);
    with infoForm do
      if Modal then
        ShowModal
      else
        Show;
  except
    infoForm.Free;
    raise;
  end;
end;

// FormCreate
//
procedure TInfoForm.FormCreate(Sender: TObject);
begin
  TabControl.ActiveTab := TabItemGLScene;
end;

// FormShow
//
procedure TInfoForm.FormShow(Sender: TObject);
begin
  TabControl.ActiveTab := TabItemGLScene;
end;

// GetInfoFrom
//
procedure TInfoForm.GetInfoFrom(aSceneBuffer: TGLSceneBuffer);
  { TODO -cIncompatibility : Need to replace TPixelFormatDescriptor and HDC }
///const
  ///DRIVER_MASK = PFD_GENERIC_FORMAT or PFD_GENERIC_ACCELERATED;
var
  ///pfd: TPixelFormatDescriptor;
  pixelFormat: Integer;
  ///dc: HDC;   /// HDC - in Winapi.Windows should be replaced with...
  i: Integer;
  ExtStr: String;

  procedure IntLimitToLabel(const aLabel: TLabel; const aLimit: TLimitType);
  begin
    aLabel.Text := IntToStr(aSceneBuffer.LimitOf[aLimit]);
  end;

begin
  Caption := Caption + ' (current context in ' +
    (aSceneBuffer.Owner as TComponent).Name + ')';
  aSceneBuffer.RenderingContext.Activate;
  try
    with aSceneBuffer do
    begin
      // common properties
      VendorLabel.Text := String(GL.GetString(GL_VENDOR));
      RendererLabel.Text := String(GL.GetString(GL_RENDERER));
(*
      dc := wglGetCurrentDC();
      pixelFormat := GetPixelFormat(dc);
      DescribePixelFormat(dc, pixelFormat, SizeOf(pfd), pfd);
      // figure out the driver type
      if (DRIVER_MASK and pfd.dwFlags) = 0 then
        AccLabel.Text := 'Installable Client Driver'
      else if (DRIVER_MASK and pfd.dwFlags) = DRIVER_MASK then
        AccLabel.Text := 'Mini-Client Driver'
      else if (DRIVER_MASK and pfd.dwFlags) = PFD_GENERIC_FORMAT then
        AccLabel.Text := 'Generic Software Driver';
*)
      VersionLabel.Text := String(GL.GetString(GL_VERSION));
      ExtStr := String(GL.GetString(GL_EXTENSIONS));
      ListBoxExtensions.Clear;
      while Length(ExtStr) > 0 do
      begin
        i := Pos(' ', ExtStr);
        if i = 0 then
          i := 255;
        ListBoxExtensions.Items.Add(Copy(ExtStr, 1, i - 1));
        Delete(ExtStr, 1, i);
      end;

      if LimitOf[limDoubleBuffer] = GL_TRUE then
        DoubleLabel.Text := 'yes'
      else
        DoubleLabel.Text := 'no';

      if LimitOf[limStereo] = GL_TRUE then
        StereoLabel.Text := 'yes'
      else
        StereoLabel.Text := 'no';

      // Include WGL extensions
(*
      if GL.W_ARB_extensions_string then
      begin
        ExtStr := String(GL.WGetExtensionsStringARB(dc));
        while Length(ExtStr) > 0 do
        begin
          i := Pos(' ', ExtStr);
          if i = 0 then
            i := 255;
          ListBoxExtensions.Items.Add(Copy(ExtStr, 1, i - 1));
          Delete(ExtStr, 1, i);
        end;
      end;

      // Some extra info about the double buffer mode
      if (pfd.dwFlags and PFD_DOUBLEBUFFER) = PFD_DOUBLEBUFFER then
      begin
        CopyLabel.Text := '';
        if (pfd.dwFlags and PFD_SWAP_EXCHANGE) > 0 then
          CopyLabel.Text := 'exchange';
        if (pfd.dwFlags and PFD_SWAP_COPY) > 0 then
        begin
          if Length(CopyLabel.Text) > 0 then
            CopyLabel.Text := CopyLabel.Text + ', ';
          CopyLabel.Text := CopyLabel.Text + 'copy';
        end;
        if Length(CopyLabel.Text) = 0 then
          CopyLabel.Text := 'no info available';
      end
      else
      begin
        CopyLabel.Text := 'n/a';
      end;
      // buffer and pixel depths
      ColorLabel.Text :=
        Format('red: %d,  green: %d,  blue: %d,  alpha: %d  bits',
        [LimitOf[limRedBits], LimitOf[limGreenBits], LimitOf[limBlueBits],
        LimitOf[limAlphaBits]]);
      DepthLabel.Text := Format('%d bits', [LimitOf[limDepthBits]]);
      StencilLabel.Text := Format('%d bits', [LimitOf[limStencilBits]]);
      AccumLabel.Text :=
        Format('red: %d,  green: %d,  blue: %d,  alpha: %d  bits',
        [LimitOf[limAccumRedBits], LimitOf[limAccumGreenBits],
        LimitOf[limAccumBlueBits], LimitOf[limAccumAlphaBits]]);
      IntLimitToLabel(AuxLabel, limAuxBuffers);
      IntLimitToLabel(SubLabel, limSubpixelBits);
      OverlayLabel.Text := IntToStr(pfd.bReserved and 7);
      UnderlayLabel.Text := IntToStr(pfd.bReserved shr 3);
*)
      // Maximum values
      IntLimitToLabel(ClipLabel, limClipPlanes);
      IntLimitToLabel(EvalLabel, limEvalOrder);
      IntLimitToLabel(LightLabel, limLights);
      IntLimitToLabel(ListLabel, limListNesting);
      IntLimitToLabel(ModelLabel, limModelViewStack);
      IntLimitToLabel(ViewLabel, limViewportDims);

      IntLimitToLabel(NameLabel, limNameStack);
      IntLimitToLabel(PixelLabel, limPixelMapTable);
      IntLimitToLabel(ProjLabel, limProjectionStack);
      IntLimitToLabel(TexSizeLabel, limTextureSize);
      IntLimitToLabel(TexStackLabel, limTextureStack);
      IntLimitToLabel(TexUnitsLabel, limNbTextureUnits);
    end;
    VersionLbl.Text := GetSceneVersion;
  finally
    aSceneBuffer.RenderingContext.Deactivate;
  end;
end;

// CloseButtonClick
//
procedure TInfoForm.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

// FormKeyDown
//
procedure TInfoForm.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 /// if Key = #27 then
    Close;
end;

// FormClose
//
procedure TInfoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Release;
end;

// -------------------------------------------------------------------
//
procedure TInfoForm.ListBoxExtensionsDblClick(Sender: TObject);
var
  p: Integer;
  url, buf: String;
begin
  with ListBoxExtensions do
  begin
    if ItemIndex < 0 then
      Exit;
    url := Items[ItemIndex];
  end;
  p := Pos('_', url);
  buf := Copy(url, 1, p - 1);
  url := Copy(url, p + 1, 255);
  if (buf <> 'GL') and (buf <> 'WGL') and (buf <> 'GLX') then
    Exit;
  p := Pos('_', url);
  buf := Copy(url, 1, p - 1);
  url := 'http://www.opengl.org/registry/specs/' + buf + '/' +
    Copy(url, p + 1, 255) + '.txt';
  { TODO -cIncompatibility : Find substitution to ShellExecute(0, 'open', PChar(Url), nil, nil, SW_SHOW); }
  ///ShowHTMLUrl(url);
end;

// -------------------------------------------------------------------
//
procedure TInfoForm.LoadContributors;
// var
// ContributorsFileName: string;
begin
  // In the future, will be loaded from a file

  { ContributorsFileName:=
    // 'GLSceneContributors.txt';

    if FileExistsUTF8(ContributorsFileName) then
    MemoContributors.Lines.LoadFromFile(UTF8ToSys(ContributorsFileName))
    else
    MemoContributors.Lines.Text:='Cannot find contributors list.';
    MemoContributors.Lines.Add( ContributorsFileName) }
end;

// -------------------------------------------------------------------
//
function TInfoForm.GetSceneVersion: string;
var
  FExePath, FGLSceneRevision: string;
begin
  FGLSceneRevision := Copy(GLSCENE_REVISION, 12, 4);
  FExePath := ExtractFilePath(ParamStr(0));
  if FileExists(FExePath + 'GLSceneRevision') then
  try
    with TStringList.Create do
    try
      LoadFromFile(FExePath + 'GLSceneRevision');
      if (Count >= 1) and (trim(Strings[0]) <> '') then
        FGLSceneRevision:= trim(Strings[0]);
    finally
      Free;
    end;
  except
  end;

  Result := Format(GLSCENE_VERSION, [FGLSceneRevision]);
end;


// -------------------------------------------------------------------
//
procedure TInfoForm.WebSiteLblClick(Sender: TObject);
begin
///  ShellExecute(0, 'open', PChar(Url), nil, nil, SW_SHOW);
///  ShowHTMLUrl(WebSiteLbl.Text);
end;

initialization

// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

RegisterInfoForm(ShowInfoForm);


end.
