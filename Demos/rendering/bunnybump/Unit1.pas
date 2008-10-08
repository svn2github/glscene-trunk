{: Using the GLBumpShader for object space bump mapping.<p>

   The bump shader runs an ambient light pass and a pass for 
   each light shining in the scene. There are currently 2 
   bump methods: a dot3 texture combiner and a basic ARB 
   fragment program.<p> 
   
   The dot3 texture combiner only supports diffuse lighting 
   but is fast and works on lower end graphics adapters.<p>

   The basic ARBFP method supports diffuse and specular 
   lighting<p>
   
   Both methods pick up the light and material options 
   through the OpenGL state.<p>

   The normal map is expected as the primary texture.<p>

   Diffuse textures are supported through the secondary
   texture and can be enabled using the boDiffuseTexture2
   bump option.<p>

   Specular textures are supported through the tertiary
   texture and can be enabled using the boSpecularTexture3
   bump option and setting the SpecularMode to smBlinn or
   smPhong (smOff will disable specular in the shader).<p>
   
   With the boLightAttenutation flag set the shader will
   use the OpenGL light attenuation coefficients when
   calculating light intensity.<p>
}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, GLObjects, GLTexture, GLBumpShader, GLScene,
  GLVectorFileObjects, GLCadencer, GLWin32Viewer, JPEG, ExtCtrls,
  StdCtrls, AsyncTimer, GLCrossPlatform, GLMaterial, GLCoordinates, BaseClasses;

type
  TForm1 = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCadencer1: TGLCadencer;
    GLMaterialLibrary1: TGLMaterialLibrary;
    Camera: TGLCamera;
    WhiteLight: TGLLightSource;
    Bunny: TGLFreeForm;
    RedLight: TGLLightSource;
    BlueLight: TGLLightSource;
    GLBumpShader1: TGLBumpShader;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    ColorDialog1: TColorDialog;
    DCLights: TGLDummyCube;
    AsyncTimer1: TAsyncTimer;
    CheckBox4: TCheckBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewer1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure ShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBoxClick(Sender: TObject);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GLSceneViewer1BeforeRender(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mx, my, dx, dy : Integer;
    IsInitialized : Boolean;
    StartHeight : Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses VectorGeometry, OpenGL1x;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SetCurrentDir(ExtractFilePath(Application.ExeName)+'..\..\media');

  // Load the bunny mesh and scale for viewing
  Bunny.LoadFromFile('bunny.glsm');
  Bunny.Scale.Scale(2/Bunny.BoundingSphereRadius);

  // Load the normal map
  with GLMaterialLibrary1.Materials[0].Material.Texture.Image do
    LoadFromFile('bunnynormals.jpg');

  // Link the lights to their toggles
  CheckBox1.Tag:=Integer(WhiteLight);
  CheckBox2.Tag:=Integer(RedLight);
  CheckBox3.Tag:=Integer(BlueLight);
  Shape1.Tag:=Integer(WhiteLight);
  Shape2.Tag:=Integer(RedLight);
  Shape3.Tag:=Integer(BlueLight);

  ComboBox1.ItemIndex:=0;
  ComboBox1Change(nil);

  StartHeight:=Height;
end;

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
  // Orbit the camera
  if (dx<>0) or (dy<>0) then begin
    Camera.MoveAroundTarget(dy, dx);
    dx:=0;
    dy:=0;
  end;

  // Rotate the light sources
  if CheckBox4.Checked then
    DCLights.Turn(deltaTime*20);

  GLSceneViewer1.Invalidate;
end;

procedure TForm1.CheckBoxClick(Sender: TObject);
begin
  // Light Shining CheckBox
  TGLLightSource(TCheckBox(Sender).Tag).Shining:=TCheckBox(Sender).Checked;
end;

procedure TForm1.ShapeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // Light Color Dialog
  ColorDialog1.Color:=TShape(Sender).Brush.Color;
  if ColorDialog1.Execute then begin
    TShape(Sender).Brush.Color:=ColorDialog1.Color;
    with TGLLightSource(TShape(Sender).Tag) do
      Diffuse.AsWinColor:=ColorDialog1.Color;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text = 'Per-Vertex' then
    Bunny.Material.LibMaterialName:=''
  else if ComboBox1.Text = 'Dot3 Texture Combiner' then begin
    Bunny.Material.LibMaterialName:='Bump';
    GLBumpShader1.BumpMethod:=bmDot3TexCombiner;
  end else if ComboBox1.Text = 'Basic Fragment Program' then begin
    Bunny.Material.LibMaterialName:='Bump';
    GLBumpShader1.BumpMethod:=bmBasicARBFP;
  end;
end;

procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mx:=x;
  my:=y;
  dx:=0;
  dy:=0;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then begin
    dx:=dx+(mx-x);
    dy:=dy+(my-y);
  end else begin
    dx:=0;
    dy:=0;
  end;
  mx:=x;
  my:=y;
end;

procedure TForm1.AsyncTimer1Timer(Sender: TObject);
begin
  Form1.Caption:='GLBumpShader Demo - '+GLSceneViewer1.FramesPerSecondText;
  GLSceneViewer1.ResetPerformanceMonitor;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Camera.SceneScale:=Height/StartHeight;
end;

procedure TForm1.GLSceneViewer1BeforeRender(Sender: TObject);
begin
  if IsInitialized then exit;

  if  GL_ARB_multitexture
  and GL_ARB_vertex_program
  and GL_ARB_texture_env_dot3 then
    ComboBox1.Items.Add('Dot3 Texture Combiner');
  if  GL_ARB_multitexture
  and GL_ARB_vertex_program
  and GL_ARB_fragment_program then begin
    ComboBox1.Items.Add('Basic Fragment Program');
    if GLSceneViewer1.Buffer.LimitOf[limNbTextureUnits]<3 then
      GLBumpShader1.SpecularMode:=smOff;
  end;

  IsInitialized:=True;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
    0 : GLBumpShader1.SpecularMode:=smOff;
    1 : GLBumpShader1.SpecularMode:=smBlinn;
    2 : GLBumpShader1.SpecularMode:=smPhong;
  end;
end;

end.
