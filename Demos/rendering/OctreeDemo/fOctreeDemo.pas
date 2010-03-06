unit fOctreeDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, GLObjects, GLScene, GLWin32Viewer, VectorGeometry, StdCtrls,
  GeometryBB, GLTexture, OpenGL1x, GLCadencer, SpatialPartitioning,
  ComCtrls, GLCrossPlatform, GLCoordinates, BaseClasses, GLRenderContextInfo,
  GLState;

const
  cBOX_SIZE = 14.2;

type
  TfrmOctreeDemo = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLLightSource1: TGLLightSource;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLDirectOpenGL1: TGLDirectOpenGL;
    GLCube1: TGLCube;
    GLCadencer1: TGLCadencer;
    Label1: TLabel;
    TrackBar_LeafThreshold: TTrackBar;
    Label3: TLabel;
    GLSphere1: TGLSphere;
    Label2: TLabel;
    Button_ResetOctreeSize: TButton;
    GLPlane1: TGLPlane;
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GLDirectOpenGL1Render(Sender : TObject; var rci: TRenderContextInfo);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure TrackBar_LeafThresholdChange(Sender: TObject);
    procedure Button_ResetOctreeSizeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    Octree : TOctreeSpacePartition;

    procedure CreateBox;
    procedure VerifySpacialMisc;
  end;

  TGLSpacePartitionLeaf = class(TSpacePartitionLeaf)
  public
    GLBaseSceneObject : TGLBaseSceneObject;
    Direction : TAffineVector;

    procedure UpdateCachedAABBAndBSphere; override;

    constructor CreateGLOwned(SpacePartition : TBaseSpacePartition; aGLBaseSceneObject : TGLBaseSceneObject);
  end;

var
  frmOctreeDemo: TfrmOctreeDemo;

implementation

{$R *.dfm}

var
  mx, my : integer;
procedure TfrmOctreeDemo.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    GLCamera1.MoveAroundTarget(my-y, mx-x);

  mx := x;
  my := y;
end;

procedure TfrmOctreeDemo.FormCreate(Sender: TObject);
var
  i : integer;
begin
  randomize;

  Octree := TOctreeSpacePartition.Create;
  Octree.SetSize(AffineVectorMake(-15, -15, -15), AffineVectorMake(15, 15, 15));
  Octree.MaxTreeDepth := 6;
  Octree.LeafThreshold := 10;

  TrackBar_LeafThresholdChange(nil);

  for i := 0 to 300 do
    CreateBox;

  VerifySpacialMisc;
end;

procedure TfrmOctreeDemo.CreateBox;
  function randomPos : TAffineVector;
  const
    c1 = 10;
  begin
    //MakeVector(result, random*c1-c1/2, random*c1-c1/2, random*c1-c1/2);
    MakeVector(result, random, random, random);
  end;

  function randomSize : single;
  begin
    result := 0.1+random*0.5;
  end;
var
  Cube : TGLCube;
begin
  Cube := TGLCube(GLScene1.Objects.AddNewChild(TGLCube));
  Cube.Position.AsAffineVector := randomPos;
  Cube.CubeWidth := randomSize;
  Cube.CubeHeight := randomSize;
  Cube.CubeDepth := randomSize;

  TGLSpacePartitionLeaf.CreateGLOwned(Octree, Cube);
end;

{ TGLSpacePartitionLeaf }

constructor TGLSpacePartitionLeaf.CreateGLOwned(SpacePartition : TBaseSpacePartition; aGLBaseSceneObject : TGLBaseSceneObject);
begin
  GLBaseSceneObject := aGLBaseSceneObject;

  // Set them all off in the same direction
  Direction[0] := random;
  Direction[1] := random;
  Direction[2] := random;//}

  NormalizeVector(Direction);

  inherited CreateOwned(SpacePartition);
end;

procedure TGLSpacePartitionLeaf.UpdateCachedAABBAndBSphere;
begin
  FCachedAABB := GLBaseSceneObject.AxisAlignedBoundingBox;
  FCachedAABB.min := GLBaseSceneObject.LocalToAbsolute(FCachedAABB.min);
  FCachedAABB.max := GLBaseSceneObject.LocalToAbsolute(FCachedAABB.max);

  FCachedBSphere.Radius := GLBaseSceneObject.BoundingSphereRadius;
  FCachedBSphere.Center := GLBaseSceneObject.Position.AsAffineVector;
end;

procedure TfrmOctreeDemo.GLDirectOpenGL1Render(Sender : TObject; var rci: TRenderContextInfo);

  procedure RenderAABB(AABB : TAABB; w, r,g,b : single);
  begin
    glColor3f(r,g,b);
    rci.GLStates.LineWidth := w;

    glBegin(GL_LINE_STRIP);
      glVertex3f(AABB.min[0],AABB.min[1], AABB.min[2]);
      glVertex3f(AABB.min[0],AABB.max[1], AABB.min[2]);
      glVertex3f(AABB.max[0],AABB.max[1], AABB.min[2]);
      glVertex3f(AABB.max[0],AABB.min[1], AABB.min[2]);
      glVertex3f(AABB.min[0],AABB.min[1], AABB.min[2]);

      glVertex3f(AABB.min[0],AABB.min[1], AABB.max[2]);
      glVertex3f(AABB.min[0],AABB.max[1], AABB.max[2]);
      glVertex3f(AABB.max[0],AABB.max[1], AABB.max[2]);
      glVertex3f(AABB.max[0],AABB.min[1], AABB.max[2]);
      glVertex3f(AABB.min[0],AABB.min[1], AABB.max[2]);
    glEnd;

    glBegin(GL_LINES);
      glVertex3f(AABB.min[0],AABB.max[1], AABB.min[2]);
      glVertex3f(AABB.min[0],AABB.max[1], AABB.max[2]);

      glVertex3f(AABB.max[0],AABB.max[1], AABB.min[2]);
      glVertex3f(AABB.max[0],AABB.max[1], AABB.max[2]);

      glVertex3f(AABB.max[0],AABB.min[1], AABB.min[2]);
      glVertex3f(AABB.max[0],AABB.min[1], AABB.max[2]);
    glEnd;
  end;

  procedure RenderOctreeNode(Node : TSectorNode);
  var
    i : integer;
    AABB : TAABB;
  begin
    if Node.NoChildren then
    begin
      AABB := Node.AABB;

      if Node.RecursiveLeafCount > 0 then
        RenderAABB(AABB, 1, 0, 0, 0)
      else
        RenderAABB(AABB, 1, 0.8, 0.8, 0.8)//}

    end else
    begin
      for i := 0 to Node.ChildCount-1 do
        RenderOctreeNode(Node.Children[i]);
    end;
  end;
var
  AABB : TAABB;
begin
  rci.GLStates.PushAttrib([sttEnable, sttCurrent, sttLine, sttColorBuffer]);
  rci.GLStates.Disable(stLighting);

  MakeVector(AABB.min, -cBOX_SIZE, -cBOX_SIZE, -cBOX_SIZE);
  MakeVector(AABB.max,  cBOX_SIZE,  cBOX_SIZE,  cBOX_SIZE);
  RenderAABB(AABB,2, 0,0,0);
  RenderOctreeNode(Octree.RootNode);
  rci.GLStates.PopAttrib;
end;

procedure TfrmOctreeDemo.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
	GLCamera1.AdjustDistanceToTarget(Power(1.1, WheelDelta/120));
  Handled := true
end;

procedure TfrmOctreeDemo.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);

const
  cSPEED = 2;

var
  AABB : TAABB;
  BSphere : TBSphere;
  Leaf, TestLeaf : TGLSpacePartitionLeaf;
  Cube : TGLCube;
  i, j, CollidingLeafCount : integer;

  function TestMove(pos : single; var dir : single) : single;
  begin
    if (abs(pos+dir*deltaTime*cSPEED)>=cBOX_SIZE)  then
      dir := -dir;

    result := pos + dir * deltaTime*cSPEED;
  end;
begin
  for i := 0 to Octree.Leaves.Count-1 do
  begin
    Leaf := TGLSpacePartitionLeaf(Octree.Leaves[i]);
    Cube := TGLCube(Leaf.GLBaseSceneObject);
    Cube.Position.X := TestMove(Cube.Position.X, Leaf.Direction[0]);
    Cube.Position.Y := TestMove(Cube.Position.Y, Leaf.Direction[1]);
    Cube.Position.Z := TestMove(Cube.Position.Z, Leaf.Direction[2]);

    Leaf.Changed;
  end;//}

  for i := 0 to Octree.Leaves.Count-1 do
  begin
    Leaf := TGLSpacePartitionLeaf(Octree.Leaves[i]);
    TGLCube(Leaf.GLBaseSceneObject).Material.FrontProperties.Emission.Red := 0;
    TGLCube(Leaf.GLBaseSceneObject).Material.FrontProperties.Emission.Green := 0;
    TGLCube(Leaf.GLBaseSceneObject).Material.FrontProperties.Emission.Blue := 0;
  end;//}

  // AABB collision
  AABB := GLCube1.AxisAlignedBoundingBox;
  AABB.min := GLCube1.LocalToAbsolute(AABB.min);
  AABB.max := GLCube1.LocalToAbsolute(AABB.max);

  Octree.QueryAABB(AABB);

  for i := 0 to Octree.QueryResult.Count-1 do
  begin
    Leaf := TGLSpacePartitionLeaf(Octree.QueryResult[i]);
    TGLCube(Leaf.GLBaseSceneObject).Material.FrontProperties.Emission.Red := 1;
  end;//}

  // BSphere collision
  BSphere.Center := GLSphere1.Position.AsAffineVector;
  BSphere.Radius := GLSphere1.Radius;

  Octree.QueryBSphere(BSphere);

  for i := 0 to Octree.QueryResult.Count-1 do
  begin
    Leaf := TGLSpacePartitionLeaf(Octree.QueryResult[i]);
    TGLCube(Leaf.GLBaseSceneObject).Material.FrontProperties.Emission.Red := 1;
  end;//}

  // Plane collision
  if GLPlane1.Visible then
  begin
    Octree.QueryPlane(GLPlane1.Position.AsAffineVector, GLPlane1.Direction.AsAffineVector);

    for i := 0 to Octree.QueryResult.Count-1 do
    begin
      Leaf := TGLSpacePartitionLeaf(Octree.QueryResult[i]);
      TGLCube(Leaf.GLBaseSceneObject).Material.FrontProperties.Emission.Blue := 1;
    end;//}
  end;

  // Leaf - leaf collision
  CollidingLeafCount := 0;
  for i := 0 to Octree.Leaves.Count-1 do
  begin
    Leaf := TGLSpacePartitionLeaf(Octree.Leaves[i]);

    Octree.QueryAABB(Leaf.FCachedAABB);

    for j := 0 to Octree.QueryResult.Count-1 do
    begin
      TestLeaf := TGLSpacePartitionLeaf(Octree.QueryResult[j]);
      if TestLeaf<>Leaf then
      begin
        TGLCube(TestLeaf.GLBaseSceneObject).Material.FrontProperties.Emission.Green := 1;
        inc(CollidingLeafCount);
      end;
    end;
  end;//}//*)

  // Cone collision
  {Cone.Base := GLCone1.Position.AsAffineVector;
  Cone.Axis := VectorScale(GLCone1.Up.AsAffineVector, -1);
  Cone.Length := GLCone1.Height;
  Cone.Angle := ArcTan(GLCone1.BottomRadius/GLCone1.Height);

  Octree.QueryCone(Cone);

  for i := 0 to Octree.QueryResult.Count-1 do
  begin
    Leaf := TGLSpacePartitionLeaf(Octree.QueryResult[i]);
    TGLCube(Leaf.GLBaseSceneObject).Material.FrontProperties.Emission.Red := 1;
  end;//}

  Label1.Caption := Format('Nodes = %d, Colliding Leaves = %d',
    [Octree.GetNodeCount, CollidingLeafCount]);
end;

procedure TfrmOctreeDemo.TrackBar_LeafThresholdChange(Sender: TObject);
begin
  Label3.Caption := Format('Leaf Threshold : %d',[TrackBar_LeafThreshold.Position]);

  Octree.LeafThreshold := TrackBar_LeafThreshold.Position;
end;

procedure TfrmOctreeDemo.VerifySpacialMisc;
var
  AABBmajor, AABBfull, AABBoff, AABBpartial : TAABB;
begin
  MakeVector(AABBmajor.min, 0, 0, 0);
  MakeVector(AABBmajor.max, 5, 5, 5);

  MakeVector(AABBpartial.min, 4, 4, 4);
  MakeVector(AABBpartial.max, 6, 6, 6);

  MakeVector(AABBfull.min, 1, 1, 1);
  MakeVector(AABBfull.max, 2, 2, 2);

  MakeVector(AABBoff.min, 7, 7, 7);
  MakeVector(AABBoff.max, 8, 8, 8);

  Assert(AABBFitsInAABBAbsolute(AABBfull, AABBmajor),'AABBFitsInAABBAbsolute failed!');
  Assert(IntersectAABBsAbsolute(AABBfull, AABBmajor),'IntersectAABBsAbsolute failed!');
  Assert(AABBContainsAABB(AABBmajor, AABBfull) = scContainsFully,'AABBContainsAABB failed!');

  Assert(not AABBFitsInAABBAbsolute(AABBmajor, AABBfull),'AABBFitsInAABBAbsolute failed!');
  Assert(IntersectAABBsAbsolute(AABBmajor, AABBfull),'IntersectAABBsAbsolute failed!');
  Assert(AABBContainsAABB(AABBfull, AABBmajor) = scContainsPartially,'AABBContainsAABB failed!');

  Assert(not AABBFitsInAABBAbsolute(AABBfull, AABBoff),'AABBFitsInAABBAbsolute failed!');
  Assert(not IntersectAABBsAbsolute(AABBfull, AABBoff),'IntersectAABBsAbsolute failed!');
  Assert(AABBContainsAABB(AABBfull, AABBoff) = scNoOverlap,'AABBContainsAABB failed!');

  Assert(not AABBFitsInAABBAbsolute(AABBoff, AABBfull),'AABBFitsInAABBAbsolute failed!');
  Assert(not IntersectAABBsAbsolute(AABBoff, AABBfull),'IntersectAABBsAbsolute failed!');
  Assert(AABBContainsAABB(AABBoff, AABBfull) = scNoOverlap,'AABBContainsAABB failed!');

  Assert(not AABBFitsInAABBAbsolute(AABBmajor, AABBpartial),'AABBFitsInAABBAbsolute failed!');
  Assert(not AABBFitsInAABBAbsolute(AABBpartial, AABBmajor),'AABBFitsInAABBAbsolute failed!');

  Assert(IntersectAABBsAbsolute(AABBmajor, AABBpartial),'IntersectAABBsAbsolute failed!');
  Assert(IntersectAABBsAbsolute(AABBpartial, AABBmajor),'IntersectAABBsAbsolute failed!');

  Assert(AABBContainsAABB(AABBmajor, AABBpartial) = scContainsPartially,'AABBContainsAABB failed!');
  Assert(AABBContainsAABB(AABBpartial, AABBmajor) = scContainsPartially,'AABBContainsAABB failed!');
end;

procedure TfrmOctreeDemo.Button_ResetOctreeSizeClick(Sender: TObject);
begin
  Octree.GrowMethod := gmBestFit;
  Octree.UpdateStructureSize(0.05);
  Octree.GrowMethod := gmIncreaseToFitAll;
end;

procedure TfrmOctreeDemo.FormDestroy(Sender: TObject);
begin
  Octree.Free;
end;

end.
