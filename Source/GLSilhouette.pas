// GLSilhouette
{: Enhanced silhouette classes.<p>

   Introduces more evolved/specific silhouette generation and management
   classes.<p>

   CAUTION : both connectivity classes leak memory.<p>

	<b>History : </b><font size=-1><ul>
      <li>19/06/03 - MF - Split up Connectivity classes
      <li>10/06/03 - EG - Creation (based on code from Mattias Fagerlund)
   </ul></font>
}
unit GLSilhouette;

interface

uses Classes, GLMisc, Geometry, VectorLists;

type

   // TGLSilhouette
   //
   {: Base mesh-oriented silhouette class.<p>
      This class introduces helper methods for constructing the indexed
      vertices sets for the silhouette and the cap. }
   TGLSilhouette = class (TGLBaseSilhouette)
      private
         { Private Declarations }

      protected
         { Protected Declarations }

      public
         {: Adds an edge (two vertices) to the silhouette.<p>
            If TightButSlow is true, no vertices will be doubled in the
            silhouette list. This should only be used when creating re-usable
            silhouettes, because it's much slower. }
         procedure AddEdgeToSilhouette(const v0, v1 : TAffineVector;
                                       tightButSlow : Boolean);
         procedure AddIndexedEdgeToSilhouette(const Vi0, Vi1 : integer);

         {: Adds a capping triangle to the silhouette.<p>
            If TightButSlow is true, no vertices will be doubled in the
            silhouette list. This should only be used when creating re-usable
            silhouettes, because it's much slower. }
         procedure AddCapToSilhouette(const v0, v1, v2 : TAffineVector;
                                      tightButSlow : Boolean);

         procedure AddIndexedCapToSilhouette(const vi0, vi1, vi2 : Integer);
   end;

   // TBaseConnectivity
   //
   TBaseConnectivity = class
       protected
          FPrecomputeFaceNormal: boolean;

          function GetEdgeCount: integer; virtual;
          function GetFaceCount: integer; virtual;
       public
          property EdgeCount : integer read GetEdgeCount;
          property FaceCount : integer read GetFaceCount;

          property PrecomputeFaceNormal : boolean read FPrecomputeFaceNormal;
          procedure CreateSilhouette(const silhouetteParameters : TGLSilhouetteParameters; var aSilhouette : TGLSilhouette; AddToSilhouette : boolean); virtual;

          constructor Create(PrecomputeFaceNormal : boolean); virtual;
   end;

   // TConnectivity
   //
   TConnectivity = class(TBaseConnectivity)
       protected
          { All storage of faces and adges are cut up into tiny pieces for a reason,
          it'd be nicer with Structs or classes, but it's actually faster this way.
          The reason it's faster is because of less cache overwrites when we only
          access a tiny bit of a triangle (for instance), not all data.}
          FEdgeVertices : TIntegerList;
          FEdgeFaces : TIntegerList;

          FFaceVisible : TIntegerList;

          FFaceVertexIndex : TIntegerList;

          FFaceNormal : TAffineVectorList;

          FVertexMemory : TIntegerList;

          FVertices : TAffineVectorList;

          function GetEdgeCount: integer; override;
          function GetFaceCount: integer; override;

          function ReuseOrFindVertexID(SeenFrom : TAffineVector; aSilhouette: TGLSilhouette;
            Index: integer): integer;
       public
          {: Clears out all connectivity information. }
          procedure Clear; virtual;

          procedure CreateSilhouette(const silhouetteParameters : TGLSilhouetteParameters; var aSilhouette : TGLSilhouette; AddToSilhouette : boolean); override;

          function AddIndexedEdge(VertexIndex0, VertexIndex1 : integer; FaceID: integer) : integer;
          function AddIndexedFace(Vi0, Vi1, Vi2 : integer) : integer;

          function AddFace(Vertex0, Vertex1, Vertex2 : TAffineVector) : integer;
          function AddQuad(Vertex0, Vertex1, Vertex2, Vertex3 : TAffineVector) : integer;

          property EdgeCount : integer read GetEdgeCount;
          property FaceCount : integer read GetFaceCount;

          constructor Create(PrecomputeFaceNormal : boolean); override;
          destructor Destroy; override;
   end;

//-------------------------------------------------------------
//-------------------------------------------------------------
//-------------------------------------------------------------
implementation
//-------------------------------------------------------------
//-------------------------------------------------------------
//-------------------------------------------------------------

uses SysUtils;

// ------------------
// ------------------ TGLSilhouette ------------------
// ------------------

// AddEdgeToSilhouette
//
procedure TGLSilhouette.AddEdgeToSilhouette(const v0, v1 : TAffineVector;
                                            tightButSlow : Boolean);
begin
   if tightButSlow then
      Indices.Add(Vertices.FindOrAddPoint(v0),
                  Vertices.FindOrAddPoint(v1))
   else Indices.Add(Vertices.Add(v0, 1),
                    Vertices.Add(v1, 1));
end;

// AddIndexedEdgeToSilhouette
//
procedure TGLSilhouette.AddIndexedEdgeToSilhouette(const Vi0, Vi1 : integer);

begin
   Indices.Add(Vi0, Vi1);
end;

// AddCapToSilhouette
//
procedure TGLSilhouette.AddCapToSilhouette(const v0, v1, v2 : TAffineVector;
                                           tightButSlow : Boolean);
begin
   if tightButSlow then
      CapIndices.Add(Vertices.FindOrAddPoint(v0),
                     Vertices.FindOrAddPoint(v1),
                     Vertices.FindOrAddPoint(v2))
   else CapIndices.Add(Vertices.Add(v0, 1),
                       Vertices.Add(v1, 1),
                       Vertices.Add(v2, 1));
end;

// AddIndexedCapToSilhouette
//
procedure TGLSilhouette.AddIndexedCapToSilhouette(const vi0, vi1, vi2 : Integer);
begin
  CapIndices.Add(vi0, vi1, vi2);
end;

// ------------------
// ------------------ TBaseConnectivity ------------------
// ------------------

{ TBaseConnectivity }

constructor TBaseConnectivity.Create(PrecomputeFaceNormal: boolean);
begin
  FPrecomputeFaceNormal := PrecomputeFaceNormal;
end;

procedure TBaseConnectivity.CreateSilhouette(const silhouetteParameters : TGLSilhouetteParameters; var aSilhouette : TGLSilhouette; AddToSilhouette : boolean);
begin
  // Purely virtual!
end;

// ------------------
// ------------------ TConnectivity ------------------
// ------------------

function TBaseConnectivity.GetEdgeCount: integer;
begin
  result := 0;
end;

function TBaseConnectivity.GetFaceCount: integer;
begin
  result := 0;
end;

{ TConnectivity }

constructor TConnectivity.Create(PrecomputeFaceNormal : boolean);
begin
  FFaceVisible := TIntegerList.Create;

  FFaceVertexIndex := TIntegerList.Create;
  FFaceNormal := TAffineVectorList.Create;

  FEdgeVertices := TIntegerList.Create;
  FEdgeFaces := TIntegerList.Create;

  FPrecomputeFaceNormal := PrecomputeFaceNormal;

  FVertexMemory := TIntegerList.Create;

  FVertices := TAffineVectorList.Create;
end;

destructor TConnectivity.Destroy;
begin
  Clear;

  FFaceVisible.Free;
  FFaceVertexIndex.Free;
  FFaceNormal.Free;

  FEdgeVertices.Free;
  FEdgeFaces.Free;

  FVertexMemory.Free;

  if Assigned(FVertices) then
    FVertices.Free;

  inherited;
end;

procedure TConnectivity.Clear;
begin
  FEdgeVertices.Clear;
  FEdgeFaces.Clear;
  FFaceVisible.Clear;
  FFaceVertexIndex.Clear;
  FFaceNormal.Clear;
  FVertexMemory.Clear;

  if FVertices<>nil then
    FVertices.Clear;
end;

procedure TConnectivity.CreateSilhouette(
  const silhouetteParameters : TGLSilhouetteParameters;
  var aSilhouette : TGLSilhouette; AddToSilhouette : boolean);
var
  i : integer;
  V0, V1, V2 : TAffineVector;
  Vi0, Vi1, Vi2 : integer;
  tVi0, tVi1, tVi2 : integer;
  FaceNormal : TAffineVector;

  dot : single;

  Face0ID, Face1ID : integer;
begin
  if aSilhouette=nil then
    aSilhouette:=TGLSilhouette.Create;

  if not AddToSilhouette then
    aSilhouette.Flush;

  // Clear the vertex memory
  FVertexMemory.Flush;

  // Update visibility information for all Faces
  for i := 0 to FaceCount-1 do
  begin
    // Retrieve the vertex indices
    Vi0 := FFaceVertexIndex[i * 3 + 0];
    Vi1 := FFaceVertexIndex[i * 3 + 1];
    Vi2 := FFaceVertexIndex[i * 3 + 2];

    V0 := FVertices[Vi0];

    if FPrecomputeFaceNormal then
      FaceNormal := FFaceNormal[i]
    else
    begin
      // Retrieve the last vertices
      V1 := FVertices[Vi1];
      V2 := FVertices[Vi2];

      FaceNormal :=
        CalcPlaneNormal(V0, V1, V2);
    end;

    dot := PointProject(silhouetteParameters.SeenFrom, V0, FaceNormal);

    if (dot>=0) then
      FFaceVisible[i] := 1
    else
      FFaceVisible[i] := 0;

    if silhouetteParameters.CappingRequired and (dot<0) then
    begin
      tVi0 := ReuseOrFindVertexID(silhouetteParameters.SeenFrom, aSilhouette, Vi0);
      tVi1 := ReuseOrFindVertexID(silhouetteParameters.SeenFrom, aSilhouette, Vi1);
      tVi2 := ReuseOrFindVertexID(silhouetteParameters.SeenFrom, aSilhouette, Vi2);

      aSilhouette.CapIndices.Add(tVi0, tVi1, tVi2);
    end;
  end;

  for i := 0 to EdgeCount-1 do
  begin
    Face0ID := FEdgeFaces[i * 2 + 0];
    Face1ID := FEdgeFaces[i * 2 + 1];//}

    if (Face1ID = -1) or (FFaceVisible[Face0ID] <> FFaceVisible[Face1ID]) then
    begin
      // Retrieve the two vertice values add add them to the Silhouette list
      Vi0 := FEdgeVertices[i*2 + 0];
      Vi1 := FEdgeVertices[i*2 + 1];

      // In this moment, we _know_ what vertex id the vertex had in the old
      // mesh. We can remember this information and re-use it for a speedup
      if (FFaceVisible[Face0ID]=0) then
      begin
        tVi0 := ReuseOrFindVertexID(silhouetteParameters.SeenFrom, aSilhouette, Vi0);
        tVi1 := ReuseOrFindVertexID(silhouetteParameters.SeenFrom, aSilhouette, Vi1);

        aSilhouette.Indices.Add(tVi0, tVi1);
      end
      else
        if Face1ID>-1 then
        begin
          tVi0 := ReuseOrFindVertexID(silhouetteParameters.SeenFrom, aSilhouette, Vi0);
          tVi1 := ReuseOrFindVertexID(silhouetteParameters.SeenFrom, aSilhouette, Vi1);

          aSilhouette.Indices.Add(tVi1, tVi0);
        end;
    end;
  end;
end;

function TConnectivity.GetEdgeCount: integer;
begin
  result := FEdgeVertices.Count div 2;
end;

function TConnectivity.GetFaceCount: integer;
begin
  result := FFaceVisible.Count;
end;

function TConnectivity.ReuseOrFindVertexID(
  SeenFrom: TAffineVector; aSilhouette: TGLSilhouette;
  Index: integer): integer;
var
  MemIndex, i : integer;
  Vertex : TAffineVector;
  OldCount  : integer;
  List : PIntegerArray;
begin
  // DUMBO VERSION
  // LScene generates;
  //
  // Non capped 146 fps
  // 500 runs = 560,12 ms => 1,12 ms / run
  // aSilhouette.Count=807, vertices=1614
  //
  // Capped 75 fps
  // 500 runs = 1385,33 ms => 2,77 ms / run
  // aSilhouette.Count=807, vertices=10191
  {Vertex := FMeshObject.Owner.Owner.LocalToAbsolute(FMeshObject.Vertices[Index]);
  result := aSilhouette.FVertices.Add(Vertex);
  VertexFar := VectorAdd(Vertex, VectorScale(VectorSubtract(Vertex, SeenFrom), cEXTRUDE_LENGTH));
  aSilhouette.FVertices.Add(VertexFar);
  exit;//}

  // SMARTO VERSION

  //  LScene generates;
  //
  //  Non capped 146 fps
  //  500 runs = 630,06 ms => 1,26 ms / run
  //  aSilhouette.Count=807, vertices=807
  //
  //  Capped 88 fps
  //  500 runs = 1013,29 ms => 2,03 ms / run
  //  aSilhouette.Count=807, vertices=1873
  if Index>=FVertexMemory.Count then
  begin
    OldCount := FVertexMemory.Count;
    FVertexMemory.Count := Index+1;

    List := FVertexMemory.List;
    for i := OldCount to FVertexMemory.Count-1 do
      List[i] := -1;
  end;//}

  MemIndex := FVertexMemory[Index];

  if MemIndex=-1 then
  begin
    // Add the "near" vertex
    Vertex := FVertices[Index];
    MemIndex := aSilhouette.Vertices.Add(Vertex, 1);

    FVertexMemory[Index] := MemIndex;
    result := MemIndex;
  end else
    result := MemIndex;//}
end;

function TConnectivity.AddIndexedEdge(VertexIndex0,
  VertexIndex1: integer; FaceID: integer) : integer;
var
  i : integer;
  EdgeVi0, EdgeVi1 : integer;
begin
  // Make sure that the edge doesn't already exists
  for i := 0 to EdgeCount-1 do begin
    // Retrieve the two vertices in the edge
    EdgeVi0 := FEdgeVertices[i*2 + 0];
    EdgeVi1 := FEdgeVertices[i*2 + 1];

    if ((EdgeVi0 = VertexIndex0) and (EdgeVi1 = VertexIndex1)) or
       ((EdgeVi0 = VertexIndex1) and (EdgeVi1 = VertexIndex0)) then begin
      // Update the second Face of the edge and we're done (this _MAY_
      // overwrite a previous Face in a broken mesh)
      FEdgeFaces[i*2 + 1] := FaceID;
      Result:=i*2+1;
      exit;
    end;
  end;

  // No edge was found, create a new one
  FEdgeVertices.Add(VertexIndex0);
  FEdgeVertices.Add(VertexIndex1);

  FEdgeFaces.Add(FaceID);
  FEdgeFaces.Add(-1);

  result := EdgeCount-1;
end;

function TConnectivity.AddIndexedFace(Vi0, Vi1, Vi2: integer) : integer;
var
  FaceID : integer;
  V0, V1, V2 : TAffineVector;
begin
  FFaceVertexIndex.Add(Vi0);
  FFaceVertexIndex.Add(Vi1);
  FFaceVertexIndex.Add(Vi2);

  V0 := FVertices[Vi0];
  V1 := FVertices[Vi1];
  V2 := FVertices[Vi2];

  if FPrecomputeFaceNormal then
    FFaceNormal.Add(CalcPlaneNormal(V0, V1, V2));

  FaceID := FFaceVisible.Add(0);

  AddIndexedEdge(Vi0, Vi1, FaceID);
  AddIndexedEdge(Vi1, Vi2, FaceID);
  AddIndexedEdge(Vi2, Vi0, FaceID);//}

  result := FaceID;
end;

function TConnectivity.AddFace(Vertex0, Vertex1, Vertex2: TAffineVector) : integer;
var
  Vi0, Vi1, Vi2 : integer;
begin
  Vi0 := FVertices.FindOrAdd(Vertex0);
  Vi1 := FVertices.FindOrAdd(Vertex1);
  Vi2 := FVertices.FindOrAdd(Vertex2);

  result := AddIndexedFace(Vi0, Vi1, Vi2);
end;

function TConnectivity.AddQuad(Vertex0, Vertex1, Vertex2,
  Vertex3: TAffineVector): integer;
var
  Vi0, Vi1, Vi2, Vi3 : integer;
begin
  Vi0 := FVertices.FindOrAdd(Vertex0);
  Vi1 := FVertices.FindOrAdd(Vertex1);
  Vi2 := FVertices.FindOrAdd(Vertex2);
  Vi3 := FVertices.FindOrAdd(Vertex3);

  // First face
  result := AddIndexedFace(Vi0, Vi1, Vi2);

  // Second face
  AddIndexedFace(Vi2, Vi3, Vi0);
end;
end.
