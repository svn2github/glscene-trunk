// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLSound.pas' rev: 24.00 (Win32)

#ifndef GlsoundHPP
#define GlsoundHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <GLSoundFileObjects.hpp>	// Pascal unit
#include <GLScene.hpp>	// Pascal unit
#include <XCollection.hpp>	// Pascal unit
#include <VectorGeometry.hpp>	// Pascal unit
#include <GLCadencer.hpp>	// Pascal unit
#include <BaseClasses.hpp>	// Pascal unit
#include <GLCrossPlatform.hpp>	// Pascal unit
#include <VectorTypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glsound
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TGLSoundSample;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLSoundSample : public System::Classes::TCollectionItem
{
	typedef System::Classes::TCollectionItem inherited;
	
private:
	System::UnicodeString FName;
	Glsoundfileobjects::TGLSoundFile* FData;
	int FTag;
	
protected:
	virtual void __fastcall DefineProperties(System::Classes::TFiler* Filer);
	virtual void __fastcall ReadData(System::Classes::TStream* Stream);
	virtual void __fastcall WriteData(System::Classes::TStream* Stream);
	virtual System::UnicodeString __fastcall GetDisplayName(void);
	void __fastcall SetData(Glsoundfileobjects::TGLSoundFile* const val);
	
public:
	__fastcall virtual TGLSoundSample(System::Classes::TCollection* Collection);
	__fastcall virtual ~TGLSoundSample(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	void __fastcall LoadFromFile(const System::UnicodeString fileName);
	void __fastcall PlayOnWaveOut(void);
	Glsoundfileobjects::TGLSoundSampling* __fastcall Sampling(void);
	int __fastcall LengthInBytes(void);
	int __fastcall LengthInSamples(void);
	float __fastcall LengthInSec(void);
	__property int ManagerTag = {read=FTag, write=FTag, nodefault};
	
__published:
	__property System::UnicodeString Name = {read=FName, write=FName};
	__property Glsoundfileobjects::TGLSoundFile* Data = {read=FData, write=SetData, stored=false};
};

#pragma pack(pop)

class DELPHICLASS TGLSoundSamples;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLSoundSamples : public System::Classes::TCollection
{
	typedef System::Classes::TCollection inherited;
	
public:
	TGLSoundSample* operator[](int index) { return Items[index]; }
	
protected:
	System::Classes::TComponent* owner;
	DYNAMIC System::Classes::TPersistent* __fastcall GetOwner(void);
	void __fastcall SetItems(int index, TGLSoundSample* const val);
	TGLSoundSample* __fastcall GetItems(int index);
	
public:
	__fastcall TGLSoundSamples(System::Classes::TComponent* AOwner);
	HIDESBASE TGLSoundSample* __fastcall Add(void);
	HIDESBASE TGLSoundSample* __fastcall FindItemID(int ID);
	__property TGLSoundSample* Items[int index] = {read=GetItems, write=SetItems/*, default*/};
	TGLSoundSample* __fastcall GetByName(const System::UnicodeString aName);
	TGLSoundSample* __fastcall AddFile(const System::UnicodeString fileName, const System::UnicodeString sampleName = System::UnicodeString());
public:
	/* TCollection.Destroy */ inline __fastcall virtual ~TGLSoundSamples(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TGLSoundLibrary;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLSoundLibrary : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
private:
	TGLSoundSamples* FSamples;
	
protected:
	void __fastcall SetSamples(TGLSoundSamples* const val);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
public:
	__fastcall virtual TGLSoundLibrary(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLSoundLibrary(void);
	
__published:
	__property TGLSoundSamples* Samples = {read=FSamples, write=SetSamples};
};

#pragma pack(pop)

enum TGLSoundSourceChange : unsigned char { sscTransformation, sscSample, sscStatus };

typedef System::Set<TGLSoundSourceChange, TGLSoundSourceChange::sscTransformation, TGLSoundSourceChange::sscStatus>  TGLSoundSourceChanges;

class DELPHICLASS TGLBaseSoundSource;
class DELPHICLASS TGLBSoundEmitter;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLBaseSoundSource : public System::Classes::TCollectionItem
{
	typedef System::Classes::TCollectionItem inherited;
	
private:
	TGLBSoundEmitter* FBehaviourToNotify;
	int FPriority;
	Glscene::TGLBaseSceneObject* FOrigin;
	float FVolume;
	float FMinDistance;
	float FMaxDistance;
	float FInsideConeAngle;
	float FOutsideConeAngle;
	float FConeOutsideVolume;
	System::UnicodeString FSoundLibraryName;
	TGLSoundLibrary* FSoundLibrary;
	System::UnicodeString FSoundName;
	bool FMute;
	bool FPause;
	TGLSoundSourceChanges FChanges;
	int FNbLoops;
	unsigned FTag;
	int FFrequency;
	
protected:
	void __fastcall WriteToFiler(System::Classes::TWriter* writer);
	void __fastcall ReadFromFiler(System::Classes::TReader* reader);
	virtual System::UnicodeString __fastcall GetDisplayName(void);
	void __fastcall SetPriority(const int val);
	void __fastcall SetOrigin(Glscene::TGLBaseSceneObject* const val);
	void __fastcall SetVolume(const float val);
	void __fastcall SetMinDistance(const float val);
	void __fastcall SetMaxDistance(const float val);
	void __fastcall SetInsideConeAngle(const float val);
	void __fastcall SetOutsideConeAngle(const float val);
	void __fastcall SetConeOutsideVolume(const float val);
	TGLSoundLibrary* __fastcall GetSoundLibrary(void);
	void __fastcall SetSoundLibrary(TGLSoundLibrary* const val);
	void __fastcall SetSoundName(const System::UnicodeString val);
	void __fastcall SetMute(const bool val);
	void __fastcall SetPause(const bool val);
	void __fastcall SetNbLoops(const int val);
	void __fastcall SetFrequency(const int val);
	
public:
	__fastcall virtual TGLBaseSoundSource(System::Classes::TCollection* Collection);
	__fastcall virtual ~TGLBaseSoundSource(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__property TGLSoundSourceChanges Changes = {read=FChanges, nodefault};
	TGLSoundSample* __fastcall Sample(void);
	__property unsigned ManagerTag = {read=FTag, write=FTag, nodefault};
	__property Glscene::TGLBaseSceneObject* Origin = {read=FOrigin, write=SetOrigin};
	
__published:
	__property TGLSoundLibrary* SoundLibrary = {read=GetSoundLibrary, write=SetSoundLibrary};
	__property System::UnicodeString SoundName = {read=FSoundName, write=SetSoundName};
	__property float Volume = {read=FVolume, write=SetVolume};
	__property int NbLoops = {read=FNbLoops, write=SetNbLoops, default=1};
	__property bool Mute = {read=FMute, write=SetMute, default=0};
	__property bool Pause = {read=FPause, write=SetPause, default=0};
	__property int Priority = {read=FPriority, write=SetPriority, default=0};
	__property float MinDistance = {read=FMinDistance, write=SetMinDistance};
	__property float MaxDistance = {read=FMaxDistance, write=SetMaxDistance};
	__property float InsideConeAngle = {read=FInsideConeAngle, write=SetInsideConeAngle};
	__property float OutsideConeAngle = {read=FOutsideConeAngle, write=SetOutsideConeAngle};
	__property float ConeOutsideVolume = {read=FConeOutsideVolume, write=SetConeOutsideVolume};
	__property int Frequency = {read=FFrequency, write=SetFrequency, default=-1};
};

#pragma pack(pop)

class DELPHICLASS TGLSoundSource;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLSoundSource : public TGLBaseSoundSource
{
	typedef TGLBaseSoundSource inherited;
	
public:
	__fastcall virtual ~TGLSoundSource(void);
	
__published:
	__property Origin;
public:
	/* TGLBaseSoundSource.Create */ inline __fastcall virtual TGLSoundSource(System::Classes::TCollection* Collection) : TGLBaseSoundSource(Collection) { }
	
};

#pragma pack(pop)

class DELPHICLASS TGLSoundSources;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLSoundSources : public System::Classes::TCollection
{
	typedef System::Classes::TCollection inherited;
	
public:
	TGLSoundSource* operator[](int index) { return Items[index]; }
	
protected:
	System::Classes::TComponent* owner;
	DYNAMIC System::Classes::TPersistent* __fastcall GetOwner(void);
	void __fastcall SetItems(int index, TGLSoundSource* const val);
	TGLSoundSource* __fastcall GetItems(int index);
	HIDESBASE TGLSoundSource* __fastcall Add(void);
	HIDESBASE TGLSoundSource* __fastcall FindItemID(int ID);
	
public:
	__fastcall TGLSoundSources(System::Classes::TComponent* AOwner);
	__property TGLSoundSource* Items[int index] = {read=GetItems, write=SetItems/*, default*/};
public:
	/* TCollection.Destroy */ inline __fastcall virtual ~TGLSoundSources(void) { }
	
};

#pragma pack(pop)

enum TGLSoundEnvironment : unsigned char { seDefault, sePaddedCell, seRoom, seBathroom, seLivingRoom, seStoneroom, seAuditorium, seConcertHall, seCave, seArena, seHangar, seCarpetedHallway, seHallway, seStoneCorridor, seAlley, seForest, seCity, seMountains, seQuarry, sePlain, seParkingLot, seSewerPipe, seUnderWater, seDrugged, seDizzy, sePsychotic };

class DELPHICLASS TGLSoundManager;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLSoundManager : public Baseclasses::TGLCadenceAbleComponent
{
	typedef Baseclasses::TGLCadenceAbleComponent inherited;
	
private:
	bool FActive;
	bool FMute;
	bool FPause;
	float FMasterVolume;
	Glscene::TGLBaseSceneObject* FListener;
	Vectortypes::TVector4f FLastListenerPosition;
	TGLSoundSources* FSources;
	int FMaxChannels;
	int FOutputFrequency;
	float FUpdateFrequency;
	float FDistanceFactor;
	float FRollOffFactor;
	float FDopplerFactor;
	TGLSoundEnvironment FSoundEnvironment;
	float FLastUpdateTime;
	float FLastDeltaTime;
	Glcadencer::TGLCadencer* FCadencer;
	void __fastcall SetActive(const bool val);
	void __fastcall SetMute(const bool val);
	void __fastcall SetPause(const bool val);
	void __fastcall WriteDoppler(System::Classes::TWriter* writer);
	void __fastcall ReadDoppler(System::Classes::TReader* reader);
	
protected:
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	void __fastcall SetSources(TGLSoundSources* const val);
	void __fastcall SetMasterVolume(const float val);
	void __fastcall SetListener(Glscene::TGLBaseSceneObject* const val);
	void __fastcall SetMaxChannels(const int val);
	void __fastcall SetOutputFrequency(const int val);
	void __fastcall SetUpdateFrequency(const float val);
	bool __fastcall StoreUpdateFrequency(void);
	void __fastcall SetCadencer(Glcadencer::TGLCadencer* const val);
	void __fastcall SetDistanceFactor(const float val);
	bool __fastcall StoreDistanceFactor(void);
	void __fastcall SetRollOffFactor(const float val);
	bool __fastcall StoreRollOffFactor(void);
	void __fastcall SetDopplerFactor(const float val);
	void __fastcall SetSoundEnvironment(const TGLSoundEnvironment val);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall DefineProperties(System::Classes::TFiler* Filer);
	void __fastcall ListenerCoordinates(Vectortypes::TVector4f &position, Vectortypes::TVector4f &velocity, Vectortypes::TVector4f &direction, Vectortypes::TVector4f &up);
	DYNAMIC bool __fastcall DoActivate(void);
	DYNAMIC void __fastcall DoDeActivate(void);
	DYNAMIC bool __fastcall DoMute(void);
	DYNAMIC void __fastcall DoUnMute(void);
	DYNAMIC bool __fastcall DoPause(void);
	DYNAMIC void __fastcall DoUnPause(void);
	DYNAMIC void __fastcall NotifyMasterVolumeChange(void);
	DYNAMIC void __fastcall Notify3DFactorsChanged(void);
	DYNAMIC void __fastcall NotifyEnvironmentChanged(void);
	virtual void __fastcall KillSource(TGLBaseSoundSource* aSource);
	virtual void __fastcall UpdateSource(TGLBaseSoundSource* aSource);
	virtual void __fastcall MuteSource(TGLBaseSoundSource* aSource, bool muted);
	virtual void __fastcall PauseSource(TGLBaseSoundSource* aSource, bool paused);
	
public:
	__fastcall virtual TGLSoundManager(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLSoundManager(void);
	virtual void __fastcall UpdateSources(void);
	void __fastcall StopAllSources(void);
	virtual void __fastcall DoProgress(const Baseclasses::TProgressTimes &progressTime);
	virtual float __fastcall CPUUsagePercent(void);
	DYNAMIC bool __fastcall EAXSupported(void);
	
__published:
	__property bool Active = {read=FActive, write=SetActive, default=0};
	__property int MaxChannels = {read=FMaxChannels, write=SetMaxChannels, default=8};
	__property int OutputFrequency = {read=FOutputFrequency, write=SetOutputFrequency, default=44100};
	__property bool Mute = {read=FMute, write=SetMute, default=0};
	__property bool Pause = {read=FPause, write=SetPause, default=0};
	__property float MasterVolume = {read=FMasterVolume, write=SetMasterVolume};
	__property Glscene::TGLBaseSceneObject* Listener = {read=FListener, write=SetListener};
	__property TGLSoundSources* Sources = {read=FSources, write=SetSources};
	__property float UpdateFrequency = {read=FUpdateFrequency, write=SetUpdateFrequency, stored=StoreUpdateFrequency};
	__property Glcadencer::TGLCadencer* Cadencer = {read=FCadencer, write=SetCadencer};
	__property float DistanceFactor = {read=FDistanceFactor, write=SetDistanceFactor, stored=StoreDistanceFactor};
	__property float RollOffFactor = {read=FRollOffFactor, write=SetRollOffFactor, stored=StoreRollOffFactor};
	__property float DopplerFactor = {read=FDopplerFactor, write=SetDopplerFactor, stored=false};
	__property TGLSoundEnvironment Environment = {read=FSoundEnvironment, write=SetSoundEnvironment, default=0};
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TGLBSoundEmitter : public Glscene::TGLBehaviour
{
	typedef Glscene::TGLBehaviour inherited;
	
private:
	bool FPlaying;
	TGLBaseSoundSource* FSource;
	TGLSoundSource* FPlayingSource;
	
protected:
	virtual void __fastcall WriteToFiler(System::Classes::TWriter* writer);
	virtual void __fastcall ReadFromFiler(System::Classes::TReader* reader);
	DYNAMIC void __fastcall Loaded(void);
	void __fastcall SetSource(TGLBaseSoundSource* const val);
	void __fastcall SetPlaying(const bool val);
	bool __fastcall GetPlaying(void);
	void __fastcall NotifySourceDestruction(TGLSoundSource* aSource);
	
public:
	__fastcall virtual TGLBSoundEmitter(Xcollection::TXCollection* aOwner);
	__fastcall virtual ~TGLBSoundEmitter(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__classmethod virtual System::UnicodeString __fastcall FriendlyName();
	__classmethod virtual System::UnicodeString __fastcall FriendlyDescription();
	__classmethod virtual bool __fastcall UniqueItem();
	virtual void __fastcall DoProgress(const Baseclasses::TProgressTimes &progressTime);
	__property TGLSoundSource* PlayingSource = {read=FPlayingSource};
	
__published:
	__property TGLBaseSoundSource* Source = {read=FSource, write=SetSource};
	__property bool Playing = {read=GetPlaying, write=SetPlaying, default=0};
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool vVerboseGLSMErrors;
extern PACKAGE TGLSoundManager* __fastcall ActiveSoundManager(void);
extern PACKAGE TGLSoundLibrary* __fastcall GetSoundLibraryByName(const System::UnicodeString aName);
extern PACKAGE TGLBSoundEmitter* __fastcall GetOrCreateSoundEmitter(Glscene::TGLBehaviours* behaviours)/* overload */;
extern PACKAGE TGLBSoundEmitter* __fastcall GetOrCreateSoundEmitter(Glscene::TGLBaseSceneObject* obj)/* overload */;
}	/* namespace Glsound */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLSOUND)
using namespace Glsound;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlsoundHPP
