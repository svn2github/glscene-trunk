// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'OpenGLTokens.pas' rev: 24.00 (Win32)

#ifndef OpengltokensHPP
#define OpengltokensHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <VectorTypes.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Opengltokens
{
//-- type declarations -------------------------------------------------------
typedef char * PGLChar;

typedef System::AnsiString TGLString;

typedef unsigned GLenum;

typedef unsigned TGLenum;

typedef unsigned *PGLenum;

typedef System::ByteBool GLboolean;

typedef System::ByteBool TGLboolean;

typedef System::ByteBool *PGLboolean;

typedef unsigned GLbitfield;

typedef unsigned TGLbitfield;

typedef unsigned *PGLbitfield;

typedef System::Int8 GLbyte;

typedef System::Int8 TGLbyte;

typedef System::Int8 *PGLbyte;

typedef short GLshort;

typedef short TGLshort;

typedef short *PGLshort;

typedef int GLint;

typedef int TGLint;

typedef int *PGLint;

typedef int GLsizei;

typedef int TGLsizei;

typedef int *PGLsizei;

typedef __int64 GLint64;

typedef __int64 TGLint64;

typedef __int64 *PGLint64;

typedef __int64 GLint64EXT;

typedef __int64 TGLint64EXT;

typedef __int64 *PGLint64EXT;

typedef unsigned __int64 GLuint64;

typedef unsigned __int64 TGLuint64;

typedef unsigned __int64 *PGLuint64;

typedef unsigned __int64 GLuint64EXT;

typedef unsigned __int64 TGLuint64EXT;

typedef unsigned __int64 *PGLuint64EXT;

typedef System::Byte GLubyte;

typedef System::Byte TGLubyte;

typedef System::PByte PGLubyte;

typedef System::Word GLushort;

typedef System::Word TGLushort;

typedef System::PWord PGLushort;

typedef unsigned GLuint;

typedef unsigned TGLuint;

typedef unsigned *PGLuint;

typedef float GLfloat;

typedef float TGLfloat;

typedef System::PSingle PGLfloat;

typedef float GLclampf;

typedef float TGLclampf;

typedef float *PGLclampf;

typedef double GLdouble;

typedef double TGLdouble;

typedef System::PDouble PGLdouble;

typedef double GLclampd;

typedef double TGLclampd;

typedef double *PGLclampd;

typedef unsigned GLhandleARB;

typedef unsigned *PGLhandleARB;

typedef char * *PGLPCharArray;

typedef void * PGLvoid;

typedef void * *PGLPointer;

typedef NativeInt GLintptr;

typedef NativeInt TGLintptr;

typedef NativeInt GLsizeiptr;

typedef NativeInt TGLsizeiptr;

typedef NativeInt GLsync;

typedef NativeInt TGLsync;

struct _WGLSWAP;
typedef _WGLSWAP *PWGLswap;

#pragma pack(push,1)
struct DECLSPEC_DRECORD _WGLSWAP
{
public:
	HDC hdc;
	unsigned uiFlags;
};
#pragma pack(pop)


typedef _WGLSWAP TWGLswap;

typedef _WGLSWAP WGLSWAP;

typedef int HPBUFFERARB;

typedef NativeUInt *PHGPUNV;

typedef NativeUInt HGPUNV;

struct TGPUDevice;
typedef TGPUDevice *PGPUDevice;

struct DECLSPEC_DRECORD TGPUDevice
{
public:
	unsigned cb;
	System::StaticArray<char, 32> DeviceName;
	System::StaticArray<char, 128> DeviceString;
	unsigned Flags;
	System::Types::TRect rcVirtualScreen;
};


typedef void __stdcall (*TDebugProc)(unsigned source, unsigned type_, unsigned id, unsigned severity, int length, const char * message, void * userParam);

typedef TDebugProc TGLDEBUGPROCARB;

typedef void __stdcall (*TDebugProcAMD)(unsigned id, unsigned category, unsigned severity, int length, char * message, void * userParam);

typedef NativeInt TGLvdpauSurfaceNV;

typedef NativeInt *PGLvdpauSurfaceNV;

struct DECLSPEC_DRECORD TGLUNurbs
{
};


struct DECLSPEC_DRECORD TGLUQuadric
{
};


struct DECLSPEC_DRECORD TGLUTesselator
{
};


typedef TGLUNurbs *PGLUNurbs;

typedef TGLUQuadric *PGLUQuadric;

typedef TGLUTesselator *PGLUTesselator;

typedef TGLUNurbs TGLUNurbsObj;

typedef TGLUQuadric TGLUQuadricObj;

typedef TGLUTesselator TGLUTesselatorObj;

typedef TGLUTesselator TGLUTriangulatorObj;

typedef PGLUNurbs PGLUNurbsObj;

typedef PGLUQuadric PGLUQuadricObj;

typedef PGLUTesselator PGLUTesselatorObj;

typedef PGLUTesselator PGLUTriangulatorObj;

typedef void __stdcall (*TGLUQuadricErrorProc)(unsigned errorCode);

typedef void __stdcall (*TGLUTessBeginProc)(unsigned AType);

typedef void __stdcall (*TGLUTessEdgeFlagProc)(System::ByteBool Flag);

typedef void __stdcall (*TGLUTessVertexProc)(void * VertexData);

typedef void __stdcall (*TGLUTessEndProc)(void);

typedef void __stdcall (*TGLUTessErrorProc)(unsigned ErrNo);

typedef void __stdcall (*TGLUTessCombineProc)(const Vectortypes::TVector3d &Coords, const Vectortypes::TVector4p &VertexData, const Vectortypes::TVector4f &Weight, PGLPointer OutData);

typedef void __stdcall (*TGLUTessBeginDataProc)(unsigned AType, void * UserData);

typedef void __stdcall (*TGLUTessEdgeFlagDataProc)(System::ByteBool Flag, void * UserData);

typedef void __stdcall (*TGLUTessVertexDataProc)(void * VertexData, void * UserData);

typedef void __stdcall (*TGLUTessEndDataProc)(void * UserData);

typedef void __stdcall (*TGLUTessErrorDataProc)(unsigned ErrNo, void * UserData);

typedef void __stdcall (*TGLUTessCombineDataProc)(const Vectortypes::TVector3d &Coords, const Vectortypes::TVector4p &VertexData, const Vectortypes::TVector4f &Weight, PGLPointer OutData, void * UserData);

typedef void __stdcall (*TGLUNurbsErrorProc)(unsigned ErrorCode);

typedef void __stdcall (*PFNGLBLENDCOLORPROC)(float red, float green, float blue, float alpha);

typedef void __stdcall (*PFNGLBLENDEQUATIONPROC)(unsigned mode);

typedef void __stdcall (*PFNGLDRAWRANGEELEMENTSPROC)(unsigned mode, unsigned Astart, unsigned Aend, int count, unsigned Atype, void * indices);

typedef void __stdcall (*PFNGLTEXIMAGE3DPROC)(unsigned target, int level, unsigned internalformat, int width, int height, int depth, int border, unsigned format, unsigned Atype, void * pixels);

typedef void __stdcall (*PFNGLTEXSUBIMAGE3DPROC)(unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned format, unsigned Atype, void * pixels);

typedef void __stdcall (*PFNGLCOPYTEXSUBIMAGE3DPROC)(unsigned target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLCOLORTABLEPROC)(unsigned target, unsigned internalformat, int width, unsigned format, unsigned Atype, void * table);

typedef void __stdcall (*PFNGLCOLORTABLEPARAMETERFVPROC)(unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLCOLORTABLEPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLCOPYCOLORTABLEPROC)(unsigned target, unsigned internalformat, int x, int y, int width);

typedef void __stdcall (*PFNGLGETCOLORTABLEPROC)(unsigned target, unsigned format, unsigned Atype, void * table);

typedef void __stdcall (*PFNGLGETCOLORTABLEPARAMETERFVPROC)(unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETCOLORTABLEPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLCOLORSUBTABLEPROC)(unsigned target, int start, int count, unsigned format, unsigned Atype, void * data);

typedef void __stdcall (*PFNGLCOPYCOLORSUBTABLEPROC)(unsigned target, int start, int x, int y, int width);

typedef void __stdcall (*PFNGLCONVOLUTIONFILTER1DPROC)(unsigned target, unsigned internalformat, int width, unsigned format, unsigned Atype, void * image);

typedef void __stdcall (*PFNGLCONVOLUTIONFILTER2DPROC)(unsigned target, unsigned internalformat, int width, int height, unsigned format, unsigned Atype, void * image);

typedef void __stdcall (*PFNGLCONVOLUTIONPARAMETERFPROC)(unsigned target, unsigned pname, float param);

typedef void __stdcall (*PFNGLCONVOLUTIONPARAMETERFVPROC)(unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLCONVOLUTIONPARAMETERIPROC)(unsigned target, unsigned pname, int param);

typedef void __stdcall (*PFNGLCONVOLUTIONPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLCOPYCONVOLUTIONFILTER1DPROC)(unsigned target, unsigned internalformat, int x, int y, int width);

typedef void __stdcall (*PFNGLCOPYCONVOLUTIONFILTER2DPROC)(unsigned target, unsigned internalformat, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLGETCONVOLUTIONFILTERPROC)(unsigned target, unsigned internalformat, unsigned Atype, void * image);

typedef void __stdcall (*PFNGLGETCONVOLUTIONPARAMETERFVPROC)(unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETCONVOLUTIONPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETSEPARABLEFILTERPROC)(unsigned target, unsigned format, unsigned Atype, void * row, void * column, void * span);

typedef void __stdcall (*PFNGLSEPARABLEFILTER2DPROC)(unsigned target, unsigned internalformat, int width, int height, unsigned format, unsigned Atype, void * row, void * column);

typedef void __stdcall (*PFNGLGETHISTOGRAMPROC)(unsigned target, System::ByteBool reset, unsigned format, unsigned Atype, void * values);

typedef void __stdcall (*PFNGLGETHISTOGRAMPARAMETERFVPROC)(unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETHISTOGRAMPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETMINMAXPROC)(unsigned target, System::ByteBool reset, unsigned format, unsigned Atype, void * values);

typedef void __stdcall (*PFNGLGETMINMAXPARAMETERFVPROC)(unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETMINMAXPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLHISTOGRAMPROC)(unsigned target, int width, unsigned internalformat, System::ByteBool sink);

typedef void __stdcall (*PFNGLMINMAXPROC)(unsigned target, unsigned internalformat, System::ByteBool sink);

typedef void __stdcall (*PFNGLRESETHISTOGRAMPROC)(unsigned target);

typedef void __stdcall (*PFNGLRESETMINMAXPROC)(unsigned target);

typedef void __stdcall (*PFNGLACTIVETEXTUREPROC)(unsigned texture);

typedef void __stdcall (*PFNGLSAMPLECOVERAGEPROC)(float Value, System::ByteBool invert);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXIMAGE3DPROC)(unsigned target, int level, unsigned internalformat, int Width, int Height, int depth, int border, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXIMAGE2DPROC)(unsigned target, int level, unsigned internalformat, int Width, int Height, int border, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXIMAGE1DPROC)(unsigned target, int level, unsigned internalformat, int Width, int border, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC)(unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned Format, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC)(unsigned target, int level, int xoffset, int yoffset, int width, int height, unsigned Format, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC)(unsigned target, int level, int xoffset, int width, unsigned Format, int imageSize, void * data);

typedef void __stdcall (*PFNGLGETCOMPRESSEDTEXIMAGEPROC)(unsigned target, int level, void * img);

typedef void __stdcall (*PFNGLCLIENTACTIVETEXTUREPROC)(unsigned texture);

typedef void __stdcall (*PFNGLMULTITEXCOORD1DPROC)(unsigned target, double s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1DVPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD1FPROC)(unsigned target, float s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1FVPROC)(unsigned target, float v);

typedef void __stdcall (*PFNGLMULTITEXCOORD1IPROC)(unsigned target, int s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1IVPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD1SPROC)(unsigned target, short s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1SVPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2DPROC)(unsigned target, double s, double t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2DVPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2FPROC)(unsigned target, float s, float t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2FVPROC)(unsigned target, System::PSingle v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2IPROC)(unsigned target, int s, int t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2IVPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2SPROC)(unsigned target, short s, short t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2SVPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3DPROC)(unsigned target, double s, double t, double r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3DVPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3FPROC)(unsigned target, float s, float t, float r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3FVPROC)(unsigned target, System::PSingle v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3IPROC)(unsigned target, int s, int t, int r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3IVPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3SPROC)(unsigned target, short s, short t, short r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3SVPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4DPROC)(unsigned target, double s, double t, double r, double q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4DVPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4FPROC)(unsigned target, float s, float t, float r, float q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4FVPROC)(unsigned target, System::PSingle v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4IPROC)(unsigned target, int s, int t, int r, int q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4IVPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4SPROC)(unsigned target, short s, short t, short r, short q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4SVPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLLOADTRANSPOSEMATRIXFPROC)(System::PSingle m);

typedef void __stdcall (*PFNGLLOADTRANSPOSEMATRIXDPROC)(System::PDouble m);

typedef void __stdcall (*PFNGLMULTTRANSPOSEMATRIXFPROC)(System::PSingle m);

typedef void __stdcall (*PFNGLMULTTRANSPOSEMATRIXDPROC)(System::PDouble m);

typedef void __stdcall (*PFNGLBLENDFUNCSEPARATEPROC)(unsigned sfactorRGB, unsigned dfactorRGB, unsigned sfactorAlpha, unsigned dfactorAlpha);

typedef void __stdcall (*PFNGLMULTIDRAWARRAYSPROC)(unsigned mode, PGLint First, PGLsizei Count, int primcount);

typedef void __stdcall (*PFNGLMULTIDRAWELEMENTSPROC)(unsigned mode, PGLsizei Count, unsigned AType, void *indices, int primcount);

typedef void __stdcall (*PFNGLPOINTPARAMETERFPROC)(unsigned pname, float param);

typedef void __stdcall (*PFNGLPOINTPARAMETERFVPROC)(unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLPOINTPARAMETERIPROC)(unsigned pname, int param);

typedef void __stdcall (*PFNGLPOINTPARAMETERIVPROC)(unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLFOGCOORDFPROC)(float coord);

typedef void __stdcall (*PFNGLFOGCOORDFVPROC)(System::PSingle coord);

typedef void __stdcall (*PFNGLFOGCOORDDPROC)(double coord);

typedef void __stdcall (*PFNGLFOGCOORDDVPROC)(System::PDouble coord);

typedef void __stdcall (*PFNGLFOGCOORDPOINTERPROC)(unsigned AType, int stride, void * p);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3BPROC)(System::Int8 red, System::Int8 green, System::Int8 blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3BVPROC)(PGLbyte v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3DPROC)(double red, double green, double blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3DVPROC)(System::PDouble v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3FPROC)(float red, float green, float blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3FVPROC)(System::PSingle v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3IPROC)(int red, int green, int blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3IVPROC)(PGLint v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3SPROC)(short red, short green, short blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3SVPROC)(PGLshort v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UBPROC)(System::Byte red, System::Byte green, System::Byte blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UBVPROC)(System::PByte v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UIPROC)(unsigned red, unsigned green, unsigned blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UIVPROC)(PGLuint v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3USPROC)(System::Word red, System::Word green, System::Word blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3USVPROC)(System::PWord v);

typedef void __stdcall (*PFNGLSECONDARYCOLORPOINTERPROC)(int Size, unsigned Atype, int stride, void * p);

typedef void __stdcall (*PFNGLWINDOWPOS2DPROC)(double x, double y);

typedef void __stdcall (*PFNGLWINDOWPOS2DVPROC)(System::PDouble v);

typedef void __stdcall (*PFNGLWINDOWPOS2FPROC)(float x, float y);

typedef void __stdcall (*PFNGLWINDOWPOS2FVPROC)(System::PSingle v);

typedef void __stdcall (*PFNGLWINDOWPOS2IPROC)(int x, int y);

typedef void __stdcall (*PFNGLWINDOWPOS2IVPROC)(PGLint v);

typedef void __stdcall (*PFNGLWINDOWPOS2SPROC)(short x, short y);

typedef void __stdcall (*PFNGLWINDOWPOS2SVPROC)(PGLshort v);

typedef void __stdcall (*PFNGLWINDOWPOS3DPROC)(double x, double y, double z);

typedef void __stdcall (*PFNGLWINDOWPOS3DVPROC)(System::PDouble v);

typedef void __stdcall (*PFNGLWINDOWPOS3FPROC)(float x, float y, float z);

typedef void __stdcall (*PFNGLWINDOWPOS3FVPROC)(System::PSingle v);

typedef void __stdcall (*PFNGLWINDOWPOS3IPROC)(int x, int y, int z);

typedef void __stdcall (*PFNGLWINDOWPOS3IVPROC)(PGLint v);

typedef void __stdcall (*PFNGLWINDOWPOS3SPROC)(short x, short y, short z);

typedef void __stdcall (*PFNGLWINDOWPOS3SVPROC)(PGLshort v);

typedef void __stdcall (*PFNGLGENQUERIESPROC)(int n, PGLuint ids);

typedef void __stdcall (*PFNGLDELETEQUERIESPROC)(int n, const PGLuint ids);

typedef System::ByteBool __stdcall (*PFNGLISQUERYPROC)(unsigned id);

typedef void __stdcall (*PFNGLBEGINQUERYPROC)(unsigned target, unsigned id);

typedef void __stdcall (*PFNGLENDQUERYPROC)(unsigned target);

typedef void __stdcall (*PFNGLGETQUERYIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETQUERYOBJECTIVPROC)(unsigned id, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETQUERYOBJECTUIVPROC)(unsigned id, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLBINDBUFFERPROC)(unsigned target, unsigned buffer);

typedef void __stdcall (*PFNGLDELETEBUFFERSPROC)(int n, const PGLuint buffers);

typedef void __stdcall (*PFNGLGENBUFFERSPROC)(int n, PGLuint buffers);

typedef System::ByteBool __stdcall (*PFNGLISBUFFERPROC)(unsigned buffer);

typedef void __stdcall (*PFNGLBUFFERDATAPROC)(unsigned target, int size, const void * data, unsigned usage);

typedef void __stdcall (*PFNGLBUFFERSUBDATAPROC)(unsigned target, unsigned offset, int size, const void * data);

typedef void __stdcall (*PFNGLGETBUFFERSUBDATAPROC)(unsigned target, unsigned offset, int size, void * data);

typedef void * __stdcall (*PFNGLMAPBUFFERPROC)(unsigned target, unsigned access);

typedef System::ByteBool __stdcall (*PFNGLUNMAPBUFFERPROC)(unsigned target);

typedef void __stdcall (*PFNGLGETBUFFERPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETBUFFERPOINTERVPROC)(unsigned target, unsigned pname, void * params);

typedef void __stdcall (*PFNGLBLENDEQUATIONSEPARATEPROC)(unsigned modeRGB, unsigned modeAlpha);

typedef void __stdcall (*PFNGLDRAWBUFFERSPROC)(int n, const PGLenum bufs);

typedef void __stdcall (*PFNGLSTENCILOPSEPARATEPROC)(unsigned face, unsigned sfail, unsigned dpfail, unsigned dppass);

typedef void __stdcall (*PFNGLSTENCILFUNCSEPARATEPROC)(unsigned face, unsigned func, int ref, unsigned mask);

typedef void __stdcall (*PFNGLSTENCILMASKSEPARATEPROC)(unsigned face, unsigned mask);

typedef void __stdcall (*PFNGLATTACHSHADERPROC)(unsigned _program, unsigned shader);

typedef void __stdcall (*PFNGLBINDATTRIBLOCATIONPROC)(unsigned _program, unsigned index, const char * name);

typedef void __stdcall (*PFNGLCOMPILESHADERPROC)(unsigned shader);

typedef unsigned __stdcall (*PFNGLCREATEPROGRAMPROC)(void);

typedef unsigned __stdcall (*PFNGLCREATESHADERPROC)(unsigned _type);

typedef void __stdcall (*PFNGLDELETEPROGRAMPROC)(unsigned _program);

typedef void __stdcall (*PFNGLDELETESHADERPROC)(unsigned shader);

typedef void __stdcall (*PFNGLDETACHSHADERPROC)(unsigned _program, unsigned shader);

typedef void __stdcall (*PFNGLDISABLEVERTEXATTRIBARRAYPROC)(unsigned index);

typedef void __stdcall (*PFNGLENABLEVERTEXATTRIBARRAYPROC)(unsigned index);

typedef void __stdcall (*PFNGLGETACTIVEATTRIBPROC)(unsigned _program, unsigned index, int bufSize, PGLsizei length, PGLint size, PGLenum _type, char * name);

typedef void __stdcall (*PFNGLGETACTIVEUNIFORMPROC)(unsigned _program, unsigned index, int bufSize, PGLsizei length, PGLint size, PGLenum _type, char * name);

typedef void __stdcall (*PFNGLGETATTACHEDSHADERSPROC)(unsigned _program, int maxCount, PGLsizei count, PGLuint obj);

typedef int __stdcall (*PFNGLGETATTRIBLOCATIONPROC)(unsigned _program, const char * name);

typedef void __stdcall (*PFNGLGETPROGRAMIVPROC)(unsigned _program, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETPROGRAMINFOLOGPROC)(unsigned _program, int bufSize, PGLsizei length, char * infoLog);

typedef void __stdcall (*PFNGLGETSHADERIVPROC)(unsigned shader, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETSHADERINFOLOGPROC)(unsigned shader, int bufSize, PGLsizei length, char * infoLog);

typedef void __stdcall (*PFNGLGETSHADERSOURCEPROC)(unsigned shader, int bufSize, PGLsizei length, char * source);

typedef int __stdcall (*PFNGLGETUNIFORMLOCATIONPROC)(unsigned _program, const char * name);

typedef void __stdcall (*PFNGLGETUNIFORMFVPROC)(unsigned _program, int location, System::PSingle params);

typedef void __stdcall (*PFNGLGETUNIFORMIVPROC)(unsigned _program, int location, PGLint params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBDVPROC)(unsigned index, unsigned pname, System::PDouble params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBFVPROC)(unsigned index, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBIVPROC)(unsigned index, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBPOINTERVPROC)(unsigned index, unsigned pname, void * _pointer);

typedef System::ByteBool __stdcall (*PFNGLISPROGRAMPROC)(unsigned _program);

typedef System::ByteBool __stdcall (*PFNGLISSHADERPROC)(unsigned shader);

typedef void __stdcall (*PFNGLLINKPROGRAMPROC)(unsigned _program);

typedef void __stdcall (*PFNGLSHADERSOURCEPROC)(unsigned shader, int count, const PGLPCharArray _string, const PGLint length);

typedef void __stdcall (*PFNGLUSEPROGRAMPROC)(unsigned _program);

typedef void __stdcall (*PFNGLUNIFORM1FPROC)(int location, float v0);

typedef void __stdcall (*PFNGLUNIFORM2FPROC)(int location, float v0, float v1);

typedef void __stdcall (*PFNGLUNIFORM3FPROC)(int location, float v0, float v1, float v2);

typedef void __stdcall (*PFNGLUNIFORM4FPROC)(int location, float v0, float v1, float v2, float v3);

typedef void __stdcall (*PFNGLUNIFORM1IPROC)(int location, int v0);

typedef void __stdcall (*PFNGLUNIFORM2IPROC)(int location, int v0, int v1);

typedef void __stdcall (*PFNGLUNIFORM3IPROC)(int location, int v0, int v1, int v2);

typedef void __stdcall (*PFNGLUNIFORM4IPROC)(int location, int v0, int v1, int v2, int v3);

typedef void __stdcall (*PFNGLUNIFORM1FVPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM2FVPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM3FVPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM4FVPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM1IVPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORM2IVPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORM3IVPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORM4IVPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX2FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX3FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX4FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLVALIDATEPROGRAMPROC)(unsigned _program);

typedef void __stdcall (*PFNGLVERTEXATTRIB1DPROC)(unsigned index, double x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB1FPROC)(unsigned index, float x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1FVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB1SPROC)(unsigned index, short x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1SVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2DPROC)(unsigned index, double x, double y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2FPROC)(unsigned index, float x, float y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2FVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2SPROC)(unsigned index, short x, short y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2SVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3DPROC)(unsigned index, double x, double y, double z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3FPROC)(unsigned index, float x, float y, float z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3FVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3SPROC)(unsigned index, short x, short y, short z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3SVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NBVPROC)(unsigned index, PGLbyte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NIVPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NSVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUBPROC)(unsigned index, System::Byte x, System::Byte y, System::Byte z, System::Byte w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUBVPROC)(unsigned index, System::PByte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUIVPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUSVPROC)(unsigned index, System::PWord v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4BVPROC)(unsigned index, PGLbyte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4DPROC)(unsigned index, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4FPROC)(unsigned index, float x, float y, float z, float w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4FVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4IVPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4SPROC)(unsigned index, short x, short y, short z, short w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4SVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4UBVPROC)(unsigned index, System::PByte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4UIVPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4USVPROC)(unsigned index, System::PWord v);

typedef void __stdcall (*PFNGLVERTEXATTRIBPOINTERPROC)(unsigned index, int size, unsigned _type, System::ByteBool normalized, int stride, void * _pointer);

typedef void __stdcall (*PFNGLUNIFORMMATRIX2X3FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX3X2FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX2X4FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX4X2FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX3X4FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX4X3FVPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1IPROC)(unsigned index, int x);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2IPROC)(unsigned index, int x, int y);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3IPROC)(unsigned index, int x, int y, int z);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4IPROC)(unsigned index, int x, int y, int z, int w);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1UIPROC)(unsigned index, unsigned x);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2UIPROC)(unsigned index, unsigned x, unsigned y);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3UIPROC)(unsigned index, unsigned x, unsigned y, unsigned z);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4UIPROC)(unsigned index, unsigned x, unsigned y, unsigned z, unsigned w);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1IVPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2IVPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3IVPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4IVPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1UIVPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2UIVPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3UIVPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4UIVPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4BVPROC)(unsigned index, PGLbyte v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4SVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4UBVPROC)(unsigned index, System::PByte v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4USVPROC)(unsigned index, System::PWord v);

typedef void __stdcall (*PFNGLVERTEXATTRIBIPOINTERPROC)(unsigned index, int size, unsigned _type, int stride, void * _pointer);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBIIVPROC)(unsigned index, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBIUIVPROC)(unsigned index, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLUNIFORM1UIPROC)(int location, unsigned v0);

typedef void __stdcall (*PFNGLUNIFORM2UIPROC)(int location, unsigned v0, unsigned v1);

typedef void __stdcall (*PFNGLUNIFORM3UIPROC)(int location, unsigned v0, unsigned v1, unsigned v2);

typedef void __stdcall (*PFNGLUNIFORM4UIPROC)(int location, unsigned v0, unsigned v1, unsigned v2, unsigned v3);

typedef void __stdcall (*PFNGLUNIFORM1UIVPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLUNIFORM2UIVPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLUNIFORM3UIVPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLUNIFORM4UIVPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLGETUNIFORMUIVPROC)(unsigned _program, int location, PGLuint params);

typedef void __stdcall (*PFNGLBINDFRAGDATALOCATIONPROC)(unsigned _program, unsigned colorNumber, char * name);

typedef int __stdcall (*PFNGLGETFRAGDATALOCATIONPROC)(unsigned _program, char * name);

typedef void __stdcall (*PFNGLBEGINCONDITIONALRENDERPROC)(unsigned id, unsigned mode);

typedef void __stdcall (*PFNGLENDCONDITIONALRENDERPROC)(void);

typedef void __stdcall (*PFNGLCLAMPCOLORPROC)(unsigned target, unsigned clamp);

typedef void __stdcall (*PFNGLTEXPARAMETERIIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLTEXPARAMETERIUIVPROC)(unsigned target, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLGETTEXPARAMETERIIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETTEXPARAMETERIUIVPROC)(unsigned target, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLCOLORMASKIPROC)(unsigned index, System::ByteBool r, System::ByteBool g, System::ByteBool b, System::ByteBool a);

typedef void __stdcall (*PFNGLGETBOOLEANI_VPROC)(unsigned target, unsigned index, PGLboolean data);

typedef void __stdcall (*PFNGLGETINTEGERI_VPROC)(unsigned target, unsigned index, PGLint data);

typedef void __stdcall (*PFNGLENABLEIPROC)(unsigned target, unsigned index);

typedef void __stdcall (*PFNGLDISABLEIPROC)(unsigned target, unsigned index);

typedef System::ByteBool __stdcall (*PFNGLISENABLEDIPROC)(unsigned target, unsigned index);

typedef void __stdcall (*PFNGLBINDBUFFERRANGEPROC)(unsigned target, unsigned index, unsigned buffer, NativeInt offset, NativeInt size);

typedef void __stdcall (*PFNGLBINDBUFFERBASEPROC)(unsigned target, unsigned index, unsigned buffer);

typedef void __stdcall (*PFNGLBEGINTRANSFORMFEEDBACKPROC)(unsigned primitiveMode);

typedef void __stdcall (*PFNGLENDTRANSFORMFEEDBACKPROC)(void);

typedef void __stdcall (*PFNGLTRANSFORMFEEDBACKVARYINGSPROC)(unsigned _program, int count, const PGLPCharArray varyings, unsigned bufferMode);

typedef void __stdcall (*PFNGLGETTRANSFORMFEEDBACKVARYINGPROC)(unsigned _program, unsigned index, int bufSize, PGLsizei length, PGLsizei size, PGLenum _type, char * name);

typedef void __stdcall (*PFNGLCLEARBUFFERIVPROC)(unsigned buffer, int drawbuffer, PGLint value);

typedef void __stdcall (*PFNGLCLEARBUFFERUIVPROC)(unsigned buffer, int drawbuffer, PGLuint value);

typedef void __stdcall (*PFNGLCLEARBUFFERFVPROC)(unsigned buffer, int drawbuffer, System::PSingle value);

typedef void __stdcall (*PFNGLCLEARBUFFERFIPROC)(unsigned buffer, int drawbuffer, float depth, int stencil);

typedef char * __stdcall (*PFNGLGETSTRINGIPROC)(unsigned name, unsigned index);

typedef void __stdcall (*PFNGLDRAWARRAYSINSTANCEDPROC)(unsigned mode, int first, int count, int primcount);

typedef void __stdcall (*PFNGLDRAWELEMENTSINSTANCEDPROC)(unsigned mode, int count, unsigned _type, void * indices, int primcount);

typedef void __stdcall (*PFNGLTEXBUFFERPROC)(unsigned target, unsigned internalformat, unsigned buffer);

typedef void __stdcall (*PFNGLPRIMITIVERESTARTINDEXPROC)(unsigned index);

typedef void __stdcall (*PFNGLGETINTEGER64I_VPROC)(unsigned target, unsigned index, PGLint64 data);

typedef void __stdcall (*PFNGLGETBUFFERPARAMETERI64VPROC)(unsigned target, unsigned pname, PGLint64 params);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTUREPROC)(unsigned target, unsigned attachment, unsigned texture, int level);

typedef void __stdcall (*PFNGLVERTEXATTRIBDIVISORPROC)(unsigned index, unsigned divisor);

typedef void __stdcall (*PFNGLBLENDEQUATIONIPROC)(unsigned buf, unsigned mode);

typedef void __stdcall (*PFNGLBLENDEQUATIONSEPARATEIPROC)(unsigned buf, unsigned modeRGB, unsigned modeAlpha);

typedef void __stdcall (*PFNGLBLENDFUNCIPROC)(unsigned buf, unsigned src, unsigned dst);

typedef void __stdcall (*PFNGLBLENDFUNCSEPARATEIPROC)(unsigned buf, unsigned srcRGB, unsigned dstRGB, unsigned srcAlpha, unsigned dstAlpha);

typedef void __stdcall (*PFNGLMINSAMPLESHADINGPROC)(float value);

typedef void __stdcall (*PFNGLUNURBSCALLBACKDATAEXTPROC)(PGLUNurbs nurb, void * userData);

typedef PGLUNurbs __stdcall (*PFNGLUNEWNURBSTESSELLATOREXTPROC)(void);

typedef void __stdcall (*PFNGLUDELETENURBSTESSELLATOREXTPROC)(PGLUNurbs nurb);

typedef int __stdcall (*PFNWGLCREATEBUFFERREGIONARBPROC)(HDC DC, int iLayerPlane, unsigned uType);

typedef void __stdcall (*PFNWGLDELETEBUFFERREGIONARBPROC)(int hRegion);

typedef BOOL __stdcall (*PFNWGLSAVEBUFFERREGIONARBPROC)(int hRegion, int x, int y, int width, int height);

typedef BOOL __stdcall (*PFNWGLRESTOREBUFFERREGIONARBPROC)(int hRegion, int x, int y, int width, int height, int xSrc, int ySrc);

typedef char * __stdcall (*PFNWGLGETEXTENSIONSSTRINGARBPROC)(HDC DC);

typedef BOOL __stdcall (*PFNWGLGETPIXELFORMATATTRIBIVARBPROC)(HDC DC, int iPixelFormat, int iLayerPlane, unsigned nAttributes, const PGLint piAttributes, PGLint piValues);

typedef BOOL __stdcall (*PFNWGLGETPIXELFORMATATTRIBFVARBPROC)(HDC DC, int iPixelFormat, int iLayerPlane, unsigned nAttributes, const PGLint piAttributes, System::PSingle piValues);

typedef BOOL __stdcall (*PFNWGLCHOOSEPIXELFORMATARBPROC)(HDC DC, const PGLint piAttribIList, const System::PSingle pfAttribFList, unsigned nMaxFormats, PGLint piFormats, PGLenum nNumFormats);

typedef BOOL __stdcall (*PFNWGLMAKECONTEXTCURRENTARBPROC)(HDC hDrawDC, HDC hReadDC, HGLRC _hglrc);

typedef HDC __stdcall (*PFNWGLGETCURRENTREADDCARBPROC)(void);

typedef int __stdcall (*PFNWGLCREATEPBUFFERARBPROC)(HDC DC, int iPixelFormat, int iWidth, int iHeight, const PGLint piAttribList);

typedef HDC __stdcall (*PFNWGLGETPBUFFERDCARBPROC)(int hPbuffer);

typedef int __stdcall (*PFNWGLRELEASEPBUFFERDCARBPROC)(int hPbuffer, HDC DC);

typedef BOOL __stdcall (*PFNWGLDESTROYPBUFFERARBPROC)(int hPbuffer);

typedef BOOL __stdcall (*PFNWGLQUERYPBUFFERARBPROC)(int hPbuffer, int iAttribute, PGLint piValue);

typedef BOOL __stdcall (*PFNWGLBINDTEXIMAGEARBPROC)(int hPbuffer, int iBuffer);

typedef BOOL __stdcall (*PFNWGLRELEASETEXIMAGEARBPROC)(int hpBuffer, int iBuffer);

typedef BOOL __stdcall (*PFNWGLSETPBUFFERATTRIBARBPROC)(int hpBuffer, const PGLint piAttribList);

typedef HGLRC __stdcall (*PFNWGLCREATECONTEXTATTRIBSARBPROC)(HDC DC, HGLRC hShareContext, PGLint attribList);

typedef BOOL __stdcall (*PFNWGLSWAPINTERVALEXTPROC)(int interval);

typedef int __stdcall (*PFNWGLGETSWAPINTERVALEXTPROC)(void);

typedef bool __stdcall (*PFNWGLENUMGPUSNVPROC)(unsigned iGpuIndex, NativeUInt &hGpu);

typedef bool __stdcall (*PFNWGLENUMGPUDEVICESNVPROC)(NativeUInt hGpu, unsigned iDeviceIndex, PGPUDevice lpGpuDevice);

typedef HDC __stdcall (*PFNWGLCREATEAFFINITYDCNVPROC)(PHGPUNV hGpuList);

typedef bool __stdcall (*PFNWGLENUMGPUSFROMAFFINITYDCNVPROC)(HDC hAffinityDC, unsigned iGpuIndex, NativeUInt &hGpu);

typedef bool __stdcall (*PFNWGLDELETEDCNVPROC)(HDC hdc);

typedef BOOL __stdcall (*PFNWGLDXSETRESOURCESHAREHANDLEPROC)(void * dxObject, NativeUInt shareHandle);

typedef NativeUInt __stdcall (*PFNWGLDXOPENDEVICEPROC)(void * dxDevice);

typedef BOOL __stdcall (*PFNWGLDXCLOSEDEVICEPROC)(NativeUInt hDevice);

typedef NativeUInt __stdcall (*PFNWGLDXREGISTEROBJECTPROC)(NativeUInt hDevice, void * dxObject, unsigned name, unsigned atype, unsigned access);

typedef BOOL __stdcall (*PFNWGLDXUNREGISTEROBJECTPROC)(NativeUInt hDevice, NativeUInt hObject);

typedef BOOL __stdcall (*PFNWGLDXOBJECTACCESSPROC)(NativeUInt hObject, unsigned access);

typedef BOOL __stdcall (*PFNWGLDXLOCKOBJECTSPROC)(NativeUInt hDevice, int count, Winapi::Windows::PHandle hObjects);

typedef BOOL __stdcall (*PFNWGLDXUNLOCKOBJECTSNVPROC)(NativeUInt hDevice, int count, Winapi::Windows::PHandle hObjects);

typedef void __stdcall (*PFNGLSAMPLEPASSARBPROC)(unsigned pass);

typedef void __stdcall (*PFNGLACTIVETEXTUREARBPROC)(unsigned target);

typedef void __stdcall (*PFNGLCLIENTACTIVETEXTUREARBPROC)(unsigned target);

typedef void __stdcall (*PFNGLMULTITEXCOORD1DARBPROC)(unsigned target, double s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1DVARBPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD1FARBPROC)(unsigned target, float s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1FVARBPROC)(unsigned target, float v);

typedef void __stdcall (*PFNGLMULTITEXCOORD1IARBPROC)(unsigned target, int s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1IVARBPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD1SARBPROC)(unsigned target, short s);

typedef void __stdcall (*PFNGLMULTITEXCOORD1SVARBPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2DARBPROC)(unsigned target, double s, double t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2DVARBPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2FARBPROC)(unsigned target, float s, float t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2FVARBPROC)(unsigned target, System::PSingle v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2IARBPROC)(unsigned target, int s, int t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2IVARBPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD2SARBPROC)(unsigned target, short s, short t);

typedef void __stdcall (*PFNGLMULTITEXCOORD2SVARBPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3DARBPROC)(unsigned target, double s, double t, double r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3DVARBPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3FARBPROC)(unsigned target, float s, float t, float r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3FVARBPROC)(unsigned target, System::PSingle v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3IARBPROC)(unsigned target, int s, int t, int r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3IVARBPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD3SARBPROC)(unsigned target, short s, short t, short r);

typedef void __stdcall (*PFNGLMULTITEXCOORD3SVARBPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4DARBPROC)(unsigned target, double s, double t, double r, double q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4DVARBPROC)(unsigned target, System::PDouble v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4FARBPROC)(unsigned target, float s, float t, float r, float q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4FVARBPROC)(unsigned target, System::PSingle v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4IARBPROC)(unsigned target, int s, int t, int r, int q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4IVARBPROC)(unsigned target, PGLint v);

typedef void __stdcall (*PFNGLMULTITEXCOORD4SARBPROC)(unsigned target, short s, short t, short r, short q);

typedef void __stdcall (*PFNGLMULTITEXCOORD4SVARBPROC)(unsigned target, PGLshort v);

typedef void __stdcall (*PFNGLLOADTRANSPOSEMATRIXFARBPROC)(System::PSingle m);

typedef void __stdcall (*PFNGLLOADTRANSPOSEMATRIXDARBPROC)(System::PDouble m);

typedef void __stdcall (*PFNGLMULTTRANSPOSEMATRIXFARBPROC)(System::PSingle m);

typedef void __stdcall (*PFNGLMULTTRANSPOSEMATRIXDARBPROC)(System::PDouble m);

typedef void __stdcall (*PFNGLSAMPLECOVERAGEARBPROC)(float Value, System::ByteBool invert);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXIMAGE3DARBPROC)(unsigned target, int level, unsigned internalformat, int Width, int Height, int depth, int border, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXIMAGE2DARBPROC)(unsigned target, int level, unsigned internalformat, int Width, int Height, int border, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXIMAGE1DARBPROC)(unsigned target, int level, unsigned internalformat, int Width, int border, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXSUBIMAGE3DARBPROC)(unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned Format, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXSUBIMAGE2DARBPROC)(unsigned target, int level, int xoffset, int yoffset, int width, int height, unsigned Format, int imageSize, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXSUBIMAGE1DARBPROC)(unsigned target, int level, int xoffset, int width, unsigned Format, int imageSize, void * data);

typedef void __stdcall (*PFNGLGETCOMPRESSEDTEXIMAGEARBPROC)(unsigned target, int level, void * img);

typedef void __stdcall (*PFNGLPOINTPARAMETERFARBPROC)(unsigned pname, float param);

typedef void __stdcall (*PFNGLPOINTPARAMETERFVARBPROC)(unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLWEIGHTBVARBPROC)(int size, PGLbyte weights);

typedef void __stdcall (*PFNGLWEIGHTSVARBPROC)(int size, PGLshort weights);

typedef void __stdcall (*PFNGLWEIGHTIVARBPROC)(int size, PGLint weights);

typedef void __stdcall (*PFNGLWEIGHTFVARBPROC)(int size, System::PSingle weights);

typedef void __stdcall (*PFNGLWEIGHTDVARBPROC)(int size, System::PDouble weights);

typedef void __stdcall (*PFNGLWEIGHTUBVARBPROC)(int size, System::PByte weights);

typedef void __stdcall (*PFNGLWEIGHTUSVARBPROC)(int size, System::PWord weights);

typedef void __stdcall (*PFNGLWEIGHTUIVARBPROC)(int size, PGLuint weights);

typedef void __stdcall (*PFNGLWEIGHTPOINTERARBPROC)(int size, unsigned _type, int stride, void * _pointer);

typedef void __stdcall (*PFNGLVERTEXBLENDARBPROC)(int count);

typedef void __stdcall (*PFNGLCURRENTPALETTEMATRIXARBPROC)(int index);

typedef void __stdcall (*PFNGLMATRIXINDEXUBVARBPROC)(int size, System::PByte indices);

typedef void __stdcall (*PFNGLMATRIXINDEXUSVARBPROC)(int size, System::PWord indices);

typedef void __stdcall (*PFNGLMATRIXINDEXUIVARBPROC)(int size, PGLuint indices);

typedef void __stdcall (*PFNGLMATRIXINDEXPOINTERARBPROC)(int size, unsigned _type, int stride, void * _pointer);

typedef void __stdcall (*PFNGLWINDOWPOS2DARBPROC)(double x, double y);

typedef void __stdcall (*PFNGLWINDOWPOS2DVARBPROC)(System::PDouble v);

typedef void __stdcall (*PFNGLWINDOWPOS2FARBPROC)(float x, float y);

typedef void __stdcall (*PFNGLWINDOWPOS2FVARBPROC)(System::PSingle v);

typedef void __stdcall (*PFNGLWINDOWPOS2IARBPROC)(int x, int y);

typedef void __stdcall (*PFNGLWINDOWPOS2IVARBPROC)(PGLint v);

typedef void __stdcall (*PFNGLWINDOWPOS2SARBPROC)(short x, short y);

typedef void __stdcall (*PFNGLWINDOWPOS2SVARBPROC)(PGLshort v);

typedef void __stdcall (*PFNGLWINDOWPOS3DARBPROC)(double x, double y, double z);

typedef void __stdcall (*PFNGLWINDOWPOS3DVARBPROC)(System::PDouble v);

typedef void __stdcall (*PFNGLWINDOWPOS3FARBPROC)(float x, float y, float z);

typedef void __stdcall (*PFNGLWINDOWPOS3FVARBPROC)(System::PSingle v);

typedef void __stdcall (*PFNGLWINDOWPOS3IARBPROC)(int x, int y, int z);

typedef void __stdcall (*PFNGLWINDOWPOS3IVARBPROC)(PGLint v);

typedef void __stdcall (*PFNGLWINDOWPOS3SARBPROC)(short x, short y, short z);

typedef void __stdcall (*PFNGLWINDOWPOS3SVARBPROC)(PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB1DARBPROC)(unsigned index, double x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1DVARBPROC)(unsigned index, const System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB1FARBPROC)(unsigned index, float x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1FVARBPROC)(unsigned index, const System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB1SARBPROC)(unsigned index, short x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1SVARBPROC)(unsigned index, const PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2DARBPROC)(unsigned index, double x, double y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2DVARBPROC)(unsigned index, const System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2FARBPROC)(unsigned index, float x, float y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2FVARBPROC)(unsigned index, const System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2SARBPROC)(unsigned index, short x, short y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2SVARBPROC)(unsigned index, const PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3DARBPROC)(unsigned index, double x, double y, double z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3DVARBPROC)(unsigned index, const System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3FARBPROC)(unsigned index, float x, float y, float z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3FVARBPROC)(unsigned index, const System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3SARBPROC)(unsigned index, short x, short y, short z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3SVARBPROC)(unsigned index, const PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NBVARBPROC)(unsigned index, const PGLbyte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NIVARBPROC)(unsigned index, const PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NSVARBPROC)(unsigned index, const PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUBARBPROC)(unsigned index, System::Byte x, System::Byte y, System::Byte z, System::Byte w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUBVARBPROC)(unsigned index, const System::PByte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUIVARBPROC)(unsigned index, const PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4NUSVARBPROC)(unsigned index, const System::PWord v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4BVARBPROC)(unsigned index, const PGLbyte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4DARBPROC)(unsigned index, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4DVARBPROC)(unsigned index, const System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4FARBPROC)(unsigned index, float x, float y, float z, float w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4FVARBPROC)(unsigned index, const System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4IVARBPROC)(unsigned index, const PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4SARBPROC)(unsigned index, short x, short y, short z, short w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4SVARBPROC)(unsigned index, const PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4UBVARBPROC)(unsigned index, const System::PByte v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4UIVARBPROC)(unsigned index, const PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4USVARBPROC)(unsigned index, const System::PWord v);

typedef void __stdcall (*PFNGLVERTEXATTRIBPOINTERARBPROC)(unsigned index, int size, unsigned _type, System::ByteBool normalized, int stride, const void * _pointer);

typedef void __stdcall (*PFNGLENABLEVERTEXATTRIBARRAYARBPROC)(unsigned index);

typedef void __stdcall (*PFNGLDISABLEVERTEXATTRIBARRAYARBPROC)(unsigned index);

typedef void __stdcall (*PFNGLPROGRAMSTRINGARBPROC)(unsigned target, unsigned format, int len, const void * _string);

typedef void __stdcall (*PFNGLBINDPROGRAMARBPROC)(unsigned target, unsigned _program);

typedef void __stdcall (*PFNGLDELETEPROGRAMSARBPROC)(int n, const PGLuint programs);

typedef void __stdcall (*PFNGLGENPROGRAMSARBPROC)(int n, PGLuint programs);

typedef void __stdcall (*PFNGLPROGRAMENVPARAMETER4DARBPROC)(unsigned target, unsigned index, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLPROGRAMENVPARAMETER4DVARBPROC)(unsigned target, unsigned index, const System::PDouble params);

typedef void __stdcall (*PFNGLPROGRAMENVPARAMETER4FARBPROC)(unsigned target, unsigned index, float x, float y, float z, float w);

typedef void __stdcall (*PFNGLPROGRAMENVPARAMETER4FVARBPROC)(unsigned target, unsigned index, const System::PSingle params);

typedef void __stdcall (*PFNGLPROGRAMLOCALPARAMETER4DARBPROC)(unsigned target, unsigned index, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLPROGRAMLOCALPARAMETER4DVARBPROC)(unsigned target, unsigned index, const System::PDouble params);

typedef void __stdcall (*PFNGLPROGRAMLOCALPARAMETER4FARBPROC)(unsigned target, unsigned index, float x, float y, float z, float w);

typedef void __stdcall (*PFNGLPROGRAMLOCALPARAMETER4FVARBPROC)(unsigned target, unsigned index, const System::PSingle params);

typedef void __stdcall (*PFNGLGETPROGRAMENVPARAMETERDVARBPROC)(unsigned target, unsigned index, System::PDouble params);

typedef void __stdcall (*PFNGLGETPROGRAMENVPARAMETERFVARBPROC)(unsigned target, unsigned index, System::PSingle params);

typedef void __stdcall (*PFNGLGETPROGRAMLOCALPARAMETERDVARBPROC)(unsigned target, unsigned index, System::PDouble params);

typedef void __stdcall (*PFNGLGETPROGRAMLOCALPARAMETERFVARBPROC)(unsigned target, unsigned index, System::PSingle params);

typedef void __stdcall (*PFNGLGETPROGRAMIVARBPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETPROGRAMSTRINGARBPROC)(unsigned target, unsigned pname, void * _string);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBDVARBPROC)(unsigned index, unsigned pname, System::PDouble params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBFVARBPROC)(unsigned index, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBIVARBPROC)(unsigned index, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBPOINTERVARBPROC)(unsigned index, unsigned pname, void * _pointer);

typedef System::ByteBool __stdcall (*PFNGLISPROGRAMARBPROC)(unsigned _program);

typedef void __stdcall (*PFNGLBINDBUFFERARBPROC)(unsigned target, unsigned buffer);

typedef void __stdcall (*PFNGLDELETEBUFFERSARBPROC)(int n, const PGLuint buffers);

typedef void __stdcall (*PFNGLGENBUFFERSARBPROC)(int n, PGLuint buffers);

typedef System::ByteBool __stdcall (*PFNGLISBUFFERARBPROC)(unsigned buffer);

typedef void __stdcall (*PFNGLBUFFERDATAARBPROC)(unsigned target, int size, const void * data, unsigned usage);

typedef void __stdcall (*PFNGLBUFFERSUBDATAARBPROC)(unsigned target, unsigned offset, int size, const void * data);

typedef void __stdcall (*PFNGLGETBUFFERSUBDATAARBPROC)(unsigned target, unsigned offset, int size, void * data);

typedef void * __stdcall (*PFNGLMAPBUFFERARBPROC)(unsigned target, unsigned access);

typedef System::ByteBool __stdcall (*PFNGLUNMAPBUFFERARBPROC)(unsigned target);

typedef void __stdcall (*PFNGLGETBUFFERPARAMETERIVARBPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETBUFFERPOINTERVARBPROC)(unsigned target, unsigned pname, void * params);

typedef void __stdcall (*PFNGLGENQUERIESARBPROC)(int n, PGLuint ids);

typedef void __stdcall (*PFNGLDELETEQUERIESARBPROC)(int n, const PGLuint ids);

typedef System::ByteBool __stdcall (*PFNGLISQUERYARBPROC)(unsigned id);

typedef void __stdcall (*PFNGLBEGINQUERYARBPROC)(unsigned target, unsigned id);

typedef void __stdcall (*PFNGLENDQUERYARBPROC)(unsigned target);

typedef void __stdcall (*PFNGLGETQUERYIVARBPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETQUERYOBJECTIVARBPROC)(unsigned id, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETQUERYOBJECTUIVARBPROC)(unsigned id, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLDELETEOBJECTARBPROC)(unsigned obj);

typedef unsigned __stdcall (*PFNGLGETHANDLEARBPROC)(unsigned pname);

typedef void __stdcall (*PFNGLDETACHOBJECTARBPROC)(unsigned containerObj, unsigned attachedObj);

typedef unsigned __stdcall (*PFNGLCREATESHADEROBJECTARBPROC)(unsigned shaderType);

typedef void __stdcall (*PFNGLSHADERSOURCEARBPROC)(unsigned shaderObj, int count, const PGLPCharArray _string, const PGLint length);

typedef void __stdcall (*PFNGLCOMPILESHADERARBPROC)(unsigned shaderObj);

typedef unsigned __stdcall (*PFNGLCREATEPROGRAMOBJECTARBPROC)(void);

typedef void __stdcall (*PFNGLATTACHOBJECTARBPROC)(unsigned containerObj, unsigned obj);

typedef void __stdcall (*PFNGLLINKPROGRAMARBPROC)(unsigned programObj);

typedef void __stdcall (*PFNGLUSEPROGRAMOBJECTARBPROC)(unsigned programObj);

typedef void __stdcall (*PFNGLVALIDATEPROGRAMARBPROC)(unsigned programObj);

typedef void __stdcall (*PFNGLUNIFORM1FARBPROC)(int location, float v0);

typedef void __stdcall (*PFNGLUNIFORM2FARBPROC)(int location, float v0, float v1);

typedef void __stdcall (*PFNGLUNIFORM3FARBPROC)(int location, float v0, float v1, float v2);

typedef void __stdcall (*PFNGLUNIFORM4FARBPROC)(int location, float v0, float v1, float v2, float v3);

typedef void __stdcall (*PFNGLUNIFORM1IARBPROC)(int location, int v0);

typedef void __stdcall (*PFNGLUNIFORM2IARBPROC)(int location, int v0, int v1);

typedef void __stdcall (*PFNGLUNIFORM3IARBPROC)(int location, int v0, int v1, int v2);

typedef void __stdcall (*PFNGLUNIFORM4IARBPROC)(int location, int v0, int v1, int v2, int v3);

typedef void __stdcall (*PFNGLUNIFORM1FVARBPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM2FVARBPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM3FVARBPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM4FVARBPROC)(int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORM1IVARBPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORM2IVARBPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORM3IVARBPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORM4IVARBPROC)(int location, int count, PGLint value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX2FVARBPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX3FVARBPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX4FVARBPROC)(int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLGETOBJECTPARAMETERFVARBPROC)(unsigned obj, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETOBJECTPARAMETERIVARBPROC)(unsigned obj, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETINFOLOGARBPROC)(unsigned obj, int maxLength, PGLsizei length, char * infoLog);

typedef void __stdcall (*PFNGLGETATTACHEDOBJECTSARBPROC)(unsigned containerObj, int maxCount, PGLsizei count, PGLhandleARB obj);

typedef int __stdcall (*PFNGLGETUNIFORMLOCATIONARBPROC)(unsigned programObj, const char * name);

typedef void __stdcall (*PFNGLGETACTIVEUNIFORMARBPROC)(unsigned programObj, unsigned index, int maxLength, PGLsizei length, PGLint size, PGLenum _type, char * name);

typedef void __stdcall (*PFNGLGETUNIFORMFVARBPROC)(unsigned programObj, int location, System::PSingle params);

typedef void __stdcall (*PFNGLGETUNIFORMIVARBPROC)(unsigned programObj, int location, PGLint params);

typedef void __stdcall (*PFNGLGETSHADERSOURCEARBPROC)(unsigned obj, int maxLength, PGLsizei length, char * source);

typedef void __stdcall (*PFNGLBINDATTRIBLOCATIONARBPROC)(unsigned programObj, unsigned index, const char * name);

typedef void __stdcall (*PFNGLGETACTIVEATTRIBARBPROC)(unsigned programObj, unsigned index, int maxLength, PGLsizei length, PGLint size, PGLenum _type, char * name);

typedef int __stdcall (*PFNGLGETATTRIBLOCATIONARBPROC)(unsigned programObj, const char * name);

typedef void __stdcall (*PFNGLDRAWBUFFERSARBPROC)(int n, const PGLenum bufs);

typedef void __stdcall (*PFNGLCLAMPCOLORARBPROC)(unsigned target, unsigned clamp);

typedef void __stdcall (*PFNGLDRAWARRAYSINSTANCEDARBPROC)(unsigned mode, int first, int count, int primcount);

typedef void __stdcall (*PFNGLDRAWELEMENTSINSTANCEDARBPROC)(unsigned mode, int count, unsigned _type, void * indices, int primcount);

typedef System::ByteBool __stdcall (*PFNGLISRENDERBUFFERPROC)(unsigned renderbuffer);

typedef void __stdcall (*PFNGLBINDRENDERBUFFERPROC)(unsigned target, unsigned renderbuffer);

typedef void __stdcall (*PFNGLDELETERENDERBUFFERSPROC)(int n, PGLuint renderbuffers);

typedef void __stdcall (*PFNGLGENRENDERBUFFERSPROC)(int n, PGLuint renderbuffers);

typedef void __stdcall (*PFNGLRENDERBUFFERSTORAGEPROC)(unsigned target, unsigned internalformat, int width, int height);

typedef void __stdcall (*PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC)(unsigned target, int samples, unsigned internalformat, int width, int height);

typedef void __stdcall (*PFNGLGETRENDERBUFFERPARAMETERIVPROC)(unsigned target, unsigned pname, PGLint params);

typedef System::ByteBool __stdcall (*PFNGLISFRAMEBUFFERPROC)(unsigned framebuffer);

typedef void __stdcall (*PFNGLBINDFRAMEBUFFERPROC)(unsigned target, unsigned framebuffer);

typedef void __stdcall (*PFNGLDELETEFRAMEBUFFERSPROC)(int n, PGLuint framebuffers);

typedef void __stdcall (*PFNGLGENFRAMEBUFFERSPROC)(int n, PGLuint framebuffers);

typedef unsigned __stdcall (*PFNGLCHECKFRAMEBUFFERSTATUSPROC)(unsigned target);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURE1DPROC)(unsigned target, unsigned attachment, unsigned textarget, unsigned texture, int level);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURE2DPROC)(unsigned target, unsigned attachment, unsigned textarget, unsigned texture, int level);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURE3DPROC)(unsigned target, unsigned attachment, unsigned textarget, unsigned texture, int level, int layer);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURELAYERPROC)(unsigned target, unsigned attachment, unsigned texture, int level, int layer);

typedef void __stdcall (*PFNGLFRAMEBUFFERRENDERBUFFERPROC)(unsigned target, unsigned attachment, unsigned renderbuffertarget, unsigned renderbuffer);

typedef void __stdcall (*PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC)(unsigned target, unsigned attachment, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLBLITFRAMEBUFFERPROC)(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, unsigned mask, unsigned filter);

typedef void __stdcall (*PFNGLGENERATEMIPMAPPROC)(unsigned target);

typedef void __stdcall (*PFNGLPROGRAMPARAMETERIARBPROC)(unsigned _program, unsigned pname, int value);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTUREARBPROC)(unsigned target, unsigned attachment, unsigned texture, int level);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURELAYERARBPROC)(unsigned target, unsigned attachment, unsigned texture, int level, int layer);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTUREFACEARBPROC)(unsigned target, unsigned attachment, unsigned texture, int level, unsigned face);

typedef void __stdcall (*PFNGLVERTEXATTRIBDIVISORARBPROC)(unsigned index, unsigned divisor);

typedef void * __stdcall (*PFNGLMAPBUFFERRANGEPROC)(unsigned target, int offset, int length, unsigned access);

typedef void __stdcall (*PFNGLFLUSHMAPPEDBUFFERRANGEPROC)(unsigned target, int offset, int length);

typedef void __stdcall (*PFNGLTEXBUFFERARBPROC)(unsigned target, unsigned internalformat, unsigned buffer);

typedef void __stdcall (*PFNGLBINDVERTEXARRAYPROC)(unsigned _array);

typedef void __stdcall (*PFNGLDELETEVERTEXARRAYSPROC)(int n, PGLuint arrays);

typedef void __stdcall (*PFNGLGENVERTEXARRAYSPROC)(int n, PGLuint arrays);

typedef System::ByteBool __stdcall (*PFNGLISVERTEXARRAYPROC)(unsigned _array);

typedef void __stdcall (*PFNGLGETUNIFORMINDICESPROC)(unsigned _program, int uniformCount, PGLPCharArray uniformNames, PGLuint uniformIndices);

typedef void __stdcall (*PFNGLGETACTIVEUNIFORMSIVPROC)(unsigned _program, int uniformCount, PGLuint uniformIndices, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETACTIVEUNIFORMNAMEPROC)(unsigned _program, unsigned uniformIndex, int bufSize, PGLsizei length, char * uniformName);

typedef unsigned __stdcall (*PFNGLGETUNIFORMBLOCKINDEXPROC)(unsigned _program, char * uniformBlockName);

typedef void __stdcall (*PFNGLGETACTIVEUNIFORMBLOCKIVPROC)(unsigned _program, unsigned uniformBlockIndex, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC)(unsigned _program, unsigned uniformBlockIndex, int bufSize, PGLsizei length, char * uniformBlockName);

typedef void __stdcall (*PFNGLUNIFORMBLOCKBINDINGPROC)(unsigned _program, unsigned uniformBlockIndex, unsigned uniformBlockBinding);

typedef void __stdcall (*PFNGLCOPYBUFFERSUBDATAPROC)(unsigned readTarget, unsigned writeTarget, NativeInt readOffset, NativeInt writeOffset, NativeInt size);

typedef void __stdcall (*PFNGLDRAWELEMENTSBASEVERTEXPROC)(unsigned mode, int count, unsigned _type, void * indices, int basevertex);

typedef void __stdcall (*PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC)(unsigned mode, unsigned start, unsigned _end, int count, unsigned _type, void * indices, int basevertex);

typedef void __stdcall (*PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC)(unsigned mode, int count, unsigned _type, void * indices, int primcount, int basevertex);

typedef void __stdcall (*PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC)(unsigned mode, PGLsizei count, unsigned _type, void *indices, int primcount, PGLint basevertex);

typedef void __stdcall (*PFNGLPROVOKINGVERTEXPROC)(unsigned mode);

typedef NativeInt __stdcall (*PFNGLFENCESYNCPROC)(unsigned condition, unsigned flags);

typedef System::ByteBool __stdcall (*PFNGLISSYNCPROC)(NativeInt sync);

typedef void __stdcall (*PFNGLDELETESYNCPROC)(NativeInt sync);

typedef unsigned __stdcall (*PFNGLCLIENTWAITSYNCPROC)(NativeInt sync, unsigned flags, unsigned __int64 timeout);

typedef void __stdcall (*PFNGLWAITSYNCPROC)(NativeInt sync, unsigned flags, unsigned __int64 timeout);

typedef void __stdcall (*PFNGLGETINTEGER64VPROC)(unsigned pname, PGLint64 params);

typedef void __stdcall (*PFNGLGETSYNCIVPROC)(NativeInt sync, unsigned pname, int bufSize, PGLsizei length, PGLint values);

typedef void __stdcall (*PFNGLTEXIMAGE2DMULTISAMPLEPROC)(unsigned target, int samples, int internalformat, int width, int height, System::ByteBool fixedsamplelocations);

typedef void __stdcall (*PFNGLTEXIMAGE3DMULTISAMPLEPROC)(unsigned target, int samples, int internalformat, int width, int height, int depth, System::ByteBool fixedsamplelocations);

typedef void __stdcall (*PFNGLGETMULTISAMPLEFVPROC)(unsigned pname, unsigned index, System::PSingle val);

typedef void __stdcall (*PFNGLSAMPLEMASKIPROC)(unsigned index, unsigned mask);

typedef void __stdcall (*PFNGLBLENDEQUATIONIARBPROC)(unsigned buf, unsigned mode);

typedef void __stdcall (*PFNGLBLENDEQUATIONSEPARATEIARBPROC)(unsigned buf, unsigned modeRGB, unsigned modeAlpha);

typedef void __stdcall (*PFNGLBLENDFUNCIARBPROC)(unsigned buf, unsigned src, unsigned dst);

typedef void __stdcall (*PFNGLBLENDFUNCSEPARATEIARBPROC)(unsigned buf, unsigned srcRGB, unsigned dstRGB, unsigned srcAlpha, unsigned dstAlpha);

typedef void __stdcall (*PFNGLMINSAMPLESHADINGARBPROC)(float value);

typedef void __stdcall (*PFNGLBINDFRAGDATALOCATIONINDEXEDPROC)(unsigned _program, unsigned colorNumber, unsigned index, const char * name);

typedef int __stdcall (*PFNGLGETFRAGDATAINDEXPROC)(unsigned _program, const char * name);

typedef void __stdcall (*PFNGLGENSAMPLERSPROC)(int count, PGLuint samplers);

typedef void __stdcall (*PFNGLDELETESAMPLERSPROC)(int count, const PGLuint samplers);

typedef System::ByteBool __stdcall (*PFNGLISSAMPLERPROC)(unsigned sampler);

typedef void __stdcall (*PFNGLBINDSAMPLERPROC)(unsigned _unit, unsigned sampler);

typedef void __stdcall (*PFNGLSAMPLERPARAMETERIPROC)(unsigned sampler, unsigned pname, int param);

typedef void __stdcall (*PFNGLSAMPLERPARAMETERIVPROC)(unsigned sampler, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLSAMPLERPARAMETERFPROC)(unsigned sampler, unsigned pname, float param);

typedef void __stdcall (*PFNGLSAMPLERPARAMETERFVPROC)(unsigned sampler, unsigned pname, const System::PSingle params);

typedef void __stdcall (*PFNGLSAMPLERPARAMETERIIVPROC)(unsigned sampler, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLSAMPLERPARAMETERIUIVPROC)(unsigned sampler, unsigned pname, const PGLuint params);

typedef void __stdcall (*PFNGLGETSAMPLERPARAMETERIVPROC)(unsigned sampler, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETSAMPLERPARAMETERIIVPROC)(unsigned sampler, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETSAMPLERPARAMETERFVPROC)(unsigned sampler, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETSAMPLERPARAMETERIFVPROC)(unsigned sampler, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLQUERYCOUNTERPROC)(unsigned id, unsigned target);

typedef void __stdcall (*PFNGLGETQUERYOBJECTI64VPROC)(unsigned id, unsigned pname, PGLint64 params);

typedef void __stdcall (*PFNGLGETQUERYOBJECTUI64VPROC)(unsigned id, unsigned pname, PGLuint64 params);

typedef void __stdcall (*PFNGLVERTEXP2UIPROC)(unsigned _type, unsigned value);

typedef void __stdcall (*PFNGLVERTEXP2UIVPROC)(unsigned _type, const PGLuint value);

typedef void __stdcall (*PFNGLVERTEXP3UIPROC)(unsigned _type, unsigned value);

typedef void __stdcall (*PFNGLVERTEXP3UIVPROC)(unsigned _type, const PGLuint value);

typedef void __stdcall (*PFNGLVERTEXP4UIPROC)(unsigned _type, unsigned value);

typedef void __stdcall (*PFNGLVERTEXP4UIVPROC)(unsigned _type, const PGLuint value);

typedef void __stdcall (*PFNGLTEXCOORDP1UIPROC)(unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLTEXCOORDP1UIVPROC)(unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLTEXCOORDP2UIPROC)(unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLTEXCOORDP2UIVPROC)(unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLTEXCOORDP3UIPROC)(unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLTEXCOORDP3UIVPROC)(unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLTEXCOORDP4UIPROC)(unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLTEXCOORDP4UIVPROC)(unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP1UIPROC)(unsigned texture, unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP1UIVPROC)(unsigned texture, unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP2UIPROC)(unsigned texture, unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP2UIVPROC)(unsigned texture, unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP3UIPROC)(unsigned texture, unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP3UIVPROC)(unsigned texture, unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP4UIPROC)(unsigned texture, unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLMULTITEXCOORDP4UIVPROC)(unsigned texture, unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLNORMALP3UIPROC)(unsigned _type, unsigned coords);

typedef void __stdcall (*PFNGLNORMALP3UIVPROC)(unsigned _type, const PGLuint coords);

typedef void __stdcall (*PFNGLCOLORP3UIPROC)(unsigned _type, unsigned color);

typedef void __stdcall (*PFNGLCOLORP3UIVPROC)(unsigned _type, const PGLuint color);

typedef void __stdcall (*PFNGLCOLORP4UIPROC)(unsigned _type, unsigned color);

typedef void __stdcall (*PFNGLCOLORP4UIVPROC)(unsigned _type, const PGLuint color);

typedef void __stdcall (*PFNGLSECONDARYCOLORP3UIPROC)(unsigned _type, unsigned color);

typedef void __stdcall (*PFNGLSECONDARYCOLORP3UIVPROC)(unsigned _type, const PGLuint color);

typedef void __stdcall (*PFNGLVERTEXATTRIBP1UIPROC)(unsigned index, unsigned _type, System::ByteBool normalized, unsigned value);

typedef void __stdcall (*PFNGLVERTEXATTRIBP1UIVPROC)(unsigned index, unsigned _type, System::ByteBool normalized, const PGLuint value);

typedef void __stdcall (*PFNGLVERTEXATTRIBP2UIPROC)(unsigned index, unsigned _type, System::ByteBool normalized, unsigned value);

typedef void __stdcall (*PFNGLVERTEXATTRIBP2UIVPROC)(unsigned index, unsigned _type, System::ByteBool normalized, const PGLuint value);

typedef void __stdcall (*PFNGLVERTEXATTRIBP3UIPROC)(unsigned index, unsigned _type, System::ByteBool normalized, unsigned value);

typedef void __stdcall (*PFNGLVERTEXATTRIBP3UIVPROC)(unsigned index, unsigned _type, System::ByteBool normalized, const PGLuint value);

typedef void __stdcall (*PFNGLVERTEXATTRIBP4UIPROC)(unsigned index, unsigned _type, System::ByteBool normalized, unsigned value);

typedef void __stdcall (*PFNGLVERTEXATTRIBP4UIVPROC)(unsigned index, unsigned _type, System::ByteBool normalized, const PGLuint value);

typedef void __stdcall (*PFNGLDRAWARRAYSINDIRECTPROC)(unsigned mode, const void * indirect);

typedef void __stdcall (*PFNGLDRAWELEMENTSINDIRECTPROC)(unsigned mode, unsigned _type, const void * indirect);

typedef void __stdcall (*PFNGLUNIFORM1DPROC)(int location, double x);

typedef void __stdcall (*PFNGLUNIFORM2DPROC)(int location, double x, double y);

typedef void __stdcall (*PFNGLUNIFORM3DPROC)(int location, double x, double y, double z);

typedef void __stdcall (*PFNGLUNIFORM4DPROC)(int location, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLUNIFORM1DVPROC)(int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORM2DVPROC)(int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORM3DVPROC)(int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORM4DVPROC)(int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX2DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX3DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX4DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX2X3DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX2X4DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX3X2DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX3X4DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX4X2DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLUNIFORMMATRIX4X3DVPROC)(int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLGETUNIFORMDVPROC)(unsigned _program, int location, System::PDouble params);

typedef void __stdcall (*PFNGLCLIENTATTRIBDEFAULTEXTPROC)(unsigned mask);

typedef void __stdcall (*PFNGLPUSHCLIENTATTRIBDEFAULTEXTPROC)(unsigned mask);

typedef void __stdcall (*PFNGLMATRIXLOADFEXTPROC)(unsigned mode, const System::PSingle m);

typedef void __stdcall (*PFNGLMATRIXLOADDEXTPROC)(unsigned mode, const System::PDouble m);

typedef void __stdcall (*PFNGLMATRIXMULTFEXTPROC)(unsigned mode, const System::PSingle m);

typedef void __stdcall (*PFNGLMATRIXMULTDEXTPROC)(unsigned mode, const System::PDouble m);

typedef void __stdcall (*PFNGLMATRIXLOADIDENTITYEXTPROC)(unsigned mode);

typedef void __stdcall (*PFNGLMATRIXROTATEFEXTPROC)(unsigned mode, float angle, float x, float y, float z);

typedef void __stdcall (*PFNGLMATRIXROTATEDEXTPROC)(unsigned mode, double angle, double x, double y, double z);

typedef void __stdcall (*PFNGLMATRIXSCALEFEXTPROC)(unsigned mode, float x, float y, float z);

typedef void __stdcall (*PFNGLMATRIXSCALEDEXTPROC)(unsigned mode, double x, double y, double z);

typedef void __stdcall (*PFNGLMATRIXTRANSLATEFEXTPROC)(unsigned mode, float x, float y, float z);

typedef void __stdcall (*PFNGLMATRIXTRANSLATEDEXTPROC)(unsigned mode, double x, double y, double z);

typedef void __stdcall (*PFNGLMATRIXFRUSTUMEXTPROC)(unsigned mode, double left, double right, double bottom, double top, double zNear, double zFar);

typedef void __stdcall (*PFNGLMATRIXORTHOEXTPROC)(unsigned mode, double left, double right, double bottom, double top, double zNear, double zFar);

typedef void __stdcall (*PFNGLMATRIXPOPEXTPROC)(unsigned mode);

typedef void __stdcall (*PFNGLMATRIXPUSHEXTPROC)(unsigned mode);

typedef void __stdcall (*PFNGLMATRIXLOADTRANSPOSEFEXTPROC)(unsigned mode, const System::PSingle m);

typedef void __stdcall (*PFNGLMATRIXLOADTRANSPOSEDEXTPROC)(unsigned mode, const System::PDouble m);

typedef void __stdcall (*PFNGLMATRIXMULTTRANSPOSEFEXTPROC)(unsigned mode, const System::PSingle m);

typedef void __stdcall (*PFNGLMATRIXMULTTRANSPOSEDEXTPROC)(unsigned mode, const System::PDouble m);

typedef void __stdcall (*PFNGLTEXTUREPARAMETERFEXTPROC)(unsigned texture, unsigned target, unsigned pname, float param);

typedef void __stdcall (*PFNGLTEXTUREPARAMETERFVEXTPROC)(unsigned texture, unsigned target, unsigned pname, const System::PSingle params);

typedef void __stdcall (*PFNGLTEXTUREPARAMETERIEXTPROC)(unsigned texture, unsigned target, unsigned pname, int param);

typedef void __stdcall (*PFNGLTEXTUREPARAMETERIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLTEXTUREIMAGE1DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int width, int border, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLTEXTUREIMAGE2DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int width, int height, int border, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLTEXTURESUBIMAGE1DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int width, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLTEXTURESUBIMAGE2DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int yoffset, int width, int height, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLCOPYTEXTUREIMAGE1DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int x, int y, int width, int border);

typedef void __stdcall (*PFNGLCOPYTEXTUREIMAGE2DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int x, int y, int width, int height, int border);

typedef void __stdcall (*PFNGLCOPYTEXTURESUBIMAGE1DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int x, int y, int width);

typedef void __stdcall (*PFNGLCOPYTEXTURESUBIMAGE2DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int yoffset, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLGETTEXTUREIMAGEEXTPROC)(unsigned texture, unsigned target, int level, unsigned format, unsigned type_, void * pixels);

typedef void __stdcall (*PFNGLGETTEXTUREPARAMETERFVEXTPROC)(unsigned texture, unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETTEXTUREPARAMETERIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETTEXTURELEVELPARAMETERFVEXTPROC)(unsigned texture, unsigned target, int level, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETTEXTURELEVELPARAMETERIVEXTPROC)(unsigned texture, unsigned target, int level, unsigned pname, int params);

typedef void __stdcall (*PFNGLTEXTUREIMAGE3DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int width, int height, int depth, int border, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLTEXTURESUBIMAGE3DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLCOPYTEXTURESUBIMAGE3DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLMULTITEXPARAMETERFEXTPROC)(unsigned texunit, unsigned target, unsigned pname, float param);

typedef void __stdcall (*PFNGLMULTITEXPARAMETERFVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, const System::PSingle params);

typedef void __stdcall (*PFNGLMULTITEXPARAMETERIEXTPROC)(unsigned texunit, unsigned target, unsigned pname, int param);

typedef void __stdcall (*PFNGLMULTITEXPARAMETERIVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLMULTITEXIMAGE1DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int width, int border, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLMULTITEXIMAGE2DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int width, int height, int border, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLMULTITEXSUBIMAGE1DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int width, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLMULTITEXSUBIMAGE2DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int yoffset, int width, int height, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLCOPYMULTITEXIMAGE1DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int x, int y, int width, int border);

typedef void __stdcall (*PFNGLCOPYMULTITEXIMAGE2DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int x, int y, int width, int height, int border);

typedef void __stdcall (*PFNGLCOPYMULTITEXSUBIMAGE1DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int x, int y, int width);

typedef void __stdcall (*PFNGLCOPYMULTITEXSUBIMAGE2DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int yoffset, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLGETMULTITEXIMAGEEXTPROC)(unsigned texunit, unsigned target, int level, unsigned format, unsigned type_, void * pixels);

typedef void __stdcall (*PFNGLGETMULTITEXPARAMETERFVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETMULTITEXPARAMETERIVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETMULTITEXLEVELPARAMETERFVEXTPROC)(unsigned texunit, unsigned target, int level, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETMULTITEXLEVELPARAMETERIVEXTPROC)(unsigned texunit, unsigned target, int level, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLMULTITEXIMAGE3DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int width, int height, int depth, int border, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLMULTITEXSUBIMAGE3DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned format, unsigned type_, const void * pixels);

typedef void __stdcall (*PFNGLCOPYMULTITEXSUBIMAGE3DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLBINDMULTITEXTUREEXTPROC)(unsigned texunit, unsigned target, unsigned texture);

typedef void __stdcall (*PFNGLENABLECLIENTSTATEINDEXEDEXTPROC)(unsigned array_, unsigned index_);

typedef void __stdcall (*PFNGLDISABLECLIENTSTATEINDEXEDEXTPROC)(unsigned array_, unsigned index_);

typedef void __stdcall (*PFNGLMULTITEXCOORDPOINTEREXTPROC)(unsigned texunit, int size, unsigned type_, int stride, const void * pointer);

typedef void __stdcall (*PFNGLMULTITEXENVFEXTPROC)(unsigned texunit, unsigned target, unsigned pname, float param);

typedef void __stdcall (*PFNGLMULTITEXENVFVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, const System::PSingle params);

typedef void __stdcall (*PFNGLMULTITEXENVIEXTPROC)(unsigned texunit, unsigned target, unsigned pname, int param);

typedef void __stdcall (*PFNGLMULTITEXENVIVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLMULTITEXGENDEXTPROC)(unsigned texunit, unsigned target, unsigned pname, double param);

typedef void __stdcall (*PFNGLMULTITEXGENDVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, const System::PDouble params);

typedef void __stdcall (*PFNGLMULTITEXGENFEXTPROC)(unsigned texunit, unsigned target, unsigned pname, float param);

typedef void __stdcall (*PFNGLMULTITEXGENFVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, const System::PSingle params);

typedef void __stdcall (*PFNGLMULTITEXGENIEXTPROC)(unsigned texunit, unsigned target, unsigned pname, int param);

typedef void __stdcall (*PFNGLMULTITEXGENIVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLGETMULTITEXENVFVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETMULTITEXENVIVEXTPROC)(unsigned texunit, unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETMULTITEXGENDVEXTPROC)(unsigned texunit, unsigned coord, unsigned pname, System::PDouble params);

typedef void __stdcall (*PFNGLGETMULTITEXGENFVEXTPROC)(unsigned texunit, unsigned coord, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETMULTITEXGENIVEXTPROC)(unsigned texunit, unsigned coord, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETFLOATINDEXEDVEXTPROC)(unsigned target, unsigned index_, System::PSingle data);

typedef void __stdcall (*PFNGLGETDOUBLEINDEXEDVEXTPROC)(unsigned target, unsigned index_, System::PDouble data);

typedef void __stdcall (*PFNGLGETPOINTERINDEXEDVEXTPROC)(unsigned target, unsigned index_, void * data);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXTUREIMAGE3DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int width, int height, int depth, int border, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXTUREIMAGE2DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int width, int height, int border, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXTUREIMAGE1DEXTPROC)(unsigned texture, unsigned target, int level, unsigned internalformat, int width, int border, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXTURESUBIMAGE3DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned format, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXTURESUBIMAGE2DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int yoffset, int width, int height, unsigned format, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDTEXTURESUBIMAGE1DEXTPROC)(unsigned texture, unsigned target, int level, int xoffset, int width, unsigned format, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLGETCOMPRESSEDTEXTUREIMAGEEXTPROC)(unsigned texture, unsigned target, int lod, void * img);

typedef void __stdcall (*PFNGLCOMPRESSEDMULTITEXIMAGE3DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int width, int height, int depth, int border, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDMULTITEXIMAGE2DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int width, int height, int border, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDMULTITEXIMAGE1DEXTPROC)(unsigned texunit, unsigned target, int level, unsigned internalformat, int width, int border, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDMULTITEXSUBIMAGE3DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned format, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDMULTITEXSUBIMAGE2DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int yoffset, int width, int height, unsigned format, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLCOMPRESSEDMULTITEXSUBIMAGE1DEXTPROC)(unsigned texunit, unsigned target, int level, int xoffset, int width, unsigned format, int imageSize, const void * bits);

typedef void __stdcall (*PFNGLGETCOMPRESSEDMULTITEXIMAGEEXTPROC)(unsigned texunit, unsigned target, int lod, void * img);

typedef void __stdcall (*PFNGLNAMEDPROGRAMSTRINGEXTPROC)(unsigned program_, unsigned target, unsigned format, int len, const void * string_);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETER4DEXTPROC)(unsigned program_, unsigned target, unsigned index_, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETER4DVEXTPROC)(unsigned program_, unsigned target, unsigned index_, const System::PDouble params);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETER4FEXTPROC)(unsigned program_, unsigned target, unsigned index_, float x, float y, float z, float w);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETER4FVEXTPROC)(unsigned program_, unsigned target, unsigned index_, const System::PSingle params);

typedef void __stdcall (*PFNGLGETNAMEDPROGRAMLOCALPARAMETERDVEXTPROC)(unsigned program_, unsigned target, unsigned index_, System::PDouble params);

typedef void __stdcall (*PFNGLGETNAMEDPROGRAMLOCALPARAMETERFVEXTPROC)(unsigned program_, unsigned target, unsigned index_, System::PSingle params);

typedef void __stdcall (*PFNGLGETNAMEDPROGRAMIVEXTPROC)(unsigned program_, unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETNAMEDPROGRAMSTRINGEXTPROC)(unsigned program_, unsigned target, unsigned pname, void * string_);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETERS4FVEXTPROC)(unsigned program_, unsigned target, unsigned index_, int count, const System::PSingle params);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETERI4IEXTPROC)(unsigned program_, unsigned target, unsigned index_, int x, int y, int z, int w);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETERI4IVEXTPROC)(unsigned program_, unsigned target, unsigned index_, const PGLint params);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETERSI4IVEXTPROC)(unsigned program_, unsigned target, unsigned index_, int count, const PGLint params);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIEXTPROC)(unsigned program_, unsigned target, unsigned index_, unsigned x, unsigned y, unsigned z, unsigned w);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIVEXTPROC)(unsigned program_, unsigned target, unsigned index_, const PGLuint params);

typedef void __stdcall (*PFNGLNAMEDPROGRAMLOCALPARAMETERSI4UIVEXTPROC)(unsigned program_, unsigned target, unsigned index_, int count, const PGLuint params);

typedef void __stdcall (*PFNGLGETNAMEDPROGRAMLOCALPARAMETERIIVEXTPROC)(unsigned program_, unsigned target, unsigned index_, PGLint params);

typedef void __stdcall (*PFNGLGETNAMEDPROGRAMLOCALPARAMETERIUIVEXTPROC)(unsigned program_, unsigned target, unsigned index_, PGLuint params);

typedef void __stdcall (*PFNGLTEXTUREPARAMETERIIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLTEXTUREPARAMETERIUIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, const PGLuint params);

typedef void __stdcall (*PFNGLGETTEXTUREPARAMETERIIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETTEXTUREPARAMETERIUIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLMULTITEXPARAMETERIIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, const PGLint params);

typedef void __stdcall (*PFNGLMULTITEXPARAMETERIUIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, const PGLuint params);

typedef void __stdcall (*PFNGLGETMULTITEXPARAMETERIIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETMULTITEXPARAMETERIUIVEXTPROC)(unsigned texture, unsigned target, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLNAMEDBUFFERDATAEXTPROC)(unsigned buffer, int size, const void * data, unsigned usage);

typedef void __stdcall (*PFNGLNAMEDBUFFERSUBDATAEXTPROC)(unsigned buffer, NativeInt offset, NativeInt size, const void * data);

typedef void * __stdcall (*PFNGLMAPNAMEDBUFFEREXTPROC)(unsigned buffer, unsigned access);

typedef System::ByteBool __stdcall (*PFNGLUNMAPNAMEDBUFFEREXTPROC)(unsigned buffer);

typedef void * __stdcall (*PFNGLMAPNAMEDBUFFERRANGEEXTPROC)(unsigned buffer, NativeInt offset, NativeInt length, unsigned access);

typedef void __stdcall (*PFNGLFLUSHMAPPEDNAMEDBUFFERRANGEEXTPROC)(unsigned buffer, NativeInt offset, NativeInt length);

typedef void __stdcall (*PFNGLNAMEDCOPYBUFFERSUBDATAEXTPROC)(unsigned readBuffer, unsigned writeBuffer, NativeInt readOffset, NativeInt writeOffset, NativeInt size);

typedef void __stdcall (*PFNGLGETNAMEDBUFFERPARAMETERIVEXTPROC)(unsigned buffer, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETNAMEDBUFFERPOINTERVEXTPROC)(unsigned buffer, unsigned pname, void * params);

typedef void __stdcall (*PFNGLGETNAMEDBUFFERSUBDATAEXTPROC)(unsigned buffer, NativeInt offset, NativeInt size, void * data);

typedef void __stdcall (*PFNGLTEXTUREBUFFEREXTPROC)(unsigned texture, unsigned target, unsigned internalformat, unsigned buffer);

typedef void __stdcall (*PFNGLMULTITEXBUFFEREXTPROC)(unsigned texunit, unsigned target, unsigned interformat, unsigned buffer);

typedef void __stdcall (*PFNGLNAMEDRENDERBUFFERSTORAGEEXTPROC)(unsigned renderbuffer, unsigned interformat, int width, int height);

typedef void __stdcall (*PFNGLGETNAMEDRENDERBUFFERPARAMETERIVEXTPROC)(unsigned renderbuffer, unsigned pname, PGLint params);

typedef unsigned __stdcall (*PFNGLCHECKNAMEDFRAMEBUFFERSTATUSEXTPROC)(unsigned framebuffer, unsigned target);

typedef void __stdcall (*PFNGLNAMEDFRAMEBUFFERTEXTURE1DEXTPROC)(unsigned framebuffer, unsigned attachment, unsigned textarget, unsigned texture, int level);

typedef void __stdcall (*PFNGLNAMEDFRAMEBUFFERTEXTURE2DEXTPROC)(unsigned framebuffer, unsigned attachment, unsigned textarget, unsigned texture, int level);

typedef void __stdcall (*PFNGLNAMEDFRAMEBUFFERTEXTURE3DEXTPROC)(unsigned framebuffer, unsigned attachment, unsigned textarget, unsigned texture, int level, int zoffset);

typedef void __stdcall (*PFNGLNAMEDFRAMEBUFFERRENDERBUFFEREXTPROC)(unsigned framebuffer, unsigned attachment, unsigned renderbuffertarget, unsigned renderbuffer);

typedef void __stdcall (*PFNGLGETNAMEDFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC)(unsigned framebuffer, unsigned attachment, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGENERATETEXTUREMIPMAPEXTPROC)(unsigned texture, unsigned target);

typedef void __stdcall (*PFNGLGENERATEMULTITEXMIPMAPEXTPROC)(unsigned texunit, unsigned target);

typedef void __stdcall (*PFNGLFRAMEBUFFERDRAWBUFFEREXTPROC)(unsigned framebuffer, unsigned mode);

typedef void __stdcall (*PFNGLFRAMEBUFFERDRAWBUFFERSEXTPROC)(unsigned framebuffer, int n, const PGLenum bufs);

typedef void __stdcall (*PFNGLFRAMEBUFFERREADBUFFEREXTPROC)(unsigned framebuffer, unsigned mode);

typedef void __stdcall (*PFNGLGETFRAMEBUFFERPARAMETERIVEXTPROC)(unsigned framebuffer, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC)(unsigned renderbuffer, int samples, unsigned internalformat, int width, int height);

typedef void __stdcall (*PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLECOVERAGEEXTPROC)(unsigned renderbuffer, int coverageSamples, int colorSamples, unsigned internalformat, int width, int height);

typedef void __stdcall (*PFNGLNAMEDFRAMEBUFFERTEXTUREEXTPROC)(unsigned framebuffer, unsigned attachment, unsigned texture, int level);

typedef void __stdcall (*PFNGLNAMEDFRAMEBUFFERTEXTURELAYEREXTPROC)(unsigned framebuffer, unsigned attachment, unsigned texture, int level, int layer);

typedef void __stdcall (*PFNGLNAMEDFRAMEBUFFERTEXTUREFACEEXTPROC)(unsigned framebuffer, unsigned attachment, unsigned texture, int level, unsigned face);

typedef void __stdcall (*PFNGLTEXTURERENDERBUFFEREXTPROC)(unsigned texture, unsigned target, unsigned renderbuffer);

typedef void __stdcall (*PFNGLMULTITEXRENDERBUFFEREXTPROC)(unsigned texunit, unsigned target, unsigned renderbuffer);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1DEXTPROC)(unsigned _program, int location, double x);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2DEXTPROC)(unsigned _program, int location, double x, double y);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3DEXTPROC)(unsigned _program, int location, double x, double y, double z);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4DEXTPROC)(unsigned _program, int location, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1DVEXTPROC)(unsigned _program, int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2DVEXTPROC)(unsigned _program, int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3DVEXTPROC)(unsigned _program, int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4DVEXTPROC)(unsigned _program, int location, int count, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2X3DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2X4DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3X2DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3X4DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4X2DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4X3DVEXTPROC)(unsigned _program, int location, int count, System::ByteBool transpose, const System::PDouble value);

typedef int __stdcall (*PFNGLGETSUBROUTINEUNIFORMLOCATIONPROC)(unsigned _program, unsigned shadertype, const char * name);

typedef unsigned __stdcall (*PFNGLGETSUBROUTINEINDEXPROC)(unsigned _program, unsigned shadertype, const char * name);

typedef void __stdcall (*PFNGLGETACTIVESUBROUTINEUNIFORMIVPROC)(unsigned _program, unsigned shadertype, unsigned index, unsigned pname, PGLint values);

typedef void __stdcall (*PFNGLGETACTIVESUBROUTINEUNIFORMNAMEPROC)(unsigned _program, unsigned shadertype, unsigned index, int bufsize, PGLsizei length, char * name);

typedef void __stdcall (*PFNGLGETACTIVESUBROUTINENAMEPROC)(unsigned _program, unsigned shadertype, unsigned index, int bufsize, PGLsizei length, char * name);

typedef void __stdcall (*PFNGLUNIFORMSUBROUTINESUIVPROC)(unsigned shadertype, int count, const PGLuint indices);

typedef void __stdcall (*PFNGLGETUNIFORMSUBROUTINEUIVPROC)(unsigned shadertype, int location, PGLuint params);

typedef void __stdcall (*PFNGLGETPROGRAMSTAGEIVPROC)(unsigned _program, unsigned shadertype, unsigned pname, PGLint values);

typedef void __stdcall (*PFNGLPATCHPARAMETERIPROC)(unsigned pname, int value);

typedef void __stdcall (*PFNGLPATCHPARAMETERFVPROC)(unsigned pname, const System::PSingle values);

typedef void __stdcall (*PFNGLBINDTRANSFORMFEEDBACKPROC)(unsigned target, unsigned id);

typedef void __stdcall (*PFNGLDELETETRANSFORMFEEDBACKSPROC)(int n, const PGLuint ids);

typedef void __stdcall (*PFNGLGENTRANSFORMFEEDBACKSPROC)(int n, PGLuint ids);

typedef System::ByteBool __stdcall (*PFNGLISTRANSFORMFEEDBACKPROC)(unsigned id);

typedef void __stdcall (*PFNGLPAUSETRANSFORMFEEDBACKPROC)(void);

typedef void __stdcall (*PFNGLRESUMETRANSFORMFEEDBACKPROC)(void);

typedef void __stdcall (*PFNGLDRAWTRANSFORMFEEDBACKPROC)(unsigned mode, unsigned id);

typedef void __stdcall (*PFNGLDRAWTRANSFORMFEEDBACKSTREAMPROC)(unsigned mode, unsigned id, unsigned stream);

typedef void __stdcall (*PFNGLBEGINQUERYINDEXEDPROC)(unsigned target, unsigned index, unsigned id);

typedef void __stdcall (*PFNGLENDQUERYINDEXEDPROC)(unsigned target, unsigned index);

typedef void __stdcall (*PFNGLGETQUERYINDEXEDIVPROC)(unsigned target, unsigned index, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLRELEASESHADERCOMPILERPROC)(void);

typedef void __stdcall (*PFNGLSHADERBINARYPROC)(int count, PGLuint shaders, unsigned binaryformat, void * binary, int length);

typedef void __stdcall (*PFNGLGETSHADERPRECISIONFORMATPROC)(unsigned shadertype, unsigned precisiontype, PGLint range, PGLint precision);

typedef void __stdcall (*PFNGLDEPTHRANGEFPROC)(float n, float f);

typedef void __stdcall (*PFNGLCLEARDEPTHFPROC)(float d);

typedef void __stdcall (*PFNGLGETPROGRAMBINARYPROC)(unsigned _program, int bufSize, PGLsizei length, PGLenum binaryFormat, void * binary);

typedef void __stdcall (*PFNGLPROGRAMBINARYPROC)(unsigned _program, unsigned binaryFormat, void * binary, int length);

typedef void __stdcall (*PFNGLPROGRAMPARAMETERIPROC)(unsigned _program, unsigned pname, int value);

typedef void __stdcall (*PFNGLUSEPROGRAMSTAGESPROC)(unsigned pipeline, unsigned stages, unsigned _program);

typedef void __stdcall (*PFNGLACTIVESHADERPROGRAMPROC)(unsigned pipeline, unsigned _program);

typedef unsigned __stdcall (*PFNGLCREATESHADERPROGRAMVPROC)(unsigned _type, int count, const PGLPCharArray strings);

typedef void __stdcall (*PFNGLBINDPROGRAMPIPELINEPROC)(unsigned pipeline);

typedef void __stdcall (*PFNGLDELETEPROGRAMPIPELINESPROC)(int n, PGLuint pipelines);

typedef void __stdcall (*PFNGLGENPROGRAMPIPELINESPROC)(int n, PGLuint pipelines);

typedef System::ByteBool __stdcall (*PFNGLISPROGRAMPIPELINEPROC)(unsigned pipeline);

typedef void __stdcall (*PFNGLGETPROGRAMPIPELINEIVPROC)(unsigned pipeline, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1IPROC)(unsigned _program, int location, int v0);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1IVPROC)(unsigned _program, int location, int count, PGLint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1FPROC)(unsigned _program, int location, float v0);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1FVPROC)(unsigned _program, int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1DPROC)(unsigned _program, int location, double v0);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1DVPROC)(unsigned _program, int location, int count, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1UIPROC)(unsigned _program, int location, unsigned v0);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM1UIVPROC)(unsigned _program, int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2IPROC)(unsigned _program, int location, int v0, int v1);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2IVPROC)(unsigned _program, int location, int count, PGLint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2FPROC)(unsigned _program, int location, float v0, float v1);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2FVPROC)(unsigned _program, int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2DPROC)(unsigned _program, int location, double v0, double v1);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2DVPROC)(unsigned _program, int location, int count, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2UIPROC)(unsigned _program, int location, unsigned v0, unsigned v1);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM2UIVPROC)(unsigned _program, int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3IPROC)(unsigned _program, int location, int v0, int v1, int v2);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3IVPROC)(unsigned _program, int location, int count, PGLint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3FPROC)(unsigned _program, int location, float v0, float v1, float v2);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3FVPROC)(unsigned _program, int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3DPROC)(unsigned _program, int location, double v0, double v1, double v2);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3DVPROC)(unsigned _program, int location, int count, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3UIPROC)(unsigned _program, int location, unsigned v0, unsigned v1, unsigned v2);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM3UIVPROC)(unsigned _program, int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4IPROC)(unsigned _program, int location, int v0, int v1, int v2, int v3);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4IVPROC)(unsigned _program, int location, int count, PGLint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4FPROC)(unsigned _program, int location, float v0, float v1, float v2, float v3);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4FVPROC)(unsigned _program, int location, int count, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4DPROC)(unsigned _program, int location, double v0, double v1, double v2, double v3);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4DVPROC)(unsigned _program, int location, int count, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4UIPROC)(unsigned _program, int location, unsigned v0, unsigned v1, unsigned v2, unsigned v3);

typedef void __stdcall (*PFNGLPROGRAMUNIFORM4UIVPROC)(unsigned _program, int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2X3FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3X2FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2X4FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4X2FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3X4FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4X3FVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PSingle value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2X3DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3X2DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX2X4DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4X2DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX3X4DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMMATRIX4X3DVPROC)(unsigned _program, int location, int count, System::ByteBool transpose, System::PDouble value);

typedef void __stdcall (*PFNGLVALIDATEPROGRAMPIPELINEPROC)(unsigned pipeline);

typedef void __stdcall (*PFNGLGETPROGRAMPIPELINEINFOLOGPROC)(unsigned pipeline, int bufSize, PGLsizei length, char * infoLog);

typedef void __stdcall (*PFNGLVERTEXATTRIBL1DPROC)(unsigned index, double x);

typedef void __stdcall (*PFNGLVERTEXATTRIBL2DPROC)(unsigned index, double x, double y);

typedef void __stdcall (*PFNGLVERTEXATTRIBL3DPROC)(unsigned index, double x, double y, double z);

typedef void __stdcall (*PFNGLVERTEXATTRIBL4DPROC)(unsigned index, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLVERTEXATTRIBL1DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBL2DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBL3DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBL4DVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBLPOINTERPROC)(unsigned index, int size, unsigned _type, int stride, void * ptr);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBLDVPROC)(unsigned index, unsigned pname, System::PDouble params);

typedef void __stdcall (*PFNGLVERTEXARRAYVERTEXATTRIBLOFFSETEXTPROC)(unsigned vaobj, unsigned buffer, unsigned index, int size, unsigned _type, int stride, NativeInt offset);

typedef void __stdcall (*PFNGLVIEWPORTARRAYVPROC)(unsigned first, int count, System::PSingle v);

typedef void __stdcall (*PFNGLVIEWPORTINDEXEDFPROC)(unsigned index, float x, float y, float w, float h);

typedef void __stdcall (*PFNGLVIEWPORTINDEXEDFVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLSCISSORARRAYVPROC)(unsigned first, int count, PGLint v);

typedef void __stdcall (*PFNGLSCISSORINDEXEDPROC)(unsigned index, int left, int bottom, int width, int height);

typedef void __stdcall (*PFNGLSCISSORINDEXEDVPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLDEPTHRANGEARRAYVPROC)(unsigned first, int count, PGLclampd v);

typedef void __stdcall (*PFNGLDEPTHRANGEINDEXEDPROC)(unsigned index, double n, double f);

typedef void __stdcall (*PFNGLGETFLOATI_VPROC)(unsigned target, unsigned index, System::PSingle data);

typedef void __stdcall (*PFNGLGETDOUBLEI_VPROC)(unsigned target, unsigned index, System::PDouble data);

typedef void __stdcall (*PFNGLDEBUGMESSAGECONTROLARBPROC)(unsigned source, unsigned _type, unsigned severity, int count, PGLuint ids, System::ByteBool enabled);

typedef void __stdcall (*PFNGLDEBUGMESSAGEINSERTARBPROC)(unsigned source, unsigned _type, unsigned id, unsigned severity, int length, char * buf);

typedef void __stdcall (*PFNGLDEBUGMESSAGECALLBACKARBPROC)(TDebugProc callback, void * userParam);

typedef unsigned __stdcall (*PFNGLGETDEBUGMESSAGELOGARBPROC)(unsigned count, int bufsize, PGLenum sources, PGLenum types, PGLuint ids, PGLenum severities, PGLsizei lengths, char * messageLog);

typedef unsigned __stdcall (*PFNGLGETGRAPHICSRESETSTATUSARBPROC)(void);

typedef void __stdcall (*PFNGLGETNMAPDVARBPROC)(unsigned target, unsigned query, int bufSize, System::PDouble v);

typedef void __stdcall (*PFNGLGETNMAPFVARBPROC)(unsigned target, unsigned query, int bufSize, System::PSingle v);

typedef void __stdcall (*PFNGLGETNMAPIVARBPROC)(unsigned target, unsigned query, int bufSize, PGLint v);

typedef void __stdcall (*PFNGLGETNPIXELMAPFVARBPROC)(unsigned map, int bufSize, System::PSingle values);

typedef void __stdcall (*PFNGLGETNPIXELMAPUIVARBPROC)(unsigned map, int bufSize, PGLuint values);

typedef void __stdcall (*PFNGLGETNPIXELMAPUSVARBPROC)(unsigned map, int bufSize, System::PWord values);

typedef void __stdcall (*PFNGLGETNPOLYGONSTIPPLEARBPROC)(int bufSize, System::PByte pattern);

typedef void __stdcall (*PFNGLGETNCOLORTABLEARBPROC)(unsigned target, unsigned format, unsigned _type, int bufSize, void * table);

typedef void __stdcall (*PFNGLGETNCONVOLUTIONFILTERARBPROC)(unsigned target, unsigned format, unsigned _type, int bufSize, void * image);

typedef void __stdcall (*PFNGLGETNSEPARABLEFILTERARBPROC)(unsigned target, unsigned format, unsigned _type, int rowBufSize, void * row, int columnBufSize, void * column, void * span);

typedef void __stdcall (*PFNGLGETNHISTOGRAMARBPROC)(unsigned target, System::ByteBool reset, unsigned format, unsigned _type, int bufSize, void * values);

typedef void __stdcall (*PFNGLGETNMINMAXARBPROC)(unsigned target, System::ByteBool reset, unsigned format, unsigned _type, int bufSize, void * values);

typedef void __stdcall (*PFNGLGETNTEXIMAGEARBPROC)(unsigned target, int level, unsigned format, unsigned _type, int bufSize, void * img);

typedef void __stdcall (*PFNGLREADNPIXELSARBPROC)(int x, int y, int width, int height, unsigned format, unsigned _type, int bufSize, void * data);

typedef void __stdcall (*PFNGLGETNCOMPRESSEDTEXIMAGEARBPROC)(unsigned target, int lod, int bufSize, void * img);

typedef void __stdcall (*PFNGLGETNUNIFORMFVARBPROC)(unsigned _program, int location, int bufSize, System::PSingle params);

typedef void __stdcall (*PFNGLGETNUNIFORMIVARBPROC)(unsigned _program, int location, int bufSize, PGLint params);

typedef void __stdcall (*PFNGLGETNUNIFORMUIVARBPROC)(unsigned _program, int location, int bufSize, PGLuint params);

typedef void __stdcall (*PFNGLGETNUNIFORMDVARBPROC)(unsigned _program, int location, int bufSize, System::PDouble params);

typedef void __stdcall (*PFNGLARRAYELEMENTARRAYEXTPROC)(unsigned mode, int count, void * pi);

typedef void __stdcall (*PFNGLADDSWAPHINTRECTWINPROC)(int x, int y, int width, int height);

typedef void __stdcall (*PFNGLBLENDCOLOREXTPROC)(float red, float green, float blue, float alpha);

typedef void __stdcall (*PFNGLPOLYGONOFFSETEXTPROC)(float factor, float bias);

typedef void __stdcall (*PFNGLTEXIMAGE3DEXTPROC)(unsigned target, int level, unsigned internalformat, int width, int height, int depth, int border, unsigned Format, unsigned AType, void * pixels);

typedef void __stdcall (*PFNGLTEXSUBIMAGE1DEXTPROC)(unsigned target, int level, int xoffset, int width, unsigned format, unsigned Atype, void * pixels);

typedef void __stdcall (*PFNGLTEXSUBIMAGE2DEXTPROC)(unsigned target, int level, int xoffset, int yoffset, int width, int height, unsigned format, unsigned Atype, void * pixels);

typedef void __stdcall (*PFNGLTEXSUBIMAGE3DEXTPROC)(unsigned target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned format, unsigned Atype, void * pixels);

typedef void __stdcall (*PFNGLCOPYTEXIMAGE1DEXTPROC)(unsigned target, int level, unsigned internalFormat, int x, int y, int width, int border);

typedef void __stdcall (*PFNGLCOPYTEXIMAGE2DEXTPROC)(unsigned target, int level, unsigned internalFormat, int x, int y, int width, int height, int border);

typedef void __stdcall (*PFNGLCOPYTEXSUBIMAGE1DEXTPROC)(unsigned target, int level, int xoffset, int x, int y, int width);

typedef void __stdcall (*PFNGLCOPYTEXSUBIMAGE2DEXTPROC)(unsigned target, int level, int xoffset, int yoffset, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLCOPYTEXSUBIMAGE3DEXTPROC)(unsigned target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height);

typedef void __stdcall (*PFNGLGENTEXTURESEXTPROC)(int n, PGLuint textures);

typedef void __stdcall (*PFNGLDELETETEXTURESEXTPROC)(int n, PGLuint textures);

typedef void __stdcall (*PFNGLBINDTEXTUREEXTPROC)(unsigned target, unsigned texture);

typedef void __stdcall (*PFNGLPRIORITIZETEXTURESEXTPROC)(int n, PGLuint textures, PGLclampf priorities);

typedef System::ByteBool __stdcall (*PFNGLARETEXTURESRESIDENTEXTPROC)(int n, PGLuint textures, PGLboolean residences);

typedef System::ByteBool __stdcall (*PFNGLISTEXTUREEXTPROC)(unsigned texture);

typedef void __stdcall (*PFNGLSAMPLEMASKSGISPROC)(float Value, System::ByteBool invert);

typedef void __stdcall (*PFNGLSAMPLEPATTERNSGISPROC)(unsigned pattern);

typedef void __stdcall (*PFNGLBLENDEQUATIONEXTPROC)(unsigned mode);

typedef void __stdcall (*PFNGLCOLORTABLEEXTPROC)(unsigned target, unsigned internalFormat, int width, unsigned format, unsigned atype, void * data);

typedef void __stdcall (*PFNGLCOLORSUBTABLEEXTPROC)(unsigned target, int start, int count, unsigned format, unsigned atype, void * data);

typedef void __stdcall (*PFNGLGETCOLORTABLEEXTPROC)(unsigned target, unsigned format, unsigned atype, void * data);

typedef void __stdcall (*PFNGLGETCOLORTABLEPARAMETERFVEXTPROC)(unsigned target, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETCOLORTABLEPARAMETERIVEXTPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLINDEXMATERIALEXTPROC)(unsigned face, unsigned mode);

typedef void __stdcall (*PFNGLINDEXFUNCEXTPROC)(unsigned func, float ref);

typedef void __stdcall (*PFNGLLOCKARRAYSEXTPROC)(int first, int count);

typedef void __stdcall (*PFNGLUNLOCKARRAYSEXTPROC)(void);

typedef void __stdcall (*PFNGLDRAWRANGEELEMENTSEXTPROC)(unsigned mode, unsigned start, unsigned Aend, int Count, unsigned Atype, void * indices);

typedef void __stdcall (*PFNGLBEGINSCENEEXTPROC)(void);

typedef void __stdcall (*PFNGLENDSCENEEXTPROC)(void);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3BEXTPROC)(System::Int8 red, System::Int8 green, System::Int8 blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3BVEXTPROC)(PGLbyte v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3DEXTPROC)(double red, double green, double blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3DVEXTPROC)(System::PDouble v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3FEXTPROC)(float red, float green, float blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3FVEXTPROC)(System::PSingle v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3IEXTPROC)(int red, int green, int blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3IVEXTPROC)(PGLint v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3SEXTPROC)(short red, short green, short blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3SVEXTPROC)(PGLshort v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UBEXTPROC)(System::Byte red, System::Byte green, System::Byte blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UBVEXTPROC)(System::PByte v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UIEXTPROC)(unsigned red, unsigned green, unsigned blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3UIVEXTPROC)(PGLuint v);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3USEXTPROC)(System::Word red, System::Word green, System::Word blue);

typedef void __stdcall (*PFNGLSECONDARYCOLOR3USVEXTPROC)(System::PWord v);

typedef void __stdcall (*PFNGLSECONDARYCOLORPOINTEREXTPROC)(int Size, unsigned Atype, int stride, void * p);

typedef void __stdcall (*PFNGLMULTIDRAWARRAYSEXTPROC)(unsigned mode, PGLint First, PGLsizei Count, int primcount);

typedef void __stdcall (*PFNGLMULTIDRAWELEMENTSEXTPROC)(unsigned mode, PGLsizei Count, unsigned AType, void *indices, int primcount);

typedef void __stdcall (*PFNGLFOGCOORDFEXTPROC)(float coord);

typedef void __stdcall (*PFNGLFOGCOORDFVEXTPROC)(System::PSingle coord);

typedef void __stdcall (*PFNGLFOGCOORDDEXTPROC)(double coord);

typedef void __stdcall (*PFNGLFOGCOORDDVEXTPROC)(System::PDouble coord);

typedef void __stdcall (*PFNGLFOGCOORDPOINTEREXTPROC)(unsigned AType, int stride, void * p);

typedef void __stdcall (*PFNGLBLENDFUNCSEPARATEEXTPROC)(unsigned sfactorRGB, unsigned dfactorRGB, unsigned sfactorAlpha, unsigned dfactorAlpha);

typedef void __stdcall (*PFNGLFLUSHVERTEXARRAYRANGENVPROC)(void);

typedef void __stdcall (*PFNGLVERTEXARRAYRANGENVPROC)(int Size, void * p);

typedef void * __stdcall (*PFNWGLALLOCATEMEMORYNVPROC)(int size, float readFrequency, float writeFrequency, float priority);

typedef void __stdcall (*PFNWGLFREEMEMORYNVPROC)(void * ptr);

typedef void __stdcall (*PFNGLCOMBINERPARAMETERFVNVPROC)(unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLCOMBINERPARAMETERFNVPROC)(unsigned pname, float param);

typedef void __stdcall (*PFNGLCOMBINERPARAMETERIVNVPROC)(unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLCOMBINERPARAMETERINVPROC)(unsigned pname, int param);

typedef void __stdcall (*PFNGLCOMBINERINPUTNVPROC)(unsigned stage, unsigned portion, unsigned variable, unsigned input, unsigned mapping, unsigned componentUsage);

typedef void __stdcall (*PFNGLCOMBINEROUTPUTNVPROC)(unsigned stage, unsigned portion, unsigned abOutput, unsigned cdOutput, unsigned sumOutput, unsigned scale, unsigned bias, System::ByteBool abDotProduct, System::ByteBool cdDotProduct, System::ByteBool muxSum);

typedef void __stdcall (*PFNGLFINALCOMBINERINPUTNVPROC)(unsigned variable, unsigned input, unsigned mapping, unsigned componentUsage);

typedef void __stdcall (*PFNGLGETCOMBINERINPUTPARAMETERFVNVPROC)(unsigned stage, unsigned portion, unsigned variable, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETCOMBINERINPUTPARAMETERIVNVPROC)(unsigned stage, unsigned portion, unsigned variable, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETCOMBINEROUTPUTPARAMETERFVNVPROC)(unsigned stage, unsigned portion, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETCOMBINEROUTPUTPARAMETERIVNVPROC)(unsigned stage, unsigned portion, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETFINALCOMBINERINPUTPARAMETERFVNVPROC)(unsigned variable, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETFINALCOMBINERINPUTPARAMETERIVNVPROC)(unsigned variable, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLRESIZEBUFFERSMESAPROC)(void);

typedef void __stdcall (*PFNGLTBUFFERMASK3DFXPROC)(unsigned mask);

typedef void __stdcall (*PFNGLSAMPLEMASKEXTPROC)(float Value, System::ByteBool invert);

typedef void __stdcall (*PFNGLSAMPLEPATTERNEXTPROC)(unsigned pattern);

typedef void __stdcall (*PFNGLTEXTURECOLORMASKSGISPROC)(System::ByteBool red, System::ByteBool green, System::ByteBool blue, System::ByteBool alpha);

typedef void __stdcall (*PFNGLGENFENCESNVPROC)(int n, PGLuint fences);

typedef void __stdcall (*PFNGLDELETEFENCESNVPROC)(int n, PGLuint fences);

typedef void __stdcall (*PFNGLSETFENCENVPROC)(unsigned fence, unsigned condition);

typedef System::ByteBool __stdcall (*PFNGLTESTFENCENVPROC)(unsigned fence);

typedef void __stdcall (*PFNGLFINISHFENCENVPROC)(unsigned fence);

typedef System::ByteBool __stdcall (*PFNGLISFENCENVPROC)(unsigned fence);

typedef void __stdcall (*PFNGLGETFENCEIVNVPROC)(unsigned fence, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLAREPROGRAMSRESIDENTNVPROC)(int n, PGLuint programs, PGLboolean residences);

typedef void __stdcall (*PFNGLBINDPROGRAMNVPROC)(unsigned target, unsigned id);

typedef void __stdcall (*PFNGLDELETEPROGRAMSNVPROC)(int n, PGLuint programs);

typedef void __stdcall (*PFNGLEXECUTEPROGRAMNVPROC)(unsigned target, unsigned id, System::PSingle params);

typedef void __stdcall (*PFNGLGENPROGRAMSNVPROC)(int n, PGLuint programs);

typedef void __stdcall (*PFNGLGETPROGRAMPARAMETERDVNVPROC)(unsigned target, unsigned index, unsigned pname, System::PDouble params);

typedef void __stdcall (*PFNGLGETPROGRAMPARAMETERFVNVPROC)(unsigned target, unsigned index, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETPROGRAMIVNVPROC)(unsigned id, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETPROGRAMSTRINGNVPROC)(unsigned id, unsigned pname, System::PByte programIdx);

typedef void __stdcall (*PFNGLGETTRACKMATRIXIVNVPROC)(unsigned target, unsigned address, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBDVNVPROC)(unsigned index, unsigned pname, System::PDouble params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBFVNVPROC)(unsigned index, unsigned pname, System::PSingle params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBIVNVPROC)(unsigned index, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBPOINTERVNVPROC)(unsigned index, unsigned pname, PGLPointer pointer);

typedef System::ByteBool __stdcall (*PFNGLISPROGRAMNVPROC)(unsigned id);

typedef void __stdcall (*PFNGLLOADPROGRAMNVPROC)(unsigned target, unsigned id, int len, System::PByte programIdx);

typedef void __stdcall (*PFNGLPROGRAMPARAMETER4DNVPROC)(unsigned target, unsigned index, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLPROGRAMPARAMETER4DVNVPROC)(unsigned target, unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLPROGRAMPARAMETER4FNVPROC)(unsigned target, unsigned index, float x, float y, float z, float w);

typedef void __stdcall (*PFNGLPROGRAMPARAMETER4FVNVPROC)(unsigned target, unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLPROGRAMPARAMETERS4DVNVPROC)(unsigned target, unsigned index, int count, System::PDouble v);

typedef void __stdcall (*PFNGLPROGRAMPARAMETERS4FVNVPROC)(unsigned target, unsigned index, int count, System::PSingle v);

typedef void __stdcall (*PFNGLREQUESTRESIDENTPROGRAMSNVPROC)(int n, PGLuint programs);

typedef void __stdcall (*PFNGLTRACKMATRIXNVPROC)(unsigned target, unsigned address, unsigned matrix, unsigned transform);

typedef void __stdcall (*PFNGLVERTEXATTRIBPOINTERNVPROC)(unsigned index, int fsize, unsigned vertextype, int stride, void * pointer);

typedef void __stdcall (*PFNGLVERTEXATTRIB1DNVPROC)(unsigned index, double x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1DVNVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB1FNVPROC)(unsigned index, float x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1FVNVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB1SNVPROC)(unsigned index, short x);

typedef void __stdcall (*PFNGLVERTEXATTRIB1SVNVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2DNVPROC)(unsigned index, double x, double y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2DVNVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2FNVPROC)(unsigned index, float x, float y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2FVNVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB2SNVPROC)(unsigned index, short x, short y);

typedef void __stdcall (*PFNGLVERTEXATTRIB2SVNVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3DNVPROC)(unsigned index, double x, double y, double z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3DVNVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3FNVPROC)(unsigned index, float x, float y, float z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3FVNVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB3SNVPROC)(unsigned index, short x, short y, short z);

typedef void __stdcall (*PFNGLVERTEXATTRIB3SVNVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4DNVPROC)(unsigned index, double x, double y, double z, double w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4DVNVPROC)(unsigned index, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4FNVPROC)(unsigned index, float x, float y, float z, float w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4FVNVPROC)(unsigned index, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4SNVPROC)(unsigned index, short x, short y, double z, short w);

typedef void __stdcall (*PFNGLVERTEXATTRIB4SVNVPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIB4UBVNVPROC)(unsigned index, System::PByte v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS1DVNVPROC)(unsigned index, int count, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS1FVNVPROC)(unsigned index, int count, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS1SVNVPROC)(unsigned index, int count, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS2DVNVPROC)(unsigned index, int count, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS2FVNVPROC)(unsigned index, int count, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS2SVNVPROC)(unsigned index, int count, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS3DVNVPROC)(unsigned index, int count, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS3FVNVPROC)(unsigned index, int count, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS3SVNVPROC)(unsigned index, int count, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS4DVNVPROC)(unsigned index, int count, System::PDouble v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS4FVNVPROC)(unsigned index, int count, System::PSingle v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS4SVNVPROC)(unsigned index, int count, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIBS4UBVNVPROC)(unsigned index, int count, System::PByte v);

typedef void __stdcall (*PFNGLGENOCCLUSIONQUERIESNVPROC)(int n, PGLuint ids);

typedef void __stdcall (*PFNGLDELETEOCCLUSIONQUERIESNVPROC)(int n, const PGLuint ids);

typedef System::ByteBool __stdcall (*PFNGLISOCCLUSIONQUERYNVPROC)(unsigned id);

typedef void __stdcall (*PFNGLBEGINOCCLUSIONQUERYNVPROC)(unsigned id);

typedef void __stdcall (*PFNGLENDOCCLUSIONQUERYNVPROC)(void);

typedef void __stdcall (*PFNGLGETOCCLUSIONQUERYIVNVPROC)(unsigned id, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETOCCLUSIONQUERYUIVNVPROC)(unsigned id, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLPOINTPARAMETERINVPROC)(unsigned pname, int param);

typedef void __stdcall (*PFNGLPOINTPARAMETERIVNVPROC)(unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLACTIVESTENCILFACEEXTPROC)(unsigned face);

typedef void __stdcall (*PFNGLDRAWBUFFERSATIPROC)(int n, const PGLenum bufs);

typedef void __stdcall (*PFNGLPRIMITIVERESTARTNVPROC)(void);

typedef void __stdcall (*PFNGLPRIMITIVERESTARTINDEXNVPROC)(unsigned index);

typedef void __stdcall (*PFNGLDEPTHBOUNDSEXTPROC)(double zmin, double zmax);

typedef void __stdcall (*PFNGLBLENDEQUATIONSEPARATEEXTPROC)(unsigned modeRGB, unsigned modeAlpha);

typedef System::ByteBool __stdcall (*PFNGLISRENDERBUFFEREXTPROC)(unsigned renderbuffer);

typedef void __stdcall (*PFNGLBINDRENDERBUFFEREXTPROC)(unsigned target, unsigned renderbuffer);

typedef void __stdcall (*PFNGLDELETERENDERBUFFERSEXTPROC)(int n, PGLuint renderbuffers);

typedef void __stdcall (*PFNGLGENRENDERBUFFERSEXTPROC)(int n, PGLuint renderbuffers);

typedef void __stdcall (*PFNGLRENDERBUFFERSTORAGEEXTPROC)(unsigned target, unsigned internalformat, int width, int height);

typedef void __stdcall (*PFNGLGETRENDERBUFFERPARAMETERIVEXTPROC)(unsigned target, unsigned pname, PGLint params);

typedef System::ByteBool __stdcall (*PFNGLISFRAMEBUFFEREXTPROC)(unsigned framebuffer);

typedef void __stdcall (*PFNGLBINDFRAMEBUFFEREXTPROC)(unsigned target, unsigned framebuffer);

typedef void __stdcall (*PFNGLDELETEFRAMEBUFFERSEXTPROC)(int n, PGLuint framebuffers);

typedef void __stdcall (*PFNGLGENFRAMEBUFFERSEXTPROC)(int n, PGLuint framebuffers);

typedef unsigned __stdcall (*PFNGLCHECKFRAMEBUFFERSTATUSEXTPROC)(unsigned target);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURE1DEXTPROC)(unsigned target, unsigned attachment, unsigned textarget, unsigned texture, int level);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURE2DEXTPROC)(unsigned target, unsigned attachment, unsigned textarget, unsigned texture, int level);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURE3DEXTPROC)(unsigned target, unsigned attachment, unsigned textarget, unsigned texture, int level, int zoffset);

typedef void __stdcall (*PFNGLFRAMEBUFFERRENDERBUFFEREXTPROC)(unsigned target, unsigned attachment, unsigned renderbuffertarget, unsigned renderbuffer);

typedef void __stdcall (*PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC)(unsigned target, unsigned attachment, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGENERATEMIPMAPEXTPROC)(unsigned target);

typedef void __stdcall (*PFNGLSTRINGMARKERGREMEDYPROC)(int len, char * str);

typedef void __stdcall (*PFNGLSTENCILCLEARTAGEXTPROC)(int stencilTagBits, unsigned stencilClearTag);

typedef void __stdcall (*PFNGLBLITFRAMEBUFFEREXTPROC)(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, unsigned mask, unsigned filter);

typedef void __stdcall (*PFNGLRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC)(unsigned target, int samples, unsigned internalformat, int width, int height);

typedef void __stdcall (*PFNGLGETQUERYOBJECTI64VEXTPROC)(unsigned id, unsigned pname, PGLint64EXT params);

typedef void __stdcall (*PFNGLGETQUERYOBJECTUI64VEXTPROC)(unsigned id, unsigned pname, PGLuint64EXT params);

typedef void __stdcall (*PFNGLPROGRAMENVPARAMETERS4FVEXTPROC)(unsigned target, unsigned index, int count, const System::PSingle params);

typedef void __stdcall (*PFNGLPROGRAMLOCALPARAMETERS4FVEXTPROC)(unsigned target, unsigned index, int count, const System::PSingle params);

typedef void __stdcall (*PFNGLPROGRAMVERTEXLIMITNVPROC)(unsigned target, int limit);

typedef void __stdcall (*PFNGLPROGRAMPARAMETERIEXTPROC)(unsigned _program, unsigned pname, int value);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTUREEXTPROC)(unsigned target, unsigned attachment, unsigned texture, int level);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTURELAYEREXTPROC)(unsigned target, unsigned attachment, unsigned texture, int level, int layer);

typedef void __stdcall (*PFNGLFRAMEBUFFERTEXTUREFACEEXTPROC)(unsigned target, unsigned attachment, unsigned texture, int level, unsigned face);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1IEXTPROC)(unsigned index, int x);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2IEXTPROC)(unsigned index, int x, int y);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3IEXTPROC)(unsigned index, int x, int y, int z);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4IEXTPROC)(unsigned index, int x, int y, int z, int w);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1UIEXTPROC)(unsigned index, unsigned x);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2UIEXTPROC)(unsigned index, unsigned x, unsigned y);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3UIEXTPROC)(unsigned index, unsigned x, unsigned y, unsigned z);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4UIEXTPROC)(unsigned index, unsigned x, unsigned y, unsigned z, unsigned w);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1IVEXTPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2IVEXTPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3IVEXTPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4IVEXTPROC)(unsigned index, PGLint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI1UIVEXTPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI2UIVEXTPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI3UIVEXTPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4UIVEXTPROC)(unsigned index, PGLuint v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4BVEXTPROC)(unsigned index, PGLbyte v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4SVEXTPROC)(unsigned index, PGLshort v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4UBVEXTPROC)(unsigned index, System::PByte v);

typedef void __stdcall (*PFNGLVERTEXATTRIBI4USVEXTPROC)(unsigned index, System::PWord v);

typedef void __stdcall (*PFNGLVERTEXATTRIBIPOINTEREXTPROC)(unsigned index, int size, unsigned _type, int stride, void * _pointer);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBIIVEXTPROC)(unsigned index, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETVERTEXATTRIBIUIVEXTPROC)(unsigned index, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLUNIFORM1UIEXTPROC)(int location, unsigned v0);

typedef void __stdcall (*PFNGLUNIFORM2UIEXTPROC)(int location, unsigned v0, unsigned v1);

typedef void __stdcall (*PFNGLUNIFORM3UIEXTPROC)(int location, unsigned v0, unsigned v1, unsigned v2);

typedef void __stdcall (*PFNGLUNIFORM4UIEXTPROC)(int location, unsigned v0, unsigned v1, unsigned v2, unsigned v3);

typedef void __stdcall (*PFNGLUNIFORM1UIVEXTPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLUNIFORM2UIVEXTPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLUNIFORM3UIVEXTPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLUNIFORM4UIVEXTPROC)(int location, int count, PGLuint value);

typedef void __stdcall (*PFNGLGETUNIFORMUIVEXTPROC)(unsigned _program, int location, PGLuint params);

typedef void __stdcall (*PFNGLBINDFRAGDATALOCATIONEXTPROC)(unsigned _program, unsigned colorNumber, char * name);

typedef int __stdcall (*PFNGLGETFRAGDATALOCATIONEXTPROC)(unsigned _program, char * name);

typedef void __stdcall (*PFNGLDRAWARRAYSINSTANCEDEXTPROC)(unsigned mode, int first, int count, int primcount);

typedef void __stdcall (*PFNGLDRAWELEMENTSINSTANCEDEXTPROC)(unsigned mode, int count, unsigned _type, void * indices, int primcount);

typedef void __stdcall (*PFNGLTEXBUFFEREXTPROC)(unsigned target, unsigned internalformat, unsigned buffer);

typedef void __stdcall (*PFNGLCOLORMASKINDEXEDEXTPROC)(unsigned buf, System::ByteBool r, System::ByteBool g, System::ByteBool b, System::ByteBool a);

typedef void __stdcall (*PFNGLGETBOOLEANINDEXEDVEXTPROC)(unsigned value, unsigned index, PGLboolean data);

typedef void __stdcall (*PFNGLGETINTEGERINDEXEDVEXTPROC)(unsigned value, unsigned index, PGLint data);

typedef void __stdcall (*PFNGLENABLEINDEXEDEXTPROC)(unsigned target, unsigned index);

typedef void __stdcall (*PFNGLDISABLEINDEXEDEXTPROC)(unsigned target, unsigned index);

typedef System::ByteBool __stdcall (*PFNGLISENABLEDINDEXEDEXTPROC)(unsigned target, unsigned index);

typedef void __stdcall (*PFNGLBINDBUFFERRANGENVPROC)(unsigned target, unsigned index, unsigned buffer, NativeInt offset, NativeInt size);

typedef void __stdcall (*PFNGLBINDBUFFEROFFSETNVPROC)(unsigned target, unsigned index, unsigned buffer, NativeInt offset);

typedef void __stdcall (*PFNGLBINDBUFFERBASENVPROC)(unsigned target, unsigned index, unsigned buffer);

typedef void __stdcall (*PFNGLTRANSFORMFEEDBACKATTRIBSNVPROC)(int count, PGLint attribs, unsigned bufferMode);

typedef void __stdcall (*PFNGLTRANSFORMFEEDBACKVARYINGSNVPROC)(unsigned _program, int count, PGLint locations, unsigned bufferMode);

typedef void __stdcall (*PFNGLBEGINTRANSFORMFEEDBACKNVPROC)(unsigned primitiveMode);

typedef void __stdcall (*PFNGLENDTRANSFORMFEEDBACKNVPROC)(void);

typedef int __stdcall (*PFNGLGETVARYINGLOCATIONNVPROC)(unsigned _program, char * name);

typedef void __stdcall (*PFNGLGETACTIVEVARYINGNVPROC)(unsigned _program, unsigned index, int bufSize, PGLsizei length, PGLsizei size, unsigned _type, char * name);

typedef void __stdcall (*PFNGLACTIVEVARYINGNVPROC)(unsigned _program, char * name);

typedef void __stdcall (*PFNGLGETTRANSFORMFEEDBACKVARYINGNVPROC)(unsigned _program, unsigned index, PGLint location);

typedef void __stdcall (*PFNGLUNIFORMBUFFEREXTPROC)(unsigned _program, int location, unsigned buffer);

typedef int __stdcall (*PFNGLGETUNIFORMBUFFERSIZEEXTPROC)(unsigned _program, int location);

typedef PGLint __stdcall (*PFNGLGETUNIFORMOFFSETEXTPROC)(unsigned _program, int location);

typedef void __stdcall (*PFNGLCLEARCOLORIIEXTPROC)(int r, int g, int b, int a);

typedef void __stdcall (*PFNGLCLEARCOLORIUIEXTPROC)(unsigned r, unsigned g, unsigned b, unsigned a);

typedef void __stdcall (*PFNGLTEXPARAMETERIIVEXTPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLTEXPARAMETERIUIVEXTPROC)(unsigned target, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLGETTEXPARAMETERIIVEXTPROC)(unsigned target, unsigned pname, PGLint params);

typedef void __stdcall (*PFNGLGETTEXPARAMETERIUIVEXTPROC)(unsigned target, unsigned pname, PGLuint params);

typedef void __stdcall (*PFNGLFRAMETERMINATORGREMEDYPROC)(void);

typedef void __stdcall (*PFNGLBEGINCONDITIONALRENDERNVPROC)(unsigned id, unsigned mode);

typedef void __stdcall (*PFNGLENDCONDITIONALRENDERNVPROC)(void);

typedef void __stdcall (*PFNGLBINDBUFFERRANGEEXTPROC)(unsigned target, unsigned index, unsigned buffer, NativeInt offset, NativeInt size);

typedef void __stdcall (*PFNGLBINDBUFFEROFFSETEXTPROC)(unsigned target, unsigned index, unsigned buffer, NativeInt offset);

typedef void __stdcall (*PFNGLBINDBUFFERBASEEXTPROC)(unsigned target, unsigned index, unsigned buffer);

typedef void __stdcall (*PFNGLBEGINTRANSFORMFEEDBACKEXTPROC)(unsigned primitiveMode);

typedef void __stdcall (*PFNGLENDTRANSFORMFEEDBACKEXTPROC)(void);

typedef void __stdcall (*PFNGLTRANSFORMFEEDBACKVARYINGSEXTPROC)(unsigned _program, int count, const PGLPCharArray varyings, unsigned bufferMode);

typedef void __stdcall (*PFNGLGETTRANSFORMFEEDBACKVARYINGEXTPROC)(unsigned _program, unsigned index, int bufSize, PGLsizei length, PGLsizei size, PGLenum _type, char * name);

typedef void __stdcall (*PFNGLTESSELLATIONFACTORAMDPROC)(float factor);

typedef void __stdcall (*PFNGLTESSELLATIONMODEAMDPROC)(unsigned mode);

typedef void __stdcall (*PFNGLCOPYIMAGESUBDATANVPROC)(unsigned srcName, unsigned srcTarget, int srcLevel, int srcX, int srcY, int srcZ, unsigned dstName, unsigned dstTarget, int dstLevel, int dstX, int dstY, int dstZ, int width, int height, int depth);

typedef void __stdcall (*PFNGLMAKEBUFFERRESIDENTNVPROC)(unsigned target, unsigned access);

typedef void __stdcall (*PFNGLMAKEBUFFERNONRESIDENTNVPROC)(unsigned target);

typedef System::ByteBool __stdcall (*PFNGLISBUFFERRESIDENTNVPROC)(unsigned target);

typedef void __stdcall (*PFNGLMAKENAMEDBUFFERRESIDENTNVPROC)(unsigned buffer, unsigned access);

typedef void __stdcall (*PFNGLMAKENAMEDBUFFERNONRESIDENTNVPROC)(unsigned buffer);

typedef System::ByteBool __stdcall (*PFNGLISNAMEDBUFFERRESIDENTNVPROC)(unsigned buffer);

typedef void __stdcall (*PFNGLGETBUFFERPARAMETERUI64VNVPROC)(unsigned target, unsigned pname, PGLuint64EXT params);

typedef void __stdcall (*PFNGLGETNAMEDBUFFERPARAMETERUI64VNVPROC)(unsigned buffer, unsigned pname, PGLuint64EXT params);

typedef void __stdcall (*PFNGLGETINTEGERUI64VNVPROC)(unsigned value, PGLuint64EXT result);

typedef void __stdcall (*PFNGLUNIFORMUI64NVPROC)(int location, unsigned __int64 value);

typedef void __stdcall (*PFNGLUNIFORMUI64VNVPROC)(int location, int count, const PGLuint64EXT value);

typedef void __stdcall (*PFNGLGETUNIFORMUI64VNVPROC)(unsigned _program, int location, PGLuint64EXT params);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMUI64NVPROC)(unsigned _program, int location, unsigned __int64 value);

typedef void __stdcall (*PFNGLPROGRAMUNIFORMUI64VNVPROC)(unsigned _program, int location, int count, const PGLuint64EXT value);

typedef void __stdcall (*PFNGLBUFFERADDRESSRANGENVPROC)(unsigned pname, unsigned index, unsigned __int64 address, NativeInt length);

typedef void __stdcall (*PFNGLVERTEXFORMATNVPROC)(int size, unsigned _type, int stride);

typedef void __stdcall (*PFNGLNORMALFORMATNVPROC)(unsigned _type, int stride);

typedef void __stdcall (*PFNGLCOLORFORMATNVPROC)(int size, unsigned _type, int stride);

typedef void __stdcall (*PFNGLINDEXFORMATNVPROC)(unsigned _type, int stride);

typedef void __stdcall (*PFNGLTEXCOORDFORMATNVPROC)(int size, unsigned _type, int stride);

typedef void __stdcall (*PFNGLEDGEFLAGFORMATNVPROC)(int stride);

typedef void __stdcall (*PFNGLSECONDARYCOLORFORMATNVPROC)(int size, unsigned _type, int stride);

typedef void __stdcall (*PFNGLFOGCOORDFORMATNVPROC)(unsigned _type, int stride);

typedef void __stdcall (*PFNGLVERTEXATTRIBFORMATNVPROC)(unsigned index, int size, unsigned _type, System::ByteBool normalized, int stride);

typedef void __stdcall (*PFNGLVERTEXATTRIBIFORMATNVPROC)(unsigned index, int size, unsigned _type, int stride);

typedef void __stdcall (*PFNGLGETINTEGERUI64I_VNVPROC)(unsigned value, unsigned index, PGLuint64EXT result);

typedef void __stdcall (*PGNGLGETBUFFERPARAMETERUI64VNV)(unsigned value, unsigned index, PGLuint64EXT result);

typedef unsigned __stdcall (*PFNGLGENPATHSNVPROC)(int range);

typedef void __stdcall (*PFNGLDELETEPATHSNVPROC)(unsigned path, int range);

typedef System::ByteBool __stdcall (*PFNGLISPATHNVPROC)(unsigned path);

typedef void __stdcall (*PFNGLPATHCOMMANDSNVPROC)(unsigned path, int numCommands, System::PByte commands, int numCoords, unsigned coordType, void * coords);

typedef void __stdcall (*PFNGLPATHCOORDSNVPROC)(unsigned path, int numCoords, unsigned coordType, void * coords);

typedef void __stdcall (*PFNGLPATHSUBCOMMANDSNVPROC)(unsigned path, int commandStart, int commandsToDelete, int numCommands, System::PByte commands, int numCoords, unsigned coordType, void * coords);

typedef void __stdcall (*PFNGLPATHSUBCOORDSNVPROC)(unsigned path, int coordStart, int numCoords, unsigned coordType, void * coords);

typedef void __stdcall (*PFNGLPATHSTRINGNVPROC)(unsigned path, unsigned format, int length, void * pathString);

typedef void __stdcall (*PFNGLPATHGLYPHSNVPROC)(unsigned firstPathName, unsigned fontTarget, void * fontName, unsigned fontStyle, int numGlyphs, unsigned _type, void * charcodes, unsigned handleMissingGlyphs, unsigned pathParameterTemplate, float emScale);

typedef void __stdcall (*PFNGLPATHGLYPHRANGENVPROC)(unsigned firstPathName, unsigned fontTarget, char * fontName, unsigned fontStyle, unsigned firstGlyph, int numGlyphs, unsigned handleMissingGlyphs, unsigned pathParameterTemplate, float emScale);

typedef void __stdcall (*PFNGLWEIGHTPATHSNVPROC)(unsigned resultPath, int numPaths, PGLuint paths, System::PSingle weights);

typedef void __stdcall (*PFNGLCOPYPATHNVPROC)(unsigned resultPath, unsigned srcPath);

typedef void __stdcall (*PFNGLINTERPOLATEPATHSNVPROC)(unsigned resultPath, unsigned pathA, unsigned pathB, float weight);

typedef void __stdcall (*PFNGLTRANSFORMPATHNVPROC)(unsigned resultPath, unsigned srcPath, unsigned transformType, System::PSingle transformValues);

typedef void __stdcall (*PFNGLPATHPARAMETERIVNVPROC)(unsigned path, unsigned pname, PGLint value);

typedef void __stdcall (*PFNGLPATHPARAMETERINVPROC)(unsigned path, unsigned pname, int value);

typedef void __stdcall (*PFNGLPATHPARAMETERFVNVPROC)(unsigned path, unsigned pname, System::PSingle value);

typedef void __stdcall (*PFNGLPATHPARAMETERFNVPROC)(unsigned path, unsigned pname, float value);

typedef void __stdcall (*PFNGLPATHDASHARRAYNVPROC)(unsigned path, int dashCount, System::PSingle dashArray);

typedef void __stdcall (*PFNGLPATHSTENCILFUNCNVPROC)(unsigned func, int ref, unsigned mask);

typedef void __stdcall (*PFNGLPATHSTENCILDEPTHOFFSETNVPROC)(float factor, float units);

typedef void __stdcall (*PFNGLSTENCILFILLPATHNVPROC)(unsigned path, unsigned fillMode, unsigned mask);

typedef void __stdcall (*PFNGLSTENCILSTROKEPATHNVPROC)(unsigned path, int reference, unsigned mask);

typedef void __stdcall (*PFNGLSTENCILFILLPATHINSTANCEDNVPROC)(int numPaths, unsigned pathNameType, void * paths, unsigned pathBase, unsigned fillMode, unsigned mask, unsigned transformType, System::PSingle transformValues);

typedef void __stdcall (*PFNGLSTENCILSTROKEPATHINSTANCEDNVPROC)(int numPaths, unsigned pathNameType, void * paths, unsigned pathBase, int reference, unsigned mask, unsigned transformType, System::PSingle transformValues);

typedef void __stdcall (*PFNGLPATHCOVERDEPTHFUNCNVPROC)(unsigned func);

typedef void __stdcall (*PFNGLPATHCOLORGENNVPROC)(unsigned color, unsigned genMode, unsigned colorFormat, System::PSingle coeffs);

typedef void __stdcall (*PFNGLPATHTEXGENNVPROC)(unsigned texCoordSet, unsigned genMode, int components, System::PSingle coeffs);

typedef void __stdcall (*PFNGLPATHFOGGENNVPROC)(unsigned genMode);

typedef void __stdcall (*PFNGLCOVERFILLPATHNVPROC)(unsigned path, unsigned coverMode);

typedef void __stdcall (*PFNGLCOVERSTROKEPATHNVPROC)(unsigned path, unsigned coverMode);

typedef void __stdcall (*PFNGLCOVERFILLPATHINSTANCEDNVPROC)(int numPaths, unsigned pathNameType, void * paths, unsigned pathBase, unsigned coverMode, unsigned transformType, System::PSingle transformValues);

typedef void __stdcall (*PFNGLCOVERSTROKEPATHINSTANCEDNVPROC)(int numPaths, unsigned pathNameType, void * paths, unsigned pathBase, unsigned coverMode, unsigned transformType, System::PSingle transformValues);

typedef void __stdcall (*PFNGLGETPATHPARAMETERIVNVPROC)(unsigned path, unsigned pname, PGLint value);

typedef void __stdcall (*PFNGLGETPATHPARAMETERFVNVPROC)(unsigned path, unsigned pname, System::PSingle value);

typedef void __stdcall (*PFNGLGETPATHCOMMANDSNVPROC)(unsigned path, System::PByte commands);

typedef void __stdcall (*PFNGLGETPATHCOORDSNVPROC)(unsigned path, System::PSingle coords);

typedef void __stdcall (*PFNGLGETPATHDASHARRAYNVPROC)(unsigned path, System::PSingle dashArray);

typedef void __stdcall (*PFNGLGETPATHMETRICSNVPROC)(unsigned metricQueryMask, int numPaths, unsigned pathNameType, void * paths, unsigned pathBase, int stride, System::PSingle metrics);

typedef void __stdcall (*PFNGLGETPATHMETRICRANGENVPROC)(unsigned metricQueryMask, unsigned firstPathName, int numPaths, int stride, System::PSingle metrics);

typedef void __stdcall (*PFNGLGETPATHSPACINGNVPROC)(unsigned pathListMode, int numPaths, unsigned pathNameType, void * paths, unsigned pathBase, float advanceScale, float kerningScale, unsigned transformType, System::PSingle returnedSpacing);

typedef void __stdcall (*PFNGLGETPATHCOLORGENIVNVPROC)(unsigned color, unsigned pname, PGLint value);

typedef void __stdcall (*PFNGLGETPATHCOLORGENFVNVPROC)(unsigned color, unsigned pname, System::PSingle value);

typedef void __stdcall (*PFNGLGETPATHTEXGENIVNVPROC)(unsigned texCoordSet, unsigned pname, PGLint value);

typedef void __stdcall (*PFNGLGETPATHTEXGENFVNVPROC)(unsigned texCoordSet, unsigned pname, System::PSingle value);

typedef System::ByteBool __stdcall (*PFNGLISPOINTINFILLPATHNVPROC)(unsigned path, unsigned mask, float x, float y);

typedef System::ByteBool __stdcall (*PFNGLISPOINTINSTROKEPATHNVPROC)(unsigned path, float x, float y);

typedef float __stdcall (*PFNGLGETPATHLENGTHNVPROC)(unsigned path, int startSegment, int numSegments);

typedef System::ByteBool __stdcall (*PFNGLPOINTALONGPATHNVPROC)(unsigned path, int startSegment, int numSegments, float distance, System::PSingle x, System::PSingle y, System::PSingle tangentX, System::PSingle tangentY);

//-- var, const, procedure ---------------------------------------------------
#define opengl32 L"OpenGL32.dll"
#define glu32 L"GLU32.dll"
#define libEGL L"libEGL.dll"
#define libGLES2 L"libGLESv2.dll"
static const System::Word GL_DEPTH_BUFFER_BIT = System::Word(0x100);
static const System::Word GL_STENCIL_BUFFER_BIT = System::Word(0x400);
static const System::Word GL_COLOR_BUFFER_BIT = System::Word(0x4000);
static const System::Int8 GL_FALSE = System::Int8(0x0);
static const System::Int8 GL_TRUE = System::Int8(0x1);
static const System::Int8 GL_POINTS = System::Int8(0x0);
static const System::Int8 GL_LINES = System::Int8(0x1);
static const System::Int8 GL_LINE_LOOP = System::Int8(0x2);
static const System::Int8 GL_LINE_STRIP = System::Int8(0x3);
static const System::Int8 GL_TRIANGLES = System::Int8(0x4);
static const System::Int8 GL_TRIANGLE_STRIP = System::Int8(0x5);
static const System::Int8 GL_TRIANGLE_FAN = System::Int8(0x6);
static const System::Word GL_NEVER = System::Word(0x200);
static const System::Word GL_LESS = System::Word(0x201);
static const System::Word GL_EQUAL = System::Word(0x202);
static const System::Word GL_LEQUAL = System::Word(0x203);
static const System::Word GL_GREATER = System::Word(0x204);
static const System::Word GL_NOTEQUAL = System::Word(0x205);
static const System::Word GL_GEQUAL = System::Word(0x206);
static const System::Word GL_ALWAYS = System::Word(0x207);
static const System::Int8 GL_ZERO = System::Int8(0x0);
static const System::Int8 GL_ONE = System::Int8(0x1);
static const System::Word GL_SRC_COLOR = System::Word(0x300);
static const System::Word GL_ONE_MINUS_SRC_COLOR = System::Word(0x301);
static const System::Word GL_SRC_ALPHA = System::Word(0x302);
static const System::Word GL_ONE_MINUS_SRC_ALPHA = System::Word(0x303);
static const System::Word GL_DST_ALPHA = System::Word(0x304);
static const System::Word GL_ONE_MINUS_DST_ALPHA = System::Word(0x305);
static const System::Word GL_DST_COLOR = System::Word(0x306);
static const System::Word GL_ONE_MINUS_DST_COLOR = System::Word(0x307);
static const System::Word GL_SRC_ALPHA_SATURATE = System::Word(0x308);
static const System::Int8 GL_NONE = System::Int8(0x0);
static const System::Word GL_FRONT_LEFT = System::Word(0x400);
static const System::Word GL_FRONT_RIGHT = System::Word(0x401);
static const System::Word GL_BACK_LEFT = System::Word(0x402);
static const System::Word GL_BACK_RIGHT = System::Word(0x403);
static const System::Word GL_FRONT = System::Word(0x404);
static const System::Word GL_BACK = System::Word(0x405);
static const System::Word GL_LEFT = System::Word(0x406);
static const System::Word GL_RIGHT = System::Word(0x407);
static const System::Word GL_FRONT_AND_BACK = System::Word(0x408);
static const System::Int8 GL_NO_ERROR = System::Int8(0x0);
static const System::Word GL_INVALID_ENUM = System::Word(0x500);
static const System::Word GL_INVALID_VALUE = System::Word(0x501);
static const System::Word GL_INVALID_OPERATION = System::Word(0x502);
static const System::Word GL_OUT_OF_MEMORY = System::Word(0x505);
static const System::Word GL_CW = System::Word(0x900);
static const System::Word GL_CCW = System::Word(0x901);
static const System::Word GL_POINT_SIZE = System::Word(0xb11);
static const System::Word GL_POINT_SIZE_RANGE = System::Word(0xb12);
static const System::Word GL_POINT_SIZE_GRANULARITY = System::Word(0xb13);
static const System::Word GL_LINE_SMOOTH = System::Word(0xb20);
static const System::Word GL_LINE_WIDTH = System::Word(0xb21);
static const System::Word GL_LINE_WIDTH_RANGE = System::Word(0xb22);
static const System::Word GL_LINE_WIDTH_GRANULARITY = System::Word(0xb23);
static const System::Word GL_POLYGON_SMOOTH = System::Word(0xb41);
static const System::Word GL_CULL_FACE = System::Word(0xb44);
static const System::Word GL_CULL_FACE_MODE = System::Word(0xb45);
static const System::Word GL_FRONT_FACE = System::Word(0xb46);
static const System::Word GL_DEPTH_RANGE = System::Word(0xb70);
static const System::Word GL_DEPTH_TEST = System::Word(0xb71);
static const System::Word GL_DEPTH_WRITEMASK = System::Word(0xb72);
static const System::Word GL_DEPTH_CLEAR_VALUE = System::Word(0xb73);
static const System::Word GL_DEPTH_FUNC = System::Word(0xb74);
static const System::Word GL_STENCIL_TEST = System::Word(0xb90);
static const System::Word GL_STENCIL_CLEAR_VALUE = System::Word(0xb91);
static const System::Word GL_STENCIL_FUNC = System::Word(0xb92);
static const System::Word GL_STENCIL_VALUE_MASK = System::Word(0xb93);
static const System::Word GL_STENCIL_FAIL = System::Word(0xb94);
static const System::Word GL_STENCIL_PASS_DEPTH_FAIL = System::Word(0xb95);
static const System::Word GL_STENCIL_PASS_DEPTH_PASS = System::Word(0xb96);
static const System::Word GL_STENCIL_REF = System::Word(0xb97);
static const System::Word GL_STENCIL_WRITEMASK = System::Word(0xb98);
static const System::Word GL_MATRIX_MODE = System::Word(0xba0);
static const System::Word GL_VIEWPORT = System::Word(0xba2);
static const System::Word GL_DITHER = System::Word(0xbd0);
static const System::Word GL_BLEND_DST = System::Word(0xbe0);
static const System::Word GL_BLEND_SRC = System::Word(0xbe1);
static const System::Word GL_BLEND = System::Word(0xbe2);
static const System::Word GL_LOGIC_OP_MODE = System::Word(0xbf0);
static const System::Word GL_COLOR_LOGIC_OP = System::Word(0xbf2);
static const System::Word GL_DRAW_BUFFER = System::Word(0xc01);
static const System::Word GL_READ_BUFFER = System::Word(0xc02);
static const System::Word GL_SCISSOR_BOX = System::Word(0xc10);
static const System::Word GL_SCISSOR_TEST = System::Word(0xc11);
static const System::Word GL_COLOR_CLEAR_VALUE = System::Word(0xc22);
static const System::Word GL_COLOR_WRITEMASK = System::Word(0xc23);
static const System::Word GL_DOUBLEBUFFER = System::Word(0xc32);
static const System::Word GL_STEREO = System::Word(0xc33);
static const System::Word GL_LINE_SMOOTH_HINT = System::Word(0xc52);
static const System::Word GL_POLYGON_SMOOTH_HINT = System::Word(0xc53);
static const System::Word GL_UNPACK_SWAP_BYTES = System::Word(0xcf0);
static const System::Word GL_UNPACK_LSB_FIRST = System::Word(0xcf1);
static const System::Word GL_UNPACK_ROW_LENGTH = System::Word(0xcf2);
static const System::Word GL_UNPACK_SKIP_ROWS = System::Word(0xcf3);
static const System::Word GL_UNPACK_SKIP_PIXELS = System::Word(0xcf4);
static const System::Word GL_UNPACK_ALIGNMENT = System::Word(0xcf5);
static const System::Word GL_PACK_SWAP_BYTES = System::Word(0xd00);
static const System::Word GL_PACK_LSB_FIRST = System::Word(0xd01);
static const System::Word GL_PACK_ROW_LENGTH = System::Word(0xd02);
static const System::Word GL_PACK_SKIP_ROWS = System::Word(0xd03);
static const System::Word GL_PACK_SKIP_PIXELS = System::Word(0xd04);
static const System::Word GL_PACK_ALIGNMENT = System::Word(0xd05);
static const System::Word GL_MAX_TEXTURE_SIZE = System::Word(0xd33);
static const System::Word GL_MAX_VIEWPORT_DIMS = System::Word(0xd3a);
static const System::Word GL_SUBPIXEL_BITS = System::Word(0xd50);
static const System::Word GL_TEXTURE_1D = System::Word(0xde0);
static const System::Word GL_TEXTURE_2D = System::Word(0xde1);
static const System::Word GL_POLYGON_OFFSET_UNITS = System::Word(0x2a00);
static const System::Word GL_POLYGON_OFFSET_POINT = System::Word(0x2a01);
static const System::Word GL_POLYGON_OFFSET_LINE = System::Word(0x2a02);
static const System::Word GL_POLYGON_OFFSET_FILL = System::Word(0x8037);
static const System::Word GL_POLYGON_OFFSET_FACTOR = System::Word(0x8038);
static const System::Word GL_TEXTURE_BINDING_1D = System::Word(0x8068);
static const System::Word GL_TEXTURE_BINDING_2D = System::Word(0x8069);
static const System::Word GL_TEXTURE_WIDTH = System::Word(0x1000);
static const System::Word GL_TEXTURE_HEIGHT = System::Word(0x1001);
static const System::Word GL_TEXTURE_INTERNAL_FORMAT = System::Word(0x1003);
static const System::Word GL_TEXTURE_BORDER_COLOR = System::Word(0x1004);
static const System::Word GL_TEXTURE_BORDER = System::Word(0x1005);
static const System::Word GL_TEXTURE_RED_SIZE = System::Word(0x805c);
static const System::Word GL_TEXTURE_GREEN_SIZE = System::Word(0x805d);
static const System::Word GL_TEXTURE_BLUE_SIZE = System::Word(0x805e);
static const System::Word GL_TEXTURE_ALPHA_SIZE = System::Word(0x805f);
static const System::Word GL_DONT_CARE = System::Word(0x1100);
static const System::Word GL_FASTEST = System::Word(0x1101);
static const System::Word GL_NICEST = System::Word(0x1102);
static const System::Word GL_BYTE = System::Word(0x1400);
static const System::Word GL_UNSIGNED_BYTE = System::Word(0x1401);
static const System::Word GL_SHORT = System::Word(0x1402);
static const System::Word GL_UNSIGNED_SHORT = System::Word(0x1403);
static const System::Word GL_INT = System::Word(0x1404);
static const System::Word GL_UNSIGNED_INT = System::Word(0x1405);
static const System::Word GL_FLOAT = System::Word(0x1406);
static const System::Word GL_DOUBLE = System::Word(0x140a);
static const System::Word GL_CLEAR = System::Word(0x1500);
static const System::Word GL_AND = System::Word(0x1501);
static const System::Word GL_AND_REVERSE = System::Word(0x1502);
static const System::Word GL_COPY = System::Word(0x1503);
static const System::Word GL_AND_INVERTED = System::Word(0x1504);
static const System::Word GL_NOOP = System::Word(0x1505);
static const System::Word GL_XOR = System::Word(0x1506);
static const System::Word GL_OR = System::Word(0x1507);
static const System::Word GL_NOR = System::Word(0x1508);
static const System::Word GL_EQUIV = System::Word(0x1509);
static const System::Word GL_INVERT = System::Word(0x150a);
static const System::Word GL_OR_REVERSE = System::Word(0x150b);
static const System::Word GL_COPY_INVERTED = System::Word(0x150c);
static const System::Word GL_OR_INVERTED = System::Word(0x150d);
static const System::Word GL_NAND = System::Word(0x150e);
static const System::Word GL_SET = System::Word(0x150f);
static const System::Word GL_TEXTURE = System::Word(0x1702);
static const System::Word GL_COLOR = System::Word(0x1800);
static const System::Word GL_DEPTH = System::Word(0x1801);
static const System::Word GL_STENCIL = System::Word(0x1802);
static const System::Word GL_STENCIL_INDEX = System::Word(0x1901);
static const System::Word GL_DEPTH_COMPONENT = System::Word(0x1902);
static const System::Word GL_RED = System::Word(0x1903);
static const System::Word GL_GREEN = System::Word(0x1904);
static const System::Word GL_BLUE = System::Word(0x1905);
static const System::Word GL_ALPHA = System::Word(0x1906);
static const System::Word GL_RGB = System::Word(0x1907);
static const System::Word GL_RGBA = System::Word(0x1908);
static const System::Word GL_POINT = System::Word(0x1b00);
static const System::Word GL_LINE = System::Word(0x1b01);
static const System::Word GL_FILL = System::Word(0x1b02);
static const System::Word GL_KEEP = System::Word(0x1e00);
static const System::Word GL_REPLACE = System::Word(0x1e01);
static const System::Word GL_INCR = System::Word(0x1e02);
static const System::Word GL_DECR = System::Word(0x1e03);
static const System::Word GL_VENDOR = System::Word(0x1f00);
static const System::Word GL_RENDERER = System::Word(0x1f01);
static const System::Word GL_VERSION = System::Word(0x1f02);
static const System::Word GL_EXTENSIONS = System::Word(0x1f03);
static const System::Word GL_NEAREST = System::Word(0x2600);
static const System::Word GL_LINEAR = System::Word(0x2601);
static const System::Word GL_NEAREST_MIPMAP_NEAREST = System::Word(0x2700);
static const System::Word GL_LINEAR_MIPMAP_NEAREST = System::Word(0x2701);
static const System::Word GL_NEAREST_MIPMAP_LINEAR = System::Word(0x2702);
static const System::Word GL_LINEAR_MIPMAP_LINEAR = System::Word(0x2703);
static const System::Word GL_TEXTURE_MAG_FILTER = System::Word(0x2800);
static const System::Word GL_TEXTURE_MIN_FILTER = System::Word(0x2801);
static const System::Word GL_TEXTURE_WRAP_S = System::Word(0x2802);
static const System::Word GL_TEXTURE_WRAP_T = System::Word(0x2803);
static const System::Word GL_PROXY_TEXTURE_1D = System::Word(0x8063);
static const System::Word GL_PROXY_TEXTURE_2D = System::Word(0x8064);
static const System::Word GL_REPEAT = System::Word(0x2901);
static const System::Word GL_R3_G3_B2 = System::Word(0x2a10);
static const System::Word GL_RGB4 = System::Word(0x804f);
static const System::Word GL_RGB5 = System::Word(0x8050);
static const System::Word GL_RGB8 = System::Word(0x8051);
static const System::Word GL_RGB10 = System::Word(0x8052);
static const System::Word GL_RGB12 = System::Word(0x8053);
static const System::Word GL_RGB16 = System::Word(0x8054);
static const System::Word GL_RGBA2 = System::Word(0x8055);
static const System::Word GL_RGBA4 = System::Word(0x8056);
static const System::Word GL_RGB5_A1 = System::Word(0x8057);
static const System::Word GL_RGBA8 = System::Word(0x8058);
static const System::Word GL_RGB10_A2 = System::Word(0x8059);
static const System::Word GL_RGBA12 = System::Word(0x805a);
static const System::Word GL_RGBA16 = System::Word(0x805b);
static const System::Int8 GL_CURRENT_BIT = System::Int8(0x1);
static const System::Int8 GL_POINT_BIT = System::Int8(0x2);
static const System::Int8 GL_LINE_BIT = System::Int8(0x4);
static const System::Int8 GL_POLYGON_BIT = System::Int8(0x8);
static const System::Int8 GL_POLYGON_STIPPLE_BIT = System::Int8(0x10);
static const System::Int8 GL_PIXEL_MODE_BIT = System::Int8(0x20);
static const System::Int8 GL_LIGHTING_BIT = System::Int8(0x40);
static const System::Byte GL_FOG_BIT = System::Byte(0x80);
static const System::Word GL_ACCUM_BUFFER_BIT = System::Word(0x200);
static const System::Word GL_VIEWPORT_BIT = System::Word(0x800);
static const System::Word GL_TRANSFORM_BIT = System::Word(0x1000);
static const System::Word GL_ENABLE_BIT = System::Word(0x2000);
static const System::Word GL_HINT_BIT = System::Word(0x8000);
static const int GL_EVAL_BIT = int(0x10000);
static const int GL_LIST_BIT = int(0x20000);
static const int GL_TEXTURE_BIT = int(0x40000);
static const int GL_SCISSOR_BIT = int(0x80000);
static const unsigned GL_ALL_ATTRIB_BITS = unsigned(0xffffffff);
static const System::Int8 GL_CLIENT_PIXEL_STORE_BIT = System::Int8(0x1);
static const System::Int8 GL_CLIENT_VERTEX_ARRAY_BIT = System::Int8(0x2);
static const unsigned GL_CLIENT_ALL_ATTRIB_BITS = unsigned(0xffffffff);
static const System::Int8 GL_QUADS = System::Int8(0x7);
static const System::Int8 GL_QUAD_STRIP = System::Int8(0x8);
static const System::Int8 GL_POLYGON = System::Int8(0x9);
static const System::Word GL_ACCUM = System::Word(0x100);
static const System::Word GL_LOAD = System::Word(0x101);
static const System::Word GL_RETURN = System::Word(0x102);
static const System::Word GL_MULT = System::Word(0x103);
static const System::Word GL_ADD = System::Word(0x104);
static const System::Word GL_AUX0 = System::Word(0x409);
static const System::Word GL_AUX1 = System::Word(0x40a);
static const System::Word GL_AUX2 = System::Word(0x40b);
static const System::Word GL_AUX3 = System::Word(0x40c);
static const System::Word GL_STACK_OVERFLOW = System::Word(0x503);
static const System::Word GL_STACK_UNDERFLOW = System::Word(0x504);
static const System::Word GL_2D = System::Word(0x600);
static const System::Word GL_3D = System::Word(0x601);
static const System::Word GL_3D_COLOR = System::Word(0x602);
static const System::Word GL_3D_COLOR_TEXTURE = System::Word(0x603);
static const System::Word GL_4D_COLOR_TEXTURE = System::Word(0x604);
static const System::Word GL_PASS_THROUGH_TOKEN = System::Word(0x700);
static const System::Word GL_POINT_TOKEN = System::Word(0x701);
static const System::Word GL_LINE_TOKEN = System::Word(0x702);
static const System::Word GL_POLYGON_TOKEN = System::Word(0x703);
static const System::Word GL_BITMAP_TOKEN = System::Word(0x704);
static const System::Word GL_DRAW_PIXEL_TOKEN = System::Word(0x705);
static const System::Word GL_COPY_PIXEL_TOKEN = System::Word(0x706);
static const System::Word GL_LINE_RESET_TOKEN = System::Word(0x707);
static const System::Word GL_EXP = System::Word(0x800);
static const System::Word GL_EXP2 = System::Word(0x801);
static const System::Word GL_COEFF = System::Word(0xa00);
static const System::Word GL_ORDER = System::Word(0xa01);
static const System::Word GL_DOMAIN = System::Word(0xa02);
static const System::Word GL_CURRENT_COLOR = System::Word(0xb00);
static const System::Word GL_CURRENT_INDEX = System::Word(0xb01);
static const System::Word GL_CURRENT_NORMAL = System::Word(0xb02);
static const System::Word GL_CURRENT_TEXTURE_COORDS = System::Word(0xb03);
static const System::Word GL_CURRENT_RASTER_COLOR = System::Word(0xb04);
static const System::Word GL_CURRENT_RASTER_INDEX = System::Word(0xb05);
static const System::Word GL_CURRENT_RASTER_TEXTURE_COORDS = System::Word(0xb06);
static const System::Word GL_CURRENT_RASTER_POSITION = System::Word(0xb07);
static const System::Word GL_CURRENT_RASTER_POSITION_VALID = System::Word(0xb08);
static const System::Word GL_CURRENT_RASTER_DISTANCE = System::Word(0xb09);
static const System::Word GL_POINT_SMOOTH = System::Word(0xb10);
static const System::Word GL_LINE_STIPPLE = System::Word(0xb24);
static const System::Word GL_LINE_STIPPLE_PATTERN = System::Word(0xb25);
static const System::Word GL_LINE_STIPPLE_REPEAT = System::Word(0xb26);
static const System::Word GL_LIST_MODE = System::Word(0xb30);
static const System::Word GL_MAX_LIST_NESTING = System::Word(0xb31);
static const System::Word GL_LIST_BASE = System::Word(0xb32);
static const System::Word GL_LIST_INDEX = System::Word(0xb33);
static const System::Word GL_POLYGON_MODE = System::Word(0xb40);
static const System::Word GL_POLYGON_STIPPLE = System::Word(0xb42);
static const System::Word GL_EDGE_FLAG = System::Word(0xb43);
static const System::Word GL_LIGHTING = System::Word(0xb50);
static const System::Word GL_LIGHT_MODEL_LOCAL_VIEWER = System::Word(0xb51);
static const System::Word GL_LIGHT_MODEL_TWO_SIDE = System::Word(0xb52);
static const System::Word GL_LIGHT_MODEL_AMBIENT = System::Word(0xb53);
static const System::Word GL_SHADE_MODEL = System::Word(0xb54);
static const System::Word GL_COLOR_MATERIAL_FACE = System::Word(0xb55);
static const System::Word GL_COLOR_MATERIAL_PARAMETER = System::Word(0xb56);
static const System::Word GL_COLOR_MATERIAL = System::Word(0xb57);
static const System::Word GL_FOG = System::Word(0xb60);
static const System::Word GL_FOG_INDEX = System::Word(0xb61);
static const System::Word GL_FOG_DENSITY = System::Word(0xb62);
static const System::Word GL_FOG_START = System::Word(0xb63);
static const System::Word GL_FOG_END = System::Word(0xb64);
static const System::Word GL_FOG_MODE = System::Word(0xb65);
static const System::Word GL_FOG_COLOR = System::Word(0xb66);
static const System::Word GL_ACCUM_CLEAR_VALUE = System::Word(0xb80);
static const System::Word GL_NORMALIZE = System::Word(0xba1);
static const System::Word GL_MODELVIEW_STACK_DEPTH = System::Word(0xba3);
static const System::Word GL_PROJECTION_STACK_DEPTH = System::Word(0xba4);
static const System::Word GL_TEXTURE_STACK_DEPTH = System::Word(0xba5);
static const System::Word GL_MODELVIEW_MATRIX = System::Word(0xba6);
static const System::Word GL_PROJECTION_MATRIX = System::Word(0xba7);
static const System::Word GL_TEXTURE_MATRIX = System::Word(0xba8);
static const System::Word GL_ATTRIB_STACK_DEPTH = System::Word(0xbb0);
static const System::Word GL_CLIENT_ATTRIB_STACK_DEPTH = System::Word(0xbb1);
static const System::Word GL_ALPHA_TEST = System::Word(0xbc0);
static const System::Word GL_ALPHA_TEST_FUNC = System::Word(0xbc1);
static const System::Word GL_ALPHA_TEST_REF = System::Word(0xbc2);
static const System::Word GL_INDEX_LOGIC_OP = System::Word(0xbf1);
static const System::Word GL_LOGIC_OP = System::Word(0xbf1);
static const System::Word GL_AUX_BUFFERS = System::Word(0xc00);
static const System::Word GL_INDEX_CLEAR_VALUE = System::Word(0xc20);
static const System::Word GL_INDEX_WRITEMASK = System::Word(0xc21);
static const System::Word GL_INDEX_MODE = System::Word(0xc30);
static const System::Word GL_RGBA_MODE = System::Word(0xc31);
static const System::Word GL_RENDER_MODE = System::Word(0xc40);
static const System::Word GL_PERSPECTIVE_CORRECTION_HINT = System::Word(0xc50);
static const System::Word GL_POINT_SMOOTH_HINT = System::Word(0xc51);
static const System::Word GL_FOG_HINT = System::Word(0xc54);
static const System::Word GL_TEXTURE_GEN_S = System::Word(0xc60);
static const System::Word GL_TEXTURE_GEN_T = System::Word(0xc61);
static const System::Word GL_TEXTURE_GEN_R = System::Word(0xc62);
static const System::Word GL_TEXTURE_GEN_Q = System::Word(0xc63);
static const System::Word GL_PIXEL_MAP_I_TO_I = System::Word(0xc70);
static const System::Word GL_PIXEL_MAP_S_TO_S = System::Word(0xc71);
static const System::Word GL_PIXEL_MAP_I_TO_R = System::Word(0xc72);
static const System::Word GL_PIXEL_MAP_I_TO_G = System::Word(0xc73);
static const System::Word GL_PIXEL_MAP_I_TO_B = System::Word(0xc74);
static const System::Word GL_PIXEL_MAP_I_TO_A = System::Word(0xc75);
static const System::Word GL_PIXEL_MAP_R_TO_R = System::Word(0xc76);
static const System::Word GL_PIXEL_MAP_G_TO_G = System::Word(0xc77);
static const System::Word GL_PIXEL_MAP_B_TO_B = System::Word(0xc78);
static const System::Word GL_PIXEL_MAP_A_TO_A = System::Word(0xc79);
static const System::Word GL_PIXEL_MAP_I_TO_I_SIZE = System::Word(0xcb0);
static const System::Word GL_PIXEL_MAP_S_TO_S_SIZE = System::Word(0xcb1);
static const System::Word GL_PIXEL_MAP_I_TO_R_SIZE = System::Word(0xcb2);
static const System::Word GL_PIXEL_MAP_I_TO_G_SIZE = System::Word(0xcb3);
static const System::Word GL_PIXEL_MAP_I_TO_B_SIZE = System::Word(0xcb4);
static const System::Word GL_PIXEL_MAP_I_TO_A_SIZE = System::Word(0xcb5);
static const System::Word GL_PIXEL_MAP_R_TO_R_SIZE = System::Word(0xcb6);
static const System::Word GL_PIXEL_MAP_G_TO_G_SIZE = System::Word(0xcb7);
static const System::Word GL_PIXEL_MAP_B_TO_B_SIZE = System::Word(0xcb8);
static const System::Word GL_PIXEL_MAP_A_TO_A_SIZE = System::Word(0xcb9);
static const System::Word GL_MAP_COLOR = System::Word(0xd10);
static const System::Word GL_MAP_STENCIL = System::Word(0xd11);
static const System::Word GL_INDEX_SHIFT = System::Word(0xd12);
static const System::Word GL_INDEX_OFFSET = System::Word(0xd13);
static const System::Word GL_RED_SCALE = System::Word(0xd14);
static const System::Word GL_RED_BIAS = System::Word(0xd15);
static const System::Word GL_ZOOM_X = System::Word(0xd16);
static const System::Word GL_ZOOM_Y = System::Word(0xd17);
static const System::Word GL_GREEN_SCALE = System::Word(0xd18);
static const System::Word GL_GREEN_BIAS = System::Word(0xd19);
static const System::Word GL_BLUE_SCALE = System::Word(0xd1a);
static const System::Word GL_BLUE_BIAS = System::Word(0xd1b);
static const System::Word GL_ALPHA_SCALE = System::Word(0xd1c);
static const System::Word GL_ALPHA_BIAS = System::Word(0xd1d);
static const System::Word GL_DEPTH_SCALE = System::Word(0xd1e);
static const System::Word GL_DEPTH_BIAS = System::Word(0xd1f);
static const System::Word GL_MAX_EVAL_ORDER = System::Word(0xd30);
static const System::Word GL_MAX_LIGHTS = System::Word(0xd31);
static const System::Word GL_MAX_CLIP_PLANES = System::Word(0xd32);
static const System::Word GL_MAX_PIXEL_MAP_TABLE = System::Word(0xd34);
static const System::Word GL_MAX_ATTRIB_STACK_DEPTH = System::Word(0xd35);
static const System::Word GL_MAX_MODELVIEW_STACK_DEPTH = System::Word(0xd36);
static const System::Word GL_MAX_NAME_STACK_DEPTH = System::Word(0xd37);
static const System::Word GL_MAX_PROJECTION_STACK_DEPTH = System::Word(0xd38);
static const System::Word GL_MAX_TEXTURE_STACK_DEPTH = System::Word(0xd39);
static const System::Word GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = System::Word(0xd3b);
static const System::Word GL_INDEX_BITS = System::Word(0xd51);
static const System::Word GL_RED_BITS = System::Word(0xd52);
static const System::Word GL_GREEN_BITS = System::Word(0xd53);
static const System::Word GL_BLUE_BITS = System::Word(0xd54);
static const System::Word GL_ALPHA_BITS = System::Word(0xd55);
static const System::Word GL_DEPTH_BITS = System::Word(0xd56);
static const System::Word GL_STENCIL_BITS = System::Word(0xd57);
static const System::Word GL_ACCUM_RED_BITS = System::Word(0xd58);
static const System::Word GL_ACCUM_GREEN_BITS = System::Word(0xd59);
static const System::Word GL_ACCUM_BLUE_BITS = System::Word(0xd5a);
static const System::Word GL_ACCUM_ALPHA_BITS = System::Word(0xd5b);
static const System::Word GL_NAME_STACK_DEPTH = System::Word(0xd70);
static const System::Word GL_AUTO_NORMAL = System::Word(0xd80);
static const System::Word GL_MAP1_COLOR_4 = System::Word(0xd90);
static const System::Word GL_MAP1_INDEX = System::Word(0xd91);
static const System::Word GL_MAP1_NORMAL = System::Word(0xd92);
static const System::Word GL_MAP1_TEXTURE_COORD_1 = System::Word(0xd93);
static const System::Word GL_MAP1_TEXTURE_COORD_2 = System::Word(0xd94);
static const System::Word GL_MAP1_TEXTURE_COORD_3 = System::Word(0xd95);
static const System::Word GL_MAP1_TEXTURE_COORD_4 = System::Word(0xd96);
static const System::Word GL_MAP1_VERTEX_3 = System::Word(0xd97);
static const System::Word GL_MAP1_VERTEX_4 = System::Word(0xd98);
static const System::Word GL_MAP2_COLOR_4 = System::Word(0xdb0);
static const System::Word GL_MAP2_INDEX = System::Word(0xdb1);
static const System::Word GL_MAP2_NORMAL = System::Word(0xdb2);
static const System::Word GL_MAP2_TEXTURE_COORD_1 = System::Word(0xdb3);
static const System::Word GL_MAP2_TEXTURE_COORD_2 = System::Word(0xdb4);
static const System::Word GL_MAP2_TEXTURE_COORD_3 = System::Word(0xdb5);
static const System::Word GL_MAP2_TEXTURE_COORD_4 = System::Word(0xdb6);
static const System::Word GL_MAP2_VERTEX_3 = System::Word(0xdb7);
static const System::Word GL_MAP2_VERTEX_4 = System::Word(0xdb8);
static const System::Word GL_MAP1_GRID_DOMAIN = System::Word(0xdd0);
static const System::Word GL_MAP1_GRID_SEGMENTS = System::Word(0xdd1);
static const System::Word GL_MAP2_GRID_DOMAIN = System::Word(0xdd2);
static const System::Word GL_MAP2_GRID_SEGMENTS = System::Word(0xdd3);
static const System::Word GL_FEEDBACK_BUFFER_POINTER = System::Word(0xdf0);
static const System::Word GL_FEEDBACK_BUFFER_SIZE = System::Word(0xdf1);
static const System::Word GL_FEEDBACK_BUFFER_TYPE = System::Word(0xdf2);
static const System::Word GL_SELECTION_BUFFER_POINTER = System::Word(0xdf3);
static const System::Word GL_SELECTION_BUFFER_SIZE = System::Word(0xdf4);
static const System::Word GL_TEXTURE_COMPONENTS = System::Word(0x1003);
static const System::Word GL_TEXTURE_LUMINANCE_SIZE = System::Word(0x8060);
static const System::Word GL_TEXTURE_INTENSITY_SIZE = System::Word(0x8061);
static const System::Word GL_TEXTURE_PRIORITY = System::Word(0x8066);
static const System::Word GL_TEXTURE_RESIDENT = System::Word(0x8067);
static const System::Word GL_AMBIENT = System::Word(0x1200);
static const System::Word GL_DIFFUSE = System::Word(0x1201);
static const System::Word GL_SPECULAR = System::Word(0x1202);
static const System::Word GL_POSITION = System::Word(0x1203);
static const System::Word GL_SPOT_DIRECTION = System::Word(0x1204);
static const System::Word GL_SPOT_EXPONENT = System::Word(0x1205);
static const System::Word GL_SPOT_CUTOFF = System::Word(0x1206);
static const System::Word GL_CONSTANT_ATTENUATION = System::Word(0x1207);
static const System::Word GL_LINEAR_ATTENUATION = System::Word(0x1208);
static const System::Word GL_QUADRATIC_ATTENUATION = System::Word(0x1209);
static const System::Word GL_COMPILE = System::Word(0x1300);
static const System::Word GL_COMPILE_AND_EXECUTE = System::Word(0x1301);
static const System::Word GL_2_BYTES = System::Word(0x1407);
static const System::Word GL_3_BYTES = System::Word(0x1408);
static const System::Word GL_4_BYTES = System::Word(0x1409);
static const System::Word GL_DOUBLE_EXT = System::Word(0x140a);
static const System::Word GL_EMISSION = System::Word(0x1600);
static const System::Word GL_SHININESS = System::Word(0x1601);
static const System::Word GL_AMBIENT_AND_DIFFUSE = System::Word(0x1602);
static const System::Word GL_COLOR_INDEXES = System::Word(0x1603);
static const System::Word GL_MODELVIEW = System::Word(0x1700);
static const System::Word GL_PROJECTION = System::Word(0x1701);
static const System::Word GL_COLOR_INDEX = System::Word(0x1900);
static const System::Word GL_LUMINANCE = System::Word(0x1909);
static const System::Word GL_LUMINANCE_ALPHA = System::Word(0x190a);
static const System::Word GL_BITMAP = System::Word(0x1a00);
static const System::Word GL_RENDER = System::Word(0x1c00);
static const System::Word GL_FEEDBACK = System::Word(0x1c01);
static const System::Word GL_SELECT = System::Word(0x1c02);
static const System::Word GL_FLAT = System::Word(0x1d00);
static const System::Word GL_SMOOTH = System::Word(0x1d01);
static const System::Word GL_S = System::Word(0x2000);
static const System::Word GL_T = System::Word(0x2001);
static const System::Word GL_R = System::Word(0x2002);
static const System::Word GL_Q = System::Word(0x2003);
static const System::Word GL_MODULATE = System::Word(0x2100);
static const System::Word GL_DECAL = System::Word(0x2101);
static const System::Word GL_TEXTURE_ENV_MODE = System::Word(0x2200);
static const System::Word GL_TEXTURE_ENV_COLOR = System::Word(0x2201);
static const System::Word GL_TEXTURE_ENV = System::Word(0x2300);
static const System::Word GL_EYE_LINEAR = System::Word(0x2400);
static const System::Word GL_OBJECT_LINEAR = System::Word(0x2401);
static const System::Word GL_SPHERE_MAP = System::Word(0x2402);
static const System::Word GL_TEXTURE_GEN_MODE = System::Word(0x2500);
static const System::Word GL_OBJECT_PLANE = System::Word(0x2501);
static const System::Word GL_EYE_PLANE = System::Word(0x2502);
static const System::Word GL_CLAMP = System::Word(0x2900);
static const System::Word GL_ALPHA4 = System::Word(0x803b);
static const System::Word GL_ALPHA8 = System::Word(0x803c);
static const System::Word GL_ALPHA12 = System::Word(0x803d);
static const System::Word GL_ALPHA16 = System::Word(0x803e);
static const System::Word GL_LUMINANCE4 = System::Word(0x803f);
static const System::Word GL_LUMINANCE8 = System::Word(0x8040);
static const System::Word GL_LUMINANCE12 = System::Word(0x8041);
static const System::Word GL_LUMINANCE16 = System::Word(0x8042);
static const System::Word GL_LUMINANCE4_ALPHA4 = System::Word(0x8043);
static const System::Word GL_LUMINANCE6_ALPHA2 = System::Word(0x8044);
static const System::Word GL_LUMINANCE8_ALPHA8 = System::Word(0x8045);
static const System::Word GL_LUMINANCE12_ALPHA4 = System::Word(0x8046);
static const System::Word GL_LUMINANCE12_ALPHA12 = System::Word(0x8047);
static const System::Word GL_LUMINANCE16_ALPHA16 = System::Word(0x8048);
static const System::Word GL_INTENSITY = System::Word(0x8049);
static const System::Word GL_INTENSITY4 = System::Word(0x804a);
static const System::Word GL_INTENSITY8 = System::Word(0x804b);
static const System::Word GL_INTENSITY12 = System::Word(0x804c);
static const System::Word GL_INTENSITY16 = System::Word(0x804d);
static const System::Word GL_VERTEX_ARRAY = System::Word(0x8074);
static const System::Word GL_NORMAL_ARRAY = System::Word(0x8075);
static const System::Word GL_COLOR_ARRAY = System::Word(0x8076);
static const System::Word GL_INDEX_ARRAY = System::Word(0x8077);
static const System::Word GL_TEXTURE_COORD_ARRAY = System::Word(0x8078);
static const System::Word GL_EDGE_FLAG_ARRAY = System::Word(0x8079);
static const System::Word GL_VERTEX_ARRAY_SIZE = System::Word(0x807a);
static const System::Word GL_VERTEX_ARRAY_TYPE = System::Word(0x807b);
static const System::Word GL_VERTEX_ARRAY_STRIDE = System::Word(0x807c);
static const System::Word GL_NORMAL_ARRAY_TYPE = System::Word(0x807e);
static const System::Word GL_NORMAL_ARRAY_STRIDE = System::Word(0x807f);
static const System::Word GL_COLOR_ARRAY_SIZE = System::Word(0x8081);
static const System::Word GL_COLOR_ARRAY_TYPE = System::Word(0x8082);
static const System::Word GL_COLOR_ARRAY_STRIDE = System::Word(0x8083);
static const System::Word GL_INDEX_ARRAY_TYPE = System::Word(0x8085);
static const System::Word GL_INDEX_ARRAY_STRIDE = System::Word(0x8086);
static const System::Word GL_TEXTURE_COORD_ARRAY_SIZE = System::Word(0x8088);
static const System::Word GL_TEXTURE_COORD_ARRAY_TYPE = System::Word(0x8089);
static const System::Word GL_TEXTURE_COORD_ARRAY_STRIDE = System::Word(0x808a);
static const System::Word GL_EDGE_FLAG_ARRAY_STRIDE = System::Word(0x808c);
static const System::Word GL_VERTEX_ARRAY_POINTER = System::Word(0x808e);
static const System::Word GL_NORMAL_ARRAY_POINTER = System::Word(0x808f);
static const System::Word GL_COLOR_ARRAY_POINTER = System::Word(0x8090);
static const System::Word GL_INDEX_ARRAY_POINTER = System::Word(0x8091);
static const System::Word GL_TEXTURE_COORD_ARRAY_POINTER = System::Word(0x8092);
static const System::Word GL_EDGE_FLAG_ARRAY_POINTER = System::Word(0x8093);
static const System::Word GL_V2F = System::Word(0x2a20);
static const System::Word GL_V3F = System::Word(0x2a21);
static const System::Word GL_C4UB_V2F = System::Word(0x2a22);
static const System::Word GL_C4UB_V3F = System::Word(0x2a23);
static const System::Word GL_C3F_V3F = System::Word(0x2a24);
static const System::Word GL_N3F_V3F = System::Word(0x2a25);
static const System::Word GL_C4F_N3F_V3F = System::Word(0x2a26);
static const System::Word GL_T2F_V3F = System::Word(0x2a27);
static const System::Word GL_T4F_V4F = System::Word(0x2a28);
static const System::Word GL_T2F_C4UB_V3F = System::Word(0x2a29);
static const System::Word GL_T2F_C3F_V3F = System::Word(0x2a2a);
static const System::Word GL_T2F_N3F_V3F = System::Word(0x2a2b);
static const System::Word GL_T2F_C4F_N3F_V3F = System::Word(0x2a2c);
static const System::Word GL_T4F_C4F_N3F_V4F = System::Word(0x2a2d);
static const System::Word GL_CLIP_PLANE0 = System::Word(0x3000);
static const System::Word GL_CLIP_PLANE1 = System::Word(0x3001);
static const System::Word GL_CLIP_PLANE2 = System::Word(0x3002);
static const System::Word GL_CLIP_PLANE3 = System::Word(0x3003);
static const System::Word GL_CLIP_PLANE4 = System::Word(0x3004);
static const System::Word GL_CLIP_PLANE5 = System::Word(0x3005);
static const System::Word GL_LIGHT0 = System::Word(0x4000);
static const System::Word GL_LIGHT1 = System::Word(0x4001);
static const System::Word GL_LIGHT2 = System::Word(0x4002);
static const System::Word GL_LIGHT3 = System::Word(0x4003);
static const System::Word GL_LIGHT4 = System::Word(0x4004);
static const System::Word GL_LIGHT5 = System::Word(0x4005);
static const System::Word GL_LIGHT6 = System::Word(0x4006);
static const System::Word GL_LIGHT7 = System::Word(0x4007);
static const System::Word GL_UNSIGNED_BYTE_3_3_2 = System::Word(0x8032);
static const System::Word GL_UNSIGNED_SHORT_4_4_4_4 = System::Word(0x8033);
static const System::Word GL_UNSIGNED_SHORT_5_5_5_1 = System::Word(0x8034);
static const System::Word GL_UNSIGNED_INT_8_8_8_8 = System::Word(0x8035);
static const System::Word GL_UNSIGNED_INT_10_10_10_2 = System::Word(0x8036);
static const System::Word GL_PACK_SKIP_IMAGES = System::Word(0x806b);
static const System::Word GL_PACK_IMAGE_HEIGHT = System::Word(0x806c);
static const System::Word GL_UNPACK_SKIP_IMAGES = System::Word(0x806d);
static const System::Word GL_UNPACK_IMAGE_HEIGHT = System::Word(0x806e);
static const System::Word GL_TEXTURE_3D = System::Word(0x806f);
static const System::Word GL_TEXTURE_BINDING_3D = System::Word(0x806a);
static const System::Word GL_PROXY_TEXTURE_3D = System::Word(0x8070);
static const System::Word GL_TEXTURE_DEPTH = System::Word(0x8071);
static const System::Word GL_TEXTURE_WRAP_R = System::Word(0x8072);
static const System::Word GL_MAX_3D_TEXTURE_SIZE = System::Word(0x8073);
static const System::Word GL_UNSIGNED_BYTE_2_3_3_REV = System::Word(0x8362);
static const System::Word GL_UNSIGNED_SHORT_5_6_5 = System::Word(0x8363);
static const System::Word GL_UNSIGNED_SHORT_5_6_5_REV = System::Word(0x8364);
static const System::Word GL_UNSIGNED_SHORT_4_4_4_4_REV = System::Word(0x8365);
static const System::Word GL_UNSIGNED_SHORT_1_5_5_5_REV = System::Word(0x8366);
static const System::Word GL_UNSIGNED_INT_8_8_8_8_REV = System::Word(0x8367);
static const System::Word GL_UNSIGNED_INT_2_10_10_10_REV = System::Word(0x8368);
static const System::Word GL_BGR = System::Word(0x80e0);
static const System::Word GL_BGRA = System::Word(0x80e1);
static const System::Word GL_MAX_ELEMENTS_VERTICES = System::Word(0x80e8);
static const System::Word GL_MAX_ELEMENTS_INDICES = System::Word(0x80e9);
static const System::Word GL_CLAMP_TO_EDGE = System::Word(0x812f);
static const System::Word GL_TEXTURE_MIN_LOD = System::Word(0x813a);
static const System::Word GL_TEXTURE_MAX_LOD = System::Word(0x813b);
static const System::Word GL_TEXTURE_BASE_LEVEL = System::Word(0x813c);
static const System::Word GL_TEXTURE_MAX_LEVEL = System::Word(0x813d);
static const System::Word GL_SMOOTH_POINT_SIZE_RANGE = System::Word(0xb12);
static const System::Word GL_SMOOTH_POINT_SIZE_GRANULARITY = System::Word(0xb13);
static const System::Word GL_SMOOTH_LINE_WIDTH_RANGE = System::Word(0xb22);
static const System::Word GL_SMOOTH_LINE_WIDTH_GRANULARITY = System::Word(0xb23);
static const System::Word GL_ALIASED_LINE_WIDTH_RANGE = System::Word(0x846e);
static const System::Word GL_CONSTANT_COLOR = System::Word(0x8001);
static const System::Word GL_ONE_MINUS_CONSTANT_COLOR = System::Word(0x8002);
static const System::Word GL_CONSTANT_ALPHA = System::Word(0x8003);
static const System::Word GL_ONE_MINUS_CONSTANT_ALPHA = System::Word(0x8004);
static const System::Word GL_BLEND_COLOR = System::Word(0x8005);
static const System::Word GL_FUNC_ADD = System::Word(0x8006);
static const System::Word GL_MIN = System::Word(0x8007);
static const System::Word GL_MAX = System::Word(0x8008);
static const System::Word GL_BLEND_EQUATION = System::Word(0x8009);
static const System::Word GL_FUNC_SUBTRACT = System::Word(0x800a);
static const System::Word GL_FUNC_REVERSE_SUBTRACT = System::Word(0x800b);
static const System::Word GL_RESCALE_NORMAL = System::Word(0x803a);
static const System::Word GL_LIGHT_MODEL_COLOR_CONTROL = System::Word(0x81f8);
static const System::Word GL_SINGLE_COLOR = System::Word(0x81f9);
static const System::Word GL_SEPARATE_SPECULAR_COLOR = System::Word(0x81fa);
static const System::Word GL_ALIASED_POINT_SIZE_RANGE = System::Word(0x846d);
static const System::Word GL_CONVOLUTION_1D = System::Word(0x8010);
static const System::Word GL_CONVOLUTION_2D = System::Word(0x8011);
static const System::Word GL_SEPARABLE_2D = System::Word(0x8012);
static const System::Word GL_CONVOLUTION_BORDER_MODE = System::Word(0x8013);
static const System::Word GL_CONVOLUTION_FILTER_SCALE = System::Word(0x8014);
static const System::Word GL_CONVOLUTION_FILTER_BIAS = System::Word(0x8015);
static const System::Word GL_REDUCE = System::Word(0x8016);
static const System::Word GL_CONVOLUTION_FORMAT = System::Word(0x8017);
static const System::Word GL_CONVOLUTION_WIDTH = System::Word(0x8018);
static const System::Word GL_CONVOLUTION_HEIGHT = System::Word(0x8019);
static const System::Word GL_MAX_CONVOLUTION_WIDTH = System::Word(0x801a);
static const System::Word GL_MAX_CONVOLUTION_HEIGHT = System::Word(0x801b);
static const System::Word GL_POST_CONVOLUTION_RED_SCALE = System::Word(0x801c);
static const System::Word GL_POST_CONVOLUTION_GREEN_SCALE = System::Word(0x801d);
static const System::Word GL_POST_CONVOLUTION_BLUE_SCALE = System::Word(0x801e);
static const System::Word GL_POST_CONVOLUTION_ALPHA_SCALE = System::Word(0x801f);
static const System::Word GL_POST_CONVOLUTION_RED_BIAS = System::Word(0x8020);
static const System::Word GL_POST_CONVOLUTION_GREEN_BIAS = System::Word(0x8021);
static const System::Word GL_POST_CONVOLUTION_BLUE_BIAS = System::Word(0x8022);
static const System::Word GL_POST_CONVOLUTION_ALPHA_BIAS = System::Word(0x8023);
static const System::Word GL_HISTOGRAM = System::Word(0x8024);
static const System::Word GL_PROXY_HISTOGRAM = System::Word(0x8025);
static const System::Word GL_HISTOGRAM_WIDTH = System::Word(0x8026);
static const System::Word GL_HISTOGRAM_FORMAT = System::Word(0x8027);
static const System::Word GL_HISTOGRAM_RED_SIZE = System::Word(0x8028);
static const System::Word GL_HISTOGRAM_GREEN_SIZE = System::Word(0x8029);
static const System::Word GL_HISTOGRAM_BLUE_SIZE = System::Word(0x802a);
static const System::Word GL_HISTOGRAM_ALPHA_SIZE = System::Word(0x802b);
static const System::Word GL_HISTOGRAM_LUMINANCE_SIZE = System::Word(0x802c);
static const System::Word GL_HISTOGRAM_SINK = System::Word(0x802d);
static const System::Word GL_MINMAX = System::Word(0x802e);
static const System::Word GL_MINMAX_FORMAT = System::Word(0x802f);
static const System::Word GL_MINMAX_SINK = System::Word(0x8030);
static const System::Word GL_TABLE_TOO_LARGE = System::Word(0x8031);
static const System::Word GL_COLOR_MATRIX = System::Word(0x80b1);
static const System::Word GL_COLOR_MATRIX_STACK_DEPTH = System::Word(0x80b2);
static const System::Word GL_MAX_COLOR_MATRIX_STACK_DEPTH = System::Word(0x80b3);
static const System::Word GL_POST_COLOR_MATRIX_RED_SCALE = System::Word(0x80b4);
static const System::Word GL_POST_COLOR_MATRIX_GREEN_SCALE = System::Word(0x80b5);
static const System::Word GL_POST_COLOR_MATRIX_BLUE_SCALE = System::Word(0x80b6);
static const System::Word GL_POST_COLOR_MATRIX_ALPHA_SCALE = System::Word(0x80b7);
static const System::Word GL_POST_COLOR_MATRIX_RED_BIAS = System::Word(0x80b8);
static const System::Word GL_POST_COLOR_MATRIX_GREEN_BIAS = System::Word(0x80b9);
static const System::Word GL_POST_COLOR_MATRIX_BLUE_BIAS = System::Word(0x80ba);
static const System::Word GL_POST_COLOR_MATRIX_ALPHA_BIAS = System::Word(0x80bb);
static const System::Word GL_COLOR_TABLE = System::Word(0x80d0);
static const System::Word GL_POST_CONVOLUTION_COLOR_TABLE = System::Word(0x80d1);
static const System::Word GL_POST_COLOR_MATRIX_COLOR_TABLE = System::Word(0x80d2);
static const System::Word GL_PROXY_COLOR_TABLE = System::Word(0x80d3);
static const System::Word GL_PROXY_POST_CONVOLUTION_COLOR_TABLE = System::Word(0x80d4);
static const System::Word GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE = System::Word(0x80d5);
static const System::Word GL_COLOR_TABLE_SCALE = System::Word(0x80d6);
static const System::Word GL_COLOR_TABLE_BIAS = System::Word(0x80d7);
static const System::Word GL_COLOR_TABLE_FORMAT = System::Word(0x80d8);
static const System::Word GL_COLOR_TABLE_WIDTH = System::Word(0x80d9);
static const System::Word GL_COLOR_TABLE_RED_SIZE = System::Word(0x80da);
static const System::Word GL_COLOR_TABLE_GREEN_SIZE = System::Word(0x80db);
static const System::Word GL_COLOR_TABLE_BLUE_SIZE = System::Word(0x80dc);
static const System::Word GL_COLOR_TABLE_ALPHA_SIZE = System::Word(0x80dd);
static const System::Word GL_COLOR_TABLE_LUMINANCE_SIZE = System::Word(0x80de);
static const System::Word GL_COLOR_TABLE_INTENSITY_SIZE = System::Word(0x80df);
static const System::Word GL_CONSTANT_BORDER = System::Word(0x8151);
static const System::Word GL_REPLICATE_BORDER = System::Word(0x8153);
static const System::Word GL_CONVOLUTION_BORDER_COLOR = System::Word(0x8154);
static const System::Word GL_TEXTURE0 = System::Word(0x84c0);
static const System::Word GL_TEXTURE1 = System::Word(0x84c1);
static const System::Word GL_TEXTURE2 = System::Word(0x84c2);
static const System::Word GL_TEXTURE3 = System::Word(0x84c3);
static const System::Word GL_TEXTURE4 = System::Word(0x84c4);
static const System::Word GL_TEXTURE5 = System::Word(0x84c5);
static const System::Word GL_TEXTURE6 = System::Word(0x84c6);
static const System::Word GL_TEXTURE7 = System::Word(0x84c7);
static const System::Word GL_TEXTURE8 = System::Word(0x84c8);
static const System::Word GL_TEXTURE9 = System::Word(0x84c9);
static const System::Word GL_TEXTURE10 = System::Word(0x84ca);
static const System::Word GL_TEXTURE11 = System::Word(0x84cb);
static const System::Word GL_TEXTURE12 = System::Word(0x84cc);
static const System::Word GL_TEXTURE13 = System::Word(0x84cd);
static const System::Word GL_TEXTURE14 = System::Word(0x84ce);
static const System::Word GL_TEXTURE15 = System::Word(0x84cf);
static const System::Word GL_TEXTURE16 = System::Word(0x84d0);
static const System::Word GL_TEXTURE17 = System::Word(0x84d1);
static const System::Word GL_TEXTURE18 = System::Word(0x84d2);
static const System::Word GL_TEXTURE19 = System::Word(0x84d3);
static const System::Word GL_TEXTURE20 = System::Word(0x84d4);
static const System::Word GL_TEXTURE21 = System::Word(0x84d5);
static const System::Word GL_TEXTURE22 = System::Word(0x84d6);
static const System::Word GL_TEXTURE23 = System::Word(0x84d7);
static const System::Word GL_TEXTURE24 = System::Word(0x84d8);
static const System::Word GL_TEXTURE25 = System::Word(0x84d9);
static const System::Word GL_TEXTURE26 = System::Word(0x84da);
static const System::Word GL_TEXTURE27 = System::Word(0x84db);
static const System::Word GL_TEXTURE28 = System::Word(0x84dc);
static const System::Word GL_TEXTURE29 = System::Word(0x84dd);
static const System::Word GL_TEXTURE30 = System::Word(0x84de);
static const System::Word GL_TEXTURE31 = System::Word(0x84df);
static const System::Word GL_ACTIVE_TEXTURE = System::Word(0x84e0);
static const System::Word GL_MULTISAMPLE = System::Word(0x809d);
static const System::Word GL_SAMPLE_ALPHA_TO_COVERAGE = System::Word(0x809e);
static const System::Word GL_SAMPLE_ALPHA_TO_ONE = System::Word(0x809f);
static const System::Word GL_SAMPLE_COVERAGE = System::Word(0x80a0);
static const System::Word GL_SAMPLE_BUFFERS = System::Word(0x80a8);
static const System::Word GL_SAMPLES = System::Word(0x80a9);
static const System::Word GL_SAMPLE_COVERAGE_VALUE = System::Word(0x80aa);
static const System::Word GL_SAMPLE_COVERAGE_INVERT = System::Word(0x80ab);
static const System::Word GL_TEXTURE_CUBE_MAP = System::Word(0x8513);
static const System::Word GL_TEXTURE_BINDING_CUBE_MAP = System::Word(0x8514);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_X = System::Word(0x8515);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_X = System::Word(0x8516);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_Y = System::Word(0x8517);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = System::Word(0x8518);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_Z = System::Word(0x8519);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = System::Word(0x851a);
static const System::Word GL_PROXY_TEXTURE_CUBE_MAP = System::Word(0x851b);
static const System::Word GL_MAX_CUBE_MAP_TEXTURE_SIZE = System::Word(0x851c);
static const System::Word GL_COMPRESSED_RGB = System::Word(0x84ed);
static const System::Word GL_COMPRESSED_RGBA = System::Word(0x84ee);
static const System::Word GL_TEXTURE_COMPRESSION_HINT = System::Word(0x84ef);
static const System::Word GL_TEXTURE_COMPRESSED_IMAGE_SIZE = System::Word(0x86a0);
static const System::Word GL_TEXTURE_COMPRESSED = System::Word(0x86a1);
static const System::Word GL_NUM_COMPRESSED_TEXTURE_FORMATS = System::Word(0x86a2);
static const System::Word GL_COMPRESSED_TEXTURE_FORMATS = System::Word(0x86a3);
static const System::Word GL_CLAMP_TO_BORDER = System::Word(0x812d);
static const System::Word GL_CLIENT_ACTIVE_TEXTURE = System::Word(0x84e1);
static const System::Word GL_MAX_TEXTURE_UNITS = System::Word(0x84e2);
static const System::Word GL_TRANSPOSE_MODELVIEW_MATRIX = System::Word(0x84e3);
static const System::Word GL_TRANSPOSE_PROJECTION_MATRIX = System::Word(0x84e4);
static const System::Word GL_TRANSPOSE_TEXTURE_MATRIX = System::Word(0x84e5);
static const System::Word GL_TRANSPOSE_COLOR_MATRIX = System::Word(0x84e6);
static const int GL_MULTISAMPLE_BIT = int(0x20000000);
static const System::Word GL_NORMAL_MAP = System::Word(0x8511);
static const System::Word GL_REFLECTION_MAP = System::Word(0x8512);
static const System::Word GL_COMPRESSED_ALPHA = System::Word(0x84e9);
static const System::Word GL_COMPRESSED_LUMINANCE = System::Word(0x84ea);
static const System::Word GL_COMPRESSED_LUMINANCE_ALPHA = System::Word(0x84eb);
static const System::Word GL_COMPRESSED_INTENSITY = System::Word(0x84ec);
static const System::Word GL_COMBINE = System::Word(0x8570);
static const System::Word GL_COMBINE_RGB = System::Word(0x8571);
static const System::Word GL_COMBINE_ALPHA = System::Word(0x8572);
static const System::Word GL_SOURCE0_RGB = System::Word(0x8580);
static const System::Word GL_SOURCE1_RGB = System::Word(0x8581);
static const System::Word GL_SOURCE2_RGB = System::Word(0x8582);
static const System::Word GL_SOURCE0_ALPHA = System::Word(0x8588);
static const System::Word GL_SOURCE1_ALPHA = System::Word(0x8589);
static const System::Word GL_SOURCE2_ALPHA = System::Word(0x858a);
static const System::Word GL_OPERAND0_RGB = System::Word(0x8590);
static const System::Word GL_OPERAND1_RGB = System::Word(0x8591);
static const System::Word GL_OPERAND2_RGB = System::Word(0x8592);
static const System::Word GL_OPERAND0_ALPHA = System::Word(0x8598);
static const System::Word GL_OPERAND1_ALPHA = System::Word(0x8599);
static const System::Word GL_OPERAND2_ALPHA = System::Word(0x859a);
static const System::Word GL_RGB_SCALE = System::Word(0x8573);
static const System::Word GL_ADD_SIGNED = System::Word(0x8574);
static const System::Word GL_INTERPOLATE = System::Word(0x8575);
static const System::Word GL_SUBTRACT = System::Word(0x84e7);
static const System::Word GL_CONSTANT = System::Word(0x8576);
static const System::Word GL_PRIMARY_COLOR = System::Word(0x8577);
static const System::Word GL_PREVIOUS = System::Word(0x8578);
static const System::Word GL_DOT3_RGB = System::Word(0x86ae);
static const System::Word GL_DOT3_RGBA = System::Word(0x86af);
static const System::Word GL_BLEND_DST_RGB = System::Word(0x80c8);
static const System::Word GL_BLEND_SRC_RGB = System::Word(0x80c9);
static const System::Word GL_BLEND_DST_ALPHA = System::Word(0x80ca);
static const System::Word GL_BLEND_SRC_ALPHA = System::Word(0x80cb);
static const System::Word GL_POINT_FADE_THRESHOLD_SIZE = System::Word(0x8128);
static const System::Word GL_DEPTH_COMPONENT16 = System::Word(0x81a5);
static const System::Word GL_DEPTH_COMPONENT24 = System::Word(0x81a6);
static const System::Word GL_DEPTH_COMPONENT32 = System::Word(0x81a7);
static const System::Word GL_MIRRORED_REPEAT = System::Word(0x8370);
static const System::Word GL_MAX_TEXTURE_LOD_BIAS = System::Word(0x84fd);
static const System::Word GL_TEXTURE_LOD_BIAS = System::Word(0x8501);
static const System::Word GL_INCR_WRAP = System::Word(0x8507);
static const System::Word GL_DECR_WRAP = System::Word(0x8508);
static const System::Word GL_TEXTURE_DEPTH_SIZE = System::Word(0x884a);
static const System::Word GL_TEXTURE_COMPARE_MODE = System::Word(0x884c);
static const System::Word GL_TEXTURE_COMPARE_FUNC = System::Word(0x884d);
static const System::Word GL_POINT_SIZE_MIN = System::Word(0x8126);
static const System::Word GL_POINT_SIZE_MAX = System::Word(0x8127);
static const System::Word GL_POINT_DISTANCE_ATTENUATION = System::Word(0x8129);
static const System::Word GL_GENERATE_MIPMAP = System::Word(0x8191);
static const System::Word GL_GENERATE_MIPMAP_HINT = System::Word(0x8192);
static const System::Word GL_FOG_COORDINATE_SOURCE = System::Word(0x8450);
static const System::Word GL_FOG_COORDINATE = System::Word(0x8451);
static const System::Word GL_FRAGMENT_DEPTH = System::Word(0x8452);
static const System::Word GL_CURRENT_FOG_COORDINATE = System::Word(0x8453);
static const System::Word GL_FOG_COORDINATE_ARRAY_TYPE = System::Word(0x8454);
static const System::Word GL_FOG_COORDINATE_ARRAY_STRIDE = System::Word(0x8455);
static const System::Word GL_FOG_COORDINATE_ARRAY_POINTER = System::Word(0x8456);
static const System::Word GL_FOG_COORDINATE_ARRAY = System::Word(0x8457);
static const System::Word GL_COLOR_SUM = System::Word(0x8458);
static const System::Word GL_CURRENT_SECONDARY_COLOR = System::Word(0x8459);
static const System::Word GL_SECONDARY_COLOR_ARRAY_SIZE = System::Word(0x845a);
static const System::Word GL_SECONDARY_COLOR_ARRAY_TYPE = System::Word(0x845b);
static const System::Word GL_SECONDARY_COLOR_ARRAY_STRIDE = System::Word(0x845c);
static const System::Word GL_SECONDARY_COLOR_ARRAY_POINTER = System::Word(0x845d);
static const System::Word GL_SECONDARY_COLOR_ARRAY = System::Word(0x845e);
static const System::Word GL_TEXTURE_FILTER_CONTROL = System::Word(0x8500);
static const System::Word GL_DEPTH_TEXTURE_MODE = System::Word(0x884b);
static const System::Word GL_COMPARE_R_TO_TEXTURE = System::Word(0x884e);
static const System::Word GL_BUFFER_SIZE = System::Word(0x8764);
static const System::Word GL_BUFFER_USAGE = System::Word(0x8765);
static const System::Word GL_QUERY_COUNTER_BITS = System::Word(0x8864);
static const System::Word GL_CURRENT_QUERY = System::Word(0x8865);
static const System::Word GL_QUERY_RESULT = System::Word(0x8866);
static const System::Word GL_QUERY_RESULT_AVAILABLE = System::Word(0x8867);
static const System::Word GL_ARRAY_BUFFER = System::Word(0x8892);
static const System::Word GL_ELEMENT_ARRAY_BUFFER = System::Word(0x8893);
static const System::Word GL_ARRAY_BUFFER_BINDING = System::Word(0x8894);
static const System::Word GL_ELEMENT_ARRAY_BUFFER_BINDING = System::Word(0x8895);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = System::Word(0x889f);
static const System::Word GL_READ_ONLY = System::Word(0x88b8);
static const System::Word GL_WRITE_ONLY = System::Word(0x88b9);
static const System::Word GL_READ_WRITE = System::Word(0x88ba);
static const System::Word GL_BUFFER_ACCESS = System::Word(0x88bb);
static const System::Word GL_BUFFER_MAPPED = System::Word(0x88bc);
static const System::Word GL_BUFFER_MAP_POINTER = System::Word(0x88bd);
static const System::Word GL_STREAM_DRAW = System::Word(0x88e0);
static const System::Word GL_STREAM_READ = System::Word(0x88e1);
static const System::Word GL_STREAM_COPY = System::Word(0x88e2);
static const System::Word GL_STATIC_DRAW = System::Word(0x88e4);
static const System::Word GL_STATIC_READ = System::Word(0x88e5);
static const System::Word GL_STATIC_COPY = System::Word(0x88e6);
static const System::Word GL_DYNAMIC_DRAW = System::Word(0x88e8);
static const System::Word GL_DYNAMIC_READ = System::Word(0x88e9);
static const System::Word GL_DYNAMIC_COPY = System::Word(0x88ea);
static const System::Word GL_SAMPLES_PASSED = System::Word(0x8914);
static const System::Word GL_SRC1_ALPHA = System::Word(0x8589);
static const System::Word GL_VERTEX_ARRAY_BUFFER_BINDING = System::Word(0x8896);
static const System::Word GL_NORMAL_ARRAY_BUFFER_BINDING = System::Word(0x8897);
static const System::Word GL_COLOR_ARRAY_BUFFER_BINDING = System::Word(0x8898);
static const System::Word GL_INDEX_ARRAY_BUFFER_BINDING = System::Word(0x8899);
static const System::Word GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = System::Word(0x889a);
static const System::Word GL_EDGE_FLAG_ARRAY_BUFFER_BINDING = System::Word(0x889b);
static const System::Word GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING = System::Word(0x889c);
static const System::Word GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING = System::Word(0x889d);
static const System::Word GL_WEIGHT_ARRAY_BUFFER_BINDING = System::Word(0x889e);
static const System::Word GL_FOG_COORD_SRC = System::Word(0x8450);
static const System::Word GL_FOG_COORD = System::Word(0x8451);
static const System::Word GL_CURRENT_FOG_COORD = System::Word(0x8453);
static const System::Word GL_FOG_COORD_ARRAY_TYPE = System::Word(0x8454);
static const System::Word GL_FOG_COORD_ARRAY_STRIDE = System::Word(0x8455);
static const System::Word GL_FOG_COORD_ARRAY_POINTER = System::Word(0x8456);
static const System::Word GL_FOG_COORD_ARRAY = System::Word(0x8457);
static const System::Word GL_FOG_COORD_ARRAY_BUFFER_BINDING = System::Word(0x889d);
static const System::Word GL_SRC0_RGB = System::Word(0x8580);
static const System::Word GL_SRC1_RGB = System::Word(0x8581);
static const System::Word GL_SRC2_RGB = System::Word(0x8582);
static const System::Word GL_SRC0_ALPHA = System::Word(0x8588);
static const System::Word GL_SRC2_ALPHA = System::Word(0x858a);
static const System::Word GL_BLEND_EQUATION_RGB = System::Word(0x8009);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_ENABLED = System::Word(0x8622);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_SIZE = System::Word(0x8623);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_STRIDE = System::Word(0x8624);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_TYPE = System::Word(0x8625);
static const System::Word GL_CURRENT_VERTEX_ATTRIB = System::Word(0x8626);
static const System::Word GL_VERTEX_PROGRAM_POINT_SIZE = System::Word(0x8642);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_POINTER = System::Word(0x8645);
static const System::Word GL_STENCIL_BACK_FUNC = System::Word(0x8800);
static const System::Word GL_STENCIL_BACK_FAIL = System::Word(0x8801);
static const System::Word GL_STENCIL_BACK_PASS_DEPTH_FAIL = System::Word(0x8802);
static const System::Word GL_STENCIL_BACK_PASS_DEPTH_PASS = System::Word(0x8803);
static const System::Word GL_MAX_DRAW_BUFFERS = System::Word(0x8824);
static const System::Word GL_DRAW_BUFFER0 = System::Word(0x8825);
static const System::Word GL_DRAW_BUFFER1 = System::Word(0x8826);
static const System::Word GL_DRAW_BUFFER2 = System::Word(0x8827);
static const System::Word GL_DRAW_BUFFER3 = System::Word(0x8828);
static const System::Word GL_DRAW_BUFFER4 = System::Word(0x8829);
static const System::Word GL_DRAW_BUFFER5 = System::Word(0x882a);
static const System::Word GL_DRAW_BUFFER6 = System::Word(0x882b);
static const System::Word GL_DRAW_BUFFER7 = System::Word(0x882c);
static const System::Word GL_DRAW_BUFFER8 = System::Word(0x882d);
static const System::Word GL_DRAW_BUFFER9 = System::Word(0x882e);
static const System::Word GL_DRAW_BUFFER10 = System::Word(0x882f);
static const System::Word GL_DRAW_BUFFER11 = System::Word(0x8830);
static const System::Word GL_DRAW_BUFFER12 = System::Word(0x8831);
static const System::Word GL_DRAW_BUFFER13 = System::Word(0x8832);
static const System::Word GL_DRAW_BUFFER14 = System::Word(0x8833);
static const System::Word GL_DRAW_BUFFER15 = System::Word(0x8834);
static const System::Word GL_BLEND_EQUATION_ALPHA = System::Word(0x883d);
static const System::Word GL_MAX_VERTEX_ATTRIBS = System::Word(0x8869);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = System::Word(0x886a);
static const System::Word GL_MAX_TEXTURE_IMAGE_UNITS = System::Word(0x8872);
static const System::Word GL_FRAGMENT_SHADER = System::Word(0x8b30);
static const System::Word GL_VERTEX_SHADER = System::Word(0x8b31);
static const System::Word GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = System::Word(0x8b49);
static const System::Word GL_MAX_VERTEX_UNIFORM_COMPONENTS = System::Word(0x8b4a);
static const System::Word GL_MAX_VARYING_FLOATS = System::Word(0x8b4b);
static const System::Word GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = System::Word(0x8b4c);
static const System::Word GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = System::Word(0x8b4d);
static const System::Word GL_SHADER_TYPE = System::Word(0x8b4f);
static const System::Word GL_FLOAT_VEC2 = System::Word(0x8b50);
static const System::Word GL_FLOAT_VEC3 = System::Word(0x8b51);
static const System::Word GL_FLOAT_VEC4 = System::Word(0x8b52);
static const System::Word GL_INT_VEC2 = System::Word(0x8b53);
static const System::Word GL_INT_VEC3 = System::Word(0x8b54);
static const System::Word GL_INT_VEC4 = System::Word(0x8b55);
static const System::Word GL_BOOL = System::Word(0x8b56);
static const System::Word GL_BOOL_VEC2 = System::Word(0x8b57);
static const System::Word GL_BOOL_VEC3 = System::Word(0x8b58);
static const System::Word GL_BOOL_VEC4 = System::Word(0x8b59);
static const System::Word GL_FLOAT_MAT2 = System::Word(0x8b5a);
static const System::Word GL_FLOAT_MAT3 = System::Word(0x8b5b);
static const System::Word GL_FLOAT_MAT4 = System::Word(0x8b5c);
static const System::Word GL_SAMPLER_1D = System::Word(0x8b5d);
static const System::Word GL_SAMPLER_2D = System::Word(0x8b5e);
static const System::Word GL_SAMPLER_3D = System::Word(0x8b5f);
static const System::Word GL_SAMPLER_CUBE = System::Word(0x8b60);
static const System::Word GL_SAMPLER_1D_SHADOW = System::Word(0x8b61);
static const System::Word GL_SAMPLER_2D_SHADOW = System::Word(0x8b62);
static const System::Word GL_DELETE_STATUS = System::Word(0x8b80);
static const System::Word GL_COMPILE_STATUS = System::Word(0x8b81);
static const System::Word GL_LINK_STATUS = System::Word(0x8b82);
static const System::Word GL_VALIDATE_STATUS = System::Word(0x8b83);
static const System::Word GL_INFO_LOG_LENGTH = System::Word(0x8b84);
static const System::Word GL_ATTACHED_SHADERS = System::Word(0x8b85);
static const System::Word GL_ACTIVE_UNIFORMS = System::Word(0x8b86);
static const System::Word GL_ACTIVE_UNIFORM_MAX_LENGTH = System::Word(0x8b87);
static const System::Word GL_SHADER_SOURCE_LENGTH = System::Word(0x8b88);
static const System::Word GL_ACTIVE_ATTRIBUTES = System::Word(0x8b89);
static const System::Word GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = System::Word(0x8b8a);
static const System::Word GL_FRAGMENT_SHADER_DERIVATIVE_HINT = System::Word(0x8b8b);
static const System::Word GL_SHADING_LANGUAGE_VERSION = System::Word(0x8b8c);
static const System::Word GL_CURRENT_PROGRAM = System::Word(0x8b8d);
static const System::Word GL_POINT_SPRITE_COORD_ORIGIN = System::Word(0x8ca0);
static const System::Word GL_LOWER_LEFT = System::Word(0x8ca1);
static const System::Word GL_UPPER_LEFT = System::Word(0x8ca2);
static const System::Word GL_STENCIL_BACK_REF = System::Word(0x8ca3);
static const System::Word GL_STENCIL_BACK_VALUE_MASK = System::Word(0x8ca4);
static const System::Word GL_STENCIL_BACK_WRITEMASK = System::Word(0x8ca5);
static const System::Word GL_VERTEX_PROGRAM_TWO_SIDE = System::Word(0x8643);
static const System::Word GL_POINT_SPRITE = System::Word(0x8861);
static const System::Word GL_COORD_REPLACE = System::Word(0x8862);
static const System::Word GL_MAX_TEXTURE_COORDS = System::Word(0x8871);
static const System::Word GL_PIXEL_PACK_BUFFER = System::Word(0x88eb);
static const System::Word GL_PIXEL_UNPACK_BUFFER = System::Word(0x88ec);
static const System::Word GL_PIXEL_PACK_BUFFER_BINDING = System::Word(0x88ed);
static const System::Word GL_PIXEL_UNPACK_BUFFER_BINDING = System::Word(0x88ef);
static const System::Word GL_FLOAT_MAT2x3 = System::Word(0x8b65);
static const System::Word GL_FLOAT_MAT2x4 = System::Word(0x8b66);
static const System::Word GL_FLOAT_MAT3x2 = System::Word(0x8b67);
static const System::Word GL_FLOAT_MAT3x4 = System::Word(0x8b68);
static const System::Word GL_FLOAT_MAT4x2 = System::Word(0x8b69);
static const System::Word GL_FLOAT_MAT4x3 = System::Word(0x8b6a);
static const System::Word GL_SRGB = System::Word(0x8c40);
static const System::Word GL_SRGB8 = System::Word(0x8c41);
static const System::Word GL_SRGB_ALPHA = System::Word(0x8c42);
static const System::Word GL_SRGB8_ALPHA8 = System::Word(0x8c43);
static const System::Word GL_COMPRESSED_SRGB = System::Word(0x8c48);
static const System::Word GL_COMPRESSED_SRGB_ALPHA = System::Word(0x8c49);
static const System::Word GL_CURRENT_RASTER_SECONDARY_COLOR = System::Word(0x845f);
static const System::Word GL_SLUMINANCE_ALPHA = System::Word(0x8c44);
static const System::Word GL_SLUMINANCE8_ALPHA8 = System::Word(0x8c45);
static const System::Word GL_SLUMINANCE = System::Word(0x8c46);
static const System::Word GL_SLUMINANCE8 = System::Word(0x8c47);
static const System::Word GL_COMPRESSED_SLUMINANCE = System::Word(0x8c4a);
static const System::Word GL_COMPRESSED_SLUMINANCE_ALPHA = System::Word(0x8c4b);
static const System::Word GL_COMPARE_REF_TO_TEXTURE = System::Word(0x884e);
static const System::Word GL_CLIP_DISTANCE0 = System::Word(0x3000);
static const System::Word GL_CLIP_DISTANCE1 = System::Word(0x3001);
static const System::Word GL_CLIP_DISTANCE2 = System::Word(0x3002);
static const System::Word GL_CLIP_DISTANCE3 = System::Word(0x3003);
static const System::Word GL_CLIP_DISTANCE4 = System::Word(0x3004);
static const System::Word GL_CLIP_DISTANCE5 = System::Word(0x3005);
static const System::Word GL_CLIP_DISTANCE6 = System::Word(0x3006);
static const System::Word GL_CLIP_DISTANCE7 = System::Word(0x3007);
static const System::Word GL_MAX_CLIP_DISTANCES = System::Word(0xd32);
static const System::Word GL_MAJOR_VERSION = System::Word(0x821b);
static const System::Word GL_MINOR_VERSION = System::Word(0x821c);
static const System::Word GL_NUM_EXTENSIONS = System::Word(0x821d);
static const System::Word GL_CONTEXT_FLAGS = System::Word(0x821e);
static const System::Word GL_DEPTH_BUFFER = System::Word(0x8223);
static const System::Word GL_STENCIL_BUFFER = System::Word(0x8224);
static const System::Word GL_COMPRESSED_RED = System::Word(0x8225);
static const System::Word GL_COMPRESSED_RG = System::Word(0x8226);
static const System::Int8 GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = System::Int8(0x1);
static const System::Word GL_RGBA32F = System::Word(0x8814);
static const System::Word GL_RGB32F = System::Word(0x8815);
static const System::Word GL_RGBA16F = System::Word(0x881a);
static const System::Word GL_RGB16F = System::Word(0x881b);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_INTEGER = System::Word(0x88fd);
static const System::Word GL_MAX_ARRAY_TEXTURE_LAYERS = System::Word(0x88ff);
static const System::Word GL_MIN_PROGRAM_TEXEL_OFFSET = System::Word(0x8904);
static const System::Word GL_MAX_PROGRAM_TEXEL_OFFSET = System::Word(0x8905);
static const System::Word GL_CLAMP_VERTEX_COLOR = System::Word(0x891a);
static const System::Word GL_CLAMP_FRAGMENT_COLOR = System::Word(0x891b);
static const System::Word GL_CLAMP_READ_COLOR = System::Word(0x891c);
static const System::Word GL_FIXED_ONLY = System::Word(0x891d);
static const System::Word GL_MAX_VARYING_COMPONENTS = System::Word(0x8b4b);
static const System::Word GL_TEXTURE_1D_ARRAY = System::Word(0x8c18);
static const System::Word GL_PROXY_TEXTURE_1D_ARRAY = System::Word(0x8c19);
static const System::Word GL_TEXTURE_2D_ARRAY = System::Word(0x8c1a);
static const System::Word GL_PROXY_TEXTURE_2D_ARRAY = System::Word(0x8c1b);
static const System::Word GL_TEXTURE_BINDING_1D_ARRAY = System::Word(0x8c1c);
static const System::Word GL_TEXTURE_BINDING_2D_ARRAY = System::Word(0x8c1d);
static const System::Word GL_R11F_G11F_B10F = System::Word(0x8c3a);
static const System::Word GL_UNSIGNED_INT_10F_11F_11F_REV = System::Word(0x8c3b);
static const System::Word GL_RGB9_E5 = System::Word(0x8c3d);
static const System::Word GL_UNSIGNED_INT_5_9_9_9_REV = System::Word(0x8c3e);
static const System::Word GL_TEXTURE_SHARED_SIZE = System::Word(0x8c3f);
static const System::Word GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = System::Word(0x8c76);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_MODE = System::Word(0x8c7f);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = System::Word(0x8c80);
static const System::Word GL_TRANSFORM_FEEDBACK_VARYINGS = System::Word(0x8c83);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_START = System::Word(0x8c84);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = System::Word(0x8c85);
static const System::Word GL_PRIMITIVES_GENERATED = System::Word(0x8c87);
static const System::Word GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = System::Word(0x8c88);
static const System::Word GL_RASTERIZER_DISCARD = System::Word(0x8c89);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = System::Word(0x8c8a);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = System::Word(0x8c8b);
static const System::Word GL_INTERLEAVED_ATTRIBS = System::Word(0x8c8c);
static const System::Word GL_SEPARATE_ATTRIBS = System::Word(0x8c8d);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER = System::Word(0x8c8e);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = System::Word(0x8c8f);
static const System::Word GL_RGBA32UI = System::Word(0x8d70);
static const System::Word GL_RGB32UI = System::Word(0x8d71);
static const System::Word GL_RGBA16UI = System::Word(0x8d76);
static const System::Word GL_RGB16UI = System::Word(0x8d77);
static const System::Word GL_RGBA8UI = System::Word(0x8d7c);
static const System::Word GL_RGB8UI = System::Word(0x8d7d);
static const System::Word GL_RGBA32I = System::Word(0x8d82);
static const System::Word GL_RGB32I = System::Word(0x8d83);
static const System::Word GL_RGBA16I = System::Word(0x8d88);
static const System::Word GL_RGB16I = System::Word(0x8d89);
static const System::Word GL_RGBA8I = System::Word(0x8d8e);
static const System::Word GL_RGB8I = System::Word(0x8d8f);
static const System::Word GL_RED_INTEGER = System::Word(0x8d94);
static const System::Word GL_GREEN_INTEGER = System::Word(0x8d95);
static const System::Word GL_BLUE_INTEGER = System::Word(0x8d96);
static const System::Word GL_ALPHA_INTEGER = System::Word(0x8d97);
static const System::Word GL_RGB_INTEGER = System::Word(0x8d98);
static const System::Word GL_RGBA_INTEGER = System::Word(0x8d99);
static const System::Word GL_BGR_INTEGER = System::Word(0x8d9a);
static const System::Word GL_BGRA_INTEGER = System::Word(0x8d9b);
static const System::Word GL_SAMPLER_1D_ARRAY = System::Word(0x8dc0);
static const System::Word GL_SAMPLER_2D_ARRAY = System::Word(0x8dc1);
static const System::Word GL_SAMPLER_1D_ARRAY_SHADOW = System::Word(0x8dc3);
static const System::Word GL_SAMPLER_2D_ARRAY_SHADOW = System::Word(0x8dc4);
static const System::Word GL_SAMPLER_CUBE_SHADOW = System::Word(0x8dc5);
static const System::Word GL_UNSIGNED_INT_VEC2 = System::Word(0x8dc6);
static const System::Word GL_UNSIGNED_INT_VEC3 = System::Word(0x8dc7);
static const System::Word GL_UNSIGNED_INT_VEC4 = System::Word(0x8dc8);
static const System::Word GL_INT_SAMPLER_1D = System::Word(0x8dc9);
static const System::Word GL_INT_SAMPLER_2D = System::Word(0x8dca);
static const System::Word GL_INT_SAMPLER_3D = System::Word(0x8dcb);
static const System::Word GL_INT_SAMPLER_CUBE = System::Word(0x8dcc);
static const System::Word GL_INT_SAMPLER_1D_ARRAY = System::Word(0x8dce);
static const System::Word GL_INT_SAMPLER_2D_ARRAY = System::Word(0x8dcf);
static const System::Word GL_UNSIGNED_INT_SAMPLER_1D = System::Word(0x8dd1);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D = System::Word(0x8dd2);
static const System::Word GL_UNSIGNED_INT_SAMPLER_3D = System::Word(0x8dd3);
static const System::Word GL_UNSIGNED_INT_SAMPLER_CUBE = System::Word(0x8dd4);
static const System::Word GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = System::Word(0x8dd6);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = System::Word(0x8dd7);
static const System::Word GL_QUERY_WAIT = System::Word(0x8e13);
static const System::Word GL_QUERY_NO_WAIT = System::Word(0x8e14);
static const System::Word GL_QUERY_BY_REGION_WAIT = System::Word(0x8e15);
static const System::Word GL_QUERY_BY_REGION_NO_WAIT = System::Word(0x8e16);
static const System::Word GL_BUFFER_ACCESS_FLAGS = System::Word(0x911f);
static const System::Word GL_BUFFER_MAP_LENGTH = System::Word(0x9120);
static const System::Word GL_BUFFER_MAP_OFFSET = System::Word(0x9121);
static const System::Word GL_SAMPLER_2D_RECT = System::Word(0x8b63);
static const System::Word GL_SAMPLER_2D_RECT_SHADOW = System::Word(0x8b64);
static const System::Word GL_SAMPLER_BUFFER = System::Word(0x8dc2);
static const System::Word GL_INT_SAMPLER_2D_RECT = System::Word(0x8dcd);
static const System::Word GL_INT_SAMPLER_BUFFER = System::Word(0x8dd0);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D_RECT = System::Word(0x8dd5);
static const System::Word GL_UNSIGNED_INT_SAMPLER_BUFFER = System::Word(0x8dd8);
static const System::Word GL_TEXTURE_BUFFER = System::Word(0x8c2a);
static const System::Word GL_MAX_TEXTURE_BUFFER_SIZE = System::Word(0x8c2b);
static const System::Word GL_TEXTURE_BINDING_BUFFER = System::Word(0x8c2c);
static const System::Word GL_TEXTURE_BUFFER_DATA_STORE_BINDING = System::Word(0x8c2d);
static const System::Word GL_TEXTURE_BUFFER_FORMAT = System::Word(0x8c2e);
static const System::Word GL_TEXTURE_RECTANGLE = System::Word(0x84f5);
static const System::Word GL_TEXTURE_BINDING_RECTANGLE = System::Word(0x84f6);
static const System::Word GL_PROXY_TEXTURE_RECTANGLE = System::Word(0x84f7);
static const System::Word GL_MAX_RECTANGLE_TEXTURE_SIZE = System::Word(0x84f8);
static const System::Word GL_RED_SNORM = System::Word(0x8f90);
static const System::Word GL_RG_SNORM = System::Word(0x8f91);
static const System::Word GL_RGB_SNORM = System::Word(0x8f92);
static const System::Word GL_RGBA_SNORM = System::Word(0x8f93);
static const System::Word GL_R8_SNORM = System::Word(0x8f94);
static const System::Word GL_RG8_SNORM = System::Word(0x8f95);
static const System::Word GL_RGB8_SNORM = System::Word(0x8f96);
static const System::Word GL_RGBA8_SNORM = System::Word(0x8f97);
static const System::Word GL_R16_SNORM = System::Word(0x8f98);
static const System::Word GL_RG16_SNORM = System::Word(0x8f99);
static const System::Word GL_RGB16_SNORM = System::Word(0x8f9a);
static const System::Word GL_RGBA16_SNORM = System::Word(0x8f9b);
static const System::Word GL_SIGNED_NORMALIZED = System::Word(0x8f9c);
static const System::Word GL_PRIMITIVE_RESTART = System::Word(0x8f9d);
static const System::Word GL_PRIMITIVE_RESTART_INDEX = System::Word(0x8f9e);
static const System::Word GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = System::Word(0x8e8c);
static const System::Word GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = System::Word(0x8e8d);
static const System::Word GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = System::Word(0x8e8e);
static const System::Word GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = System::Word(0x8e8f);
static const System::Int8 GL_CONTEXT_CORE_PROFILE_BIT = System::Int8(0x1);
static const System::Int8 GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = System::Int8(0x2);
static const System::Int8 GL_LINES_ADJACENCY = System::Int8(0xa);
static const System::Int8 GL_LINE_STRIP_ADJACENCY = System::Int8(0xb);
static const System::Int8 GL_TRIANGLES_ADJACENCY = System::Int8(0xc);
static const System::Int8 GL_TRIANGLE_STRIP_ADJACENCY = System::Int8(0xd);
static const System::Word GL_PROGRAM_POINT_SIZE = System::Word(0x8642);
static const System::Word GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = System::Word(0x8c29);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_LAYERED = System::Word(0x8da7);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = System::Word(0x8da8);
static const System::Word GL_GEOMETRY_SHADER = System::Word(0x8dd9);
static const System::Word GL_GEOMETRY_VERTICES_OUT = System::Word(0x8916);
static const System::Word GL_GEOMETRY_INPUT_TYPE = System::Word(0x8917);
static const System::Word GL_GEOMETRY_OUTPUT_TYPE = System::Word(0x8918);
static const System::Word GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = System::Word(0x8ddf);
static const System::Word GL_MAX_GEOMETRY_OUTPUT_VERTICES = System::Word(0x8de0);
static const System::Word GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = System::Word(0x8de1);
static const System::Word GL_MAX_VERTEX_OUTPUT_COMPONENTS = System::Word(0x9122);
static const System::Word GL_MAX_GEOMETRY_INPUT_COMPONENTS = System::Word(0x9123);
static const System::Word GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = System::Word(0x9124);
static const System::Word GL_MAX_FRAGMENT_INPUT_COMPONENTS = System::Word(0x9125);
static const System::Word GL_CONTEXT_PROFILE_MASK = System::Word(0x9126);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_DIVISOR = System::Word(0x88fe);
static const System::Word GL_SAMPLE_SHADING = System::Word(0x8c36);
static const System::Word GL_MIN_SAMPLE_SHADING_VALUE = System::Word(0x8c37);
static const System::Word GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET = System::Word(0x8e5e);
static const System::Word GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET = System::Word(0x8e5f);
static const System::Word GL_TEXTURE_CUBE_MAP_ARRAY = System::Word(0x9009);
static const System::Word GL_TEXTURE_BINDING_CUBE_MAP_ARRAY = System::Word(0x900a);
static const System::Word GL_PROXY_TEXTURE_CUBE_MAP_ARRAY = System::Word(0x900b);
static const System::Word GL_SAMPLER_CUBE_MAP_ARRAY = System::Word(0x900c);
static const System::Word GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW = System::Word(0x900d);
static const System::Word GL_INT_SAMPLER_CUBE_MAP_ARRAY = System::Word(0x900e);
static const System::Word GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = System::Word(0x900f);
static const System::Word GL_ACTIVE_TEXTURE_ARB = System::Word(0x84e0);
static const System::Word GL_CLIENT_ACTIVE_TEXTURE_ARB = System::Word(0x84e1);
static const System::Word GL_MAX_TEXTURE_UNITS_ARB = System::Word(0x84e2);
static const System::Word GL_TEXTURE0_ARB = System::Word(0x84c0);
static const System::Word GL_TEXTURE1_ARB = System::Word(0x84c1);
static const System::Word GL_TEXTURE2_ARB = System::Word(0x84c2);
static const System::Word GL_TEXTURE3_ARB = System::Word(0x84c3);
static const System::Word GL_TEXTURE4_ARB = System::Word(0x84c4);
static const System::Word GL_TEXTURE5_ARB = System::Word(0x84c5);
static const System::Word GL_TEXTURE6_ARB = System::Word(0x84c6);
static const System::Word GL_TEXTURE7_ARB = System::Word(0x84c7);
static const System::Word GL_TEXTURE8_ARB = System::Word(0x84c8);
static const System::Word GL_TEXTURE9_ARB = System::Word(0x84c9);
static const System::Word GL_TEXTURE10_ARB = System::Word(0x84ca);
static const System::Word GL_TEXTURE11_ARB = System::Word(0x84cb);
static const System::Word GL_TEXTURE12_ARB = System::Word(0x84cc);
static const System::Word GL_TEXTURE13_ARB = System::Word(0x84cd);
static const System::Word GL_TEXTURE14_ARB = System::Word(0x84ce);
static const System::Word GL_TEXTURE15_ARB = System::Word(0x84cf);
static const System::Word GL_TEXTURE16_ARB = System::Word(0x84d0);
static const System::Word GL_TEXTURE17_ARB = System::Word(0x84d1);
static const System::Word GL_TEXTURE18_ARB = System::Word(0x84d2);
static const System::Word GL_TEXTURE19_ARB = System::Word(0x84d3);
static const System::Word GL_TEXTURE20_ARB = System::Word(0x84d4);
static const System::Word GL_TEXTURE21_ARB = System::Word(0x84d5);
static const System::Word GL_TEXTURE22_ARB = System::Word(0x84d6);
static const System::Word GL_TEXTURE23_ARB = System::Word(0x84d7);
static const System::Word GL_TEXTURE24_ARB = System::Word(0x84d8);
static const System::Word GL_TEXTURE25_ARB = System::Word(0x84d9);
static const System::Word GL_TEXTURE26_ARB = System::Word(0x84da);
static const System::Word GL_TEXTURE27_ARB = System::Word(0x84db);
static const System::Word GL_TEXTURE28_ARB = System::Word(0x84dc);
static const System::Word GL_TEXTURE29_ARB = System::Word(0x84dd);
static const System::Word GL_TEXTURE30_ARB = System::Word(0x84de);
static const System::Word GL_TEXTURE31_ARB = System::Word(0x84df);
static const System::Word GL_TRANSPOSE_MODELVIEW_MATRIX_ARB = System::Word(0x84e3);
static const System::Word GL_TRANSPOSE_PROJECTION_MATRIX_ARB = System::Word(0x84e4);
static const System::Word GL_TRANSPOSE_TEXTURE_MATRIX_ARB = System::Word(0x84e5);
static const System::Word GL_TRANSPOSE_COLOR_MATRIX_ARB = System::Word(0x84e6);
static const System::Int8 WGL_FRONT_COLOR_BUFFER_BIT_ARB = System::Int8(0x1);
static const System::Int8 WGL_BACK_COLOR_BUFFER_BIT_ARB = System::Int8(0x2);
static const System::Int8 WGL_DEPTH_BUFFER_BIT_ARB = System::Int8(0x4);
static const System::Int8 WGL_STENCIL_BUFFER_BIT_ARB = System::Int8(0x8);
static const System::Word GL_MULTISAMPLE_ARB = System::Word(0x809d);
static const System::Word GL_SAMPLE_ALPHA_TO_COVERAGE_ARB = System::Word(0x809e);
static const System::Word GL_SAMPLE_ALPHA_TO_ONE_ARB = System::Word(0x809f);
static const System::Word GL_SAMPLE_COVERAGE_ARB = System::Word(0x80a0);
static const System::Word GL_SAMPLE_BUFFERS_ARB = System::Word(0x80a8);
static const System::Word GL_SAMPLES_ARB = System::Word(0x80a9);
static const System::Word GL_SAMPLE_COVERAGE_VALUE_ARB = System::Word(0x80aa);
static const System::Word GL_SAMPLE_COVERAGE_INVERT_ARB = System::Word(0x80ab);
static const int GL_MULTISAMPLE_BIT_ARB = int(0x20000000);
static const int GLX_SAMPLE_BUFFERS_ARB = int(0x186a0);
static const int GLX_SAMPLES_ARB = int(0x186a1);
static const System::Word WGL_SAMPLE_BUFFERS_ARB = System::Word(0x2041);
static const System::Word WGL_SAMPLES_ARB = System::Word(0x2042);
static const int GLX_SAMPLE_BUFFERS_SGIS = int(0x100000);
static const int GLX_SAMPLES_SGIS = int(0x100001);
static const int GLX_SAMPLE_BUFFERS = int(0x100000);
static const int GLX_SAMPLES = int(0x100001);
static const System::Word GL_NORMAL_MAP_ARB = System::Word(0x8511);
static const System::Word GL_REFLECTION_MAP_ARB = System::Word(0x8512);
static const System::Word GL_TEXTURE_CUBE_MAP_ARB = System::Word(0x8513);
static const System::Word GL_TEXTURE_BINDING_CUBE_MAP_ARB = System::Word(0x8514);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = System::Word(0x8515);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = System::Word(0x8516);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = System::Word(0x8517);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = System::Word(0x8518);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = System::Word(0x8519);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = System::Word(0x851a);
static const System::Word GL_PROXY_TEXTURE_CUBE_MAP_ARB = System::Word(0x851b);
static const System::Word GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB = System::Word(0x851c);
static const System::Word WGL_NUMBER_PIXEL_FORMATS_ARB = System::Word(0x2000);
static const System::Word WGL_DRAW_TO_WINDOW_ARB = System::Word(0x2001);
static const System::Word WGL_DRAW_TO_BITMAP_ARB = System::Word(0x2002);
static const System::Word WGL_ACCELERATION_ARB = System::Word(0x2003);
static const System::Word WGL_NEED_PALETTE_ARB = System::Word(0x2004);
static const System::Word WGL_NEED_SYSTEM_PALETTE_ARB = System::Word(0x2005);
static const System::Word WGL_SWAP_LAYER_BUFFERS_ARB = System::Word(0x2006);
static const System::Word WGL_SWAP_METHOD_ARB = System::Word(0x2007);
static const System::Word WGL_NUMBER_OVERLAYS_ARB = System::Word(0x2008);
static const System::Word WGL_NUMBER_UNDERLAYS_ARB = System::Word(0x2009);
static const System::Word WGL_TRANSPARENT_ARB = System::Word(0x200a);
static const System::Word WGL_TRANSPARENT_RED_VALUE_ARB = System::Word(0x2037);
static const System::Word WGL_TRANSPARENT_GREEN_VALUE_ARB = System::Word(0x2038);
static const System::Word WGL_TRANSPARENT_BLUE_VALUE_ARB = System::Word(0x2039);
static const System::Word WGL_TRANSPARENT_ALPHA_VALUE_ARB = System::Word(0x203a);
static const System::Word WGL_TRANSPARENT_INDEX_VALUE_ARB = System::Word(0x203b);
static const System::Word WGL_SHARE_DEPTH_ARB = System::Word(0x200c);
static const System::Word WGL_SHARE_STENCIL_ARB = System::Word(0x200d);
static const System::Word WGL_SHARE_ACCUM_ARB = System::Word(0x200e);
static const System::Word WGL_SUPPORT_GDI_ARB = System::Word(0x200f);
static const System::Word WGL_SUPPORT_OPENGL_ARB = System::Word(0x2010);
static const System::Word WGL_DOUBLE_BUFFER_ARB = System::Word(0x2011);
static const System::Word WGL_STEREO_ARB = System::Word(0x2012);
static const System::Word WGL_PIXEL_TYPE_ARB = System::Word(0x2013);
static const System::Word WGL_COLOR_BITS_ARB = System::Word(0x2014);
static const System::Word WGL_RED_BITS_ARB = System::Word(0x2015);
static const System::Word WGL_RED_SHIFT_ARB = System::Word(0x2016);
static const System::Word WGL_GREEN_BITS_ARB = System::Word(0x2017);
static const System::Word WGL_GREEN_SHIFT_ARB = System::Word(0x2018);
static const System::Word WGL_BLUE_BITS_ARB = System::Word(0x2019);
static const System::Word WGL_BLUE_SHIFT_ARB = System::Word(0x201a);
static const System::Word WGL_ALPHA_BITS_ARB = System::Word(0x201b);
static const System::Word WGL_ALPHA_SHIFT_ARB = System::Word(0x201c);
static const System::Word WGL_ACCUM_BITS_ARB = System::Word(0x201d);
static const System::Word WGL_ACCUM_RED_BITS_ARB = System::Word(0x201e);
static const System::Word WGL_ACCUM_GREEN_BITS_ARB = System::Word(0x201f);
static const System::Word WGL_ACCUM_BLUE_BITS_ARB = System::Word(0x2020);
static const System::Word WGL_ACCUM_ALPHA_BITS_ARB = System::Word(0x2021);
static const System::Word WGL_DEPTH_BITS_ARB = System::Word(0x2022);
static const System::Word WGL_STENCIL_BITS_ARB = System::Word(0x2023);
static const System::Word WGL_AUX_BUFFERS_ARB = System::Word(0x2024);
static const System::Word WGL_NO_ACCELERATION_ARB = System::Word(0x2025);
static const System::Word WGL_GENERIC_ACCELERATION_ARB = System::Word(0x2026);
static const System::Word WGL_FULL_ACCELERATION_ARB = System::Word(0x2027);
static const System::Word WGL_SWAP_EXCHANGE_ARB = System::Word(0x2028);
static const System::Word WGL_SWAP_COPY_ARB = System::Word(0x2029);
static const System::Word WGL_SWAP_UNDEFINED_ARB = System::Word(0x202a);
static const System::Word WGL_TYPE_RGBA_ARB = System::Word(0x202b);
static const System::Word WGL_TYPE_COLORINDEX_ARB = System::Word(0x202c);
static const System::Word ERROR_INVALID_PIXEL_TYPE_ARB = System::Word(0x2043);
static const System::Word ERROR_INCOMPATIBLE_DEVICE_CONTEXTS_ARB = System::Word(0x2054);
static const System::Word WGL_DRAW_TO_PBUFFER_ARB = System::Word(0x202d);
static const System::Word WGL_MAX_PBUFFER_PIXELS_ARB = System::Word(0x202e);
static const System::Word WGL_MAX_PBUFFER_WIDTH_ARB = System::Word(0x202f);
static const System::Word WGL_MAX_PBUFFER_HEIGHT_ARB = System::Word(0x2030);
static const System::Word WGL_PBUFFER_LARGEST_ARB = System::Word(0x2033);
static const System::Word WGL_PBUFFER_WIDTH_ARB = System::Word(0x2034);
static const System::Word WGL_PBUFFER_HEIGHT_ARB = System::Word(0x2035);
static const System::Word WGL_PBUFFER_LOST_ARB = System::Word(0x2036);
static const System::Word GL_COMPRESSED_ALPHA_ARB = System::Word(0x84e9);
static const System::Word GL_COMPRESSED_LUMINANCE_ARB = System::Word(0x84ea);
static const System::Word GL_COMPRESSED_LUMINANCE_ALPHA_ARB = System::Word(0x84eb);
static const System::Word GL_COMPRESSED_INTENSITY_ARB = System::Word(0x84ec);
static const System::Word GL_COMPRESSED_RGB_ARB = System::Word(0x84ed);
static const System::Word GL_COMPRESSED_RGBA_ARB = System::Word(0x84ee);
static const System::Word GL_TEXTURE_COMPRESSION_HINT_ARB = System::Word(0x84ef);
static const System::Word GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB = System::Word(0x86a0);
static const System::Word GL_TEXTURE_COMPRESSED_ARB = System::Word(0x86a1);
static const System::Word GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB = System::Word(0x86a2);
static const System::Word GL_COMPRESSED_TEXTURE_FORMATS_ARB = System::Word(0x86a3);
static const System::Word GL_CLAMP_TO_BORDER_ARB = System::Word(0x812d);
static const System::Word GL_POINT_SIZE_MIN_ARB = System::Word(0x8126);
static const System::Word GL_POINT_SIZE_MAX_ARB = System::Word(0x8127);
static const System::Word GL_POINT_FADE_THRESHOLD_SIZE_ARB = System::Word(0x8128);
static const System::Word GL_DISTANCE_ATTENUATION_ARB = System::Word(0x8129);
static const System::Word GL_MAX_VERTEX_UNITS_ARB = System::Word(0x86a4);
static const System::Word GL_ACTIVE_VERTEX_UNITS_ARB = System::Word(0x86a5);
static const System::Word GL_WEIGHT_SUM_UNITY_ARB = System::Word(0x86a6);
static const System::Word GL_VERTEX_BLEND_ARB = System::Word(0x86a7);
static const System::Word GL_CURRENT_WEIGHT_ARB = System::Word(0x86a8);
static const System::Word GL_WEIGHT_ARRAY_TYPE_ARB = System::Word(0x86a9);
static const System::Word GL_WEIGHT_ARRAY_STRIDE_ARB = System::Word(0x86aa);
static const System::Word GL_WEIGHT_ARRAY_SIZE_ARB = System::Word(0x86ab);
static const System::Word GL_WEIGHT_ARRAY_POINTER_ARB = System::Word(0x86ac);
static const System::Word GL_WEIGHT_ARRAY_ARB = System::Word(0x86ad);
static const System::Word GL_MODELVIEW0_ARB = System::Word(0x1700);
static const System::Word GL_MODELVIEW1_ARB = System::Word(0x850a);
static const System::Word GL_MODELVIEW2_ARB = System::Word(0x8722);
static const System::Word GL_MODELVIEW3_ARB = System::Word(0x8723);
static const System::Word GL_MODELVIEW4_ARB = System::Word(0x8724);
static const System::Word GL_MODELVIEW5_ARB = System::Word(0x8725);
static const System::Word GL_MODELVIEW6_ARB = System::Word(0x8726);
static const System::Word GL_MODELVIEW7_ARB = System::Word(0x8727);
static const System::Word GL_MODELVIEW8_ARB = System::Word(0x8728);
static const System::Word GL_MODELVIEW9_ARB = System::Word(0x8729);
static const System::Word GL_MODELVIEW10_ARB = System::Word(0x872a);
static const System::Word GL_MODELVIEW11_ARB = System::Word(0x872b);
static const System::Word GL_MODELVIEW12_ARB = System::Word(0x872c);
static const System::Word GL_MODELVIEW13_ARB = System::Word(0x872d);
static const System::Word GL_MODELVIEW14_ARB = System::Word(0x872e);
static const System::Word GL_MODELVIEW15_ARB = System::Word(0x872f);
static const System::Word GL_MODELVIEW16_ARB = System::Word(0x8730);
static const System::Word GL_MODELVIEW17_ARB = System::Word(0x8731);
static const System::Word GL_MODELVIEW18_ARB = System::Word(0x8732);
static const System::Word GL_MODELVIEW19_ARB = System::Word(0x8733);
static const System::Word GL_MODELVIEW20_ARB = System::Word(0x8734);
static const System::Word GL_MODELVIEW21_ARB = System::Word(0x8735);
static const System::Word GL_MODELVIEW22_ARB = System::Word(0x8736);
static const System::Word GL_MODELVIEW23_ARB = System::Word(0x8737);
static const System::Word GL_MODELVIEW24_ARB = System::Word(0x8738);
static const System::Word GL_MODELVIEW25_ARB = System::Word(0x8739);
static const System::Word GL_MODELVIEW26_ARB = System::Word(0x873a);
static const System::Word GL_MODELVIEW27_ARB = System::Word(0x873b);
static const System::Word GL_MODELVIEW28_ARB = System::Word(0x873c);
static const System::Word GL_MODELVIEW29_ARB = System::Word(0x873d);
static const System::Word GL_MODELVIEW30_ARB = System::Word(0x873e);
static const System::Word GL_MODELVIEW31_ARB = System::Word(0x873f);
static const System::Word GL_MATRIX_PALETTE_ARB = System::Word(0x8840);
static const System::Word GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB = System::Word(0x8841);
static const System::Word GL_MAX_PALETTE_MATRICES_ARB = System::Word(0x8842);
static const System::Word GL_CURRENT_PALETTE_MATRIX_ARB = System::Word(0x8843);
static const System::Word GL_MATRIX_INDEX_ARRAY_ARB = System::Word(0x8844);
static const System::Word GL_CURRENT_MATRIX_INDEX_ARB = System::Word(0x8845);
static const System::Word GL_MATRIX_INDEX_ARRAY_SIZE_ARB = System::Word(0x8846);
static const System::Word GL_MATRIX_INDEX_ARRAY_TYPE_ARB = System::Word(0x8847);
static const System::Word GL_MATRIX_INDEX_ARRAY_STRIDE_ARB = System::Word(0x8848);
static const System::Word GL_MATRIX_INDEX_ARRAY_POINTER_ARB = System::Word(0x8849);
static const System::Word GL_COMBINE_ARB = System::Word(0x8570);
static const System::Word GL_COMBINE_RGB_ARB = System::Word(0x8571);
static const System::Word GL_COMBINE_ALPHA_ARB = System::Word(0x8572);
static const System::Word GL_RGB_SCALE_ARB = System::Word(0x8573);
static const System::Word GL_ADD_SIGNED_ARB = System::Word(0x8574);
static const System::Word GL_INTERPOLATE_ARB = System::Word(0x8575);
static const System::Word GL_CONSTANT_ARB = System::Word(0x8576);
static const System::Word GL_CONSTANT_COLOR_ARB = System::Word(0x8576);
static const System::Word GL_PRIMARY_COLOR_ARB = System::Word(0x8577);
static const System::Word GL_PREVIOUS_ARB = System::Word(0x8578);
static const System::Word GL_SOURCE0_RGB_ARB = System::Word(0x8580);
static const System::Word GL_SOURCE1_RGB_ARB = System::Word(0x8581);
static const System::Word GL_SOURCE2_RGB_ARB = System::Word(0x8582);
static const System::Word GL_SOURCE0_ALPHA_ARB = System::Word(0x8588);
static const System::Word GL_SOURCE1_ALPHA_ARB = System::Word(0x8589);
static const System::Word GL_SOURCE2_ALPHA_ARB = System::Word(0x858a);
static const System::Word GL_OPERAND0_RGB_ARB = System::Word(0x8590);
static const System::Word GL_OPERAND1_RGB_ARB = System::Word(0x8591);
static const System::Word GL_OPERAND2_RGB_ARB = System::Word(0x8592);
static const System::Word GL_OPERAND0_ALPHA_ARB = System::Word(0x8598);
static const System::Word GL_OPERAND1_ALPHA_ARB = System::Word(0x8599);
static const System::Word GL_OPERAND2_ALPHA_ARB = System::Word(0x859a);
static const System::Word GL_SUBTRACT_ARB = System::Word(0x84e7);
static const System::Word GL_DOT3_RGB_ARB = System::Word(0x86ae);
static const System::Word GL_DOT3_RGBA_ARB = System::Word(0x86af);
static const System::Word WGL_BIND_TO_TEXTURE_RGB_ARB = System::Word(0x2070);
static const System::Word WGL_BIND_TO_TEXTURE_RGBA_ARB = System::Word(0x2071);
static const System::Word WGL_TEXTURE_FORMAT_ARB = System::Word(0x2072);
static const System::Word WGL_TEXTURE_TARGET_ARB = System::Word(0x2073);
static const System::Word WGL_MIPMAP_TEXTURE_ARB = System::Word(0x2074);
static const System::Word WGL_TEXTURE_RGB_ARB = System::Word(0x2075);
static const System::Word WGL_TEXTURE_RGBA_ARB = System::Word(0x2076);
static const System::Word WGL_NO_TEXTURE_ARB = System::Word(0x2077);
static const System::Word WGL_TEXTURE_CUBE_MAP_ARB = System::Word(0x2078);
static const System::Word WGL_TEXTURE_1D_ARB = System::Word(0x2079);
static const System::Word WGL_TEXTURE_2D_ARB = System::Word(0x207a);
static const System::Word WGL_MIPMAP_LEVEL_ARB = System::Word(0x207b);
static const System::Word WGL_CUBE_MAP_FACE_ARB = System::Word(0x207c);
static const System::Word WGL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = System::Word(0x207d);
static const System::Word WGL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = System::Word(0x207e);
static const System::Word WGL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = System::Word(0x207f);
static const System::Word WGL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = System::Word(0x2080);
static const System::Word WGL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = System::Word(0x2081);
static const System::Word WGL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = System::Word(0x2082);
static const System::Word WGL_FRONT_LEFT_ARB = System::Word(0x2083);
static const System::Word WGL_FRONT_RIGHT_ARB = System::Word(0x2084);
static const System::Word WGL_BACK_LEFT_ARB = System::Word(0x2085);
static const System::Word WGL_BACK_RIGHT_ARB = System::Word(0x2086);
static const System::Word WGL_AUX0_ARB = System::Word(0x2087);
static const System::Word WGL_AUX1_ARB = System::Word(0x2088);
static const System::Word WGL_AUX2_ARB = System::Word(0x2089);
static const System::Word WGL_AUX3_ARB = System::Word(0x208a);
static const System::Word WGL_AUX4_ARB = System::Word(0x208b);
static const System::Word WGL_AUX5_ARB = System::Word(0x208c);
static const System::Word WGL_AUX6_ARB = System::Word(0x208d);
static const System::Word WGL_AUX7_ARB = System::Word(0x208e);
static const System::Word WGL_AUX8_ARB = System::Word(0x208f);
static const System::Word WGL_AUX9_ARB = System::Word(0x2090);
static const System::Word GL_MIRRORED_REPEAT_ARB = System::Word(0x8370);
static const System::Word GL_DEPTH_COMPONENT16_ARB = System::Word(0x81a5);
static const System::Word GL_DEPTH_COMPONENT24_ARB = System::Word(0x81a6);
static const System::Word GL_DEPTH_COMPONENT32_ARB = System::Word(0x81a7);
static const System::Word GL_TEXTURE_DEPTH_SIZE_ARB = System::Word(0x884a);
static const System::Word GL_DEPTH_TEXTURE_MODE_ARB = System::Word(0x884b);
static const System::Word GL_TEXTURE_COMPARE_MODE_ARB = System::Word(0x884c);
static const System::Word GL_TEXTURE_COMPARE_FUNC_ARB = System::Word(0x884d);
static const System::Word GL_COMPARE_R_TO_TEXTURE_ARB = System::Word(0x884e);
static const System::Word GL_TEXTURE_COMPARE_FAIL_VALUE_ARB = System::Word(0x80bf);
static const System::Word GL_COLOR_SUM_ARB = System::Word(0x8458);
static const System::Word GL_VERTEX_PROGRAM_ARB = System::Word(0x8620);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB = System::Word(0x8622);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB = System::Word(0x8623);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB = System::Word(0x8624);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB = System::Word(0x8625);
static const System::Word GL_CURRENT_VERTEX_ATTRIB_ARB = System::Word(0x8626);
static const System::Word GL_PROGRAM_LENGTH_ARB = System::Word(0x8627);
static const System::Word GL_PROGRAM_STRING_ARB = System::Word(0x8628);
static const System::Word GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB = System::Word(0x862e);
static const System::Word GL_MAX_PROGRAM_MATRICES_ARB = System::Word(0x862f);
static const System::Word GL_CURRENT_MATRIX_STACK_DEPTH_ARB = System::Word(0x8640);
static const System::Word GL_CURRENT_MATRIX_ARB = System::Word(0x8641);
static const System::Word GL_VERTEX_PROGRAM_POINT_SIZE_ARB = System::Word(0x8642);
static const System::Word GL_VERTEX_PROGRAM_TWO_SIDE_ARB = System::Word(0x8643);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB = System::Word(0x8645);
static const System::Word GL_PROGRAM_ERROR_POSITION_ARB = System::Word(0x864b);
static const System::Word GL_PROGRAM_BINDING_ARB = System::Word(0x8677);
static const System::Word GL_MAX_VERTEX_ATTRIBS_ARB = System::Word(0x8869);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB = System::Word(0x886a);
static const System::Word GL_PROGRAM_ERROR_STRING_ARB = System::Word(0x8874);
static const System::Word GL_PROGRAM_FORMAT_ASCII_ARB = System::Word(0x8875);
static const System::Word GL_PROGRAM_FORMAT_ARB = System::Word(0x8876);
static const System::Word GL_PROGRAM_INSTRUCTIONS_ARB = System::Word(0x88a0);
static const System::Word GL_MAX_PROGRAM_INSTRUCTIONS_ARB = System::Word(0x88a1);
static const System::Word GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB = System::Word(0x88a2);
static const System::Word GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB = System::Word(0x88a3);
static const System::Word GL_PROGRAM_TEMPORARIES_ARB = System::Word(0x88a4);
static const System::Word GL_MAX_PROGRAM_TEMPORARIES_ARB = System::Word(0x88a5);
static const System::Word GL_PROGRAM_NATIVE_TEMPORARIES_ARB = System::Word(0x88a6);
static const System::Word GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB = System::Word(0x88a7);
static const System::Word GL_PROGRAM_PARAMETERS_ARB = System::Word(0x88a8);
static const System::Word GL_MAX_PROGRAM_PARAMETERS_ARB = System::Word(0x88a9);
static const System::Word GL_PROGRAM_NATIVE_PARAMETERS_ARB = System::Word(0x88aa);
static const System::Word GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB = System::Word(0x88ab);
static const System::Word GL_PROGRAM_ATTRIBS_ARB = System::Word(0x88ac);
static const System::Word GL_MAX_PROGRAM_ATTRIBS_ARB = System::Word(0x88ad);
static const System::Word GL_PROGRAM_NATIVE_ATTRIBS_ARB = System::Word(0x88ae);
static const System::Word GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB = System::Word(0x88af);
static const System::Word GL_PROGRAM_ADDRESS_REGISTERS_ARB = System::Word(0x88b0);
static const System::Word GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB = System::Word(0x88b1);
static const System::Word GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = System::Word(0x88b2);
static const System::Word GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = System::Word(0x88b3);
static const System::Word GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB = System::Word(0x88b4);
static const System::Word GL_MAX_PROGRAM_ENV_PARAMETERS_ARB = System::Word(0x88b5);
static const System::Word GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB = System::Word(0x88b6);
static const System::Word GL_TRANSPOSE_CURRENT_MATRIX_ARB = System::Word(0x88b7);
static const System::Word GL_MATRIX0_ARB = System::Word(0x88c0);
static const System::Word GL_MATRIX1_ARB = System::Word(0x88c1);
static const System::Word GL_MATRIX2_ARB = System::Word(0x88c2);
static const System::Word GL_MATRIX3_ARB = System::Word(0x88c3);
static const System::Word GL_MATRIX4_ARB = System::Word(0x88c4);
static const System::Word GL_MATRIX5_ARB = System::Word(0x88c5);
static const System::Word GL_MATRIX6_ARB = System::Word(0x88c6);
static const System::Word GL_MATRIX7_ARB = System::Word(0x88c7);
static const System::Word GL_MATRIX8_ARB = System::Word(0x88c8);
static const System::Word GL_MATRIX9_ARB = System::Word(0x88c9);
static const System::Word GL_MATRIX10_ARB = System::Word(0x88ca);
static const System::Word GL_MATRIX11_ARB = System::Word(0x88cb);
static const System::Word GL_MATRIX12_ARB = System::Word(0x88cc);
static const System::Word GL_MATRIX13_ARB = System::Word(0x88cd);
static const System::Word GL_MATRIX14_ARB = System::Word(0x88ce);
static const System::Word GL_MATRIX15_ARB = System::Word(0x88cf);
static const System::Word GL_MATRIX16_ARB = System::Word(0x88d0);
static const System::Word GL_MATRIX17_ARB = System::Word(0x88d1);
static const System::Word GL_MATRIX18_ARB = System::Word(0x88d2);
static const System::Word GL_MATRIX19_ARB = System::Word(0x88d3);
static const System::Word GL_MATRIX20_ARB = System::Word(0x88d4);
static const System::Word GL_MATRIX21_ARB = System::Word(0x88d5);
static const System::Word GL_MATRIX22_ARB = System::Word(0x88d6);
static const System::Word GL_MATRIX23_ARB = System::Word(0x88d7);
static const System::Word GL_MATRIX24_ARB = System::Word(0x88d8);
static const System::Word GL_MATRIX25_ARB = System::Word(0x88d9);
static const System::Word GL_MATRIX26_ARB = System::Word(0x88da);
static const System::Word GL_MATRIX27_ARB = System::Word(0x88db);
static const System::Word GL_MATRIX28_ARB = System::Word(0x88dc);
static const System::Word GL_MATRIX29_ARB = System::Word(0x88dd);
static const System::Word GL_MATRIX30_ARB = System::Word(0x88de);
static const System::Word GL_MATRIX31_ARB = System::Word(0x88df);
static const System::Word GL_FRAGMENT_PROGRAM_ARB = System::Word(0x8804);
static const System::Word GL_PROGRAM_ALU_INSTRUCTIONS_ARB = System::Word(0x8805);
static const System::Word GL_PROGRAM_TEX_INSTRUCTIONS_ARB = System::Word(0x8806);
static const System::Word GL_PROGRAM_TEX_INDIRECTIONS_ARB = System::Word(0x8807);
static const System::Word GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = System::Word(0x8808);
static const System::Word GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = System::Word(0x8809);
static const System::Word GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = System::Word(0x880a);
static const System::Word GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB = System::Word(0x880b);
static const System::Word GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB = System::Word(0x880c);
static const System::Word GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB = System::Word(0x880d);
static const System::Word GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = System::Word(0x880e);
static const System::Word GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = System::Word(0x880f);
static const System::Word GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = System::Word(0x8810);
static const System::Word GL_MAX_TEXTURE_COORDS_ARB = System::Word(0x8871);
static const System::Word GL_MAX_TEXTURE_IMAGE_UNITS_ARB = System::Word(0x8872);
static const System::Word GL_BUFFER_SIZE_ARB = System::Word(0x8764);
static const System::Word GL_BUFFER_USAGE_ARB = System::Word(0x8765);
static const System::Word GL_ARRAY_BUFFER_ARB = System::Word(0x8892);
static const System::Word GL_ELEMENT_ARRAY_BUFFER_ARB = System::Word(0x8893);
static const System::Word GL_ARRAY_BUFFER_BINDING_ARB = System::Word(0x8894);
static const System::Word GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB = System::Word(0x8895);
static const System::Word GL_VERTEX_ARRAY_BUFFER_BINDING_ARB = System::Word(0x8896);
static const System::Word GL_NORMAL_ARRAY_BUFFER_BINDING_ARB = System::Word(0x8897);
static const System::Word GL_COLOR_ARRAY_BUFFER_BINDING_ARB = System::Word(0x8898);
static const System::Word GL_INDEX_ARRAY_BUFFER_BINDING_ARB = System::Word(0x8899);
static const System::Word GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB = System::Word(0x889a);
static const System::Word GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB = System::Word(0x889b);
static const System::Word GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB = System::Word(0x889c);
static const System::Word GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB = System::Word(0x889d);
static const System::Word GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB = System::Word(0x889e);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB = System::Word(0x889f);
static const System::Word GL_READ_ONLY_ARB = System::Word(0x88b8);
static const System::Word GL_WRITE_ONLY_ARB = System::Word(0x88b9);
static const System::Word GL_READ_WRITE_ARB = System::Word(0x88ba);
static const System::Word GL_BUFFER_ACCESS_ARB = System::Word(0x88bb);
static const System::Word GL_BUFFER_MAPPED_ARB = System::Word(0x88bc);
static const System::Word GL_BUFFER_MAP_POINTER_ARB = System::Word(0x88bd);
static const System::Word GL_STREAM_DRAW_ARB = System::Word(0x88e0);
static const System::Word GL_STREAM_READ_ARB = System::Word(0x88e1);
static const System::Word GL_STREAM_COPY_ARB = System::Word(0x88e2);
static const System::Word GL_STATIC_DRAW_ARB = System::Word(0x88e4);
static const System::Word GL_STATIC_READ_ARB = System::Word(0x88e5);
static const System::Word GL_STATIC_COPY_ARB = System::Word(0x88e6);
static const System::Word GL_DYNAMIC_DRAW_ARB = System::Word(0x88e8);
static const System::Word GL_DYNAMIC_READ_ARB = System::Word(0x88e9);
static const System::Word GL_DYNAMIC_COPY_ARB = System::Word(0x88ea);
static const System::Word GL_QUERY_COUNTER_BITS_ARB = System::Word(0x8864);
static const System::Word GL_CURRENT_QUERY_ARB = System::Word(0x8865);
static const System::Word GL_QUERY_RESULT_ARB = System::Word(0x8866);
static const System::Word GL_QUERY_RESULT_AVAILABLE_ARB = System::Word(0x8867);
static const System::Word GL_SAMPLES_PASSED_ARB = System::Word(0x8914);
static const System::Word GL_PROGRAM_OBJECT_ARB = System::Word(0x8b40);
static const System::Word GL_SHADER_OBJECT_ARB = System::Word(0x8b48);
static const System::Word GL_OBJECT_TYPE_ARB = System::Word(0x8b4e);
static const System::Word GL_OBJECT_SUBTYPE_ARB = System::Word(0x8b4f);
static const System::Word GL_FLOAT_VEC2_ARB = System::Word(0x8b50);
static const System::Word GL_FLOAT_VEC3_ARB = System::Word(0x8b51);
static const System::Word GL_FLOAT_VEC4_ARB = System::Word(0x8b52);
static const System::Word GL_INT_VEC2_ARB = System::Word(0x8b53);
static const System::Word GL_INT_VEC3_ARB = System::Word(0x8b54);
static const System::Word GL_INT_VEC4_ARB = System::Word(0x8b55);
static const System::Word GL_BOOL_ARB = System::Word(0x8b56);
static const System::Word GL_BOOL_VEC2_ARB = System::Word(0x8b57);
static const System::Word GL_BOOL_VEC3_ARB = System::Word(0x8b58);
static const System::Word GL_BOOL_VEC4_ARB = System::Word(0x8b59);
static const System::Word GL_FLOAT_MAT2_ARB = System::Word(0x8b5a);
static const System::Word GL_FLOAT_MAT3_ARB = System::Word(0x8b5b);
static const System::Word GL_FLOAT_MAT4_ARB = System::Word(0x8b5c);
static const System::Word GL_SAMPLER_1D_ARB = System::Word(0x8b5d);
static const System::Word GL_SAMPLER_2D_ARB = System::Word(0x8b5e);
static const System::Word GL_SAMPLER_3D_ARB = System::Word(0x8b5f);
static const System::Word GL_SAMPLER_CUBE_ARB = System::Word(0x8b60);
static const System::Word GL_SAMPLER_1D_SHADOW_ARB = System::Word(0x8b61);
static const System::Word GL_SAMPLER_2D_SHADOW_ARB = System::Word(0x8b62);
static const System::Word GL_SAMPLER_2D_RECT_ARB = System::Word(0x8b63);
static const System::Word GL_SAMPLER_2D_RECT_SHADOW_ARB = System::Word(0x8b64);
static const System::Word GL_OBJECT_DELETE_STATUS_ARB = System::Word(0x8b80);
static const System::Word GL_OBJECT_COMPILE_STATUS_ARB = System::Word(0x8b81);
static const System::Word GL_OBJECT_LINK_STATUS_ARB = System::Word(0x8b82);
static const System::Word GL_OBJECT_VALIDATE_STATUS_ARB = System::Word(0x8b83);
static const System::Word GL_OBJECT_INFO_LOG_LENGTH_ARB = System::Word(0x8b84);
static const System::Word GL_OBJECT_ATTACHED_OBJECTS_ARB = System::Word(0x8b85);
static const System::Word GL_OBJECT_ACTIVE_UNIFORMS_ARB = System::Word(0x8b86);
static const System::Word GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB = System::Word(0x8b87);
static const System::Word GL_OBJECT_SHADER_SOURCE_LENGTH_ARB = System::Word(0x8b88);
static const System::Word GL_VERTEX_SHADER_ARB = System::Word(0x8b31);
static const System::Word GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB = System::Word(0x8b4a);
static const System::Word GL_MAX_VARYING_FLOATS_ARB = System::Word(0x8b4b);
static const System::Word GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB = System::Word(0x8b4c);
static const System::Word GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB = System::Word(0x8b4d);
static const System::Word GL_OBJECT_ACTIVE_ATTRIBUTES_ARB = System::Word(0x8b89);
static const System::Word GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB = System::Word(0x8b8a);
static const System::Word GL_FRAGMENT_SHADER_ARB = System::Word(0x8b30);
static const System::Word GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB = System::Word(0x8b49);
static const System::Word GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB = System::Word(0x8b8b);
static const System::Word GL_SHADING_LANGUAGE_VERSION_ARB = System::Word(0x8b8c);
static const System::Word GL_POINT_SPRITE_ARB = System::Word(0x8861);
static const System::Word GL_COORD_REPLACE_ARB = System::Word(0x8862);
static const System::Word GL_MAX_DRAW_BUFFERS_ARB = System::Word(0x8824);
static const System::Word GL_DRAW_BUFFER0_ARB = System::Word(0x8825);
static const System::Word GL_DRAW_BUFFER1_ARB = System::Word(0x8826);
static const System::Word GL_DRAW_BUFFER2_ARB = System::Word(0x8827);
static const System::Word GL_DRAW_BUFFER3_ARB = System::Word(0x8828);
static const System::Word GL_DRAW_BUFFER4_ARB = System::Word(0x8829);
static const System::Word GL_DRAW_BUFFER5_ARB = System::Word(0x882a);
static const System::Word GL_DRAW_BUFFER6_ARB = System::Word(0x882b);
static const System::Word GL_DRAW_BUFFER7_ARB = System::Word(0x882c);
static const System::Word GL_DRAW_BUFFER8_ARB = System::Word(0x882d);
static const System::Word GL_DRAW_BUFFER9_ARB = System::Word(0x882e);
static const System::Word GL_DRAW_BUFFER10_ARB = System::Word(0x882f);
static const System::Word GL_DRAW_BUFFER11_ARB = System::Word(0x8830);
static const System::Word GL_DRAW_BUFFER12_ARB = System::Word(0x8831);
static const System::Word GL_DRAW_BUFFER13_ARB = System::Word(0x8832);
static const System::Word GL_DRAW_BUFFER14_ARB = System::Word(0x8833);
static const System::Word GL_DRAW_BUFFER15_ARB = System::Word(0x8834);
static const System::Word GL_TEXTURE_RECTANGLE_ARB = System::Word(0x84f5);
static const System::Word GL_TEXTURE_BINDING_RECTANGLE_ARB = System::Word(0x84f6);
static const System::Word GL_PROXY_TEXTURE_RECTANGLE_ARB = System::Word(0x84f7);
static const System::Word GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB = System::Word(0x84f8);
static const System::Word GL_RGBA_FLOAT_MODE_ARB = System::Word(0x8820);
static const System::Word GL_CLAMP_VERTEX_COLOR_ARB = System::Word(0x891a);
static const System::Word GL_CLAMP_FRAGMENT_COLOR_ARB = System::Word(0x891b);
static const System::Word GL_CLAMP_READ_COLOR_ARB = System::Word(0x891c);
static const System::Word GL_FIXED_ONLY_ARB = System::Word(0x891d);
static const System::Word WGL_TYPE_RGBA_FLOAT_ARB = System::Word(0x21a0);
static const System::Word GLX_RGBA_FLOAT_TYPE_ARB = System::Word(0x20b9);
static const System::Int8 GLX_RGBA_FLOAT_BIT_ARB = System::Int8(0x4);
static const System::Word GL_HALF_FLOAT_ARB = System::Word(0x140b);
static const System::Word GL_TEXTURE_RED_TYPE_ARB = System::Word(0x8c10);
static const System::Word GL_TEXTURE_GREEN_TYPE_ARB = System::Word(0x8c11);
static const System::Word GL_TEXTURE_BLUE_TYPE_ARB = System::Word(0x8c12);
static const System::Word GL_TEXTURE_ALPHA_TYPE_ARB = System::Word(0x8c13);
static const System::Word GL_TEXTURE_LUMINANCE_TYPE_ARB = System::Word(0x8c14);
static const System::Word GL_TEXTURE_INTENSITY_TYPE_ARB = System::Word(0x8c15);
static const System::Word GL_TEXTURE_DEPTH_TYPE_ARB = System::Word(0x8c16);
static const System::Word GL_UNSIGNED_NORMALIZED_ARB = System::Word(0x8c17);
static const System::Word GL_RGBA32F_ARB = System::Word(0x8814);
static const System::Word GL_RGB32F_ARB = System::Word(0x8815);
static const System::Word GL_ALPHA32F_ARB = System::Word(0x8816);
static const System::Word GL_INTENSITY32F_ARB = System::Word(0x8817);
static const System::Word GL_LUMINANCE32F_ARB = System::Word(0x8818);
static const System::Word GL_LUMINANCE_ALPHA32F_ARB = System::Word(0x8819);
static const System::Word GL_RGBA16F_ARB = System::Word(0x881a);
static const System::Word GL_RGB16F_ARB = System::Word(0x881b);
static const System::Word GL_ALPHA16F_ARB = System::Word(0x881c);
static const System::Word GL_INTENSITY16F_ARB = System::Word(0x881d);
static const System::Word GL_LUMINANCE16F_ARB = System::Word(0x881e);
static const System::Word GL_LUMINANCE_ALPHA16F_ARB = System::Word(0x881f);
static const System::Word GL_PIXEL_PACK_BUFFER_ARB = System::Word(0x88eb);
static const System::Word GL_PIXEL_UNPACK_BUFFER_ARB = System::Word(0x88ec);
static const System::Word GL_PIXEL_PACK_BUFFER_BINDING_ARB = System::Word(0x88ed);
static const System::Word GL_PIXEL_UNPACK_BUFFER_BINDING_ARB = System::Word(0x88ef);
static const System::Word GL_DEPTH_COMPONENT32F = System::Word(0x8cac);
static const System::Word GL_DEPTH32F_STENCIL8 = System::Word(0x8cad);
static const System::Word GL_FLOAT_32_UNSIGNED_INT_24_8_REV = System::Word(0x8dad);
static const System::Word GL_INVALID_FRAMEBUFFER_OPERATION = System::Word(0x506);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = System::Word(0x8210);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = System::Word(0x8211);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = System::Word(0x8212);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = System::Word(0x8213);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = System::Word(0x8214);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = System::Word(0x8215);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = System::Word(0x8216);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = System::Word(0x8217);
static const System::Word GL_FRAMEBUFFER_DEFAULT = System::Word(0x8218);
static const System::Word GL_FRAMEBUFFER_UNDEFINED = System::Word(0x8219);
static const System::Word GL_DEPTH_STENCIL_ATTACHMENT = System::Word(0x821a);
static const System::Word GL_INDEX = System::Word(0x8222);
static const System::Word GL_MAX_RENDERBUFFER_SIZE = System::Word(0x84e8);
static const System::Word GL_DEPTH_STENCIL = System::Word(0x84f9);
static const System::Word GL_UNSIGNED_INT_24_8 = System::Word(0x84fa);
static const System::Word GL_DEPTH24_STENCIL8 = System::Word(0x88f0);
static const System::Word GL_TEXTURE_STENCIL_SIZE = System::Word(0x88f1);
static const System::Word GL_TEXTURE_RED_TYPE = System::Word(0x8c10);
static const System::Word GL_TEXTURE_GREEN_TYPE = System::Word(0x8c11);
static const System::Word GL_TEXTURE_BLUE_TYPE = System::Word(0x8c12);
static const System::Word GL_TEXTURE_ALPHA_TYPE = System::Word(0x8c13);
static const System::Word GL_TEXTURE_LUMINANCE_TYPE = System::Word(0x8c14);
static const System::Word GL_TEXTURE_INTENSITY_TYPE = System::Word(0x8c15);
static const System::Word GL_TEXTURE_DEPTH_TYPE = System::Word(0x8c16);
static const System::Word GL_UNSIGNED_NORMALIZED = System::Word(0x8c17);
static const System::Word GL_FRAMEBUFFER_BINDING = System::Word(0x8ca6);
static const System::Word GL_DRAW_FRAMEBUFFER_BINDING = System::Word(0x8ca6);
static const System::Word GL_RENDERBUFFER_BINDING = System::Word(0x8ca7);
static const System::Word GL_READ_FRAMEBUFFER = System::Word(0x8ca8);
static const System::Word GL_DRAW_FRAMEBUFFER = System::Word(0x8ca9);
static const System::Word GL_READ_FRAMEBUFFER_BINDING = System::Word(0x8caa);
static const System::Word GL_RENDERBUFFER_SAMPLES = System::Word(0x8cab);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = System::Word(0x8cd0);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = System::Word(0x8cd1);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = System::Word(0x8cd2);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = System::Word(0x8cd3);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = System::Word(0x8cd4);
static const System::Word GL_FRAMEBUFFER_COMPLETE = System::Word(0x8cd5);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = System::Word(0x8cd6);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = System::Word(0x8cd7);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = System::Word(0x8cdb);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = System::Word(0x8cdc);
static const System::Word GL_FRAMEBUFFER_UNSUPPORTED = System::Word(0x8cdd);
static const System::Word GL_MAX_COLOR_ATTACHMENTS = System::Word(0x8cdf);
static const System::Word GL_COLOR_ATTACHMENT0 = System::Word(0x8ce0);
static const System::Word GL_COLOR_ATTACHMENT1 = System::Word(0x8ce1);
static const System::Word GL_COLOR_ATTACHMENT2 = System::Word(0x8ce2);
static const System::Word GL_COLOR_ATTACHMENT3 = System::Word(0x8ce3);
static const System::Word GL_COLOR_ATTACHMENT4 = System::Word(0x8ce4);
static const System::Word GL_COLOR_ATTACHMENT5 = System::Word(0x8ce5);
static const System::Word GL_COLOR_ATTACHMENT6 = System::Word(0x8ce6);
static const System::Word GL_COLOR_ATTACHMENT7 = System::Word(0x8ce7);
static const System::Word GL_COLOR_ATTACHMENT8 = System::Word(0x8ce8);
static const System::Word GL_COLOR_ATTACHMENT9 = System::Word(0x8ce9);
static const System::Word GL_COLOR_ATTACHMENT10 = System::Word(0x8cea);
static const System::Word GL_COLOR_ATTACHMENT11 = System::Word(0x8ceb);
static const System::Word GL_COLOR_ATTACHMENT12 = System::Word(0x8cec);
static const System::Word GL_COLOR_ATTACHMENT13 = System::Word(0x8ced);
static const System::Word GL_COLOR_ATTACHMENT14 = System::Word(0x8cee);
static const System::Word GL_COLOR_ATTACHMENT15 = System::Word(0x8cef);
static const System::Word GL_DEPTH_ATTACHMENT = System::Word(0x8d00);
static const System::Word GL_STENCIL_ATTACHMENT = System::Word(0x8d20);
static const System::Word GL_FRAMEBUFFER = System::Word(0x8d40);
static const System::Word GL_RENDERBUFFER = System::Word(0x8d41);
static const System::Word GL_RENDERBUFFER_WIDTH = System::Word(0x8d42);
static const System::Word GL_RENDERBUFFER_HEIGHT = System::Word(0x8d43);
static const System::Word GL_RENDERBUFFER_INTERNAL_FORMAT = System::Word(0x8d44);
static const System::Word GL_STENCIL_INDEX1 = System::Word(0x8d46);
static const System::Word GL_STENCIL_INDEX4 = System::Word(0x8d47);
static const System::Word GL_STENCIL_INDEX8 = System::Word(0x8d48);
static const System::Word GL_STENCIL_INDEX16 = System::Word(0x8d49);
static const System::Word GL_RENDERBUFFER_RED_SIZE = System::Word(0x8d50);
static const System::Word GL_RENDERBUFFER_GREEN_SIZE = System::Word(0x8d51);
static const System::Word GL_RENDERBUFFER_BLUE_SIZE = System::Word(0x8d52);
static const System::Word GL_RENDERBUFFER_ALPHA_SIZE = System::Word(0x8d53);
static const System::Word GL_RENDERBUFFER_DEPTH_SIZE = System::Word(0x8d54);
static const System::Word GL_RENDERBUFFER_STENCIL_SIZE = System::Word(0x8d55);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = System::Word(0x8d56);
static const System::Word GL_MAX_SAMPLES = System::Word(0x8d57);
static const System::Word GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB = System::Word(0x20b2);
static const System::Word WGL_FRAMEBUFFER_SRGB_CAPABLE_ARB = System::Word(0x20a9);
static const System::Word GL_FRAMEBUFFER_SRGB = System::Word(0x8db9);
static const System::Word GL_GEOMETRY_SHADER_ARB = System::Word(0x8dd9);
static const System::Word GL_GEOMETRY_VERTICES_OUT_ARB = System::Word(0x8dda);
static const System::Word GL_GEOMETRY_INPUT_TYPE_ARB = System::Word(0x8ddb);
static const System::Word GL_GEOMETRY_OUTPUT_TYPE_ARB = System::Word(0x8ddc);
static const System::Word GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = System::Word(0x8c29);
static const System::Word GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB = System::Word(0x8ddd);
static const System::Word GL_MAX_VERTEX_VARYING_COMPONENTS_ARB = System::Word(0x8dde);
static const System::Word GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = System::Word(0x8ddf);
static const System::Word GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB = System::Word(0x8de0);
static const System::Word GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = System::Word(0x8de1);
static const System::Int8 GL_LINES_ADJACENCY_ARB = System::Int8(0xa);
static const System::Int8 GL_LINE_STRIP_ADJACENCY_ARB = System::Int8(0xb);
static const System::Int8 GL_TRIANGLES_ADJACENCY_ARB = System::Int8(0xc);
static const System::Int8 GL_TRIANGLE_STRIP_ADJACENCY_ARB = System::Int8(0xd);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = System::Word(0x8da8);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = System::Word(0x8da9);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = System::Word(0x8da7);
static const System::Word GL_PROGRAM_POINT_SIZE_ARB = System::Word(0x8642);
static const System::Word GL_HALF_FLOAT = System::Word(0x140b);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB = System::Word(0x88fe);
static const System::Int8 GL_MAP_READ_BIT = System::Int8(0x1);
static const System::Int8 GL_MAP_WRITE_BIT = System::Int8(0x2);
static const System::Int8 GL_MAP_INVALIDATE_RANGE_BIT = System::Int8(0x4);
static const System::Int8 GL_MAP_INVALIDATE_BUFFER_BIT = System::Int8(0x8);
static const System::Int8 GL_MAP_FLUSH_EXPLICIT_BIT = System::Int8(0x10);
static const System::Int8 GL_MAP_UNSYNCHRONIZED_BIT = System::Int8(0x20);
static const System::Word GL_TEXTURE_BUFFER_ARB = System::Word(0x8c2a);
static const System::Word GL_MAX_TEXTURE_BUFFER_SIZE_ARB = System::Word(0x8c2b);
static const System::Word GL_TEXTURE_BINDING_BUFFER_ARB = System::Word(0x8c2c);
static const System::Word GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB = System::Word(0x8c2d);
static const System::Word GL_TEXTURE_BUFFER_FORMAT_ARB = System::Word(0x8c2e);
static const System::Word GL_COMPRESSED_RED_RGTC1 = System::Word(0x8dbb);
static const System::Word GL_COMPRESSED_SIGNED_RED_RGTC1 = System::Word(0x8dbc);
static const System::Word GL_COMPRESSED_RG_RGTC2 = System::Word(0x8dbd);
static const System::Word GL_COMPRESSED_SIGNED_RG_RGTC2 = System::Word(0x8dbe);
static const System::Word GL_R8 = System::Word(0x8229);
static const System::Word GL_R16 = System::Word(0x822a);
static const System::Word GL_RG8 = System::Word(0x822b);
static const System::Word GL_RG16 = System::Word(0x822c);
static const System::Word GL_R16F = System::Word(0x822d);
static const System::Word GL_R32F = System::Word(0x822e);
static const System::Word GL_RG16F = System::Word(0x822f);
static const System::Word GL_RG32F = System::Word(0x8230);
static const System::Word GL_R8I = System::Word(0x8231);
static const System::Word GL_R8UI = System::Word(0x8232);
static const System::Word GL_R16I = System::Word(0x8233);
static const System::Word GL_R16UI = System::Word(0x8234);
static const System::Word GL_R32I = System::Word(0x8235);
static const System::Word GL_R32UI = System::Word(0x8236);
static const System::Word GL_RG8I = System::Word(0x8237);
static const System::Word GL_RG8UI = System::Word(0x8238);
static const System::Word GL_RG16I = System::Word(0x8239);
static const System::Word GL_RG16UI = System::Word(0x823a);
static const System::Word GL_RG32I = System::Word(0x823b);
static const System::Word GL_RG32UI = System::Word(0x823c);
static const System::Word GL_RG = System::Word(0x8227);
static const System::Word GL_RG_INTEGER = System::Word(0x8228);
static const System::Word GL_VERTEX_ARRAY_BINDING = System::Word(0x85b5);
static const System::Word WGL_CONTEXT_MAJOR_VERSION_ARB = System::Word(0x2091);
static const System::Word WGL_CONTEXT_MINOR_VERSION_ARB = System::Word(0x2092);
static const System::Word WGL_CONTEXT_LAYER_PLANE_ARB = System::Word(0x2093);
static const System::Word WGL_CONTEXT_FLAGS_ARB = System::Word(0x2094);
static const System::Int8 WGL_CONTEXT_DEBUG_BIT_ARB = System::Int8(0x1);
static const System::Int8 WGL_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = System::Int8(0x2);
static const System::Word ERROR_INVALID_VERSION_ARB = System::Word(0x2095);
static const System::Int8 WGL_CONTEXT_ES2_PROFILE_BIT_EXT = System::Int8(0x4);
static const System::Word GLX_CONTEXT_MAJOR_VERSION_ARB = System::Word(0x2091);
static const System::Word GLX_CONTEXT_MINOR_VERSION_ARB = System::Word(0x2092);
static const System::Word GLX_CONTEXT_FLAGS_ARB = System::Word(0x2094);
static const System::Int8 GLX_CONTEXT_DEBUG_BIT_ARB = System::Int8(0x1);
static const System::Int8 GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = System::Int8(0x2);
static const System::Word GL_UNIFORM_BUFFER = System::Word(0x8a11);
static const System::Word GL_UNIFORM_BUFFER_BINDING = System::Word(0x8a28);
static const System::Word GL_UNIFORM_BUFFER_START = System::Word(0x8a29);
static const System::Word GL_UNIFORM_BUFFER_SIZE = System::Word(0x8a2a);
static const System::Word GL_MAX_VERTEX_UNIFORM_BLOCKS = System::Word(0x8a2b);
static const System::Word GL_MAX_GEOMETRY_UNIFORM_BLOCKS = System::Word(0x8a2c);
static const System::Word GL_MAX_FRAGMENT_UNIFORM_BLOCKS = System::Word(0x8a2d);
static const System::Word GL_MAX_COMBINED_UNIFORM_BLOCKS = System::Word(0x8a2e);
static const System::Word GL_MAX_UNIFORM_BUFFER_BINDINGS = System::Word(0x8a2f);
static const System::Word GL_MAX_UNIFORM_BLOCK_SIZE = System::Word(0x8a30);
static const System::Word GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = System::Word(0x8a31);
static const System::Word GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = System::Word(0x8a32);
static const System::Word GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = System::Word(0x8a33);
static const System::Word GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = System::Word(0x8a34);
static const System::Word GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = System::Word(0x8a35);
static const System::Word GL_ACTIVE_UNIFORM_BLOCKS = System::Word(0x8a36);
static const System::Word GL_UNIFORM_TYPE = System::Word(0x8a37);
static const System::Word GL_UNIFORM_SIZE = System::Word(0x8a38);
static const System::Word GL_UNIFORM_NAME_LENGTH = System::Word(0x8a39);
static const System::Word GL_UNIFORM_BLOCK_INDEX = System::Word(0x8a3a);
static const System::Word GL_UNIFORM_OFFSET = System::Word(0x8a3b);
static const System::Word GL_UNIFORM_ARRAY_STRIDE = System::Word(0x8a3c);
static const System::Word GL_UNIFORM_MATRIX_STRIDE = System::Word(0x8a3d);
static const System::Word GL_UNIFORM_IS_ROW_MAJOR = System::Word(0x8a3e);
static const System::Word GL_UNIFORM_BLOCK_BINDING = System::Word(0x8a3f);
static const System::Word GL_UNIFORM_BLOCK_DATA_SIZE = System::Word(0x8a40);
static const System::Word GL_UNIFORM_BLOCK_NAME_LENGTH = System::Word(0x8a41);
static const System::Word GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = System::Word(0x8a42);
static const System::Word GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = System::Word(0x8a43);
static const System::Word GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = System::Word(0x8a44);
static const System::Word GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = System::Word(0x8a45);
static const System::Word GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = System::Word(0x8a46);
static const unsigned GL_INVALID_INDEX = unsigned(0xffffffff);
static const System::Word GL_COPY_READ_BUFFER = System::Word(0x8f36);
static const System::Word GL_COPY_WRITE_BUFFER = System::Word(0x8f37);
static const System::Word GL_DEPTH_CLAMP = System::Word(0x864f);
static const System::Word GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = System::Word(0x8e4c);
static const System::Word GL_FIRST_VERTEX_CONVENTION = System::Word(0x8e4d);
static const System::Word GL_LAST_VERTEX_CONVENTION = System::Word(0x8e4e);
static const System::Word GL_PROVOKING_VERTEX = System::Word(0x8e4f);
static const System::Word GL_TEXTURE_CUBE_MAP_SEAMLESS = System::Word(0x884f);
static const System::Word GL_MAX_SERVER_WAIT_TIMEOUT = System::Word(0x9111);
static const System::Word GL_OBJECT_TYPE = System::Word(0x9112);
static const System::Word GL_SYNC_CONDITION = System::Word(0x9113);
static const System::Word GL_SYNC_STATUS = System::Word(0x9114);
static const System::Word GL_SYNC_FLAGS = System::Word(0x9115);
static const System::Word GL_SYNC_FENCE = System::Word(0x9116);
static const System::Word GL_SYNC_GPU_COMMANDS_COMPLETE = System::Word(0x9117);
static const System::Word GL_UNSIGNALED = System::Word(0x9118);
static const System::Word GL_SIGNALED = System::Word(0x9119);
static const System::Word GL_ALREADY_SIGNALED = System::Word(0x911a);
static const System::Word GL_TIMEOUT_EXPIRED = System::Word(0x911b);
static const System::Word GL_CONDITION_SATISFIED = System::Word(0x911c);
static const System::Word GL_WAIT_FAILED = System::Word(0x911d);
static const System::Int8 GL_SYNC_FLUSH_COMMANDS_BIT = System::Int8(0x1);
static const unsigned __int64 GL_TIMEOUT_IGNORED = 0xffffffffffffffffULL;
static const System::Word GL_SAMPLE_POSITION = System::Word(0x8e50);
static const System::Word GL_SAMPLE_MASK = System::Word(0x8e51);
static const System::Word GL_SAMPLE_MASK_VALUE = System::Word(0x8e52);
static const System::Word GL_MAX_SAMPLE_MASK_WORDS = System::Word(0x8e59);
static const System::Word GL_TEXTURE_2D_MULTISAMPLE = System::Word(0x9100);
static const System::Word GL_PROXY_TEXTURE_2D_MULTISAMPLE = System::Word(0x9101);
static const System::Word GL_TEXTURE_2D_MULTISAMPLE_ARRAY = System::Word(0x9102);
static const System::Word GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = System::Word(0x9103);
static const System::Word GL_TEXTURE_BINDING_2D_MULTISAMPLE = System::Word(0x9104);
static const System::Word GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = System::Word(0x9105);
static const System::Word GL_TEXTURE_SAMPLES = System::Word(0x9106);
static const System::Word GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = System::Word(0x9107);
static const System::Word GL_SAMPLER_2D_MULTISAMPLE = System::Word(0x9108);
static const System::Word GL_INT_SAMPLER_2D_MULTISAMPLE = System::Word(0x9109);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = System::Word(0x910a);
static const System::Word GL_SAMPLER_2D_MULTISAMPLE_ARRAY = System::Word(0x910b);
static const System::Word GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = System::Word(0x910c);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = System::Word(0x910d);
static const System::Word GL_MAX_COLOR_TEXTURE_SAMPLES = System::Word(0x910e);
static const System::Word GL_MAX_DEPTH_TEXTURE_SAMPLES = System::Word(0x910f);
static const System::Word GL_MAX_INTEGER_SAMPLES = System::Word(0x9110);
static const System::Word GL_SAMPLE_SHADING_ARB = System::Word(0x8c36);
static const System::Word GL_MIN_SAMPLE_SHADING_VALUE_ARB = System::Word(0x8c37);
static const System::Word GL_TEXTURE_CUBE_MAP_ARRAY_ARB = System::Word(0x9009);
static const System::Word GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = System::Word(0x900a);
static const System::Word GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = System::Word(0x900b);
static const System::Word GL_SAMPLER_CUBE_MAP_ARRAY_ARB = System::Word(0x900c);
static const System::Word GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = System::Word(0x900d);
static const System::Word GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = System::Word(0x900e);
static const System::Word GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = System::Word(0x900f);
static const System::Word GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = System::Word(0x8e5e);
static const System::Word GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = System::Word(0x8e5f);
static const System::Word GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS_ARB = System::Word(0x8f9f);
static const System::Word WGL_CONTEXT_PROFILE_MASK_ARB = System::Word(0x9126);
static const System::Int8 WGL_CONTEXT_CORE_PROFILE_BIT_ARB = System::Int8(0x1);
static const System::Int8 WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB = System::Int8(0x2);
static const System::Word ERROR_INVALID_PROFILE_ARB = System::Word(0x2096);
static const System::Word GLX_CONTEXT_PROFILE_MASK_ARB = System::Word(0x9126);
static const System::Int8 GLX_CONTEXT_CORE_PROFILE_BIT_ARB = System::Int8(0x1);
static const System::Int8 GLX_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB = System::Int8(0x2);
static const System::Word GL_SRC1_COLOR = System::Word(0x88f9);
static const System::Word GL_ONE_MINUS_SRC1_COLOR = System::Word(0x88fa);
static const System::Word GL_ONE_MINUS_SRC1_ALPHA = System::Word(0x88fb);
static const System::Word GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = System::Word(0x88fc);
static const System::Word GL_ANY_SAMPLES_PASSED = System::Word(0x8c2f);
static const System::Word GL_SAMPLER_BINDING = System::Word(0x8919);
static const System::Word GL_RGB10_A2UI = System::Word(0x906f);
static const System::Word GL_TEXTURE_SWIZZLE_R = System::Word(0x8e42);
static const System::Word GL_TEXTURE_SWIZZLE_G = System::Word(0x8e43);
static const System::Word GL_TEXTURE_SWIZZLE_B = System::Word(0x8e44);
static const System::Word GL_TEXTURE_SWIZZLE_A = System::Word(0x8e45);
static const System::Word GL_TEXTURE_SWIZZLE_RGBA = System::Word(0x8e46);
static const System::Word GL_TIME_ELAPSED = System::Word(0x88bf);
static const System::Word GL_TIMESTAMP = System::Word(0x8e28);
static const System::Word GL_INT_2_10_10_10_REV = System::Word(0x8d9f);
static const System::Word GL_DRAW_INDIRECT_BUFFER = System::Word(0x8f3f);
static const System::Word GL_DRAW_INDIRECT_BUFFER_BINDING = System::Word(0x8f43);
static const System::Word GL_GEOMETRY_SHADER_INVOCATIONS = System::Word(0x887f);
static const System::Word GL_MAX_GEOMETRY_SHADER_INVOCATIONS = System::Word(0x8e5a);
static const System::Word GL_MIN_FRAGMENT_INTERPOLATION_OFFSET = System::Word(0x8e5b);
static const System::Word GL_MAX_FRAGMENT_INTERPOLATION_OFFSET = System::Word(0x8e5c);
static const System::Word GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = System::Word(0x8e5d);
static const System::Word GL_MAX_VERTEX_STREAMS = System::Word(0x8e71);
static const System::Word GL_DOUBLE_VEC2 = System::Word(0x8ffc);
static const System::Word GL_DOUBLE_VEC3 = System::Word(0x8ffd);
static const System::Word GL_DOUBLE_VEC4 = System::Word(0x8ffe);
static const System::Word GL_DOUBLE_MAT2 = System::Word(0x8f46);
static const System::Word GL_DOUBLE_MAT3 = System::Word(0x8f47);
static const System::Word GL_DOUBLE_MAT4 = System::Word(0x8f48);
static const System::Word GL_DOUBLE_MAT2x3 = System::Word(0x8f49);
static const System::Word GL_DOUBLE_MAT2x4 = System::Word(0x8f4a);
static const System::Word GL_DOUBLE_MAT3x2 = System::Word(0x8f4b);
static const System::Word GL_DOUBLE_MAT3x4 = System::Word(0x8f4c);
static const System::Word GL_DOUBLE_MAT4x2 = System::Word(0x8f4d);
static const System::Word GL_DOUBLE_MAT4x3 = System::Word(0x8f4e);
static const System::Word GL_ACTIVE_SUBROUTINES = System::Word(0x8de5);
static const System::Word GL_ACTIVE_SUBROUTINE_UNIFORMS = System::Word(0x8de6);
static const System::Word GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS = System::Word(0x8e47);
static const System::Word GL_ACTIVE_SUBROUTINE_MAX_LENGTH = System::Word(0x8e48);
static const System::Word GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = System::Word(0x8e49);
static const System::Word GL_MAX_SUBROUTINES = System::Word(0x8de7);
static const System::Word GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS = System::Word(0x8de8);
static const System::Word GL_NUM_COMPATIBLE_SUBROUTINES = System::Word(0x8e4a);
static const System::Word GL_COMPATIBLE_SUBROUTINES = System::Word(0x8e4b);
static const System::Int8 GL_PATCHES = System::Int8(0xe);
static const System::Word GL_PATCH_VERTICES = System::Word(0x8e72);
static const System::Word GL_PATCH_DEFAULT_INNER_LEVEL = System::Word(0x8e73);
static const System::Word GL_PATCH_DEFAULT_OUTER_LEVEL = System::Word(0x8e74);
static const System::Word GL_TESS_CONTROL_OUTPUT_VERTICES = System::Word(0x8e75);
static const System::Word GL_TESS_GEN_MODE = System::Word(0x8e76);
static const System::Word GL_TESS_GEN_SPACING = System::Word(0x8e77);
static const System::Word GL_TESS_GEN_VERTEX_ORDER = System::Word(0x8e78);
static const System::Word GL_TESS_GEN_POINT_MODE = System::Word(0x8e79);
static const System::Word GL_ISOLINES = System::Word(0x8e7a);
static const System::Word GL_FRACTIONAL_ODD = System::Word(0x8e7b);
static const System::Word GL_FRACTIONAL_EVEN = System::Word(0x8e7c);
static const System::Word GL_MAX_PATCH_VERTICES = System::Word(0x8e7d);
static const System::Word GL_MAX_TESS_GEN_LEVEL = System::Word(0x8e7e);
static const System::Word GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = System::Word(0x8e7f);
static const System::Word GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = System::Word(0x8e80);
static const System::Word GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = System::Word(0x8e81);
static const System::Word GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = System::Word(0x8e82);
static const System::Word GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = System::Word(0x8e83);
static const System::Word GL_MAX_TESS_PATCH_COMPONENTS = System::Word(0x8e84);
static const System::Word GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = System::Word(0x8e85);
static const System::Word GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = System::Word(0x8e86);
static const System::Word GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = System::Word(0x8e89);
static const System::Word GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = System::Word(0x8e8a);
static const System::Word GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = System::Word(0x886c);
static const System::Word GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = System::Word(0x886d);
static const System::Word GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = System::Word(0x8e1e);
static const System::Word GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = System::Word(0x8e1f);
static const System::Word GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = System::Word(0x84f0);
static const System::Word GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = System::Word(0x84f1);
static const System::Word GL_TESS_EVALUATION_SHADER = System::Word(0x8e87);
static const System::Word GL_TESS_CONTROL_SHADER = System::Word(0x8e88);
static const System::Word GL_TRANSFORM_FEEDBACK = System::Word(0x8e22);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = System::Word(0x8e23);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = System::Word(0x8e24);
static const System::Word GL_TRANSFORM_FEEDBACK_BINDING = System::Word(0x8e25);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = System::Word(0x8e70);
static const System::Word GL_FIXED = System::Word(0x140c);
static const System::Word GL_IMPLEMENTATION_COLOR_READ_TYPE = System::Word(0x8b9a);
static const System::Word GL_IMPLEMENTATION_COLOR_READ_FORMAT = System::Word(0x8b9b);
static const System::Word GL_LOW_FLOAT = System::Word(0x8df0);
static const System::Word GL_MEDIUM_FLOAT = System::Word(0x8df1);
static const System::Word GL_HIGH_FLOAT = System::Word(0x8df2);
static const System::Word GL_LOW_INT = System::Word(0x8df3);
static const System::Word GL_MEDIUM_INT = System::Word(0x8df4);
static const System::Word GL_HIGH_INT = System::Word(0x8df5);
static const System::Word GL_SHADER_COMPILER = System::Word(0x8dfa);
static const System::Word GL_NUM_SHADER_BINARY_FORMATS = System::Word(0x8df9);
static const System::Word GL_MAX_VERTEX_UNIFORM_VECTORS = System::Word(0x8dfb);
static const System::Word GL_MAX_VARYING_VECTORS = System::Word(0x8dfc);
static const System::Word GL_MAX_FRAGMENT_UNIFORM_VECTORS = System::Word(0x8dfd);
static const System::Word GL_PROGRAM_BINARY_RETRIEVABLE_HINT = System::Word(0x8257);
static const System::Word GL_PROGRAM_BINARY_LENGTH = System::Word(0x8741);
static const System::Word GL_NUM_PROGRAM_BINARY_FORMATS = System::Word(0x87fe);
static const System::Word GL_PROGRAM_BINARY_FORMATS = System::Word(0x87ff);
static const System::Int8 GL_VERTEX_SHADER_BIT = System::Int8(0x1);
static const System::Int8 GL_FRAGMENT_SHADER_BIT = System::Int8(0x2);
static const System::Int8 GL_GEOMETRY_SHADER_BIT = System::Int8(0x4);
static const System::Int8 GL_TESS_CONTROL_SHADER_BIT = System::Int8(0x8);
static const System::Int8 GL_TESS_EVALUATION_SHADER_BIT = System::Int8(0x10);
static const unsigned GL_ALL_SHADER_BITS = unsigned(0xffffffff);
static const System::Word GL_PROGRAM_SEPARABLE = System::Word(0x8258);
static const System::Word GL_ACTIVE_PROGRAM = System::Word(0x8259);
static const System::Word GL_PROGRAM_PIPELINE_BINDING = System::Word(0x825a);
static const System::Word GL_MAX_VIEWPORTS = System::Word(0x825b);
static const System::Word GL_VIEWPORT_SUBPIXEL_BITS = System::Word(0x825c);
static const System::Word GL_VIEWPORT_BOUNDS_RANGE = System::Word(0x825d);
static const System::Word GL_LAYER_PROVOKING_VERTEX = System::Word(0x825e);
static const System::Word GL_VIEWPORT_INDEX_PROVOKING_VERTEX = System::Word(0x825f);
static const System::Word GL_UNDEFINED_VERTEX = System::Word(0x8260);
static const System::Word GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB = System::Word(0x8242);
static const System::Word GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = System::Word(0x8243);
static const System::Word GL_DEBUG_CALLBACK_FUNCTION_ARB = System::Word(0x8244);
static const System::Word GL_DEBUG_CALLBACK_USER_PARAM_ARB = System::Word(0x8245);
static const System::Word GL_DEBUG_SOURCE_API_ARB = System::Word(0x8246);
static const System::Word GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = System::Word(0x8247);
static const System::Word GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = System::Word(0x8248);
static const System::Word GL_DEBUG_SOURCE_THIRD_PARTY_ARB = System::Word(0x8249);
static const System::Word GL_DEBUG_SOURCE_APPLICATION_ARB = System::Word(0x824a);
static const System::Word GL_DEBUG_SOURCE_OTHER_ARB = System::Word(0x824b);
static const System::Word GL_DEBUG_TYPE_ERROR_ARB = System::Word(0x824c);
static const System::Word GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = System::Word(0x824d);
static const System::Word GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = System::Word(0x824e);
static const System::Word GL_DEBUG_TYPE_PORTABILITY_ARB = System::Word(0x824f);
static const System::Word GL_DEBUG_TYPE_PERFORMANCE_ARB = System::Word(0x8250);
static const System::Word GL_DEBUG_TYPE_OTHER_ARB = System::Word(0x8251);
static const System::Word GL_MAX_DEBUG_MESSAGE_LENGTH_ARB = System::Word(0x9143);
static const System::Word GL_MAX_DEBUG_LOGGED_MESSAGES_ARB = System::Word(0x9144);
static const System::Word GL_DEBUG_LOGGED_MESSAGES_ARB = System::Word(0x9145);
static const System::Word GL_DEBUG_SEVERITY_HIGH_ARB = System::Word(0x9146);
static const System::Word GL_DEBUG_SEVERITY_MEDIUM_ARB = System::Word(0x9147);
static const System::Word GL_DEBUG_SEVERITY_LOW_ARB = System::Word(0x9148);
static const System::Int8 GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB = System::Int8(0x4);
static const System::Word GL_LOSE_CONTEXT_ON_RESET_ARB = System::Word(0x8252);
static const System::Word GL_GUILTY_CONTEXT_RESET_ARB = System::Word(0x8253);
static const System::Word GL_INNOCENT_CONTEXT_RESET_ARB = System::Word(0x8254);
static const System::Word GL_UNKNOWN_CONTEXT_RESET_ARB = System::Word(0x8255);
static const System::Word GL_RESET_NOTIFICATION_STRATEGY_ARB = System::Word(0x8256);
static const System::Word GL_NO_RESET_NOTIFICATION_ARB = System::Word(0x8261);
static const System::Word GL_TEXTURE_RECTANGLE_EXT = System::Word(0x84f5);
static const System::Word GL_TEXTURE_BINDING_RECTANGLE_EXT = System::Word(0x84f6);
static const System::Word GL_PROXY_TEXTURE_RECTANGLE_EXT = System::Word(0x84f7);
static const System::Word GL_MAX_RECTANGLE_TEXTURE_SIZE_EXT = System::Word(0x84f8);
static const System::Word GLX_BIND_TO_TEXTURE_RGB_EXT = System::Word(0x20d0);
static const System::Word GLX_BIND_TO_TEXTURE_RGBA_EXT = System::Word(0x20d1);
static const System::Word GLX_BIND_TO_MIPMAP_TEXTURE_EXT = System::Word(0x20d2);
static const System::Word GLX_BIND_TO_TEXTURE_TARGETS_EXT = System::Word(0x20d3);
static const System::Word GLX_Y_INVERTED_EXT = System::Word(0x20d4);
static const System::Word GLX_TEXTURE_FORMAT_EXT = System::Word(0x20d5);
static const System::Word GLX_TEXTURE_TARGET_EXT = System::Word(0x20d6);
static const System::Word GLX_MIPMAP_TEXTURE_EXT = System::Word(0x20d7);
static const System::Word GLX_TEXTURE_FORMAT_NONE_EXT = System::Word(0x20d8);
static const System::Word GLX_TEXTURE_FORMAT_RGB_EXT = System::Word(0x20d9);
static const System::Word GLX_TEXTURE_FORMAT_RGBA_EXT = System::Word(0x20da);
static const System::Word GLX_TEXTURE_1D_EXT = System::Word(0x20db);
static const System::Word GLX_TEXTURE_2D_EXT = System::Word(0x20dc);
static const System::Word GLX_TEXTURE_RECTANGLE_EXT = System::Word(0x20dd);
static const System::Word GLX_FRONT_LEFT_EXT = System::Word(0x20de);
static const System::Word GLX_FRONT_RIGHT_EXT = System::Word(0x20df);
static const System::Word GLX_BACK_LEFT_EXT = System::Word(0x20e0);
static const System::Word GLX_BACK_RIGHT_EXT = System::Word(0x20e1);
static const System::Word GLX_FRONT_EXT = System::Word(0x20de);
static const System::Word GLX_BACK_EXT = System::Word(0x20e0);
static const System::Word GLX_AUX0_EXT = System::Word(0x20e2);
static const System::Word GLX_AUX1_EXT = System::Word(0x20e3);
static const System::Word GLX_AUX2_EXT = System::Word(0x20e4);
static const System::Extended GLX_AUX3_EXT = 4.200000E+07;
static const System::Word GLX_AUX4_EXT = System::Word(0x20e6);
static const System::Word GLX_AUX5_EXT = System::Word(0x20e7);
static const System::Word GLX_AUX6_EXT = System::Word(0x20e8);
static const System::Word GLX_AUX7_EXT = System::Word(0x20e9);
static const System::Word GLX_AUX8_EXT = System::Word(0x20ea);
static const System::Word GLX_AUX9_EXT = System::Word(0x20eb);
static const System::Word GL_ABGR_EXT = System::Word(0x8000);
static const System::Word GL_CONSTANT_COLOR_EXT = System::Word(0x8001);
static const System::Word GL_ONE_MINUS_CONSTANT_COLOR_EXT = System::Word(0x8002);
static const System::Word GL_CONSTANT_ALPHA_EXT = System::Word(0x8003);
static const System::Word GL_ONE_MINUS_CONSTANT_ALPHA_EXT = System::Word(0x8004);
static const System::Word GL_BLEND_COLOR_EXT = System::Word(0x8005);
static const System::Word GL_POLYGON_OFFSET_EXT = System::Word(0x8037);
static const System::Word GL_POLYGON_OFFSET_FACTOR_EXT = System::Word(0x8038);
static const System::Word GL_POLYGON_OFFSET_BIAS_EXT = System::Word(0x8039);
static const System::Word GL_ALPHA4_EXT = System::Word(0x803b);
static const System::Word GL_ALPHA8_EXT = System::Word(0x803c);
static const System::Word GL_ALPHA12_EXT = System::Word(0x803d);
static const System::Word GL_ALPHA16_EXT = System::Word(0x803e);
static const System::Word GL_LUMINANCE4_EXT = System::Word(0x803f);
static const System::Word GL_LUMINANCE8_EXT = System::Word(0x8040);
static const System::Word GL_LUMINANCE12_EXT = System::Word(0x8041);
static const System::Word GL_LUMINANCE16_EXT = System::Word(0x8042);
static const System::Word GL_LUMINANCE4_ALPHA4_EXT = System::Word(0x8043);
static const System::Word GL_LUMINANCE6_ALPHA2_EXT = System::Word(0x8044);
static const System::Word GL_LUMINANCE8_ALPHA8_EXT = System::Word(0x8045);
static const System::Word GL_LUMINANCE12_ALPHA4_EXT = System::Word(0x8046);
static const System::Word GL_LUMINANCE12_ALPHA12_EXT = System::Word(0x8047);
static const System::Word GL_LUMINANCE16_ALPHA16_EXT = System::Word(0x8048);
static const System::Word GL_INTENSITY_EXT = System::Word(0x8049);
static const System::Word GL_INTENSITY4_EXT = System::Word(0x804a);
static const System::Word GL_INTENSITY8_EXT = System::Word(0x804b);
static const System::Word GL_INTENSITY12_EXT = System::Word(0x804c);
static const System::Word GL_INTENSITY16_EXT = System::Word(0x804d);
static const System::Word GL_RGB2_EXT = System::Word(0x804e);
static const System::Word GL_RGB4_EXT = System::Word(0x804f);
static const System::Word GL_RGB5_EXT = System::Word(0x8050);
static const System::Word GL_RGB8_EXT = System::Word(0x8051);
static const System::Word GL_RGB10_EXT = System::Word(0x8052);
static const System::Word GL_RGB12_EXT = System::Word(0x8053);
static const System::Word GL_RGB16_EXT = System::Word(0x8054);
static const System::Word GL_RGBA2_EXT = System::Word(0x8055);
static const System::Word GL_RGBA4_EXT = System::Word(0x8056);
static const System::Word GL_RGB5_A1_EXT = System::Word(0x8057);
static const System::Word GL_RGBA8_EXT = System::Word(0x8058);
static const System::Word GL_RGB10_A2_EXT = System::Word(0x8059);
static const System::Word GL_RGBA12_EXT = System::Word(0x805a);
static const System::Word GL_RGBA16_EXT = System::Word(0x805b);
static const System::Word GL_TEXTURE_RED_SIZE_EXT = System::Word(0x805c);
static const System::Word GL_TEXTURE_GREEN_SIZE_EXT = System::Word(0x805d);
static const System::Word GL_TEXTURE_BLUE_SIZE_EXT = System::Word(0x805e);
static const System::Word GL_TEXTURE_ALPHA_SIZE_EXT = System::Word(0x805f);
static const System::Word GL_TEXTURE_LUMINANCE_SIZE_EXT = System::Word(0x8060);
static const System::Word GL_TEXTURE_INTENSITY_SIZE_EXT = System::Word(0x8061);
static const System::Word GL_REPLACE_EXT = System::Word(0x8062);
static const System::Word GL_PROXY_TEXTURE_1D_EXT = System::Word(0x8063);
static const System::Word GL_PROXY_TEXTURE_2D_EXT = System::Word(0x8064);
static const System::Word GL_TEXTURE_TOO_LARGE_EXT = System::Word(0x8065);
static const System::Word GL_RGB_S3TC = System::Word(0x83a0);
static const System::Word GL_RGB4_S3TC = System::Word(0x83a1);
static const System::Word GL_RGBA_S3TC = System::Word(0x83a2);
static const System::Word GL_RGBA4_S3TC = System::Word(0x83a3);
static const System::Word GL_RGBA_DXT5_S3TC = System::Word(0x83a4);
static const System::Word GL_RGBA4_DXT5_S3TC = System::Word(0x83a5);
static const System::Word GL_PACK_SKIP_IMAGES_EXT = System::Word(0x806b);
static const System::Word GL_PACK_IMAGE_HEIGHT_EXT = System::Word(0x806c);
static const System::Word GL_UNPACK_SKIP_IMAGES_EXT = System::Word(0x806d);
static const System::Word GL_UNPACK_IMAGE_HEIGHT_EXT = System::Word(0x806e);
static const System::Word GL_TEXTURE_3D_EXT = System::Word(0x806f);
static const System::Word GL_PROXY_TEXTURE_3D_EXT = System::Word(0x8070);
static const System::Word GL_TEXTURE_DEPTH_EXT = System::Word(0x8071);
static const System::Word GL_TEXTURE_WRAP_R_EXT = System::Word(0x8072);
static const System::Word GL_MAX_3D_TEXTURE_SIZE_EXT = System::Word(0x8073);
static const System::Word GL_HISTOGRAM_EXT = System::Word(0x8024);
static const System::Word GL_PROXY_HISTOGRAM_EXT = System::Word(0x8025);
static const System::Word GL_HISTOGRAM_WIDTH_EXT = System::Word(0x8026);
static const System::Word GL_HISTOGRAM_FORMAT_EXT = System::Word(0x8027);
static const System::Word GL_HISTOGRAM_RED_SIZE_EXT = System::Word(0x8028);
static const System::Word GL_HISTOGRAM_GREEN_SIZE_EXT = System::Word(0x8029);
static const System::Word GL_HISTOGRAM_BLUE_SIZE_EXT = System::Word(0x802a);
static const System::Word GL_HISTOGRAM_ALPHA_SIZE_EXT = System::Word(0x802b);
static const System::Word GL_HISTOGRAM_LUMINANCE_SIZE_EXT = System::Word(0x802c);
static const System::Word GL_HISTOGRAM_SINK_EXT = System::Word(0x802d);
static const System::Word GL_MINMAX_EXT = System::Word(0x802e);
static const System::Word GL_MINMAX_FORMAT_EXT = System::Word(0x802f);
static const System::Word GL_MINMAX_SINK_EXT = System::Word(0x8030);
static const System::Word GL_CONVOLUTION_1D_EXT = System::Word(0x8010);
static const System::Word GL_CONVOLUTION_2D_EXT = System::Word(0x8011);
static const System::Word GL_SEPARABLE_2D_EXT = System::Word(0x8012);
static const System::Word GL_CONVOLUTION_BORDER_MODE_EXT = System::Word(0x8013);
static const System::Word GL_CONVOLUTION_FILTER_SCALE_EXT = System::Word(0x8014);
static const System::Word GL_CONVOLUTION_FILTER_BIAS_EXT = System::Word(0x8015);
static const System::Word GL_REDUCE_EXT = System::Word(0x8016);
static const System::Word GL_CONVOLUTION_FORMAT_EXT = System::Word(0x8017);
static const System::Word GL_CONVOLUTION_WIDTH_EXT = System::Word(0x8018);
static const System::Word GL_CONVOLUTION_HEIGHT_EXT = System::Word(0x8019);
static const System::Word GL_MAX_CONVOLUTION_WIDTH_EXT = System::Word(0x801a);
static const System::Word GL_MAX_CONVOLUTION_HEIGHT_EXT = System::Word(0x801b);
static const System::Word GL_POST_CONVOLUTION_RED_SCALE_EXT = System::Word(0x801c);
static const System::Word GL_POST_CONVOLUTION_GREEN_SCALE_EXT = System::Word(0x801d);
static const System::Word GL_POST_CONVOLUTION_BLUE_SCALE_EXT = System::Word(0x801e);
static const System::Word GL_POST_CONVOLUTION_ALPHA_SCALE_EXT = System::Word(0x801f);
static const System::Word GL_POST_CONVOLUTION_RED_BIAS_EXT = System::Word(0x8020);
static const System::Word GL_POST_CONVOLUTION_GREEN_BIAS_EXT = System::Word(0x8021);
static const System::Word GL_POST_CONVOLUTION_BLUE_BIAS_EXT = System::Word(0x8022);
static const System::Word GL_POST_CONVOLUTION_ALPHA_BIAS_EXT = System::Word(0x8023);
static const System::Word GL_COLOR_MATRIX_SGI = System::Word(0x80b1);
static const System::Word GL_COLOR_MATRIX_STACK_DEPTH_SGI = System::Word(0x80b2);
static const System::Word GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI = System::Word(0x80b3);
static const System::Word GL_POST_COLOR_MATRIX_RED_SCALE_SGI = System::Word(0x80b4);
static const System::Word GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI = System::Word(0x80b5);
static const System::Word GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI = System::Word(0x80b6);
static const System::Word GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI = System::Word(0x80b7);
static const System::Word GL_POST_COLOR_MATRIX_RED_BIAS_SGI = System::Word(0x80b8);
static const System::Word GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI = System::Word(0x80b9);
static const System::Word GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI = System::Word(0x80ba);
static const System::Word GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI = System::Word(0x80bb);
static const System::Word GL_TEXTURE_PRIORITY_EXT = System::Word(0x8066);
static const System::Word GL_TEXTURE_RESIDENT_EXT = System::Word(0x8067);
static const System::Word GL_TEXTURE_1D_BINDING_EXT = System::Word(0x8068);
static const System::Word GL_TEXTURE_2D_BINDING_EXT = System::Word(0x8069);
static const System::Word GL_TEXTURE_3D_BINDING_EXT = System::Word(0x806a);
static const System::Word GL_UNSIGNED_BYTE_3_3_2_EXT = System::Word(0x8032);
static const System::Word GL_UNSIGNED_SHORT_4_4_4_4_EXT = System::Word(0x8033);
static const System::Word GL_UNSIGNED_SHORT_5_5_5_1_EXT = System::Word(0x8034);
static const System::Word GL_UNSIGNED_INT_8_8_8_8_EXT = System::Word(0x8035);
static const System::Word GL_UNSIGNED_INT_10_10_10_2_EXT = System::Word(0x8036);
static const System::Word GL_TEXTURE_MIN_LOD_SGIS = System::Word(0x813a);
static const System::Word GL_TEXTURE_MAX_LOD_SGIS = System::Word(0x813b);
static const System::Word GL_TEXTURE_BASE_LEVEL_SGIS = System::Word(0x813c);
static const System::Word GL_TEXTURE_MAX_LEVEL_SGIS = System::Word(0x813d);
static const System::Word GL_MULTISAMPLE_SGIS = System::Word(0x809d);
static const System::Word GL_SAMPLE_ALPHA_TO_MASK_SGIS = System::Word(0x809e);
static const System::Word GL_SAMPLE_ALPHA_TO_ONE_SGIS = System::Word(0x809f);
static const System::Word GL_SAMPLE_MASK_SGIS = System::Word(0x80a0);
static const System::Word GL_1PASS_SGIS = System::Word(0x80a1);
static const System::Word GL_2PASS_0_SGIS = System::Word(0x80a2);
static const System::Word GL_2PASS_1_SGIS = System::Word(0x80a3);
static const System::Word GL_4PASS_0_SGIS = System::Word(0x80a4);
static const System::Word GL_4PASS_1_SGIS = System::Word(0x80a5);
static const System::Word GL_4PASS_2_SGIS = System::Word(0x80a6);
static const System::Word GL_4PASS_3_SGIS = System::Word(0x80a7);
static const System::Word GL_SAMPLE_BUFFERS_SGIS = System::Word(0x80a8);
static const System::Word GL_SAMPLES_SGIS = System::Word(0x80a9);
static const System::Word GL_SAMPLE_MASK_VALUE_SGIS = System::Word(0x80aa);
static const System::Word GL_SAMPLE_MASK_INVERT_SGIS = System::Word(0x80ab);
static const System::Word GL_SAMPLE_PATTERN_SGIS = System::Word(0x80ac);
static const System::Word GL_RESCALE_NORMAL_EXT = System::Word(0x803a);
static const System::Word GL_GENERATE_MIPMAP_SGIS = System::Word(0x8191);
static const System::Word GL_GENERATE_MIPMAP_HINT_SGIS = System::Word(0x8192);
static const System::Word GL_TEXTURE_COMPARE_SGIX = System::Word(0x819a);
static const System::Word GL_TEXTURE_COMPARE_OPERATOR_SGIX = System::Word(0x819b);
static const System::Word GL_TEXTURE_LEQUAL_R_SGIX = System::Word(0x819c);
static const System::Word GL_TEXTURE_GEQUAL_R_SGIX = System::Word(0x819d);
static const System::Word GL_CLAMP_TO_EDGE_SGIS = System::Word(0x812f);
static const System::Word GL_CLAMP_TO_BORDER_SGIS = System::Word(0x812d);
static const System::Word GL_FUNC_ADD_EXT = System::Word(0x8006);
static const System::Word GL_MIN_EXT = System::Word(0x8007);
static const System::Word GL_MAX_EXT = System::Word(0x8008);
static const System::Word GL_BLEND_EQUATION_EXT = System::Word(0x8009);
static const System::Word GL_FUNC_SUBTRACT_EXT = System::Word(0x800a);
static const System::Word GL_FUNC_REVERSE_SUBTRACT_EXT = System::Word(0x800b);
static const int GLU_OBJECT_PARAMETRIC_ERROR_EXT = int(0x18770);
static const int GLU_OBJECT_PATH_LENGTH_EXT = int(0x18771);
static const System::Word GL_COLOR_INDEX1_EXT = System::Word(0x80e2);
static const System::Word GL_COLOR_INDEX2_EXT = System::Word(0x80e3);
static const System::Word GL_COLOR_INDEX4_EXT = System::Word(0x80e4);
static const System::Word GL_COLOR_INDEX8_EXT = System::Word(0x80e5);
static const System::Word GL_COLOR_INDEX12_EXT = System::Word(0x80e6);
static const System::Word GL_COLOR_INDEX16_EXT = System::Word(0x80e7);
static const System::Word GL_TEXTURE_INDEX_SIZE_EXT = System::Word(0x80ed);
static const System::Word GL_CLIP_VOLUME_CLIPPING_HINT_EXT = System::Word(0x80f0);
static const System::Word GL_SHADOW_AMBIENT_SGIX = System::Word(0x80bf);
static const System::Word GL_ARRAY_ELEMENT_LOCK_FIRST_EXT = System::Word(0x81a8);
static const System::Word GL_ARRAY_ELEMENT_LOCK_COUNT_EXT = System::Word(0x81a9);
static const int GLU_NURBS_MODE_EXT = int(0x18740);
static const int GLU_NURBS_TESSELLATOR_EXT = int(0x18741);
static const int GLU_NURBS_RENDERER_EXT = int(0x18742);
static const int GLU_NURBS_BEGIN_EXT = int(0x18744);
static const int GLU_NURBS_VERTEX_EXT = int(0x18745);
static const int GLU_NURBS_NORMAL_EXT = int(0x18746);
static const int GLU_NURBS_COLOR_EXT = int(0x18747);
static const int GLU_NURBS_TEX_COORD_EXT = int(0x18748);
static const int GLU_NURBS_END_EXT = int(0x18749);
static const int GLU_NURBS_BEGIN_DATA_EXT = int(0x1874a);
static const int GLU_NURBS_VERTEX_DATA_EXT = int(0x1874b);
static const int GLU_NURBS_NORMAL_DATA_EXT = int(0x1874c);
static const int GLU_NURBS_COLOR_DATA_EXT = int(0x1874d);
static const int GLU_NURBS_TEX_COORD_DATA_EXT = int(0x1874e);
static const int GLU_NURBS_END_DATA_EXT = int(0x1874f);
static const int GL_RASTER_POSITION_UNCLIPPED_IBM = int(0x19262);
static const System::Word GL_MAX_ELEMENTS_VERTICES_EXT = System::Word(0x80e8);
static const System::Word GL_MAX_ELEMENTS_INDICES_EXT = System::Word(0x80e9);
static const System::Word GL_BGR_EXT = System::Word(0x80e0);
static const System::Word GL_BGRA_EXT = System::Word(0x80e1);
static const System::Word GL_OCCLUSION_TEST_HP = System::Word(0x8165);
static const System::Word GL_OCCLUSION_TEST_RESULT_HP = System::Word(0x8166);
static const System::Word GL_SHARED_TEXTURE_PALETTE_EXT = System::Word(0x81fb);
static const System::Word GL_LIGHT_MODEL_COLOR_CONTROL_EXT = System::Word(0x81f8);
static const System::Word GL_SINGLE_COLOR_EXT = System::Word(0x81f9);
static const System::Word GL_SEPARATE_SPECULAR_COLOR_EXT = System::Word(0x81fa);
static const System::Word GL_COLOR_SUM_EXT = System::Word(0x8458);
static const System::Word GL_CURRENT_SECONDARY_COLOR_EXT = System::Word(0x8459);
static const System::Word GL_SECONDARY_COLOR_ARRAY_SIZE_EXT = System::Word(0x845a);
static const System::Word GL_SECONDARY_COLOR_ARRAY_TYPE_EXT = System::Word(0x845b);
static const System::Word GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT = System::Word(0x845c);
static const System::Word GL_SECONDARY_COLOR_ARRAY_POINTER_EXT = System::Word(0x845d);
static const System::Word GL_SECONDARY_COLOR_ARRAY_EXT = System::Word(0x845e);
static const System::Word GL_FOG_COORDINATE_SOURCE_EXT = System::Word(0x8450);
static const System::Word GL_FOG_COORDINATE_EXT = System::Word(0x8451);
static const System::Word GL_FRAGMENT_DEPTH_EXT = System::Word(0x8452);
static const System::Word GL_CURRENT_FOG_COORDINATE_EXT = System::Word(0x8453);
static const System::Word GL_FOG_COORDINATE_ARRAY_TYPE_EXT = System::Word(0x8454);
static const System::Word GL_FOG_COORDINATE_ARRAY_STRIDE_EXT = System::Word(0x8455);
static const System::Word GL_FOG_COORDINATE_ARRAY_POINTER_EXT = System::Word(0x8456);
static const System::Word GL_FOG_COORDINATE_ARRAY_EXT = System::Word(0x8457);
static const System::Word GL_COMBINE_EXT = System::Word(0x8570);
static const System::Word GL_COMBINE_RGB_EXT = System::Word(0x8571);
static const System::Word GL_COMBINE_ALPHA_EXT = System::Word(0x8572);
static const System::Word GL_RGB_SCALE_EXT = System::Word(0x8573);
static const System::Word GL_ADD_SIGNED_EXT = System::Word(0x8574);
static const System::Word GL_INTERPOLATE_EXT = System::Word(0x8575);
static const System::Word GL_CONSTANT_EXT = System::Word(0x8576);
static const System::Word GL_PRIMARY_COLOR_EXT = System::Word(0x8577);
static const System::Word GL_PREVIOUS_EXT = System::Word(0x8578);
static const System::Word GL_SOURCE0_RGB_EXT = System::Word(0x8580);
static const System::Word GL_SOURCE1_RGB_EXT = System::Word(0x8581);
static const System::Word GL_SOURCE2_RGB_EXT = System::Word(0x8582);
static const System::Word GL_SOURCE0_ALPHA_EXT = System::Word(0x8588);
static const System::Word GL_SOURCE1_ALPHA_EXT = System::Word(0x8589);
static const System::Word GL_SOURCE2_ALPHA_EXT = System::Word(0x858a);
static const System::Word GL_OPERAND0_RGB_EXT = System::Word(0x8590);
static const System::Word GL_OPERAND1_RGB_EXT = System::Word(0x8591);
static const System::Word GL_OPERAND2_RGB_EXT = System::Word(0x8592);
static const System::Word GL_OPERAND0_ALPHA_EXT = System::Word(0x8598);
static const System::Word GL_OPERAND1_ALPHA_EXT = System::Word(0x8599);
static const System::Word GL_OPERAND2_ALPHA_EXT = System::Word(0x859a);
static const System::Word GL_SOURCE3_RGB_EXT = System::Word(0x8583);
static const System::Word GL_SOURCE4_RGB_EXT = System::Word(0x8584);
static const System::Word GL_SOURCE5_RGB_EXT = System::Word(0x8585);
static const System::Word GL_SOURCE6_RGB_EXT = System::Word(0x8586);
static const System::Word GL_SOURCE7_RGB_EXT = System::Word(0x8587);
static const System::Word GL_SOURCE3_ALPHA_EXT = System::Word(0x858b);
static const System::Word GL_SOURCE4_ALPHA_EXT = System::Word(0x858c);
static const System::Word GL_SOURCE5_ALPHA_EXT = System::Word(0x858d);
static const System::Word GL_SOURCE6_ALPHA_EXT = System::Word(0x858e);
static const System::Word GL_SOURCE7_ALPHA_EXT = System::Word(0x858f);
static const System::Word GL_OPERAND3_RGB_EXT = System::Word(0x8593);
static const System::Word GL_OPERAND4_RGB_EXT = System::Word(0x8594);
static const System::Word GL_OPERAND5_RGB_EXT = System::Word(0x8595);
static const System::Word GL_OPERAND6_RGB_EXT = System::Word(0x8596);
static const System::Word GL_OPERAND7_RGB_EXT = System::Word(0x8597);
static const System::Word GL_OPERAND3_ALPHA_EXT = System::Word(0x859b);
static const System::Word GL_OPERAND4_ALPHA_EXT = System::Word(0x859c);
static const System::Word GL_OPERAND5_ALPHA_EXT = System::Word(0x859d);
static const System::Word GL_OPERAND6_ALPHA_EXT = System::Word(0x859e);
static const System::Word GL_OPERAND7_ALPHA_EXT = System::Word(0x859f);
static const System::Word GL_BLEND_DST_RGB_EXT = System::Word(0x80c8);
static const System::Word GL_BLEND_SRC_RGB_EXT = System::Word(0x80c9);
static const System::Word GL_BLEND_DST_ALPHA_EXT = System::Word(0x80ca);
static const System::Word GL_BLEND_SRC_ALPHA_EXT = System::Word(0x80cb);
static const System::Word GL_NORMAL_MAP_EXT = System::Word(0x8511);
static const System::Word GL_REFLECTION_MAP_EXT = System::Word(0x8512);
static const System::Word GL_TEXTURE_CUBE_MAP_EXT = System::Word(0x8513);
static const System::Word GL_TEXTURE_BINDING_CUBE_MAP_EXT = System::Word(0x8514);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT = System::Word(0x8515);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT = System::Word(0x8516);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT = System::Word(0x8517);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT = System::Word(0x8518);
static const System::Word GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT = System::Word(0x8519);
static const System::Word GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT = System::Word(0x851a);
static const System::Word GL_PROXY_TEXTURE_CUBE_MAP_EXT = System::Word(0x851b);
static const System::Word GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT = System::Word(0x851c);
static const System::Word GL_INCR_WRAP_EXT = System::Word(0x8507);
static const System::Word GL_DECR_WRAP_EXT = System::Word(0x8508);
static const System::Word GL_NORMAL_MAP_NV = System::Word(0x8511);
static const System::Word GL_REFLECTION_MAP_NV = System::Word(0x8512);
static const System::Word GL_MAX_TEXTURE_LOD_BIAS_EXT = System::Word(0x84fd);
static const System::Word GL_TEXTURE_FILTER_CONTROL_EXT = System::Word(0x8500);
static const System::Word GL_TEXTURE_LOD_BIAS_EXT = System::Word(0x8501);
static const System::Word GL_TEXTURE_MAX_ANISOTROPY_EXT = System::Word(0x84fe);
static const System::Word GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = System::Word(0x84ff);
static const System::Word GL_MAX_SHININESS_NV = System::Word(0x8504);
static const System::Word GL_MAX_SPOT_EXPONENT_NV = System::Word(0x8505);
static const System::Word GL_VERTEX_ARRAY_RANGE_NV = System::Word(0x851d);
static const System::Word GL_VERTEX_ARRAY_RANGE_LENGTH_NV = System::Word(0x851e);
static const System::Word GL_VERTEX_ARRAY_RANGE_VALID_NV = System::Word(0x851f);
static const System::Word GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV = System::Word(0x8520);
static const System::Word GL_VERTEX_ARRAY_RANGE_POINTER_NV = System::Word(0x8521);
static const System::Word GL_REGISTER_COMBINERS_NV = System::Word(0x8522);
static const System::Word GL_VARIABLE_A_NV = System::Word(0x8523);
static const System::Word GL_VARIABLE_B_NV = System::Word(0x8524);
static const System::Word GL_VARIABLE_C_NV = System::Word(0x8525);
static const System::Word GL_VARIABLE_D_NV = System::Word(0x8526);
static const System::Word GL_VARIABLE_E_NV = System::Word(0x8527);
static const System::Word GL_VARIABLE_F_NV = System::Word(0x8528);
static const System::Word GL_VARIABLE_G_NV = System::Word(0x8529);
static const System::Word GL_CONSTANT_COLOR0_NV = System::Word(0x852a);
static const System::Word GL_CONSTANT_COLOR1_NV = System::Word(0x852b);
static const System::Word GL_PRIMARY_COLOR_NV = System::Word(0x852c);
static const System::Word GL_SECONDARY_COLOR_NV = System::Word(0x852d);
static const System::Word GL_SPARE0_NV = System::Word(0x852e);
static const System::Word GL_SPARE1_NV = System::Word(0x852f);
static const System::Word GL_DISCARD_NV = System::Word(0x8530);
static const System::Word GL_E_TIMES_F_NV = System::Word(0x8531);
static const System::Word GL_SPARE0_PLUS_SECONDARY_COLOR_NV = System::Word(0x8532);
static const System::Word GL_UNSIGNED_IDENTITY_NV = System::Word(0x8536);
static const System::Word GL_UNSIGNED_INVERT_NV = System::Word(0x8537);
static const System::Word GL_EXPAND_NORMAL_NV = System::Word(0x8538);
static const System::Word GL_EXPAND_NEGATE_NV = System::Word(0x8539);
static const System::Word GL_HALF_BIAS_NORMAL_NV = System::Word(0x853a);
static const System::Word GL_HALF_BIAS_NEGATE_NV = System::Word(0x853b);
static const System::Word GL_SIGNED_IDENTITY_NV = System::Word(0x853c);
static const System::Word GL_SIGNED_NEGATE_NV = System::Word(0x853d);
static const System::Word GL_SCALE_BY_TWO_NV = System::Word(0x853e);
static const System::Word GL_SCALE_BY_FOUR_NV = System::Word(0x853f);
static const System::Word GL_SCALE_BY_ONE_HALF_NV = System::Word(0x8540);
static const System::Word GL_BIAS_BY_NEGATIVE_ONE_HALF_NV = System::Word(0x8541);
static const System::Word GL_COMBINER_INPUT_NV = System::Word(0x8542);
static const System::Word GL_COMBINER_MAPPING_NV = System::Word(0x8543);
static const System::Word GL_COMBINER_COMPONENT_USAGE_NV = System::Word(0x8544);
static const System::Word GL_COMBINER_AB_DOT_PRODUCT_NV = System::Word(0x8545);
static const System::Word GL_COMBINER_CD_DOT_PRODUCT_NV = System::Word(0x8546);
static const System::Word GL_COMBINER_MUX_SUM_NV = System::Word(0x8547);
static const System::Word GL_COMBINER_SCALE_NV = System::Word(0x8548);
static const System::Word GL_COMBINER_BIAS_NV = System::Word(0x8549);
static const System::Word GL_COMBINER_AB_OUTPUT_NV = System::Word(0x854a);
static const System::Word GL_COMBINER_CD_OUTPUT_NV = System::Word(0x854b);
static const System::Word GL_COMBINER_SUM_OUTPUT_NV = System::Word(0x854c);
static const System::Word GL_MAX_GENERAL_COMBINERS_NV = System::Word(0x854d);
static const System::Word GL_NUM_GENERAL_COMBINERS_NV = System::Word(0x854e);
static const System::Word GL_COLOR_SUM_CLAMP_NV = System::Word(0x854f);
static const System::Word GL_COMBINER0_NV = System::Word(0x8550);
static const System::Word GL_COMBINER1_NV = System::Word(0x8551);
static const System::Word GL_COMBINER2_NV = System::Word(0x8552);
static const System::Word GL_COMBINER3_NV = System::Word(0x8553);
static const System::Word GL_COMBINER4_NV = System::Word(0x8554);
static const System::Word GL_COMBINER5_NV = System::Word(0x8555);
static const System::Word GL_COMBINER6_NV = System::Word(0x8556);
static const System::Word GL_COMBINER7_NV = System::Word(0x8557);
static const System::Word GLX_VIDEO_OUT_COLOR_NV = System::Word(0x20c3);
static const System::Word GLX_VIDEO_OUT_ALPHA_NV = System::Word(0x20c4);
static const System::Word GLX_VIDEO_OUT_DEPTH_NV = System::Word(0x20c5);
static const System::Word GLX_VIDEO_OUT_COLOR_AND_ALPHA_NV = System::Word(0x20c6);
static const System::Word GLX_VIDEO_OUT_COLOR_AND_DEPTH_NV = System::Word(0x20c7);
static const System::Word GLX_VIDEO_OUT_FRAME_NV = System::Word(0x20c8);
static const System::Word GLX_VIDEO_OUT_FIELD_1_NV = System::Word(0x20c9);
static const System::Word GLX_VIDEO_OUT_FIELD_2_NV = System::Word(0x20ca);
static const System::Word GLX_VIDEO_OUT_STACKED_FIELDS_1_2_NV = System::Word(0x20cb);
static const System::Word GLX_VIDEO_OUT_STACKED_FIELDS_2_1_NV = System::Word(0x20cc);
static const System::Word GLX_NUM_VIDEO_SLOTS_NV = System::Word(0x20f0);
static const System::Word GLX_SWAP_INTERVAL_EXT = System::Word(0x20f1);
static const System::Word GLX_MAX_SWAP_INTERVAL_EXT = System::Word(0x20f2);
static const System::Word GLX_DEVICE_ID_NV = System::Word(0x20cd);
static const System::Word GLX_UNIQUE_ID_NV = System::Word(0x20ce);
static const System::Word GLX_NUM_VIDEO_CAPTURE_SLOTS_NV = System::Word(0x20cf);
static const System::Word GL_FOG_DISTANCE_MODE_NV = System::Word(0x855a);
static const System::Word GL_EYE_RADIAL_NV = System::Word(0x855b);
static const System::Word GL_EYE_PLANE_ABSOLUTE_NV = System::Word(0x855c);
static const System::Word GL_COMBINE4_NV = System::Word(0x8503);
static const System::Word GL_SOURCE3_RGB_NV = System::Word(0x8583);
static const System::Word GL_SOURCE3_ALPHA_NV = System::Word(0x858b);
static const System::Word GL_OPERAND3_RGB_NV = System::Word(0x8593);
static const System::Word GL_OPERAND3_ALPHA_NV = System::Word(0x859b);
static const System::Word GL_COMPRESSED_RGB_S3TC_DXT1_EXT = System::Word(0x83f0);
static const System::Word GL_COMPRESSED_RGBA_S3TC_DXT1_EXT = System::Word(0x83f1);
static const System::Word GL_COMPRESSED_RGBA_S3TC_DXT3_EXT = System::Word(0x83f2);
static const System::Word GL_COMPRESSED_RGBA_S3TC_DXT5_EXT = System::Word(0x83f3);
static const System::Word GL_COMPRESSED_RGB_FXT1_3DFX = System::Word(0x86b0);
static const System::Word GL_COMPRESSED_RGBA_FXT1_3DFX = System::Word(0x86b1);
static const System::Word GL_MULTISAMPLE_3DFX = System::Word(0x86b2);
static const System::Word GL_SAMPLE_BUFFERS_3DFX = System::Word(0x86b3);
static const System::Word GL_SAMPLES_3DFX = System::Word(0x86b4);
static const int GL_MULTISAMPLE_BIT_3DFX = int(0x20000000);
static const System::Word GL_MULTISAMPLE_EXT = System::Word(0x809d);
static const System::Word GL_SAMPLE_ALPHA_TO_MASK_EXT = System::Word(0x809e);
static const System::Word GL_SAMPLE_ALPHA_TO_ONE_EXT = System::Word(0x809f);
static const System::Word GL_SAMPLE_MASK_EXT = System::Word(0x80a0);
static const System::Word GL_1PASS_EXT = System::Word(0x80a1);
static const System::Word GL_2PASS_0_EXT = System::Word(0x80a2);
static const System::Word GL_2PASS_1_EXT = System::Word(0x80a3);
static const System::Word GL_4PASS_0_EXT = System::Word(0x80a4);
static const System::Word GL_4PASS_1_EXT = System::Word(0x80a5);
static const System::Word GL_4PASS_2_EXT = System::Word(0x80a6);
static const System::Word GL_4PASS_3_EXT = System::Word(0x80a7);
static const System::Word GL_SAMPLE_BUFFERS_EXT = System::Word(0x80a8);
static const System::Word GL_SAMPLES_EXT = System::Word(0x80a9);
static const System::Word GL_SAMPLE_MASK_VALUE_EXT = System::Word(0x80aa);
static const System::Word GL_SAMPLE_MASK_INVERT_EXT = System::Word(0x80ab);
static const System::Word GL_SAMPLE_PATTERN_EXT = System::Word(0x80ac);
static const System::Word WGL_SAMPLE_BUFFERS_EXT = System::Word(0x2041);
static const System::Word WGL_SAMPLES_EXT = System::Word(0x2042);
static const System::Word GL_TEXTURE_COLOR_WRITEMASK_SGIS = System::Word(0x81ef);
static const System::Word GL_DOT3_RGB_EXT = System::Word(0x8740);
static const System::Word GL_DOT3_RGBA_EXT = System::Word(0x8741);
static const System::Word GL_MIRROR_CLAMP_ATI = System::Word(0x8742);
static const System::Word GL_MIRROR_CLAMP_TO_EDGE_ATI = System::Word(0x8743);
static const System::Word GL_ALL_COMPLETED_NV = System::Word(0x84f2);
static const System::Word GL_FENCE_STATUS_NV = System::Word(0x84f3);
static const System::Word GL_FENCE_CONDITION_NV = System::Word(0x84f4);
static const System::Word GL_TEXTURE_RECTANGLE_NV = System::Word(0x84f5);
static const System::Word GL_TEXTURE_BINDING_RECTANGLE_NV = System::Word(0x84f6);
static const System::Word GL_PROXY_TEXTURE_RECTANGLE_NV = System::Word(0x84f7);
static const System::Word GL_MAX_RECTANGLE_TEXTURE_SIZE_NV = System::Word(0x84f8);
static const System::Word GL_OFFSET_TEXTURE_RECTANGLE_NV = System::Word(0x864c);
static const System::Word GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV = System::Word(0x864d);
static const System::Word GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV = System::Word(0x864e);
static const System::Word GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV = System::Word(0x86d9);
static const System::Word GL_UNSIGNED_INT_S8_S8_8_8_NV = System::Word(0x86da);
static const System::Word GL_UNSIGNED_INT_8_8_S8_S8_REV_NV = System::Word(0x86db);
static const System::Word GL_DSDT_MAG_INTENSITY_NV = System::Word(0x86dc);
static const System::Word GL_SHADER_CONSISTENT_NV = System::Word(0x86dd);
static const System::Word GL_TEXTURE_SHADER_NV = System::Word(0x86de);
static const System::Word GL_SHADER_OPERATION_NV = System::Word(0x86df);
static const System::Word GL_CULL_MODES_NV = System::Word(0x86e0);
static const System::Word GL_OFFSET_TEXTURE_MATRIX_NV = System::Word(0x86e1);
static const System::Word GL_OFFSET_TEXTURE_SCALE_NV = System::Word(0x86e2);
static const System::Word GL_OFFSET_TEXTURE_BIAS_NV = System::Word(0x86e3);
static const System::Word GL_OFFSET_TEXTURE_2D_MATRIX_NV = System::Word(0x86e1);
static const System::Word GL_OFFSET_TEXTURE_2D_SCALE_NV = System::Word(0x86e2);
static const System::Word GL_OFFSET_TEXTURE_2D_BIAS_NV = System::Word(0x86e3);
static const System::Word GL_PREVIOUS_TEXTURE_INPUT_NV = System::Word(0x86e4);
static const System::Word GL_CONST_EYE_NV = System::Word(0x86e5);
static const System::Word GL_PASS_THROUGH_NV = System::Word(0x86e6);
static const System::Word GL_CULL_FRAGMENT_NV = System::Word(0x86e7);
static const System::Word GL_OFFSET_TEXTURE_2D_NV = System::Word(0x86e8);
static const System::Word GL_DEPENDENT_AR_TEXTURE_2D_NV = System::Word(0x86e9);
static const System::Word GL_DEPENDENT_GB_TEXTURE_2D_NV = System::Word(0x86ea);
static const System::Word GL_DOT_PRODUCT_NV = System::Word(0x86ec);
static const System::Word GL_DOT_PRODUCT_DEPTH_REPLACE_NV = System::Word(0x86ed);
static const System::Word GL_DOT_PRODUCT_TEXTURE_2D_NV = System::Word(0x86ee);
static const System::Word GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV = System::Word(0x86f0);
static const System::Word GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV = System::Word(0x86f1);
static const System::Word GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV = System::Word(0x86f2);
static const System::Word GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV = System::Word(0x86f3);
static const System::Word GL_HILO_NV = System::Word(0x86f4);
static const System::Word GL_DSDT_NV = System::Word(0x86f5);
static const System::Word GL_DSDT_MAG_NV = System::Word(0x86f6);
static const System::Word GL_DSDT_MAG_VIB_NV = System::Word(0x86f7);
static const System::Word GL_HILO16_NV = System::Word(0x86f8);
static const System::Word GL_SIGNED_HILO_NV = System::Word(0x86f9);
static const System::Word GL_SIGNED_HILO16_NV = System::Word(0x86fa);
static const System::Word GL_SIGNED_RGBA_NV = System::Word(0x86fb);
static const System::Word GL_SIGNED_RGBA8_NV = System::Word(0x86fc);
static const System::Word GL_SIGNED_RGB_NV = System::Word(0x86fe);
static const System::Word GL_SIGNED_RGB8_NV = System::Word(0x86ff);
static const System::Word GL_SIGNED_LUMINANCE_NV = System::Word(0x8701);
static const System::Word GL_SIGNED_LUMINANCE8_NV = System::Word(0x8702);
static const System::Word GL_SIGNED_LUMINANCE_ALPHA_NV = System::Word(0x8703);
static const System::Word GL_SIGNED_LUMINANCE8_ALPHA8_NV = System::Word(0x8704);
static const System::Word GL_SIGNED_ALPHA_NV = System::Word(0x8705);
static const System::Word GL_SIGNED_ALPHA8_NV = System::Word(0x8706);
static const System::Word GL_SIGNED_INTENSITY_NV = System::Word(0x8707);
static const System::Word GL_SIGNED_INTENSITY8_NV = System::Word(0x8708);
static const System::Word GL_DSDT8_NV = System::Word(0x8709);
static const System::Word GL_DSDT8_MAG8_NV = System::Word(0x870a);
static const System::Word GL_DSDT8_MAG8_INTENSITY8_NV = System::Word(0x870b);
static const System::Word GL_SIGNED_RGB_UNSIGNED_ALPHA_NV = System::Word(0x870c);
static const System::Word GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV = System::Word(0x870d);
static const System::Word GL_HI_SCALE_NV = System::Word(0x870e);
static const System::Word GL_LO_SCALE_NV = System::Word(0x870f);
static const System::Word GL_DS_SCALE_NV = System::Word(0x8710);
static const System::Word GL_DT_SCALE_NV = System::Word(0x8711);
static const System::Word GL_MAGNITUDE_SCALE_NV = System::Word(0x8712);
static const System::Word GL_VIBRANCE_SCALE_NV = System::Word(0x8713);
static const System::Word GL_HI_BIAS_NV = System::Word(0x8714);
static const System::Word GL_LO_BIAS_NV = System::Word(0x8715);
static const System::Word GL_DS_BIAS_NV = System::Word(0x8716);
static const System::Word GL_DT_BIAS_NV = System::Word(0x8717);
static const System::Word GL_MAGNITUDE_BIAS_NV = System::Word(0x8718);
static const System::Word GL_VIBRANCE_BIAS_NV = System::Word(0x8719);
static const System::Word GL_TEXTURE_BORDER_VALUES_NV = System::Word(0x871a);
static const System::Word GL_TEXTURE_HI_SIZE_NV = System::Word(0x871b);
static const System::Word GL_TEXTURE_LO_SIZE_NV = System::Word(0x871c);
static const System::Word GL_TEXTURE_DS_SIZE_NV = System::Word(0x871d);
static const System::Word GL_TEXTURE_DT_SIZE_NV = System::Word(0x871e);
static const System::Word GL_TEXTURE_MAG_SIZE_NV = System::Word(0x871f);
static const System::Word GL_DOT_PRODUCT_TEXTURE_3D_NV = System::Word(0x86ef);
static const System::Word GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV = System::Word(0x8533);
static const System::Word GL_VERTEX_PROGRAM_NV = System::Word(0x8620);
static const System::Word GL_VERTEX_STATE_PROGRAM_NV = System::Word(0x8621);
static const System::Word GL_ATTRIB_ARRAY_SIZE_NV = System::Word(0x8623);
static const System::Word GL_ATTRIB_ARRAY_STRIDE_NV = System::Word(0x8624);
static const System::Word GL_ATTRIB_ARRAY_TYPE_NV = System::Word(0x8625);
static const System::Word GL_CURRENT_ATTRIB_NV = System::Word(0x8626);
static const System::Word GL_PROGRAM_LENGTH_NV = System::Word(0x8627);
static const System::Word GL_PROGRAM_STRING_NV = System::Word(0x8628);
static const System::Word GL_MODELVIEW_PROJECTION_NV = System::Word(0x8629);
static const System::Word GL_IDENTITY_NV = System::Word(0x862a);
static const System::Word GL_INVERSE_NV = System::Word(0x862b);
static const System::Word GL_TRANSPOSE_NV = System::Word(0x862c);
static const System::Word GL_INVERSE_TRANSPOSE_NV = System::Word(0x862d);
static const System::Word GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV = System::Word(0x862e);
static const System::Word GL_MAX_TRACK_MATRICES_NV = System::Word(0x862f);
static const System::Word GL_MATRIX0_NV = System::Word(0x8630);
static const System::Word GL_MATRIX1_NV = System::Word(0x8631);
static const System::Word GL_MATRIX2_NV = System::Word(0x8632);
static const System::Word GL_MATRIX3_NV = System::Word(0x8633);
static const System::Word GL_MATRIX4_NV = System::Word(0x8634);
static const System::Word GL_MATRIX5_NV = System::Word(0x8635);
static const System::Word GL_MATRIX6_NV = System::Word(0x8636);
static const System::Word GL_MATRIX7_NV = System::Word(0x8637);
static const System::Word GL_CURRENT_MATRIX_STACK_DEPTH_NV = System::Word(0x8640);
static const System::Word GL_CURRENT_MATRIX_NV = System::Word(0x8641);
static const System::Word GL_VERTEX_PROGRAM_POINT_SIZE_NV = System::Word(0x8642);
static const System::Word GL_VERTEX_PROGRAM_TWO_SIDE_NV = System::Word(0x8643);
static const System::Word GL_PROGRAM_PARAMETER_NV = System::Word(0x8644);
static const System::Word GL_ATTRIB_ARRAY_POINTER_NV = System::Word(0x8645);
static const System::Word GL_PROGRAM_TARGET_NV = System::Word(0x8646);
static const System::Word GL_PROGRAM_RESIDENT_NV = System::Word(0x8647);
static const System::Word GL_TRACK_MATRIX_NV = System::Word(0x8648);
static const System::Word GL_TRACK_MATRIX_TRANSFORM_NV = System::Word(0x8649);
static const System::Word GL_VERTEX_PROGRAM_BINDING_NV = System::Word(0x864a);
static const System::Word GL_PROGRAM_ERROR_POSITION_NV = System::Word(0x864b);
static const System::Word GL_VERTEX_ATTRIB_ARRAY0_NV = System::Word(0x8650);
static const System::Word GL_VERTEX_ATTRIB_ARRAY1_NV = System::Word(0x8651);
static const System::Word GL_VERTEX_ATTRIB_ARRAY2_NV = System::Word(0x8652);
static const System::Word GL_VERTEX_ATTRIB_ARRAY3_NV = System::Word(0x8653);
static const System::Word GL_VERTEX_ATTRIB_ARRAY4_NV = System::Word(0x8654);
static const System::Word GL_VERTEX_ATTRIB_ARRAY5_NV = System::Word(0x8655);
static const System::Word GL_VERTEX_ATTRIB_ARRAY6_NV = System::Word(0x8656);
static const System::Word GL_VERTEX_ATTRIB_ARRAY7_NV = System::Word(0x8657);
static const System::Word GL_VERTEX_ATTRIB_ARRAY8_NV = System::Word(0x8658);
static const System::Word GL_VERTEX_ATTRIB_ARRAY9_NV = System::Word(0x8659);
static const System::Word GL_VERTEX_ATTRIB_ARRAY10_NV = System::Word(0x865a);
static const System::Word GL_VERTEX_ATTRIB_ARRAY11_NV = System::Word(0x865b);
static const System::Word GL_VERTEX_ATTRIB_ARRAY12_NV = System::Word(0x865c);
static const System::Word GL_VERTEX_ATTRIB_ARRAY13_NV = System::Word(0x865d);
static const System::Word GL_VERTEX_ATTRIB_ARRAY14_NV = System::Word(0x865e);
static const System::Word GL_VERTEX_ATTRIB_ARRAY15_NV = System::Word(0x865f);
static const System::Word GL_MAP1_VERTEX_ATTRIB0_4_NV = System::Word(0x8660);
static const System::Word GL_MAP1_VERTEX_ATTRIB1_4_NV = System::Word(0x8661);
static const System::Word GL_MAP1_VERTEX_ATTRIB2_4_NV = System::Word(0x8662);
static const System::Word GL_MAP1_VERTEX_ATTRIB3_4_NV = System::Word(0x8663);
static const System::Word GL_MAP1_VERTEX_ATTRIB4_4_NV = System::Word(0x8664);
static const System::Word GL_MAP1_VERTEX_ATTRIB5_4_NV = System::Word(0x8665);
static const System::Word GL_MAP1_VERTEX_ATTRIB6_4_NV = System::Word(0x8666);
static const System::Word GL_MAP1_VERTEX_ATTRIB7_4_NV = System::Word(0x8667);
static const System::Word GL_MAP1_VERTEX_ATTRIB8_4_NV = System::Word(0x8668);
static const System::Word GL_MAP1_VERTEX_ATTRIB9_4_NV = System::Word(0x8669);
static const System::Word GL_MAP1_VERTEX_ATTRIB10_4_NV = System::Word(0x866a);
static const System::Word GL_MAP1_VERTEX_ATTRIB11_4_NV = System::Word(0x866b);
static const System::Word GL_MAP1_VERTEX_ATTRIB12_4_NV = System::Word(0x866c);
static const System::Word GL_MAP1_VERTEX_ATTRIB13_4_NV = System::Word(0x866d);
static const System::Word GL_MAP1_VERTEX_ATTRIB14_4_NV = System::Word(0x866e);
static const System::Word GL_MAP1_VERTEX_ATTRIB15_4_NV = System::Word(0x866f);
static const System::Word GL_MAP2_VERTEX_ATTRIB0_4_NV = System::Word(0x8670);
static const System::Word GL_MAP2_VERTEX_ATTRIB1_4_NV = System::Word(0x8671);
static const System::Word GL_MAP2_VERTEX_ATTRIB2_4_NV = System::Word(0x8672);
static const System::Word GL_MAP2_VERTEX_ATTRIB3_4_NV = System::Word(0x8673);
static const System::Word GL_MAP2_VERTEX_ATTRIB4_4_NV = System::Word(0x8674);
static const System::Word GL_MAP2_VERTEX_ATTRIB5_4_NV = System::Word(0x8675);
static const System::Word GL_MAP2_VERTEX_ATTRIB6_4_NV = System::Word(0x8676);
static const System::Word GL_MAP2_VERTEX_ATTRIB7_4_NV = System::Word(0x8677);
static const System::Word GL_MAP2_VERTEX_ATTRIB8_4_NV = System::Word(0x8678);
static const System::Word GL_MAP2_VERTEX_ATTRIB9_4_NV = System::Word(0x8679);
static const System::Word GL_MAP2_VERTEX_ATTRIB10_4_NV = System::Word(0x867a);
static const System::Word GL_MAP2_VERTEX_ATTRIB11_4_NV = System::Word(0x867b);
static const System::Word GL_MAP2_VERTEX_ATTRIB12_4_NV = System::Word(0x867c);
static const System::Word GL_MAP2_VERTEX_ATTRIB13_4_NV = System::Word(0x867d);
static const System::Word GL_MAP2_VERTEX_ATTRIB14_4_NV = System::Word(0x867e);
static const System::Word GL_MAP2_VERTEX_ATTRIB15_4_NV = System::Word(0x867f);
static const System::Word GL_MULTISAMPLE_FILTER_HINT_NV = System::Word(0x8534);
static const System::Word GL_PIXEL_COUNTER_BITS_NV = System::Word(0x8864);
static const System::Word GL_CURRENT_OCCLUSION_QUERY_ID_NV = System::Word(0x8865);
static const System::Word GL_PIXEL_COUNT_NV = System::Word(0x8866);
static const System::Word GL_PIXEL_COUNT_AVAILABLE_NV = System::Word(0x8867);
static const System::Word GL_POINT_SPRITE_NV = System::Word(0x8861);
static const System::Word GL_COORD_REPLACE_NV = System::Word(0x8862);
static const System::Word GL_POINT_SPRITE_R_MODE_NV = System::Word(0x8863);
static const System::Word GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV = System::Word(0x8850);
static const System::Word GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV = System::Word(0x8851);
static const System::Word GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV = System::Word(0x8852);
static const System::Word GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV = System::Word(0x8853);
static const System::Word GL_OFFSET_HILO_TEXTURE_2D_NV = System::Word(0x8854);
static const System::Word GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV = System::Word(0x8855);
static const System::Word GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV = System::Word(0x8856);
static const System::Word GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV = System::Word(0x8857);
static const System::Word GL_DEPENDENT_HILO_TEXTURE_2D_NV = System::Word(0x8858);
static const System::Word GL_DEPENDENT_RGB_TEXTURE_3D_NV = System::Word(0x8859);
static const System::Word GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV = System::Word(0x885a);
static const System::Word GL_DOT_PRODUCT_PASS_THROUGH_NV = System::Word(0x885b);
static const System::Word GL_DOT_PRODUCT_TEXTURE_1D_NV = System::Word(0x885c);
static const System::Word GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV = System::Word(0x885d);
static const System::Word GL_HILO8_NV = System::Word(0x885e);
static const System::Word GL_SIGNED_HILO8_NV = System::Word(0x885f);
static const System::Word GL_FORCE_BLUE_TO_ONE_NV = System::Word(0x8860);
static const System::Word GL_STENCIL_TEST_TWO_SIDE_EXT = System::Word(0x8910);
static const System::Word GL_ACTIVE_STENCIL_FACE_EXT = System::Word(0x8911);
static const System::Word GL_MAX_DRAW_BUFFERS_ATI = System::Word(0x8824);
static const System::Word GL_DRAW_BUFFER0_ATI = System::Word(0x8825);
static const System::Word GL_DRAW_BUFFER1_ATI = System::Word(0x8826);
static const System::Word GL_DRAW_BUFFER2_ATI = System::Word(0x8827);
static const System::Word GL_DRAW_BUFFER3_ATI = System::Word(0x8828);
static const System::Word GL_DRAW_BUFFER4_ATI = System::Word(0x8829);
static const System::Word GL_DRAW_BUFFER5_ATI = System::Word(0x882a);
static const System::Word GL_DRAW_BUFFER6_ATI = System::Word(0x882b);
static const System::Word GL_DRAW_BUFFER7_ATI = System::Word(0x882c);
static const System::Word GL_DRAW_BUFFER8_ATI = System::Word(0x882d);
static const System::Word GL_DRAW_BUFFER9_ATI = System::Word(0x882e);
static const System::Word GL_DRAW_BUFFER10_ATI = System::Word(0x882f);
static const System::Word GL_DRAW_BUFFER11_ATI = System::Word(0x8830);
static const System::Word GL_DRAW_BUFFER12_ATI = System::Word(0x8831);
static const System::Word GL_DRAW_BUFFER13_ATI = System::Word(0x8832);
static const System::Word GL_DRAW_BUFFER14_ATI = System::Word(0x8833);
static const System::Word GL_DRAW_BUFFER15_ATI = System::Word(0x8834);
static const System::Word WGL_TYPE_RGBA_FLOAT_ATI = System::Word(0x21a0);
static const System::Word GL_TYPE_RGBA_FLOAT_ATI = System::Word(0x8820);
static const System::Word GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI = System::Word(0x8835);
static const System::Word GL_RGBA_FLOAT32_ATI = System::Word(0x8814);
static const System::Word GL_RGB_FLOAT32_ATI = System::Word(0x8815);
static const System::Word GL_ALPHA_FLOAT32_ATI = System::Word(0x8816);
static const System::Word GL_INTENSITY_FLOAT32_ATI = System::Word(0x8817);
static const System::Word GL_LUMINANCE_FLOAT32_ATI = System::Word(0x8818);
static const System::Word GL_LUMINANCE_ALPHA_FLOAT32_ATI = System::Word(0x8819);
static const System::Word GL_RGBA_FLOAT16_ATI = System::Word(0x881a);
static const System::Word GL_RGB_FLOAT16_ATI = System::Word(0x881b);
static const System::Word GL_ALPHA_FLOAT16_ATI = System::Word(0x881c);
static const System::Word GL_INTENSITY_FLOAT16_ATI = System::Word(0x881d);
static const System::Word GL_LUMINANCE_FLOAT16_ATI = System::Word(0x881e);
static const System::Word GL_LUMINANCE_ALPHA_FLOAT16_ATI = System::Word(0x881f);
static const System::Word GL_FLOAT_R_NV = System::Word(0x8880);
static const System::Word GL_FLOAT_RG_NV = System::Word(0x8881);
static const System::Word GL_FLOAT_RGB_NV = System::Word(0x8882);
static const System::Word GL_FLOAT_RGBA_NV = System::Word(0x8883);
static const System::Word GL_FLOAT_R16_NV = System::Word(0x8884);
static const System::Word GL_FLOAT_R32_NV = System::Word(0x8885);
static const System::Word GL_FLOAT_RG16_NV = System::Word(0x8886);
static const System::Word GL_FLOAT_RG32_NV = System::Word(0x8887);
static const System::Word GL_FLOAT_RGB16_NV = System::Word(0x8888);
static const System::Word GL_FLOAT_RGB32_NV = System::Word(0x8889);
static const System::Word GL_FLOAT_RGBA16_NV = System::Word(0x888a);
static const System::Word GL_FLOAT_RGBA32_NV = System::Word(0x888b);
static const System::Word GL_TEXTURE_FLOAT_COMPONENTS_NV = System::Word(0x888c);
static const System::Word GL_FLOAT_CLEAR_COLOR_VALUE_NV = System::Word(0x888d);
static const System::Word GL_FLOAT_RGBA_MODE_NV = System::Word(0x888e);
static const System::Word WGL_FLOAT_COMPONENTS_NV = System::Word(0x20b0);
static const System::Word WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_R_NV = System::Word(0x20b1);
static const System::Word WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RG_NV = System::Word(0x20b2);
static const System::Word WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGB_NV = System::Word(0x20b3);
static const System::Word WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGBA_NV = System::Word(0x20b4);
static const System::Word WGL_TEXTURE_FLOAT_R_NV = System::Word(0x20b5);
static const System::Word WGL_TEXTURE_FLOAT_RG_NV = System::Word(0x20b6);
static const System::Word WGL_TEXTURE_FLOAT_RGB_NV = System::Word(0x20b7);
static const System::Word WGL_TEXTURE_FLOAT_RGBA_NV = System::Word(0x20b8);
static const System::Word GLX_FLOAT_COMPONENTS_NV = System::Word(0x20b0);
static const System::Word GL_PRIMITIVE_RESTART_NV = System::Word(0x8558);
static const System::Word GL_PRIMITIVE_RESTART_INDEX_NV = System::Word(0x8559);
static const System::Word GL_DEPTH_BOUNDS_TEST_EXT = System::Word(0x8890);
static const System::Word GL_DEPTH_BOUNDS_EXT = System::Word(0x8891);
static const System::Word GL_MIRROR_CLAMP_EXT = System::Word(0x8742);
static const System::Word GL_MIRROR_CLAMP_TO_EDGE_EXT = System::Word(0x8743);
static const System::Word GL_MIRROR_CLAMP_TO_BORDER_EXT = System::Word(0x8912);
static const System::Word GL_BLEND_EQUATION_RGB_EXT = System::Word(0x8009);
static const System::Word GL_BLEND_EQUATION_ALPHA_EXT = System::Word(0x883d);
static const System::Word GL_PIXEL_PACK_BUFFER_EXT = System::Word(0x88eb);
static const System::Word GL_PIXEL_UNPACK_BUFFER_EXT = System::Word(0x88ec);
static const System::Word GL_PIXEL_PACK_BUFFER_BINDING_EXT = System::Word(0x88ed);
static const System::Word GL_PIXEL_UNPACK_BUFFER_BINDING_EXT = System::Word(0x88ef);
static const System::Word GL_FRAMEBUFFER_EXT = System::Word(0x8d40);
static const System::Word GL_RENDERBUFFER_EXT = System::Word(0x8d41);
static const System::Word GL_STENCIL_INDEX1_EXT = System::Word(0x8d46);
static const System::Word GL_STENCIL_INDEX4_EXT = System::Word(0x8d47);
static const System::Word GL_STENCIL_INDEX8_EXT = System::Word(0x8d48);
static const System::Word GL_STENCIL_INDEX16_EXT = System::Word(0x8d49);
static const System::Word GL_DEPTH24_STENCIL8_EXT = System::Word(0x88f0);
static const System::Word GL_RENDERBUFFER_WIDTH_EXT = System::Word(0x8d42);
static const System::Word GL_RENDERBUFFER_HEIGHT_EXT = System::Word(0x8d43);
static const System::Word GL_RENDERBUFFER_INTERNAL_FORMAT_EXT = System::Word(0x8d44);
static const System::Word GL_RENDERBUFFER_RED_SIZE_EXT = System::Word(0x8d50);
static const System::Word GL_RENDERBUFFER_GREEN_SIZE_EXT = System::Word(0x8d51);
static const System::Word GL_RENDERBUFFER_BLUE_SIZE_EXT = System::Word(0x8d52);
static const System::Word GL_RENDERBUFFER_ALPHA_SIZE_EXT = System::Word(0x8d53);
static const System::Word GL_RENDERBUFFER_DEPTH_SIZE_EXT = System::Word(0x8d54);
static const System::Word GL_RENDERBUFFER_STENCIL_SIZE_EXT = System::Word(0x8d55);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT = System::Word(0x8cd0);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT = System::Word(0x8cd1);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT = System::Word(0x8cd2);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT = System::Word(0x8cd3);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT = System::Word(0x8cd4);
static const System::Word GL_COLOR_ATTACHMENT0_EXT = System::Word(0x8ce0);
static const System::Word GL_COLOR_ATTACHMENT1_EXT = System::Word(0x8ce1);
static const System::Word GL_COLOR_ATTACHMENT2_EXT = System::Word(0x8ce2);
static const System::Word GL_COLOR_ATTACHMENT3_EXT = System::Word(0x8ce3);
static const System::Word GL_COLOR_ATTACHMENT4_EXT = System::Word(0x8ce4);
static const System::Word GL_COLOR_ATTACHMENT5_EXT = System::Word(0x8ce5);
static const System::Word GL_COLOR_ATTACHMENT6_EXT = System::Word(0x8ce6);
static const System::Word GL_COLOR_ATTACHMENT7_EXT = System::Word(0x8ce7);
static const System::Word GL_COLOR_ATTACHMENT8_EXT = System::Word(0x8ce8);
static const System::Word GL_COLOR_ATTACHMENT9_EXT = System::Word(0x8ce9);
static const System::Word GL_COLOR_ATTACHMENT10_EXT = System::Word(0x8cea);
static const System::Word GL_COLOR_ATTACHMENT11_EXT = System::Word(0x8ceb);
static const System::Word GL_COLOR_ATTACHMENT12_EXT = System::Word(0x8cec);
static const System::Word GL_COLOR_ATTACHMENT13_EXT = System::Word(0x8ced);
static const System::Word GL_COLOR_ATTACHMENT14_EXT = System::Word(0x8cee);
static const System::Word GL_COLOR_ATTACHMENT15_EXT = System::Word(0x8cef);
static const System::Word GL_DEPTH_ATTACHMENT_EXT = System::Word(0x8d00);
static const System::Word GL_STENCIL_ATTACHMENT_EXT = System::Word(0x8d20);
static const System::Word GL_FRAMEBUFFER_COMPLETE_EXT = System::Word(0x8cd5);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT = System::Word(0x8cd6);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT = System::Word(0x8cd7);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_DUPLICATE_ATTACHMENT_EXT = System::Word(0x8cd8);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT = System::Word(0x8cd9);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT = System::Word(0x8cda);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT = System::Word(0x8cdb);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT = System::Word(0x8cdc);
static const System::Word GL_FRAMEBUFFER_UNSUPPORTED_EXT = System::Word(0x8cdd);
static const System::Word GL_FRAMEBUFFER_BINDING_EXT = System::Word(0x8ca6);
static const System::Word GL_RENDERBUFFER_BINDING_EXT = System::Word(0x8ca7);
static const System::Word GL_MAX_COLOR_ATTACHMENTS_EXT = System::Word(0x8cdf);
static const System::Word GL_MAX_RENDERBUFFER_SIZE_EXT = System::Word(0x84e8);
static const System::Word GL_INVALID_FRAMEBUFFER_OPERATION_EXT = System::Word(0x506);
static const System::Word GL_DEPTH_STENCIL_EXT = System::Word(0x84f9);
static const System::Word GL_UNSIGNED_INT_24_8_EXT = System::Word(0x84fa);
static const System::Word GL_TEXTURE_STENCIL_SIZE_EXT = System::Word(0x88f1);
static const System::Word GL_STENCIL_TAG_BITS_EXT = System::Word(0x88f2);
static const System::Word GL_STENCIL_CLEAR_TAG_VALUE_EXT = System::Word(0x88f3);
static const System::Word GL_SRGB_EXT = System::Word(0x8c40);
static const System::Word GL_SRGB8_EXT = System::Word(0x8c41);
static const System::Word GL_SRGB_ALPHA_EXT = System::Word(0x8c42);
static const System::Word GL_SRGB8_ALPHA8_EXT = System::Word(0x8c43);
static const System::Word GL_SLUMINANCE_ALPHA_EXT = System::Word(0x8c44);
static const System::Word GL_SLUMINANCE8_ALPHA8_EXT = System::Word(0x8c45);
static const System::Word GL_SLUMINANCE_EXT = System::Word(0x8c46);
static const System::Word GL_SLUMINANCE8_EXT = System::Word(0x8c47);
static const System::Word GL_COMPRESSED_SRGB_EXT = System::Word(0x8c48);
static const System::Word GL_COMPRESSED_SRGB_ALPHA_EXT = System::Word(0x8c49);
static const System::Word GL_COMPRESSED_SLUMINANCE_EXT = System::Word(0x8c4a);
static const System::Word GL_COMPRESSED_SLUMINANCE_ALPHA_EXT = System::Word(0x8c4b);
static const System::Word GL_COMPRESSED_SRGB_S3TC_DXT1_EXT = System::Word(0x8c4c);
static const System::Word GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT = System::Word(0x8c4d);
static const System::Word GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT = System::Word(0x8c4e);
static const System::Word GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT = System::Word(0x8c4f);
static const System::Word GL_READ_FRAMEBUFFER_EXT = System::Word(0x8ca8);
static const System::Word GL_DRAW_FRAMEBUFFER_EXT = System::Word(0x8ca9);
static const System::Word GL_DRAW_FRAMEBUFFER_BINDING_EXT = System::Word(0x8ca6);
static const System::Word GL_READ_FRAMEBUFFER_BINDING_EXT = System::Word(0x8caa);
static const System::Word GL_RENDERBUFFER_SAMPLES_EXT = System::Word(0x8cab);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT = System::Word(0x8d56);
static const System::Word GL_MAX_SAMPLES_EXT = System::Word(0x8d57);
static const System::Word GL_TIME_ELAPSED_EXT = System::Word(0x88bf);
static const System::Word GL_GEOMETRY_PROGRAM_NV = System::Word(0x8c26);
static const System::Word GL_MAX_PROGRAM_OUTPUT_VERTICES_NV = System::Word(0x8c27);
static const System::Word GL_MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV = System::Word(0x8c28);
static const System::Word GL_GEOMETRY_SHADER_EXT = System::Word(0x8dd9);
static const System::Word GL_GEOMETRY_VERTICES_OUT_EXT = System::Word(0x8dda);
static const System::Word GL_GEOMETRY_INPUT_TYPE_EXT = System::Word(0x8ddb);
static const System::Word GL_GEOMETRY_OUTPUT_TYPE_EXT = System::Word(0x8ddc);
static const System::Word GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT = System::Word(0x8c29);
static const System::Word GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT = System::Word(0x8ddd);
static const System::Word GL_MAX_VERTEX_VARYING_COMPONENTS_EXT = System::Word(0x8dde);
static const System::Word GL_MAX_VARYING_COMPONENTS_EXT = System::Word(0x8b4b);
static const System::Word GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT = System::Word(0x8ddf);
static const System::Word GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT = System::Word(0x8de0);
static const System::Word GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT = System::Word(0x8de1);
static const System::Int8 GL_LINES_ADJACENCY_EXT = System::Int8(0xa);
static const System::Int8 GL_LINE_STRIP_ADJACENCY_EXT = System::Int8(0xb);
static const System::Int8 GL_TRIANGLES_ADJACENCY_EXT = System::Int8(0xc);
static const System::Int8 GL_TRIANGLE_STRIP_ADJACENCY_EXT = System::Int8(0xd);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT = System::Word(0x8da8);
static const System::Word GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT = System::Word(0x8da9);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT = System::Word(0x8da7);
static const System::Word GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT = System::Word(0x8cd4);
static const System::Word GL_PROGRAM_POINT_SIZE_EXT = System::Word(0x8642);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_INTEGER_EXT = System::Word(0x88fd);
static const System::Word GL_SAMPLER_1D_ARRAY_EXT = System::Word(0x8dc0);
static const System::Word GL_SAMPLER_2D_ARRAY_EXT = System::Word(0x8dc1);
static const System::Word GL_SAMPLER_BUFFER_EXT = System::Word(0x8dc2);
static const System::Word GL_SAMPLER_1D_ARRAY_SHADOW_EXT = System::Word(0x8dc3);
static const System::Word GL_SAMPLER_2D_ARRAY_SHADOW_EXT = System::Word(0x8dc4);
static const System::Word GL_SAMPLER_CUBE_SHADOW_EXT = System::Word(0x8dc5);
static const System::Word GL_UNSIGNED_INT_VEC2_EXT = System::Word(0x8dc6);
static const System::Word GL_UNSIGNED_INT_VEC3_EXT = System::Word(0x8dc7);
static const System::Word GL_UNSIGNED_INT_VEC4_EXT = System::Word(0x8dc8);
static const System::Word GL_INT_SAMPLER_1D_EXT = System::Word(0x8dc9);
static const System::Word GL_INT_SAMPLER_2D_EXT = System::Word(0x8dca);
static const System::Word GL_INT_SAMPLER_3D_EXT = System::Word(0x8dcb);
static const System::Word GL_INT_SAMPLER_CUBE_EXT = System::Word(0x8dcc);
static const System::Word GL_INT_SAMPLER_2D_RECT_EXT = System::Word(0x8dcd);
static const System::Word GL_INT_SAMPLER_1D_ARRAY_EXT = System::Word(0x8dce);
static const System::Word GL_INT_SAMPLER_2D_ARRAY_EXT = System::Word(0x8dcf);
static const System::Word GL_INT_SAMPLER_BUFFER_EXT = System::Word(0x8dd0);
static const System::Word GL_UNSIGNED_INT_SAMPLER_1D_EXT = System::Word(0x8dd1);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D_EXT = System::Word(0x8dd2);
static const System::Word GL_UNSIGNED_INT_SAMPLER_3D_EXT = System::Word(0x8dd3);
static const System::Word GL_UNSIGNED_INT_SAMPLER_CUBE_EXT = System::Word(0x8dd4);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT = System::Word(0x8dd5);
static const System::Word GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT = System::Word(0x8dd6);
static const System::Word GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT = System::Word(0x8dd7);
static const System::Word GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT = System::Word(0x8dd8);
static const System::Word GL_MIN_PROGRAM_TEXEL_OFFSET_EXT = System::Word(0x8904);
static const System::Word GL_MAX_PROGRAM_TEXEL_OFFSET_EXT = System::Word(0x8905);
static const System::Word GL_R11F_G11F_B10F_EXT = System::Word(0x8c3a);
static const System::Word GL_UNSIGNED_INT_10F_11F_11F_REV_EXT = System::Word(0x8c3b);
static const System::Word GL_RGBA_SIGNED_COMPONENTS_EXT = System::Word(0x8c3c);
static const System::Word WGL_TYPE_RGBA_UNSIGNED_FLOAT_EXT = System::Word(0x20a8);
static const System::Word GLX_RGBA_UNSIGNED_FLOAT_TYPE_EXT = System::Word(0x20b1);
static const System::Int8 GLX_RGBA_UNSIGNED_FLOAT_BIT_EXT = System::Int8(0x8);
static const System::Word GL_TEXTURE_1D_ARRAY_EXT = System::Word(0x8c18);
static const System::Word GL_TEXTURE_2D_ARRAY_EXT = System::Word(0x8c1a);
static const System::Word GL_PROXY_TEXTURE_2D_ARRAY_EXT = System::Word(0x8c1b);
static const System::Word GL_PROXY_TEXTURE_1D_ARRAY_EXT = System::Word(0x8c19);
static const System::Word GL_TEXTURE_BINDING_1D_ARRAY_EXT = System::Word(0x8c1c);
static const System::Word GL_TEXTURE_BINDING_2D_ARRAY_EXT = System::Word(0x8c1d);
static const System::Word GL_MAX_ARRAY_TEXTURE_LAYERS_EXT = System::Word(0x88ff);
static const System::Word GL_COMPARE_REF_DEPTH_TO_TEXTURE_EXT = System::Word(0x884e);
static const System::Word GL_TEXTURE_BUFFER_EXT = System::Word(0x8c2a);
static const System::Word GL_MAX_TEXTURE_BUFFER_SIZE_EXT = System::Word(0x8c2b);
static const System::Word GL_TEXTURE_BINDING_BUFFER_EXT = System::Word(0x8c2c);
static const System::Word GL_TEXTURE_BUFFER_DATA_STORE_BINDING_EXT = System::Word(0x8c2d);
static const System::Word GL_TEXTURE_BUFFER_FORMAT_EXT = System::Word(0x8c2e);
static const System::Word GL_COMPRESSED_LUMINANCE_LATC1_EXT = System::Word(0x8c70);
static const System::Word GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT = System::Word(0x8c71);
static const System::Word GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT = System::Word(0x8c72);
static const System::Word GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT = System::Word(0x8c73);
static const System::Word GL_COMPRESSED_LUMINANCE_ALPHA_3DC_ATI = System::Word(0x8837);
static const System::Word GL_COMPRESSED_RED_RGTC1_EXT = System::Word(0x8dbb);
static const System::Word GL_COMPRESSED_SIGNED_RED_RGTC1_EXT = System::Word(0x8dbc);
static const System::Word GL_COMPRESSED_RED_GREEN_RGTC2_EXT = System::Word(0x8dbd);
static const System::Word GL_COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT = System::Word(0x8dbe);
static const System::Word GL_RGB9_E5_EXT = System::Word(0x8c3d);
static const System::Word GL_UNSIGNED_INT_5_9_9_9_REV_EXT = System::Word(0x8c3e);
static const System::Word GL_TEXTURE_SHARED_SIZE_EXT = System::Word(0x8c3f);
static const System::Word GLX_FRAMEBUFFER_SRGB_CAPABLE_EXT = System::Word(0x20b2);
static const System::Word WGL_FRAMEBUFFER_SRGB_CAPABLE_EXT = System::Word(0x20a9);
static const System::Word GL_FRAMEBUFFER_SRGB_EXT = System::Word(0x8db9);
static const System::Word GL_FRAMEBUFFER_SRGB_CAPABLE_EXT = System::Word(0x8dba);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_NV = System::Word(0x8c8e);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_START_NV = System::Word(0x8c84);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV = System::Word(0x8c85);
static const System::Word GL_TRANSFORM_FEEDBACK_RECORD_NV = System::Word(0x8c86);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV = System::Word(0x8c8f);
static const System::Word GL_INTERLEAVED_ATTRIBS_NV = System::Word(0x8c8c);
static const System::Word GL_SEPARATE_ATTRIBS_NV = System::Word(0x8c8d);
static const System::Word GL_PRIMITIVES_GENERATED_NV = System::Word(0x8c87);
static const System::Word GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV = System::Word(0x8c88);
static const System::Word GL_RASTERIZER_DISCARD_NV = System::Word(0x8c89);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_NV = System::Word(0x8c8a);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV = System::Word(0x8c8b);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV = System::Word(0x8c80);
static const System::Word GL_TRANSFORM_FEEDBACK_ATTRIBS_NV = System::Word(0x8c7e);
static const System::Word GL_ACTIVE_VARYINGS_NV = System::Word(0x8c81);
static const System::Word GL_ACTIVE_VARYING_MAX_LENGTH_NV = System::Word(0x8c82);
static const System::Word GL_TRANSFORM_FEEDBACK_VARYINGS_NV = System::Word(0x8c83);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV = System::Word(0x8c7f);
static const System::Word GL_BACK_PRIMARY_COLOR_NV = System::Word(0x8c77);
static const System::Word GL_BACK_SECONDARY_COLOR_NV = System::Word(0x8c78);
static const System::Word GL_TEXTURE_COORD_NV = System::Word(0x8c79);
static const System::Word GL_CLIP_DISTANCE_NV = System::Word(0x8c7a);
static const System::Word GL_VERTEX_ID_NV = System::Word(0x8c7b);
static const System::Word GL_PRIMITIVE_ID_NV = System::Word(0x8c7c);
static const System::Word GL_GENERIC_ATTRIB_NV = System::Word(0x8c7d);
static const System::Word GL_LAYER_NV = System::Word(0x8daa);
static const System::Word GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT = System::Word(0x8de2);
static const System::Word GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT = System::Word(0x8de3);
static const System::Word GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT = System::Word(0x8de4);
static const System::Word GL_MAX_BINDABLE_UNIFORM_SIZE_EXT = System::Word(0x8ded);
static const System::Word GL_UNIFORM_BUFFER_BINDING_EXT = System::Word(0x8def);
static const System::Word GL_UNIFORM_BUFFER_EXT = System::Word(0x8dee);
static const System::Word GL_RGBA_INTEGER_MODE_EXT = System::Word(0x8d9e);
static const System::Word GL_RGBA32UI_EXT = System::Word(0x8d70);
static const System::Word GL_RGB32UI_EXT = System::Word(0x8d71);
static const System::Word GL_ALPHA32UI_EXT = System::Word(0x8d72);
static const System::Word GL_INTENSITY32UI_EXT = System::Word(0x8d73);
static const System::Word GL_LUMINANCE32UI_EXT = System::Word(0x8d74);
static const System::Word GL_LUMINANCE_ALPHA32UI_EXT = System::Word(0x8d75);
static const System::Word GL_RGBA16UI_EXT = System::Word(0x8d76);
static const System::Word GL_RGB16UI_EXT = System::Word(0x8d77);
static const System::Word GL_ALPHA16UI_EXT = System::Word(0x8d78);
static const System::Word GL_INTENSITY16UI_EXT = System::Word(0x8d79);
static const System::Word GL_LUMINANCE16UI_EXT = System::Word(0x8d7a);
static const System::Word GL_LUMINANCE_ALPHA16UI_EXT = System::Word(0x8d7b);
static const System::Word GL_RGBA8UI_EXT = System::Word(0x8d7c);
static const System::Word GL_RGB8UI_EXT = System::Word(0x8d7d);
static const System::Word GL_ALPHA8UI_EXT = System::Word(0x8d7e);
static const System::Word GL_INTENSITY8UI_EXT = System::Word(0x8d7f);
static const System::Word GL_LUMINANCE8UI_EXT = System::Word(0x8d80);
static const System::Word GL_LUMINANCE_ALPHA8UI_EXT = System::Word(0x8d81);
static const System::Word GL_RGBA32I_EXT = System::Word(0x8d82);
static const System::Word GL_RGB32I_EXT = System::Word(0x8d83);
static const System::Word GL_ALPHA32I_EXT = System::Word(0x8d84);
static const System::Word GL_INTENSITY32I_EXT = System::Word(0x8d85);
static const System::Word GL_LUMINANCE32I_EXT = System::Word(0x8d86);
static const System::Word GL_LUMINANCE_ALPHA32I_EXT = System::Word(0x8d87);
static const System::Word GL_RGBA16I_EXT = System::Word(0x8d88);
static const System::Word GL_RGB16I_EXT = System::Word(0x8d89);
static const System::Word GL_ALPHA16I_EXT = System::Word(0x8d8a);
static const System::Word GL_INTENSITY16I_EXT = System::Word(0x8d8b);
static const System::Word GL_LUMINANCE16I_EXT = System::Word(0x8d8c);
static const System::Word GL_LUMINANCE_ALPHA16I_EXT = System::Word(0x8d8d);
static const System::Word GL_RGBA8I_EXT = System::Word(0x8d8e);
static const System::Word GL_RGB8I_EXT = System::Word(0x8d8f);
static const System::Word GL_ALPHA8I_EXT = System::Word(0x8d90);
static const System::Word GL_INTENSITY8I_EXT = System::Word(0x8d91);
static const System::Word GL_LUMINANCE8I_EXT = System::Word(0x8d92);
static const System::Word GL_LUMINANCE_ALPHA8I_EXT = System::Word(0x8d93);
static const System::Word GL_RED_INTEGER_EXT = System::Word(0x8d94);
static const System::Word GL_GREEN_INTEGER_EXT = System::Word(0x8d95);
static const System::Word GL_BLUE_INTEGER_EXT = System::Word(0x8d96);
static const System::Word GL_ALPHA_INTEGER_EXT = System::Word(0x8d97);
static const System::Word GL_RGB_INTEGER_EXT = System::Word(0x8d98);
static const System::Word GL_RGBA_INTEGER_EXT = System::Word(0x8d99);
static const System::Word GL_BGR_INTEGER_EXT = System::Word(0x8d9a);
static const System::Word GL_BGRA_INTEGER_EXT = System::Word(0x8d9b);
static const System::Word GL_LUMINANCE_INTEGER_EXT = System::Word(0x8d9c);
static const System::Word GL_LUMINANCE_ALPHA_INTEGER_EXT = System::Word(0x8d9d);
static const System::Word GL_QUERY_WAIT_NV = System::Word(0x8e13);
static const System::Word GL_QUERY_NO_WAIT_NV = System::Word(0x8e14);
static const System::Word GL_QUERY_BY_REGION_WAIT_NV = System::Word(0x8e15);
static const System::Word GL_QUERY_BY_REGION_NO_WAIT_NV = System::Word(0x8e16);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_EXT = System::Word(0x8c8e);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT = System::Word(0x8c84);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT = System::Word(0x8c85);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT = System::Word(0x8c8f);
static const System::Word GL_INTERLEAVED_ATTRIBS_EXT = System::Word(0x8c8c);
static const System::Word GL_SEPARATE_ATTRIBS_EXT = System::Word(0x8c8d);
static const System::Word GL_PRIMITIVES_GENERATED_EXT = System::Word(0x8c87);
static const System::Word GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT = System::Word(0x8c88);
static const System::Word GL_RASTERIZER_DISCARD_EXT = System::Word(0x8c89);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT = System::Word(0x8c8a);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT = System::Word(0x8c8b);
static const System::Word GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT = System::Word(0x8c80);
static const System::Word GL_TRANSFORM_FEEDBACK_VARYINGS_EXT = System::Word(0x8c83);
static const System::Word GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT = System::Word(0x8c7f);
static const System::Word GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT = System::Word(0x8c76);
static const System::Word GL_VBO_FREE_MEMORY_ATI = System::Word(0x87fb);
static const System::Word GL_TEXTURE_FREE_MEMORY_ATI = System::Word(0x87fc);
static const System::Word GL_RENDERBUFFER_FREE_MEMORY_ATI = System::Word(0x87fd);
static const System::Word GL_SAMPLER_BUFFER_AMD = System::Word(0x9001);
static const System::Word GL_INT_SAMPLER_BUFFER_AMD = System::Word(0x9002);
static const System::Word GL_UNSIGNED_INT_SAMPLER_BUFFER_AMD = System::Word(0x9003);
static const System::Word GL_DISCRETE_AMD = System::Word(0x9006);
static const System::Word GL_CONTINUOUS_AMD = System::Word(0x9007);
static const System::Word GL_TESSELLATION_MODE_AMD = System::Word(0x9004);
static const System::Word GL_TESSELLATION_FACTOR_AMD = System::Word(0x9005);
static const System::Word GL_BUFFER_GPU_ADDRESS_NV = System::Word(0x8f1d);
static const System::Word GL_GPU_ADDRESS_NV = System::Word(0x8f34);
static const System::Word GL_MAX_SHADER_BUFFER_ADDRESS_NV = System::Word(0x8f35);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV = System::Word(0x8f1e);
static const System::Word GL_ELEMENT_ARRAY_UNIFIED_NV = System::Word(0x8f1f);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV = System::Word(0x8f20);
static const System::Word GL_VERTEX_ARRAY_ADDRESS_NV = System::Word(0x8f21);
static const System::Word GL_NORMAL_ARRAY_ADDRESS_NV = System::Word(0x8f22);
static const System::Word GL_COLOR_ARRAY_ADDRESS_NV = System::Word(0x8f23);
static const System::Word GL_INDEX_ARRAY_ADDRESS_NV = System::Word(0x8f24);
static const System::Word GL_TEXTURE_COORD_ARRAY_ADDRESS_NV = System::Word(0x8f25);
static const System::Word GL_EDGE_FLAG_ARRAY_ADDRESS_NV = System::Word(0x8f26);
static const System::Word GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV = System::Word(0x8f27);
static const System::Word GL_FOG_COORD_ARRAY_ADDRESS_NV = System::Word(0x8f28);
static const System::Word GL_ELEMENT_ARRAY_ADDRESS_NV = System::Word(0x8f29);
static const System::Word GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV = System::Word(0x8f2a);
static const System::Word GL_VERTEX_ARRAY_LENGTH_NV = System::Word(0x8f2b);
static const System::Word GL_NORMAL_ARRAY_LENGTH_NV = System::Word(0x8f2c);
static const System::Word GL_COLOR_ARRAY_LENGTH_NV = System::Word(0x8f2d);
static const System::Word GL_INDEX_ARRAY_LENGTH_NV = System::Word(0x8f2e);
static const System::Word GL_TEXTURE_COORD_ARRAY_LENGTH_NV = System::Word(0x8f2f);
static const System::Word GL_EDGE_FLAG_ARRAY_LENGTH_NV = System::Word(0x8f30);
static const System::Word GL_SECONDARY_COLOR_ARRAY_LENGTH_NV = System::Word(0x8f31);
static const System::Word GL_FOG_COORD_ARRAY_LENGTH_NV = System::Word(0x8f32);
static const System::Word GL_ELEMENT_ARRAY_LENGTH_NV = System::Word(0x8f33);
static const System::Word GL_SURFACE_STATE_NV = System::Word(0x86eb);
static const System::Word GL_SURFACE_REGISTERED_NV = System::Word(0x86fd);
static const System::Word GL_SURFACE_MAPPED_NV = System::Word(0x8700);
static const System::Word GL_WRITE_DISCARD_NV = System::Word(0x88be);
static const System::Word WGL_COLOR_SAMPLES_NV = System::Word(0x20b9);
static const System::Word GL_GPU_MEMORY_INFO_DEDICATED_VIDMEM_NVX = System::Word(0x9047);
static const System::Word GL_GPU_MEMORY_INFO_TOTAL_AVAILABLE_MEMORY_NVX = System::Word(0x9048);
static const System::Word GL_GPU_MEMORY_INFO_CURRENT_AVAILABLE_VIDMEM_NVX = System::Word(0x9049);
static const System::Word GL_GPU_MEMORY_INFO_EVICTION_COUNT_NVX = System::Word(0x904a);
static const System::Word GL_GPU_MEMORY_INFO_EVICTED_MEMORY_NVX = System::Word(0x904b);
static const System::Word GL_TEXTURE_SRGB_DECODE_EXT = System::Word(0x8a48);
static const System::Word GL_DECODE_EXT = System::Word(0x8a49);
static const System::Word GL_SKIP_DECODE_EXT = System::Word(0x8a4a);
static const System::Int8 GL_CLOSE_PATH_NV = System::Int8(0x0);
static const System::Int8 GL_MOVE_TO_NV = System::Int8(0x2);
static const System::Int8 GL_RELATIVE_MOVE_TO_NV = System::Int8(0x3);
static const System::Int8 GL_LINE_TO_NV = System::Int8(0x4);
static const System::Int8 GL_RELATIVE_LINE_TO_NV = System::Int8(0x5);
static const System::Int8 GL_HORIZONTAL_LINE_TO_NV = System::Int8(0x6);
static const System::Int8 GL_RELATIVE_HORIZONTAL_LINE_TO_NV = System::Int8(0x7);
static const System::Int8 GL_VERTICAL_LINE_TO_NV = System::Int8(0x8);
static const System::Int8 GL_RELATIVE_VERTICAL_LINE_TO_NV = System::Int8(0x9);
static const System::Int8 GL_QUADRATIC_CURVE_TO_NV = System::Int8(0xa);
static const System::Int8 GL_RELATIVE_QUADRATIC_CURVE_TO_NV = System::Int8(0xb);
static const System::Int8 GL_CUBIC_CURVE_TO_NV = System::Int8(0xc);
static const System::Int8 GL_RELATIVE_CUBIC_CURVE_TO_NV = System::Int8(0xd);
static const System::Int8 GL_SMOOTH_QUADRATIC_CURVE_TO_NV = System::Int8(0xe);
static const System::Int8 GL_RELATIVE_SMOOTH_QUADRATIC_CURVE_TO_NV = System::Int8(0xf);
static const System::Int8 GL_SMOOTH_CUBIC_CURVE_TO_NV = System::Int8(0x10);
static const System::Int8 GL_RELATIVE_SMOOTH_CUBIC_CURVE_TO_NV = System::Int8(0x11);
static const System::Int8 GL_SMALL_CCW_ARC_TO_NV = System::Int8(0x12);
static const System::Int8 GL_RELATIVE_SMALL_CCW_ARC_TO_NV = System::Int8(0x13);
static const System::Int8 GL_SMALL_CW_ARC_TO_NV = System::Int8(0x14);
static const System::Int8 GL_RELATIVE_SMALL_CW_ARC_TO_NV = System::Int8(0x15);
static const System::Int8 GL_LARGE_CCW_ARC_TO_NV = System::Int8(0x16);
static const System::Int8 GL_RELATIVE_LARGE_CCW_ARC_TO_NV = System::Int8(0x17);
static const System::Int8 GL_LARGE_CW_ARC_TO_NV = System::Int8(0x18);
static const System::Int8 GL_RELATIVE_LARGE_CW_ARC_TO_NV = System::Int8(0x19);
static const System::Byte GL_CIRCULAR_CCW_ARC_TO_NV = System::Byte(0xf8);
static const System::Byte GL_CIRCULAR_CW_ARC_TO_NV = System::Byte(0xfa);
static const System::Byte GL_CIRCULAR_TANGENT_ARC_TO_NV = System::Byte(0xfc);
static const System::Byte GL_ARC_TO_NV = System::Byte(0xfe);
static const System::Byte GL_RELATIVE_ARC_TO_NV = System::Byte(0xff);
static const System::Word GL_PATH_FORMAT_SVG_NV = System::Word(0x9070);
static const System::Word GL_PATH_FORMAT_PS_NV = System::Word(0x9071);
static const System::Word GL_STANDARD_FONT_NAME_NV = System::Word(0x9072);
static const System::Word GL_SYSTEM_FONT_NAME_NV = System::Word(0x9073);
static const System::Word GL_FILE_NAME_NV = System::Word(0x9074);
static const System::Word GL_PATH_STROKE_WIDTH_NV = System::Word(0x9075);
static const System::Word GL_PATH_END_CAPS_NV = System::Word(0x9076);
static const System::Word GL_PATH_INITIAL_END_CAP_NV = System::Word(0x9077);
static const System::Word GL_PATH_TERMINAL_END_CAP_NV = System::Word(0x9078);
static const System::Word GL_PATH_JOIN_STYLE_NV = System::Word(0x9079);
static const System::Word GL_PATH_MITER_LIMIT_NV = System::Word(0x907a);
static const System::Word GL_PATH_DASH_CAPS_NV = System::Word(0x907b);
static const System::Word GL_PATH_INITIAL_DASH_CAP_NV = System::Word(0x907c);
static const System::Word GL_PATH_TERMINAL_DASH_CAP_NV = System::Word(0x907d);
static const System::Word GL_PATH_DASH_OFFSET_NV = System::Word(0x907e);
static const System::Word GL_PATH_CLIENT_LENGTH_NV = System::Word(0x907f);
static const System::Word GL_PATH_FILL_MODE_NV = System::Word(0x9080);
static const System::Word GL_PATH_FILL_MASK_NV = System::Word(0x9081);
static const System::Word GL_PATH_FILL_COVER_MODE_NV = System::Word(0x9082);
static const System::Word GL_PATH_STROKE_COVER_MODE_NV = System::Word(0x9083);
static const System::Word GL_PATH_STROKE_MASK_NV = System::Word(0x9084);
static const System::Word GL_PATH_SAMPLE_QUALITY_NV = System::Word(0x9085);
static const System::Word GL_COUNT_UP_NV = System::Word(0x9088);
static const System::Word GL_COUNT_DOWN_NV = System::Word(0x9089);
static const System::Word GL_PATH_OBJECT_BOUNDING_BOX_NV = System::Word(0x908a);
static const System::Word GL_CONVEX_HULL_NV = System::Word(0x908b);
static const System::Word GL_BOUNDING_BOX_NV = System::Word(0x908d);
static const System::Word GL_TRANSLATE_X_NV = System::Word(0x908e);
static const System::Word GL_TRANSLATE_Y_NV = System::Word(0x908f);
static const System::Word GL_TRANSLATE_2D_NV = System::Word(0x9090);
static const System::Word GL_TRANSLATE_3D_NV = System::Word(0x9091);
static const System::Word GL_AFFINE_2D_NV = System::Word(0x9092);
static const System::Word GL_AFFINE_3D_NV = System::Word(0x9094);
static const System::Word GL_TRANSPOSE_AFFINE_2D_NV = System::Word(0x9096);
static const System::Word GL_TRANSPOSE_AFFINE_3D_NV = System::Word(0x9098);
static const System::Word GL_UTF8_NV = System::Word(0x909a);
static const System::Word GL_UTF16_NV = System::Word(0x909b);
static const System::Word GL_BOUNDING_BOX_OF_BOUNDING_BOXES_NV = System::Word(0x909c);
static const System::Word GL_PATH_COMMAND_COUNT_NV = System::Word(0x909d);
static const System::Word GL_PATH_COORD_COUNT_NV = System::Word(0x909e);
static const System::Word GL_PATH_DASH_ARRAY_COUNT_NV = System::Word(0x909f);
static const System::Word GL_PATH_COMPUTED_LENGTH_NV = System::Word(0x90a0);
static const System::Word GL_PATH_FILL_BOUNDING_BOX_NV = System::Word(0x90a1);
static const System::Word GL_PATH_STROKE_BOUNDING_BOX_NV = System::Word(0x90a2);
static const System::Word GL_SQUARE_NV = System::Word(0x90a3);
static const System::Word GL_ROUND_NV = System::Word(0x90a4);
static const System::Word GL_TRIANGULAR_NV = System::Word(0x90a5);
static const System::Word GL_BEVEL_NV = System::Word(0x90a6);
static const System::Word GL_MITER_REVERT_NV = System::Word(0x90a7);
static const System::Word GL_MITER_TRUNCATE_NV = System::Word(0x90a8);
static const System::Word GL_SKIP_MISSING_GLYPH_NV = System::Word(0x90a9);
static const System::Word GL_USE_MISSING_GLYPH_NV = System::Word(0x90aa);
static const System::Word GL_PATH_DASH_OFFSET_RESET_NV = System::Word(0x90b4);
static const System::Word GL_MOVE_TO_RESETS_NV = System::Word(0x90b5);
static const System::Word GL_MOVE_TO_CONTINUES_NV = System::Word(0x90b6);
static const System::Int8 GL_BOLD_BIT_NV = System::Int8(0x1);
static const System::Int8 GL_ITALIC_BIT_NV = System::Int8(0x2);
static const System::Word GL_PATH_ERROR_POSITION_NV = System::Word(0x90ab);
static const System::Word GL_PATH_FOG_GEN_MODE_NV = System::Word(0x90ac);
static const System::Int8 GL_GLYPH_WIDTH_BIT_NV = System::Int8(0x1);
static const System::Int8 GL_GLYPH_HEIGHT_BIT_NV = System::Int8(0x2);
static const System::Int8 GL_GLYPH_HORIZONTAL_BEARING_X_BIT_NV = System::Int8(0x4);
static const System::Int8 GL_GLYPH_HORIZONTAL_BEARING_Y_BIT_NV = System::Int8(0x8);
static const System::Int8 GL_GLYPH_HORIZONTAL_BEARING_ADVANCE_BIT_NV = System::Int8(0x10);
static const System::Int8 GL_GLYPH_VERTICAL_BEARING_X_BIT_NV = System::Int8(0x20);
static const System::Int8 GL_GLYPH_VERTICAL_BEARING_Y_BIT_NV = System::Int8(0x40);
static const System::Byte GL_GLYPH_VERTICAL_BEARING_ADVANCE_BIT_NV = System::Byte(0x80);
static const System::Word GL_GLYPH_HAS_KERNING_NV = System::Word(0x100);
static const int GL_FONT_X_MIN_BOUNDS_NV = int(0x10000);
static const int GL_FONT_Y_MIN_BOUNDS_NV = int(0x20000);
static const int GL_FONT_X_MAX_BOUNDS_NV = int(0x40000);
static const int GL_FONT_Y_MAX_BOUNDS_NV = int(0x80000);
static const int GL_FONT_UNITS_PER_EM_NV = int(0x100000);
static const int GL_FONT_ASCENDER_NV = int(0x200000);
static const int GL_FONT_DESCENDER_NV = int(0x400000);
static const int GL_FONT_HEIGHT_NV = int(0x800000);
static const int GL_FONT_MAX_ADVANCE_WIDTH_NV = int(0x1000000);
static const int GL_FONT_MAX_ADVANCE_HEIGHT_NV = int(0x2000000);
static const int GL_FONT_UNDERLINE_POSITION_NV = int(0x4000000);
static const int GL_FONT_UNDERLINE_THICKNESS_NV = int(0x8000000);
static const int GL_FONT_HAS_KERNING_NV = int(0x10000000);
static const System::Word GL_ACCUM_ADJACENT_PAIRS_NV = System::Word(0x90ad);
static const System::Word GL_ADJACENT_PAIRS_NV = System::Word(0x90ae);
static const System::Word GL_FIRST_TO_REST_NV = System::Word(0x90af);
static const System::Word GL_PATH_GEN_MODE_NV = System::Word(0x90b0);
static const System::Word GL_PATH_GEN_COEFF_NV = System::Word(0x90b1);
static const System::Word GL_PATH_GEN_COLOR_FORMAT_NV = System::Word(0x90b2);
static const System::Word GL_PATH_GEN_COMPONENTS_NV = System::Word(0x90b3);
static const System::Word GL_PATH_STENCIL_FUNC_NV = System::Word(0x90b7);
static const System::Word GL_PATH_STENCIL_REF_NV = System::Word(0x90b8);
static const System::Word GL_PATH_STENCIL_VALUE_MASK_NV = System::Word(0x90b9);
static const System::Word GL_PATH_STENCIL_DEPTH_OFFSET_FACTOR_NV = System::Word(0x90bd);
static const System::Word GL_PATH_STENCIL_DEPTH_OFFSET_UNITS_NV = System::Word(0x90be);
static const System::Word GL_PATH_COVER_DEPTH_FUNC_NV = System::Word(0x90bf);
static const System::Int8 WGL_ACCESS_READ_ONLY_NV = System::Int8(0x0);
static const System::Int8 WGL_ACCESS_READ_WRITE_NV = System::Int8(0x1);
static const System::Int8 WGL_ACCESS_WRITE_DISCARD_NV = System::Int8(0x2);
#define GLX_EXTENSION_NAME L"GLX"
static const System::Int8 GLX_USE_GL = System::Int8(0x1);
static const System::Int8 GLX_BUFFER_SIZE = System::Int8(0x2);
static const System::Int8 GLX_LEVEL = System::Int8(0x3);
static const System::Int8 GLX_RGBA = System::Int8(0x4);
static const System::Int8 GLX_DOUBLEBUFFER = System::Int8(0x5);
static const System::Int8 GLX_STEREO = System::Int8(0x6);
static const System::Int8 GLX_AUX_BUFFERS = System::Int8(0x7);
static const System::Int8 GLX_RED_SIZE = System::Int8(0x8);
static const System::Int8 GLX_GREEN_SIZE = System::Int8(0x9);
static const System::Int8 GLX_BLUE_SIZE = System::Int8(0xa);
static const System::Int8 GLX_ALPHA_SIZE = System::Int8(0xb);
static const System::Int8 GLX_DEPTH_SIZE = System::Int8(0xc);
static const System::Int8 GLX_STENCIL_SIZE = System::Int8(0xd);
static const System::Int8 GLX_ACCUM_RED_SIZE = System::Int8(0xe);
static const System::Int8 GLX_ACCUM_GREEN_SIZE = System::Int8(0xf);
static const System::Int8 GLX_ACCUM_BLUE_SIZE = System::Int8(0x10);
static const System::Int8 GLX_ACCUM_ALPHA_SIZE = System::Int8(0x11);
static const System::Int8 GLX_BAD_SCREEN = System::Int8(0x1);
static const System::Int8 GLX_BAD_ATTRIBUTE = System::Int8(0x2);
static const System::Int8 GLX_NO_EXTENSION = System::Int8(0x3);
static const System::Int8 GLX_BAD_VISUAL = System::Int8(0x4);
static const System::Int8 GLX_BAD_CONTEXT = System::Int8(0x5);
static const System::Int8 GLX_BAD_VALUE = System::Int8(0x6);
static const System::Int8 GLX_BAD_ENUM = System::Int8(0x7);
static const System::Int8 GLX_BAD_HYPERPIPE_CONFIG_SGIX = System::Int8(0x5b);
static const System::Int8 GLX_BAD_HYPERPIPE_SGIX = System::Int8(0x5c);
static const System::Int8 GLX_VENDOR = System::Int8(0x1);
static const System::Int8 GLX_VERSION = System::Int8(0x2);
static const System::Int8 GLX_EXTENSIONS = System::Int8(0x3);
static const System::Int8 GLX_CONFIG_CAVEAT = System::Int8(0x20);
static const System::Word GLX_NONE = System::Word(0x8000);
static const unsigned GLX_DONT_CARE = unsigned(0xffffffff);
static const System::Word GLX_SLOW_CONFIG = System::Word(0x8001);
static const System::Word GLX_NON_CONFORMANT_CONFIG = System::Word(0x800d);
static const System::Int8 GLX_X_VISUAL_TYPE = System::Int8(0x22);
static const System::Int8 GLX_TRANSPARENT_TYPE = System::Int8(0x23);
static const System::Int8 GLX_TRANSPARENT_INDEX_VALUE = System::Int8(0x24);
static const System::Int8 GLX_TRANSPARENT_RED_VALUE = System::Int8(0x25);
static const System::Int8 GLX_TRANSPARENT_GREEN_VALUE = System::Int8(0x26);
static const System::Int8 GLX_TRANSPARENT_BLUE_VALUE = System::Int8(0x27);
static const System::Int8 GLX_TRANSPARENT_ALPHA_VALUE = System::Int8(0x28);
static const System::Word GLX_TRUE_COLOR = System::Word(0x8002);
static const System::Word GLX_DIRECT_COLOR = System::Word(0x8003);
static const System::Word GLX_PSEUDO_COLOR = System::Word(0x8004);
static const System::Word GLX_STATIC_COLOR = System::Word(0x8005);
static const System::Word GLX_GRAY_SCALE = System::Word(0x8006);
static const System::Word GLX_STATIC_GRAY = System::Word(0x8007);
static const System::Word GLX_TRANSPARENT_RGB = System::Word(0x8008);
static const System::Word GLX_TRANSPARENT_INDEX = System::Word(0x8009);
static const System::Word GLX_MAX_PBUFFER_WIDTH = System::Word(0x8016);
static const System::Word GLX_MAX_PBUFFER_HEIGHT = System::Word(0x8017);
static const System::Word GLX_MAX_PBUFFER_PIXELS = System::Word(0x8018);
static const System::Word GLX_PRESERVED_CONTENTS = System::Word(0x801b);
static const System::Word GLX_LARGEST_BUFFER = System::Word(0x801c);
static const System::Word GLX_WIDTH = System::Word(0x801d);
static const System::Word GLX_HEIGHT = System::Word(0x801e);
static const System::Word GLX_EVENT_MASK = System::Word(0x801f);
static const System::Word GLX_DRAWABLE_TYPE = System::Word(0x8010);
static const System::Word GLX_FBCONFIG_ID = System::Word(0x8013);
static const System::Word GLX_VISUAL_ID = System::Word(0x800b);
static const System::Int8 GLX_WINDOW_BIT = System::Int8(0x1);
static const System::Int8 GLX_PIXMAP_BIT = System::Int8(0x2);
static const System::Int8 GLX_PBUFFER_BIT = System::Int8(0x4);
static const System::Int8 GLX_WINDOW_BIT_SGIX = System::Int8(0x1);
static const System::Int8 GLX_PIXMAP_BIT_SGIX = System::Int8(0x2);
static const System::Int8 GLX_PBUFFER_BIT_SGIX = System::Int8(0x4);
static const System::Int8 GLX_AUX_BUFFERS_BIT = System::Int8(0x10);
static const System::Int8 GLX_FRONT_LEFT_BUFFER_BIT = System::Int8(0x1);
static const System::Int8 GLX_FRONT_RIGHT_BUFFER_BIT = System::Int8(0x2);
static const System::Int8 GLX_BACK_LEFT_BUFFER_BIT = System::Int8(0x4);
static const System::Int8 GLX_BACK_RIGHT_BUFFER_BIT = System::Int8(0x8);
static const System::Int8 GLX_DEPTH_BUFFER_BIT = System::Int8(0x20);
static const System::Int8 GLX_STENCIL_BUFFER_BIT = System::Int8(0x40);
static const System::Byte GLX_ACCUM_BUFFER_BIT = System::Byte(0x80);
static const System::Int8 GLX_FRONT_LEFT_BUFFER_BIT_SGIX = System::Int8(0x1);
static const System::Int8 GLX_FRONT_RIGHT_BUFFER_BIT_SGIX = System::Int8(0x2);
static const System::Int8 GLX_BACK_LEFT_BUFFER_BIT_SGIX = System::Int8(0x4);
static const System::Int8 GLX_BACK_RIGHT_BUFFER_BIT_SGIX = System::Int8(0x8);
static const System::Int8 GLX_AUX_BUFFERS_BIT_SGIX = System::Int8(0x10);
static const System::Int8 GLX_DEPTH_BUFFER_BIT_SGIX = System::Int8(0x20);
static const System::Int8 GLX_STENCIL_BUFFER_BIT_SGIX = System::Int8(0x40);
static const System::Byte GLX_ACCUM_BUFFER_BIT_SGIX = System::Byte(0x80);
static const System::Word GLX_SAMPLE_BUFFERS_BIT_SGIX = System::Word(0x100);
static const System::Word GLX_RENDER_TYPE = System::Word(0x8011);
static const System::Word GLX_X_RENDERABLE = System::Word(0x8012);
static const System::Word GLX_RGBA_TYPE = System::Word(0x8014);
static const System::Int8 GLX_RGBA_BIT = System::Int8(0x1);
static const System::Word GLX_COLOR_INDEX_TYPE = System::Word(0x8015);
static const System::Int8 GLX_COLOR_INDEX_BIT = System::Int8(0x2);
static const System::Int8 GLX_RGBA_BIT_SGIX = System::Int8(0x1);
static const System::Int8 GLX_COLOR_INDEX_BIT_SGIX = System::Int8(0x2);
static const System::Word GLX_SCREEN = System::Word(0x800c);
static const int GLX_PBUFFER_CLOBBER_MASK = int(0x8000000);
static const System::Word GLX_DAMAGED = System::Word(0x8020);
static const System::Word GLX_SAVED = System::Word(0x8021);
static const System::Word GLX_WINDOW = System::Word(0x8022);
static const System::Word GLX_PBUFFER = System::Word(0x8023);
static const System::Word GLX_PBUFFER_HEIGHT = System::Word(0x8040);
static const System::Word GLX_PBUFFER_WIDTH = System::Word(0x8041);
static const System::Int8 GLX_X_VISUAL_TYPE_EXT = System::Int8(0x22);
static const System::Int8 GLX_TRANSPARENT_TYPE_EXT = System::Int8(0x23);
static const System::Int8 GLX_TRANSPARENT_INDEX_VALUE_EXT = System::Int8(0x24);
static const System::Int8 GLX_TRANSPARENT_RED_VALUE_EXT = System::Int8(0x25);
static const System::Int8 GLX_TRANSPARENT_GREEN_VALUE_EXT = System::Int8(0x26);
static const System::Int8 GLX_TRANSPARENT_BLUE_VALUE_EXT = System::Int8(0x27);
static const System::Int8 GLX_TRANSPARENT_ALPHA_VALUE_EXT = System::Int8(0x28);
static const System::Word GLX_TRUE_COLOR_EXT = System::Word(0x8002);
static const System::Word GLX_DIRECT_COLOR_EXT = System::Word(0x8003);
static const System::Word GLX_PSEUDO_COLOR_EXT = System::Word(0x8004);
static const System::Word GLX_STATIC_COLOR_EXT = System::Word(0x8005);
static const System::Word GLX_GRAY_SCALE_EXT = System::Word(0x8006);
static const System::Word GLX_STATIC_GRAY_EXT = System::Word(0x8007);
static const System::Word GLX_TRANSPARENT_RGB_EXT = System::Word(0x8008);
static const System::Word GLX_TRANSPARENT_INDEX_EXT = System::Word(0x8009);
static const System::Int8 GLX_VISUAL_CAVEAT_EXT = System::Int8(0x20);
static const System::Word GLX_NONE_EXT = System::Word(0x8000);
static const System::Word GLX_SLOW_VISUAL_EXT = System::Word(0x8001);
static const System::Word GLX_NON_CONFORMANT_VISUAL_EXT = System::Word(0x800d);
static const System::Word GLX_SHARE_CONTEXT_EXT = System::Word(0x800a);
static const System::Word GLX_VISUAL_ID_EXT = System::Word(0x800b);
static const System::Word GLX_SCREEN_EXT = System::Word(0x800c);
static const System::Int8 GLX_3DFX_WINDOW_MODE_MESA = System::Int8(0x1);
static const System::Int8 GLX_3DFX_FULLSCREEN_MODE_MESA = System::Int8(0x2);
static const System::Word GLX_DRAWABLE_TYPE_SGIX = System::Word(0x8010);
static const System::Word GLX_RENDER_TYPE_SGIX = System::Word(0x8011);
static const System::Word GLX_X_RENDERABLE_SGIX = System::Word(0x8012);
static const System::Word GLX_FBCONFIG_ID_SGIX = System::Word(0xbb8d);
static const System::Word GLX_RGBA_TYPE_SGIX = System::Word(0x8014);
static const System::Word GLX_COLOR_INDEX_TYPE_SGIX = System::Word(0x8015);
static const System::Word GLX_MAX_PBUFFER_WIDTH_SGIX = System::Word(0x8016);
static const System::Word GLX_MAX_PBUFFER_HEIGHT_SGIX = System::Word(0x8017);
static const System::Word GLX_MAX_PBUFFER_PIXELS_SGIX = System::Word(0x8018);
static const System::Word GLX_OPTIMAL_PBUFFER_WIDTH_SGIX = System::Word(0x8019);
static const System::Word GLX_OPTIMAL_PBUFFER_HEIGHT_SGIX = System::Word(0x801a);
static const System::Word GLX_PRESERVED_CONTENTS_SGIX = System::Word(0x801b);
static const System::Word GLX_LARGEST_PBUFFER_SGIX = System::Word(0x801c);
static const System::Word GLX_WIDTH_SGIX = System::Word(0x801d);
static const System::Word GLX_HEIGHT_SGIX = System::Word(0x801e);
static const System::Word GLX_EVENT_MASK_SGIX = System::Word(0x801f);
static const System::Word GLX_DAMAGED_SGIX = System::Word(0x8020);
static const System::Word GLX_SAVED_SGIX = System::Word(0x8021);
static const System::Word GLX_WINDOW_SGIX = System::Word(0x8022);
static const System::Word GLX_PBUFFER_SGIX = System::Word(0x8023);
static const System::Word GLX_DIGITAL_MEDIA_PBUFFER_SGIX = System::Word(0x8024);
static const System::Word GLX_BLENDED_RGBA_SGIS = System::Word(0x8025);
static const System::Word GLX_MULTISAMPLE_SUB_RECT_WIDTH_SGIS = System::Word(0x8026);
static const System::Word GLX_MULTISAMPLE_SUB_RECT_HEIGHT_SGIS = System::Word(0x8027);
static const System::Word GLX_VISUAL_SELECT_GROUP_SGIX = System::Word(0x8028);
static const System::Word GLX_HYPERPIPE_ID_SGIX = System::Word(0x8030);
static const System::Int8 GLX_SYNC_FRAME_SGIX = System::Int8(0x0);
static const System::Int8 GLX_SYNC_SWAP_SGIX = System::Int8(0x1);
static const int GLX_BUFFER_CLOBBER_MASK_SGIX = int(0x8000000);
static const int GLX_BUFFER_SWAP_COMPLETE_INTEL_MASK = int(0x4000000);
static const System::Int8 GLX_HYPERPIPE_DISPLAY_PIPE_SGIX = System::Int8(0x1);
static const System::Int8 GLX_HYPERPIPE_RENDER_PIPE_SGIX = System::Int8(0x2);
static const System::Int8 GLX_PIPE_RECT_SGIX = System::Int8(0x1);
static const System::Int8 GLX_PIPE_RECT_LIMITS_SGIX = System::Int8(0x2);
static const System::Int8 GLX_HYPERPIPE_STEREO_SGIX = System::Int8(0x3);
static const System::Int8 GLX_HYPERPIPE_PIXEL_AVERAGE_SGIX = System::Int8(0x4);
static const System::Byte GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX = System::Byte(0x80);
static const System::Int8 GLX_TEXTURE_1D_BIT_EXT = System::Int8(0x1);
static const System::Int8 GLX_TEXTURE_2D_BIT_EXT = System::Int8(0x2);
static const System::Int8 GLX_TEXTURE_RECTANGLE_BIT_EXT = System::Int8(0x4);
static const System::Word GLX_SWAP_METHOD_OML = System::Word(0x8060);
static const System::Word GLX_SWAP_EXCHANGE_OML = System::Word(0x8061);
static const System::Word GLX_SWAP_COPY_OML = System::Word(0x8062);
static const System::Word GLX_SWAP_UNDEFINED_OML = System::Word(0x8063);
static const System::Word GLX_EXCHANGE_COMPLETE_INTEL = System::Word(0x8180);
static const System::Word GLX_COPY_COMPLETE_INTEL = System::Word(0x8181);
static const System::Word GLX_FLIP_COMPLETE_INTEL = System::Word(0x8182);
static const System::Word GLX_COLOR_SAMPLES_NV = System::Word(0x20b3);
static const System::Int8 AGL_NONE = System::Int8(0x0);
static const System::Int8 AGL_ALL_RENDERERS = System::Int8(0x1);
static const System::Int8 AGL_BUFFER_SIZE = System::Int8(0x2);
static const System::Int8 AGL_LEVEL = System::Int8(0x3);
static const System::Int8 AGL_RGBA = System::Int8(0x4);
static const System::Int8 AGL_DOUBLEBUFFER = System::Int8(0x5);
static const System::Int8 AGL_STEREO = System::Int8(0x6);
static const System::Int8 AGL_AUX_BUFFERS = System::Int8(0x7);
static const System::Int8 AGL_RED_SIZE = System::Int8(0x8);
static const System::Int8 AGL_GREEN_SIZE = System::Int8(0x9);
static const System::Int8 AGL_BLUE_SIZE = System::Int8(0xa);
static const System::Int8 AGL_ALPHA_SIZE = System::Int8(0xb);
static const System::Int8 AGL_DEPTH_SIZE = System::Int8(0xc);
static const System::Int8 AGL_STENCIL_SIZE = System::Int8(0xd);
static const System::Int8 AGL_ACCUM_RED_SIZE = System::Int8(0xe);
static const System::Int8 AGL_ACCUM_GREEN_SIZE = System::Int8(0xf);
static const System::Int8 AGL_ACCUM_BLUE_SIZE = System::Int8(0x10);
static const System::Int8 AGL_ACCUM_ALPHA_SIZE = System::Int8(0x11);
static const System::Int8 AGL_PIXEL_SIZE = System::Int8(0x32);
static const System::Int8 AGL_MINIMUM_POLICY = System::Int8(0x33);
static const System::Int8 AGL_MAXIMUM_POLICY = System::Int8(0x34);
static const System::Int8 AGL_OFFSCREEN = System::Int8(0x35);
static const System::Int8 AGL_FULLSCREEN = System::Int8(0x36);
static const System::Int8 AGL_SAMPLE_BUFFERS_ARB = System::Int8(0x37);
static const System::Int8 AGL_SAMPLES_ARB = System::Int8(0x38);
static const System::Int8 AGL_AUX_DEPTH_STENCIL = System::Int8(0x39);
static const System::Int8 AGL_COLOR_FLOAT = System::Int8(0x3a);
static const System::Int8 AGL_MULTISAMPLE = System::Int8(0x3b);
static const System::Int8 AGL_SUPERSAMPLE = System::Int8(0x3c);
static const System::Int8 AGL_SAMPLE_ALPHA = System::Int8(0x3d);
static const System::Int8 AGL_RENDERER_ID = System::Int8(0x46);
static const System::Int8 AGL_SINGLE_RENDERER = System::Int8(0x47);
static const System::Int8 AGL_NO_RECOVERY = System::Int8(0x48);
static const System::Int8 AGL_ACCELERATED = System::Int8(0x49);
static const System::Int8 AGL_CLOSEST_POLICY = System::Int8(0x4a);
static const System::Int8 AGL_ROBUST = System::Int8(0x4b);
static const System::Int8 AGL_BACKING_STORE = System::Int8(0x4c);
static const System::Int8 AGL_MP_SAFE = System::Int8(0x4e);
static const System::Int8 AGL_WINDOW = System::Int8(0x50);
static const System::Int8 AGL_MULTISCREEN = System::Int8(0x51);
static const System::Int8 AGL_VIRTUAL_SCREEN = System::Int8(0x52);
static const System::Int8 AGL_COMPLIANT = System::Int8(0x53);
static const System::Int8 AGL_PBUFFER = System::Int8(0x5a);
static const System::Int8 AGL_REMOTE_PBUFFER = System::Int8(0x5b);
static const System::Int8 AGL_BUFFER_MODES = System::Int8(0x64);
static const System::Int8 AGL_MIN_LEVEL = System::Int8(0x65);
static const System::Int8 AGL_MAX_LEVEL = System::Int8(0x66);
static const System::Int8 AGL_COLOR_MODES = System::Int8(0x67);
static const System::Int8 AGL_ACCUM_MODES = System::Int8(0x68);
static const System::Int8 AGL_DEPTH_MODES = System::Int8(0x69);
static const System::Int8 AGL_STENCIL_MODES = System::Int8(0x6a);
static const System::Int8 AGL_MAX_AUX_BUFFERS = System::Int8(0x6b);
static const System::Int8 AGL_VIDEO_MEMORY = System::Int8(0x78);
static const System::Int8 AGL_TEXTURE_MEMORY = System::Int8(0x79);
static const System::Byte AGL_RENDERER_COUNT = System::Byte(0x80);
static const System::Byte AGL_SWAP_RECT = System::Byte(0xc8);
static const System::Byte AGL_BUFFER_RECT = System::Byte(0xca);
static const System::Byte AGL_SWAP_LIMIT = System::Byte(0xcb);
static const System::Byte AGL_COLORMAP_TRACKING = System::Byte(0xd2);
static const System::Byte AGL_COLORMAP_ENTRY = System::Byte(0xd4);
static const System::Byte AGL_RASTERIZATION = System::Byte(0xdc);
static const System::Byte AGL_SWAP_INTERVAL = System::Byte(0xde);
static const System::Byte AGL_STATE_VALIDATION = System::Byte(0xe6);
static const System::Byte AGL_BUFFER_NAME = System::Byte(0xe7);
static const System::Byte AGL_ORDER_CONTEXT_TO_FRONT = System::Byte(0xe8);
static const System::Byte AGL_CONTEXT_SURFACE_ID = System::Byte(0xe9);
static const System::Byte AGL_CONTEXT_DISPLAY_ID = System::Byte(0xea);
static const System::Byte AGL_SURFACE_ORDER = System::Byte(0xeb);
static const System::Byte AGL_SURFACE_OPACITY = System::Byte(0xec);
static const System::Byte AGL_CLIP_REGION = System::Byte(0xfe);
static const System::Byte AGL_FS_CAPTURE_SINGLE = System::Byte(0xff);
static const System::Word AGL_SURFACE_BACKING_SIZE = System::Word(0x130);
static const System::Word AGL_ENABLE_SURFACE_BACKING_SIZE = System::Word(0x131);
static const System::Word AGL_SURFACE_VOLATILE = System::Word(0x132);
static const System::Word AGL_FORMAT_CACHE_SIZE = System::Word(0x1f5);
static const System::Word AGL_CLEAR_FORMAT_CACHE = System::Word(0x1f6);
static const System::Word AGL_RETAIN_RENDERERS = System::Word(0x1f7);
static const System::Int8 AGL_MONOSCOPIC_BIT = System::Int8(0x1);
static const System::Int8 AGL_STEREOSCOPIC_BIT = System::Int8(0x2);
static const System::Int8 AGL_SINGLEBUFFER_BIT = System::Int8(0x4);
static const System::Int8 AGL_DOUBLEBUFFER_BIT = System::Int8(0x8);
static const System::Int8 AGL_0_BIT = System::Int8(0x1);
static const System::Int8 AGL_1_BIT = System::Int8(0x2);
static const System::Int8 AGL_2_BIT = System::Int8(0x4);
static const System::Int8 AGL_3_BIT = System::Int8(0x8);
static const System::Int8 AGL_4_BIT = System::Int8(0x10);
static const System::Int8 AGL_5_BIT = System::Int8(0x20);
static const System::Int8 AGL_6_BIT = System::Int8(0x40);
static const System::Byte AGL_8_BIT = System::Byte(0x80);
static const System::Word AGL_10_BIT = System::Word(0x100);
static const System::Word AGL_12_BIT = System::Word(0x200);
static const System::Word AGL_16_BIT = System::Word(0x400);
static const System::Word AGL_24_BIT = System::Word(0x800);
static const System::Word AGL_32_BIT = System::Word(0x1000);
static const System::Word AGL_48_BIT = System::Word(0x2000);
static const System::Word AGL_64_BIT = System::Word(0x4000);
static const System::Word AGL_96_BIT = System::Word(0x8000);
static const int AGL_128_BIT = int(0x10000);
static const System::Int8 AGL_RGB8_BIT = System::Int8(0x1);
static const System::Int8 AGL_RGB8_A8_BIT = System::Int8(0x2);
static const System::Int8 AGL_BGR233_BIT = System::Int8(0x4);
static const System::Int8 AGL_BGR233_A8_BIT = System::Int8(0x8);
static const System::Int8 AGL_RGB332_BIT = System::Int8(0x10);
static const System::Int8 AGL_RGB332_A8_BIT = System::Int8(0x20);
static const System::Int8 AGL_RGB444_BIT = System::Int8(0x40);
static const System::Byte AGL_ARGB4444_BIT = System::Byte(0x80);
static const System::Word AGL_RGB444_A8_BIT = System::Word(0x100);
static const System::Word AGL_RGB555_BIT = System::Word(0x200);
static const System::Word AGL_ARGB1555_BIT = System::Word(0x400);
static const System::Word AGL_RGB555_A8_BIT = System::Word(0x800);
static const System::Word AGL_RGB565_BIT = System::Word(0x1000);
static const System::Word AGL_RGB565_A8_BIT = System::Word(0x2000);
static const System::Word AGL_RGB888_BIT = System::Word(0x4000);
static const System::Word AGL_ARGB8888_BIT = System::Word(0x8000);
static const int AGL_RGB888_A8_BIT = int(0x10000);
static const int AGL_RGB101010_BIT = int(0x20000);
static const int AGL_ARGB2101010_BIT = int(0x40000);
static const int AGL_RGB101010_A8_BIT = int(0x80000);
static const int AGL_RGB121212_BIT = int(0x100000);
static const int AGL_ARGB12121212_BIT = int(0x200000);
static const int AGL_RGB161616_BIT = int(0x400000);
static const int AGL_ARGB16161616_BIT = int(0x800000);
static const int AGL_INDEX8_BIT = int(0x20000000);
static const int AGL_INDEX16_BIT = int(0x40000000);
static const int AGL_RGBFLOAT64_BIT = int(0x1000000);
static const int AGL_RGBAFLOAT64_BIT = int(0x2000000);
static const int AGL_RGBFLOAT128_BIT = int(0x4000000);
static const int AGL_RGBAFLOAT128_BIT = int(0x8000000);
static const int AGL_RGBFLOAT256_BIT = int(0x10000000);
static const int AGL_RGBAFLOAT256_BIT = int(0x20000000);
static const System::Int8 AGL_NO_ERROR = System::Int8(0x0);
static const System::Word AGL_BAD_ATTRIBUTE = System::Word(0x2710);
static const System::Word AGL_BAD_PROPERTY = System::Word(0x2711);
static const System::Word AGL_BAD_PIXELFMT = System::Word(0x2712);
static const System::Word AGL_BAD_RENDINFO = System::Word(0x2713);
static const System::Word AGL_BAD_CONTEXT = System::Word(0x2714);
static const System::Word AGL_BAD_DRAWABLE = System::Word(0x2715);
static const System::Word AGL_BAD_GDEV = System::Word(0x2716);
static const System::Word AGL_BAD_STATE = System::Word(0x2717);
static const System::Word AGL_BAD_VALUE = System::Word(0x2718);
static const System::Word AGL_BAD_MATCH = System::Word(0x2719);
static const System::Word AGL_BAD_ENUM = System::Word(0x271a);
static const System::Word AGL_BAD_OFFSCREEN = System::Word(0x271b);
static const System::Word AGL_BAD_FULLSCREEN = System::Word(0x271c);
static const System::Word AGL_BAD_WINDOW = System::Word(0x271d);
static const System::Word AGL_BAD_POINTER = System::Word(0x271e);
static const System::Word AGL_BAD_MODULE = System::Word(0x271f);
static const System::Word AGL_BAD_ALLOC = System::Word(0x2720);
static const System::Word AGL_BAD_CONNECTION = System::Word(0x2721);
static const int GLU_INVALID_ENUM = int(0x18a24);
static const int GLU_INVALID_VALUE = int(0x18a25);
static const int GLU_OUT_OF_MEMORY = int(0x18a26);
static const int GLU_INCOMPATIBLE_GL_VERSION = int(0x18a27);
static const int GLU_VERSION = int(0x189c0);
static const int GLU_EXTENSIONS = int(0x189c1);
static const System::Int8 GLU_TRUE = System::Int8(0x1);
static const System::Int8 GLU_FALSE = System::Int8(0x0);
static const int GLU_SMOOTH = int(0x186a0);
static const int GLU_FLAT = int(0x186a1);
static const int GLU_NONE = int(0x186a2);
static const int GLU_POINT = int(0x186aa);
static const int GLU_LINE = int(0x186ab);
static const int GLU_FILL = int(0x186ac);
static const int GLU_SILHOUETTE = int(0x186ad);
static const int GLU_OUTSIDE = int(0x186b4);
static const int GLU_INSIDE = int(0x186b5);
static const System::Extended GLU_TESS_MAX_COORD = 1.000000E+150;
static const int GLU_TESS_WINDING_RULE = int(0x1872c);
static const int GLU_TESS_BOUNDARY_ONLY = int(0x1872d);
static const int GLU_TESS_TOLERANCE = int(0x1872e);
static const int GLU_TESS_WINDING_ODD = int(0x18722);
static const int GLU_TESS_WINDING_NONZERO = int(0x18723);
static const int GLU_TESS_WINDING_POSITIVE = int(0x18724);
static const int GLU_TESS_WINDING_NEGATIVE = int(0x18725);
static const int GLU_TESS_WINDING_ABS_GEQ_TWO = int(0x18726);
static const int GLU_TESS_BEGIN = int(0x18704);
static const int GLU_TESS_VERTEX = int(0x18705);
static const int GLU_TESS_END = int(0x18706);
static const int GLU_TESS_ERROR = int(0x18707);
static const int GLU_TESS_EDGE_FLAG = int(0x18708);
static const int GLU_TESS_COMBINE = int(0x18709);
static const int GLU_TESS_BEGIN_DATA = int(0x1870a);
static const int GLU_TESS_VERTEX_DATA = int(0x1870b);
static const int GLU_TESS_END_DATA = int(0x1870c);
static const int GLU_TESS_ERROR_DATA = int(0x1870d);
static const int GLU_TESS_EDGE_FLAG_DATA = int(0x1870e);
static const int GLU_TESS_COMBINE_DATA = int(0x1870f);
static const int GLU_TESS_ERROR1 = int(0x18737);
static const int GLU_TESS_ERROR2 = int(0x18738);
static const int GLU_TESS_ERROR3 = int(0x18739);
static const int GLU_TESS_ERROR4 = int(0x1873a);
static const int GLU_TESS_ERROR5 = int(0x1873b);
static const int GLU_TESS_ERROR6 = int(0x1873c);
static const int GLU_TESS_ERROR7 = int(0x1873d);
static const int GLU_TESS_ERROR8 = int(0x1873e);
static const int GLU_TESS_MISSING_BEGIN_POLYGON = int(0x18737);
static const int GLU_TESS_MISSING_BEGIN_CONTOUR = int(0x18738);
static const int GLU_TESS_MISSING_END_POLYGON = int(0x18739);
static const int GLU_TESS_MISSING_END_CONTOUR = int(0x1873a);
static const int GLU_TESS_COORD_TOO_LARGE = int(0x1873b);
static const int GLU_TESS_NEED_COMBINE_CALLBACK = int(0x1873c);
static const int GLU_AUTO_LOAD_MATRIX = int(0x18768);
static const int GLU_CULLING = int(0x18769);
static const int GLU_SAMPLING_TOLERANCE = int(0x1876b);
static const int GLU_DISPLAY_MODE = int(0x1876c);
static const int GLU_PARAMETRIC_TOLERANCE = int(0x1876a);
static const int GLU_SAMPLING_METHOD = int(0x1876d);
static const int GLU_U_STEP = int(0x1876e);
static const int GLU_V_STEP = int(0x1876f);
static const int GLU_PATH_LENGTH = int(0x18777);
static const int GLU_PARAMETRIC_ERROR = int(0x18778);
static const int GLU_DOMAIN_DISTANCE = int(0x18779);
static const int GLU_MAP1_TRIM_2 = int(0x18772);
static const int GLU_MAP1_TRIM_3 = int(0x18773);
static const int GLU_OUTLINE_POLYGON = int(0x18790);
static const int GLU_OUTLINE_PATCH = int(0x18791);
static const int GLU_NURBS_ERROR1 = int(0x1879b);
static const int GLU_NURBS_ERROR2 = int(0x1879c);
static const int GLU_NURBS_ERROR3 = int(0x1879d);
static const int GLU_NURBS_ERROR4 = int(0x1879e);
static const int GLU_NURBS_ERROR5 = int(0x1879f);
static const int GLU_NURBS_ERROR6 = int(0x187a0);
static const int GLU_NURBS_ERROR7 = int(0x187a1);
static const int GLU_NURBS_ERROR8 = int(0x187a2);
static const int GLU_NURBS_ERROR9 = int(0x187a3);
static const int GLU_NURBS_ERROR10 = int(0x187a4);
static const int GLU_NURBS_ERROR11 = int(0x187a5);
static const int GLU_NURBS_ERROR12 = int(0x187a6);
static const int GLU_NURBS_ERROR13 = int(0x187a7);
static const int GLU_NURBS_ERROR14 = int(0x187a8);
static const int GLU_NURBS_ERROR15 = int(0x187a9);
static const int GLU_NURBS_ERROR16 = int(0x187aa);
static const int GLU_NURBS_ERROR17 = int(0x187ab);
static const int GLU_NURBS_ERROR18 = int(0x187ac);
static const int GLU_NURBS_ERROR19 = int(0x187ad);
static const int GLU_NURBS_ERROR20 = int(0x187ae);
static const int GLU_NURBS_ERROR21 = int(0x187af);
static const int GLU_NURBS_ERROR22 = int(0x187b0);
static const int GLU_NURBS_ERROR23 = int(0x187b1);
static const int GLU_NURBS_ERROR24 = int(0x187b2);
static const int GLU_NURBS_ERROR25 = int(0x187b3);
static const int GLU_NURBS_ERROR26 = int(0x187b4);
static const int GLU_NURBS_ERROR27 = int(0x187b5);
static const int GLU_NURBS_ERROR28 = int(0x187b6);
static const int GLU_NURBS_ERROR29 = int(0x187b7);
static const int GLU_NURBS_ERROR30 = int(0x187b8);
static const int GLU_NURBS_ERROR31 = int(0x187b9);
static const int GLU_NURBS_ERROR32 = int(0x187ba);
static const int GLU_NURBS_ERROR33 = int(0x187bb);
static const int GLU_NURBS_ERROR34 = int(0x187bc);
static const int GLU_NURBS_ERROR35 = int(0x187bd);
static const int GLU_NURBS_ERROR36 = int(0x187be);
static const int GLU_NURBS_ERROR37 = int(0x187bf);
static const int GLU_CW = int(0x18718);
static const int GLU_CCW = int(0x18719);
static const int GLU_INTERIOR = int(0x1871a);
static const int GLU_EXTERIOR = int(0x1871b);
static const int GLU_UNKNOWN = int(0x1871c);
static const int GLU_BEGIN = int(0x18704);
static const int GLU_VERTEX = int(0x18705);
static const int GLU_END = int(0x18706);
static const int GLU_ERROR = int(0x18707);
static const int GLU_EDGE_FLAG = int(0x18708);
}	/* namespace Opengltokens */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OPENGLTOKENS)
using namespace Opengltokens;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OpengltokensHPP
