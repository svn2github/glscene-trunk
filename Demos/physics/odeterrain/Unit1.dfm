object Form1: TForm1
  Left = 192
  Top = 115
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 415
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 603
    Height = 415
    Camera = GLCamera1
    BeforeRender = GLSceneViewer1BeforeRender
    Buffer.FogEnvironment.FogColor.Color = {0000803F0000803F0000803F0000803F}
    Buffer.FogEnvironment.FogStart = 200.000000000000000000
    Buffer.FogEnvironment.FogEnd = 650.000000000000000000
    Buffer.FogEnvironment.FogDistance = fdEyeRadial
    Buffer.BackgroundColor = clGray
    Buffer.FogEnable = True
    Buffer.Lighting = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
  end
  object GLBitmapHDS1: TGLBitmapHDS
    MaxPoolSize = 0
    Left = 56
    Top = 16
  end
  object GLScene1: TGLScene
    ObjectsSorting = osNone
    Left = 56
    Top = 56
    object SkyDome1: TGLSkyDome
      Up.Coordinates = {000000000000803F0000008000000000}
      Bands = <
        item
          StartAngle = -5.000000000000000000
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 25.000000000000000000
          Slices = 9
        end
        item
          StartAngle = 25.000000000000000000
          StopAngle = 90.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          Slices = 9
          Stacks = 4
        end>
      Stars = <>
      Options = [sdoTwinkle]
      object SPMoon: TGLSprite
        Position.Coordinates = {00000C430000C842000096420000803F}
        Visible = False
        Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Emission.Color = {0000803F0000803F0000803F0000803F}
        Material.BlendingMode = bmTransparency
        Material.MaterialOptions = [moIgnoreFog]
        Material.Texture.ImageAlpha = tiaSuperBlackTransparent
        Material.Texture.TextureMode = tmReplace
        Material.Texture.Compression = tcNone
        Material.Texture.Disabled = False
        Width = 30.000000000000000000
        Height = 30.000000000000000000
        NoZWrite = True
        MirrorU = False
        MirrorV = False
      end
      object SPSun: TGLSprite
        Position.Coordinates = {00000C430000C842000096420000803F}
        Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000000000000000000000000000803F}
        Material.BlendingMode = bmAdditive
        Material.MaterialOptions = [moIgnoreFog]
        Material.Texture.TextureMode = tmReplace
        Material.Texture.TextureFormat = tfLuminance
        Material.Texture.Compression = tcNone
        Material.Texture.Disabled = False
        Width = 60.000000000000000000
        Height = 60.000000000000000000
        NoZWrite = True
        MirrorU = False
        MirrorV = False
      end
    end
    object TerrainRenderer1: TGLTerrainRenderer
      Scale.Coordinates = {00008040000080400000803E00000000}
      Up.Coordinates = {000000000000803F0000008000000000}
      Material.MaterialLibrary = GLMaterialLibrary1
      Material.LibMaterialName = 'ground'
      HeightDataSource = GLBitmapHDS1
      TileSize = 32
      TilesPerTexture = 1.000000000000000000
      QualityDistance = 150.000000000000000000
    end
    object HUDText1: TGLHUDText
      Position.Coordinates = {000096420000C841000000000000803F}
      BitmapFont = BitmapFont1
      Alignment = taLeftJustify
      Layout = tlTop
    end
    object GLLensFlare: TGLLensFlare
      Size = 100
      Seed = 978
      Position.Coordinates = {9A620252C9B28B51B743BAD10000803F}
      Visible = False
      object GLDummyCube1: TGLDummyCube
        CubeSize = 100.000000000000000000
        VisibleAtRunTime = True
      end
    end
    object GLCamera1: TGLCamera
      DepthOfView = 650.000000000000000000
      FocalLength = 50.000000000000000000
      Position.Coordinates = {000000000000C841000020410000803F}
      Direction.Coordinates = {000000000000803F0000000000000000}
      Up.Coordinates = {00000000000000000000803F00000000}
      Left = 264
      Top = 160
      object ODEDrop: TGLDummyCube
        Position.Coordinates = {0000000000000000000020410000803F}
        CubeSize = 1.000000000000000000
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 56
    Top = 96
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 16
    Top = 16
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Materials = <
      item
        Name = 'ground'
        Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Emission.Color = {9A99993E9A99993E9A99993E0000803F}
        Material.Texture.TextureMode = tmReplace
        Material.Texture.Compression = tcStandard
        Material.Texture.MappingTCoordinates.Coordinates = {000000000000803F0000000000000000}
        Material.Texture.Disabled = False
        Tag = 0
        Texture2Name = 'details'
      end
      item
        Name = 'details'
        Material.Texture.TextureMode = tmModulate
        Material.Texture.TextureFormat = tfLuminance
        Material.Texture.Compression = tcStandard
        Material.Texture.MappingTCoordinates.Coordinates = {000000000000803F0000000000000000}
        Material.Texture.Disabled = False
        Tag = 0
        TextureScale.Coordinates = {00000043000000430000004300000000}
      end>
    Left = 16
    Top = 56
  end
  object BitmapFont1: TGLBitmapFont
    GlyphsIntervalX = 1
    GlyphsIntervalY = 1
    Ranges = <
      item
        StartASCII = ' '
        StopASCII = 'Z'
        StartGlyphIdx = 0
      end>
    CharWidth = 30
    CharHeight = 30
    Left = 16
    Top = 96
  end
  object GLODEManager1: TGLODEManager
    StepFast = False
    FastIterations = 5
    Left = 96
    Top = 56
  end
  object GLNavigator1: TGLNavigator
    VirtualUp.Coordinates = {00000000000000000000803F0000803F}
    MovingObject = GLCamera1
    UseVirtualUp = True
    AutoUpdateObject = True
    AngleLock = False
    Left = 96
    Top = 96
  end
end
