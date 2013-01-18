unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, GLScene, GLObjects, GLCadencer, GLTexture, GLCgShader,
  GLWin32Viewer, CgGL, GLVectorFileObjects, JPEG, AsyncTimer,
  GLCrossPlatform, GLMaterial, GLCoordinates, BaseClasses, GLUtils;

type
  TForm1 = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    CgCellShader: TCgShader;
    GLMaterialLibrary1: TGLMaterialLibrary;
    GLCadencer1: TGLCadencer;
    GLCamera1: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLLightSource1: TGLLightSource;
    GLActor1: TGLActor;
    AsyncTimer1: TAsyncTimer;
    procedure GLSceneViewer1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure CgCellShaderApplyVP(CgProgram: TCgProgram; Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CgCellShaderInitialize(CgShader: TCustomCgShader);
    procedure CgCellShaderApplyFP(CgProgram: TCgProgram; Sender: TObject);
    procedure CgCellShaderUnApplyFP(CgProgram: TCgProgram);
    procedure AsyncTimer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mx, my : Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  GLFileMD2;

procedure TForm1.FormCreate(Sender: TObject);
var
  r : Single;
begin
  // Load the vertex and fragment Cg programs from project dir
  CgCellShader.VertexProgram.LoadFromFile('cellshading_vp.cg');
  CgCellShader.FragmentProgram.LoadFromFile('cellshading_fp.cg');

  // Load and scale the actor from media dir
  SetGLSceneMediaDir();
  GLActor1.LoadFromFile('waste.md2');

  r:=GLActor1.BoundingSphereRadius;
  GLActor1.Scale.SetVector(2.5/r,2.5/r,2.5/r);
  GLActor1.AnimationMode:=aamLoop;
  // Load the texture
  GLMaterialLibrary1.Materials[0].Material.Texture.Image.LoadFromFile('wastecell.jpg');
end;

procedure TForm1.CgCellShaderApplyVP(CgProgram: TCgProgram; Sender: TObject);
begin
  // Apply the per frame uniform parameters
  with CgProgram do begin
    ParamByName('LightDir').SetAsVector(GLLightSource1.AbsoluteDirection);
    ParamByName('ModelViewProj').SetAsStateMatrix( CG_GL_MODELVIEW_PROJECTION_MATRIX, CG_GL_MATRIX_IDENTITY);
    ParamByName('ModelViewIT').SetAsStateMatrix( CG_GL_MODELVIEW_MATRIX, CG_GL_MATRIX_INVERSE_TRANSPOSE);
  end;
end;

procedure TForm1.CgCellShaderInitialize(CgShader: TCustomCgShader);
begin
  // Set up the texture sampler parameter
  CgCellShader.FragmentProgram.ParamByName('Map0').SetAsTexture2D(GLMaterialLibrary1.Materials[0].Material.Texture.Handle);
end;

procedure TForm1.CgCellShaderApplyFP(CgProgram: TCgProgram; Sender: TObject);
begin
  // Enable the texture map sampler for use in the fragment
  // program
  CgProgram.ParamByName('Map0').EnableTexture();
end;

procedure TForm1.CgCellShaderUnApplyFP(CgProgram: TCgProgram);
begin
  // Disable the texture map sampler
  CgProgram.ParamByName('Map0').DisableTexture();
end;

procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx:=X;
  my:=Y;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    GLCamera1.MoveAroundTarget(my-Y,mx-X);
  mx:=X;
  my:=Y;
end;

procedure TForm1.AsyncTimer1Timer(Sender: TObject);
begin
  Form1.Caption:=Format('Cg Cell Shading - %.2f FPS',[GLSceneViewer1.FramesPerSecond]);
  GLSceneViewer1.ResetPerformanceMonitor;
end;

end.
