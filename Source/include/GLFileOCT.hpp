// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLFileOCT.pas' rev: 24.00 (Win32)

#ifndef GlfileoctHPP
#define GlfileoctHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <GLVectorFileObjects.hpp>	// Pascal unit
#include <VectorGeometry.hpp>	// Pascal unit
#include <ApplicationFileIO.hpp>	// Pascal unit
#include <FileOCT.hpp>	// Pascal unit
#include <BaseClasses.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glfileoct
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TGLOCTVectorFile;
class PASCALIMPLEMENTATION TGLOCTVectorFile : public Glvectorfileobjects::TVectorFile
{
	typedef Glvectorfileobjects::TVectorFile inherited;
	
public:
	__classmethod virtual Applicationfileio::TDataFileCapabilities __fastcall Capabilities();
	DYNAMIC void __fastcall LoadFromStream(System::Classes::TStream* aStream);
public:
	/* TVectorFile.Create */ inline __fastcall virtual TGLOCTVectorFile(System::Classes::TPersistent* AOwner) : Glvectorfileobjects::TVectorFile(AOwner) { }
	
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TGLOCTVectorFile(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE float vGLFileOCTLightmapBrightness;
extern PACKAGE float vGLFileOCTLightmapGammaCorrection;
extern PACKAGE bool vGLFileOCTAllocateMaterials;
}	/* namespace Glfileoct */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLFILEOCT)
using namespace Glfileoct;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlfileoctHPP
