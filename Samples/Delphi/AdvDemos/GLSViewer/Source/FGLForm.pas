//------------------------------------------------------------------------------
// This unit is part of the GLSceneViewer, http://sourceforge.net/projects/glscene
//------------------------------------------------------------------------------
{! The FGLForm unit for TGLForm class as parent for all child forms of GLSceneViewer project}
{
  History :
     25/12/15 - PW - Fixed localization using gnugettext
     01/04/09 - PW - Created
}

unit FGLForm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.IniFiles,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.Actnlist;

type
  TGLForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniFile : TIniFile;
    procedure ReadIniFile; virtual;
    procedure WriteIniFile; virtual;
    procedure SetLanguage;
  published
    //
  protected
  end;

var
  GLForm: TGLForm;

var
  LangID : Word;

implementation

uses
  Gnugettext;

{$R *.dfm}

//Here goes the translation of all component strings
//
procedure TGLForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetLanguage;
  TranslateComponent(Self);
end;

procedure TGLForm.SetLanguage;
var
  LocalePath : TFileName;
  IniFile : TIniFile;

begin
  LocalePath := ExtractFileDir(ParamStr(0)); // Path to GLSViewer
  LocalePath := LocalePath + PathDelim + 'Locale' + PathDelim;

  Textdomain('glsviewer');
  BindTextDomain ('glsviewer', LocalePath);

  ReadIniFile;
  if (LangID <> LANG_ENGLISH) then
  begin
    case LangID of
      LANG_RUSSIAN:
      begin
        UseLanguage('ru');
        Application.HelpFile := UpperCase(LocalePath + 'ru'+ PathDelim+'GLSViewer.chm');
      end;
      LANG_SPANISH:
      begin
        UseLanguage('es');
        Application.HelpFile := UpperCase(LocalePath + 'es'+ PathDelim+'GLSViewer.chm');
      end;
      LANG_GERMAN:
      begin
        UseLanguage('ru');
        Application.HelpFile := UpperCase(LocalePath + 'ru'+ PathDelim+'GLSViewer.chm');
      end;
      LANG_FRENCH:
      begin
        UseLanguage('ru');
        Application.HelpFile := UpperCase(LocalePath + 'ru'+ PathDelim+'GLSViewer.chm');
      end
      else
      begin
        UseLanguage('en');
        Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'GLSViewer.chm');
      end;
    end;
  end
  else
  begin
    UseLanguage('en');
    Application.HelpFile := UpperCase(LocalePath + 'en'+ PathDelim+'GLSViewer.chm');
  end;
  TP_IgnoreClass(TFont);
  TranslateComponent(Self);
  //TP_GlobalIgnoreClass(TGLLibMaterial);
  //TP_GlobalIgnoreClass(TGLMaterialLibrary);
  //TP_GlobalIgnoreClass(TListBox);
  //TP_GlobalIgnoreClassProperty(TAction, 'Category');

  //LoadNewResourceModule(Language);//when using ITE, ENU for English USA

end;



procedure TGLForm.ReadIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  with IniFile do
    try
      LangID := ReadInteger('GLOptions', 'RadioGroupLanguage', 0);
    finally
      IniFile.Free;
    end;
end;


procedure TGLForm.WriteIniFile;
begin
  //
end;

end.
