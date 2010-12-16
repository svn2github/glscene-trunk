//
// This unit is part of the GLScene Project, http://glscene.org
//
{: GLFileOBJ<p>

    Support-Code to load Wavefront OBJ Files into TGLFreeForm-Components
    in GLScene.<p>
    Note that you must manually add this unit to one of your project's uses
    to enable support for OBJ & OBJF at run-time.<p>

 <b>History : </b><font size=-1><ul>
      <li>23/08/10 - Yar - Replaced OpenGL1x to OpenGLTokens
      <li>04/03/10 - DanB - Now uses CharInSet
      <li>16/10/08 - UweR - Compatibility fix for Delphi 2009
      <li>20/05/08 - mrqzzz - Added RegisterClass(TOBJFGVertexNormalTexIndexList)
      <li>06/06/07 - DaStr - Added GLColor to uses (BugtrackerID = 1732211)
      <li>30/03/07 - DaStr - Added $I GLScene.inc
      <li>24/03/07 - DaStr - Added explicit pointer dereferencing
                             (thanks Burkhard Carstens) (Bugtracker ID = 1678644)
      <li>11/07/05 - DaStr - Improved Cross-Platform compatibility (BugTracker ID = 1684432)
      <li>11/07/05 - Wet - Added multi meshobject support
      <li>09/09/03 - Jaj - Added TriangleStrip and TriangleFan support to save..
      <li>10/07/03 - Egg - Improved robustness of material loading
      <li>02/06/03 - Egg - Undone Jaj changes, they broke standard OBJ support
      <li>30/01/03 - Egg - Normals extraction
      <li>29/01/03 - Jaj - Fixed to allow load of simple triangle meshes... ('V','VN','VT')
      <li>23/01/03 - Egg - Can now export TFGIndexTexCoordList (untextured)
      <li>25/11/02 - Egg - Improved mtl import (d and illum commands)
      <li>22/11/02 - Egg - Supports OBJ files using #9 in place of #32,
                           fixed leak, some code cleanup/rearrangements,
                           support for mtllib and usemtl commands
      <li>18/08/01 - Egg - '$' now allowed as alternate comment,
                           AddToTriangles override
      <li>03/10/00 - Egg - Fixed TGLOBJVectorFile.LoadFromStream.ReadFace
      <li>08/10/00 - Egg - Added standard header, basic htmlification of old header,
                           removed specific trim funcs,
                           renamed TMBAGLOBJVectorFile to TGLOBJVectorFile
   </ul><p>

   (c) 2000 Marian Aldenh�vel<br>
       Hainstra�e 8<br>
       53121 Bonn<br>
       info@MBA-Software.de<p>

  License:<br>

    Contributed to Eric Grange and GLScene,
    same licensing, batteries not included.<p>

  History:<p>

    26.9.2000:  - OBJF-Support (t- and q-lines) see
                  http://www.cs.sunysb.edu/~stripe/<br>
    18.9.2000:  - Bugfixing.
                - SaveTo-Methods.<br>
    14.9.2000:  - Calculate normals where missing in the file.
                - Collect Facegroups by Name and do not start a new
            one for every 'g'-line in the file.
                - Relative indexing in 'f'-lines.<br>
    13.9.2000:  - Start of this project as an exercise to get familiar with<br>
                    a) the OBJ-Format and<br>
                    b) GLScene internals<br>
                  Midterm-goal: Import what Poser 4 exports and display it
                                correctly in an GLScene.<br>
}
unit GLFileOBJ;

{$I GLScene.inc}
{.$DEFINE STATS}{ Define to display statistics after loading. }

interface

uses
  GLCrossPlatform,
  Classes,
  SysUtils,
  ApplicationFileIO,

  VectorGeometry,
  GLScene,
  GLVectorFileObjects,
  VectorLists,
  GLTexture,
  GLColor,
  GLRenderContextInfo,
  GLMaterial
{$IFDEF GLS_EXPERIMENTAL}
  ,GLShaderManager,
  GL3xMesh
{$ENDIF GLS_EXPERIMENTAL}
  ;

const
  BufSize = 10240; { Load input data in chunks of BufSize Bytes. }
  LineLen = 100; { Allocate memory for the current line in chunks
  of LineLen Bytes. }

type

  // TGLOBJVectorFile
  //
  TGLOBJVectorFile = class(TVectorFile)
  private
    FSourceStream: TStream; { Load from this stream }
    FBuffer: AnsiString; { Buffer }
    FLine: string; { current line }
    FLineNo: Integer; { current Line number - for error messages }
    FEof: Boolean; { Stream done? }
    FBufPos: Integer; { Position in the buffer }

  protected
    // Read a single line of text from the source stream, set FEof to true when done.
    procedure ReadLine;
    // Raise a class-specific exception
    procedure Error(const msg: string);

    procedure CalcMissingOBJNormals(mesh: TMeshObject);

  public
    class function Capabilities: TDataFileCapabilities; override;

    procedure LoadFromStream(aStream: TStream); override;
    procedure SaveToStream(aStream: TStream); override;
  end;

  // EGLOBJFileError
  //
  EGLOBJFileError = class(Exception)
  private
    FLineNo: Integer;

  public
    property LineNo: Integer read FLineNo;

  end;

  // TGLMTLFile
  //
  {: A simple class that know how to extract infos from a mtl file.<p>
     mtl files are companion files of the obj, they store material
     information. Guessed content (imported ones denoted with a '*',
     please help if you know more):<ul>
     <li>materials begin with a 'newmtl' command followed by material name
     <li>*Kd command defines the diffuse color
     <li>*map_Kd command defines the diffuse texture image
     <li>*Ka/map_Ka define the ambient color and texmap
     <li>*Ks/map_Ks define the specular color and texmap
     <li>map_Bump specifies the bump map
     <li>*d specifies transparency (alpha-channel, range [0; 1])
     <li>map_d specifies the opcaity texture map
     <li>Ns defines the specular exponent or shininess or phong specular (?)
     <li>Ni is the refraction index (greater than 1)
     <li>*illum defines the illumination model (0 for no lighting, 1 for
          ambient and diffuse, 2 for full lighting)
     </ul> }
  TGLMTLFile = class(TStringList)
  public
    procedure Prepare;

    function MaterialStringProperty(const materialName, propertyName: string): string;
    function MaterialVectorProperty(const materialName, propertyName: string;
      const defaultValue: TVector): TVector;
  end;

{$IFDEF GLS_EXPERIMENTAL}
  TGLMeshOBJFileIO = class(TGLAbstractMeshFileIO)
  public
//    class function Capabilities: TDataFileCapabilities; virtual;
    class procedure LoadFromStream(AStream: TStream; ABuilder: TGLAbstractMeshBuilder); override;
//    class procedure SaveToStream(AStream: TStream; ADest: TGLAbstractMeshBuilder); virtual;
  end;
{$ENDIF GLS_EXPERIMENTAL}

  // ------------------------------------------------------------------
  // ------------------------------------------------------------------
  // ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

uses
  OpenGLTokens,
  XOpenGL,
  GLContext,
  MeshUtils,
  GLUtils,
  GLSLog;

// StreamEOF
//

function StreamEOF(S: TStream): Boolean;
begin
  { Is the stream at its end? }
  Result := (S.Position >= S.Size);
end;

function Rest(const s: string; Count: integer): string;
{ Return the right part of s including s[Count]. }
begin
  Result := copy(s, Count, Length(s) - Count + 1);
end;

// NextToken
//

function NextToken(var s: string; delimiter: Char): string;
{ Return the next Delimiter-delimited Token from the string s and
  remove it from s }
var
  p: Integer;
begin
  p := Pos(Delimiter, s);
  if p = 0 then
  begin
    Result := s;
    s := '';
  end
  else
  begin
    Result := copy(s, 1, p - 1);
    s := TrimLeft(Rest(s, p + 1));
  end;
end;

{ ** TOBJFGVertexNormalTexIndexList ****************************************** }
{ - based on TFGVertexNormalTexIndexList (GLVectorFileObjects.pas)
  - adds support for polygons and for "missing" normals and
    texture-coordinates. Pass -1 to Add for the index of a missing object.
  - Polygons are defined by counting off the number of vertices added to the
    PolygonVertices-property. So a PolygonVertices-List of

      [3,4,6]

    says "Vertex indices 0,1 and 2 make up a triangle, 3,4,5 and 6 a quad and
    7,8,9,10,11 and 12 a hexagon".

}

type
  TOBJFGMode = (objfgmmPolygons, objfgmmTriangleStrip);

  TOBJFGVertexNormalTexIndexList = class(TFGVertexNormalTexIndexList)
  private
    FMode: TOBJFGMode;
    FName: string;
    FPolygonVertices: TIntegerList;
    FCurrentVertexCount: integer;
    FShowNormals: boolean;
    procedure PolygonComplete; { Current polygon completed. Adds FCurrentVertexCount
    to FPolygonVertices and sets the variable to 0 }

    procedure SetMode(aMode: TOBJFGMode);

  public
    constructor CreateOwned(aOwner: TFaceGroups); override;
    destructor Destroy; override;

    procedure Add(VertexIdx, NormalIdx, TexCoordIdx: Integer);
    procedure BuildList(var mrci: TRenderContextInfo); override;
    procedure AddToTriangles(aList: TAffineVectorList;
      aTexCoords: TAffineVectorList = nil;
      aNormals: TAffineVectorList = nil); override;
    function TriangleCount: Integer; override;

    property Mode: TOBJFGMode read FMode write SetMode;
    property Name: string read FName write FName;
    property PolygonVertices: TIntegerList read FPolygonVertices;
    property ShowNormals: boolean read FShowNormals write FShowNormals;
  end;

constructor TOBJFGVertexNormalTexIndexList.CreateOwned(aOwner: TFaceGroups);
begin
  inherited CreateOwned(aOwner);
  FMode := objfgmmTriangleStrip;
  //FShowNormals:=True;
end;

destructor TOBJFGVertexNormalTexIndexList.Destroy;
begin
  FPolygonVertices.Free;
  inherited Destroy;
end;

procedure TOBJFGVertexNormalTexIndexList.Add(VertexIdx, NormalIdx, TexCoordIdx: Integer);
begin
  inherited Add(VertexIdx, NormalIdx, TexCoordIdx);
  inc(FCurrentVertexCount);
end;

procedure TOBJFGVertexNormalTexIndexList.PolygonComplete;
begin
  Assert(FMode = objfgmmPolygons, 'PolygonComplete may only be called for Facegroups with Mode=objfgmmPolygons.');
  FPolygonVertices.Add(FCurrentVertexCount);
  FCurrentVertexCount := 0;
end;

procedure TOBJFGVertexNormalTexIndexList.SetMode(aMode: TOBJFGMode);
begin
  if aMode = FMode then
    exit;
  Assert(VertexIndices.Count = 0, 'Decide on the mode before adding vertices.');
  FMode := aMode;
  if FMode = objfgmmPolygons then
    FPolygonVertices := TIntegerList.Create
  else
  begin
    FPolygonVertices.Free;
    FPolygonVertices := nil;
  end;
end;

procedure TOBJFGVertexNormalTexIndexList.BuildList(var mrci: TRenderContextInfo);
var
  VertexPool: PAffineVectorArray;
  NormalPool: PAffineVectorArray;
  TexCoordPool: PAffineVectorArray;

  procedure BuildPolygons;
  var
    Polygon, Index, j, idx: Integer;
    N: TAffineVector;
  begin
    { Build it. Ignoring texture-coordinates and normals that are missing. }
    Index := 0; { Current index into the Index-Lists. }
    { For every Polygon }
    for Polygon := 0 to FPolygonVertices.Count - 1 do
    begin
      GL.Begin_(GL_POLYGON);
      try
        { For every Vertex in the current Polygon }
        for j := 0 to FPolygonVertices[Polygon] - 1 do
        begin
          idx := NormalIndices.List^[Index];
          if idx >= 0 then
            GL.Normal3fv(@NormalPool[idx]);

          if Assigned(TexCoordPool) then
          begin
            idx := TexCoordIndices.List^[Index];
            if idx >= 0 then
              GL.TexCoord2fv(@TexCoordPool[idx]);
          end;

          GL.Vertex3fv(@VertexPool[VertexIndices.List^[Index]]);
          Inc(Index);
        end;
      finally
        GL.End_;
      end;
    end;

    { Visible normals, rather moronic and mainly for debugging. }
    if FShowNormals then
    begin
      Index := 0;
      for Polygon := 0 to FPolygonVertices.Count - 1 do
      begin
        { For every Vertex in the current Polygon }
        for j := 0 to FPolygonVertices[Polygon] - 1 do
        begin
          idx := NormalIndices.List^[Index];
          if idx <> -1 then
          begin
            GL.Begin_(GL_LINES);
            try
              GL.Vertex3fv(@VertexPool^[VertexIndices.List^[Index]]);
              N := VectorAdd(VertexPool^[VertexIndices.List^[Index]], VectorScale(NormalPool^[idx], 0.1));
              GL.Vertex3fv(@N);
            finally
              GL.End_;
            end;
          end;
          inc(Index);
        end;
      end;
    end;
  end;

  procedure BuildTriangleStrip;
    (*
    begin
      Owner.Owner.DeclareArraysToOpenGL(False);
      GL.DrawElements(GL_TRIANGLE_STRIP,VertexIndices.Count,
                     GL_UNSIGNED_INT,VertexIndices.List);
    end;
    *)
  var
    Index, idx: Integer;
  begin
    { Build it. Ignoring texture-coordinates and normals that are missing. }
    GL.Begin_(GL_TRIANGLE_STRIP);
    try
      for Index := 0 to VertexIndices.Count - 1 do
      begin
        idx := NormalIndices.List^[Index];
        if idx <> -1 then
          GL.Normal3fv(@NormalPool^[idx]);

        if Assigned(TexCoordPool) then
        begin
          idx := TexCoordIndices.List^[Index];
          if idx <> -1 then
            xgl.TexCoord2fv(@TexCoordPool^[idx]);
        end;

        GL.Vertex3fv(@VertexPool^[VertexIndices.List^[Index]]);
      end;
    finally
      GL.End_;
    end;
  end;

begin
  Assert(((TexCoordIndices.Count = 0) or (VertexIndices.Count <= TexCoordIndices.Count))
    and (VertexIndices.Count <= NormalIndices.Count),
    'Number of Vertices does not match number of Normals or Texture coordinates.');

  { Shorthand notations. }
  VertexPool := Owner.Owner.Vertices.List;
  NormalPool := Owner.Owner.Normals.List;
  if TexCoordIndices.Count = 0 then
    TexCoordPool := nil
  else
    TexCoordPool := Owner.Owner.TexCoords.List;

  case FMode of
    objfgmmPolygons: BuildPolygons;
    objfgmmTriangleStrip: BuildTriangleStrip;
  end;
end;

// AddToTriangles
//

procedure TOBJFGVertexNormalTexIndexList.AddToTriangles(aList: TAffineVectorList;
  aTexCoords: TAffineVectorList = nil;
  aNormals: TAffineVectorList = nil);
var
  i, j, n, n0: Integer;
  vertexList, texCoordList, normalsList: TAffineVectorList;
begin
  vertexList := Owner.Owner.Vertices;
  texCoordList := Owner.Owner.TexCoords;
  normalsList := Owner.Owner.Normals;
  case FMode of
    objfgmmPolygons:
      begin
        n := 0;
        for i := 0 to FPolygonVertices.Count - 1 do
        begin
          n0 := n;
          for j := 0 to FPolygonVertices[i] - 1 do
          begin
            if j > 1 then
            begin
              aList.Add(vertexList[VertexIndices[n0]],
                vertexList[VertexIndices[n - 1]],
                vertexList[VertexIndices[n]]);
              if Assigned(aTexCoords) then
              begin
                if texCoordList.Count > 0 then
                  aTexCoords.Add(texCoordList[VertexIndices[n0]],
                    texCoordList[VertexIndices[n - 1]],
                    texCoordList[VertexIndices[n]])
                else
                  aTexCoords.AddNulls(3);
              end;
              if Assigned(aNormals) then
              begin
                if normalsList.Count > 0 then
                  aNormals.Add(normalsList[VertexIndices[n0]],
                    normalsList[VertexIndices[n - 1]],
                    normalsList[VertexIndices[n]])
                else
                  aNormals.AddNulls(3);
              end;
            end;
            Inc(n);
          end;
        end;
      end;
    objfgmmTriangleStrip:
      begin
        ConvertStripToList(vertexList, VertexIndices, aList);
        n := (VertexIndices.Count - 2) * 3;
        if Assigned(aTexCoords) then
        begin
          if texCoordList.Count > 0 then
            ConvertStripToList(texCoordList, VertexIndices, aTexCoords)
          else
            aTexCoords.AddNulls(n);
        end;
        if Assigned(aNormals) then
        begin
          if normalsList.Count > 0 then
            ConvertStripToList(normalsList, VertexIndices, aNormals)
          else
            aNormals.AddNulls(n);
        end;
      end;
  else
    Assert(False);
  end;
end;

// TriangleCount
//

function TOBJFGVertexNormalTexIndexList.TriangleCount: Integer;
var
  i: Integer;
begin
  case FMode of
    objfgmmPolygons:
      begin
        Result := 0;
        for i := 0 to FPolygonVertices.Count - 1 do
        begin
          Result := Result + FPolygonVertices[i] - 2;
        end;
      end;
    objfgmmTriangleStrip:
      begin
        Result := VertexIndices.Count - 2;
        if Result < 0 then
          Result := 0;
      end;
  else
    Result := 0;
    Assert(False);
  end;
end;

// ------------------
// ------------------ TGLOBJVectorFile ------------------
// ------------------

// ReadLine
//

procedure TGLOBJVectorFile.ReadLine;
var
  j: Integer;

  procedure FillBuffer;
  var
    l: Integer;
  begin
    l := FSourceStream.Size - FSourceStream.Position;
    if l > BufSize then
      l := BufSize;
    SetLength(FBuffer, l);
    FSourceStream.Read(FBuffer[1], l);
    FBufPos := 1;
  end;

begin
  Inc(FLineNo);

  if FBufPos < 1 then
    FillBuffer;

  j := 1;
  while True do
  begin
    if FBufPos > Length(FBuffer) then
    begin
      if StreamEof(FSourceStream) then
      begin
        FEof := True;
        break;
      end
      else
        FillBuffer
    end
    else
    begin
      case FBuffer[FBufPos] of
        #10, #13:
          begin
            Inc(FBufPos);
            if FBufPos > Length(FBuffer) then
              if StreamEof(FSourceStream) then
                break
              else
                FillBuffer;
            if (FBuffer[FBufPos] = #10) or (FBuffer[FBufPos] = #13) then
              Inc(FBufPos);
            break;
          end;
      else
        if j > Length(FLine) then
          SetLength(FLine, Length(FLine) + LineLen);
        if FBuffer[FBufPos] = #9 then
          FLine[j] := #32
        else
          FLine[j] := Char(FBuffer[FBufPos]);
        Inc(FBufPos);
        Inc(j);
      end;
    end;
  end;

  SetLength(FLine, j - 1);
end;

// Error
//

procedure TGLOBJVectorFile.Error(const msg: string);
var
  E: EGLOBJFileError;
begin
  E := EGLOBJFileError.Create(Msg);
  E.FLineNo := FLineNo;
  raise E;
end;

// Capabilities
//

class function TGLOBJVectorFile.Capabilities: TDataFileCapabilities;
begin
  Result := [dfcRead, dfcWrite];
end;

// CalcMissingOBJNormals
//

procedure TGLOBJVectorFile.CalcMissingOBJNormals(mesh: TMeshObject);
var
  vertexPool: PAffineVectorArray;
  n: TAffineVector;
  p: array[1..3] of PAffineVector;
  face, index: Integer;
  fg: TOBJFGVertexNormalTexIndexList;

  procedure DoCalcNormal;
  var
    idx: Integer;
  begin
    idx := TOBJFGVertexNormalTexIndexList(Mesh.FaceGroups[Face]).NormalIndices.List^[Index];
    if idx < 0 then
    begin
      n := CalcPlaneNormal(p[1]^, p[2]^, p[3]^);
      idx := Mesh.Normals.Add(n);
      TOBJFGVertexNormalTexIndexList(Mesh.FaceGroups[Face]).NormalIndices.List^[Index] := idx;
    end;
  end;

  procedure CalcForPolygons;
  var
    polygon, firstVertexIndex, j: Integer;
  begin
    with FG do
    begin
      { Walk the polygons and calculate normals for those vertices that
        are missing. }
      Index := 0; { Current index into the Index-List of this Facegroup. }

      { For every Polygon }
      for Polygon := 0 to FPolygonVertices.Count - 1 do
      begin
        { Init }
        FirstVertexIndex := Index;
        FillChar(p, SizeOf(p), 0);
        { Last Vertex in this polygon }
        p[2] := @VertexPool^[VertexIndices.List^[Index + FPolygonVertices[Polygon] - 1]];
        { First Vertex in this polygon }
        p[3] := @VertexPool^[VertexIndices.List^[Index]];
        { For every Vertex in the current Polygon but the last. }
        for j := 0 to FPolygonVertices[Polygon] - 2 do
        begin
          Move(p[2], p[1], 2 * SizeOf(PAffineVector));
          p[3] := @VertexPool^[VertexIndices.List^[Index + 1]];
          DoCalcNormal;
          Inc(Index);
        end;

        { For the last vertex use the first as partner to span the plane. }
        Move(p[2], p[1], 2 * SizeOf(PAffineVector));
        p[3] := @VertexPool^[VertexIndices.List^[FirstVertexIndex]];
        DoCalcNormal;
        inc(Index);
      end; { of for FPolygonVertices }
    end; { of with Facegroup }
  end;

  procedure CalcForTriangleStrip;
  begin
  end;

begin
  { Shorthand notations. }
  VertexPool := Mesh.Vertices.List;

  for Face := 0 to Mesh.FaceGroups.Count - 1 do
  begin
    FG := TOBJFGVertexNormalTexIndexList(Mesh.FaceGroups[Face]);
    case FG.Mode of
      objfgmmPolygons: CalcForPolygons;
      objfgmmTriangleStrip: CalcForTriangleStrip;
    end;
  end;
end;

// LoadFromStream
//

procedure TGLOBJVectorFile.LoadFromStream(aStream: TStream);
var
  hv: THomogeneousVector;
  av: TAffineVector;
  mesh: TMeshObject;
  faceGroup: TOBJFGVertexNormalTexIndexList;
  faceGroupNames: TStringList;

  procedure ReadHomogeneousVector;
    { Read a vector with a maximum of 4 elements from the current line. }
  var
    i, c: Integer;
    f: string;
  begin
    FillChar(hv, SizeOf(hv), 0);
    i := 0;
    while (FLine <> '') and (i < 4) do
    begin
      f := NextToken(FLine, ' ');
      Val(f, hv[i], c);
      if c <> 0 then
        Error(Format('''%s'' is not a valid floating-point constant.', [f]));
      Inc(i);
    end;
  end;

  procedure ReadAffineVector;
    { Read a vector with a maximum of 3 elements from the current line. }
  var
    i, c: integer;
    f: string;
  begin
    FillChar(av, SizeOf(av), 0);
    i := 0;
    while (FLine <> '') and (i < 3) do
    begin
      f := NextToken(FLine, ' ');
      Val(f, av[i], c);
      if c <> 0 then
        Error(Format('''%s'' is not a valid floating-point constant.', [f]));
      inc(i);
    end;
  end;

  procedure SetCurrentFaceGroup(aName: string; const matlName: string);
  var
    i: Integer;
  begin
    i := faceGroupNames.IndexOf(aName);
    if i >= 0 then
    begin
      faceGroup := TOBJFGVertexNormalTexIndexList(faceGroupNames.Objects[i]);
      if faceGroup.MaterialName <> matlName then
      begin
        aName := aName + '-' + matlName;
        i := faceGroupNames.IndexOf(aName);
        if i >= 0 then
        begin
          faceGroup := TOBJFGVertexNormalTexIndexList(faceGroupNames.Objects[i]);
          if faceGroup.MaterialName <> matlName then
            faceGroup := nil;
        end;
      end;
    end;

    if (faceGroup = nil) or (faceGroup.Name <> aName)
      or (faceGroup.PolygonVertices.Count > 0)
      or (faceGroup.MaterialName <> matlName) then
    begin
      faceGroup := TOBJFGVertexNormalTexIndexList.CreateOwned(Mesh.FaceGroups);
      faceGroup.FName := aName;
      faceGroup.Mode := objfgmmPolygons;
      faceGroup.MaterialName := matlName;
      faceGroupNames.AddObject(aName, faceGroup);
    end;
  end;

  procedure AddFaceVertex(faceVertices: string);

    function GetIndex(Count: Integer): Integer;
    var
      s: string;
    begin
      s := NextToken(FaceVertices, '/');
      Result := StrToIntDef(s, 0);
      if Result = 0 then
        Result := -1 // Missing
      else if Result < 0 then
      begin
        { Relative, make absolute. "-1" means last, "-2" second last. }
        Result := Count + Result
      end
      else
      begin
        { Absolute, correct for zero-base. }
        Dec(Result);
      end;
    end;

  var
    vIdx, tIdx, nIdx: Integer;
  begin
    vIdx := GetIndex(mesh.Vertices.Count);
    tIdx := GetIndex(mesh.TexCoords.Count);
    nIdx := GetIndex(mesh.Normals.Count);

    faceGroup.Add(vIdx, nIdx, tIdx);
  end;

  procedure ReadFace(const curMtlName: string);
  var
    faceVertices: string;
  begin
    if FLine <> '' then
    begin
      if not Assigned(FaceGroup) then
        SetCurrentFaceGroup('', curMtlName);
      try
        while FLine <> '' do
        begin
          faceVertices := NextToken(FLine, ' ');
          AddFaceVertex(faceVertices);
        end;
      finally
        FaceGroup.PolygonComplete;
      end;
    end;
  end;

  procedure ReadTriangleStripContinued;
  var
    faceVertices: string;
  begin
    if faceGroup = nil then
      Error('q-line without preceding t-line.');
    while FLine <> '' do
    begin
      FaceVertices := NextToken(FLine, ' ');
      AddFaceVertex(FaceVertices);
    end;
  end;

  procedure ReadTriangleStrip;
  begin
    { Start a new Facegroup, mode=triangle strip }
    faceGroup := TOBJFGVertexNormalTexIndexList.CreateOwned(Mesh.FaceGroups);
    faceGroup.Mode := objfgmmTriangleStrip;
    { The rest is the same as for continuation of a strip. }
    ReadTriangleStripContinued;
  end;

  function GetOrAllocateMaterial(const libName, matName: string): string;
  var
    fs: TStream;
    objMtl: TGLMTLFile;
    matLib: TGLMaterialLibrary;
    libMat: TGLLibMaterial;
    texName: string;
  begin
    if GetOwner is TGLBaseMesh then
    begin
      // got a linked material library?
      matLib := TGLBaseMesh(GetOwner).MaterialLibrary;
      if Assigned(matLib) then
      begin
        Result := matName;
        libMat := matLib.Materials.GetLibMaterialByName(matName);
        if not Assigned(libMat) then
        begin
          // spawn a new material
          libMat := matLib.Materials.Add;
          libMat.Name := matName;
          try
            fs := CreateFileStream(libName);
          except
            fs := nil;
          end;
          if Assigned(fs) then
          begin
            objMtl := TGLMTLFile.Create;
            try
              objMtl.LoadFromStream(fs);
              objMtl.Prepare;
              // setup material colors
              with libMat.Material.FrontProperties do
              begin
                Ambient.Color := objMtl.MaterialVectorProperty(matName, 'Ka', clrGray20);
                Diffuse.Color := objMtl.MaterialVectorProperty(matName, 'Kd', clrGray80);
                Diffuse.Alpha := GLUtils.StrToFloatDef(objMtl.MaterialStringProperty(matName, 'd'), 1);
                if Diffuse.Alpha < 1 then
                  libMat.Material.BlendingMode := bmTransparency;
                case StrToIntDef(objMtl.MaterialStringProperty(matName, 'illum'), 1) of
                  0:
                    begin // non-lit material
                      libMat.Material.MaterialOptions := [moNoLighting];
                    end;
                  1: ; // flat, non-shiny material
                  2:
                    begin // specular material
                      Specular.Color := objMtl.MaterialVectorProperty(matName, 'Ks', clrTransparent);
                    end;
                else
                  // unknown, assume unlit
                  libMat.Material.MaterialOptions := [moNoLighting];
                  Diffuse.Color := clrGray80;
                end;
                Shininess := StrToIntDef(objMtl.MaterialStringProperty(matName, 'Ns'), 1);
              end;
              // setup texture
              texName := objMtl.MaterialStringProperty(matName, 'map_Kd');
              if texName <> '' then
              begin
                try
                  with libMat.Material.Texture do
                  begin
                    Image.LoadFromFile(texName);
                    Disabled := False;
                    TextureMode := tmModulate;
                  end;
                except
                  on E: ETexture do
                  begin
                    if not Owner.IgnoreMissingTextures then
                      raise;
                  end;
                end;
              end;
            finally
              objMtl.Free;
              fs.Free;
            end;
          end;
        end
        else
          Result := matName;
      end
      else
        Result := '';
    end;
  end;

var
  command, objMtlFileName, curMtlName: string;
{$IFDEF STATS}
  t0, t1, t2: Integer;
{$ENDIF}
begin
{$IFDEF STATS}
  t0 := GLGetTickCount;
{$ENDIF}

  FEof := False;
  FSourceStream := aStream;
  FLineNo := 0;
  objMtlFileName := '';
  curMtlName := '';

  mesh := TMeshObject.CreateOwned(Owner.MeshObjects);
  mesh.Mode := momFaceGroups;

  faceGroupNames := TStringList.Create;
  faceGroupNames.Duplicates := dupAccept;
  faceGroupNames.Sorted := True;
  try

    faceGroup := nil;

    while not FEof do
    begin
      ReadLine;
      if FLine = '' then
        Continue; { Skip blank line }
      if CharInSet(FLine[1], ['#', '$']) then
        Continue; { Skip comment and alternate comment }

      command := AnsiUpperCase(NextToken(FLine, ' '));

      if command = 'V' then
      begin
        ReadHomogeneousVector;
        Mesh.Vertices.Add(hv[0], hv[1], hv[2]);
      end
      else if command = 'VT' then
      begin
        ReadAffineVector;
        Mesh.TexCoords.Add(av[0], av[1], 0);
      end
      else if command = 'VN' then
      begin
        ReadAffineVector;
        Mesh.Normals.Add(av[0], av[1], av[2]);
      end
      else if command = 'VP' then
      begin
        { Parameter Space Vertex: Ignore }
      end
      else if command = 'G' then
      begin
        { Only the first name on the line, multiple groups not supported. }
        SetCurrentFaceGroup(NextToken(FLine, ' '), curMtlName);
      end
      else if command = 'F' then
      begin
        ReadFace(curMtlName);
      end
      else if command = 'O' then
      begin
        { Object Name:  Ignore }
      end
      else if command = 'MTLLIB' then
      begin
        objMtlFileName := NextToken(FLine, ' ');
      end
      else if command = 'USEMTL' then
      begin
        curMtlName := GetOrAllocateMaterial(objMtlFileName, NextToken(FLine, ' '));
        if faceGroup = nil then
          SetCurrentFaceGroup('', curMtlName)
        else
          SetCurrentFaceGroup(faceGroup.FName, curMtlName);
      end
      else if command = 'S' then
      begin
        { Smooth Group: Ignore }
      end
      else if command = 'T' then
      begin
        ReadTriangleStrip;
      end
      else if command = 'Q' then
      begin
        ReadTriangleStripContinued;
      end
      else
        Error('Unsupported Command ''' + command + '''');
    end;

    mesh.FaceGroups.SortByMaterial;

{$IFDEF STATS}
    t1 := GLGetTickCount;
{$ENDIF}

    CalcMissingOBJNormals(mesh);

{$IFDEF STATS}
    t2 := GLGetTickCount;
    InformationDlg(Format('TGLOBJVectorFile Loaded in %dms'#13 +
      #13 +
      '    %dms spent reading'#13 +
      '    %dms spent calculating normals'#13 +
      '    %d Geometric Vertices'#13 +
      '    %d Texture Vertices'#13 +
      '    %d Normals'#13 +
      '    %d FaceGroups/Strips',
      [t2 - t0,
      t1 - t0,
        t2 - t1,
        Mesh.Vertices.Count,
        Mesh.TexCoords.Count,
        Mesh.Normals.Count,
        Mesh.FaceGroups.Count]));
{$ENDIF}
  finally
    faceGroupNames.Free;
  end;
end;

procedure TGLOBJVectorFile.SaveToStream(aStream: TStream);
var
  OldDecimalSeparator: char;

  procedure Write(const s: AnsiString);
  begin
    if s <> '' then
      aStream.Write(s[1], Length(s));
  end;

  procedure WriteLn(const s: string);
  begin
    Write(AnsiString(s));
    Write(#13#10);
  end;

  procedure WriteHeader;
  begin
    WriteLn('# OBJ-File exported by GLScene');
    WriteLn('');
  end;

  procedure WriteVertices;
  var
    s: string;
    j, i, n: integer;
  begin
    n := 0;
    for j := 0 to Owner.MeshObjects.Count - 1 do
    begin
      Writeln(Format('# Mesh %d', [j + 1]));
      with Owner.MeshObjects[j].Vertices do
      begin
        for i := 0 to Count - 1 do
        begin
          s := Format('v %g %g %g', [List^[i][0], List^[i][1], List^[i][2]]);
          Writeln(s);
        end;
        Inc(n, Count);
      end;
    end;
    WriteLn(Format('# %d Vertices', [n]));
    WriteLn('');
  end;

  procedure WriteNormals;
  var
    s: string;
    j, i, n: integer;
  begin
    n := 0;
    for j := 0 to Owner.MeshObjects.Count - 1 do
    begin
      Writeln(Format('# Mesh %d', [j + 1]));
      with Owner.MeshObjects[j].Normals do
      begin
        for i := 0 to Count - 1 do
        begin
          s := Format('vn %g %g %g', [List^[i][0], List^[i][1], List^[i][2]]);
          Writeln(s);
        end;
        Inc(n, Count);
      end;
    end;
    WriteLn(Format('# %d Normals', [n]));
    WriteLn('');
  end;

  procedure WriteTexCoords;
  var
    s: string;
    j, i, n: integer;
  begin
    n := 0;
    for j := 0 to Owner.MeshObjects.Count - 1 do
    begin
      Writeln(Format('# Mesh %d', [j + 1]));
      with Owner.MeshObjects[j].TexCoords do
      begin
        for i := 0 to Count - 1 do
        begin
          s := Format('vt %g %g', [List^[i][0], List^[i][1]]);
          Writeln(s);
        end;
        Inc(n, Count);
      end;
    end;
    WriteLn(Format('# %d Texture-Coordinates', [n]));
    WriteLn('');
  end;

  procedure WriteOBJFaceGroup(aFaceGroup: TOBJFGVertexNormalTexIndexList; o: Integer = 0);
  var
    vIdx, nIdx, tIdx: integer;
    i, Index, Polygon: integer;
    Line, t: string;
  begin
    with aFaceGroup do
    begin
      Index := 0;
      for Polygon := 0 to PolygonVertices.Count - 1 do
      begin
        Line := 'f ';
        for i := 1 to PolygonVertices[Polygon] do
        begin
          vIdx := VertexIndices[Index] + 1 + o;
          nIdx := NormalIndices[Index] + 1 + o;
          tIdx := TexCoordIndices[Index] + 1 + o;
          t := IntToStr(vIdx) + '/';
          if tIdx = -1 then
            t := t + '/'
          else
            t := t + IntToStr(tIdx) + '/';
          if nIdx = -1 then
            t := t + '/'
          else
            t := t + IntToStr(nIdx) + '/';
          Line := Line + Copy(t, 1, length(t) - 1) + ' ';
          inc(Index);
        end;
        Writeln(Line);
      end;
    end;
    Writeln('');
  end;

  procedure WriteVertexIndexList(fg: TFGVertexIndexList; o: Integer = 0);
  var
    i, n: Integer;
  begin
    case fg.Mode of
      fgmmTriangles:
        begin
          n := fg.VertexIndices.Count - 3;
          i := 0;
          while i <= n do
          begin
            Writeln(Format('f %d/%0:d %d/%1:d %d/%2:d',
              [fg.VertexIndices[i] + 1 + o,
              fg.VertexIndices[i + 1] + 1 + o,
                fg.VertexIndices[i + 2] + 1 + o]));
            Inc(i, 3);
          end;
        end;
      fgmmTriangleFan:
        begin
          Write('f ');
          n := fg.VertexIndices.Count - 1;
          i := 0;
          while i <= n do
          begin
            if i < n then
              Write(AnsiString(Format('%d/%0:d ', [fg.VertexIndices[i] + 1 + o])))
            else
              Writeln(Format('%d/%0:d', [fg.VertexIndices[i] + 1 + o]));
            Inc(i);
          end;
        end;
      fgmmTriangleStrip:
        begin
          n := fg.VertexIndices.Count - 3;
          i := 0;
          while i <= n do
          begin
            Writeln(Format('f %d/%0:d %d/%1:d %d/%2:d',
              [fg.VertexIndices[i] + 1 + o,
              fg.VertexIndices[i + 1] + 1 + o,
                fg.VertexIndices[i + 2] + 1 + o]));

            Inc(i);
          end;
        end;
    end;
  end;

  procedure WriteFaceGroups;
  var
    j, i, k: Integer;
    fg: TFaceGroup;
    MoName: string;
  begin
    k := 0;
    for j := 0 to Owner.MeshObjects.Count - 1 do
    begin
      MoName := Owner.MeshObjects[j].Name;
      if MoName = '' then
        MoName := Format('Mesh%d', [j + 1]);
      Writeln('g ' + MoName);
      for i := 0 to Owner.MeshObjects[j].FaceGroups.Count - 1 do
      begin
        Writeln(Format('s %d', [i + 1]));
        fg := Owner.MeshObjects[j].FaceGroups[i];
        if fg is TOBJFGVertexNormalTexIndexList then
          WriteOBJFaceGroup(TOBJFGVertexNormalTexIndexList(fg), k)
        else if fg is TFGVertexIndexList then
          WriteVertexIndexList(TFGVertexIndexList(fg), k)
        else
          Assert(False); //unsupported face group
      end;
      //advance vertex index offset
      Inc(k, Owner.MeshObjects[j].Vertices.Count);
    end;
  end;

begin
  Assert(Owner is TGLFreeForm, 'Can only save FreeForms.');

  OldDecimalSeparator :=
{$IFDEF GLS_DELPHI_XE_UP}
  FormatSettings.
{$ENDIF}
  DecimalSeparator;
{$IFDEF GLS_DELPHI_XE_UP}
  FormatSettings.
{$ENDIF}
  DecimalSeparator := '.';
  { Better not call anything that wants the system-locale intact
    from this block }
  try
    WriteHeader;
    WriteVertices;
    WriteNormals;
    WriteTexCoords;
    WriteFaceGroups;
  finally
{$IFDEF GLS_DELPHI_XE_UP}
  FormatSettings.
{$ENDIF}
    DecimalSeparator := OldDecimalSeparator;
  end;
end;

// ------------------
// ------------------ TGLMTLFile ------------------
// ------------------

// Prepare
//

procedure TGLMTLFile.Prepare;
var
  i: Integer;
  buf: string;
begin
  // "standardize" the mtl file lines
  for i := Count - 1 downto 0 do
  begin
    buf := UpperCase(Trim(Strings[i]));
    if (buf = '') or CharInSet(buf[1], ['#', '$']) then
      Delete(i)
    else
    begin
      Strings[i] := StringReplace(buf, #9, #32, [rfIgnoreCase]);
    end;
  end;
end;

// MaterialStringProperty
//

function TGLMTLFile.MaterialStringProperty(const materialName, propertyName: string): string;
var
  i, n: Integer;
  buf, line: string;
begin
  buf := 'NEWMTL ' + UpperCase(materialName);
  i := IndexOf(buf);
  if i >= 0 then
  begin
    buf := UpperCase(propertyName) + ' ';
    n := Length(buf);
    Inc(i);
    while i < Count do
    begin
      line := Strings[i];
      if Copy(line, 1, 7) = 'NEWMTL ' then
        Break;
      if Copy(line, 1, n) = buf then
      begin
        Result := Copy(Strings[i], n + 1, MaxInt);
        Exit;
      end;
      Inc(i);
    end;
  end;
  Result := '';
end;

// MaterialVectorProperty
//

function TGLMTLFile.MaterialVectorProperty(const materialName, propertyName: string;
  const defaultValue: TVector): TVector;
var
  i: Integer;
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.CommaText := MaterialStringProperty(materialName, propertyName);
    if sl.Count > 0 then
    begin
      Result := NullHmgVector;
      for i := 0 to 3 do
        if sl.Count > i then
          Result[i] := GLUtils.StrToFloatDef(sl[i], 0)
        else
          Break;
    end
    else
      Result := defaultValue;
  finally
    sl.Free;
  end;
end;

{$IFDEF GLS_EXPERIMENTAL}
class procedure TGLMeshOBJFileIO.LoadFromStream(AStream: TStream; ABuilder: TGLAbstractMeshBuilder);

  var
    Buffer: AnsiString; { Buffer }
    Line: string; { current line }
    LineNo: Integer; { current Line number - for error messages }
    Eof: Boolean; { Stream done? }
    BufPos: Integer; { Position in the buffer }

    PositionList, NormalList, TexCoordList: T4ByteList;
    PositionType, NormalType, TexCoordType: TGLSLDataType;
    PositionIndices, NormalIndices, TexCoordIndices: TIntegerList;

    command: string;

{$REGION 'Subroutines'}
  procedure ReadLine;
  var
    j: Integer;

    procedure FillBuffer;
    var
      l: Integer;
    begin
      l := AStream.Size - AStream.Position;
      if l > BufSize then
        l := BufSize;
      SetLength(Buffer, l);
      AStream.Read(Buffer[1], l);
      BufPos := 1;
    end;

  begin
    Inc(LineNo);

    if BufPos < 1 then
      FillBuffer;

    j := 1;
    while True do
    begin
      if BufPos > Length(Buffer) then
      begin
        if StreamEof(AStream) then
        begin
          Eof := True;
          break;
        end
        else
          FillBuffer
      end
      else
      begin
        case Buffer[BufPos] of
          #10, #13:
            begin
              Inc(BufPos);
              if BufPos > Length(Buffer) then
                if StreamEof(AStream) then
                  break
                else
                  FillBuffer;
              if (Buffer[BufPos] = #10) or (Buffer[BufPos] = #13) then
                Inc(BufPos);
              break;
            end;
        else
          if j > Length(Line) then
            SetLength(Line, Length(Line) + LineLen);
          if Buffer[BufPos] = #9 then
            Line[j] := #32
          else
            Line[j] := Char(Buffer[BufPos]);
          Inc(BufPos);
          Inc(j);
        end;
      end;
    end;

    SetLength(Line, j - 1);
  end;

  procedure AddFaceVertex(FaceVertices: string);

    function GetIndex(Count: Integer): Integer;
    var
      s: string;
    begin
      s := NextToken(FaceVertices, '/');
      Result := StrToIntDef(s, 0);
      if Result = 0 then
        Result := -1 // Missing
      else if Result < 0 then
      begin
        { Relative, make absolute. "-1" means last, "-2" second last. }
        Result := Count + Result
      end
      else
      begin
        { Absolute, correct for zero-base. }
        Dec(Result);
      end;
    end;

  var
    pIdx, tIdx, nIdx: Integer;
  begin
    pIdx := GetIndex(PositionList.Count);
    tIdx := GetIndex(NormalList.Count);
    nIdx := GetIndex(TexCoordList.Count);
    PositionIndices.Add(pIdx);
    NormalIndices.Add(nIdx);
    TexCoordIndices.Add(tIdx);
  end;

  procedure ReadFace;
  var
    faceVertices: string;
  begin
    if Line <> '' then
    begin
      while Line <> '' do
      begin
        faceVertices := NextToken(Line, ' ');
        AddFaceVertex(faceVertices);
      end;
    end;
  end;

  procedure ReadVector(AList: T4ByteList; var AType: TGLSLDataType);
    { Read a vector with a maximum of 4 elements from the current line. }
  var
    i, err: Integer;
    f: string;
    r: Single;
  begin
    i := 0;
    while (Line <> '') and (i < 4) do
    begin
      f := NextToken(Line, ' ');
      Val(f, r, err);
      if err <> 0 then
      begin
        GLSLogger.LogError(Format('%s: "%s" is not a valid floating-point constant.', [Self.UnitName, f]));
        r := 0.0;
      end;
      AList.Add(r);
      Inc(i);
    end;
    if AType = GLSLTypeUndefined then
      case i of
        1: AType := GLSLType1f;
        2: AType := GLSLType2f;
        3: AType := GLSLType3f;
        4: AType := GLSLType4f;
      end;
  end;

  var
    I: Integer;

  procedure AddAttribute(const Attr: TGLSLAttribute; ASource: T4ByteList; AType: TGLSLDataType; IndicesList: TIntegerList);
  var
    Index: Integer;
    nNormal: TAffineVector;
  begin
    if I < IndicesList.Count then
      Index := IndicesList[I]
    else
      Index := -1;

    if Index > -1 then
      case AType of
        GLSLType1F:
        begin
          ABuilder.Attribute1f(Attr,
            ASource[Index].Float.Value);
        end;
        GLSLType2F:
        begin
          Index := 2*Index;
          ABuilder.Attribute2f(Attr,
            ASource[Index+0].Float.Value,
            ASource[Index+1].Float.Value);
        end;
        GLSLType3F:
        begin
          Index := 3*Index;
          nNormal := AffineVectorMake(
            ASource[Index+0].Float.Value,
            ASource[Index+1].Float.Value,
            ASource[Index+2].Float.Value);
          if Attr = attrNormal then
            NormalizeVector(nNormal);
          ABuilder.Attribute3f(Attr, nNormal);
        end;
        GLSLType4F:
        begin
          Index := 4*Index;
          ABuilder.Attribute4f(Attr,
            ASource[Index+0].Float.Value,
            ASource[Index+1].Float.Value,
            ASource[Index+2].Float.Value,
            ASource[Index+3].Float.Value);
        end;
    end
    else
      case AType of
        GLSLType1F: ABuilder.Attribute1f(Attr, 0.0);
        GLSLType2F: ABuilder.Attribute2f(Attr, 0.0, 0.0);
        GLSLType3F: ABuilder.Attribute3f(Attr, 0.0, 0.0, 0.0);
        GLSLType4F: ABuilder.Attribute4f(Attr, 0.0, 0.0, 0.0, 0.0);
      end;
  end;

  procedure FreeLists;
  begin
    PositionList.Destroy;
    NormalList.Destroy;
    TexCoordList.Destroy;
    PositionIndices.Destroy;
    NormalIndices.Destroy;
    TexCoordIndices.Destroy;
  end;

  {$ENDREGION}

begin
  Eof := False;
  LineNo := 0;

  PositionList := T4ByteList.Create;
  NormalList := T4ByteList.Create;
  TexCoordList := T4ByteList.Create;
  PositionType := GLSLTypeUndefined;
  NormalType := GLSLTypeUndefined;
  TexCoordType := GLSLTypeUndefined;
  PositionIndices := TIntegerList.Create;
  NormalIndices := TIntegerList.Create;
  TexCoordIndices := TIntegerList.Create;

  try
    ABuilder.BeginMeshAssembly;
    ABuilder.Clear;

    while not Eof do
    begin
      ReadLine;
      if Line = '' then
        Continue; { Skip blank line }
      if CharInSet(Line[1], ['#', '$']) then
        Continue; { Skip comment and alternate comment }

      command := AnsiUpperCase(NextToken(Line, ' '));

      if command = 'V' then
      begin
        ReadVector(PositionList, PositionType);
      end
      else if command = 'VT' then
      begin
        ReadVector(TexCoordList, TexCoordType);
      end
      else if command = 'VN' then
      begin
        ReadVector(NormalList, NormalType);
      end
      else if command = 'VP' then
      begin
        { Parameter Space Vertex: Ignore }
      end
      else if command = 'G' then
      begin
        //Skip
      end
      else if command = 'F' then
      begin
        ReadFace;
      end
      else if command = 'O' then
      begin
        { Object Name:  Ignore }
      end
      else if command = 'MTLLIB' then
      begin
        //Skip
      end
      else if command = 'USEMTL' then
      begin
        //Skip
      end
      else if command = 'S' then
      begin
        //Skip
      end
      else if command = 'T' then
      begin
//        ReadTriangleStrip;
      end
      else if command = 'Q' then
      begin
//        ReadTriangleStripContinued;
      end
      else
        GLSLogger.LogError(Self.UnitName+ ': unsupported Command "' + command + '"');
    end;
    if PositionType <> GLSLTypeUndefined then
      ABuilder.DeclareAttribute(attrPosition, PositionType);
    if NormalType <> GLSLTypeUndefined then
      ABuilder.DeclareAttribute(attrNormal, NormalType);
    if TexCoordType <> GLSLTypeUndefined then
      ABuilder.DeclareAttribute(attrTexCoord0, TexCoordType);

    ABuilder.BeginBatch(mpTRIANGLES);
    for I := 0 to PositionIndices.Count - 1 do
    begin
      AddAttribute(attrPosition, PositionList, PositionType, PositionIndices);
      AddAttribute(attrNormal, NormalList, NormalType, NormalIndices);
      AddAttribute(attrTexCoord0, TexCoordList, TexCoordType, TexCoordIndices);
      ABuilder.EmitVertex;
    end;
    ABuilder.EndBatch;

    ABuilder.WeldVertices;
    ABuilder.EndMeshAssembly;
    FreeLists;
  except
    FreeLists;
    ABuilder.Clear;
    ABuilder.EndMeshAssembly;
    raise;
  end;
end;

{$ENDIF GLS_EXPERIMENTAL}

initialization

  { Register this Fileformat-Handler with GLScene }
  GLVectorFileObjects.RegisterVectorFileFormat('obj', 'WaveFront model file', TGLOBJVectorFile);
  GLVectorFileObjects.RegisterVectorFileFormat('objf', 'Stripe model file', TGLOBJVectorFile);
  RegisterClass(TOBJFGVertexNormalTexIndexList);

{$IFDEF GLS_EXPERIMENTAL}
  GL3xMesh.RegisterVectorFileFormat('obj', 'WaveFront model file', TGLMeshOBJFileIO);
{$ENDIF GLS_EXPERIMENTAL}

end.

