// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLWindows.pas' rev: 24.00 (Win32)

#ifndef GlwindowsHPP
#define GlwindowsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <GLScene.hpp>	// Pascal unit
#include <GLHUDObjects.hpp>	// Pascal unit
#include <GLMaterial.hpp>	// Pascal unit
#include <OpenGLTokens.hpp>	// Pascal unit
#include <GLContext.hpp>	// Pascal unit
#include <GLBitmapFont.hpp>	// Pascal unit
#include <GLWindowsFont.hpp>	// Pascal unit
#include <VectorGeometry.hpp>	// Pascal unit
#include <GLGui.hpp>	// Pascal unit
#include <GLCrossPlatform.hpp>	// Pascal unit
#include <GLColor.hpp>	// Pascal unit
#include <GLRenderContextInfo.hpp>	// Pascal unit
#include <BaseClasses.hpp>	// Pascal unit
#include <GLCoordinates.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <VectorTypes.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glwindows
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TGLBaseComponent;
class PASCALIMPLEMENTATION TGLBaseComponent : public Glgui::TGLBaseGuiObject
{
	typedef Glgui::TGLBaseGuiObject inherited;
	
private:
	bool FGUIRedraw;
	Glgui::TGLGuiLayout* FGuiLayout;
	System::UnicodeString FGuiLayoutName;
	Glgui::TGLGuiComponent* FGuiComponent;
	bool FReBuildGui;
	bool FRedrawAtOnce;
	float MoveX;
	float MoveY;
	Glgui::TGUIDrawResult FRenderStatus;
	float FAlphaChannel;
	float FRotation;
	bool FNoZWrite;
	bool BlockRendering;
	int RenderingCount;
	int BlockedCount;
	bool GuiDestroying;
	bool FDoChangesOnProgress;
	bool FAutosize;
	void __fastcall SetGUIRedraw(bool value);
	void __fastcall SetDoChangesOnProgress(const bool Value);
	void __fastcall SetAutosize(const bool Value);
	
protected:
	void __fastcall RenderHeader(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	void __fastcall RenderFooter(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	virtual void __fastcall SetGuiLayout(Glgui::TGLGuiLayout* NewGui);
	void __fastcall SetGuiLayoutName(System::UnicodeString NewName);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	HIDESBASE void __fastcall SetRotation(const float val);
	void __fastcall SetAlphaChannel(const float val);
	bool __fastcall StoreAlphaChannel(void);
	void __fastcall SetNoZWrite(const bool val);
	
public:
	void __fastcall BlockRender(void);
	void __fastcall UnBlockRender(void);
	__fastcall virtual TGLBaseComponent(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLBaseComponent(void);
	virtual void __fastcall NotifyChange(System::TObject* Sender);
	virtual void __fastcall DoChanges(void);
	void __fastcall MoveGUI(float XRel, float YRel);
	void __fastcall PlaceGUI(float XPos, float YPos);
	virtual void __fastcall DoProgress(const Baseclasses::TProgressTimes &progressTime);
	virtual void __fastcall DoRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	__property bool GUIRedraw = {read=FGUIRedraw, write=SetGUIRedraw, nodefault};
	__property bool ReBuildGui = {read=FReBuildGui, write=FReBuildGui, nodefault};
	
__published:
	__property bool Autosize = {read=FAutosize, write=SetAutosize, nodefault};
	__property bool RedrawAtOnce = {read=FRedrawAtOnce, write=FRedrawAtOnce, nodefault};
	__property Glgui::TGLGuiLayout* GuiLayout = {read=FGuiLayout, write=SetGuiLayout};
	__property System::UnicodeString GuiLayoutName = {read=FGuiLayoutName, write=SetGuiLayoutName};
	__property float Rotation = {read=FRotation, write=SetRotation};
	__property float AlphaChannel = {read=FAlphaChannel, write=SetAlphaChannel, stored=StoreAlphaChannel};
	__property bool NoZWrite = {read=FNoZWrite, write=SetNoZWrite, nodefault};
	__property bool DoChangesOnProgress = {read=FDoChangesOnProgress, write=SetDoChangesOnProgress, nodefault};
	__property Visible = {default=1};
	__property Width = {default=0};
	__property Height = {default=0};
	__property Left = {default=0};
	__property Top = {default=0};
	__property Position;
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLBaseComponent(Glscene::TGLBaseSceneObject* aParentOwner) : Glgui::TGLBaseGuiObject(aParentOwner) { }
	
};


enum TGLMouseAction : unsigned char { ma_mouseup, ma_mousedown, ma_mousemove };

class DELPHICLASS TGLBaseControl;
typedef void __fastcall (__closure *TGLAcceptMouseQuery)(TGLBaseControl* Sender, System::Classes::TShiftState Shift, TGLMouseAction Action, Glcrossplatform::TGLMouseButton Button, int X, int Y, bool &accept);

class DELPHICLASS TGLFocusControl;
class PASCALIMPLEMENTATION TGLBaseControl : public TGLBaseComponent
{
	typedef TGLBaseComponent inherited;
	
private:
	Glcrossplatform::TGLMouseEvent FOnMouseDown;
	Vcl::Controls::TMouseMoveEvent FOnMouseMove;
	Glcrossplatform::TGLMouseEvent FOnMouseUp;
	bool FKeepMouseEvents;
	TGLBaseControl* FActiveControl;
	TGLFocusControl* FFocusedControl;
	TGLAcceptMouseQuery FOnAcceptMouseQuery;
	System::Classes::TNotifyEvent FOnMouseLeave;
	System::Classes::TNotifyEvent FOnMouseEnter;
	TGLBaseControl* FEnteredControl;
	
protected:
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseUp(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseMove(System::Classes::TShiftState Shift, int X, int Y);
	void __fastcall SetActiveControl(TGLBaseControl* NewControl);
	void __fastcall SetFocusedControl(TGLFocusControl* NewControl);
	TGLBaseControl* __fastcall FindFirstGui(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	void __fastcall DoMouseEnter(void);
	void __fastcall DoMouseLeave(void);
	
public:
	virtual bool __fastcall MouseDown(System::TObject* Sender, Glcrossplatform::TGLMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall MouseUp(System::TObject* Sender, Glcrossplatform::TGLMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall MouseMove(System::TObject* Sender, System::Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall KeyPress(System::TObject* Sender, System::WideChar &Key);
	virtual void __fastcall KeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall KeyUp(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	__property TGLBaseControl* ActiveControl = {read=FActiveControl, write=SetActiveControl};
	__property bool KeepMouseEvents = {read=FKeepMouseEvents, write=FKeepMouseEvents, default=0};
	
__published:
	__property TGLFocusControl* FocusedControl = {read=FFocusedControl, write=SetFocusedControl};
	__property Glcrossplatform::TGLMouseEvent OnMouseDown = {read=FOnMouseDown, write=FOnMouseDown};
	__property Vcl::Controls::TMouseMoveEvent OnMouseMove = {read=FOnMouseMove, write=FOnMouseMove};
	__property Glcrossplatform::TGLMouseEvent OnMouseUp = {read=FOnMouseUp, write=FOnMouseUp};
	__property System::Classes::TNotifyEvent OnMouseEnter = {read=FOnMouseEnter, write=FOnMouseEnter};
	__property System::Classes::TNotifyEvent OnMouseLeave = {read=FOnMouseLeave, write=FOnMouseLeave};
	__property TGLAcceptMouseQuery OnAcceptMouseQuery = {read=FOnAcceptMouseQuery, write=FOnAcceptMouseQuery};
public:
	/* TGLBaseComponent.Create */ inline __fastcall virtual TGLBaseControl(System::Classes::TComponent* AOwner) : TGLBaseComponent(AOwner) { }
	/* TGLBaseComponent.Destroy */ inline __fastcall virtual ~TGLBaseControl(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLBaseControl(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseComponent(aParentOwner) { }
	
};


class DELPHICLASS TGLBaseFontControl;
class PASCALIMPLEMENTATION TGLBaseFontControl : public TGLBaseControl
{
	typedef TGLBaseControl inherited;
	
private:
	Glbitmapfont::TGLCustomBitmapFont* FBitmapFont;
	Vectortypes::TVector4f FDefaultColor;
	
protected:
	System::Uitypes::TColor __fastcall GetDefaultColor(void);
	void __fastcall SetDefaultColor(System::Uitypes::TColor value);
	void __fastcall SetBitmapFont(Glbitmapfont::TGLCustomBitmapFont* NewFont);
	Glbitmapfont::TGLCustomBitmapFont* __fastcall GetBitmapFont(void);
	void __fastcall WriteTextAt(Glrendercontextinfo::TRenderContextInfo &rci, const float X, const float Y, const System::UnicodeString Data, const Vectortypes::TVector4f &Color)/* overload */;
	void __fastcall WriteTextAt(Glrendercontextinfo::TRenderContextInfo &rci, const float X1, const float Y1, const float X2, const float Y2, const System::UnicodeString Data, const Vectortypes::TVector4f &Color)/* overload */;
	int __fastcall GetFontHeight(void);
	
public:
	__fastcall virtual TGLBaseFontControl(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLBaseFontControl(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
__published:
	__property Glbitmapfont::TGLCustomBitmapFont* BitmapFont = {read=GetBitmapFont, write=SetBitmapFont};
	__property System::Uitypes::TColor DefaultColor = {read=GetDefaultColor, write=SetDefaultColor, nodefault};
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLBaseFontControl(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseControl(aParentOwner) { }
	
};


class DELPHICLASS TGLBaseTextControl;
class PASCALIMPLEMENTATION TGLBaseTextControl : public TGLBaseFontControl
{
	typedef TGLBaseFontControl inherited;
	
private:
	System::UnicodeString FCaption;
	
protected:
	void __fastcall SetCaption(const System::UnicodeString NewCaption);
	
__published:
	__property System::UnicodeString Caption = {read=FCaption, write=SetCaption};
public:
	/* TGLBaseFontControl.Create */ inline __fastcall virtual TGLBaseTextControl(System::Classes::TComponent* AOwner) : TGLBaseFontControl(AOwner) { }
	/* TGLBaseFontControl.Destroy */ inline __fastcall virtual ~TGLBaseTextControl(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLBaseTextControl(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseFontControl(aParentOwner) { }
	
};


class PASCALIMPLEMENTATION TGLFocusControl : public TGLBaseTextControl
{
	typedef TGLBaseTextControl inherited;
	
private:
	TGLBaseControl* FRootControl;
	bool FFocused;
	Vcl::Controls::TKeyEvent FOnKeyDown;
	Vcl::Controls::TKeyEvent FOnKeyUp;
	Vcl::Controls::TKeyPressEvent FOnKeyPress;
	System::Classes::TShiftState FShiftState;
	Vectortypes::TVector4f FFocusedColor;
	
protected:
	virtual void __fastcall InternalKeyPress(System::WideChar &Key);
	virtual void __fastcall InternalKeyDown(System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall InternalKeyUp(System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall SetFocused(bool Value);
	TGLBaseControl* __fastcall GetRootControl(void);
	System::Uitypes::TColor __fastcall GetFocusedColor(void);
	void __fastcall SetFocusedColor(const System::Uitypes::TColor Val);
	
public:
	__fastcall virtual ~TGLFocusControl(void);
	DYNAMIC void __fastcall NotifyHide(void);
	DYNAMIC void __fastcall MoveTo(Glscene::TGLBaseSceneObject* newParent);
	void __fastcall ReGetRootControl(void);
	void __fastcall SetFocus(void);
	void __fastcall PrevControl(void);
	void __fastcall NextControl(void);
	virtual void __fastcall KeyPress(System::TObject* Sender, System::WideChar &Key);
	virtual void __fastcall KeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall KeyUp(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	
__published:
	__property TGLBaseControl* RootControl = {read=GetRootControl};
	__property bool Focused = {read=FFocused, write=SetFocused, nodefault};
	__property System::Uitypes::TColor FocusedColor = {read=GetFocusedColor, write=SetFocusedColor, nodefault};
	__property Vcl::Controls::TKeyEvent OnKeyDown = {read=FOnKeyDown, write=FOnKeyDown};
	__property Vcl::Controls::TKeyEvent OnKeyUp = {read=FOnKeyUp, write=FOnKeyUp};
	__property Vcl::Controls::TKeyPressEvent OnKeyPress = {read=FOnKeyPress, write=FOnKeyPress};
public:
	/* TGLBaseFontControl.Create */ inline __fastcall virtual TGLFocusControl(System::Classes::TComponent* AOwner) : TGLBaseTextControl(AOwner) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLFocusControl(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseTextControl(aParentOwner) { }
	
};


class DELPHICLASS TGLCustomControl;
typedef void __fastcall (__closure *TGLCustomRenderEvent)(TGLCustomControl* sender, Vcl::Graphics::TBitmap* Bitmap);

class PASCALIMPLEMENTATION TGLCustomControl : public TGLFocusControl
{
	typedef TGLFocusControl inherited;
	
private:
	void *FCustomData;
	System::TObject* FCustomObject;
	TGLCustomRenderEvent FOnRender;
	Glmaterial::TGLMaterial* FMaterial;
	Vcl::Graphics::TBitmap* FBitmap;
	Vcl::Graphics::TBitmap* FInternalBitmap;
	bool FBitmapChanged;
	float FXTexCoord;
	float FYTexCoord;
	int FInvalidRenderCount;
	int FMaxInvalidRenderCount;
	bool FCentered;
	void __fastcall SetCentered(const bool Value);
	
protected:
	void __fastcall OnBitmapChanged(System::TObject* Sender);
	void __fastcall SetBitmap(Vcl::Graphics::TBitmap* ABitmap);
	
public:
	__fastcall virtual TGLCustomControl(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLCustomControl(void);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	void __fastcall SetMaterial(Glmaterial::TGLMaterial* AMaterial);
	__property void * CustomData = {read=FCustomData, write=FCustomData};
	__property System::TObject* CustomObject = {read=FCustomObject, write=FCustomObject};
	
__published:
	__property TGLCustomRenderEvent OnRender = {read=FOnRender, write=FOnRender};
	__property bool Centered = {read=FCentered, write=SetCentered, nodefault};
	__property Glmaterial::TGLMaterial* Material = {read=FMaterial, write=SetMaterial};
	__property Vcl::Graphics::TBitmap* Bitmap = {read=FBitmap, write=SetBitmap};
	__property int MaxInvalidRenderCount = {read=FMaxInvalidRenderCount, write=FMaxInvalidRenderCount, nodefault};
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLCustomControl(Glscene::TGLBaseSceneObject* aParentOwner) : TGLFocusControl(aParentOwner) { }
	
};


class DELPHICLASS TGLPopupMenu;
typedef void __fastcall (__closure *TGLPopupMenuClick)(TGLPopupMenu* Sender, int index, const System::UnicodeString MenuItemText);

class PASCALIMPLEMENTATION TGLPopupMenu : public TGLFocusControl
{
	typedef TGLFocusControl inherited;
	
private:
	TGLPopupMenuClick FOnClick;
	System::Classes::TStrings* FMenuItems;
	int FSelIndex;
	float FMarginSize;
	float NewHeight;
	
protected:
	virtual void __fastcall SetFocused(bool Value);
	void __fastcall SetMenuItems(System::Classes::TStrings* Value);
	void __fastcall SetMarginSize(const float val);
	void __fastcall SetSelIndex(const int val);
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseMove(System::Classes::TShiftState Shift, int X, int Y);
	void __fastcall OnStringListChange(System::TObject* Sender);
	
public:
	__fastcall virtual TGLPopupMenu(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLPopupMenu(void);
	void __fastcall PopUp(int Px, int Py);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	virtual void __fastcall DoRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	virtual bool __fastcall MouseDown(System::TObject* Sender, Glcrossplatform::TGLMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	
__published:
	__property System::Classes::TStrings* MenuItems = {read=FMenuItems, write=SetMenuItems};
	__property TGLPopupMenuClick OnClick = {read=FOnClick, write=FOnClick};
	__property float MarginSize = {read=FMarginSize, write=SetMarginSize};
	__property int SelIndex = {read=FSelIndex, write=SetSelIndex, nodefault};
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLPopupMenu(Glscene::TGLBaseSceneObject* aParentOwner) : TGLFocusControl(aParentOwner) { }
	
};


class DELPHICLASS TGLForm;
typedef void __fastcall (__closure *TGLFormCanRequest)(TGLForm* Sender, bool &Can);

enum TGLFormCloseOptions : unsigned char { co_Hide, co_Ignore, co_Destroy };

typedef void __fastcall (__closure *TGLFormCanClose)(TGLForm* Sender, TGLFormCloseOptions &CanClose);

typedef void __fastcall (__closure *TGLFormNotify)(TGLForm* Sender);

typedef void __fastcall (__closure *TGLFormMove)(TGLForm* Sender, float &Left, float &Top);

class PASCALIMPLEMENTATION TGLForm : public TGLBaseTextControl
{
	typedef TGLBaseTextControl inherited;
	
private:
	TGLFormCanRequest FOnCanMove;
	TGLFormCanRequest FOnCanResize;
	TGLFormCanClose FOnCanClose;
	TGLFormNotify FOnShow;
	TGLFormNotify FOnHide;
	TGLFormMove FOnMoving;
	bool Moving;
	int OldX;
	int OldY;
	Vectortypes::TVector4f FTitleColor;
	float FTitleOffset;
	
protected:
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseUp(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseMove(System::Classes::TShiftState Shift, int X, int Y);
	System::Uitypes::TColor __fastcall GetTitleColor(void);
	void __fastcall SetTitleColor(System::Uitypes::TColor value);
	
public:
	__fastcall virtual TGLForm(System::Classes::TComponent* AOwner);
	void __fastcall Close(void);
	DYNAMIC void __fastcall NotifyShow(void);
	DYNAMIC void __fastcall NotifyHide(void);
	virtual bool __fastcall MouseUp(System::TObject* Sender, Glcrossplatform::TGLMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall MouseMove(System::TObject* Sender, System::Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	
__published:
	__property System::Uitypes::TColor TitleColor = {read=GetTitleColor, write=SetTitleColor, nodefault};
	__property TGLFormCanRequest OnCanMove = {read=FOnCanMove, write=FOnCanMove};
	__property TGLFormCanRequest OnCanResize = {read=FOnCanResize, write=FOnCanResize};
	__property TGLFormCanClose OnCanClose = {read=FOnCanClose, write=FOnCanClose};
	__property TGLFormNotify OnShow = {read=FOnShow, write=FOnShow};
	__property TGLFormNotify OnHide = {read=FOnHide, write=FOnHide};
	__property TGLFormMove OnMoving = {read=FOnMoving, write=FOnMoving};
	__property float TitleOffset = {read=FTitleOffset, write=FTitleOffset};
public:
	/* TGLBaseFontControl.Destroy */ inline __fastcall virtual ~TGLForm(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLForm(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseTextControl(aParentOwner) { }
	
};


class DELPHICLASS TGLPanel;
class PASCALIMPLEMENTATION TGLPanel : public TGLBaseControl
{
	typedef TGLBaseControl inherited;
	
public:
	/* TGLBaseComponent.Create */ inline __fastcall virtual TGLPanel(System::Classes::TComponent* AOwner) : TGLBaseControl(AOwner) { }
	/* TGLBaseComponent.Destroy */ inline __fastcall virtual ~TGLPanel(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLPanel(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseControl(aParentOwner) { }
	
};


class DELPHICLASS TGLCheckBox;
class PASCALIMPLEMENTATION TGLCheckBox : public TGLBaseControl
{
	typedef TGLBaseControl inherited;
	
private:
	bool FChecked;
	System::Classes::TNotifyEvent FOnChange;
	System::UnicodeString FGuiLayoutNameChecked;
	Glgui::TGLGuiComponent* FGuiCheckedComponent;
	int FGroup;
	
protected:
	void __fastcall SetChecked(bool NewChecked);
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseUp(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	void __fastcall SetGuiLayoutNameChecked(System::UnicodeString newName);
	virtual void __fastcall SetGuiLayout(Glgui::TGLGuiLayout* NewGui);
	void __fastcall SetGroup(const int val);
	
public:
	__fastcall virtual TGLCheckBox(System::Classes::TComponent* AOwner);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	virtual void __fastcall NotifyChange(System::TObject* Sender);
	
__published:
	__property int Group = {read=FGroup, write=SetGroup, nodefault};
	__property bool Checked = {read=FChecked, write=SetChecked, nodefault};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property System::UnicodeString GuiLayoutNameChecked = {read=FGuiLayoutNameChecked, write=SetGuiLayoutNameChecked};
public:
	/* TGLBaseComponent.Destroy */ inline __fastcall virtual ~TGLCheckBox(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLCheckBox(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseControl(aParentOwner) { }
	
};


class DELPHICLASS TGLButton;
class PASCALIMPLEMENTATION TGLButton : public TGLFocusControl
{
	typedef TGLFocusControl inherited;
	
private:
	bool FPressed;
	System::Classes::TNotifyEvent FOnButtonClick;
	System::UnicodeString FGuiLayoutNamePressed;
	Glgui::TGLGuiComponent* FGuiPressedComponent;
	Glmaterial::TGLMaterial* FBitBtn;
	int FGroup;
	float FLogicWidth;
	float FLogicHeight;
	float FXOffSet;
	float FYOffSet;
	bool FAllowUp;
	
protected:
	void __fastcall SetPressed(bool NewPressed);
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseUp(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalKeyDown(System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall InternalKeyUp(System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall SetFocused(bool Value);
	void __fastcall SetGuiLayoutNamePressed(System::UnicodeString newName);
	virtual void __fastcall SetGuiLayout(Glgui::TGLGuiLayout* NewGui);
	void __fastcall SetBitBtn(Glmaterial::TGLMaterial* AValue);
	DYNAMIC void __fastcall DestroyHandle(void);
	void __fastcall SetGroup(const int val);
	void __fastcall SetLogicWidth(const float val);
	void __fastcall SetLogicHeight(const float val);
	void __fastcall SetXOffset(const float val);
	void __fastcall SetYOffset(const float val);
	
public:
	__fastcall virtual TGLButton(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLButton(void);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	
__published:
	__property int Group = {read=FGroup, write=SetGroup, nodefault};
	__property Glmaterial::TGLMaterial* BitBtn = {read=FBitBtn, write=SetBitBtn};
	__property bool Pressed = {read=FPressed, write=SetPressed, nodefault};
	__property System::Classes::TNotifyEvent OnButtonClick = {read=FOnButtonClick, write=FOnButtonClick};
	__property System::UnicodeString GuiLayoutNamePressed = {read=FGuiLayoutNamePressed, write=SetGuiLayoutNamePressed};
	__property float LogicWidth = {read=FLogicWidth, write=SetLogicWidth};
	__property float LogicHeight = {read=FLogicHeight, write=SetLogicHeight};
	__property float XOffset = {read=FXOffSet, write=SetXOffset};
	__property float YOffset = {read=FYOffSet, write=SetYOffset};
	__property bool AllowUp = {read=FAllowUp, write=FAllowUp, nodefault};
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLButton(Glscene::TGLBaseSceneObject* aParentOwner) : TGLFocusControl(aParentOwner) { }
	
};


class DELPHICLASS TGLEdit;
class PASCALIMPLEMENTATION TGLEdit : public TGLFocusControl
{
	typedef TGLFocusControl inherited;
	
private:
	System::Classes::TNotifyEvent FOnChange;
	int FSelStart;
	bool FReadOnly;
	System::UnicodeString FEditChar;
	
protected:
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalKeyPress(System::WideChar &Key);
	virtual void __fastcall InternalKeyDown(System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall InternalKeyUp(System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall SetFocused(bool Value);
	void __fastcall SetSelStart(const int Value);
	void __fastcall SetEditChar(const System::UnicodeString Value);
	
public:
	__fastcall virtual TGLEdit(System::Classes::TComponent* AOwner);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	
__published:
	__property System::UnicodeString EditChar = {read=FEditChar, write=SetEditChar};
	__property bool ReadOnly = {read=FReadOnly, write=FReadOnly, default=0};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property int SelStart = {read=FSelStart, write=SetSelStart, nodefault};
public:
	/* TGLFocusControl.Destroy */ inline __fastcall virtual ~TGLEdit(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLEdit(Glscene::TGLBaseSceneObject* aParentOwner) : TGLFocusControl(aParentOwner) { }
	
};


class DELPHICLASS TGLLabel;
class PASCALIMPLEMENTATION TGLLabel : public TGLBaseTextControl
{
	typedef TGLBaseTextControl inherited;
	
private:
	System::Classes::TAlignment FAlignment;
	Glcrossplatform::TGLTextLayout FTextLayout;
	void __fastcall SetAlignment(const System::Classes::TAlignment Value);
	void __fastcall SetTextLayout(const Glcrossplatform::TGLTextLayout Value);
	
public:
	__fastcall virtual TGLLabel(System::Classes::TComponent* AOwner);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	
__published:
	__property System::Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, nodefault};
	__property Glcrossplatform::TGLTextLayout TextLayout = {read=FTextLayout, write=SetTextLayout, nodefault};
public:
	/* TGLBaseFontControl.Destroy */ inline __fastcall virtual ~TGLLabel(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLLabel(Glscene::TGLBaseSceneObject* aParentOwner) : TGLBaseTextControl(aParentOwner) { }
	
};


class DELPHICLASS TGLAdvancedLabel;
class PASCALIMPLEMENTATION TGLAdvancedLabel : public TGLFocusControl
{
	typedef TGLFocusControl inherited;
	
public:
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
public:
	/* TGLFocusControl.Destroy */ inline __fastcall virtual ~TGLAdvancedLabel(void) { }
	
public:
	/* TGLBaseFontControl.Create */ inline __fastcall virtual TGLAdvancedLabel(System::Classes::TComponent* AOwner) : TGLFocusControl(AOwner) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLAdvancedLabel(Glscene::TGLBaseSceneObject* aParentOwner) : TGLFocusControl(aParentOwner) { }
	
};


class DELPHICLASS TGLScrollbar;
class PASCALIMPLEMENTATION TGLScrollbar : public TGLFocusControl
{
	typedef TGLFocusControl inherited;
	
private:
	float FMin;
	float FMax;
	float FStep;
	float FPos;
	float FPageSize;
	System::Classes::TNotifyEvent FOnChange;
	System::UnicodeString FGuiLayoutKnobName;
	Glgui::TGLGuiComponent* FGuiKnobComponent;
	Glgui::TGUIDrawResult FKnobRenderStatus;
	float FScrollOffs;
	bool FScrolling;
	bool FHorizontal;
	bool FLocked;
	
protected:
	void __fastcall SetMin(const float val);
	void __fastcall SetMax(const float val);
	void __fastcall SetPos(const float val);
	void __fastcall SetPageSize(const float val);
	void __fastcall SetHorizontal(const bool val);
	void __fastcall SetGuiLayoutKnobName(System::UnicodeString newName);
	virtual void __fastcall SetGuiLayout(Glgui::TGLGuiLayout* NewGui);
	float __fastcall GetScrollPosY(float ScrollPos);
	float __fastcall GetYScrollPos(float Y);
	float __fastcall GetScrollPosX(float ScrollPos);
	float __fastcall GetXScrollPos(float X);
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseUp(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	virtual void __fastcall InternalMouseMove(System::Classes::TShiftState Shift, int X, int Y);
	
public:
	__fastcall virtual TGLScrollbar(System::Classes::TComponent* AOwner);
	void __fastcall StepUp(void);
	void __fastcall StepDown(void);
	void __fastcall PageUp(void);
	void __fastcall PageDown(void);
	virtual bool __fastcall MouseUp(System::TObject* Sender, Glcrossplatform::TGLMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall MouseMove(System::TObject* Sender, System::Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	
__published:
	__property bool Horizontal = {read=FHorizontal, write=SetHorizontal, nodefault};
	__property float Pos = {read=FPos, write=SetPos};
	__property float Min = {read=FMin, write=SetMin};
	__property float Max = {read=FMax, write=SetMax};
	__property float Step = {read=FStep, write=FStep};
	__property float PageSize = {read=FPageSize, write=SetPageSize};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property System::UnicodeString GuiLayoutKnobName = {read=FGuiLayoutKnobName, write=SetGuiLayoutKnobName};
	__property bool Locked = {read=FLocked, write=FLocked, default=0};
public:
	/* TGLFocusControl.Destroy */ inline __fastcall virtual ~TGLScrollbar(void) { }
	
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLScrollbar(Glscene::TGLBaseSceneObject* aParentOwner) : TGLFocusControl(aParentOwner) { }
	
};


class DELPHICLASS TGLStringGrid;
class PASCALIMPLEMENTATION TGLStringGrid : public TGLFocusControl
{
	typedef TGLFocusControl inherited;
	
private:
	int FSelCol;
	int FSelRow;
	bool FRowSelect;
	bool FColSelect;
	System::Classes::TStrings* FColumns;
	System::Classes::TList* FRows;
	Vectortypes::TVector4f FHeaderColor;
	int FMarginSize;
	int FColumnSize;
	int FRowHeight;
	TGLScrollbar* FScrollbar;
	bool FDrawHeader;
	
protected:
	bool __fastcall GetCell(int X, int Y, /* out */ int &oCol, /* out */ int &oRow);
	virtual void __fastcall InternalMouseDown(System::Classes::TShiftState Shift, Glcrossplatform::TGLMouseButton Button, int X, int Y);
	void __fastcall SetColumns(System::Classes::TStrings* const val);
	void __fastcall SetColSelect(const bool val);
	System::Classes::TStringList* __fastcall GetRow(int index);
	void __fastcall SetRow(int index, System::Classes::TStringList* const val);
	int __fastcall GetRowCount(void);
	void __fastcall SetRowCount(const int val);
	void __fastcall SetSelCol(const int val);
	void __fastcall SetSelRow(const int val);
	void __fastcall SetRowSelect(const bool val);
	void __fastcall SetDrawHeader(const bool val);
	System::Uitypes::TColor __fastcall GetHeaderColor(void);
	void __fastcall SetHeaderColor(const System::Uitypes::TColor val);
	void __fastcall SetMarginSize(const int val);
	void __fastcall SetColumnSize(const int val);
	void __fastcall SetRowHeight(const int val);
	void __fastcall SetScrollbar(TGLScrollbar* const val);
	virtual void __fastcall SetGuiLayout(Glgui::TGLGuiLayout* NewGui);
	
public:
	__fastcall virtual TGLStringGrid(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLStringGrid(void);
	void __fastcall Clear(void);
	int __fastcall Add(System::UnicodeString *Data, const int Data_Size)/* overload */;
	int __fastcall Add(const System::UnicodeString Data)/* overload */;
	void __fastcall SetText(System::UnicodeString Data);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	virtual void __fastcall NotifyChange(System::TObject* Sender);
	virtual void __fastcall InternalRender(Glrendercontextinfo::TRenderContextInfo &rci, bool renderSelf, bool renderChildren);
	void __fastcall OnStringListChange(System::TObject* Sender);
	__property System::Classes::TStringList* Row[int index] = {read=GetRow, write=SetRow};
	
__published:
	__property System::Uitypes::TColor HeaderColor = {read=GetHeaderColor, write=SetHeaderColor, nodefault};
	__property System::Classes::TStrings* Columns = {read=FColumns, write=SetColumns};
	__property int MarginSize = {read=FMarginSize, write=SetMarginSize, nodefault};
	__property int ColumnSize = {read=FColumnSize, write=SetColumnSize, nodefault};
	__property int RowHeight = {read=FRowHeight, write=SetRowHeight, nodefault};
	__property int RowCount = {read=GetRowCount, write=SetRowCount, nodefault};
	__property int SelCol = {read=FSelCol, write=SetSelCol, nodefault};
	__property int SelRow = {read=FSelRow, write=SetSelRow, nodefault};
	__property bool RowSelect = {read=FRowSelect, write=SetRowSelect, nodefault};
	__property bool ColSelect = {read=FColSelect, write=SetColSelect, nodefault};
	__property bool DrawHeader = {read=FDrawHeader, write=SetDrawHeader, nodefault};
	__property TGLScrollbar* Scrollbar = {read=FScrollbar, write=SetScrollbar};
public:
	/* TGLBaseSceneObject.CreateAsChild */ inline __fastcall TGLStringGrid(Glscene::TGLBaseSceneObject* aParentOwner) : TGLFocusControl(aParentOwner) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall UnpressGroup(Glscene::TGLBaseSceneObject* CurrentObject, int AGroupID);
}	/* namespace Glwindows */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLWINDOWS)
using namespace Glwindows;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlwindowsHPP
