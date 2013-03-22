// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLAVIRecorder.pas' rev: 24.00 (Win32)

#ifndef GlavirecorderHPP
#define GlavirecorderHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <GLSVfw.hpp>	// Pascal unit
#include <GLScene.hpp>	// Pascal unit
#include <GLViewer.hpp>	// Pascal unit
#include <GLWin32Viewer.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glavirecorder
{
//-- type declarations -------------------------------------------------------
enum TAVICompressor : unsigned char { acDefault, acShowDialog, acDivX };

typedef Glsvfw::_di_IAVIStream *PAVIStream;

enum TAVISizeRestriction : unsigned char { srNoRestriction, srForceBlock2x2, srForceBlock4x4, srForceBlock8x8 };

enum TAVIRecorderState : unsigned char { rsNone, rsRecording };

enum TAVIImageRetrievalMode : unsigned char { irmSnapShot, irmRenderToBitmap, irmBitBlt };

typedef void __fastcall (__closure *TAVIRecorderPostProcessEvent)(System::TObject* Sender, Vcl::Graphics::TBitmap* frame);

class DELPHICLASS TAVIRecorder;
class PASCALIMPLEMENTATION TAVIRecorder : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
private:
	Vcl::Graphics::TBitmap* AVIBitmap;
	int AVIFrameIndex;
	int AVI_DPI;
	Glsvfw::TAVIStreamInfoW asi;
	Glsvfw::_di_IAVIFile pfile;
	Glsvfw::_di_IAVIStream Stream;
	Glsvfw::_di_IAVIStream Stream_c;
	tagBITMAPINFOHEADER *FBitmapInfo;
	void *FBitmapBits;
	unsigned FBitmapSize;
	System::UnicodeString FTempName;
	System::UnicodeString FAVIFilename;
	System::Byte FFPS;
	int FWidth;
	int FHeight;
	TAVISizeRestriction FSizeRestriction;
	TAVIImageRetrievalMode FImageRetrievalMode;
	TAVIRecorderState RecorderState;
	TAVIRecorderPostProcessEvent FOnPostProcessEvent;
	Glscene::TGLSceneBuffer* FBuffer;
	void __fastcall SetHeight(const int val);
	void __fastcall SetWidth(const int val);
	void __fastcall SetSizeRestriction(const TAVISizeRestriction val);
	void __fastcall SetGLSceneViewer(Glwin32viewer::TGLSceneViewer* const Value);
	void __fastcall SetGLNonVisualViewer(Glscene::TGLNonVisualViewer* const Value);
	
protected:
	Glwin32viewer::TGLSceneViewer* FGLSceneViewer;
	Glscene::TGLNonVisualViewer* FGLNonVisualViewer;
	TAVICompressor FCompressor;
	int __fastcall Restricted(int s);
	void __fastcall InternalAddAVIFrame(void);
	
public:
	__fastcall virtual TAVIRecorder(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TAVIRecorder(void);
	bool __fastcall CreateAVIFile(int DPI = 0x0);
	void __fastcall AddAVIFrame(void)/* overload */;
	void __fastcall AddAVIFrame(Vcl::Graphics::TBitmap* bmp)/* overload */;
	void __fastcall CloseAVIFile(bool UserAbort = false);
	bool __fastcall Recording(void);
	
__published:
	__property System::Byte FPS = {read=FFPS, write=FFPS, default=25};
	__property Glwin32viewer::TGLSceneViewer* GLSceneViewer = {read=FGLSceneViewer, write=SetGLSceneViewer};
	__property Glscene::TGLNonVisualViewer* GLNonVisualViewer = {read=FGLNonVisualViewer, write=SetGLNonVisualViewer};
	__property int Width = {read=FWidth, write=SetWidth, nodefault};
	__property int Height = {read=FHeight, write=SetHeight, nodefault};
	__property System::UnicodeString Filename = {read=FAVIFilename, write=FAVIFilename};
	__property TAVICompressor Compressor = {read=FCompressor, write=FCompressor, default=0};
	__property TAVISizeRestriction SizeRestriction = {read=FSizeRestriction, write=SetSizeRestriction, default=3};
	__property TAVIImageRetrievalMode ImageRetrievalMode = {read=FImageRetrievalMode, write=FImageRetrievalMode, default=2};
	__property TAVIRecorderPostProcessEvent OnPostProcessEvent = {read=FOnPostProcessEvent, write=FOnPostProcessEvent};
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Glavirecorder */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLAVIRECORDER)
using namespace Glavirecorder;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlavirecorderHPP
