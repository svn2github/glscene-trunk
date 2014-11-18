//
// This unit is part of the GLScene Project, http://glscene.org
//
{: GLFeedback<p>

   A scene object encapsulating the OpenGL feedback buffer.<p>

   This object, when Active, will render it's children using
   the GL_FEEDBACK render mode. This will render the children
   into the feedback Buffer rather than into the frame buffer.<p>

   Mesh data can be extracted from the buffer using the
   BuildMeshFromBuffer procedure. For custom parsing of the
   buffer use the Buffer SingleList. The Buffered property
   will indicate if there is valid data in the buffer.<p>

   <b>History : </b><font size=-1><ul>
      <li>10/11/12 - PW - Added CPP compatibility: changed vector arrays to records
      <li>01/03/11 - Yar - Added Colors list to BuildMeshFromBuffer
      <li>23/08/10 - Yar - Added OpenGLTokens to uses, replaced OpenGL1x functions to OpenGLAdapter
      <li>15/06/10 - Yar - Bugfixed face culling on in feedback mode drawing (thanks Radli)
      <li>22/04/10 - Yar - Fixes after GLState revision
      <li>05/03/10 - DanB - More state added to TGLStateCache
      <li>30/03/07 - DaStr - Added $I GLScene.inc
      <li>28/03/07 - DaStr - Renamed parameters in some methods
                            (thanks Burkhard Carstens) (Bugtracker ID = 1678658)
      <li>23/07/04 - SG - Creation.
   </ul></font>

}
unit GLFeedback;

interface

{$I GLScene.inc}

uses
  Classes, SysUtils,
  //GLS
  GLVectorGeometry, GLVectorLists, GLScene, GLVectorFileObjects,
  GLTexture, GLRenderContextInfo, GLContext, GLState, OpenGLTokens,
  GLMeshUtils
  {$IFDEF GLS_DELPHI}, GLVectorTypes{$ENDIF};

type
  TFeedbackMode = (fm2D, fm3D, fm3DColor, fm3DColorTexture, fm4DColorTexture);

  // TGLFeedback
  {: An object encapsulating the OpenGL feedback rendering mode. }
  TGLFeedback = class(TGLBaseSceneObject)
  private
    { Private Declarations }
    FActive: Boolean;
    FBuffer: TSingleList;
    FMaxBufferSize: Cardinal;
    FBuffered: Boolean;
    FCorrectionScaling: Single;
    FMode: TFeedbackMode;

  protected
    { Protected Declarations }
    procedure SetMaxBufferSize(const Value: Cardinal);
    procedure SetMode(const Value: TFeedbackMode);

  public
    { Public Declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure DoRender(var ARci: TRenderContextInfo;
      ARenderSelf, ARenderChildren: Boolean); override;

    {: Parse the the feedback buffer for polygon data and build
       a mesh into the assigned lists. }
    procedure BuildMeshFromBuffer(
      Vertices: TAffineVectorList = nil;
      Normals: TAffineVectorList = nil;
      Colors: TVectorList = nil;
      TexCoords: TAffineVectorList = nil;
      VertexIndices: TIntegerList = nil);

    //: True when there is data in the buffer ready for parsing
    property Buffered: Boolean read FBuffered;

    //: The feedback buffer
    property Buffer: TSingleList read FBuffer;

    {: Vertex positions in the buffer needs to be scaled by
       CorrectionScaling to get correct coordinates. }
    property CorrectionScaling: Single read FCorrectionScaling;

  published
    { Published Declarations }

    //: Maximum size allocated for the feedback buffer
    property MaxBufferSize: Cardinal read FMaxBufferSize write SetMaxBufferSize;
    //: Toggles the feedback rendering
    property Active: Boolean read FActive write FActive;
    //: The type of data that is collected in the feedback buffer
    property Mode: TFeedbackMode read FMode write SetMode;

    property Visible;
  end;

  // ----------------------------------------------------------------------
  // ----------------------------------------------------------------------
  // ----------------------------------------------------------------------
implementation
// ----------------------------------------------------------------------
// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

// ----------
// ---------- TGLFeedback ----------
// ----------

// Create
//

constructor TGLFeedback.Create(AOwner: TComponent);
begin
  inherited;

  FMaxBufferSize := $100000;
  FBuffer := TSingleList.Create;
  FBuffer.Capacity := FMaxBufferSize div SizeOf(Single);
  FBuffered := False;
  FActive := False;
  FMode := fm3DColorTexture;
end;

// Destroy
//

destructor TGLFeedback.Destroy;
begin
  FBuffer.Free;

  inherited;
end;

// DoRender
//

procedure TGLFeedback.DoRender(var ARci: TRenderContextInfo;
  ARenderSelf, ARenderChildren: Boolean);

  function RecursChildRadius(obj: TGLBaseSceneObject): Single;
  var
    i: Integer;
    childRadius: Single;
  begin
    childRadius := 0;
    Result := obj.BoundingSphereRadius + VectorLength(obj.AbsolutePosition);
    for i := 0 to obj.Count - 1 do
      childRadius := RecursChildRadius(obj.Children[i]);
    if childRadius > Result then
      Result := childRadius;
  end;

var
  i: integer;
  radius: Single;
  atype: cardinal;
begin
  FBuffer.Count := 0;
  try
    if (csDesigning in ComponentState) or not Active then
      exit;
    if not ARenderChildren then
      exit;

    FCorrectionScaling := 1.0;
    for i := 0 to Count - 1 do
    begin
      radius := RecursChildRadius(Children[i]);
      if radius > FCorrectionScaling then
        FCorrectionScaling := radius + 1e-5;
    end;

    case FMode of
      fm2D: aType := GL_2D;
      fm3D: aType := GL_3D;
      fm3DColor: aType := GL_3D_COLOR;
      fm3DColorTexture: aType := GL_3D_COLOR_TEXTURE;
      fm4DColorTexture: aType := GL_4D_COLOR_TEXTURE;
    else
      aType := GL_3D_COLOR_TEXTURE;
    end;

    FBuffer.Count := FMaxBufferSize div SizeOf(Single);
    GL.FeedBackBuffer(FMaxBufferSize, atype, @FBuffer.List[0]);
    ARci.GLStates.Disable(stCullFace);
    ARci.ignoreMaterials := FMode < fm3DColor;
    ARci.PipelineTransformation.Push;
    ARci.PipelineTransformation.ProjectionMatrix := IdentityHmgMatrix;
    ARci.PipelineTransformation.ViewMatrix :=
      CreateScaleMatrix(VectorMake(
        1.0 / FCorrectionScaling,
        1.0 / FCorrectionScaling,
        1.0 / FCorrectionScaling));
    ARci.GLStates.ViewPort := Vector4iMake(-1, -1, 2, 2);
    GL.RenderMode(GL_FEEDBACK);

    Self.RenderChildren(0, Count - 1, ARci);

    FBuffer.Count := GL.RenderMode(GL_RENDER);
    ARci.PipelineTransformation.Pop;

  finally
    ARci.ignoreMaterials := False;
    FBuffered := (FBuffer.Count > 0);
    if ARenderChildren then
      Self.RenderChildren(0, Count - 1, ARci);
  end;
  ARci.GLStates.ViewPort :=
    Vector4iMake(0, 0, ARci.viewPortSize.cx, ARci.viewPortSize.cy);
end;

// BuildMeshFromBuffer
//

procedure TGLFeedback.BuildMeshFromBuffer(
  Vertices: TAffineVectorList = nil;
  Normals: TAffineVectorList = nil;
  Colors: TVectorList = nil;
  TexCoords: TAffineVectorList = nil;
  VertexIndices: TIntegerList = nil);
var
  value: Single;
  i, j, LCount, skip: Integer;
  vertex, color, texcoord: TVector;
  tempVertices, tempNormals, tempTexCoords: TAffineVectorList;
  tempColors: TVectorList;
  tempIndices: TIntegerList;
  ColorBuffered, TexCoordBuffered: Boolean;
begin
  Assert(FMode <> fm2D, 'Cannot build mesh from fm2D feedback mode.');

  tempVertices := TAffineVectorList.Create;
  tempColors := TVectorList.Create;
  tempTexCoords := TAffineVectorList.Create;

  ColorBuffered := (FMode = fm3DColor) or
    (FMode = fm3DColorTexture) or
    (FMode = fm4DColorTexture);
  TexCoordBuffered := (FMode = fm3DColorTexture) or
    (FMode = fm4DColorTexture);

  i := 0;

  skip := 3;
  if FMode = fm4DColorTexture then
    Inc(skip, 1);
  if ColorBuffered then
    Inc(skip, 4);
  if TexCoordBuffered then
    Inc(skip, 4);

  while i < FBuffer.Count - 1 do
  begin
    value := FBuffer[i];
    if value = GL_POLYGON_TOKEN then
    begin
      Inc(i);
      value := FBuffer[i];
      LCount := Round(value);
      Inc(i);
      if LCount = 3 then
      begin
        for j := 0 to 2 do
        begin
          vertex.V[0] := FBuffer[i];
          Inc(i);
          vertex.V[1] := FBuffer[i];
          Inc(i);
          vertex.V[2] := FBuffer[i];
          Inc(i);
          if FMode = fm4DColorTexture then
            Inc(i);
          if ColorBuffered then
          begin
            color.V[0] := FBuffer[i];
            Inc(i);
            color.V[1] := FBuffer[i];
            Inc(i);
            color.V[2] := FBuffer[i];
            Inc(i);
            color.V[3] := FBuffer[i];
            Inc(i);
          end;
          if TexCoordBuffered then
          begin
            texcoord.V[0] := FBuffer[i];
            Inc(i);
            texcoord.V[1] := FBuffer[i];
            Inc(i);
            texcoord.V[2] := FBuffer[i];
            Inc(i);
            texcoord.V[3] := FBuffer[i];
            Inc(i);
          end;

          vertex.V[2] := 2 * vertex.V[2] - 1;
          ScaleVector(vertex, FCorrectionScaling);

          tempVertices.Add(AffineVectorMake(vertex));
          tempColors.Add(color);
          tempTexCoords.Add(AffineVectorMake(texcoord));
        end;
      end
      else
      begin
        Inc(i, skip * LCount);
      end;
    end
    else
    begin
      Inc(i);
    end;
  end;

  if Assigned(VertexIndices) then
  begin
    tempIndices := BuildVectorCountOptimizedIndices(tempVertices, nil, nil);
    RemapAndCleanupReferences(tempVertices, tempIndices);
    VertexIndices.Assign(tempIndices);
  end
  else
  begin
    tempIndices := TIntegerList.Create;
    tempIndices.AddSerie(0, 1, tempVertices.Count);
  end;

  tempNormals := BuildNormals(tempVertices, tempIndices);

  if Assigned(Vertices) then
    Vertices.Assign(tempVertices);
  if Assigned(Normals) then
    Normals.Assign(tempNormals);
  if Assigned(Colors) and ColorBuffered then
    Colors.Assign(tempColors);
  if Assigned(TexCoords) and TexCoordBuffered then
    TexCoords.Assign(tempTexCoords);

  tempVertices.Destroy;
  tempNormals.Destroy;
  tempColors.Destroy;
  tempTexCoords.Destroy;
  tempIndices.Destroy;
end;

// SetMaxBufferSize
//

procedure TGLFeedback.SetMaxBufferSize(const Value: Cardinal);
begin
  if Value <> FMaxBufferSize then
  begin
    FMaxBufferSize := Value;
    FBuffered := False;
    FBuffer.Count := 0;
    FBuffer.Capacity := FMaxBufferSize div SizeOf(Single);
  end;
end;

// SetMode
//

procedure TGLFeedback.SetMode(const Value: TFeedbackMode);
begin
  if Value <> FMode then
  begin
    FMode := Value;
    FBuffered := False;
    FBuffer.Count := 0;
  end;
end;

initialization

  RegisterClasses([TGLFeedback]);

end.

