//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <GLWin32FullScreenViewer.hpp>  // Pascal unit
#include <GLCrossPlatform.hpp>  // Pascal unit
#include <VectorGeometry.hpp>   // Pascal unit
#include <GLBehaviours.hpp>     // Pascal unit
#include <GLMisc.hpp>           // Pascal unit
#include <GLWin32Viewer.hpp>    // Pascal unit
#include <GLObjects.hpp>        // Pascal unit
#include <GLScene.hpp>          // Pascal unit
#include <GLCadencer.hpp>       // Pascal unit
#include <GLParticleFX.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>         // Pascal unit
//---------------------------------------------------------------------------
class TForm1:public TForm
{
__published:                   // IDE-managed Components
  TGLScene * GLScene;
  TGLSceneViewer *GLSceneViewer;
  TGLDummyCube *DCBase;
  TGLDummyCube *DCSrc;
  TGLPolygonPFXManager *PFXSpiral;
  TGLCadencer *GLCadencer;
  TGLParticleFXRenderer *PFXRenderer;
  TGLCamera *GLCamera;
  TTimer *Timer;
  TGLPolygonPFXManager *PFXRing;
  TGLFullScreenViewer *GLFullScreenViewer;
  TPanel *Panel1;
  TSpeedButton *SpeedButton1;
  void __fastcall TimerTimer(TObject * Sender);
  void __fastcall FormResize(TObject * Sender);
  void __fastcall GLSceneViewerDblClick(TObject * Sender);
  void __fastcall GLFullScreenViewerDblClick(TObject * Sender);
  void __fastcall GLFullScreenViewerKeyPress(TObject * Sender, char &Key);
  void __fastcall GLSceneViewerMouseMove(TObject * Sender, TShiftState Shift,
                                         int X, int Y);
private:                       // User declarations
public:                        // User declarations
    __fastcall TForm1(TComponent * Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif

