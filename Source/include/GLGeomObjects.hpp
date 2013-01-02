// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLGeomObjects.pas' rev: 24.00 (Win32)

#ifndef GlgeomobjectsHPP
#define GlgeomobjectsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <GLScene.hpp>	// Pascal unit
#include <VectorGeometry.hpp>	// Pascal unit
#include <OpenGLTokens.hpp>	// Pascal unit
#include <OpenGLAdapter.hpp>	// Pascal unit
#include <GLContext.hpp>	// Pascal unit
#include <GLObjects.hpp>	// Pascal unit
#include <GLSilhouette.hpp>	// Pascal unit
#include <VectorTypes.hpp>	// Pascal unit
#include <GeometryBB.hpp>	// Pascal unit
#include <GLRenderContextInfo.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glgeomobjects
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TGLDisk;
class PASCALIMPLEMENTATION TGLDisk : public Globjects::TGLQuadricObject
{
	typedef Globjects::TGLQuadricObject inherited;
	
private:
	float FStartAngle;
	float FSweepAngle;
	float FOuterRadius;
	float FInnerRadius;
	int FSlices;
	int FLoops;
	void __fastcall SetOuterRadius(const float aValue);
	void __fastcall SetInnerRadius(const float aValue);
	void __fastcall SetSlices(int aValue);
	void __fastcall SetLoops(int aValue);
	void __fastcall SetStartAngle(const float aValue);
	void __fastcall SetSweepAngle(const float aValue);
	
public:
	__fastcall virtual TGLDisk(System::Classes::TComponent* AOwner);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	virtual Vectortypes::TVector4f __fastcall AxisAlignedDimensionsUnscaled(void);
	virtual bool __fastcall RayCastIntersect(const Vectortypes::TVector4f &rayStart, const Vectortypes::TVector4f &rayVector, Vectorgeometry::PVector intersectPoint = (Vectorgeometry::PVector)(0x0), Vectorgeometry::PVector intersectNormal = (Vectorgeometry::PVector)(0x0));
	
__published:
	__property float InnerRadius = {read=FInnerRadius, write=SetInnerRadius};
	__property int Loops = {read=FLoops, write=SetLoops, default=2};
	__property float OuterRadius = {read=FOuterRadius, write=SetOuterRadius};
	__property int Slices = {read=FSlices, write=SetSlices, default=16};
	__property float StartAngle = {read=FStartAngle, write=SetStartAngle};
	__property float SweepAngle = {read=FSweepAngle, write=SetSweepAngle};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLDisk(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLDisk(Glscene::TGLBaseSceneObject* aParentOwner) : Globjects::TGLQuadricObject(aParentOwner) { }
	
};


class DELPHICLASS TGLCylinderBase;
class PASCALIMPLEMENTATION TGLCylinderBase : public Globjects::TGLQuadricObject
{
	typedef Globjects::TGLQuadricObject inherited;
	
private:
	float FBottomRadius;
	int FSlices;
	int FStacks;
	int FLoops;
	float FHeight;
	
protected:
	void __fastcall SetBottomRadius(const float aValue);
	void __fastcall SetHeight(const float aValue);
	void __fastcall SetSlices(int aValue);
	void __fastcall SetStacks(int aValue);
	void __fastcall SetLoops(int aValue);
	virtual float __fastcall GetTopRadius(void);
	
public:
	__fastcall virtual TGLCylinderBase(System::Classes::TComponent* AOwner);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	virtual Glsilhouette::TGLSilhouette* __fastcall GenerateSilhouette(const Glsilhouette::TGLSilhouetteParameters &silhouetteParameters);
	
__published:
	__property float BottomRadius = {read=FBottomRadius, write=SetBottomRadius};
	__property float Height = {read=FHeight, write=SetHeight};
	__property int Slices = {read=FSlices, write=SetSlices, default=16};
	__property int Stacks = {read=FStacks, write=SetStacks, default=4};
	__property int Loops = {read=FLoops, write=SetLoops, default=1};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLCylinderBase(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLCylinderBase(Glscene::TGLBaseSceneObject* aParentOwner) : Globjects::TGLQuadricObject(aParentOwner) { }
	
};


enum TConePart : unsigned char { coSides, coBottom };

typedef System::Set<TConePart, TConePart::coSides, TConePart::coBottom>  TConeParts;

class DELPHICLASS TGLCone;
class PASCALIMPLEMENTATION TGLCone : public TGLCylinderBase
{
	typedef TGLCylinderBase inherited;
	
private:
	TConeParts FParts;
	
protected:
	void __fastcall SetParts(TConeParts aValue);
	virtual float __fastcall GetTopRadius(void);
	
public:
	__fastcall virtual TGLCone(System::Classes::TComponent* AOwner);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual Vectortypes::TVector4f __fastcall AxisAlignedDimensionsUnscaled(void);
	virtual bool __fastcall RayCastIntersect(const Vectortypes::TVector4f &rayStart, const Vectortypes::TVector4f &rayVector, Vectorgeometry::PVector intersectPoint = (Vectorgeometry::PVector)(0x0), Vectorgeometry::PVector intersectNormal = (Vectorgeometry::PVector)(0x0));
	
__published:
	__property TConeParts Parts = {read=FParts, write=SetParts, default=3};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLCone(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLCone(Glscene::TGLBaseSceneObject* aParentOwner) : TGLCylinderBase(aParentOwner) { }
	
};


enum TCylinderPart : unsigned char { cySides, cyBottom, cyTop };

typedef System::Set<TCylinderPart, TCylinderPart::cySides, TCylinderPart::cyTop>  TCylinderParts;

enum TCylinderAlignment : unsigned char { caCenter, caTop, caBottom };

class DELPHICLASS TGLCylinder;
class PASCALIMPLEMENTATION TGLCylinder : public TGLCylinderBase
{
	typedef TGLCylinderBase inherited;
	
private:
	TCylinderParts FParts;
	float FTopRadius;
	TCylinderAlignment FAlignment;
	
protected:
	void __fastcall SetTopRadius(const float aValue);
	void __fastcall SetParts(TCylinderParts aValue);
	void __fastcall SetAlignment(TCylinderAlignment val);
	virtual float __fastcall GetTopRadius(void);
	
public:
	__fastcall virtual TGLCylinder(System::Classes::TComponent* AOwner);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual Vectortypes::TVector4f __fastcall AxisAlignedDimensionsUnscaled(void);
	virtual bool __fastcall RayCastIntersect(const Vectortypes::TVector4f &rayStart, const Vectortypes::TVector4f &rayVector, Vectorgeometry::PVector intersectPoint = (Vectorgeometry::PVector)(0x0), Vectorgeometry::PVector intersectNormal = (Vectorgeometry::PVector)(0x0));
	void __fastcall Align(const Vectortypes::TVector4f &startPoint, const Vectortypes::TVector4f &endPoint)/* overload */;
	void __fastcall Align(Glscene::TGLBaseSceneObject* const startObj, Glscene::TGLBaseSceneObject* const endObj)/* overload */;
	void __fastcall Align(const Vectortypes::TVector3f &startPoint, const Vectortypes::TVector3f &endPoint)/* overload */;
	
__published:
	__property float TopRadius = {read=FTopRadius, write=SetTopRadius};
	__property TCylinderParts Parts = {read=FParts, write=SetParts, default=7};
	__property TCylinderAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLCylinder(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLCylinder(Glscene::TGLBaseSceneObject* aParentOwner) : TGLCylinderBase(aParentOwner) { }
	
};


class DELPHICLASS TGLCapsule;
class PASCALIMPLEMENTATION TGLCapsule : public Glscene::TGLSceneObject
{
	typedef Glscene::TGLSceneObject inherited;
	
private:
	TCylinderParts FParts;
	float FRadius;
	int FSlices;
	int FStacks;
	float FHeight;
	TCylinderAlignment FAlignment;
	
protected:
	void __fastcall SetHeight(const float aValue);
	void __fastcall SetRadius(const float aValue);
	void __fastcall SetSlices(const int aValue);
	void __fastcall SetStacks(const int aValue);
	void __fastcall SetParts(TCylinderParts aValue);
	void __fastcall SetAlignment(TCylinderAlignment val);
	
public:
	__fastcall virtual TGLCapsule(System::Classes::TComponent* AOwner);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual Vectortypes::TVector4f __fastcall AxisAlignedDimensionsUnscaled(void);
	virtual bool __fastcall RayCastIntersect(const Vectortypes::TVector4f &rayStart, const Vectortypes::TVector4f &rayVector, Vectorgeometry::PVector intersectPoint = (Vectorgeometry::PVector)(0x0), Vectorgeometry::PVector intersectNormal = (Vectorgeometry::PVector)(0x0));
	void __fastcall Align(const Vectortypes::TVector4f &startPoint, const Vectortypes::TVector4f &endPoint)/* overload */;
	void __fastcall Align(Glscene::TGLBaseSceneObject* const startObj, Glscene::TGLBaseSceneObject* const endObj)/* overload */;
	void __fastcall Align(const Vectortypes::TVector3f &startPoint, const Vectortypes::TVector3f &endPoint)/* overload */;
	
__published:
	__property float Height = {read=FHeight, write=SetHeight};
	__property int Slices = {read=FSlices, write=SetSlices, nodefault};
	__property int Stacks = {read=FStacks, write=SetStacks, nodefault};
	__property float Radius = {read=FRadius, write=SetRadius};
	__property TCylinderParts Parts = {read=FParts, write=SetParts, default=7};
	__property TCylinderAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLCapsule(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLCapsule(Glscene::TGLBaseSceneObject* aParentOwner) : Glscene::TGLSceneObject(aParentOwner) { }
	
};


enum TAnnulusPart : unsigned char { anInnerSides, anOuterSides, anBottom, anTop };

typedef System::Set<TAnnulusPart, TAnnulusPart::anInnerSides, TAnnulusPart::anTop>  TAnnulusParts;

class DELPHICLASS TGLAnnulus;
class PASCALIMPLEMENTATION TGLAnnulus : public TGLCylinderBase
{
	typedef TGLCylinderBase inherited;
	
private:
	TAnnulusParts FParts;
	float FBottomInnerRadius;
	float FTopInnerRadius;
	float FTopRadius;
	
protected:
	void __fastcall SetTopRadius(const float aValue);
	void __fastcall SetTopInnerRadius(const float aValue);
	void __fastcall SetBottomInnerRadius(const float aValue);
	void __fastcall SetParts(TAnnulusParts aValue);
	
public:
	__fastcall virtual TGLAnnulus(System::Classes::TComponent* AOwner);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual Vectortypes::TVector4f __fastcall AxisAlignedDimensionsUnscaled(void);
	virtual bool __fastcall RayCastIntersect(const Vectortypes::TVector4f &rayStart, const Vectortypes::TVector4f &rayVector, Vectorgeometry::PVector intersectPoint = (Vectorgeometry::PVector)(0x0), Vectorgeometry::PVector intersectNormal = (Vectorgeometry::PVector)(0x0));
	
__published:
	__property float BottomInnerRadius = {read=FBottomInnerRadius, write=SetBottomInnerRadius};
	__property float TopInnerRadius = {read=FTopInnerRadius, write=SetTopInnerRadius};
	__property float TopRadius = {read=FTopRadius, write=SetTopRadius};
	__property TAnnulusParts Parts = {read=FParts, write=SetParts, default=15};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLAnnulus(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLAnnulus(Glscene::TGLBaseSceneObject* aParentOwner) : TGLCylinderBase(aParentOwner) { }
	
};


enum TTorusPart : unsigned char { toSides, toStartDisk, toStopDisk };

typedef System::Set<TTorusPart, TTorusPart::toSides, TTorusPart::toStopDisk>  TTorusParts;

class DELPHICLASS TGLTorus;
class PASCALIMPLEMENTATION TGLTorus : public Glscene::TGLSceneObject
{
	typedef Glscene::TGLSceneObject inherited;
	
private:
	typedef System::DynamicArray<Globjects::TVertexRec> _TGLTorus__1;
	
	typedef System::DynamicArray<System::DynamicArray<Globjects::TVertexRec> > _TGLTorus__2;
	
	
private:
	TTorusParts FParts;
	unsigned FRings;
	unsigned FSides;
	float FStartAngle;
	float FStopAngle;
	float FMinorRadius;
	float FMajorRadius;
	_TGLTorus__2 FMesh;
	
protected:
	void __fastcall SetMajorRadius(const float aValue);
	void __fastcall SetMinorRadius(const float aValue);
	void __fastcall SetRings(unsigned aValue);
	void __fastcall SetSides(unsigned aValue);
	void __fastcall SetStartAngle(const float aValue);
	void __fastcall SetStopAngle(const float aValue);
	void __fastcall SetParts(TTorusParts aValue);
	
public:
	__fastcall virtual TGLTorus(System::Classes::TComponent* AOwner);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual Vectortypes::TVector4f __fastcall AxisAlignedDimensionsUnscaled(void);
	virtual bool __fastcall RayCastIntersect(const Vectortypes::TVector4f &rayStart, const Vectortypes::TVector4f &rayVector, Vectorgeometry::PVector intersectPoint = (Vectorgeometry::PVector)(0x0), Vectorgeometry::PVector intersectNormal = (Vectorgeometry::PVector)(0x0));
	
__published:
	__property float MajorRadius = {read=FMajorRadius, write=SetMajorRadius};
	__property float MinorRadius = {read=FMinorRadius, write=SetMinorRadius};
	__property unsigned Rings = {read=FRings, write=SetRings, default=25};
	__property unsigned Sides = {read=FSides, write=SetSides, default=15};
	__property float StartAngle = {read=FStartAngle, write=SetStartAngle};
	__property float StopAngle = {read=FStopAngle, write=SetStopAngle};
	__property TTorusParts Parts = {read=FParts, write=SetParts, default=1};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLTorus(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLTorus(Glscene::TGLBaseSceneObject* aParentOwner) : Glscene::TGLSceneObject(aParentOwner) { }
	
};


enum TArrowLinePart : unsigned char { alLine, alTopArrow, alBottomArrow };

typedef System::Set<TArrowLinePart, TArrowLinePart::alLine, TArrowLinePart::alBottomArrow>  TArrowLineParts;

enum TArrowHeadStackingStyle : unsigned char { ahssStacked, ahssCentered, ahssIncluded };

class DELPHICLASS TGLArrowLine;
class PASCALIMPLEMENTATION TGLArrowLine : public TGLCylinderBase
{
	typedef TGLCylinderBase inherited;
	
private:
	TArrowLineParts FParts;
	float FTopRadius;
	float fTopArrowHeadHeight;
	float fTopArrowHeadRadius;
	float fBottomArrowHeadHeight;
	float fBottomArrowHeadRadius;
	TArrowHeadStackingStyle FHeadStackingStyle;
	
protected:
	void __fastcall SetTopRadius(const float aValue);
	void __fastcall SetTopArrowHeadHeight(const float aValue);
	void __fastcall SetTopArrowHeadRadius(const float aValue);
	void __fastcall SetBottomArrowHeadHeight(const float aValue);
	void __fastcall SetBottomArrowHeadRadius(const float aValue);
	void __fastcall SetParts(TArrowLineParts aValue);
	void __fastcall SetHeadStackingStyle(const TArrowHeadStackingStyle val);
	
public:
	__fastcall virtual TGLArrowLine(System::Classes::TComponent* AOwner);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property float TopRadius = {read=FTopRadius, write=SetTopRadius};
	__property TArrowHeadStackingStyle HeadStackingStyle = {read=FHeadStackingStyle, write=SetHeadStackingStyle, default=0};
	__property TArrowLineParts Parts = {read=FParts, write=SetParts, default=3};
	__property float TopArrowHeadHeight = {read=fTopArrowHeadHeight, write=SetTopArrowHeadHeight};
	__property float TopArrowHeadRadius = {read=fTopArrowHeadRadius, write=SetTopArrowHeadRadius};
	__property float BottomArrowHeadHeight = {read=fBottomArrowHeadHeight, write=SetBottomArrowHeadHeight};
	__property float BottomArrowHeadRadius = {read=fBottomArrowHeadRadius, write=SetBottomArrowHeadRadius};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLArrowLine(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLArrowLine(Glscene::TGLBaseSceneObject* aParentOwner) : TGLCylinderBase(aParentOwner) { }
	
};


enum TArrowArcPart : unsigned char { aaArc, aaTopArrow, aaBottomArrow };

typedef System::Set<TArrowArcPart, TArrowArcPart::aaArc, TArrowArcPart::aaBottomArrow>  TArrowArcParts;

class DELPHICLASS TGLArrowArc;
class PASCALIMPLEMENTATION TGLArrowArc : public TGLCylinderBase
{
	typedef TGLCylinderBase inherited;
	
private:
	typedef System::DynamicArray<Globjects::TVertexRec> _TGLArrowArc__1;
	
	typedef System::DynamicArray<System::DynamicArray<Globjects::TVertexRec> > _TGLArrowArc__2;
	
	
private:
	float fArcRadius;
	float FStartAngle;
	float FStopAngle;
	TArrowArcParts FParts;
	float FTopRadius;
	float fTopArrowHeadHeight;
	float fTopArrowHeadRadius;
	float fBottomArrowHeadHeight;
	float fBottomArrowHeadRadius;
	TArrowHeadStackingStyle FHeadStackingStyle;
	_TGLArrowArc__2 FMesh;
	
protected:
	void __fastcall SetArcRadius(const float aValue);
	void __fastcall SetStartAngle(const float aValue);
	void __fastcall SetStopAngle(const float aValue);
	void __fastcall SetTopRadius(const float aValue);
	void __fastcall SetTopArrowHeadHeight(const float aValue);
	void __fastcall SetTopArrowHeadRadius(const float aValue);
	void __fastcall SetBottomArrowHeadHeight(const float aValue);
	void __fastcall SetBottomArrowHeadRadius(const float aValue);
	void __fastcall SetParts(TArrowArcParts aValue);
	void __fastcall SetHeadStackingStyle(const TArrowHeadStackingStyle val);
	
public:
	__fastcall virtual TGLArrowArc(System::Classes::TComponent* AOwner);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property float ArcRadius = {read=fArcRadius, write=SetArcRadius};
	__property float StartAngle = {read=FStartAngle, write=SetStartAngle};
	__property float StopAngle = {read=FStopAngle, write=SetStopAngle};
	__property float TopRadius = {read=FTopRadius, write=SetTopRadius};
	__property TArrowHeadStackingStyle HeadStackingStyle = {read=FHeadStackingStyle, write=SetHeadStackingStyle, default=0};
	__property TArrowArcParts Parts = {read=FParts, write=SetParts, default=3};
	__property float TopArrowHeadHeight = {read=fTopArrowHeadHeight, write=SetTopArrowHeadHeight};
	__property float TopArrowHeadRadius = {read=fTopArrowHeadRadius, write=SetTopArrowHeadRadius};
	__property float BottomArrowHeadHeight = {read=fBottomArrowHeadHeight, write=SetBottomArrowHeadHeight};
	__property float BottomArrowHeadRadius = {read=fBottomArrowHeadRadius, write=SetBottomArrowHeadRadius};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLArrowArc(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLArrowArc(Glscene::TGLBaseSceneObject* aParentOwner) : TGLCylinderBase(aParentOwner) { }
	
};


enum TPolygonPart : unsigned char { ppTop, ppBottom };

typedef System::Set<TPolygonPart, TPolygonPart::ppTop, TPolygonPart::ppBottom>  TPolygonParts;

class DELPHICLASS TGLPolygon;
class PASCALIMPLEMENTATION TGLPolygon : public Globjects::TGLPolygonBase
{
	typedef Globjects::TGLPolygonBase inherited;
	
private:
	TPolygonParts FParts;
	
protected:
	void __fastcall SetParts(const TPolygonParts val);
	
public:
	__fastcall virtual TGLPolygon(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLPolygon(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	
__published:
	__property TPolygonParts Parts = {read=FParts, write=SetParts, default=3};
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLPolygon(Glscene::TGLBaseSceneObject* aParentOwner) : Globjects::TGLPolygonBase(aParentOwner) { }
	
};


enum TFrustrumPart : unsigned char { fpTop, fpBottom, fpFront, fpBack, fpLeft, fpRight };

typedef System::Set<TFrustrumPart, TFrustrumPart::fpTop, TFrustrumPart::fpRight>  TFrustrumParts;

class DELPHICLASS TGLFrustrum;
class PASCALIMPLEMENTATION TGLFrustrum : public Glscene::TGLSceneObject
{
	typedef Glscene::TGLSceneObject inherited;
	
private:
	float FApexHeight;
	float FBaseDepth;
	float FBaseWidth;
	float FHeight;
	TFrustrumParts FParts;
	Glscene::TNormalDirection FNormalDirection;
	void __fastcall SetApexHeight(const float aValue);
	void __fastcall SetBaseDepth(const float aValue);
	void __fastcall SetBaseWidth(const float aValue);
	void __fastcall SetHeight(const float aValue);
	void __fastcall SetParts(TFrustrumParts aValue);
	void __fastcall SetNormalDirection(Glscene::TNormalDirection aValue);
	
protected:
	virtual void __fastcall DefineProperties(System::Classes::TFiler* Filer);
	void __fastcall ReadData(System::Classes::TStream* Stream);
	void __fastcall WriteData(System::Classes::TStream* Stream);
	
public:
	__fastcall virtual TGLFrustrum(System::Classes::TComponent* AOwner);
	virtual void __fastcall BuildList(Glrendercontextinfo::TRenderContextInfo &rci);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	float __fastcall TopDepth(void);
	float __fastcall TopWidth(void);
	HIDESBASE Geometrybb::TAABB __fastcall AxisAlignedBoundingBoxUnscaled(void);
	virtual Vectortypes::TVector4f __fastcall AxisAlignedDimensionsUnscaled(void);
	
__published:
	__property float ApexHeight = {read=FApexHeight, write=SetApexHeight, stored=false};
	__property float BaseDepth = {read=FBaseDepth, write=SetBaseDepth, stored=false};
	__property float BaseWidth = {read=FBaseWidth, write=SetBaseWidth, stored=false};
	__property float Height = {read=FHeight, write=SetHeight, stored=false};
	__property Glscene::TNormalDirection NormalDirection = {read=FNormalDirection, write=SetNormalDirection, default=1};
	__property TFrustrumParts Parts = {read=FParts, write=SetParts, default=63};
public:
	/* TGLCustomSceneObject.Destroy */ inline __fastcall virtual ~TGLFrustrum(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLFrustrum(Glscene::TGLBaseSceneObject* aParentOwner) : Glscene::TGLSceneObject(aParentOwner) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define cAllFrustrumParts (System::Set<TFrustrumPart, TFrustrumPart::fpTop, TFrustrumPart::fpRight> () << TFrustrumPart::fpTop << TFrustrumPart::fpBottom << TFrustrumPart::fpFront << TFrustrumPart::fpBack << TFrustrumPart::fpLeft << TFrustrumPart::fpRight )
}	/* namespace Glgeomobjects */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLGEOMOBJECTS)
using namespace Glgeomobjects;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlgeomobjectsHPP
