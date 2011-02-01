object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 507
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 723
    Height = 507
    Camera = GLCamera1
    FieldOfView = 157.684555053710900000
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    TabOrder = 0
  end
  object SpinEdit1: TSpinEdit
    Left = 16
    Top = 103
    Width = 75
    Height = 22
    EditorEnabled = False
    MaxValue = 20
    MinValue = 0
    TabOrder = 1
    Value = 1
  end
  object SpinEdit2: TSpinEdit
    Left = 16
    Top = 159
    Width = 75
    Height = 22
    EditorEnabled = False
    MaxValue = 10
    MinValue = 0
    TabOrder = 2
    Value = 1
  end
  object SpinEdit3: TSpinEdit
    Left = 16
    Top = 215
    Width = 75
    Height = 22
    EditorEnabled = False
    MaxValue = 10
    MinValue = 0
    TabOrder = 3
    Value = 1
  end
  object GLScene1: TGLScene
    Left = 144
    Top = 16
    object GLCamera1: TGLCamera
      DepthOfView = 10000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = Mag
      Position.Coordinates = {000000000000A040000070410000803F}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object GLPlane1: TGLPlane
      Material.FrontProperties.Diffuse.Color = {000000000000803F0000803F0000803F}
      Material.FrontProperties.Emission.Color = {00000000F8FEFE3E0000803F0000803F}
      Material.BlendingMode = bmModulate
      Material.FaceCulling = fcNoCull
      Direction.Coordinates = {000000000000803F0000000000000000}
      Up.Coordinates = {0000000000000000000080BF00000000}
      Height = 50.000000000000000000
      Width = 50.000000000000000000
    end
    object Mag: TGLDummyCube
      Position.Coordinates = {000000000000A0C0000000000000803F}
      CubeSize = 1.000000000000000000
    end
    object obj: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLCylinder1: TGLCylinder
        Material.FrontProperties.Diffuse.Color = {3D0A173F85EBD13E52B89E3E0000803F}
        Position.Coordinates = {0000000000008040000000000000803F}
        BottomRadius = 3.000000000000000000
        Height = 4.000000000000000000
        TopRadius = 3.000000000000000000
        BehavioursData = {
          0458434F4C02010201060D54474C4E474444796E616D69630200060C68696768
          2064656E7369747902000200060D474C4E47444D616E61676572310800090F0A
          D7233C12000000000200090FCDCCCC3D0F0000A040090F000000000200080200
          080200090000000000000000000000000000803F020008}
      end
      object GLCone1: TGLCone
        Position.Coordinates = {000000000000C040000000000000803F}
        BottomRadius = 2.000000000000000000
        Height = 3.000000000000000000
        BehavioursData = {
          0458434F4C02010201060D54474C4E474444796E616D69630200060E6E6F726D
          616C2064656E7369747902000200060D474C4E47444D616E6167657231080009
          0F0AD7233C12000000000200090FCDCCCC3D0F0000803F090F00000000020008
          020008020008020008}
      end
      object GLCube2: TGLCube
        Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Position.Coordinates = {0000000000000041000000000000803F}
        BehavioursData = {
          0458434F4C02010201060D54474C4E474444796E616D69630200060B6C6F7720
          64656E7369747902000200060D474C4E47444D616E61676572310800090F0AD7
          233C12000000000200090FCDCCCC3D0F0000003F090F00000000020008020008
          0200090000000000000000000000000000803F020008}
        CubeSize = {000040400000404000004040}
      end
      object SubMarine: TGLCube
        Direction.Coordinates = {F304353FFFFFFF3E0100003F00000000}
        PitchAngle = 45.000000000000000000
        Position.Coordinates = {0000A0400000C040000000000000803F}
        TurnAngle = 45.000000000000000000
        Up.Coordinates = {5C67A332F404353FF20435BF00000000}
        BehavioursData = {
          0458434F4C02010201060D54474C4E474444796E616D69630200060E6E6F726D
          616C2064656E7369747902000200060D474C4E47444D616E6167657231080009
          0F0AD7233C12000000000200090FCDCCCC3D0F0000803F090F00000000020008
          0200080200090000000000000000000000000000803F020008}
        CubeSize = {0000803F0000803F0000A040}
      end
      object GLLeadSphere: TGLSphere
        Material.FrontProperties.Diffuse.Color = {3D0A173F85EBD13E52B89E3E0000803F}
        Position.Coordinates = {000080C00000803F000040C00000803F}
        Up.Coordinates = {000000000000803F0000008000000000}
        Radius = 2.000000000000000000
        BehavioursData = {
          0458434F4C02010201060D54474C4E474444796E616D69630200060C68696768
          2064656E7369747902000200060D474C4E47444D616E61676572310800090F0A
          D7233C12000000000200090FCDCCCC3D0F00002041090F000000000200080200
          080200090000000000000000000000000000803F020008}
      end
      object GLPaperSphere: TGLSphere
        Material.FrontProperties.Diffuse.Color = {0000803F0000803F0000803F0000803F}
        Position.Coordinates = {000080C00000A0C0000000000000803F}
        Up.Coordinates = {000000000000803F0000008000000000}
        Radius = 2.000000000000000000
        BehavioursData = {
          0458434F4C02010201060D54474C4E474444796E616D69630200060B6C6F7720
          64656E7369747902000200060D474C4E47444D616E61676572310800090F0AD7
          233C12000000000200090FCDCCCC3D0FCDCCCC3D090F00000000020008020008
          0200090000000000000000000000000000803F020008}
      end
      object GLCapsule1: TGLCapsule
        Height = 5.000000000000000000
        Slices = 4
        Stacks = 4
        Radius = 1.500000000000000000
        BehavioursData = {
          0458434F4C02010201060D54474C4E474444796E616D69630200060E6E6F726D
          616C2064656E7369747902000200060D474C4E47444D616E6167657231080009
          0F0AD7233C12000000000200090FCDCCCC3D0F0000803F090F00000000020008
          020008020008020008}
      end
    end
    object GLCube1: TGLCube
      Position.Coordinates = {00000000000020C1000000000000803F}
      Up.Coordinates = {000000000000803F0000008000000000}
      BehavioursData = {
        0458434F4C02010201060C54474C4E4744537461746963020006067365616265
        6402000200060D474C4E47444D616E61676572310800090F0AD7233C12000000
        00}
      CubeSize = {000048420000803F00004842}
    end
    object GLHUDText1: TGLHUDText
      Position.Coordinates = {0000704100000243000000000000803F}
      BitmapFont = GLStoredBitmapFont1
      Text = 'Water Density'
      ModulateColor.Color = {0000000000000000000000000000803F}
    end
    object GLHUDText2: TGLHUDText
      Position.Coordinates = {0000704100003E43000000000000803F}
      BitmapFont = GLStoredBitmapFont1
      Text = 'Linear Viscosity'
      ModulateColor.Color = {0000000000000000000000000000803F}
    end
    object GLHUDText3: TGLHUDText
      Position.Coordinates = {0000704100007043000000000000803F}
      BitmapFont = GLStoredBitmapFont1
      Text = 'Angular Viscosity'
      ModulateColor.Color = {0000000000000000000000000000803F}
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 200
    Top = 16
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer1
    FormCaption = 'Form1 - %FPS'
    KeyCombinations = <
      item
        ShiftState = [ssLeft, ssRight]
        Action = snaZoom
      end
      item
        ShiftState = [ssRight]
        Action = snaMoveAroundTarget
      end>
    Left = 80
    Top = 16
  end
  object GLStoredBitmapFont1: TGLStoredBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 376
    Top = 16
  end
  object GLNGDManager1: TGLNGDManager
    NewtonSurfaceItem = <>
    NewtonSurfacePair = <>
    NewtonJoint = <>
    Left = 264
    Top = 16
  end
end
