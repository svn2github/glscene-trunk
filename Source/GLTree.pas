// GLTree
{: Dynamic tree generation in GLScene<p>

   This code was adapted from the nVidia Tree Demo:
   http://developer.nvidia.com/object/Procedural_Tree.html<p>

   History:<ul>
     <li>24/11/03 - SG - Creation.
   </ul>
}
unit GLTree;

interface

uses
  Classes, SysUtils, GLScene, GLTexture, VectorGeometry, VectorLists,
  OpenGL1x, GLMisc, GLVectorFileObjects, ApplicationFileIO;

type
  TGLTree = class;
  TGLTreeBranches = class;
  TGLTreeBranchNoise = class;

  TGLTreeLeaves = class
    private
      FOwner : TGLTree;
      FCount : Integer;
      FVertices,
      FNormals,
      FTexCoords : TAffineVectorList;

    public
      constructor Create(AOwner : TGLTree);
      destructor Destroy; override;
      procedure BuildList(var rci : TRenderContextInfo);
      procedure AddNew(Matrix : TMatrix);
      procedure Clear;

      property Owner : TGLTree read FOwner;
      property Count : Integer read FCount;
      property Vertices : TAffineVectorList read FVertices;
      property Normals : TAffineVectorList read FNormals;
      property TexCoords : TAffineVectorList read FTexCoords;
  end;

  TGLTreeBranch = class
    private
      FOwner : TGLTreeBranches;
      FLeft,
      FRight,
      FParent : TGLTreeBranch;
      FBranchID,
      FParentID : Integer;
      FMatrix : TMatrix;
      FLower,
      FUpper : TIntegerList;
      FCentralLeader : Boolean;

      procedure BuildBranch(
        BranchNoise : TGLTreeBranchNoise; Matrix : TMatrix;
        TexCoordY, Twist : Single; Level : Integer);

    public
      constructor Create(AOwner : TGLTreeBranches; AParent : TGLTreeBranch);
      destructor Destroy; override;

      property Owner : TGLTreeBranches read FOwner;
      property Left : TGLTreeBranch read FLeft;
      property Right : TGLTreeBranch read FRight;
      property Parent : TGLTreeBranch read FParent;
      property Matrix : TMatrix read FMatrix;
      property Lower : TIntegerList read FLower;
      property Upper : TIntegerList read FUpper;
  end;

  TGLTreeBranches = class
    private
      FOwner : TGLTree;
      FSinList,
      FCosList : TSingleList;
      FVertices,
      FNormals,
      FTexCoords : TAffineVectorList;
      FIndices : TIntegerList;
      FRoot : TGLTreeBranch;
      FCount : Integer;
      FBranchCache : TList;
      FBranchIndices : TIntegerList;
      procedure BuildBranches;

    public
      constructor Create(AOwner : TGLTree);
      destructor Destroy; override;
      procedure BuildList(var rci : TRenderContextInfo);
      procedure Clear;

      property Owner : TGLTree read FOwner;
      property SinList : TSingleList read FSinList;
      property CosList : TSingleList read FCosList;
      property Vertices : TAffineVectorList read FVertices;
      property Normals : TAffineVectorList read FNormals;
      property TexCoords : TAffineVectorList read FTexCoords;
      property Count : Integer read FCount;
  end;

  TGLTreeBranchNoise = class
    private
      FBranchNoise : Single;
      FLeft,
      FRight : TGLTreeBranchNoise;
      function GetLeft : TGLTreeBranchNoise;
      function GetRight : TGLTreeBranchNoise;
    public
      constructor Create;
      destructor Destroy; override;
      property Left : TGLTreeBranchNoise read GetLeft;
      property Right : TGLTreeBranchNoise read GetRight;
      property BranchNoise : Single read FBranchNoise;
  end;

   // TGLTree
   //
   TGLTree = class (TGLImmaterialSceneObject)
      private
         { Private Declarations }
         FDepth : Integer;
         FBranchFacets : Integer;
         FLeafSize : Single;
         FBranchSize : Single;
         FBranchNoise : Single;
         FBranchAngleBias : Single;
         FBranchAngle : Single;
         FBranchTwist : Single;
         FBranchRadius : Single;
         FLeafThreshold : Single;
         FCentralLeaderBias : Single;
         FCentralLeader : Boolean;
         FSeed : Integer;

         FLeaves : TGLTreeLeaves;
         FBranches : TGLTreeBranches;
         FNoise : TGLTreeBranchNoise;

         FMaterialLibrary : TGLMaterialLibrary;
         FLeafMaterialName : TGLLibMaterialName;
         FLeafMaterial : TGLLibMaterial;
         FLeafBackMaterialName : TGLLibMaterialName;
         FLeafBackMaterial : TGLLibMaterial;
         FBranchMaterialName : TGLLibMaterialName;
         FBranchMaterial : TGLLibMaterial;

         FRebuildTree : Boolean;

      protected
         { Protected Declarations }
         procedure SetDepth(const Value : Integer);
         procedure SetBranchFacets(const Value : Integer);
         procedure SetLeafSize(const Value : Single);
         procedure SetBranchSize(const Value : Single);
         procedure SetBranchNoise(const Value : Single);
         procedure SetBranchAngleBias(const Value : Single);
         procedure SetBranchAngle(const Value : Single);
         procedure SetBranchTwist(const Value : Single);
         procedure SetBranchRadius(const Value : Single);
         procedure SetLeafThreshold(const Value : Single);
         procedure SetCentralLeaderBias(const Value : Single);
         procedure SetCentralLeader(const Value : Boolean);
         procedure SetSeed(const Value : Integer);

         procedure SetMaterialLibrary(const Value : TGLMaterialLibrary);
         procedure SetLeafMaterialName(const Value : TGLLibMaterialName);
         procedure SetLeafBackMaterialName(const Value : TGLLibMaterialName);
         procedure SetBranchMaterialName(const Value : TGLLibMaterialName);

      public
         { Public Declarations }
         constructor Create(AOwner : TComponent); override;
         destructor Destroy; override;

         procedure DoRender(var rci : TRenderContextInfo;
                            renderSelf, renderChildren : Boolean); override;
         procedure BuildList(var rci : TRenderContextInfo); override;
      
         procedure BuildMesh(GLBaseMesh : TGLBaseMesh);
         procedure RebuildTree;
         procedure ForceTotalRebuild;
         procedure Clear;

         procedure LoadFromStream(aStream : TStream);
         procedure SaveToStream(aStream : TStream);
         procedure LoadFromFile(aFileName : String);
         procedure SaveToFile(aFileName : String);

         property Leaves : TGLTreeLeaves read FLeaves;
         property Branches : TGLTreeBranches read FBranches;
         property Noise : TGLTreeBranchNoise read FNoise;

      published
         { Published Declarations }
         {: The depth of tree branch recursion. }
         property Depth : Integer read FDepth write SetDepth;
         {: The number of facets for each branch in the tree. }
         property BranchFacets : Integer read FBranchFacets write SetBranchFacets;
         {: Leaf size modifier. Leaf size is also influenced by branch recursion
            scale. }
         property LeafSize : Single read FLeafSize write SetLeafSize;
         {: Branch length modifier. }
         property BranchSize : Single read FBranchSize write SetBranchSize;
         {: Overall branch noise influence. Relates to the 'fullness' of the tree. }
         property BranchNoise : Single read FBranchNoise write SetBranchNoise;
         {: Effects the habit of the tree. Values from 0 to 1 refer to Upright to
            Spreading respectively. }
         property BranchAngleBias : Single read FBranchAngleBias write SetBranchAngleBias;
         {: Effects the balance of the tree. }
         property BranchAngle : Single read FBranchAngle write SetBranchAngle;
         {: Effects the rotation of each sub branch in recursion. }
         property BranchTwist : Single read FBranchTwist write SetBranchTwist;
         {: Effects the thickness of the branches. }
         property BranchRadius : Single read FBranchRadius write SetBranchRadius;
         {: Determines how thin a branch can get before a leaf is substituted. }
         property LeafThreshold : Single read FLeafThreshold write SetLeafThreshold;
         {: Determines how BranchAngle effects the central leader (CentralLeader must = True). }
         property CentralLeaderBias : Single read FCentralLeaderBias write SetCentralLeaderBias;
         {: Does this tree have a central leader? }
         property CentralLeader : Boolean read FCentralLeader write SetCentralLeader;
         property Seed : Integer read FSeed write SetSeed;

         property MaterialLibrary : TGLMaterialLibrary read FMaterialLibrary write SetMaterialLibrary;
         property LeafMaterialName : TGLLibMaterialName read FLeafMaterialName write SetLeafMaterialName;
         property LeafBackMaterialName : TGLLibMaterialName read FLeafBackMaterialName write SetLeafBackMaterialName;
         property BranchMaterialName : TGLLibMaterialName read FBranchMaterialName write SetBranchMaterialName;
   end;

procedure Register;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
implementation
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

uses XOpenGL;

procedure Register;
begin
   RegisterClasses([TGLTree]);
end;

// -----------------------------------------------------------------------------
// TGLTreeLeaves
// -----------------------------------------------------------------------------

// Create
//
constructor TGLTreeLeaves.Create(AOwner: TGLTree);
begin
  FOwner:=AOwner;
  FCount:=0;
  FVertices:=TAffineVectorList.Create;
  FNormals:=TAffineVectorList.Create;
  FTexCoords:=TAffineVectorList.Create;
end;

// Destroy
//
destructor TGLTreeLeaves.Destroy;
begin
  FVertices.Free;
  FNormals.Free;
  FTexCoords.Free;
  inherited;
end;

// AddNew
//
procedure TGLTreeLeaves.AddNew(Matrix: TMatrix);
var
   radius : Single;
   pos : TVector;
begin
   radius:=Owner.LeafSize;
   Inc(FCount);

   pos:=Matrix[3];
   Matrix[3]:=NullHMGPoint;
   Matrix:=Roll(Matrix, FCount/10);
   NormalizeMatrix(Matrix);
   Matrix[3]:=pos;

   FVertices.Add(VectorTransform(PointMake(0, -radius, 0), Matrix));
   FVertices.Add(VectorTransform(PointMake(0, radius, 0), Matrix));
   FVertices.Add(VectorTransform(PointMake(0, radius, 2*radius), Matrix));
   FVertices.Add(VectorTransform(PointMake(0, -radius, 2*radius), Matrix));
   FNormals.Add(VectorTransform(XHmgVector, Matrix));
   FTexCoords.Add(1, 0);
   FTexCoords.Add(0, 0);
   FTexCoords.Add(0, 1);
   FTexCoords.Add(1, 1);
end;

// BuildList
//
procedure TGLTreeLeaves.BuildList(var rci: TRenderContextInfo);
var
   i : integer;
   n : TAffineVector;
begin
   if Assigned(Owner.FLeafMaterial) then
     Owner.FLeafMaterial.Apply(rci);

   glEnableClientState(GL_VERTEX_ARRAY);
   xglEnableClientState(GL_TEXTURE_COORD_ARRAY);

   glVertexPointer(3, GL_FLOAT, 0, @FVertices.List[0]);
   xglTexCoordPointer(3, GL_FLOAT, 0, @FTexCoords.List[0]);

   for i:=0 to (FVertices.Count div 4)-1 do begin
      glNormal3fv(@FNormals.List[i]);
      glDrawArrays(GL_QUADS, 4*i, 4);
   end;

   with Owner do if FLeafMaterial<>FLeafBackMaterial then begin
      if Assigned(FLeafMaterial) then
         FLeafMaterial.UnApply(rci);
      if Assigned(FLeafBackMaterial) then
         FLeafBackMaterial.Apply(rci);
   end;

   InvertGLFrontFace;
   for i:=0 to (FVertices.Count div 4)-1 do begin
      n:=VectorNegate(FNormals[i]);
      glNormal3fv(@n);
      glDrawArrays(GL_QUADS, 4*i, 4);
   end;
   InvertGLFrontFace;

   glDisableClientState(GL_VERTEX_ARRAY);
   xglDisableClientState(GL_TEXTURE_COORD_ARRAY);

   if Assigned(Owner.FLeafBackMaterial) then
      Owner.FLeafBackMaterial.UnApply(rci);
end;

// Clear
//
procedure TGLTreeLeaves.Clear;
begin
  FVertices.Clear;
  FNormals.Clear;
  FTexCoords.Clear;
  FCount:=0;
end;

// -----------------------------------------------------------------------------
// TGLTreeBranch
// -----------------------------------------------------------------------------

// Create
//
constructor TGLTreeBranch.Create(AOwner : TGLTreeBranches; AParent : TGLTreeBranch);
begin
  FOwner:=AOwner;
  FParent:=AParent;
  FUpper:=TIntegerList.Create;
  FLower:=TIntegerList.Create;
  FCentralLeader:=False;

  // Skeletal construction helpers
  if Assigned(FOwner) then begin
    FBranchID:=FOwner.Count-1;
    FOwner.FBranchCache.Add(Self);
  end else FBranchID:=-1;
  if Assigned(FParent) then FParentID:=FParent.FBranchID
  else FParentID:=-1;
end;

// Destroy
//
destructor TGLTreeBranch.Destroy;
begin
  FUpper.Free;
  FLower.Free;
  FLeft.Free;
  FRight.Free;
  inherited;
end;

// BuildBranch
//
procedure TGLTreeBranch.BuildBranch(
  BranchNoise : TGLTreeBranchNoise; Matrix : TMatrix;
  TexCoordY, Twist : Single; Level : Integer);
var
  i : Integer;
  Tree : TGLTree;
  Branches : TGLTreeBranches;
  Facets : Integer;
  t,c,s,
  Radius, LeftRadius,  RightRadius,
  BranchAngle, LeftAngle, RightAngle,
  BranchAngleBias, BranchTwist, Taper,
  LeftBranchNoiseValue, RightBranchNoiseValue : Single;
  LeftBranchNoise,
  RightBranchNoise : TGLTreeBranchNoise;
  LeftMatrix, RightMatrix : TMatrix;
  central_leader : Boolean;
begin
  Assert(Assigned(FOwner),'Incorrect use of TGLTreeBranch');
  Assert(Assigned(FOwner.FOwner),'Incorrect use of TGLTreeBranches');

  FMatrix:=Matrix;

  Branches:=FOwner;
  Tree:=FOwner.FOwner;

  Facets:=Tree.BranchFacets;
  Radius:=Tree.BranchRadius;

  FLower.Clear;
  FLower.Capacity:=Facets+1;
  FUpper.Clear;
  FUpper.Capacity:=Facets+1;

  BranchAngle:=Tree.BranchAngle;
  BranchAngleBias:=Tree.BranchAngleBias;
  BranchTwist:=Twist+Tree.BranchTwist;

  LeftBranchNoise:=BranchNoise.Left;
  RightBranchNoise:=BranchNoise.Right;

  LeftBranchNoiseValue:=((LeftBranchNoise.BranchNoise*0.3)-0.1)*Tree.BranchNoise;
  LeftRadius:=Sqrt(1-BranchAngle)+LeftBranchNoiseValue;
  LeftRadius:=ClampValue(LeftRadius,0,1);
  LeftAngle:=BranchAngle*90*BranchAngleBias;

  RightBranchNoiseValue:=((RightBranchNoise.BranchNoise*0.3)-0.1)*Tree.BranchNoise;
  RightRadius:=Sqrt(BranchAngle)+RightBranchNoiseValue;
  RightRadius:=ClampValue(RightRadius,0,1);
  RightAngle:=(1-BranchAngle)*-90*BranchAngleBias;

  Taper:=MaxFloat(LeftRadius,RightRadius);

  // Build cylinder lower
  for i:=0 to Facets do begin
    t:=1/Facets*i;
    c:=Branches.CosList[i];
    s:=Branches.SinList[i];
    Branches.Vertices.Add(VectorTransform(PointMake(c*Radius,s*Radius,Radius),Matrix));
    Branches.Normals.Add(VectorTransform(VectorMake(c,s,0),Matrix));
    Branches.TexCoords.Add(t,TexCoordY);
    FLower.Add(Branches.Vertices.Count-1);
    Branches.FBranchIndices.Add(FBranchID);
  end;

  TexCoordY:=TexCoordY+1-2*Radius;

  // Build cylinder upper
  for i:=0 to Facets do begin
    t:=1/Facets*i;
    c:=Branches.CosList[i];
    s:=Branches.SinList[i];
    Branches.Vertices.Add(VectorTransform(PointMake(c*Radius*Taper,s*Radius*Taper,1-Radius),Matrix));
    Branches.Normals.Add(VectorTransform(VectorMake(c,s,0),Matrix));
    Branches.TexCoords.Add(t,TexCoordY);
    FUpper.Add(Branches.Vertices.Count-1);
    Branches.FBranchIndices.Add(FBranchID);
  end;

  TexCoordY:=TexCoordY+2*Radius;

  // BuildMatrices
  SinCos(DegToRad(BranchTwist),s,c);

  if Level=0 then
    central_leader:=FCentralLeader
  else
    central_leader:=FParent.FCentralLeader;

  if central_leader then begin
    LeftMatrix:=MatrixMultiply(
      CreateScaleMatrix(AffineVectorMake(LeftRadius,LeftRadius,LeftRadius)),
      CreateRotationMatrix(AffineVectorMake(s,c,0),DegToRad(LeftAngle)*Tree.CentralLeaderBias));
  end else begin
    LeftMatrix:=MatrixMultiply(
      CreateScaleMatrix(AffineVectorMake(LeftRadius,LeftRadius,LeftRadius)),
      CreateRotationMatrix(AffineVectorMake(s,c,0),DegToRad(LeftAngle)));
  end;
  LeftMatrix:=MatrixMultiply(
    LeftMatrix,
    MatrixMultiply(CreateTranslationMatrix(AffineVectorMake(0,0,Tree.BranchSize*(1-LeftBranchNoiseValue))),Matrix));

  RightMatrix:=MatrixMultiply(
    CreateScaleMatrix(AffineVectorMake(RightRadius,RightRadius,RightRadius)),
    CreateRotationMatrix(AffineVectorMake(s,c,0),DegToRad(RightAngle)));
  RightMatrix:=MatrixMultiply(
    RightMatrix,
    MatrixMultiply(CreateTranslationMatrix(AffineVectorMake(0,0,Tree.BranchSize*(1-RightBranchNoiseValue))),Matrix));

  if (((Level+1)>=Tree.Depth) or (LeftRadius<Tree.LeafThreshold)) then begin
    Tree.Leaves.AddNew(LeftMatrix);
  end else begin
    Inc(Branches.FCount);
    FLeft:=TGLTreeBranch.Create(Owner,Self);
    FLeft.FCentralLeader:=central_leader and (LeftRadius>=RightRadius);
    FLeft.BuildBranch(LeftBranchNoise,LeftMatrix,TexCoordY,BranchTwist,Level+1);
  end;

  if (((Level+1)>=Tree.Depth) or (RightRadius<Tree.LeafThreshold)) then begin
    Tree.Leaves.AddNew(RightMatrix);
  end else begin
    Inc(Branches.FCount);
    FRight:=TGLTreeBranch.Create(Owner,Self);
    FRight.BuildBranch(RightBranchNoise,RightMatrix,TexCoordY,BranchTwist,Level+1);
  end;

  for i:=0 to Facets do begin
    Branches.FIndices.Add(Upper[i]);
    Branches.FIndices.Add(Lower[i]);
  end;

  if Assigned(FRight) then begin
    for i:=0 to Facets do begin
      Branches.FIndices.Add(Right.Lower[i]);
      Branches.FIndices.Add(Upper[i]);
    end;
  end;

  if Assigned(FLeft) then begin
    for i:=0 to Facets do begin
      Branches.FIndices.Add(Left.Lower[i]);
      Branches.FIndices.Add(Upper[i]);
    end;
  end;

end;

// -----------------------------------------------------------------------------
// TGLTreeBranches
// -----------------------------------------------------------------------------

// Create
//
constructor TGLTreeBranches.Create(AOwner: TGLTree);
begin
  FOwner:=AOwner;
  FSinList:=TSingleList.Create;
  FCosList:=TSingleList.Create;
  FVertices:=TAffineVectorList.Create;
  FNormals:=TAffineVectorList.Create;
  FTexCoords:=TAffineVectorList.Create;
  FIndices:=TIntegerList.Create;
  FBranchCache:=TList.Create;
  FBranchIndices:=TIntegerList.Create;
  FCount:=0;
end;

// Destroy
//
destructor TGLTreeBranches.Destroy;
begin
  FSinList.Free;
  FCosList.Free;
  FVertices.Free;
  FNormals.Free;
  FTexCoords.Free;
  FIndices.Free;
  FRoot.Free;
  FBranchCache.Free;
  FBranchIndices.Free;
  inherited;
end;

// BuildBranches
//
procedure TGLTreeBranches.BuildBranches;
var
  i : Integer;
  u : Single;
begin
  RandSeed:=Owner.FSeed;

  for i:=0 to Owner.BranchFacets do begin
    u:=1/Owner.BranchFacets*i;
    SinList.Add(Sin(PI*2*u));
    CosList.Add(Cos(PI*2*u));
  end;

  Inc(FCount);
  FRoot:=TGLTreeBranch.Create(Self,nil);
  FRoot.FCentralLeader:=Owner.CentralLeader;
  FRoot.BuildBranch(Owner.Noise,IdentityHMGMatrix,0,0,0);
end;

// BuildList
//
procedure TGLTreeBranches.BuildList(var rci: TRenderContextInfo);
var
   i, stride : integer;
begin
   stride:=(Owner.BranchFacets+1)*2;

   if Assigned(Owner.FBranchMaterial) then
      Owner.FBranchMaterial.Apply(rci);

   glVertexPointer(3, GL_FLOAT, 0, @FVertices.List[0]);
   glNormalPointer(GL_FLOAT, 0, @FNormals.List[0]);
   xglTexCoordPointer(3, GL_FLOAT, 0, @FTexCoords.List[0]);

   glEnableClientState(GL_VERTEX_ARRAY);
   glEnableClientState(GL_NORMAL_ARRAY);
   xglEnableClientState(GL_TEXTURE_COORD_ARRAY);

   for i:=0 to (FIndices.Count div stride)-1 do
      glDrawElements(GL_TRIANGLE_STRIP, stride, GL_UNSIGNED_INT, @FIndices.List[stride*i]);

   xglDisableClientState(GL_TEXTURE_COORD_ARRAY);
   glDisableClientState(GL_NORMAL_ARRAY);
   glDisableClientState(GL_VERTEX_ARRAY);

   if Assigned(Owner.FBranchMaterial) then
      Owner.FBranchMaterial.UnApply(rci);
end;

// Clear
//
procedure TGLTreeBranches.Clear;
begin
  FRoot.Free;
  FSinList.Clear;
  FCosList.Clear;
  FVertices.Clear;
  FNormals.Clear;
  FTexCoords.Clear;
  FIndices.Clear;
  FBranchCache.Clear;
  FBranchIndices.Clear;
  FCount:=0;
end;

// -----------------------------------------------------------------------------
// TGLTreeBranchNoise
// -----------------------------------------------------------------------------

// Create
//
constructor TGLTreeBranchNoise.Create;
begin
  FBranchNoise:=Random;
end;

// Destroy
//
destructor TGLTreeBranchNoise.Destroy;
begin
  FLeft.Free;
  FRight.Free;
  inherited;
end;

// GetLeft
//
function TGLTreeBranchNoise.GetLeft: TGLTreeBranchNoise;
begin
  if not Assigned(FLeft) then
    FLeft:=TGLTreeBranchNoise.Create;
  Result:=FLeft;
end;

// GetRight
//
function TGLTreeBranchNoise.GetRight: TGLTreeBranchNoise;
begin
  if not Assigned(FRight) then
    FRight:=TGLTreeBranchNoise.Create;
  Result:=FRight;
end;


// -----------------------------------------------------------------------------
// TGLTree
// -----------------------------------------------------------------------------

// Create
//
constructor TGLTree.Create(AOwner: TComponent);
begin
   inherited;
   // Default tree setting
   FDepth:=7;
   FLeafThreshold:=0.02;
   FBranchAngleBias:=0.6;
   FBranchAngle:=0.4;
   FBranchTwist:=45;
   FBranchNoise:=0.7;
   FBranchSize:=1.0;
   FLeafSize:=0.1;
   FBranchRadius:=0.12;
   FBranchFacets:=6;
   FCentralLeader:=False;
   FSeed:=0;

   FLeaves:=TGLTreeLeaves.Create(Self);
   FBranches:=TGLTreeBranches.Create(Self);
   FNoise:=TGLTreeBranchNoise.Create;

   FRebuildTree:=True;
end;

// Destroy
//
destructor TGLTree.Destroy;
begin
   FLeaves.Free;
   FBranches.Free;
   FNoise.Free;
   inherited;
end;

// DoRender
//
procedure TGLTree.DoRender(var rci : TRenderContextInfo;
                           renderSelf, renderChildren : Boolean);
begin
   if Assigned(FBranchMaterial) then
      FBranchMaterial.PrepareBuildList;
   if Assigned(FLeafMaterial) then
      FLeafMaterial.PrepareBuildList;
   if Assigned(FLeafBackMaterial) then
      FLeafBackMaterial.PrepareBuildList;
   inherited;
end;

// BuildList
//
procedure TGLTree.BuildList(var rci: TRenderContextInfo);
begin
   if FRebuildTree then begin
      FBranches.BuildBranches;
      FRebuildTree:=False;
   end;
   Branches.BuildList(rci);
   Leaves.BuildList(rci);
end;

// BuildMesh
//
procedure TGLTree.BuildMesh(GLBaseMesh : TGLBaseMesh);

  procedure RecursBranches(Branch : TGLTreeBranch; bone : TSkeletonBone; Frame : TSkeletonFrame);
  var
    trans : TTransformations;
    mat : TMatrix;
    rot, pos : TAffineVector;
  begin
    bone.Name:='Branch'+IntToStr(Branch.FBranchID);
    bone.BoneID:=Branch.FBranchID;

    // Construct base frame
    if Assigned(Branch.FParent) then
      mat:=Branch.FParent.FMatrix
    else
      mat:=IdentityHMGMatrix;
    InvertMatrix(mat);
    NormalizeMatrix(mat);
    if MatrixDecompose(mat,trans) then begin
      SetVector(rot,trans[ttRotateX],trans[ttRotateY],trans[ttRotateZ]);
      SetVector(pos,mat[3]);
    end else begin
      rot:=NullVector;
      pos:=NullVector;
    end;
    Frame.Rotation.Add(rot);
    Frame.Position.Add(pos);

    // Recurse with child branches
    if Assigned(Branch.Left) then
      RecursBranches(Branch.Left, TSkeletonBone.CreateOwned(bone), Frame);
    if Assigned(Branch.Right) then
      RecursBranches(Branch.Right, TSkeletonBone.CreateOwned(bone), Frame);
  end;

var
  //SkelMesh : TSkeletonMeshObject;
  fg : TFGVertexIndexList;
  fg2 : TFGVertexNormalTexIndexList;
  i,j,stride : integer;
  //parent_id : integer;
  //bone : TSkeletonBone;
begin
  if not Assigned(GLBaseMesh) then exit;

  if FRebuildTree then begin
    FBranches.BuildBranches;
    FRebuildTree:=False;
  end;

  GLBaseMesh.MeshObjects.Clear;
  GLBaseMesh.Skeleton.Clear;

  //if GLBaseMesh is TGLActor then
  //  TSkeletonMeshObject.CreateOwned(GLBaseMesh.MeshObjects)
  //else
    TMeshObject.CreateOwned(GLBaseMesh.MeshObjects);
  GLBaseMesh.MeshObjects[0].Mode:=momFaceGroups;

  // Branches
  GLBaseMesh.MeshObjects[0].Vertices.Add(Branches.Vertices);
  GLBaseMesh.MeshObjects[0].Normals.Add(Branches.Normals);
  GLBaseMesh.MeshObjects[0].TexCoords.Add(Branches.TexCoords);
  {if GLBaseMesh is TGLActor then begin
    TGLActor(GLBaseMesh).Reference:=aarSkeleton;
    RecursBranches(Branches.FRoot,
                   TSkeletonBone.CreateOwned(GLBaseMesh.Skeleton.RootBones),
                   TSkeletonFrame.CreateOwned(GLBaseMesh.Skeleton.Frames));
    SkelMesh:=TSkeletonMeshObject(GLBaseMesh.MeshObjects[0]);
    SkelMesh.BonesPerVertex:=1;
    SkelMesh.VerticeBoneWeightCount:=Branches.FBranchIndices.Count;
    for i:=0 to Branches.FBranchIndices.Count-1 do
      SkelMesh.AddWeightedBone(Branches.FBranchIndices[i],1);
    GLBaseMesh.Skeleton.RootBones.PrepareGlobalMatrices;
    SkelMesh.PrepareBoneMatrixInvertedMeshes;

    SkelMesh.ApplyCurrentSkeletonFrame(True);
  end;//}
  stride:=(BranchFacets+1)*2;
  for i:=0 to (FBranches.FIndices.Count div stride)-1 do begin
    fg:=TFGVertexIndexList.CreateOwned(GLBaseMesh.MeshObjects[0].FaceGroups);
    fg.MaterialName:=BranchMaterialName;
    fg.Mode:=fgmmTriangleStrip;
    for j:=0 to stride-1 do
      fg.VertexIndices.Add(Branches.FIndices[i*stride+j]);
  end;

  // Leaves
  //if GLBaseMesh is TGLActor then
  //  TSkeletonMeshObject.CreateOwned(GLBaseMesh.MeshObjects)
  //else
    TMeshObject.CreateOwned(GLBaseMesh.MeshObjects);
  GLBaseMesh.MeshObjects[1].Mode:=momFaceGroups;

  GLBaseMesh.MeshObjects[1].Vertices.Add(Leaves.Vertices);
  GLBaseMesh.MeshObjects[1].Normals.Add(Leaves.FNormals);
  for i:=0 to Leaves.Normals.Count-1 do
    GLBaseMesh.MeshObjects[1].Normals.Add(VectorNegate(Leaves.FNormals[i]));
  GLBaseMesh.MeshObjects[1].TexCoords.Add(Leaves.TexCoords);

  for i:=0 to (Leaves.FVertices.Count div 4)-1 do begin

    // Leaf front
    fg2:=TFGVertexNormalTexIndexList.CreateOwned(GLBaseMesh.MeshObjects[1].FaceGroups);
    fg2.MaterialName:=LeafMaterialName;
    fg2.Mode:=fgmmTriangleStrip;
    with fg2.VertexIndices do begin
      Add(i*4);
      Add(i*4+1);
      Add(i*4+3);
      Add(i*4+2);
    end;
    for j:=0 to 3 do
      fg2.NormalIndices.Add(i);
    with fg2.TexCoordIndices do begin
      Add(0);
      Add(1);
      Add(3);
      Add(2);
    end;

    // Leaf back
    fg2:=TFGVertexNormalTexIndexList.CreateOwned(GLBaseMesh.MeshObjects[1].FaceGroups);
    fg2.MaterialName:=LeafBackMaterialName;
    fg2.Mode:=fgmmTriangleStrip;
    with fg2.VertexIndices do begin
      Add(i*4);
      Add(i*4+3);
      Add(i*4+1);
      Add(i*4+2);
    end;
    for j:=0 to 3 do
      fg2.NormalIndices.Add(i);
    with fg2.TexCoordIndices do begin
      Add(0);
      Add(3);
      Add(1);
      Add(2);
    end;
  end;
end;

// Clear
//
procedure TGLTree.Clear;
begin
  FLeaves.Clear;
  FBranches.Clear;
end;

// SetBranchAngle
//
procedure TGLTree.SetBranchAngle(const Value: Single);
begin
  if Value<>FBranchAngle then begin
    FBranchAngle:=Value;
    RebuildTree;
  end;
end;

// SetBranchAngleBias
//
procedure TGLTree.SetBranchAngleBias(const Value: Single);
begin
  if Value<>FBranchAngleBias then begin
    FBranchAngleBias:=Value;
    RebuildTree;
  end;
end;

// SetBranchNoise
//
procedure TGLTree.SetBranchNoise(const Value: Single);
begin
  if Value<>FBranchNoise then begin
    FBranchNoise:=Value;
    RebuildTree;
  end;
end;

// SetBranchRadius
//
procedure TGLTree.SetBranchRadius(const Value: Single);
begin
  if Value<>FBranchRadius then begin
    FBranchRadius:=Value;
    RebuildTree;
  end;
end;

// SetBranchSize
//
procedure TGLTree.SetBranchSize(const Value: Single);
begin
  if Value<>FBranchSize then begin
    FBranchSize:=Value;
    RebuildTree;
  end;
end;

// SetBranchTwist
//
procedure TGLTree.SetBranchTwist(const Value: Single);
begin
  if Value<>FBranchTwist then begin
    FBranchTwist:=Value;
    RebuildTree;
  end;
end;

// SetDepth
//
procedure TGLTree.SetDepth(const Value: Integer);
begin
  if Value<>FDepth then begin
    FDepth:=Value;
    RebuildTree;
  end;
end;

// SetBranchFacets
//
procedure TGLTree.SetBranchFacets(const Value: Integer);
begin
  if Value<>FBranchFacets then begin
    FBranchFacets:=Value;
    RebuildTree;
  end;
end;

// SetLeafSize
//
procedure TGLTree.SetLeafSize(const Value: Single);
begin
  if Value<>FLeafSize then begin
    FLeafSize:=Value;
    RebuildTree;
  end;
end;

// SetLeafThreshold
//
procedure TGLTree.SetLeafThreshold(const Value: Single);
begin
  if Value<>FLeafThreshold then begin
    FLeafThreshold:=Value;
    RebuildTree;
  end;
end;

// SetCentralLeaderBias
//
procedure TGLTree.SetCentralLeaderBias(const Value: Single);
begin
  if Value<>FCentralLeaderBias then begin
    FCentralLeaderBias:=Value;
    RebuildTree;
  end;
end;

// SetCentralLeader
//
procedure TGLTree.SetCentralLeader(const Value: Boolean);
begin
  if Value<>FCentralLeader then begin
    FCentralLeader:=Value;
    RebuildTree;
  end;
end;

// SetSeed
//
procedure TGLTree.SetSeed(const Value: Integer);
begin
  if Value<>FSeed then begin
    FSeed:=Value;
    ForceTotalRebuild;
  end;
end;

// SetBranchMaterialName
//
procedure TGLTree.SetBranchMaterialName(const Value: TGLLibMaterialName);
begin
  if Value<>FBranchMaterialName then begin
    FBranchMaterialName:=Value;
    FBranchMaterial:=FMaterialLibrary.Materials.GetLibMaterialByName(Value);
    StructureChanged;
  end;
end;

// SetLeafBackMaterialName
//
procedure TGLTree.SetLeafBackMaterialName(const Value: TGLLibMaterialName);
begin
  if Value<>FLeafBackMaterialName then begin
    FLeafBackMaterialName:=Value;
    FLeafBackMaterial:=FMaterialLibrary.Materials.GetLibMaterialByName(Value);
    StructureChanged;
  end;
end;

// SetLeafMaterialName
//
procedure TGLTree.SetLeafMaterialName(const Value: TGLLibMaterialName);
begin
  if Value<>FLeafMaterialName then begin
    FLeafMaterialName:=Value;
    FLeafMaterial:=FMaterialLibrary.Materials.GetLibMaterialByName(Value);
    StructureChanged;
  end;
end;

// SetMaterialLibrary
//
procedure TGLTree.SetMaterialLibrary(const Value: TGLMaterialLibrary);
begin
  if Value<>FMaterialLibrary then begin
    FMaterialLibrary:=Value;
    StructureChanged;
  end;
end;

// RebuildTree
//
procedure TGLTree.RebuildTree;
begin
   if not FRebuildTree then begin
      Clear;
      FRebuildTree:=True;
      StructureChanged;
   end;
end;

// ForceTotalRebuild
//
procedure TGLTree.ForceTotalRebuild;
begin
   Clear;
   FNoise.Free;
   RandSeed:=FSeed;
   FNoise:=TGLTreeBranchNoise.Create;
   FRebuildTree:=True;
   StructureChanged;
end;

// LoadFromStream
//
procedure TGLTree.LoadFromStream(aStream: TStream);
var
  StrList, StrParse : TStringList;
  str : String;
  i : integer;
begin
  StrList:=TStringList.Create;
  StrParse:=TStringList.Create;

  StrList.LoadFromStream(aStream);
  try
    for i:=0 to StrList.Count-1 do begin
      str:=StrList[i];
      if Pos('#',str)>0 then
        str:=Copy(str,0,Pos('#',str)-1);
      StrParse.CommaText:=str;
      if StrParse.Count>=2 then begin
        str:=LowerCase(StrParse[0]);
        if      str = 'depth' then FDepth:=StrToInt(StrParse[1])
        else if str = 'branch_facets' then FBranchFacets:=StrToInt(StrParse[1])
        else if str = 'leaf_size' then FLeafSize:=StrToFloat(StrParse[1])
        else if str = 'branch_size' then FBranchSize:=StrToFloat(StrParse[1])
        else if str = 'branch_noise' then FBranchNoise:=StrToFloat(StrParse[1])
        else if str = 'branch_angle_bias' then FBranchAngleBias:=StrToFloat(StrParse[1])
        else if str = 'branch_angle' then FBranchAngle:=StrToFloat(StrParse[1])
        else if str = 'branch_twist' then FBranchTwist:=StrToFloat(StrParse[1])
        else if str = 'branch_radius' then FBranchRadius:=StrToFloat(StrParse[1])
        else if str = 'leaf_threshold' then FLeafThreshold:=StrToFloat(StrParse[1])
        else if str = 'central_leader_bias' then FCentralLeaderBias:=StrToFloat(StrParse[1])
        else if str = 'central_leader' then FCentralLeader:=LowerCase(StrParse[1])='true'
        else if str = 'seed' then FSeed:=StrToInt(StrParse[1])
        else if str = 'leaf_front_material_name' then FLeafMaterialName:=StrParse[1]
        else if str = 'leaf_back_material_name' then FLeafBackMaterialName:=StrParse[1]
        else if str = 'branch_material_name' then FBranchMaterialName:=StrParse[1];
      end;
    end;
    ForceTotalRebuild;
  finally
    StrList.Free;
    StrParse.Free;
  end;
end;

// SaveToStream
procedure TGLTree.SaveToStream(aStream: TStream);
var
  StrList : TStringList;
begin
  StrList:=TStringList.Create;
  StrList.Add(Format('depth, %d',[Depth]));
  StrList.Add(Format('branch_facets, %d',[BranchFacets]));
  StrList.Add(Format('leaf_size, %f',[LeafSize]));
  StrList.Add(Format('branch_size, %f',[BranchSize]));
  StrList.Add(Format('branch_noise, %f',[BranchNoise]));
  StrList.Add(Format('branch_angle_bias, %f',[BranchAngleBias]));
  StrList.Add(Format('branch_angle, %f',[BranchAngle]));
  StrList.Add(Format('branch_twist, %f',[BranchTwist]));
  StrList.Add(Format('branch_radius, %f',[BranchRadius]));
  StrList.Add(Format('leaf_threshold, %f',[LeafThreshold]));
  StrList.Add(Format('central_leader_bias, %f',[CentralLeaderBias]));
  if CentralLeader then
    StrList.Add('central_leader, true')
  else
    StrList.Add('central_leader, false');
  StrList.Add(Format('seed, %d',[Seed]));
  StrList.Add('leaf_front_material_name, "'+LeafMaterialName+'"');
  StrList.Add('leaf_back_material_name, "'+LeafBackMaterialName+'"');
  StrList.Add('branch_material_name, "'+BranchMaterialName+'"');
  StrList.SaveToStream(aStream);
  StrList.Free;
end;

// LoadFromFile
//
procedure TGLTree.LoadFromFile(aFileName: String);
var
  stream : TStream;
begin
  stream:=CreateFileStream(aFileName);
  try
    LoadFromStream(stream);
  finally
    stream.Free;
  end;
end;

// SaveToFile
//
procedure TGLTree.SaveToFile(aFileName: String);
var
  stream : TStream;
begin
  stream:=CreateFileStream(aFileName,fmCreate);
  try
    SaveToStream(stream);
  finally
    stream.Free;
  end;
end;

end.
