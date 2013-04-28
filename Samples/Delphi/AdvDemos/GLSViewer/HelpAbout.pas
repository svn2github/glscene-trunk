unit HelpAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentDialog, StdCtrls, ExtCtrls, jpeg, ShellAPI,

  FGLDialog;

type
  TfrmHelpAbout = class(TGLDialog)
    LabelCopyright: TLabel;
    PanelYears: TPanel;
    imgOpenGL: TImage;
    imgSourceForge: TImage;
    imgGLScene: TImage;
    LabelVersion: TLabel;
    StaticTextVersion: TStaticText;
    LabelGeoblock: TLabel;
    Label1: TLabel;
    FreeAndOpenSource: TLabel;
    BuiltWithDelphi: TLabel;
    procedure imgSourceForgeDblClick(Sender: TObject);
    procedure imgGLSceneDblClick(Sender: TObject);
    procedure imgOpenGLDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BuiltWithDelphiDblClick(Sender: TObject);
  public
    { Public declarations }
  private
    { Private declarations }
    function GetFileInfo(const FileName: TFileName): TVSFixedFileInfo;
    function ReadVersionInfo(FileName: TFileName): TFileName;
  end;

var
  frmHelpAbout: TfrmHelpAbout;

implementation

{$R *.dfm}

procedure GotoURL(Handle: integer; const URL: string);
var
  S: array[0..255] of char;
begin
  ShellExecute(Handle, 'Open', StrPCopy(S, URL), nil, nil, SW_SHOW);
end;


procedure TfrmHelpAbout.BuiltWithDelphiDblClick(Sender: TObject);
begin
  inherited;
  GotoURL(Handle, 'http://www.codegear.com');
end;

procedure TfrmHelpAbout.FormCreate(Sender: TObject);
begin
  inherited;
  StaticTextVersion.Caption := ReadVersionInfo(Application.ExeName);
end;

function TfrmHelpAbout.GetFileInfo(const FileName: TFileName): TVSFixedFileInfo;
var
  Handle, VersionSize: DWord;
  SubBlock: string;
  Temp:     Pointer;
  Data:     Pointer;
begin
  SubBlock    := '\';
  VersionSize := GetFileVersionInfoSize(PChar(FileName), Handle);
  if VersionSize > 0 then
  begin
    GetMem(Temp, VersionSize);
    try
      if GetFileVersionInfo(PChar(FileName), Handle, VersionSize, Temp) then
        if VerQueryValue(Temp, PChar(SubBlock), Data, VersionSize) then
          Result := PVSFixedFileInfo(Data)^;
    finally
      FreeMem(Temp);
    end;
  end;
end;

procedure TfrmHelpAbout.imgGLSceneDblClick(Sender: TObject);
begin
  GotoURL(Handle, 'http://www.glscene.org/');
end;

procedure TfrmHelpAbout.imgOpenGLDblClick(Sender: TObject);
begin
  GotoURL(Handle, 'http://www.opengl.org/');
end;

procedure TfrmHelpAbout.imgSourceForgeDblClick(Sender: TObject);
begin
  GotoURL(Handle, 'http://www.sourceforge.net/projects/glscene/');
end;

function TfrmHelpAbout.ReadVersionInfo(FileName: TFileName): TFileName;
type
  TGetWords = record
    case boolean of
      True: (C: cardinal);
      False: (Lo, Hi: word);
  end;
var
  VerSize, Wnd: cardinal;
  Buf, Value: Pointer;
  MS, LS: TGetWords;
begin
  VerSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if VerSize > 0 then
  begin
    GetMem(Buf, VerSize);
    GetFileVersionInfo(PChar(Application.ExeName), 0, VerSize, Buf);

    VerQueryValue(Buf, '\', Value, VerSize);
    with TVSFixedFileInfo(Value^) do
    begin
      MS.C   := dwFileVersionMS;
      LS.C   := dwFileVersionLS;
      Result := Format('%d.%d.%d  Build %d', [MS.Hi, MS.Lo, LS.Hi, LS.Lo]);
    end;
    FreeMem(Buf);
  end
  else
    Result := 'Unknown'; // or LoadResString(@sUnknown);
end;

end.
