object Form1: TForm1
  Left = 155
  Top = 100
  BorderStyle = bsDialog
  Caption = 'GLCanvas vs GDI'
  ClientHeight = 329
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox: TPaintBox
    Left = 272
    Top = 64
    Width = 256
    Height = 256
  end
  object LAGLCanvas: TLabel
    Left = 8
    Top = 48
    Width = 76
    Height = 13
    Caption = 'GLCanvas: N/A'
  end
  object LAGDI: TLabel
    Left = 272
    Top = 48
    Width = 45
    Height = 13
    Caption = 'GDI: N/A'
  end
  object Bevel1: TBevel
    Left = 267
    Top = 48
    Width = 2
    Height = 273
  end
  object BULines: TButton
    Left = 8
    Top = 8
    Width = 73
    Height = 25
    Caption = '20k Lines'
    TabOrder = 0
    OnClick = BULinesClick
  end
  object BUEllipses: TButton
    Left = 88
    Top = 8
    Width = 73
    Height = 25
    Caption = '20k Ellipses'
    TabOrder = 1
    OnClick = BUEllipsesClick
  end
  object GLSceneViewer: TGLSceneViewer
    Left = 8
    Top = 64
    Width = 256
    Height = 256
    Camera = GLCamera1
    PostRender = GLSceneViewerPostRender
    Buffer.Lighting = False
  end
  object RBPenWidth1: TRadioButton
    Left = 432
    Top = 8
    Width = 89
    Height = 17
    Caption = 'Pen Width = 1'
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object RBPenWidth2: TRadioButton
    Left = 432
    Top = 24
    Width = 89
    Height = 17
    Caption = 'Pen Width = 2'
    TabOrder = 4
  end
  object BUPoints: TButton
    Left = 248
    Top = 8
    Width = 73
    Height = 25
    Caption = '200k Points'
    TabOrder = 5
    OnClick = BUPointsClick
  end
  object BURects: TButton
    Left = 168
    Top = 8
    Width = 73
    Height = 25
    Caption = '20k Rects'
    TabOrder = 6
    OnClick = BURectsClick
  end
  object BUTextOut: TButton
    Left = 328
    Top = 8
    Width = 73
    Height = 25
    Caption = '20k TextOut'
    TabOrder = 7
    OnClick = BUTextOutClick
  end
  object GLScene1: TGLScene
    Left = 16
    Top = 72
    object GLCamera1: TGLCamera
      DepthOfView = 100
      FocalLength = 50
    end
  end
  object WindowsBitmapFont: TWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Left = 464
    Top = 16
  end
end
