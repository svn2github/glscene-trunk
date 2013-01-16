object Form1: TForm1
  Left = 270
  Top = 106
  BorderWidth = 3
  Caption = 'Bending Cylinder'
  ClientHeight = 379
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 534
    Height = 379
    Camera = GLCamera1
    Buffer.BackgroundColor = clBackground
    FieldOfView = 150.438476562500000000
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
  end
  object CBSpline: TCheckBox
    Left = 112
    Top = 8
    Width = 57
    Height = 17
    Caption = 'Splines'
    TabOrder = 1
    OnClick = CBSplineClick
  end
  object CBFat: TCheckBox
    Left = 200
    Top = 8
    Width = 57
    Height = 17
    Caption = 'Fat/Slim'
    TabOrder = 2
  end
  object PanelFPS: TPanel
    Left = 288
    Top = 8
    Width = 129
    Height = 17
    Caption = 'FPS'
    TabOrder = 3
  end
  object GLScene1: TGLScene
    Left = 8
    Top = 8
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000484200004842000048420000803F}
      SpotCutOff = 180.000000000000000000
    end
    object Pipe1: TGLPipe
      Position.Coordinates = {00000000000080BF000000000000803F}
      Nodes = <
        item
        end
        item
          Y = 1.000000000000000000
        end
        item
          X = -1.000000000000000000
          Y = 2.000000000000000000
        end>
      Parts = [ppOutside, ppStartDisk, ppStopDisk]
      Radius = 0.200000002980232200
    end
    object DummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = DummyCube1
      Position.Coordinates = {0000803F00004040000080400000803F}
      Left = 160
      Top = 120
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 40
    Top = 8
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 40
  end
end
