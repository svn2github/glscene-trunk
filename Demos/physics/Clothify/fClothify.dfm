object frmClothify: TfrmClothify
  Left = 7
  Top = 2
  Width = 750
  Height = 582
  Caption = 'Clothify'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  DesignSize = (
    742
    553)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 698
    Top = 0
    Width = 38
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '0,0 FPS'
  end
  object Label3: TLabel
    Left = 8
    Top = 0
    Width = 27
    Height = 13
    Caption = 'Slack'
  end
  object Label6: TLabel
    Left = 104
    Top = 0
    Width = 43
    Height = 13
    Caption = 'Iterations'
  end
  object Label7: TLabel
    Left = 192
    Top = 0
    Width = 34
    Height = 13
    Caption = 'Friction'
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 40
    Width = 742
    Height = 545
    Camera = GLCamera1
    Buffer.BackgroundColor = clGray
    Buffer.ContextOptions = [roDoubleBuffer, roStencilBuffer, roRenderToWindow, roTwoSideLighting]
    Buffer.FaceCulling = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnMouseMove = GLSceneViewer1MouseMove
  end
  object GroupBox_LoadForm: TGroupBox
    Left = 48
    Top = 88
    Width = 649
    Height = 65
    Caption = 'Load Settings'
    TabOrder = 1
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Mesh'
    end
    object Label4: TLabel
      Left = 152
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Mode'
    end
    object Label5: TLabel
      Left = 248
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Collider'
    end
    object ComboBox_MeshName: TComboBox
      Left = 8
      Top = 32
      Width = 137
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Trinityrage.smd, 0.15'
      Items.Strings = (
        'Trinityrage.smd, 0.15'
        'HalfSphere.ms3d, 2'
        'Cylinder.ms3d, 0.3'
        'lgrid.3ds, 3'
        'BigHoleBox2.ms3d, 0.5'
        'mushroom.3ds, 0.08'
        'polyhedron.3ds, 2'
        'teapot.3ds, 0.1')
    end
    object ComboBox_ConstraintType: TComboBox
      Left = 152
      Top = 32
      Width = 89
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Constraints'
      Items.Strings = (
        'Constraints'
        'Forces')
    end
    object ComboBox_Collider: TComboBox
      Left = 248
      Top = 32
      Width = 73
      Height = 21
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 2
      Text = 'Stairs'
      Items.Strings = (
        'Sphere'
        'Infinite Cylinder'
        'Cube'
        'Stairs'
        'Capsule'
        'ODE Sphere'
        '(none)')
    end
    object Button_LoadMesh: TButton
      Left = 549
      Top = 32
      Width = 36
      Height = 21
      Caption = 'OK'
      Default = True
      TabOrder = 3
      OnClick = Button_LoadMeshClick
    end
    object CheckBox_UseOctree: TCheckBox
      Left = 384
      Top = 34
      Width = 81
      Height = 17
      Caption = 'Use Octree'
      TabOrder = 4
    end
    object CheckBox_SolidEdges: TCheckBox
      Left = 464
      Top = 34
      Width = 81
      Height = 17
      Caption = 'Solid Edges'
      TabOrder = 5
    end
    object CheckBox_Weld: TCheckBox
      Left = 328
      Top = 34
      Width = 49
      Height = 17
      Caption = 'Weld'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object Button_CancelLoad: TButton
      Left = 589
      Top = 32
      Width = 44
      Height = 21
      Caption = 'Cancel'
      TabOrder = 7
      OnClick = Button_CancelLoadClick
    end
  end
  object Button_OpenLoadForm: TButton
    Left = 360
    Top = 11
    Width = 51
    Height = 21
    Caption = '&Load'
    TabOrder = 2
    OnClick = Button_OpenLoadFormClick
  end
  object TrackBar_Slack: TTrackBar
    Left = 0
    Top = 14
    Width = 97
    Height = 25
    Max = 100
    TabOrder = 3
    TickStyle = tsNone
    OnChange = TrackBar_SlackChange
  end
  object TrackBar_Iterations: TTrackBar
    Left = 96
    Top = 14
    Width = 81
    Height = 25
    Max = 30
    Min = 1
    Position = 4
    TabOrder = 4
    TickStyle = tsNone
    OnChange = TrackBar_IterationsChange
  end
  object TrackBar_Friction: TTrackBar
    Left = 184
    Top = 14
    Width = 81
    Height = 25
    Max = 100
    Position = 60
    TabOrder = 5
    TickStyle = tsNone
    OnChange = TrackBar_FrictionChange
  end
  object CheckBox_ShowOctree: TCheckBox
    Left = 272
    Top = 15
    Width = 81
    Height = 17
    Caption = 'Show Octree'
    TabOrder = 6
  end
  object GLScene1: TGLScene
    Left = 256
    Top = 192
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLDummyCube_Light: TGLDummyCube
        CubeSize = 1.000000000000000000
        object GLLightSource1: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          Position.Coordinates = {0000C040000090410000C0400000803F}
          SpotCutOff = 180.000000000000000000
        end
      end
      object GL_Capsule: TGLCylinder
        Direction.Coordinates = {F304353FF304353F0000000000000000}
        Up.Coordinates = {F30435BFF304353F0000000000000000}
        Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
        BottomRadius = 1.500000000000000000
        Height = 2.000000000000000000
        TopRadius = 1.500000000000000000
        object GLSphere2: TGLSphere
          Position.Coordinates = {000000000000803F000000000000803F}
          Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
          Radius = 1.500000000000000000
        end
        object GLSphere3: TGLSphere
          Position.Coordinates = {00000000000080BF000000000000803F}
          Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
          Radius = 1.500000000000000000
        end
      end
      object GLDummyCube2: TGLDummyCube
        Position.Coordinates = {0000000000007041000000000000803F}
        CubeSize = 1.000000000000000000
        object GLActor1: TGLActor
          Material.BackProperties.Diffuse.Color = {0000803F0000803F000000000000803F}
          Material.FrontProperties.Diffuse.Color = {1283003F0000803F000000000000803F}
          Material.FaceCulling = fcNoCull
          Interval = 100
          MaterialLibrary = GLMaterialLibrary1
        end
        object GLActor2: TGLActor
          Interval = 100
        end
      end
      object GLSphere1: TGLSphere
        Position.Coordinates = {00000000000000C0000000000000803F}
        Visible = False
        Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
        Radius = 2.000000000000000000
      end
      object GLCylinder1: TGLCylinder
        Direction.Coordinates = {0000803F000000000000008000000000}
        Position.Coordinates = {000000000000C0BF000000000000803F}
        Up.Coordinates = {00000000000000000000803F00000000}
        Visible = False
        Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
        BottomRadius = 1.500000000000000000
        Height = 50.000000000000000000
        Slices = 24
        Stacks = 16
        TopRadius = 1.500000000000000000
      end
      object GLShadowPlane1: TGLShadowPlane
        Direction.Coordinates = {000000000000803F0000000000000000}
        Position.Coordinates = {00000000EC51A0C0000000000000803F}
        Up.Coordinates = {0000000000000000000080BF00000000}
        Material.FrontProperties.Diffuse.Color = {1283003F1283003F000000000000803F}
        Height = 60.000000000000000000
        Width = 60.000000000000000000
        XTiles = 30
        YTiles = 30
        Style = [psTileTexture]
        ShadowingObject = GLDummyCube1
        ShadowedLight = GLLightSource1
        ShadowOptions = [spoUseStencil]
      end
      object GLCube1: TGLCube
        Position.Coordinates = {00000000000000C0000000000000803F}
        Visible = False
        Material.FrontProperties.Diffuse.Color = {8180003F8180003F0000803F0000803F}
        CubeSize = {000040400000404000004040}
      end
      object GLDummyCube_Stairs: TGLDummyCube
        Visible = False
        CubeSize = 1.000000000000000000
        object GLCube_Stair1: TGLCube
          Position.Coordinates = {0000000000000040000000000000803F}
          Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
          CubeSize = {000000400000004000006041}
        end
        object GLCube_Stair2: TGLCube
          Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
          CubeSize = {0000C0400000004000006041}
        end
        object GLCube_Stair3: TGLCube
          Position.Coordinates = {00000000000000C0000000000000803F}
          Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
          CubeSize = {000020410000004000006041}
        end
        object GLCube_Stair4: TGLCube
          Position.Coordinates = {00000000000080C0000000000000803F}
          Material.FrontProperties.Diffuse.Color = {1283003F1283003F0000803F0000803F}
          CubeSize = {000060410000004000006041}
        end
      end
    end
    object GLDirectOpenGL1: TGLDirectOpenGL
      UseBuildList = False
      OnRender = GLDirectOpenGL1Render
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 75.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000704100002041000070410000803F}
    end
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Left = 288
    Top = 192
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 360
    Top = 192
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 328
    Top = 192
  end
end
