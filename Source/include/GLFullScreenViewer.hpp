// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GLFullScreenViewer.pas' rev: 24.00 (Win32)

#ifndef GlfullscreenviewerHPP
#define GlfullscreenviewerHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <GLViewer.hpp>	// Pascal unit
#include <GLScene.hpp>	// Pascal unit
#include <GLContext.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Glfullscreenviewer
{
//-- type declarations -------------------------------------------------------
enum TGLScreenDepth : unsigned char { sd8bits, sd16bits, sd24bits, sd32bits };

class DELPHICLASS TGLFullScreenViewer;
class PASCALIMPLEMENTATION TGLFullScreenViewer : public Glscene::TGLNonVisualViewer
{
	typedef Glscene::TGLNonVisualViewer inherited;
	
private:
	bool FFormIsOwned;
	Vcl::Forms::TForm* FForm;
	HWND FOwnDC;
	TGLScreenDepth FScreenDepth;
	bool FActive;
	bool FSwitchedResolution;
	bool FManualRendering;
	int FUpdateCount;
	Vcl::Controls::TMouseEvent FOnMouseDown;
	Vcl::Controls::TMouseEvent FOnMouseUp;
	Vcl::Controls::TMouseMoveEvent FOnMouseMove;
	Vcl::Controls::TMouseWheelEvent FOnMouseWheel;
	Vcl::Controls::TMouseWheelUpDownEvent FOnMouseWheelDown;
	Vcl::Controls::TMouseWheelUpDownEvent FOnMouseWheelUp;
	System::Classes::TNotifyEvent FOnClick;
	System::Classes::TNotifyEvent FOnDblClick;
	Vcl::Controls::TKeyEvent FOnKeyDown;
	Vcl::Controls::TKeyEvent FOnKeyUp;
	Vcl::Controls::TKeyPressEvent FOnKeyPress;
	Vcl::Forms::TCloseEvent FOnClose;
	Vcl::Forms::TCloseQueryEvent FOnCloseQuery;
	bool FStayOnTop;
	Glcontext::TVSyncMode FVSync;
	int FRefreshRate;
	System::Uitypes::TCursor FCursor;
	Vcl::Menus::TPopupMenu* FPopupMenu;
	void __fastcall SetScreenDepth(const TGLScreenDepth val);
	void __fastcall SetActive(const bool val);
	void __fastcall SetOnMouseDown(const Vcl::Controls::TMouseEvent val);
	void __fastcall SetOnMouseUp(const Vcl::Controls::TMouseEvent val);
	void __fastcall SetOnMouseMove(const Vcl::Controls::TMouseMoveEvent val);
	void __fastcall SetOnMouseWheel(const Vcl::Controls::TMouseWheelEvent val);
	void __fastcall SetOnMouseWheelDown(const Vcl::Controls::TMouseWheelUpDownEvent val);
	void __fastcall SetOnMouseWheelUp(const Vcl::Controls::TMouseWheelUpDownEvent val);
	void __fastcall SetOnClick(const System::Classes::TNotifyEvent val);
	void __fastcall SetOnDblClick(const System::Classes::TNotifyEvent val);
	void __fastcall SetOnCloseQuery(const Vcl::Forms::TCloseQueryEvent val);
	void __fastcall SetOnClose(const Vcl::Forms::TCloseEvent val);
	void __fastcall SetOnKeyUp(const Vcl::Controls::TKeyEvent val);
	void __fastcall SetOnKeyDown(const Vcl::Controls::TKeyEvent val);
	void __fastcall SetOnKeyPress(const Vcl::Controls::TKeyPressEvent val);
	void __fastcall SetStayOnTop(const bool val);
	void __fastcall SetCursor(const System::Uitypes::TCursor val);
	void __fastcall SetPopupMenu(Vcl::Menus::TPopupMenu* const val);
	void __fastcall SetForm(Vcl::Forms::TForm* aVal);
	void __fastcall SetManualRendering(const bool val);
	
protected:
	HWND __fastcall GetHandle(void);
	void __fastcall DoBeforeRender(System::TObject* Sender);
	virtual void __fastcall DoBufferChange(System::TObject* Sender);
	virtual void __fastcall DoBufferStructuralChange(System::TObject* Sender);
	void __fastcall Startup(void);
	void __fastcall Shutdown(void);
	void __fastcall BindFormEvents(void);
	void __fastcall DoCloseQuery(System::TObject* Sender, bool &CanClose);
	void __fastcall DoPaint(System::TObject* Sender);
	void __fastcall DoActivate(System::TObject* Sender);
	void __fastcall DoDeactivate(System::TObject* Sender);
	void __fastcall DoFormDestroy(System::TObject* Sender);
	
public:
	__fastcall virtual TGLFullScreenViewer(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TGLFullScreenViewer(void);
	virtual void __fastcall Render(Glscene::TGLBaseSceneObject* baseObject = (Glscene::TGLBaseSceneObject*)(0x0));
	void __fastcall UseCurrentResolution(void);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	__property bool Active = {read=FActive, write=SetActive, nodefault};
	void __fastcall ReActivate(void);
	__property HWND Handle = {read=GetHandle, nodefault};
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	float __fastcall LastFrameTime(void);
	float __fastcall FramesPerSecond(void);
	System::UnicodeString __fastcall FramesPerSecondText(int decimals = 0x1);
	void __fastcall ResetPerformanceMonitor(void);
	__property HWND RenderDC = {read=FOwnDC, nodefault};
	
__published:
	__property Vcl::Forms::TForm* Form = {read=FForm, write=SetForm};
	__property bool ManualRendering = {read=FManualRendering, write=SetManualRendering, nodefault};
	__property TGLScreenDepth ScreenDepth = {read=FScreenDepth, write=SetScreenDepth, default=3};
	__property bool StayOnTop = {read=FStayOnTop, write=SetStayOnTop, default=0};
	__property Glcontext::TVSyncMode VSync = {read=FVSync, write=FVSync, default=0};
	__property int RefreshRate = {read=FRefreshRate, write=FRefreshRate, nodefault};
	__property System::Uitypes::TCursor Cursor = {read=FCursor, write=SetCursor, default=0};
	__property Vcl::Menus::TPopupMenu* PopupMenu = {read=FPopupMenu, write=SetPopupMenu};
	__property Vcl::Forms::TCloseEvent OnClose = {read=FOnClose, write=SetOnClose};
	__property Vcl::Controls::TKeyEvent OnKeyUp = {read=FOnKeyUp, write=SetOnKeyUp};
	__property Vcl::Controls::TKeyEvent OnKeyDown = {read=FOnKeyDown, write=SetOnKeyDown};
	__property Vcl::Controls::TKeyPressEvent OnKeyPress = {read=FOnKeyPress, write=SetOnKeyPress};
	__property Vcl::Forms::TCloseQueryEvent OnCloseQuery = {read=FOnCloseQuery, write=SetOnCloseQuery};
	__property System::Classes::TNotifyEvent OnClick = {read=FOnClick, write=SetOnClick};
	__property System::Classes::TNotifyEvent OnDblClick = {read=FOnDblClick, write=SetOnDblClick};
	__property Vcl::Controls::TMouseEvent OnMouseDown = {read=FOnMouseDown, write=SetOnMouseDown};
	__property Vcl::Controls::TMouseEvent OnMouseUp = {read=FOnMouseUp, write=SetOnMouseUp};
	__property Vcl::Controls::TMouseMoveEvent OnMouseMove = {read=FOnMouseMove, write=SetOnMouseMove};
	__property Vcl::Controls::TMouseWheelEvent OnMouseWheel = {read=FOnMouseWheel, write=SetOnMouseWheel};
	__property Vcl::Controls::TMouseWheelUpDownEvent OnMouseWheelDown = {read=FOnMouseWheelDown, write=SetOnMouseWheelDown};
	__property Vcl::Controls::TMouseWheelUpDownEvent OnMouseWheelUp = {read=FOnMouseWheelUp, write=SetOnMouseWheelUp};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall Register(void);
}	/* namespace Glfullscreenviewer */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GLFULLSCREENVIEWER)
using namespace Glfullscreenviewer;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GlfullscreenviewerHPP
