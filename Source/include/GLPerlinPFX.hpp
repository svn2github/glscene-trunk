// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLPerlinPFX.pas' rev: 24.00 (Win32)

#ifndef GlperlinpfxHPP
#define GlperlinpfxHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <GLParticleFX.hpp>	// Pascal unit
#include <GLGraphics.hpp>	// Pascal unit
#include <GLCrossPlatform.hpp>	// Pascal unit
#include <GLCadencer.hpp>	// Pascal unit
#include <GLColor.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glperlinpfx
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TGLPerlinPFXManager;
class PASCALIMPLEMENTATION TGLPerlinPFXManager : public Glparticlefx::TGLBaseSpritePFXManager
{
	typedef Glparticlefx::TGLBaseSpritePFXManager inherited;
	
private:
	int FTexMapSize;
	int FNoiseSeed;
	int FNoiseScale;
	int FNoiseAmplitude;
	float FSmoothness;
	float FBrightness;
	float FGamma;
	
protected:
	virtual void __fastcall PrepareImage(Glgraphics::TGLImage* bmp32, int &texFormat);
	void __fastcall SetTexMapSize(const int val);
	void __fastcall SetNoiseSeed(const int val);
	void __fastcall SetNoiseScale(const int val);
	void __fastcall SetNoiseAmplitude(const int val);
	void __fastcall SetSmoothness(const float val);
	void __fastcall SetBrightness(const float val);
	void __fastcall SetGamma(const float val);
	
public:
	__fastcall virtual TGLPerlinPFXManager(System::Classes::TComponent* aOwner);
	__fastcall virtual ~TGLPerlinPFXManager(void);
	
__published:
	__property int TexMapSize = {read=FTexMapSize, write=SetTexMapSize, default=6};
	__property float Smoothness = {read=FSmoothness, write=SetSmoothness};
	__property float Brightness = {read=FBrightness, write=SetBrightness};
	__property float Gamma = {read=FGamma, write=SetGamma};
	__property int NoiseSeed = {read=FNoiseSeed, write=SetNoiseSeed, default=0};
	__property int NoiseScale = {read=FNoiseScale, write=SetNoiseScale, default=100};
	__property int NoiseAmplitude = {read=FNoiseAmplitude, write=SetNoiseAmplitude, default=50};
	__property ColorMode = {default=1};
	__property SpritesPerTexture = {default=1};
	__property ParticleSize = {default=0};
	__property ColorInner;
	__property ColorOuter;
	__property LifeColors;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Glperlinpfx */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLPERLINPFX)
using namespace Glperlinpfx;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlperlinpfxHPP
