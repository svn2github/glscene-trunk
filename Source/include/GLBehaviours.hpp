// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLBehaviours.pas' rev: 24.00 (Win32)

#ifndef GlbehavioursHPP
#define GlbehavioursHPP

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
#include <XCollection.hpp>	// Pascal unit
#include <BaseClasses.hpp>	// Pascal unit
#include <GLCoordinates.hpp>	// Pascal unit
#include <VectorTypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glbehaviours
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TGLDamping;
class PASCALIMPLEMENTATION TGLDamping : public Baseclasses::TGLUpdateAbleObject
{
	typedef Baseclasses::TGLUpdateAbleObject inherited;
	
private:
	float FConstant;
	float FLinear;
	float FQuadratic;
	
public:
	__fastcall virtual TGLDamping(System::Classes::TPersistent* aOwner);
	__fastcall virtual ~TGLDamping(void);
	void __fastcall WriteToFiler(System::Classes::TWriter* writer);
	void __fastcall ReadFromFiler(System::Classes::TReader* reader);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	double __fastcall Calculate(double speed, double deltaTime);
	System::UnicodeString __fastcall AsString(TGLDamping* const damping);
	void __fastcall SetDamping(const float constant = 0.000000E+00, const float linear = 0.000000E+00, const float quadratic = 0.000000E+00);
	
__published:
	__property float Constant = {read=FConstant, write=FConstant};
	__property float Linear = {read=FLinear, write=FLinear};
	__property float Quadratic = {read=FQuadratic, write=FQuadratic};
};


class DELPHICLASS TGLBInertia;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLBInertia : public Glscene::TGLBehaviour
{
	typedef Glscene::TGLBehaviour inherited;
	
private:
	float FMass;
	Glcoordinates::TGLCoordinates3* FTranslationSpeed;
	float FTurnSpeed;
	float FRollSpeed;
	float FPitchSpeed;
	TGLDamping* FTranslationDamping;
	TGLDamping* FRotationDamping;
	bool FDampingEnabled;
	
protected:
	void __fastcall SetTranslationSpeed(Glcoordinates::TGLCoordinates3* const val);
	void __fastcall SetTranslationDamping(TGLDamping* const val);
	void __fastcall SetRotationDamping(TGLDamping* const val);
	virtual void __fastcall WriteToFiler(System::Classes::TWriter* writer);
	virtual void __fastcall ReadFromFiler(System::Classes::TReader* reader);
	
public:
	__fastcall virtual TGLBInertia(Xcollection::TXCollection* aOwner);
	__fastcall virtual ~TGLBInertia(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__classmethod virtual System::UnicodeString __fastcall FriendlyName();
	__classmethod virtual System::UnicodeString __fastcall FriendlyDescription();
	__classmethod virtual bool __fastcall UniqueItem();
	virtual void __fastcall DoProgress(const Baseclasses::TProgressTimes &progressTime);
	void __fastcall ApplyTranslationAcceleration(const double deltaTime, const Vectortypes::TVector4f &accel);
	void __fastcall ApplyForce(const double deltaTime, const Vectortypes::TVector4f &force);
	void __fastcall ApplyTorque(const double deltaTime, const float turnTorque, const float rollTorque, const float pitchTorque);
	void __fastcall MirrorTranslation(void);
	void __fastcall SurfaceBounce(const Vectortypes::TVector4f &surfaceNormal, float restitution);
	
__published:
	__property float Mass = {read=FMass, write=FMass};
	__property Glcoordinates::TGLCoordinates3* TranslationSpeed = {read=FTranslationSpeed, write=SetTranslationSpeed};
	__property float TurnSpeed = {read=FTurnSpeed, write=FTurnSpeed};
	__property float RollSpeed = {read=FRollSpeed, write=FRollSpeed};
	__property float PitchSpeed = {read=FPitchSpeed, write=FPitchSpeed};
	__property bool DampingEnabled = {read=FDampingEnabled, write=FDampingEnabled, nodefault};
	__property TGLDamping* TranslationDamping = {read=FTranslationDamping, write=SetTranslationDamping};
	__property TGLDamping* RotationDamping = {read=FRotationDamping, write=SetRotationDamping};
};

#pragma pack(pop)

class DELPHICLASS TGLBAcceleration;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLBAcceleration : public Glscene::TGLBehaviour
{
	typedef Glscene::TGLBehaviour inherited;
	
private:
	Glcoordinates::TGLCoordinates3* FAcceleration;
	
protected:
	void __fastcall SetAcceleration(Glcoordinates::TGLCoordinates3* const val);
	virtual void __fastcall WriteToFiler(System::Classes::TWriter* writer);
	virtual void __fastcall ReadFromFiler(System::Classes::TReader* reader);
	
public:
	__fastcall virtual TGLBAcceleration(Xcollection::TXCollection* aOwner);
	__fastcall virtual ~TGLBAcceleration(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__classmethod virtual System::UnicodeString __fastcall FriendlyName();
	__classmethod virtual System::UnicodeString __fastcall FriendlyDescription();
	__classmethod virtual bool __fastcall UniqueItem();
	virtual void __fastcall DoProgress(const Baseclasses::TProgressTimes &progressTime);
	
__published:
	__property Glcoordinates::TGLCoordinates3* Acceleration = {read=FAcceleration, write=FAcceleration};
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TGLBInertia* __fastcall GetInertia(Glscene::TGLBaseSceneObject* const AGLSceneObject);
extern PACKAGE TGLBInertia* __fastcall GetOrCreateInertia(Glscene::TGLBehaviours* behaviours)/* overload */;
extern PACKAGE TGLBInertia* __fastcall GetOrCreateInertia(Glscene::TGLBaseSceneObject* obj)/* overload */;
extern PACKAGE TGLBAcceleration* __fastcall GetOrCreateAcceleration(Glscene::TGLBehaviours* behaviours)/* overload */;
extern PACKAGE TGLBAcceleration* __fastcall GetOrCreateAcceleration(Glscene::TGLBaseSceneObject* obj)/* overload */;
}	/* namespace Glbehaviours */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLBEHAVIOURS)
using namespace Glbehaviours;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlbehavioursHPP
