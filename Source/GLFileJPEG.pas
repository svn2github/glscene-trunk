//
// This unit is part of the GLScene Project, http://glscene.org
//
{: GLFileJPEG<p>

  <b>History : </b><font size=-1><ul>
      <li>23/08/10 - Yar - Replaced OpenGL1x to OpenGLTokens
      <li>29/06/10 - Yar - Improved FPC compatibility
      <li>29/04/10 - Yar - Bugfixed loading of fliped image (thanks mif)
      <li>27/02/10 - Yar - Creation
  </ul><p>
}
unit GLFileJPEG;

interface

{$I GLScene.inc}

uses
  System.Classes, System.SysUtils,

  //GLS
  GLCrossPlatform, OpenGLTokens, GLContext, GLGraphics, GLTextureFormat,
  GLApplicationFileIO, GLSJPG, GLVectorGeometry;

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
    class function Capabilities: TDataFileCapabilities; override;

    procedure LoadFromFile(const filename: string); override;
    procedure SaveToFile(const filename: string); override;
    procedure LoadFromStream(stream: TStream); override;
    procedure SaveToStream(stream: TStream); override;

    {: Assigns from any Texture.}
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

procedure TGLJPEGImage.LoadFromStream(stream: TStream);
var
  LinesPerCall, LinesRead: integer;
  DestScanLine: Pointer;
  PtrInc: int64; // DestScanLine += PtrInc * LinesPerCall
  jc: TJPEGContext;
begin
  if Stream.Size > 0 then
  begin
    FAbortLoading := False;

    FillChar(jc, sizeof(jc), $00);
    jc.err := jpeg_std_error;
    jc.common.err := @jc.err;

    jpeg_CreateDecompress(@jc.d, JPEG_LIB_VERSION, SizeOf(jc.d));
    try
      jc.progress.progress_monitor := @JPEGLIBCallback;
      jc.progress.instance := Self;
      jc.common.progress := @jc.progress;

      jpeg_stdio_src(@jc.d, Stream);

      jpeg_read_header(@jc.d, True); // require Image
      jc.d.scale_num := 1;
      jc.d.scale_denom := FDivScale;
      jc.d.do_block_smoothing := FSmoothing;
      jc.d.dct_method := JDCT_ISLOW;
      // Standard. Float ist unwesentlich besser, aber 20 Prozent langsamer
      if FDither then
        jc.d.dither_mode := JDITHER_FS
      // Ordered ist nicht schneller, aber h��licher
      else
        jc.d.dither_mode := JDITHER_NONE;
      jc.FinalDCT := jc.d.dct_method;
      jc.FinalTwoPassQuant := jc.d.two_pass_quantize; // True
      jc.FinalDitherMode := jc.d.dither_mode; // FS

      if jpeg_has_multiple_scans(@jc.d) then
      begin // maximaler Speed beim Progressing, Hi Q erst beim letzten Scan
        jc.d.enable_2pass_quant := jc.d.two_pass_quantize;
        jc.d.dct_method := JDCT_IFAST;
        jc.d.two_pass_quantize := False;
        jc.d.dither_mode := JDITHER_ORDERED;
        jc.d.buffered_image := True;
      end;

      // Format des Bitmaps und Palettenbestimmung
      if jc.d.out_color_space = JCS_GRAYSCALE then
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

      jpeg_start_decompress(@jc.d); // liefert erst einmal JPGInfo
      UnMipmap;
      FLOD[0].Width := jc.d.output_width;
      FLOD[0].Height := jc.d.output_height;
      FLOD[0].Depth := 0;
      fCubeMap := False;
      fTextureArray := False;
      ReallocMem(fData, DataSize);
      DestScanLine := fData;
      PtrInc := PtrUInt(fData) - PtrUInt(DestScanline) + PtrUInt(GetWidth * fElementSize);
      if (PtrInc > 0) and ((PtrInc and 3) = 0) then
        LinesPerCall := jc.d.rec_outbuf_height // mehrere Scanlines pro Aufruf
      else
        LinesPerCall := 1; // dabei wird's wohl einstweilen bleiben...

      if jc.d.buffered_image then
      begin
        // progressiv. Decoding mit Min Quality (= max speed)
        while jpeg_consume_input(@jc.d) <> JPEG_REACHED_EOI do
        begin
          jpeg_start_output(@jc.d, jc.d.input_scan_number);
          // ein kompletter Pass. Reset Oberkante progressives Display
          while jc.d.output_scanline < jc.d.output_height do
          begin
            DestScanLine := Pointer(PtrUInt(fData) +
              (jc.d.output_height - jc.d.output_scanline - 1) *
              PtrUInt(GetWidth) * PtrUInt(fElementSize));
            jpeg_read_scanlines(@jc.d, @DestScanLine, LinesPerCall);
          end;
          jpeg_finish_output(@jc.d);
        end;
        // f�r den letzten Pass die tats�chlich gew�nschte Ausgabequalit�t
        jc.d.dct_method := jc.FinalDCT;
        jc.d.dither_mode := jc.FinalDitherMode;
        if jc.FinalTwoPassQuant then
        begin
          jc.d.two_pass_quantize := True;
          jc.d.colormap := nil;
        end;
        jpeg_start_output(@jc.d, jc.d.input_scan_number);
        DestScanLine := fData;
      end;

      // letzter Pass f�r progressive JPGs, erster & einziger f�r Baseline-JPGs
      while (jc.d.output_scanline < jc.d.output_height) do
      begin
        DestScanLine := Pointer(PtrUInt(fData) +
          (jc.d.output_height - jc.d.output_scanline - 1) *
          PtrUInt(GetWidth) * PtrUInt(fElementSize));
        jpeg_read_scanlines(@jc.d, @DestScanline, LinesPerCall);
      end;

      // letzter Pass f�r progressive JPGs, erster & einziger f�r Baseline-JPGs
      while (jc.d.output_scanline < jc.d.output_height) do
      begin
        LinesRead := jpeg_read_scanlines(@jc.d, @DestScanline, LinesPerCall);
        Inc(PtrUInt(DestScanline), PtrInc * LinesRead);
        if FAbortLoading then
          Exit;
      end;

      if jc.d.buffered_image then
        jpeg_finish_output(@jc.d);
      jpeg_finish_decompress(@jc.d);

    finally
      if jc.common.err <> nil then
        jpeg_destroy(@jc.common);
      jc.common.err := nil;
    end;
  end;
end;

procedure TGLJPEGImage.SaveToStream(stream: TStream);
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


class function TGLJPEGImage.Capabilities: TDataFileCapabilities;
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

