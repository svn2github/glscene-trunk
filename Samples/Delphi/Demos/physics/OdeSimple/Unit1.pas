unit Unit1;

interface

uses
  System.SysUtils, 
  System.Classes,
  Vcl.Graphics, 
  Vcl.Controls, 
  Vcl.Forms, 
  Vcl.Dialogs, 
  Vcl.StdCtrls,
  Vcl.ComCtrls, 
  Vcl.ExtCtrls,
  GLODEManager, 
  GLScene, 
  GLObjects, 
  GLGeomObjects, 
  GLCadencer,
  GLWin32Viewer, 
  GLShadowPlane, 
  GLGraph, GLVectorTypes, 
  GLVectorGeometry,
  GLODECustomColliders, 
  GLCrossPlatform, 
  GLCoordinates, 
  GLBaseClasses;

type
  TForm1 = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCadencer1: TGLCadencer;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLLightSource1: TGLLightSource;
    ODEObjects: TGLDummyCube;
    Panel1: TPanel;
    GLODEManager1: TGLODEManager;
    Spawn: TButton;
    cbObjects: TComboBox;
    Label1: TLabel;
    GLRenderPoint1: TGLRenderPoint;
    GLHeightField1: TGLHeightField;
    chbElements: TCheckBox;
    chbContacts: TCheckBox;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    GLPlane1: TGLPlane;
    cbSurface: TComboBox;
    Label3: TLabel;
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure GLSceneViewer1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure SpawnClick(Sender: TObject);
    procedure GLHeightField1GetHeight(const x, y: Single; var z: Single;
      var Color: TVector4f; var TexPoint: TTexPoint);
    procedure TrackBar1Change(Sender: TObject);
    procedure cbSurfaceChange(Sender: TObject);
    procedure chbElementsClick(Sender: TObject);
    procedure chbContactsClick(Sender: TObject);
  private
  public
    mx, my: Integer;
    procedure DoSphere;
    procedure DoBox;
    procedure DoCapsule;
    procedure DoCylinder;
    // CONE IS CURRENTLY UNSUPPOETED FOR ODE 0.9
    // procedure DoCone;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
  GLODEManager1.Step(deltaTime);
end;


procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx := X;
  my := Y;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    GLCamera1.MoveAroundTarget(my - Y, mx - X);
  mx := X;
  my := Y;
end;

procedure TForm1.SpawnClick(Sender: TObject);
begin
  case cbObjects.ItemIndex of
    0: DoSphere;
    1: DoBox;
    2: DoCapsule;
    3: DoCylinder;
    // 4 : DoCone; // CONE IS CURRENTLY UNSUPPOETED FOR ODE 0.9
  end;
end;

procedure TForm1.DoSphere;
var
  sphere: TGLSphere;
  dyn: TODEDynamic;
begin
  sphere := TGLSphere(ODEObjects.AddNewChild(TGLSphere));
  sphere.Position.SetPoint(5 * random - 2.5, 2, 5 * random - 2.5);
  sphere.Radius := 0.3 * (random + 1);
  dyn := TODEDynamic.Create(sphere.Behaviours);
  // ELEMENTS MUST BE ADDED BEFORE SETTING MANAGER
  with TODEElementSphere(dyn.AddNewElement(TODEElementSphere)) do
    Radius := sphere.Radius;
   dyn.Manager := GLODEManager1;
end;

procedure TForm1.DoBox;
var
  cube: TGLCube;
  dyn: TODEDynamic;
begin
  cube := TGLCube(ODEObjects.AddNewChild(TGLCube));
  cube.Position.SetPoint(5 * random - 2.5, 2, 5 * random - 2.5);
  cube.CubeWidth := 0.5 * (random + 1);
  cube.CubeHeight := 0.5 * (random + 1);
  cube.CubeDepth := 0.5 * (random + 1);
  dyn := TODEDynamic.Create(cube.Behaviours);
  // ELEMENTS MUST BE ADDED BEFORE SETTING MANAGER
  with TODEElementBox(dyn.AddNewElement(TODEElementBox)) do
  begin
    BoxWidth := cube.CubeWidth;
    BoxHeight := cube.CubeHeight;
    BoxDepth := cube.CubeDepth;
  end;
  dyn.Manager := GLODEManager1;
end;

procedure TForm1.DoCapsule;
var
  capsule: TGLCylinder;
  dyn: TODEDynamic;
begin
  capsule := TGLCylinder(ODEObjects.AddNewChild(TGLCylinder));
  with capsule do
  begin
    Position.SetPoint(5 * random - 2.5, 2, 5 * random - 2.5);
    BottomRadius := 0.25 * (random + 1);
    TopRadius := BottomRadius;
    Height := random + 1;
    Parts := [cySides];
    with TGLSphere(AddNewChild(TGLSphere)) do
    begin
      Position.Y := 0.5 * Height;
      Radius := BottomRadius;
      Bottom := 0;
    end;
    with TGLSphere(AddNewChild(TGLSphere)) do
    begin
      Position.Y := -0.5 * Height;
      Radius := BottomRadius;
      Top := 0;
    end;
  end;
  dyn := TODEDynamic.Create(capsule.Behaviours);
  // ELEMENTS MUST BE ADDED BEFORE SETTING MANAGER
  with TODEElementCapsule(dyn.AddNewElement(TODEElementCapsule)) do
  begin
    Radius := capsule.BottomRadius;
    Length := capsule.Height;
    Direction.SetVector(0, 1, 0);
    Up.SetVector(0, 0, 1);
  end;
  dyn.Manager := GLODEManager1;
end;

procedure TForm1.DoCylinder;
var
  cylinder: TGLCylinder;
  dyn: TODEDynamic;
begin
  cylinder := TGLCylinder(ODEObjects.AddNewChild(TGLCylinder));
  with cylinder do
  begin
    Position.SetPoint(5 * random - 2.5, 2, 5 * random - 2.5);
    BottomRadius := 0.25 * (random + 1);
    TopRadius := BottomRadius;
    Height := random + 1;
  end;
  dyn := TODEDynamic.Create(cylinder.Behaviours);
  // ELEMENTS MUST BE ADDED BEFORE SETTING MANAGER
  with TODEElementCylinder(dyn.AddNewElement(TODEElementCylinder)) do
  begin
    Radius := cylinder.BottomRadius;
    Length := cylinder.Height;
  end;
  dyn.Manager := GLODEManager1;
end;

// CONE IS CURRENTLY UNSUPPOETED FOR ODE 0.9
{
  procedure TForm1.DoCone;
  var
  cone : TGLCone;
  dyn : TODEDynamic;
  begin
  cone:=TGLCone(ODEObjects.AddNewChild(TGLCone));
  with cone do begin
  Position.SetPoint(5*random-2.5,2,5*random-2.5);
  BottomRadius:=0.25*(Random+1);
  Height:=random+1;
  end;
  dyn:=TODEDynamic.Create(cone.Behaviours);
  dyn.Manager:=GLODEManager1;
  with TODEElementCone(dyn.AddNewElement(TODEElementCone)) do begin
  Radius:=cone.BottomRadius;
  Length:=cone.Height;
  Direction.SetVector(0,1,0);
  Up.SetVector(0,0,1);
  Position.SetPoint(0,-cone.Height/2,0);
  end;
  end;
}

procedure TForm1.GLHeightField1GetHeight(const x, y: Single; var z: Single;
  var Color: TVector4f; var TexPoint: TTexPoint);
begin
  z := 0.5 * cos(x) * sin(y);
end;



procedure TForm1.chbContactsClick(Sender: TObject);
begin
  GLODEManager1.Visible := chbContacts.Checked;
end;

procedure TForm1.chbElementsClick(Sender: TObject);
begin
  TODEHeightField(GLHeightField1.Behaviours[0]).RenderContacts := chbElements.Checked;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  with TODEHeightField(GLHeightField1.Behaviours[0]) do
    ContactResolution := 0.25 + (10 - TrackBar1.Position) / 20;
end;

procedure TForm1.cbSurfaceChange(Sender: TObject);
begin
  if cbSurface.ItemIndex = -1 then
    cbSurface.ItemIndex := 0;
  if cbSurface.ItemIndex = 0 then
  begin
    GLPlane1.Visible := True;
    chbElements.Enabled := False;
    GetODEStatic(GLPlane1).Manager := GLODEManager1;
  end
  else
  begin
    GLPlane1.Visible := False;
    GetODEStatic(GLPlane1).Manager := nil;
  end;

  if cbSurface.ItemIndex = 1 then
  begin
    GLHeightField1.Visible := True;
    chbContacts.Enabled := True;
    GetODEHeightField(GLHeightField1).Manager := GLODEManager1;
  end
  else
  begin
    GLHeightField1.Visible := False;
    chbContacts.Enabled := False;
    GetODEHeightField(GLHeightField1).Manager := nil;
  end;
end;

end.
