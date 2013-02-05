unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GLObjects, GLScene, StdCtrls, VectorGeometry, GLCadencer, GLWin32Viewer,
  GLGeomObjects, GLCrossPlatform, GLCoordinates, BaseClasses;

type
  TForm1 = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    DCSphere: TGLDummyCube;
    ArrowLine: TGLArrowLine;
    GLLightSource1: TGLLightSource;
    Sphere: TGLSphere;
    DCArrow: TGLDummyCube;
    GLCadencer1: TGLCadencer;
    Disk1: TGLDisk;
    Disk2: TGLDisk;
    Lines1: TGLLines;
    Plane1: TGLPlane;
    Lines2: TGLLines;
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
   // Make the blue sphere turn and ride a sin
   DCSphere.Turn(deltaTime*30);
   Sphere.Position.Y:=Sin(DegToRad(newTime*50))*3;

   // Make the arrow turn
   DCArrow.Turn(-deltaTime*15);

   // Make the arrow point toward the sphere, using Y as up reference
   ArrowLine.PointTo(Sphere, YHmgVector);
end;

end.
