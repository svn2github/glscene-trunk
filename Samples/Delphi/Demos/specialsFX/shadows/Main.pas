unit Main;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.JPeg,

  //GLS
  GLScene, GLGraph, GLObjects, GLTexture,
  GLGraphics, GLVectorTypes, GLVectorGeometry, GLHUDObjects,
  GLzBuffer, GLCadencer, GLAsyncTimer, GLWin32Viewer, GLTeapot,
  GLGeomObjects, GLCrossPlatform, GLMaterial, GLCoordinates, GLBaseClasses,
  GLBehaviours, GLUtils;

type
  TMainFm = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    GLScene1: TGLScene;
    Label1: TLabel;
    Label2: TLabel;
    GLCamera1: TGLCamera;
    GLCamera2: TGLCamera;
    Objects: TGLDummyCube;
    GLLightSource1: TGLLightSource;
    Viewer: TGLSceneViewer;
    Caster: TGLSceneViewer;
    Panel4: TPanel;
    Label4: TLabel;
    DistanceBar: TTrackBar;
    Label3: TLabel;
    DistanceBar2: TTrackBar;
    Panel5: TPanel;
    GLMaterialLibrary1: TGLMaterialLibrary;
    MemView: TGLMemoryViewer;
    Shadows1: TGLZShadows;
    Cube1: TGLCube;
    FrustBox: TCheckBox;
    AsyncTimer1: TGLAsyncTimer;
    Torus1: TGLTorus;
    RotateBox: TCheckBox;
    ShadowOnBox: TCheckBox;
    GLCadencer1: TGLCadencer;
    HeightField1: TGLHeightField;
    Teapot1: TGLTeapot;
    SoftBox: TCheckBox;
    SkyShadBox: TCheckBox;
    Focal: TTrackBar;
    Label5: TLabel;
    CastBtn: TButton;
    TimeLbl: TLabel;
    Panel6: TPanel;
    FadeBox: TCheckBox;
    dovBar: TTrackBar;
    Memo1: TMemo;
    AlphaBar: TTrackBar;
    Label9: TLabel;
    procedure ViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ViewerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CasterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CasterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DistanceBarChange(Sender: TObject);
    procedure DistanceBar2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CastBtnClick(Sender: TObject);
    procedure ViewerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CasterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FadeBoxClick(Sender: TObject);
    procedure HeightField1GetHeight(const x, y: Single; var z: Single;
      var color: TVector4f; var texPoint: TTexPoint);
    procedure FrustBoxClick(Sender: TObject);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure RotateBoxClick(Sender: TObject);
    procedure ShadowOnBoxClick(Sender: TObject);
    procedure SoftBoxClick(Sender: TObject);
    procedure SkyShadBoxClick(Sender: TObject);
    procedure FocalChange(Sender: TObject);
    procedure dovBarChange(Sender: TObject);
    procedure AlphaBarChange(Sender: TObject);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
  private
    { Private declarations }
  public
    mx,my   :integer;
    mx2,my2 :integer;
    zViewer, zCaster :TGLzBuffer;
  end;

var
  MainFm: TMainFm;

implementation

{$R *.DFM}

procedure TMainFm.FormCreate(Sender: TObject);
begin
 SetGLSceneMediaDir();
 GLMaterialLibrary1.Materials[2].Material.texture.Image.loadFromFile('marbletiles.jpg');
 GLMaterialLibrary1.Materials[2].Material.texture.disabled:=false;

 GLMaterialLibrary1.Materials[3].Material.texture.Image.loadFromFile('beigemarble.jpg');
 GLMaterialLibrary1.Materials[3].Material.texture.disabled:=false;

 RotateBoxClick(Sender);
end;


procedure TMainFm.ViewerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 mx:=x; my:=y;
 ActiveControl:=DistanceBar;
end;

procedure TMainFm.ViewerMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if Shift<>[] then GLCamera1.MoveAroundTarget(my-y, mx-x);
   mx:=x; my:=y;
   GLCadencer1.Progress;
   Viewer.Refresh;
   Caster.Refresh;
end;

procedure TMainFm.CasterMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 mx2:=x; my2:=y;
 ActiveControl:=DistanceBar2;
end;

procedure TMainFm.CasterMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if Shift<>[] then GLCamera2.MoveAroundTarget(my2-y, mx2-x);
   mx2:=x; my2:=y;
   if shift<>[] then begin
      Shadows1.CastShadow;
      GLCadencer1.Progress;
      Viewer.Refresh;
      Caster.Refresh;
   end;
end;

procedure TMainFm.DistanceBarChange(Sender: TObject);
var
  Dist, NewDist :single;
begin
 with GLCamera1 do begin
   Dist:=DistanceToTarget;
   NewDist:=Sqr(DistanceBar.Position/4)+1;
   Position.AsAffineVector:=VectorScale(Position.AsAffineVector,NewDist/dist);
 end;
end;

procedure TMainFm.DistanceBar2Change(Sender: TObject);
var
  Dist, NewDist :single;
begin
 with GLCamera2 do begin
   Dist:=DistanceToTarget;
   NewDist:=Sqr(DistanceBar2.Position/4)+1;
   Position.AsAffineVector:=VectorScale(Position.AsAffineVector,NewDist/Dist);
 end;
 Shadows1.CastShadow;
 Caster.Refresh;
end;

procedure TMainFm.CastBtnClick(Sender: TObject);
var
  RefTime :Double;
begin
 RefTime:=GLCadencer1.GetcurrentTime;
 Shadows1.CastShadow;
 Viewer.Refresh;
 TimeLbl.Caption := IntToStr(Round((GLCadencer1.GetCurrentTime - RefTime)*1000.00));
end;

procedure TMainFm.ViewerMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Viewer.Visible:=True;
end;

procedure TMainFm.CasterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Shadows1.CastShadow;
end;

procedure TMainFm.FadeBoxClick(Sender: TObject);
begin
  Shadows1.DepthFade:=FadeBox.Checked;
end;

procedure TMainFm.HeightField1GetHeight(const x, y: Single; var z: Single;
  var color: TVector4f; var texPoint: TTexPoint);
begin
  z:=0;
end;

procedure TMainFm.FrustBoxClick(Sender: TObject);
begin
  Shadows1.FrustShadow:=FrustBox.Checked;
end;

procedure TMainFm.AsyncTimer1Timer(Sender: TObject);
begin
  Caption:='Shadows ' + Format('%.2f FPS', [Viewer.FramesPerSecond]);
  Viewer.ResetPerformanceMonitor;
end;

procedure TMainFm.RotateBoxClick(Sender: TObject);
begin
//AsyncTimer1.Enabled:=RotateBox.checked;
  GLCadencer1.Enabled:=RotateBox.checked;
end;

procedure TMainFm.ShadowOnBoxClick(Sender: TObject);
begin
  Shadows1.Visible:=ShadowOnBox.Checked;
end;

procedure TMainFm.SoftBoxClick(Sender: TObject);
begin
 Shadows1.Soft:=SoftBox.Checked;
end;

procedure TMainFm.SkyShadBoxClick(Sender: TObject);
begin
 Shadows1.SkyShadow:=SkyShadBox.Checked;
end;

procedure TMainFm.FocalChange(Sender: TObject);
begin
 GLCamera2.FocalLength:=Focal.Position;
 MemView.Render;
 Caster.refresh;
 Shadows1.CastShadow;
 Viewer.refresh;
end;

procedure TMainFm.dovBarChange(Sender: TObject);
begin
 GLCamera2.DepthOfView:=DovBar.Position;
 MemView.Render;
 Caster.Refresh;
 Shadows1.CastShadow;
 Viewer.Refresh;
end;

procedure TMainFm.AlphaBarChange(Sender: TObject);
begin
  Shadows1.Color.Alpha:=AlphaBar.Position/256;
end;

procedure TMainFm.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
    Shadows1.CastShadow;
end;

end.
