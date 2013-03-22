// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Types3DS.pas' rev: 24.00 (Win32)

#ifndef Types3dsHPP
#define Types3dsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Types3ds
{
//-- type declarations -------------------------------------------------------
enum TDumpLevel : unsigned int { dlTerseDump, dlMediumDump, dlMaximumDump };

typedef char * PChar3DS;

typedef System::AnsiString String3DS;

typedef System::SmallString<64>  String64;

typedef System::StaticArray<System::Word, 536870912> TWordList;

typedef TWordList *PWordList;

typedef System::StaticArray<int, 268435456> TIntegerArray;

typedef TIntegerArray *PIntegerArray;

typedef System::StaticArray<unsigned, 268435456> TCardinalArray;

typedef TCardinalArray *PCardinalArray;

typedef System::StaticArray<float, 268435456> TSingleList;

typedef TSingleList *PSingleList;

struct TPoint3DS;
typedef TPoint3DS *PPoint3DS;

struct DECLSPEC_DRECORD TPoint3DS
{
public:
	float X;
	float Y;
	float Z;
};


typedef System::StaticArray<TPoint3DS, 89478486> TPointList;

typedef TPointList *PPointList;

struct TFColor3DS;
typedef TFColor3DS *PFColor3DS;

struct DECLSPEC_DRECORD TFColor3DS
{
public:
	float R;
	float G;
	float B;
};


typedef System::StaticArray<TFColor3DS, 89478486> TFColorList;

typedef TFColorList *PFColorList;

struct TFace3DS;
typedef TFace3DS *PFace3DS;

#pragma pack(push,1)
struct DECLSPEC_DRECORD TFace3DS
{
	union
	{
		struct 
		{
			System::StaticArray<System::Word, 4> FaceRec;
		};
		struct 
		{
			System::Word V1;
			System::Word V2;
			System::Word V3;
			System::Word Flag;
		};
		
	};
};
#pragma pack(pop)


typedef System::StaticArray<TFace3DS, 134217728> TFaceList;

typedef TFaceList *PFaceList;

struct TTexVert3DS;
typedef TTexVert3DS *PTexVert3DS;

struct DECLSPEC_DRECORD TTexVert3DS
{
public:
	float U;
	float V;
};


typedef System::StaticArray<TTexVert3DS, 134217728> TTexVertList;

typedef TTexVertList *PTexVertList;

struct TTrackHeader3DS;
typedef TTrackHeader3DS *PTrackHeader3DS;

struct DECLSPEC_DRECORD TTrackHeader3DS
{
public:
	System::Word Flags;
	int nu1;
	int nu2;
	int KeyCount;
};


struct TKeyHeader3DS;
typedef TKeyHeader3DS *PKeyHeader3DS;

struct DECLSPEC_DRECORD TKeyHeader3DS
{
public:
	int Time;
	System::Word RFlags;
	float Tension;
	float Continuity;
	float Bias;
	float EaseTo;
	float EaseFrom;
};


typedef System::StaticArray<TKeyHeader3DS, 38347923> TKeyHeaderList;

typedef TKeyHeaderList *PKeyHeaderList;

struct TKFRotKey3DS;
typedef TKFRotKey3DS *PKFRotKey3DS;

struct DECLSPEC_DRECORD TKFRotKey3DS
{
public:
	float Angle;
	float X;
	float Y;
	float Z;
};


typedef System::StaticArray<TKFRotKey3DS, 67108864> TKFRotKeyList;

typedef TKFRotKeyList *PKFRotKeyList;

typedef System::UnicodeString *PKFMorphKey3DS;

typedef System::UnicodeString TKFMorphKey3DS;

typedef System::StaticArray<System::UnicodeString, 268435456> TKFMorphKeyList;

typedef TKFMorphKeyList *PKFMorphKeyList;

struct TChunk3DS;
typedef TChunk3DS *PChunk3DS;

struct TChunkListEntry3DS;
typedef TChunkListEntry3DS *PChunkListEntry3DS;

struct DECLSPEC_DRECORD TChunkListEntry3DS
{
public:
	System::UnicodeString NameStr;
	TChunk3DS *Chunk;
};


typedef System::StaticArray<TChunkListEntry3DS, 134217728> TChunkList;

typedef TChunkList *PChunkList;

struct TChunkList3DS;
typedef TChunkList3DS *PChunkList3DS;

struct DECLSPEC_DRECORD TChunkList3DS
{
public:
	int Count;
	TChunkList *List;
};


enum TDBType3DS : unsigned int { dbUnknown, dbMeshFile, dbProjectFile, dbMaterialFile };

struct TNodeList;
typedef TNodeList *PNodeList;

struct DECLSPEC_DRECORD TNodeList
{
public:
	short ID;
	System::Word Tag;
	System::UnicodeString Name;
	System::UnicodeString InstStr;
	short ParentID;
	TNodeList *Next;
};


struct TDatabase3DS;
typedef TDatabase3DS *PDatabase3DS;

struct DECLSPEC_DRECORD TDatabase3DS
{
public:
	TChunk3DS *TopChunk;
	bool ObjListDirty;
	bool MatListDirty;
	bool NodeListDirty;
	TChunkList3DS *ObjList;
	TChunkList3DS *MatList;
	TChunkList3DS *NodeList;
};


enum TViewType3DS : unsigned int { vtNoView3DS, vtTopView3DS, vtBottomView3DS, vtLeftView3DS, vtRightView3DS, vtFrontView3DS, vtBackView3DS, vtUserView3DS, vtCameraView3DS, vtSpotlightView3DS };

struct TViewSize3DS;
typedef TViewSize3DS *PViewSize3DS;

struct DECLSPEC_DRECORD TViewSize3DS
{
public:
	System::Word XPos;
	System::Word YPos;
	System::Word Width;
	System::Word Height;
};


struct TOrthoView3DS;
typedef TOrthoView3DS *POrthoView3DS;

struct DECLSPEC_DRECORD TOrthoView3DS
{
public:
	TPoint3DS Center;
	float Zoom;
};


struct TUserView3DS;
typedef TUserView3DS *PUserView3DS;

struct DECLSPEC_DRECORD TUserView3DS
{
public:
	TPoint3DS Center;
	float Zoom;
	float HorAng;
	float VerAng;
};


struct TViewport3DS;
typedef TViewport3DS *PViewport3DS;

struct DECLSPEC_DRECORD TViewport3DS
{
public:
	TViewType3DS AType;
	TViewSize3DS Size;
	TOrthoView3DS Ortho;
	TUserView3DS User;
	System::UnicodeString CameraStr;
};


enum TShadowStyle3DS : unsigned int { ssUseShadowMap, ssUseRayTraceShadow };

struct TShadowSets3DS;
typedef TShadowSets3DS *PShadowSets3DS;

struct DECLSPEC_DRECORD TShadowSets3DS
{
public:
	TShadowStyle3DS AType;
	float Bias;
	float RayBias;
	short MapSize;
	float Filter;
};


struct TMeshSet3DS;
typedef TMeshSet3DS *PMeshSet3DS;

struct DECLSPEC_DRECORD TMeshSet3DS
{
public:
	float MasterScale;
	TShadowSets3DS Shadow;
	TFColor3DS AmbientLight;
	TPoint3DS OConsts;
};


enum TAtmosphereType3DS : unsigned int { atNoAtmo, atUseFog, atUseLayerFog, atUseDistanceCue };

enum TLayerFogFalloff3DS : unsigned int { lfNoFall, lfTopFall, lfBottomFall };

struct TFogSettings3DS;
typedef TFogSettings3DS *PFogSettings3DS;

struct DECLSPEC_DRECORD TFogSettings3DS
{
public:
	float NearPlane;
	float NearDensity;
	float FarPlane;
	float FarDensity;
	TFColor3DS FogColor;
	bool FogBgnd;
};


struct TLayerFogSettings3DS;
typedef TLayerFogSettings3DS *PLayerFogSettings3DS;

struct DECLSPEC_DRECORD TLayerFogSettings3DS
{
public:
	float ZMin;
	float ZMax;
	float Density;
	TFColor3DS FogColor;
	TLayerFogFalloff3DS FallOff;
	bool FogBgnd;
};


struct TDCueSettings3DS;
typedef TDCueSettings3DS *PDCueSettings3DS;

struct DECLSPEC_DRECORD TDCueSettings3DS
{
public:
	float NearPlane;
	float NearDim;
	float FarPlane;
	float FarDim;
	bool DCueBgnd;
};


struct DECLSPEC_DRECORD TAtmosphere3DS
{
public:
	TFogSettings3DS Fog;
	TLayerFogSettings3DS LayerFog;
	TDCueSettings3DS DCue;
	TAtmosphereType3DS ActiveAtmo;
};


typedef TAtmosphere3DS *PAtmosphere3DS;

enum TBackgroundType3DS : unsigned int { btNoBgnd, btUseSolidBgnd, btUseVGradientBgnd, btUseBitmapBgnd };

typedef System::AnsiString *PBitmapBgnd3DS;

typedef System::AnsiString TBitmapBgnd3DS;

typedef TFColor3DS TSolidBgnd3DS;

struct TVGradientBgnd3DS;
typedef TVGradientBgnd3DS *PVGradientBgnd3DS;

struct DECLSPEC_DRECORD TVGradientBgnd3DS
{
public:
	float GradPercent;
	TFColor3DS Top;
	TFColor3DS Mid;
	TFColor3DS Bottom;
};


struct TBackground3DS;
typedef TBackground3DS *PBackground3DS;

struct DECLSPEC_DRECORD TBackground3DS
{
public:
	System::AnsiString Bitmap;
	TFColor3DS Solid;
	TVGradientBgnd3DS VGradient;
	TBackgroundType3DS BgndUsed;
};


enum TShadeType3DS : unsigned int { stWire, stFlat, stGouraud, stPhong, stMetal };

enum TTileType3DS : unsigned int { ttTile, ttDecal, ttBoth };

enum TFilterType3DS : unsigned int { ftPyramidal, ftSummedArea };

enum TTintType3DS : unsigned int { ttRGB, ttAlpha, ttRGBLumaTint, ttAlphaTint, ttRGBTint };

struct TACubic3DS;
typedef TACubic3DS *PACubic3DS;

struct DECLSPEC_DRECORD TACubic3DS
{
public:
	bool FirstFrame;
	bool Flat;
	int Size;
	int nthFrame;
};


struct TBitmap3DS;
typedef TBitmap3DS *PBitmap3DS;

struct DECLSPEC_DRECORD TBitmap3DS
{
public:
	System::AnsiString NameStr;
	float Percent;
	TTileType3DS Tiling;
	bool IgnoreAlpha;
	TFilterType3DS Filter;
	float Blur;
	bool Mirror;
	bool Negative;
	float UScale;
	float VScale;
	float UOffset;
	float VOffset;
	float Rotation;
	TTintType3DS Source;
	TFColor3DS Tint1;
	TFColor3DS Tint2;
	TFColor3DS RedTint;
	TFColor3DS GreenTint;
	TFColor3DS BlueTint;
	int DataSize;
	void *Data;
};


struct DECLSPEC_DRECORD TMapSet3DS
{
public:
	TBitmap3DS Map;
	TBitmap3DS Mask;
};


typedef TMapSet3DS *PMapSet3DS;

struct DECLSPEC_DRECORD TRMapSet3DS
{
public:
	TBitmap3DS Map;
	bool UseAuto;
	TACubic3DS AutoMap;
	TBitmap3DS Mask;
};


struct TMaterial3DS;
typedef TMaterial3DS *PMaterial3DS;

struct DECLSPEC_DRECORD TMaterial3DS
{
public:
	System::AnsiString NameStr;
	TFColor3DS Ambient;
	TFColor3DS Diffuse;
	TFColor3DS Specular;
	float Shininess;
	float ShinStrength;
	float Blur;
	float Transparency;
	float TransFallOff;
	float SelfIllumPct;
	float WireSize;
	TShadeType3DS Shading;
	bool UseBlur;
	bool UseFall;
	bool TwoSided;
	bool SelFillum;
	bool Additive;
	bool UseWire;
	bool UseWireAbs;
	bool FaceMap;
	bool Soften;
	TMapSet3DS Texture;
	TMapSet3DS Texture2;
	TMapSet3DS Opacity;
	TMapSet3DS Bump;
	TMapSet3DS SpecMap;
	TMapSet3DS ShinMap;
	TMapSet3DS IllumMap;
	TRMapSet3DS Reflect;
};


typedef System::StaticArray<float, 12> TMeshMatrix;

typedef TMeshMatrix *PMeshMatrix;

struct TMapInfo3DS;
typedef TMapInfo3DS *PMapInfo3DS;

struct DECLSPEC_DRECORD TMapInfo3DS
{
public:
	System::Word MapType;
	float TileX;
	float TileY;
	float CenX;
	float CenY;
	float CenZ;
	float Scale;
	TMeshMatrix Matrix;
	float PW;
	float PH;
	float CH;
};


struct TObjMat3DS;
typedef TObjMat3DS *PObjMat3DS;

struct DECLSPEC_DRECORD TObjMat3DS
{
public:
	System::AnsiString NameStr;
	System::Word NFaces;
	TWordList *FaceIndex;
};


typedef System::StaticArray<TObjMat3DS, 89478486> TObjMatList;

typedef TObjMatList *PObjMatList;

struct TMesh3DS;
typedef TMesh3DS *PMesh3DS;

struct DECLSPEC_DRECORD TMesh3DS
{
private:
	typedef System::StaticArray<System::UnicodeString, 6> _TMesh3DS__1;
	
	
public:
	System::AnsiString NameStr;
	bool IsHidden;
	bool IsvisLofter;
	bool IsMatte;
	bool IsNoCast;
	bool IsFast;
	bool IsNorcvShad;
	bool IsFrozen;
	System::Word NVertices;
	TPointList *VertexArray;
	System::Word NVFlags;
	TWordList *VFlagArray;
	System::Word NTextVerts;
	TTexVertList *TextArray;
	bool UseMapInfo;
	TMapInfo3DS Map;
	TMeshMatrix LocMatrix;
	System::Word NFaces;
	TFaceList *FaceArray;
	TCardinalArray *SmoothArray;
	bool UseBoxMap;
	_TMesh3DS__1 BoxMapStr;
	System::Byte MeshColor;
	System::Word NMats;
	TObjMatList *MatArray;
	bool UseProc;
	int ProcSize;
	System::UnicodeString ProcNameStr;
	void *ProcData;
};


enum TConeStyle3DS : unsigned int { csCircular, csRectangular };

struct TSpotShadow3DS;
typedef TSpotShadow3DS *PSpotShadow3DS;

struct DECLSPEC_DRECORD TSpotShadow3DS
{
public:
	bool Cast;
	TShadowStyle3DS AType;
	bool Local;
	float Bias;
	float Filter;
	System::Word MapSize;
	float RayBias;
};


struct TSpotCone3DS;
typedef TSpotCone3DS *PSpotCone3DS;

struct DECLSPEC_DRECORD TSpotCone3DS
{
public:
	TConeStyle3DS AType;
	bool Show;
	bool Overshoot;
};


struct TSpotProjector3DS;
typedef TSpotProjector3DS *PSpotProjector3DS;

struct DECLSPEC_DRECORD TSpotProjector3DS
{
public:
	bool Use;
	System::UnicodeString BitmapStr;
};


struct TSpotLight3DS;
typedef TSpotLight3DS *PSpotLight3DS;

struct DECLSPEC_DRECORD TSpotLight3DS
{
public:
	TPoint3DS Target;
	float Hotspot;
	float FallOff;
	float Roll;
	float Aspect;
	TSpotShadow3DS Shadows;
	TSpotCone3DS Cone;
	TSpotProjector3DS Projector;
};


struct TLiteAttenuate3DS;
typedef TLiteAttenuate3DS *PLiteAttenuate3DS;

struct DECLSPEC_DRECORD TLiteAttenuate3DS
{
public:
	bool IsOn;
	float Inner;
	float Outer;
};


struct TLight3DS;
typedef TLight3DS *PLight3DS;

struct DECLSPEC_DRECORD TLight3DS
{
public:
	System::AnsiString NameStr;
	TPoint3DS Pos;
	TFColor3DS Color;
	float Multiplier;
	bool DLOff;
	TLiteAttenuate3DS Attenuation;
	System::Classes::TStringList* Exclude;
	TSpotLight3DS *Spot;
};


struct TCamRanges3DS;
typedef TCamRanges3DS *PCamRanges3DS;

struct DECLSPEC_DRECORD TCamRanges3DS
{
public:
	float CamNear;
	float CamFar;
};


struct TCamera3DS;
typedef TCamera3DS *PCamera3DS;

struct DECLSPEC_DRECORD TCamera3DS
{
public:
	System::AnsiString NameStr;
	TPoint3DS Position;
	TPoint3DS Target;
	float Roll;
	float FOV;
	bool ShowCone;
	TCamRanges3DS Ranges;
};


struct TKFKeyInfo3DS;
typedef TKFKeyInfo3DS *PKFKeyInfo3DS;

struct DECLSPEC_DRECORD TKFKeyInfo3DS
{
public:
	int Length;
	int CurFrame;
};


struct TKFSegment3DS;
typedef TKFSegment3DS *PKFSegment3DS;

struct DECLSPEC_DRECORD TKFSegment3DS
{
public:
	bool Use;
	int SegBegin;
	int SegEnd;
};


struct DECLSPEC_DRECORD TKFSets3DS
{
public:
	TKFKeyInfo3DS Anim;
	TKFSegment3DS Seg;
};


typedef TKFSets3DS *PKFSets3DS;

struct TKFCamera3DS;
typedef TKFCamera3DS *PKFCamera3DS;

struct DECLSPEC_DRECORD TKFCamera3DS
{
public:
	System::AnsiString NameStr;
	System::AnsiString ParentStr;
	System::Word Flags1;
	System::Word Flags2;
	int NPKeys;
	System::Word NPFlag;
	TKeyHeaderList *PKeys;
	TPointList *Pos;
	int NFKeys;
	System::Word NFFlag;
	TKeyHeaderList *FKeys;
	TSingleList *FOV;
	int NRKeys;
	System::Word NRFlag;
	TKeyHeaderList *RKeys;
	TSingleList *Roll;
	System::UnicodeString TParentStr;
	int NTKeys;
	System::Word NTFlag;
	TKeyHeaderList *TKeys;
	TPointList *TPos;
	System::Word TFlags1;
	System::Word TFlags2;
};


struct TKFAmbient3DS;
typedef TKFAmbient3DS *PKFAmbient3DS;

struct DECLSPEC_DRECORD TKFAmbient3DS
{
public:
	System::Word Flags1;
	System::Word Flags2;
	int NCKeys;
	System::Word NCFlag;
	TKeyHeaderList *CKeys;
	TFColorList *Color;
};


struct TKFMesh3DS;
typedef TKFMesh3DS *PKFMesh3DS;

struct DECLSPEC_DRECORD TKFMesh3DS
{
public:
	System::AnsiString NameStr;
	System::AnsiString ParentStr;
	System::Word Flags1;
	System::Word Flags2;
	TPoint3DS Pivot;
	System::AnsiString InstanceStr;
	TPoint3DS BoundMin;
	TPoint3DS BoundMax;
	int NPKeys;
	short NPFlag;
	TKeyHeaderList *PKeys;
	TPointList *Pos;
	int NRKeys;
	short NRFlag;
	TKeyHeaderList *RKeys;
	TKFRotKeyList *Rot;
	int NSKeys;
	short NSFlag;
	TKeyHeaderList *SKeys;
	TPointList *Scale;
	int NMKeys;
	short NMFlag;
	TKeyHeaderList *MKeys;
	TKFMorphKeyList *Morph;
	int NHKeys;
	short NHFlag;
	TKeyHeaderList *HKeys;
	float MSAngle;
};


struct TKFOmni3DS;
typedef TKFOmni3DS *PKFOmni3DS;

struct DECLSPEC_DRECORD TKFOmni3DS
{
public:
	System::AnsiString Name;
	System::AnsiString Parent;
	System::Word Flags1;
	System::Word Flags2;
	int NPKeys;
	System::Word NPFlag;
	TKeyHeaderList *PKeys;
	TPointList *Pos;
	int NCKeys;
	System::Word NCFlag;
	TKeyHeaderList *CKeys;
	TFColorList *Color;
};


struct TKFSpot3DS;
typedef TKFSpot3DS *PKFSpot3DS;

struct DECLSPEC_DRECORD TKFSpot3DS
{
public:
	System::AnsiString Name;
	System::AnsiString Parent;
	System::Word Flags1;
	System::Word Flags2;
	int NPKeys;
	System::Word NPFlag;
	TKeyHeaderList *PKeys;
	TPointList *Pos;
	int NCKeys;
	System::Word NCFlag;
	TKeyHeaderList *CKeys;
	TFColorList *Color;
	int NHKeys;
	System::Word NHFlag;
	TKeyHeaderList *HKeys;
	TSingleList *Hot;
	int NFKeys;
	System::Word NFFlag;
	TKeyHeaderList *FKeys;
	TSingleList *Fall;
	int NRKeys;
	System::Word NRFlag;
	TKeyHeaderList *RKeys;
	TSingleList *Roll;
	System::AnsiString TParent;
	int NTKeys;
	System::Word NTFlag;
	TKeyHeaderList *TKeys;
	TPointList *TPos;
	System::Word TFlags1;
	System::Word TFlags2;
};


struct TXDataRaw3DS;
typedef TXDataRaw3DS *PXDataRaw3DS;

struct DECLSPEC_DRECORD TXDataRaw3DS
{
public:
	int Size;
	void *Data;
};


enum TTargetType3DS : unsigned int { ttLightTarget, ttCameraTarget };

typedef unsigned *PM3dVersion;

typedef unsigned TM3dVersion;

struct TColorF;
typedef TColorF *PColorF;

struct DECLSPEC_DRECORD TColorF
{
public:
	float Red;
	float Green;
	float Blue;
};


typedef TColorF *PLinColorF;

typedef TColorF TLinColorF;

struct TColor24;
typedef TColor24 *PColor24;

struct DECLSPEC_DRECORD TColor24
{
public:
	System::Byte Red;
	System::Byte Green;
	System::Byte Blue;
};


typedef TColor24 *PLinColor24;

typedef TColor24 TLinColor24;

typedef TColor24 *PMatMapRCol;

typedef TColor24 TMatMapRCol;

typedef TColor24 *PMatMapGCol;

typedef TColor24 TMatMapGCol;

typedef TColor24 *PMatMapBCol;

typedef TColor24 TMatMapBCol;

typedef TColor24 *PMatMapCol1;

typedef TColor24 TMatMapCol1;

typedef TColor24 *PMatMapCol2;

typedef TColor24 TMatMapCol2;

typedef short *PIntPercentage;

typedef short TIntPercentage;

typedef short *PMatBumpPercent;

typedef short TMatBumpPercent;

typedef float *PFloatPercentage;

typedef float TFloatPercentage;

typedef char * PMatMapname;

typedef int *PMeshVersion;

typedef int TMeshVersion;

typedef float *PMasterScale;

typedef float TMasterScale;

typedef float *PLoShadowBias;

typedef float TLoShadowBias;

typedef float *PHiShadowBias;

typedef float THiShadowBias;

typedef float *PRayBias;

typedef float TRayBias;

typedef short *PShadowMapSize;

typedef short TShadowMapSize;

typedef short *PShadowSamples;

typedef short TShadowSamples;

typedef int *PShadowRange;

typedef int TShadowRange;

typedef float *PShadowFilter;

typedef float TShadowFilter;

typedef TPoint3DS *POConsts;

typedef TPoint3DS TOConsts;

typedef char * PBitMapName;

typedef float *PVGradient;

typedef float TVGradient;

struct TFog;
typedef TFog *PFog;

struct DECLSPEC_DRECORD TFog
{
public:
	float NearPlaneDist;
	float NearPlaneDensity;
	float FarPlaneDist;
	float FarPlaneDensity;
};


struct TLayerFog;
typedef TLayerFog *PLayerFog;

struct DECLSPEC_DRECORD TLayerFog
{
public:
	float ZMin;
	float ZMax;
	float Density;
	unsigned AType;
};


struct TDistanceCue;
typedef TDistanceCue *PDistanceCue;

struct DECLSPEC_DRECORD TDistanceCue
{
public:
	float NearPlaneDist;
	float NearPlaneDimming;
	float FarPlaneDist;
	float FarPlaneDimming;
};


struct TViewStandard;
typedef TViewStandard *PViewStandard;

struct DECLSPEC_DRECORD TViewStandard
{
public:
	TPoint3DS ViewTargetCoord;
	float ViewWidth;
};


struct TViewUser;
typedef TViewUser *PViewUser;

struct DECLSPEC_DRECORD TViewUser
{
public:
	TPoint3DS ViewTargetCoord;
	float ViewWidth;
	float XYViewangle;
	float YZViewangle;
	float BankAngle;
};


typedef char * PViewCamera;

typedef char * PMatName;

typedef short *PMatShading;

typedef short TMatShading;

struct TMatAcubic;
typedef TMatAcubic *PMatAcubic;

struct DECLSPEC_DRECORD TMatAcubic
{
public:
	System::Byte ShadeLevel;
	System::Byte Antialias;
	short Flags;
	unsigned MapSize;
	unsigned FrameInterval;
};


struct TIpasData;
typedef TIpasData *PIpasData;

struct DECLSPEC_DRECORD TIpasData
{
public:
	int Size;
	void *Data;
};


typedef float *PMatWireSize;

typedef float TMatWireSize;

typedef System::Word *PMatMapTiling;

typedef System::Word TMatMapTiling;

typedef float *PMatMapTexblur;

typedef float TMatMapTexblur;

typedef float *PMatMapUScale;

typedef float TMatMapUScale;

typedef float *PMatMapVScale;

typedef float TMatMapVScale;

typedef float *PMatMapUOffset;

typedef float TMatMapUOffset;

typedef float *PMatMapVOffset;

typedef float TMatMapVOffset;

typedef float *PMatMapAng;

typedef float TMatMapAng;

typedef char * PNamedObject;

struct TPointArray;
typedef TPointArray *PPointArray;

struct DECLSPEC_DRECORD TPointArray
{
public:
	System::Word Vertices;
	TPointList *PointList;
};


struct TPointFlagArray;
typedef TPointFlagArray *PPointFlagArray;

struct DECLSPEC_DRECORD TPointFlagArray
{
public:
	System::Word Flags;
	TWordList *FlagList;
};


struct TFaceArray;
typedef TFaceArray *PFaceArray;

struct DECLSPEC_DRECORD TFaceArray
{
public:
	System::Word Faces;
	TFaceList *FaceList;
};


struct TMshMatGroup;
typedef TMshMatGroup *PMshMatGroup;

struct DECLSPEC_DRECORD TMshMatGroup
{
public:
	System::AnsiString MatNameStr;
	System::Word Faces;
	TWordList *FaceList;
};


typedef System::StaticArray<System::AnsiString, 6> TMshBoxmap;

typedef TMshBoxmap *PMshBoxmap;

struct TSmoothGroup;
typedef TSmoothGroup *PSmoothGroup;

struct DECLSPEC_DRECORD TSmoothGroup
{
public:
	System::Word Groups;
	TCardinalArray *GroupList;
};


struct TTexVerts;
typedef TTexVerts *PTexVerts;

struct DECLSPEC_DRECORD TTexVerts
{
public:
	System::Word NumCoords;
	TTexVertList *TextVertList;
};


typedef System::Byte *PMeshColor;

typedef System::Byte TMeshColor;

struct TMeshTextureInfo;
typedef TMeshTextureInfo *PMeshTextureInfo;

struct DECLSPEC_DRECORD TMeshTextureInfo
{
public:
	System::Word MapType;
	float XTiling;
	float YTiling;
	TPoint3DS IconPos;
	float IconScaling;
	TMeshMatrix XMatrix;
	float IconWidth;
	float IconHeight;
	float CylIconHeight;
};


typedef char * PProcName;

typedef TPoint3DS *PNDirectLight;

typedef TPoint3DS TNDirectLight;

typedef char * PDlExclude;

struct TDlSpotlight;
typedef TDlSpotlight *PDlSpotlight;

struct DECLSPEC_DRECORD TDlSpotlight
{
public:
	TPoint3DS SpotLightTarg;
	float HotspotAngle;
	float FalloffAngle;
};


typedef float *PDlOuterRange;

typedef float TDlOuterRange;

typedef float *PDlInnerRange;

typedef float TDlInnerRange;

typedef float *PDlMultiplier;

typedef float TDlMultiplier;

typedef float *PDlSpotRoll;

typedef float TDlSpotRoll;

typedef float *PDlSpotAspect;

typedef float TDlSpotAspect;

typedef char * PDlSpotProjector;

typedef float *PDlRayBias;

typedef float TDlRayBias;

struct TDlLocalShadow2;
typedef TDlLocalShadow2 *PDlLocalShadow2;

struct DECLSPEC_DRECORD TDlLocalShadow2
{
public:
	float LocalShadowBias;
	float LocalShadowFilter;
	short LocalShadowMapSize;
};


struct TNCamera;
typedef TNCamera *PNCamera;

struct DECLSPEC_DRECORD TNCamera
{
public:
	TPoint3DS CameraPos;
	TPoint3DS TargetPos;
	float CameraBank;
	float CameraFocalLength;
};


struct TCamRanges;
typedef TCamRanges *PCamRanges;

struct DECLSPEC_DRECORD TCamRanges
{
public:
	float NearPlane;
	float FarPlane;
};


struct TViewportLayout;
typedef TViewportLayout *PViewportLayout;

struct DECLSPEC_DRECORD TViewportLayout
{
public:
	short Form;
	short Top;
	short Ready;
	short WState;
	short SwapWS;
	short SwapPort;
	short SwapCur;
};


struct TViewportSize;
typedef TViewportSize *PViewportSize;

struct DECLSPEC_DRECORD TViewportSize
{
public:
	System::Word XPos;
	System::Word YPos;
	System::Word Width;
	System::Word Height;
};


struct TViewportData;
typedef TViewportData *PViewportData;

struct DECLSPEC_DRECORD TViewportData
{
public:
	System::Word Flags;
	System::Word AxisLockout;
	System::Word WinXPos;
	System::Word WinYPos;
	System::Word WinWidth;
	System::Word WinHeight;
	System::Word View;
	float ZoomFactor;
	TPoint3DS Center;
	float HorizAng;
	float VertAng;
	System::AnsiString CamNameStr;
};


typedef TViewportData *PViewportData3;

typedef TViewportData TViewportData3;

struct TKFHdr;
typedef TKFHdr *PKFHdr;

struct DECLSPEC_DRECORD TKFHdr
{
public:
	short Revision;
	System::UnicodeString Filename;
	int AnimLength;
};


typedef short *PKFId;

typedef short TKFId;

struct TKFSeg;
typedef TKFSeg *PKFSeg;

struct DECLSPEC_DRECORD TKFSeg
{
public:
	int First;
	int Last;
};


typedef int *PKFCurtime;

typedef int TKFCurtime;

struct TNodeHdr;
typedef TNodeHdr *PNodeHdr;

struct DECLSPEC_DRECORD TNodeHdr
{
public:
	System::UnicodeString ObjNameStr;
	System::Word Flags1;
	System::Word Flags2;
	short ParentIndex;
};


typedef TPoint3DS *PPivot;

typedef TPoint3DS TPivot;

typedef char * PInstanceName;

typedef float *PMorphSmooth;

typedef float TMorphSmooth;

struct DECLSPEC_DRECORD TBoundBox
{
public:
	TPoint3DS Min;
	TPoint3DS Max;
};


typedef TBoundBox *PBoundBox;

struct DECLSPEC_DRECORD TPosTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TPointList *PositionList;
};


typedef TPosTrackTag *PPosTrackTag;

struct DECLSPEC_DRECORD TColTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TFColorList *ColorList;
};


typedef TColTrackTag *PColTrackTag;

struct DECLSPEC_DRECORD TRotTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TKFRotKeyList *RotationList;
};


typedef TRotTrackTag *PRotTrackTag;

struct DECLSPEC_DRECORD TScaleTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TPointList *ScaleList;
};


typedef TScaleTrackTag *PScaleTrackTag;

struct DECLSPEC_DRECORD TMorphTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TKFMorphKeyList *MorphList;
};


typedef TMorphTrackTag *PMorphTrackTag;

struct DECLSPEC_DRECORD THideTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
};


typedef THideTrackTag *PHideTrackTag;

struct DECLSPEC_DRECORD TFovTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TSingleList *FOVAngleList;
};


typedef TFovTrackTag *PFovTrackTag;

struct DECLSPEC_DRECORD TRollTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TSingleList *RollAngleList;
};


typedef TRollTrackTag *PRollTrackTag;

struct DECLSPEC_DRECORD THotTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TSingleList *HotspotAngleList;
};


typedef THotTrackTag *PHotTrackTag;

struct DECLSPEC_DRECORD TFallTrackTag
{
public:
	TTrackHeader3DS TrackHdr;
	TKeyHeaderList *KeyHdrList;
	TSingleList *FalloffAngleList;
};


typedef TFallTrackTag *PFallTrackTag;

struct TXDataEntry;
typedef TXDataEntry *PXDataEntry;

struct DECLSPEC_DRECORD TXDataEntry
{
public:
	int Size;
	void *Data;
};


typedef char * PXDataAppName;

typedef char * PXDataString;

typedef float *PXDataFloat;

typedef float TXDataFloat;

typedef double *PXDataDouble;

typedef double TXDataDouble;

typedef short *PXDataShort;

typedef short TXDataShort;

typedef int *PXDataLong;

typedef int TXDataLong;

typedef void * *PXDataVoid;

typedef void * TXDataVoid;

enum TReleaseLevel : unsigned int { rlRelease1, rlRelease2, rlRelease3, rlReleaseNotKnown };

struct DECLSPEC_DRECORD TChunkData
{
	#pragma pack(push,1)
	union
	{
		struct 
		{
			void *Dummy;
		};
		struct 
		{
			THideTrackTag *HideTrackTag;
		};
		struct 
		{
			TFallTrackTag *FallTrackTag;
		};
		struct 
		{
			THotTrackTag *HotTrackTag;
		};
		struct 
		{
			TRollTrackTag *RollTrackTag;
		};
		struct 
		{
			TFovTrackTag *FovTrackTag;
		};
		struct 
		{
			TMorphTrackTag *MorphTrackTag;
		};
		struct 
		{
			TScaleTrackTag *ScaleTrackTag;
		};
		struct 
		{
			TRotTrackTag *RotTrackTag;
		};
		struct 
		{
			TColTrackTag *ColTrackTag;
		};
		struct 
		{
			TPosTrackTag *PosTrackTag;
		};
		struct 
		{
			TBoundBox *BoundBox;
		};
		struct 
		{
			float *MorphSmooth;
		};
		struct 
		{
			char *InstanceName;
		};
		struct 
		{
			TPoint3DS *Pivot;
		};
		struct 
		{
			TNodeHdr *NodeHdr;
		};
		struct 
		{
			short *KFId;
		};
		struct 
		{
			int *KFCurtime;
		};
		struct 
		{
			TKFSeg *KFSeg;
		};
		struct 
		{
			TKFHdr *KFHdr;
		};
		struct 
		{
			char *XDataString;
		};
		struct 
		{
			char *XDataAppName;
		};
		struct 
		{
			TXDataEntry *XDataEntry;
		};
		struct 
		{
			TViewportData *ViewportData;
		};
		struct 
		{
			TViewportSize *ViewportSize;
		};
		struct 
		{
			TViewportLayout *ViewportLayout;
		};
		struct 
		{
			TCamRanges *CamRanges;
		};
		struct 
		{
			TNCamera *NCamera;
		};
		struct 
		{
			float *DlRayBias;
		};
		struct 
		{
			char *DlSpotProjector;
		};
		struct 
		{
			float *DlSpotAspect;
		};
		struct 
		{
			float *DlSpotRoll;
		};
		struct 
		{
			TDlLocalShadow2 *DlLocalShadow2;
		};
		struct 
		{
			TDlSpotlight *DlSpotlight;
		};
		struct 
		{
			float *DlMultiplier;
		};
		struct 
		{
			float *DlOuterRange;
		};
		struct 
		{
			float *DlInnerRange;
		};
		struct 
		{
			char *DlExclude;
		};
		struct 
		{
			TPoint3DS *NDirectLight;
		};
		struct 
		{
			char *ProcName;
		};
		struct 
		{
			TMeshTextureInfo *MeshTextureInfo;
		};
		struct 
		{
			System::Byte *MeshColor;
		};
		struct 
		{
			TMeshMatrix *MeshMatrix;
		};
		struct 
		{
			TTexVerts *TexVerts;
		};
		struct 
		{
			TSmoothGroup *SmoothGroup;
		};
		struct 
		{
			TMshBoxmap *MshBoxmap;
		};
		struct 
		{
			TMshMatGroup *MshMatGroup;
		};
		struct 
		{
			TFaceArray *FaceArray;
		};
		struct 
		{
			TPointFlagArray *PointFlagArray;
		};
		struct 
		{
			TPointArray *PointArray;
		};
		struct 
		{
			char *NamedObject;
		};
		struct 
		{
			short *MatBumpPercent;
		};
		struct 
		{
			TColor24 *MatMapBCol;
		};
		struct 
		{
			TColor24 *MatMapGCol;
		};
		struct 
		{
			TColor24 *MatMapRCol;
		};
		struct 
		{
			TColor24 *MatMapCol2;
		};
		struct 
		{
			TColor24 *MatMapCol1;
		};
		struct 
		{
			float *MatMapAng;
		};
		struct 
		{
			float *MatMapVOffset;
		};
		struct 
		{
			float *MatMapUOffset;
		};
		struct 
		{
			float *MatMapVScale;
		};
		struct 
		{
			float *MatMapUScale;
		};
		struct 
		{
			float *MatMapTexblur;
		};
		struct 
		{
			System::Word *MatMapTiling;
		};
		struct 
		{
			float *MatWireSize;
		};
		struct 
		{
			TIpasData *IpasData;
		};
		struct 
		{
			TMatAcubic *MatAcubic;
		};
		struct 
		{
			short *MatShading;
		};
		struct 
		{
			char *MatName;
		};
		struct 
		{
			char *ViewCamera;
		};
		struct 
		{
			TViewUser *ViewUser;
		};
		struct 
		{
			TViewStandard *ViewStandard;
		};
		struct 
		{
			TDistanceCue *DistanceCue;
		};
		struct 
		{
			TLayerFog *LayerFog;
		};
		struct 
		{
			TFog *Fog;
		};
		struct 
		{
			float *VGradient;
		};
		struct 
		{
			char *BitMapName;
		};
		struct 
		{
			TPoint3DS *OConsts;
		};
		struct 
		{
			short *ShadowSamples;
		};
		struct 
		{
			short *ShadowMapSize;
		};
		struct 
		{
			float *RayBias;
		};
		struct 
		{
			float *HiShadowBias;
		};
		struct 
		{
			int *ShadowRange;
		};
		struct 
		{
			float *ShadowFilter;
		};
		struct 
		{
			float *LoShadowBias;
		};
		struct 
		{
			float *MasterScale;
		};
		struct 
		{
			int *MeshVersion;
		};
		struct 
		{
			unsigned *M3dVersion;
		};
		struct 
		{
			char *MatMapname;
		};
		struct 
		{
			float *FloatPercentage;
		};
		struct 
		{
			short *IntPercentage;
		};
		struct 
		{
			TColor24 *LinColor24;
		};
		struct 
		{
			TColor24 *Color24;
		};
		struct 
		{
			TColorF *LinColorF;
		};
		struct 
		{
			TColorF *ColorF;
		};
		
	};
	#pragma pack(pop)
};


struct DECLSPEC_DRECORD TChunk3DS
{
public:
	System::Word Tag;
	unsigned Size;
	unsigned Position;
	TChunkData Data;
	TChunk3DS *Sibling;
	TChunk3DS *Children;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Types3ds */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_TYPES3DS)
using namespace Types3ds;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Types3dsHPP
