unit UMainForm;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, CheckLst,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.Jpeg,

  // GLScene
  GLTexture, GLCadencer, GLWin32Viewer, GLScene, GLPostEffects,
  GLGraph, GLUtils, GLContext, GLVectorGeometry, GLGeomObjects, GLCoordinates,
  GLObjects, GLVectorFileObjects, GLSimpleNavigation, GLCrossPlatform, GLMaterial,
  GLBaseClasses,

  // GlScene shaders
  GLSLPostBlurShader, CGPostTransformationShader,

  // FileFormats
  TGA, GLFileMD2, GLFileMS3D, GLFile3DS;

type
  TPostShaderDemoForm = class(TForm)
    Scene: TGLScene;
    Viewer: TGLSceneViewer;
    Cadencer: TGLCadencer;
    Camera: TGLCamera;
    Light:  TGLLightSource;
    LightCube: TGLDummyCube;
    GLSphere1: TGLSphere;
    GLXYZGrid1: TGLXYZGrid;
    GLArrowLine1: TGLArrowLine;
    Panel1: TPanel;
    LightMovingCheckBox: TCheckBox;
    GUICube: TGLDummyCube;
    WorldCube: TGLDummyCube;
    Fighter: TGLActor;
    Teapot: TGLActor;
    Sphere_big: TGLActor;
    Sphere_little: TGLActor;
    MaterialLibrary: TGLMaterialLibrary;
    TurnPitchrollCheckBox: TCheckBox;
    Panel2: TPanel;
    ShaderCheckListBox: TCheckListBox;
    Label1: TLabel;
    BigBlurThicknessCheckbox: TCheckBox;
    GLSimpleNavigation1: TGLSimpleNavigation;
    PostShaderHolder: TGLPostShaderHolder;
    procedure FormCreate(Sender: TObject);
    procedure CadencerProgress(Sender: TObject; const deltaTime, newTime: double);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LightCubeProgress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure BigBlurThicknessCheckboxClick(Sender: TObject);
    procedure ShaderCheckListBoxClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  PostShaderDemoForm:  TPostShaderDemoForm;
  BlurShader: TGLSLPostBlurShader;
  TransformationShader: TGLCGPostTransformationShader;

implementation

{$R *.dfm}

procedure TPostShaderDemoForm.FormCreate(Sender: TObject);
begin
  // First load models.
  SetGLSceneMediaDir();
  Fighter.LoadFromFile('waste.md2'); //Fighter
  Fighter.SwitchToAnimation(0, True);
  Fighter.AnimationMode := aamLoop;
  Fighter.Scale.Scale(2);

  Teapot.LoadFromFile('Teapot.3ds'); //Teapot (no texture coordinates)
  Teapot.Scale.Scale(0.8);

  Sphere_big.LoadFromFile('Sphere_big.3DS');
  Sphere_big.Scale.Scale(70);

  Sphere_little.LoadFromFile('Sphere_little.3ds');
  Sphere_little.Scale.Scale(4);

  // Then load textures.
  MaterialLibrary.LibMaterialByName('Earth').Material.Texture.Image.LoadFromFile('Earth.jpg');
  MaterialLibrary.LibMaterialByName('Fighter').Material.Texture.Image.LoadFromFile('Waste.jpg');
  MaterialLibrary.LibMaterialByName('Noise').Material.Texture.Image.LoadFromFile('Flare1.bmp');

  // Blur Shader
  BlurShader := TGLSLPostBlurShader.Create(Self);
  PostShaderHolder.Shaders.Add.Shader := BlurShader;

  ShaderCheckListBox.Items.AddObject('Blur Shader', BlurShader);
  ShaderCheckListBox.Checked[0] := True;

  // Transformation Shader
  TransformationShader := TGLCGPostTransformationShader.Create(Self);
  TransformationShader.TransformationTexture := MaterialLibrary.LibMaterialByName('Noise').Material.Texture;
  PostShaderHolder.Shaders.Add.Shader := TransformationShader;

  ShaderCheckListBox.Items.AddObject('Transformation Shader', TransformationShader);
  ShaderCheckListBox.Checked[1] := True;
end;

procedure TPostShaderDemoForm.CadencerProgress(Sender: TObject; const deltaTime, newTime: double);
begin
  Viewer.Invalidate;

  if TurnPitchrollCheckBox.Checked then
  begin
    Fighter.Roll(20 * deltaTime);
    Sphere_big.Pitch(40 * deltaTime);
    Sphere_big.Turn(40 * deltaTime);
    Sphere_little.Roll(40 * deltaTime);
    Teapot.Roll(-20 * deltaTime);
  end;
end;

procedure TPostShaderDemoForm.LightCubeProgress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
  if LightMovingCheckBox.Checked then
    LightCube.MoveObjectAround(Camera.TargetObject, sin(NewTime) * deltaTime * 10, deltaTime * 20);
end;

procedure TPostShaderDemoForm.BigBlurThicknessCheckboxClick(Sender: TObject);
begin
  if BigBlurThicknessCheckbox.Checked then
    BlurShader.Threshold := 0.005
  else
    BlurShader.Threshold := 0.2;
end;

procedure TPostShaderDemoForm.ShaderCheckListBoxClick(Sender: TObject);
var
  I: Integer;
begin
  if ShaderCheckListBox.Items.Count <> 0 then
    for I := 0 to ShaderCheckListBox.Items.Count - 1 do
      TGLShader(ShaderCheckListBox.Items.Objects[I]).Enabled := ShaderCheckListBox.Checked[I];
end;

procedure TPostShaderDemoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cadencer.Enabled := False;
end;

end.