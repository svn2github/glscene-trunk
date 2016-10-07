//
// This unit is part of the GLScene Project, http://glscene.org
//
{
   Methods for loading Jpeg images
   History :
       06/09/16 - PW - Replaced GLSJPG with VCL.Imaging.Jpeg unit
       23/08/10 - Yar - Replaced OpenGL1x to OpenGLTokens
       29/06/10 - Yar - Improved FPC compatibility
       29/04/10 - Yar - Bugfixed loading of fliped image (thanks mif)
       27/02/10 - Yar - Creation

}
unit GLFileJPEG;

interface

{$I GLScene.inc}

uses
  System.Classes,
  System.SysUtils,
  Vcl.Imaging.Jpeg,
  //GLS
  GLCrossPlatform,
  OpenGLTokens,
  GLContext,
  GLGraphics,
  GLTextureFormat,
  GLApplicationFileIO,
  GLVectorGeometry;


type
  TGLJPEGImage = class(TGLBaseImage)
  private
    FAbortLoading: boolean;
    FDivScale: longword;
    FDither: boolean;
    FSmoothing: boolean;
    FProgressiveEncoding: boolean;
    procedure SetSmoothing(const AValue: boolean);
  public
    constructor Create; override;
    class function Capabilities: TGLDataFileCapabilities; override;

    procedure LoadFromFile(const filename: string); override;
    procedure SaveToFile(const filename: string); override;
    procedure LoadFromStream(AStream: TStream); override;
    procedure SaveToStream(AStream: TStream); override;

    {Assigns from any Texture.}
    procedure AssignFromTexture(textureContext: TGLContext;
      const textureHandle: TGLuint;
      textureTarget: TGLTextureTarget;
      const CurrentFormat: boolean;
      const intFormat: TGLInternalFormat); reintroduce;

    property DivScale: longword read FDivScale write FDivScale;
    property Dither: boolean read FDither write FDither;
    property Smoothing: boolean read FSmoothing write SetSmoothing;
    property ProgressiveEncoding: boolean read FProgressiveEncoding;
  end;

//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
implementation
// ------------------
// ------------------ TGLJPEGImage ------------------
// ------------------

constructor TGLJPEGImage.Create;
begin
  inherited;
  FAbortLoading := False;
  FDivScale := 1;
  FDither := False;
end;

// LoadFromFile

procedure TGLJPEGImage.LoadFromFile(const filename: string);
var
  fs: TStream;
begin
  if FileStreamExists(fileName) then
  begin
    fs := CreateFileStream(fileName, fmOpenRead);
    try
      LoadFromStream(fs);
    finally
      fs.Free;
      ResourceName := filename;
    end;
  end
  else
    raise EInvalidRasterFile.CreateFmt('File %s not found', [filename]);
end;

// SaveToFile

procedure TGLJPEGImage.SaveToFile(const filename: string);
var
  fs: TStream;
begin
  fs := CreateFileStream(fileName, fmOpenWrite or fmCreate);
  try
    SaveToStream(fs);
  finally
    fs.Free;
  end;
  ResourceName := filename;
end;

// LoadFromStream

procedure TGLJPEGImage.LoadFromStream(AStream: TStream);
var
  JpegImage: TJpegImage;

begin
  try
    JpegImage := TJPEGImage.Create;
    JpegImage.LoadFromStream(AStream);

    if JpegImage.Grayscale then
    begin
      fColorFormat := GL_LUMINANCE;
      fInternalFormat := tfLUMINANCE8;
      fElementSize := 1;
    end
    else
    begin
      fColorFormat := GL_BGR;
      fInternalFormat := tfRGB8;
      fElementSize := 3;
    end;
    fDataType := GL_UNSIGNED_BYTE;
    FLOD[0].Width := JpegImage.Width;
    FLOD[0].Height := JpegImage.Height;
    FLOD[0].Depth := 0;
    fCubeMap := False;
    fTextureArray := False;
    ReallocMem(fData, DataSize);

  finally
    JpegImage.Free;
  end;
end;

procedure TGLJPEGImage.SaveToStream(AStream: TStream);
begin

end;

// AssignFromTexture

procedure TGLJPEGImage.AssignFromTexture(textureContext: TGLContext;
  const textureHandle: TGLuint; textureTarget: TGLTextureTarget;
  const CurrentFormat: boolean; const intFormat: TGLInternalFormat);
begin

end;

procedure TGLJPEGImage.SetSmoothing(const AValue: boolean);
begin
  if FSmoothing <> AValue then
    FSmoothing := AValue;
end;

// Capabilities


class function TGLJPEGImage.Capabilities: TGLDataFileCapabilities;
begin
  Result := [dfcRead {, dfcWrite}];
end;

initialization

  { Register this Fileformat-Handler with GLScene }
  RegisterRasterFormat('jpg', 'Joint Photographic Experts Group Image',
    TGLJPEGImage);
  RegisterRasterFormat('jpeg', 'Joint Photographic Experts Group Image',
    TGLJPEGImage);
  RegisterRasterFormat('jpe', 'Joint Photographic Experts Group Image',
    TGLJPEGImage);
end.

