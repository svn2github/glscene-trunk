// GLSceneRegister
{: Registration unit for GLScene library components, property editors and
      IDE experts.<p>

	<b>History : </b><font size=-1><ul>
      <li>22/08/02 - EG - RegisterPropertiesInCategory (Robin Gerrets)
      <li>08/04/02 - EG - Added verb to TGLSceneEditor
      <li>26/01/02 - EG - Color property drawing in D6 too now
      <li>22/08/01 - EG - D6 related changes
      <li>08/07/01 - EG - Register for TGLExtrusionSolid (Uwe Raabe)
      <li>18/02/01 - EG - Added Terrain/HeightData objects
      <li>21/01/01 - EG - Enhanced GetAttributes for some property editors
      <li>09/10/00 - EG - Added registration for TGLMultiPolygon
      <li>09/06/00 - EG - Added TSoundFileProperty & TSoundNameProperty
      <li>23/05/00 - EG - Added GLCollision
      <li>16/05/00 - EG - Delphi 4 Compatibility
      <li>28/04/00 - EG - Removed ObjectStock in TObjectManager (was useless)
      <li>26/04/00 - EG - Added Categories in ObjectManager,
                          enhanced GetRegisteredSceneObjects
      <li>16/04/00 - EG - Objects icons are now loaded from ressources using
                          ClassName (more VCL-like)
		<li>11/04/00 - EG - Components now install under 'GLScene',
								  Fixed DestroySceneObjectList (thanks Uwe Raabe)
		<li>06/04/00 - EG - Added TGLBehavioursProperty
		<li>18/03/00 - EG - Added TGLImageClassProperty
		<li>13/03/00 - EG - Updated TGLTextureImageProperty
      <li>14/02/00 - EG - Added MaterialLibrary editor and picker
      <li>09/02/00 - EG - ObjectManager moved in, ObjectManager is now fully
                          object-oriented and encapsulated
      <li>06/02/00 - EG - Fixed TGLScenedEditor logic
                          (was causing Delphi IDE crashes on package unload)
      <li>05/02/00 - EG - Added TGLColorProperty and TGLCoordinatesProperty
	</ul></font>
}
unit GLSceneRegister;

// Registration unit for GLScene library
// 30-DEC-99 ml: scene editor added, structural changes

interface

{$i GLScene.inc}

uses
   GLScene, Classes,
{$ifdef WIN32}
   Windows, Controls, StdCtrls,
   {$ifdef GLS_DELPHI_5_UP}
      FMaterialEditorForm, FLibMaterialPicker,
   {$endif}
{$endif}
{$ifdef LINUX}
   QControls, QImgList, QGraphics,
{$endif}

{$ifdef GLS_DELPHI_6_UP}
   DesignIntf, DesignEditors, VCLEditors
{$else}
   DsgnIntf
{$endif};

type

	PSceneObjectEntry = ^TGLSceneObjectEntry;
	// holds a relation between an scene object class, its global identification,
	// its location in the object stock and its icon reference
	TGLSceneObjectEntry = record
								  ObjectClass : TGLSceneObjectClass;
								  Name : String[32];     // type name of the object
                          Category : String[32]; // category of object
								  Index,                 // index into "FObjectStock"
								  ImageIndex : Integer;  // index into "FObjectIcons"
								end;

	// TObjectManager
   //
   TObjectManager = class (TObject)
      private
         { Private Declarations }
         FSceneObjectList : TList;
         FObjectIcons : TImageList;       // a list of icons for scene objects
         FOverlayIndex,                   // indices into the object icon list
         FSceneRootIndex,
         FCameraRootIndex,
         FLightsourceRootIndex,
         FObjectRootIndex,
         FStockObjectRootIndex : Integer;

      protected
			{ Protected Declarations }
         procedure CreateDefaultObjectIcons;
         procedure DestroySceneObjectList;
         function FindSceneObjectClass(AObjectClass: TGLSceneObjectClass;
                                       const ASceneObject: String = '') : PSceneObjectEntry;

      public
         { Public Declarations }
         constructor Create;
			destructor Destroy; override;

			function GetClassFromIndex(Index: Integer): TGLSceneObjectClass;
			function GetImageIndex(ASceneObject: TGLSceneObjectClass) : Integer;
         function GetCategory(ASceneObject: TGLSceneObjectClass) : String;
			procedure GetRegisteredSceneObjects(ObjectList: TStringList);
			//: Registers a stock object and adds it to the stock object list
			procedure RegisterSceneObject(ASceneObject: TGLSceneObjectClass; const aName, aCategory : String);
         //: Unregisters a stock object and removes it from the stock object list
			procedure UnRegisterSceneObject(ASceneObject: TGLSceneObjectClass);
//         procedure Notify(Sender: TPlugInManager; Operation: TOperation; PlugIn: Integer); override;

         property ObjectIcons: TImageList read FObjectIcons;
         property SceneRootIndex: Integer read FSceneRootIndex;
         property LightsourceRootIndex: Integer read FLightsourceRootIndex;
			property CameraRootIndex: Integer read FCameraRootIndex;
         property ObjectRootIndex: Integer read FObjectRootIndex;

      end;

procedure Register;

//: Auto-create for object manager
function ObjectManager : TObjectManager;

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

{$R GLSceneRegister.res}

uses
   Geometry, GLTexture, SysUtils, GLCrossPlatform, GLStrings, GLScreen, GLMisc,
   GLObjects, GLVectorFileObjects, GLExtrusion, GLMultiPolygon, GLMesh, GLPortal,
   GLGraph, GLParticles, GLHUDObjects, GLSkydome, GLBitmapFont, GLLensFlare,
   GLMirror, GLParticleFX, GLShadowPlane, GLTerrainRenderer, GLShadowVolume,
   GLTeapot, GLPolyhedron, GLGeomObjects, GLTextureImageEditors,

{$ifdef WIN32}
   FVectorEditor, GLSound,
   TypInfo, GLCadencer, GLCollision,
   GLSoundFileObjects, GLFireFX, GLThorFX,
   GLHeightData, GLzBuffer, GLGui,

   GLWindows, GLWindowsFont, GLHeightTileFileHDS,

   GLSceneEdit, Graphics, Dialogs, ExtDlgs, Forms,
   GLWin32Viewer, GLSpaceText, AsyncTimer
{$endif}
{$ifdef LINUX}
   GLLinuxViewer
{$endif}
   ;

{$ifdef GLS_DELPHI_5_UP}
resourcestring
   { OpenGL property category }
   sOpenGLCategoryName = 'OpenGL';
{$ifdef GLS_DELPHI_5}
   sOpenGLCategoryDescription = 'Properties dealing with OpenGL graphics';

type
   TOpenGLCategory = class (TPropertyCategory)
      public
         class function Name: string; override;
         class function Description: string; override;
   end;
{$endif}
{$endif}

var
	vObjectManager : TObjectManager;

function ObjectManager : TObjectManager;
begin
   if not Assigned(vObjectManager) then
      vObjectManager:=TObjectManager.Create;
   Result:=vObjectManager;
end;


{ TODO : Moving property editors to the public interface }

type

   // TGLSceneViewerEditor
   //
   TGLSceneViewerEditor = class(TComponentEditor)
      public
			{ Public Declarations }
			procedure ExecuteVerb(Index: Integer); override;
			function GetVerb(Index: Integer): String; override;
			function GetVerbCount: Integer; override;
	end;

   // TGLSceneEditor
   //
   TGLSceneEditor = class (TComponentEditor)
      public
         { Public Declarations }
         procedure Edit; override;

			procedure ExecuteVerb(Index: Integer); override;
			function GetVerb(Index: Integer): String; override;
			function GetVerbCount: Integer; override;
   end;

{$ifdef WIN32}
   // TResolutionProperty
   //
   TResolutionProperty = class (TPropertyEditor)
      public
         { Public Declarations }
   	   function GetAttributes: TPropertyAttributes; override;
	      function GetValue : String; override;
	      procedure GetValues(Proc: TGetStrProc); override;
   	   procedure SetValue(const Value: String); override;
   end;
{$endif}

   // TClassProperty
   //
   TGLTextureProperty = class (TClassProperty)
      protected
			{ Protected Declarations }
	      function GetAttributes: TPropertyAttributes; override;
  end;

	// TGLTextureImageProperty
	//
	TGLTextureImageProperty = class(TClassProperty)
		protected
			{ Protected Declarations }
			function GetAttributes: TPropertyAttributes; override;
			procedure Edit; override;
	end;

	// TGLImageClassProperty
	//
	TGLImageClassProperty = class(TClassProperty)
		protected
			{ Protected Declarations }
			function GetAttributes : TPropertyAttributes; override;
			procedure GetValues(proc : TGetStrProc); override;

		public
			{ Public Declarations }
			function GetValue : String; override;
			procedure SetValue(const value : String); override;
	end;

{$ifdef WIN32}
   {$ifdef GLS_COMPILER_5_UP}
   // TGLColorProperty
   //
   {$ifndef GLS_COMPILER_6_UP}
   TGLColorProperty = class (TClassProperty)
   {$else}
   TGLColorProperty = class (TClassProperty,
                             ICustomPropertyDrawing, ICustomPropertyListDrawing)
   {$endif}
      private
			{ Private Declarations }

      protected
			{ Protected Declarations }
	      function GetAttributes: TPropertyAttributes; override;
	      procedure GetValues(Proc: TGetStrProc); override;
	      procedure Edit; override;

         function ColorToBorderColor(aColor: TColorVector; selected : Boolean) : TColor;

      public
	      {$ifdef GLS_COMPILER_5}
	      procedure ListDrawValue(const Value: string; ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean); override;
	      procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean); override;
	      {$endif}
	      {$ifdef GLS_COMPILER_6_UP}
         // ICustomPropertyListDrawing  stuff
         procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas; var AHeight: Integer);
         procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas; var AWidth: Integer);
         procedure ListDrawValue(const Value: string; ACanvas: TCanvas; const ARect: TGLRect; ASelected: Boolean);
         // CustomPropertyDrawing
         procedure PropDrawName(ACanvas: TCanvas; const ARect: TGLRect; ASelected: Boolean);
         procedure PropDrawValue(ACanvas: TCanvas; const ARect: TGLRect; ASelected: Boolean);
         {$endif}

	      function GetValue: String; override;
	      procedure SetValue(const Value: string); override;
   end;
   {$endif}
{$endif}

{$ifdef WIN32}
   // TVectorFileProperty
   //
   TVectorFileProperty = class (TClassProperty)
      protected
         { Protected Declarations }
         function GetAttributes: TPropertyAttributes; override;
         function GetValue: String; override;
         procedure Edit; override;
         procedure SetValue(const Value: string); override;
   end;

   // TSoundFileProperty
   //
   TSoundFileProperty = class (TClassProperty)
      protected
         { Protected Declarations }
         function GetAttributes : TPropertyAttributes; override;
         function GetValue: String; override;
         procedure Edit; override;
   end;

   // TSoundNameProperty
   //
   TSoundNameProperty = class (TStringProperty)
      protected
         { Protected Declarations }
         function GetAttributes : TPropertyAttributes; override;
      	procedure GetValues(Proc: TGetStrProc); override;
   end;

   // TGLCoordinatesProperty
   //
   TGLCoordinatesProperty = class(TClassProperty)
      protected
         { Protected Declarations }
         function GetAttributes: TPropertyAttributes; override;
         procedure Edit; override;
   end;

{$ifdef GLS_DELPHI_5_UP}
	// TGLMaterialProperty
	//
	TGLMaterialProperty = class(TClassProperty)
		protected
			{ Protected Declarations }
         function GetAttributes: TPropertyAttributes; override;
         procedure Edit; override;
   end;

   // TReuseableDefaultEditor
   //
   {: Editor copied from DsgnIntf.<p>
      Could have been avoided, if only that guy at Borland didn't chose to
      publish only half of the stuff (and that's not the only class with
      that problem, most of the subitems handling code in TGLSceneBaseObject is
      here for the same reason...), the "protected" wasn't meant just to lure
      programmers into code they can't reuse... Arrr! and he did that again
      in D6! Grrr... }
{$ifdef GLS_DELPHI_6_UP}
   TReuseableDefaultEditor = class (TComponentEditor, IDefaultEditor)
{$else}
   TReuseableDefaultEditor = class (TComponentEditor)
{$endif}
      protected
			{ Protected Declarations }
{$ifdef GLS_DELPHI_6_UP}
         FFirst: IProperty;
         FBest: IProperty;
         FContinue: Boolean;
         procedure CheckEdit(const Prop : IProperty);
         procedure EditProperty(const Prop: IProperty; var Continue: Boolean); virtual;
{$else}
         FFirst: TPropertyEditor;
			FBest: TPropertyEditor;
         FContinue: Boolean;
         procedure CheckEdit(PropertyEditor : TPropertyEditor);
         procedure EditProperty(PropertyEditor : TPropertyEditor;
                                var Continue, FreeEditor : Boolean); virtual;
{$endif}

      public
         { Public Declarations }
         procedure Edit; override;
   end;
{$endif}

   // TGLMaterialLibraryEditor
   //
   {: Editor for material library.<p> }
   TGLMaterialLibraryEditor = class(TReuseableDefaultEditor{$ifdef GLS_DELPHI_6_UP}, IDefaultEditor{$endif})
      protected
{$ifdef GLS_DELPHI_6_UP}
         procedure EditProperty(const Prop: IProperty; var Continue: Boolean); override;
{$else}
         procedure EditProperty(PropertyEditor: TPropertyEditor;
										  var Continue, FreeEditor: Boolean); override;
{$endif}
	end;

	// TGLLibMaterialNameProperty
	//
	TGLLibMaterialNameProperty = class(TStringProperty)
		protected
			{ Protected Declarations }
         function GetAttributes: TPropertyAttributes; override;
			procedure Edit; override;
	end;

	// TGLAnimationNameProperty
	//
	TGLAnimationNameProperty = class(TStringProperty)
		protected
			{ Protected Declarations }
			function GetAttributes : TPropertyAttributes; override;
			procedure GetValues(proc : TGetStrProc); override;

		public
			{ Public Declarations }
	end;

{$endif}

//----------------- TObjectManager ---------------------------------------------

// Create
//
constructor TObjectManager.Create;
begin
  inherited;
  FSceneObjectList:=TList.Create;
  CreateDefaultObjectIcons;
end;

// Destroy
//
destructor TObjectManager.Destroy;
begin
	DestroySceneObjectList;
   FObjectIcons.Free;
   inherited Destroy;
end;

// Notify
//
//procedure TObjectManager.Notify(Sender: TPlugInManager; Operation: TOperation; PlugIn: Integer);
//begin
//end;

// FindSceneObjectClass
//
function TObjectManager.FindSceneObjectClass(AObjectClass: TGLSceneObjectClass;
                           const aSceneObject: String = '') : PSceneObjectEntry;
var
   I     : Integer;
   Found : Boolean;
begin
   Result:=nil;
   Found:=False;
   with FSceneObjectList do begin
      for I:=0 to Count-1 do
         with TGLSceneObjectEntry(Items[I]^) do
         if (ObjectClass = AObjectClass) and (Length(ASceneObject) = 0)
               or (CompareText(Name, ASceneObject) = 0) then begin
            Found:=True;
            Break;
         end;
      if Found then Result:=Items[I];
   end;
end;

// GetClassFromIndex
//
function TObjectManager.GetClassFromIndex(Index: Integer): TGLSceneObjectClass;
begin
   if Index<0 then
      Index:=0;
   if Index>FSceneObjectList.Count-1 then
      Index:=FSceneObjectList.Count-1;
  Result:=TGLSceneObjectEntry(FSceneObjectList.Items[Index+1]^).ObjectClass;
end;

// GetImageIndex
//
function TObjectManager.GetImageIndex(ASceneObject: TGLSceneObjectClass) : Integer;
var
   classEntry : PSceneObjectEntry;
begin
   classEntry:=FindSceneObjectClass(ASceneObject);
   if Assigned(classEntry) then
      Result:=classEntry^.ImageIndex
   else Result:=0;
end;

// GetCategory
//
function TObjectManager.GetCategory(ASceneObject: TGLSceneObjectClass) : String;
var
   classEntry : PSceneObjectEntry;
begin
   classEntry:=FindSceneObjectClass(ASceneObject);
   if Assigned(classEntry) then
      Result:=classEntry^.Category
   else Result:='';
end;

// GetRegisteredSceneObjects
//
procedure TObjectManager.GetRegisteredSceneObjects(objectList: TStringList);
var
   i : Integer;
begin
   if Assigned(objectList) then with objectList do begin
      Clear;
      for i:=1 to FSceneObjectList.Count-1 do
         with TGLSceneObjectEntry(FSceneObjectList.Items[I]^) do
            AddObject(Name, Pointer(ObjectClass));
   end;
end;

// RegisterSceneObject
//
procedure TObjectManager.RegisterSceneObject(ASceneObject: TGLSceneObjectClass;
                                             const aName, aCategory : String);
var
   newEntry  : PSceneObjectEntry;
   pic       : TPicture;
   resBitmapName : String;
   bmp : TBitmap;
begin
   RegisterNoIcon([aSceneObject]);
   with FSceneObjectList do begin
      // make sure no class is registered twice
      if Assigned(FindSceneObjectClass(ASceneObject, AName)) then Exit;
      New(NewEntry);
      pic:=TPicture.Create;
      try
         with NewEntry^ do begin
            // object stock stuff
            // registered objects list stuff
            ObjectClass:=ASceneObject;
            NewEntry^.Name:=aName;
            NewEntry^.Category:=aCategory;
            Index:=FSceneObjectList.Count;
            resBitmapName:=ASceneObject.ClassName;
            {$ifdef WIN32}
            // dunno how to load from a resource in Kylix
            Pic.Bitmap.Handle:=LoadBitmap(HInstance, PChar(resBitmapName));
            {$endif}
            bmp:=TBitmap.Create;
            bmp.PixelFormat:=glpf24bit;
            bmp.Width:=24; bmp.Height:=24;
            bmp.Canvas.Draw(0, 0, Pic.Bitmap);
            Pic.Bitmap:=bmp;
            bmp.Free;
            if Cardinal(Pic.Bitmap.Handle)<>0 then begin
               FObjectIcons.AddMasked(Pic.Bitmap, Pic.Bitmap.Canvas.Pixels[0, 0]);
               ImageIndex:=FObjectIcons.Count-1;
            end else ImageIndex:=0;
		   end;
         Add(NewEntry);
      finally
         pic.Free;
      end;
   end;
end;

// UnRegisterSceneObject
//
procedure TObjectManager.UnRegisterSceneObject(ASceneObject: TGLSceneObjectClass);
var
   oldEntry : PSceneObjectEntry;
begin
   // find the class in the scene object list
   OldEntry:=FindSceneObjectClass(ASceneObject);
   // found?
   if assigned(OldEntry) then begin
	   // remove its entry from the list of registered objects
	   FSceneObjectList.Remove(OldEntry);
	   // finally free the memory for the entry
	   Dispose(OldEntry);
   end;
end;

// CreateDefaultObjectIcons
//
procedure TObjectManager.CreateDefaultObjectIcons;
var
   pic : TPicture;
begin
   pic:=TPicture.Create;
   // load first pic to get size
   {$ifdef WIN32}
   pic.Bitmap.Handle:=LoadBitmap(HInstance, 'GLS_CROSS_16');
   {$endif}
   FObjectIcons:=TImageList.CreateSize(Pic.Width, Pic.height);
   {$ifdef WIN32}
   with FObjectIcons, pic.Bitmap.Canvas do begin
      try
         // There's a more direct way for loading images into the image list, but
         // the image quality suffers too much
         AddMasked(Pic.Bitmap, Pixels[0, 0]); FOverlayIndex:=Count-1;
         Overlay(FOverlayIndex, 0); // used as indicator for disabled objects
         Pic.Bitmap.Handle:=LoadBitmap(HInstance, 'GLS_UNIVERSE2_16');
         AddMasked(Pic.Bitmap, Pixels[0, 0]); FSceneRootIndex:=Count-1;
         Pic.Bitmap.Handle:=LoadBitmap(HInstance, 'GLS_CAMERA2_16');
         AddMasked(Pic.Bitmap, Pixels[0, 0]); FCameraRootIndex:=Count-1;
         Pic.Bitmap.Handle:=LoadBitmap(HInstance, 'GLS_LAMPS2_16');
         AddMasked(Pic.Bitmap, Pixels[0, 0]); FLightsourceRootIndex:=Count-1;
         Pic.Bitmap.Handle:=LoadBitmap(HInstance, 'GLS_OBJECTS2_16');
         AddMasked(Pic.Bitmap, Pixels[0, 0]); FObjectRootIndex:=Count-1;
         AddMasked(Pic.Bitmap, Pixels[0, 0]); FStockObjectRootIndex:=Count-1;
      finally
         Pic.Free;
      end;
   end;
   {$endif}
end;

// DestroySceneObjectList
//
procedure TObjectManager.DestroySceneObjectList;
var
	i : Integer;
begin
	with FSceneObjectList do begin
		for i:=0 to Count-1 do
			Dispose(PSceneObjectEntry(Items[I]));
		Free;
	end;
end;

//----------------- TOpenGLCategory --------------------------------------------

{$ifdef GLS_DELPHI_5}
class function TOpenGLCategory.Name: string;
begin
   Result:=sOpenGLCategoryName;
end;

class function TOpenGLCategory.Description: string;
begin
   Result:=sOpenGLCategoryDescription;
end;
{$endif}

//----------------- TGLSceneViewerEditor ---------------------------------------

// ExecuteVerb
//
procedure TGLSceneViewerEditor.ExecuteVerb(Index : Integer);
var
   source : TGLSceneViewer;
begin
   source:=Component as TGLSceneViewer;
   case Index of
      0 : source.Buffer.ShowInfo;
   end;
end;

// GetVerb
//
function TGLSceneViewerEditor.GetVerb(Index : Integer) : String;
begin
   case Index of
      0 : Result:='Show context info';
   end;
end;

// GetVerbCount
//
function TGLSceneViewerEditor.GetVerbCount: Integer;
begin
   Result:=1;
end;

//----------------- TGLSceneEditor ---------------------------------------------

// Edit
//
procedure TGLSceneEditor.Edit;
begin
   {$ifdef WIN32}
   with GLSceneEditorForm do begin
      SetScene(Self.Component as TGLScene, Self.Designer);
      Show;
   end;
   {$else}
   InformationDlg('Unsupported on this platform');
   {$endif}
end;

// ExecuteVerb
//
procedure TGLSceneEditor.ExecuteVerb(Index : Integer);
begin
   case Index of
      0 : Edit;
   end;
end;

// GetVerb
//
function TGLSceneEditor.GetVerb(Index : Integer) : String;
begin
   case Index of
      0 : Result:='Show Scene Editor';
   end;
end;

// GetVerbCount
//
function TGLSceneEditor.GetVerbCount: Integer;
begin
   Result:=1;
end;

//----------------- TResolutionProperty ----------------------------------------

{$ifdef WIN32}

// GetAttributes
//
function TResolutionProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paValueList];
end;

// GetValue
//
function TResolutionProperty.GetValue : String;
begin
   Result:=VideoModes[GetOrdValue].Description;
end;

// GetValues
//
procedure TResolutionProperty.GetValues(Proc: TGetStrProc);
var
   i : Integer;
begin
   for i:=0 to NumberVideoModes-1 do
      Proc(VideoModes[i].Description);
end;

// SetValue
//
procedure TResolutionProperty.SetValue(const Value: String);

const Nums = ['0'..'9'];

var XRes,YRes,BPP : Integer;
    Pos, SLength  : Integer;
    TempStr       : String;

begin
  if CompareText(Value,'default') <> 0 then
  begin
    // initialize scanning
    TempStr:=Trim(Value)+'|'; // ensure at least one delimiter
    SLength:=Length(TempStr);
    XRes:=0; YRes:=0; BPP:=0;
    // contains the string something?
    if SLength > 1 then
    begin
      // determine first number
      for Pos:=1 to SLength do
        if not (TempStr[Pos] in Nums) then Break;
      if Pos <= SLength then
      begin
        // found a number?
        XRes:=StrToInt(Copy(TempStr,1,Pos-1));
        // search for following non-numerics
        for Pos:=Pos to SLength do
          if TempStr[Pos] in Nums then Break;
        Delete(TempStr,1,Pos-1); // take it out of the String
        SLength:=Length(TempStr); // rest length of String
        if SLength > 1 then // something to scan?
        begin
          // determine second number
          for Pos:=1 to SLength do
            if not (TempStr[Pos] in Nums) then Break;
          if Pos <= SLength then
          begin
            YRes:=StrToInt(Copy(TempStr,1,Pos-1));
            // search for following non-numerics
            for Pos:=Pos to SLength do
              if TempStr[Pos] in Nums then Break;
            Delete(TempStr,1,Pos-1); // take it out of the String
            SLength:=Length(TempStr); // rest length of String
            if SLength > 1 then
            begin
              for Pos:=1 to SLength do
                if not (TempStr[Pos] in Nums) then Break;
              if Pos <= SLength then BPP:=StrToInt(Copy(TempStr,1,Pos-1));
            end;
          end;
        end;
      end;
    end;
    SetOrdValue(GetIndexFromResolution(XRes,YRes,BPP));
  end
  else SetOrdValue(0);
end;
{$endif}

//----------------- TGLTextureProperty -----------------------------------------

function TGLTextureProperty.GetAttributes: TPropertyAttributes;
begin
  Result:=[paSubProperties];
end;

//----------------- TGLTextureImageProperty ------------------------------------

// GetAttributes
//
function TGLTextureImageProperty.GetAttributes: TPropertyAttributes;
begin
	Result:=[paDialog];
end;

// Edit
//
procedure TGLTextureImageProperty.Edit;
var
	ownerTexture : TGLTexture;
begin
	ownerTexture:=TGLTextureImage(GetOrdValue).OwnerTexture;
	if ownerTexture.Image.Edit then
		Designer.Modified;
end;

//----------------- TGLImageClassProperty --------------------------------------

// GetAttributes
//
function TGLImageClassProperty.GetAttributes: TPropertyAttributes;
begin
	Result:=[paValueList];
end;

// GetValues
//
procedure TGLImageClassProperty.GetValues(proc: TGetStrProc);
var
	i : Integer;
	sl : TStrings;
begin
	sl:=GetGLTextureImageClassesAsStrings;
	try
		for i:=0 to sl.Count-1 do proc(sl[i]);
	finally
		sl.Free;
	end;
end;

// GetValue
//
function TGLImageClassProperty.GetValue : String;
begin
	Result:=FindGLTextureImageClass(GetStrValue).FriendlyName;
end;

// SetValue
//
procedure TGLImageClassProperty.SetValue(const value : String);
var
	tic : TGLTextureImageClass;
begin
	tic:=FindGLTextureImageClassByFriendlyName(value);
	if Assigned(tic) then
		SetStrValue(tic.ClassName)
	else SetStrValue('');
	Modified;
end;

//----------------- TGLColorproperty -----------------------------------------------------------------------------------

{$ifdef WIN32}
{$ifdef GLS_COMPILER_5_UP}
procedure TGLColorProperty.Edit;
var
	colorDialog : TColorDialog;
   glColor : TGLColor;
begin
   colorDialog:=TColorDialog.Create(nil);
   try
      glColor:=TGLColor(GetOrdValue);
      colorDialog.Options:=[cdFullOpen];
      colorDialog.Color:=ConvertColorVector(glColor.Color);
      if colorDialog.Execute then begin
         glColor.Color:=ConvertWinColor(colorDialog.Color);
         Modified;
      end;
   finally
      colorDialog.Free;
   end;
end;

function TGLColorProperty.GetAttributes: TPropertyAttributes;
begin
  Result:=[paSubProperties, paValueList, paDialog];
end;

procedure TGLColorProperty.GetValues(Proc: TGetStrProc);
begin
  ColorManager.EnumColors(Proc);
end;

function TGLColorProperty.GetValue: String;
begin
  Result:=ColorManager.GetColorName(TGLColor(GetOrdValue).Color);
end;

procedure TGLColorProperty.SetValue(const Value: string);
begin
  TGLColor(GetOrdValue).Color:=ColorManager.GetColor(Value);
  Modified;
end;

// ColorToBorderColor
//
function TGLColorProperty.ColorToBorderColor(aColor: TColorVector; selected : Boolean) : TColor;
begin
   if (aColor[0]>0.75) or (aColor[1]>0.75) or (aColor[2]>0.75) then
      Result:=clBlack
   else if selected then
      Result:=clWhite
   else Result:=ConvertColorVector(AColor);
end;

{$ifdef GLS_COMPILER_5}
procedure TGLColorProperty.ListDrawValue(const Value: string; ACanvas: TCanvas;
                                         const ARect: TRect; ASelected: Boolean);
var
   vRight: Integer;
   vOldPenColor,
   vOldBrushColor: TColor;
   Color: TColorVector;
begin
   vRight:=(ARect.Bottom - ARect.Top) + ARect.Left;
   with ACanvas do try
      vOldPenColor:=Pen.Color;
      vOldBrushColor:=Brush.Color;

      Pen.Color:=Brush.Color;
      Rectangle(ARect.Left, ARect.Top, vRight, ARect.Bottom);

      Color:=ColorManager.GetColor(Value);
      Brush.Color:=ConvertColorVector(Color);
      Pen.Color:=ColorToBorderColor(Color, ASelected);

      Rectangle(ARect.Left + 1, ARect.Top + 1, vRight - 1, ARect.Bottom - 1);

      Brush.Color:=vOldBrushColor;
      Pen.Color:=vOldPenColor;
   finally
      inherited ListDrawValue(Value, ACanvas, Rect(vRight, ARect.Top, ARect.Right, ARect.Bottom), ASelected);
   end;
end;

procedure TGLColorProperty.PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
begin
   // draws the small color rectangle in the object inspector
   if GetVisualValue<>'' then
      ListDrawValue(GetVisualValue, ACanvas, ARect, True)
   else inherited PropDrawValue(ACanvas, ARect, ASelected);
end;
{$endif}

{$ifdef GLS_COMPILER_6_UP}
procedure TGLColorProperty.PropDrawValue(ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
begin
   if GetVisualValue <> '' then
      ListDrawValue(GetVisualValue, ACanvas, ARect, True)
   else DefaultPropertyDrawValue(Self, ACanvas, ARect);
end;

procedure TGLColorProperty.ListDrawValue(const Value: string; ACanvas: TCanvas;
                                         const ARect: TRect; ASelected: Boolean);
var
   vRight: Integer;
   vOldPenColor,
   vOldBrushColor: TColor;
   Color: TColorVector;
begin
   vRight:=(ARect.Bottom - ARect.Top) + ARect.Left;
   with ACanvas do try
      vOldPenColor:=Pen.Color;
      vOldBrushColor:=Brush.Color;

      Pen.Color:=Brush.Color;
      Rectangle(ARect.Left, ARect.Top, vRight, ARect.Bottom);

      Color:=ColorManager.GetColor(Value);
      Brush.Color:=ConvertColorVector(Color);
      Pen.Color:=ColorToBorderColor(Color, ASelected);

      Rectangle(ARect.Left + 1, ARect.Top + 1, vRight - 1, ARect.Bottom - 1);

      Brush.Color:=vOldBrushColor;
      Pen.Color:=vOldPenColor;
   finally
      DefaultPropertyListDrawValue(Value, ACanvas, Rect(vRight, ARect.Top, ARect.Right, ARect.Bottom),
                                   ASelected);
   end;
end;

procedure TGLColorProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
begin
   AWidth := AWidth + ACanvas.TextHeight('M');
end;

procedure TGLColorProperty.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
begin
   // Nothing
end;

procedure TGLColorProperty.PropDrawName(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
   DefaultPropertyDrawName(Self, ACanvas, ARect);
end;
{$endif}
{$endif}
{$endif}

//----------------- TVectorFileProperty ----------------------------------------

{$ifdef WIN32}
// GetAttributes
//
function TVectorFileProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paDialog];
end;

// GetValue
//
function TVectorFileProperty.GetValue: String;
begin
   Result:=GetStrValue;
end;

// Edit
//
procedure TVectorFileProperty.Edit;
var
   ODialog   : TOpenDialog;
   Component : TGLFreeForm;
   Desc, F    : String;
begin
   Component:=GetComponent(0) as TGLFreeForm;
   ODialog:=TOpenDialog.Create(nil);
   try
      GetVectorFileFormats.BuildFilterStrings(TVectorFile, Desc, F);
      ODialog.Filter:=Desc;
      if ODialog.Execute then begin
         Component.LoadFromFile(ODialog.FileName);
         Modified;
      end;
   finally
      ODialog.Free;
   end;
end;

// SetValue
//
procedure TVectorFileProperty.SetValue(const Value: string);
begin
   SetStrValue(Value);
end;
{$endif}

//----------------- TSoundFileProperty -----------------------------------------

{$ifdef WIN32}
// GetAttributes
//
function TSoundFileProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paDialog];
end;

// GetValue
//
function TSoundFileProperty.GetValue: String;
var
   sample : TGLSoundSample;
begin
   sample:=GetComponent(0) as TGLSoundSample;
   if sample.Data<>nil then
      Result:='('+sample.Data.ClassName+')'
   else Result:='(empty)';
end;

// Edit
//
procedure TSoundFileProperty.Edit;
var
   ODialog   : TOpenDialog;
   sample : TGLSoundSample;
   Desc, F    : String;
begin
   sample:=GetComponent(0) as TGLSoundSample;
   ODialog:=TOpenDialog.Create(nil);
   try
      GetGLSoundFileFormats.BuildFilterStrings(TGLSoundFile, Desc, F);
      ODialog.Filter:=Desc;
      if ODialog.Execute then begin
         sample.LoadFromFile(ODialog.FileName);
         Modified;
      end;
   finally
      ODialog.Free;
   end;
end;
{$endif}

//----------------- TSoundNameProperty -----------------------------------------

{$ifdef WIN32}
// GetAttributes
//
function TSoundNameProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paValueList];
end;

// GetValues
//
procedure TSoundNameProperty.GetValues(Proc: TGetStrProc);
var
   i : Integer;
   source : TGLBaseSoundSource;
begin
   source:=(GetComponent(0) as TGLBaseSoundSource);
   if Assigned(source.SoundLibrary) then with source.SoundLibrary do
      for i:=0 to Samples.Count-1 do Proc(Samples[i].Name);
end;
{$endif}

//----------------- TGLCoordinatesProperty -------------------------------------

{$ifdef WIN32}
// GetAttributes
//
function TGLCoordinatesProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paDialog, paSubProperties];
end;

// Edit;
//
procedure TGLCoordinatesProperty.Edit;
var
   glc : TGLCoordinates;
   x, y, z : Single;
begin
   glc:=TGLCoordinates(GetOrdValue);
	x:=glc.x;
	y:=glc.y;
	z:=glc.z;
	if VectorEditorForm.Execute(x, y, z) then begin
		glc.AsVector:=VectorMake(x, y, z);
		Modified;
	end;
end;
{$endif}

{$ifdef WIN32}
{$ifdef GLS_DELPHI_5_UP}

//----------------- TGLMaterialProperty --------------------------------------------------------------------------------

// GetAttributes
//
function TGLMaterialProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paDialog, paSubProperties];
end;

// Edit
//
procedure TGLMaterialProperty.Edit;
begin
	if MaterialEditorForm.Execute(TGLMaterial(GetOrdValue)) then
		Modified;
end;

//----------------- TReuseableDefaultEditor --------------------------------------------------------------------------------

// CheckEdit
//
{$ifdef GLS_DELPHI_6_UP}
procedure TReuseableDefaultEditor.CheckEdit(const Prop : IProperty);
begin
  if FContinue then
    EditProperty(Prop, FContinue);
end;
{$else}
procedure TReuseableDefaultEditor.CheckEdit(PropertyEditor: TPropertyEditor);
var
  FreeEditor: Boolean;
begin
  FreeEditor:=True;
  try
    if FContinue then EditProperty(PropertyEditor, FContinue, FreeEditor);
  finally
    if FreeEditor then PropertyEditor.Free;
  end;
end;
{$endif}

// EditProperty
//
{$ifdef GLS_DELPHI_6_UP}
procedure TReuseableDefaultEditor.EditProperty(const Prop: IProperty;
  var Continue: Boolean);
var
  PropName: string;
  BestName: string;
  MethodProperty: IMethodProperty;

  procedure ReplaceBest;
  begin
    FBest := Prop;
    if FFirst = FBest then FFirst := nil;
  end;

begin
  if not Assigned(FFirst) and
    Supports(Prop, IMethodProperty, MethodProperty) then
    FFirst := Prop;
  PropName := Prop.GetName;
  BestName := '';
  if Assigned(FBest) then BestName := FBest.GetName;
  if CompareText(PropName, 'ONCREATE') = 0 then
    ReplaceBest
  else if CompareText(BestName, 'ONCREATE') <> 0 then
    if CompareText(PropName, 'ONCHANGE') = 0 then
      ReplaceBest
    else if CompareText(BestName, 'ONCHANGE') <> 0 then
      if CompareText(PropName, 'ONCLICK') = 0 then
        ReplaceBest;
end;
{$else}
procedure TReuseableDefaultEditor.EditProperty(PropertyEditor: TPropertyEditor;
															  var Continue, FreeEditor: Boolean);
var
  PropName: string;
  BestName: string;

  procedure ReplaceBest;
  begin
    FBest.Free;
	 FBest:=PropertyEditor;
    if FFirst = FBest then FFirst:=nil;
    FreeEditor:=False;
  end;

begin
  if not Assigned(FFirst) and (PropertyEditor is TMethodProperty) then
  begin
    FreeEditor:=False;
    FFirst:=PropertyEditor;
  end;
  PropName:=PropertyEditor.GetName;
  BestName:='';
  if Assigned(FBest) then BestName:=FBest.GetName;
  if CompareText(PropName, 'ONCREATE') = 0 then
    ReplaceBest
  else if CompareText(BestName, 'ONCREATE') <> 0 then
    if CompareText(PropName, 'ONCHANGE') = 0 then
		ReplaceBest
    else if CompareText(BestName, 'ONCHANGE') <> 0 then
      if CompareText(PropName, 'ONCLICK') = 0 then
        ReplaceBest;
end;
{$endif}

// Edit
//
{$ifdef GLS_DELPHI_6_UP}
procedure TReuseableDefaultEditor.Edit;
var
  Components: IDesignerSelections;
begin
  Components := TDesignerSelections.Create;
  FContinue := True;
  Components.Add(Component);
  FFirst := nil;
  FBest := nil;
  try
    GetComponentProperties(Components, tkAny, Designer, CheckEdit);
    if FContinue then
      if Assigned(FBest) then
        FBest.Edit
      else if Assigned(FFirst) then
        FFirst.Edit;
  finally
    FFirst := nil;
    FBest := nil;
  end;
end;
{$else}
procedure TReuseableDefaultEditor.Edit;
var
  Components : TDesignerSelectionList;
begin
  Components:=TDesignerSelectionList.Create;
  try
    FContinue:=True;
    Components.Add(Component);
    FFirst:=nil;
    FBest:=nil;
	 try
      GetComponentProperties(Components, tkAny, Designer, CheckEdit);
      if FContinue then
        if Assigned(FBest) then
          FBest.Edit
        else if Assigned(FFirst) then
          FFirst.Edit;
    finally
      FFirst.Free;
      FBest.Free;
	 end;
  finally
    Components.Free;
  end;
end;
{$endif}

//----------------- TGLMaterialLibraryEditor --------------------------------------------------------------------------------

// EditProperty
//
{$ifdef GLS_DELPHI_6_UP}
procedure TGLMaterialLibraryEditor.EditProperty(const Prop: IProperty; var Continue: Boolean);
begin
   if CompareText(Prop.GetName, 'MATERIALS') = 0 then begin
      FBest:=Prop;
   end;
end;
{$else}
procedure TGLMaterialLibraryEditor.EditProperty(PropertyEditor: TPropertyEditor;
                                                var Continue, FreeEditor: Boolean);
begin
   if CompareText(PropertyEditor.GetName, 'MATERIALS') = 0 then begin
      FBest.Free;
      FBest:=PropertyEditor;
      FreeEditor:=False;
   end;
end;
{$endif}

//----------------- TGLLibMaterialNameProperty ---------------------------------

// GetAttributes
//
function TGLLibMaterialNameProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paDialog];
end;

// Edit
//
procedure TGLLibMaterialNameProperty.Edit;
var
   buf : String;
   ml : TGLMaterialLibrary;
   obj : TPersistent;
begin
	buf:=GetStrValue;
   obj:=GetComponent(0);
   if obj is TGLMaterial then
   	ml:=TGLMaterial(obj).MaterialLibrary
   else if obj is TGLLibMaterial then
      ml:=(TGLLibMaterials(TGLLibMaterial(obj).Collection).Owner as TGLMaterialLibrary)
   else begin
      ml:=nil;
      Assert(False, 'oops, unsupported...');
   end;
	if not Assigned(ml) then
		ShowMessage('Select the material library first.')
	else if LibMaterialPicker.Execute(buf, ml) then
		SetStrValue(buf);
end;

{$endif}

//----------------- TGLAnimationNameProperty -----------------------------------

// GetAttributes
//
function TGLAnimationNameProperty.GetAttributes: TPropertyAttributes;
begin
	Result:=[paValueList];
end;

// GetValues
//
procedure TGLAnimationNameProperty.GetValues(proc: TGetStrProc);
var
	i : Integer;
   animControler : TGLAnimationControler;
   actor : TGLActor;
begin
   animControler:=(GetComponent(0) as TGLAnimationControler);
   if Assigned(animControler) then begin
      actor:=animControler.Actor;
      if Assigned(actor) then with actor.Animations do begin
         for i:=0 to Count-1 do
            proc(Items[i].Name);
      end;
	end;
end;

{$endif}

{$ifdef GLS_DELPHI_5_UP}
procedure GLRegisterPropertiesInCategories;
{$ifdef GLS_DELPHI_5}
  { The first parameter of RegisterPropertiesInCategory is of type
    TPropertyCategoryClass in Delphi 5, but is a string in Delphi 6 and later.
    Therefore, the sXxxxCategoryName resourcestring needs to be redeclared as a
    TPropertyCategoryClass in Delphi 5. The same goes for other categories. }
type
  sOpenGLCategoryName = TOpenGLCategory;
  sInputCategoryName = TInputCategory;
  sLayoutCategoryName = TLayoutCategory;
  sLinkageCategoryName = TLinkageCategory;
  sLocalizableCategoryName = TLocalizableCategory;
  sVisualCategoryName = TVisualCategory;
{$endif}
begin
   {$ifdef WIN32}

   { GLWin32Viewer }
   // property types
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLCamera), TypeInfo(TGLSceneBuffer), TypeInfo(TVSyncMode),
     TypeInfo(TGLScreenDepth)]);
   // TGLSceneViewer
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLSceneViewer,
     ['*Render']);

   { GLScene }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLObjectsSorting), TypeInfo(TGLProgressEvent), TypeInfo(TGLBehaviours),
     TypeInfo(TGLObjectEffects), TypeInfo(TDirectRenderEvent), TypeInfo(TGLCameraStyle),
     TypeInfo(TOnCustomPerspective), TypeInfo(TGLScene)]);
   RegisterPropertiesInCategory(sLayoutCategoryName,
     [TypeInfo(TGLObjectsSorting), TypeInfo(TNormalDirection)]);
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(TGLVisibilityCulling), TypeInfo(TLightStyle), TypeInfo(TGLColor),
     TypeInfo(TNormalDirection), TypeInfo(TGLCameraStyle)]);
   // TGLBaseSceneObject
   RegisterPropertiesInCategory(sVisualCategoryName, TGLBaseSceneObject,
     ['Rotation', 'Direction', 'Position', 'Up', 'Scale', '*Angle', 'ShowAxes', 'FocalLength']);
   // TGLSceneObject
   RegisterPropertiesInCategory(sVisualCategoryName, TGLSceneObject,
     ['Parts']);
   // TGLDirectOpenGL
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLDirectOpenGL, ['UseBuildList']);
   // TGLProxyObject
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLProxyObjectOptions)]);
   // TGLLightSource
   RegisterPropertiesInCategory(sVisualCategoryName, TGLLightSource,
     ['*Attenuation', 'Shining', 'Spot*']);
   // TGLCamera
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLCamera,
     ['TargetObject']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLCamera,
     ['DepthOfView', 'SceneScale']);
   // TGLNonVisualViewer
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLNonVisualViewer,
     ['*Render']);

   { GLObjects }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLLinesNodes), TypeInfo(TLineNodesAspect), TypeInfo(TLineSplineMode),
     TypeInfo(TLinesOptions)]);
   RegisterPropertiesInCategory(sLayoutCategoryName,
     [TypeInfo(TGLTextAdjust)]);
   RegisterPropertiesInCategory(sLocalizableCategoryName,
     [TypeInfo(TSpaceTextCharRange)]);
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(TLineSplineMode), TypeInfo(TCapType), TypeInfo(TNormalSmoothing),
     TypeInfo(TArrowHeadStackingStyle), TypeInfo(TGLTextAdjust)]);
   // TGLDummyCube
   RegisterPropertiesInCategory(sLayoutCategoryName, TGLDummyCube,
     ['VisibleAtRunTime']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLDummyCube,
     ['CubeSize', 'VisibleAtRunTime']);
   // TGLPlane
   RegisterPropertiesInCategory(sVisualCategoryName, TGLPlane,
     ['*Offset', '*Tiles']);
   // TGLSprite
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLSprite,
     ['NoZWrite']);
   RegisterPropertiesInCategory(sLayoutCategoryName, TGLSprite,
     ['NoZWrite']);
  RegisterPropertiesInCategory(sVisualCategoryName, TGLSprite,
     ['AlphaChannel', 'Rotation']);
   // TGLNode
   RegisterPropertiesInCategory(sVisualCategoryName, TGLNode,
     ['X', 'Y', 'Z']);
   // TGLLines
   RegisterPropertiesInCategory(sVisualCategoryName, TGLLines,
     ['Antialiased', 'Division', 'Line*', 'NodeSize']);
   //  TGLCube
   RegisterPropertiesInCategory(sVisualCategoryName, TGLCube,
     ['Cube*']);
   // TGLFrustrum
   RegisterPropertiesInCategory(sVisualCategoryName, TGLFrustrum,
     ['ApexHeight', 'Base*']);
   // TGLSpaceText
   RegisterPropertiesInCategory(sVisualCategoryName, TGLSpaceText,
     ['AllowedDeviation', 'AspectRatio', 'Extrusion', 'Oblique', 'TextHeight']);
   // TGLSphere
   RegisterPropertiesInCategory(sVisualCategoryName, TGLSphere,
     ['Bottom', 'Radius', 'Slices', 'Stacks', 'Start', 'Stop']);
   // TGLDisk
   RegisterPropertiesInCategory(sVisualCategoryName, TGLDisk,
     ['*Radius', 'Loops', 'Slices']);
   // TGLCone
   RegisterPropertiesInCategory(sVisualCategoryName, TGLCone,
     ['BottomRadius', 'Loops', 'Slices', 'Stacks']);
   // TGLCylinder
   RegisterPropertiesInCategory(sVisualCategoryName, TGLCylinder,
     ['*Radius', 'Loops', 'Slices', 'Stacks']);
   // TGLAnnulus
   RegisterPropertiesInCategory(sVisualCategoryName, TGLAnnulus,
     ['Bottom*', 'Loops', 'Slices', 'Stacks', 'Top*']);
   // TGLTorus
   RegisterPropertiesInCategory(sVisualCategoryName, TGLTorus,
     ['*Radius', 'Rings', 'Sides']);
   // TGLArrowLine
   RegisterPropertiesInCategory(sVisualCategoryName, TGLArrowLine,
     ['Bottom*', 'Loops', 'Slices', 'Stacks', 'Top*']);
   // TGLPolygon
   RegisterPropertiesInCategory(sVisualCategoryName, TGLPolygon,
     ['Division']);

   { GLMultiPolygon }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLContourNodes), TypeInfo(TGLContours)]);
   // TGLMultiPolygon
   RegisterPropertiesInCategory(sVisualCategoryName, TGLContour,
     ['Division']);

   { GLExtrusion }
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(TGLNodes), TypeInfo(TPipeNodesColorMode)]);
   // TGLRevolutionSolid
   RegisterPropertiesInCategory(sVisualCategoryName, TGLRevolutionSolid,
     ['Division', 'Slices', 'YOffsetPerTurn']);
   // TGLExtrusionSolid
   RegisterPropertiesInCategory(sVisualCategoryName, TGLExtrusionSolid,
     ['Stacks']);
   // TGLPipe
   RegisterPropertiesInCategory(sVisualCategoryName, TGLPipeNode,
     ['RadiusFactor']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLPipe,
     ['Division', 'Radius', 'Slices']);

   { GLVectorFileObjects }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TActorAnimationMode), TypeInfo(TActorAnimations),
     TypeInfo(TMeshAutoCenterings), TypeInfo(TActorFrameInterpolation),
     TypeInfo(TActorAnimationReference), TypeInfo(TGLActor)]);
   RegisterPropertiesInCategory(sLayoutCategoryName,
     [TypeInfo(TMeshNormalsOrientation)]);
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(TMeshAutoCenterings), TypeInfo(TActorAnimationReference),
     TypeInfo(TMeshNormalsOrientation)]);
   // TGLFreeForm
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLFreeForm,
     ['UseMeshmaterials']);
   // TGLAnimationControler
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLAnimationControler,
     ['AnimationName']);
   RegisterPropertiesInCategory(sLinkageCategoryName, TGLAnimationControler,
     ['AnimationName']);
   // TGLActor
   RegisterPropertiesInCategory(sOpenGLCategoryName, TActorAnimation,
     ['*Frame']);
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLActor,
     ['*Frame*', 'Interval', 'OverlaySkeleton', 'UseMeshmaterials']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLActor,
     ['OverlaySkeleton']);

   { GLMesh }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TMeshMode), TypeInfo(TVertexMode)]);

   { GLGraph }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(THeightFieldOptions)]);
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(THeightFieldColorMode), TypeInfo(TGLSamplingScale),
     TypeInfo(TXYZGridLinesStyle), TypeInfo(TXYZGridParts)]);
   // TGLXYZGrid
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLXYZGrid,
     ['Antialiased']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLXYZGrid,
     ['Antialiased', 'Line*']);

   { GLParticles }
   // TGLParticles
   RegisterPropertiesInCategory(sLayoutCategoryName, TGLParticles,
     ['VisibleAtRunTime']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLParticles,
     ['*Size', 'VisibleAtRunTime']);

   { GLSkydome }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TSkyDomeBands), TypeInfo(TSkyDomeOptions), TypeInfo(TSkyDomeStars)]);
   // TSkyDomeBand
   RegisterPropertiesInCategory(sVisualCategoryName, TSkyDomeBand,
     ['Slices', 'Stacks', '*Angle']);
   // TSkyDomeStar
   RegisterPropertiesInCategory(sVisualCategoryName, TSkyDomeStar,
     ['Dec', 'Magnitude', 'RA']);
   // TGLEarthSkyDome
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLEarthSkyDome,
     ['Slices', 'Stacks', 'SunElevation', 'Turbidity']);

   { GLMirror }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TMirrorOptions), TypeInfo(TGLBaseSceneObject)]);

   { GLParticleFX }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TBlendingMode)]);
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(TBlendingMode), TypeInfo(TPFXLifeColors), TypeInfo(TSpriteColorMode)]);
   // TGLParticleFXRenderer
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLParticleFXRenderer,
     ['ZWrite']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLParticleFXRenderer,
     ['ZWrite']);
   //  TPFXLifeColor
   RegisterPropertiesInCategory(sOpenGLCategoryName, TPFXLifeColor,
     ['LifeTime']);
   RegisterPropertiesInCategory(sVisualCategoryName, TPFXLifeColor,
     ['LifeTime']);
   // TGLLifeColoredPFXManager
   RegisterPropertiesInCategory(sVisualCategoryName, TGLLifeColoredPFXManager,
     ['Acceleration', 'ParticleSize']);
   // GLPolygonPFXManager
   RegisterPropertiesInCategory(sVisualCategoryName, TGLPolygonPFXManager,
     ['NbSides']);
   // TGLPointLightPFXManager
   RegisterPropertiesInCategory(sVisualCategoryName, TGLPointLightPFXManager,
     ['TexMapSize']);

   { GLTerrainRenderer }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(THeightDataSource)]);
   // TGLTerrainRenderer
   RegisterPropertiesInCategory(sVisualCategoryName, TGLTerrainRenderer,
     ['*CLOD*', 'QualityDistance', 'Tile*']);

   { GLzBuffer }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLMemoryViewer), TypeInfo(TGLSceneViewer), TypeInfo(TOptimise)]);
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(TOptimise)]);
   // TGLZShadows
   RegisterPropertiesInCategory(sVisualCategoryName, TGLZShadows,
     ['DepthFade', '*Shadow', 'Soft', 'Tolerance']);

   { GLHUDObjects }
   RegisterPropertiesInCategory(sLayoutCategoryName,
     [TypeInfo(TTextLayout)]);
   RegisterPropertiesInCategory(sLocalizableCategoryName,
     [TypeInfo(TGLBitmapFont)]);
   RegisterPropertiesInCategory(sVisualCategoryName,
     [TypeInfo(TGLBitmapFont), TypeInfo(TTextLayout)]);

   { GLTexture }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLMaterial), TypeInfo(TGLMaterialLibrary), TypeInfo(TGLLibMaterials),
     TypeInfo(TTextureNeededEvent)]);
   // TGLLibMaterial
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLLibMaterial,
     ['Texture2Name']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLLibMaterial,
     ['TextureOffset', 'TextureScale']);
   // TGLMaterialLibrary
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLMaterialLibrary,
     ['TexturePaths']);

   { GLCadencer }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLCadencer)]);

   { GLCollision }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TObjectCollisionEvent)]);

   { GLFireFX }
   // TGLFireFXManager
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLFireFXManager,
     ['MaxParticles', 'NoZWrite', 'Paused', 'UseInterval']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLFireFXManager,
     ['Fire*', 'InitialDir', 'NoZWrite', 'Particle*', 'Paused']);

   { GLThorFX }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TCalcPointEvent)]);
   // GLThorFXManager
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLThorFXManager,
     ['Maxpoints', 'Paused']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLThorFXManager,
     ['Core', 'Glow*', 'Paused', 'Target', 'Vibrate', 'Wildness']);

   { GLBitmapFont }
   RegisterPropertiesInCategory(sOpenGLCategoryName,
     [TypeInfo(TGLMagFilter), TypeInfo(TGLMinFilter)]);
   RegisterPropertiesInCategory(sLocalizableCategoryName,
     [TypeInfo(TBitmapFontRanges)]);
   // TBitmapFontRange
   RegisterPropertiesInCategory(sLocalizableCategoryName, TBitmapFontRange,
     ['*ASCII']);
   // TGLBitmapFont
   RegisterPropertiesInCategory(sLayoutCategoryName, TGLBitmapFont,
     ['Char*', '*Interval*', '*Space']);
   RegisterPropertiesInCategory(sLocalizableCategoryName, TGLBitmapFont,
     ['Glyphs']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLBitmapFont,
     ['Char*', '*Interval*', '*Space', 'Glyphs']);

   { GLHeightData }
   // TGLBitmapHDS
   RegisterPropertiesInCategory(sOpenGLCategoryName, TGLBitmapHDS,
     ['MaxPoolSize']);
   RegisterPropertiesInCategory(sVisualCategoryName, TGLBitmapHDS,
     ['Picture']);

   {$endif}
end;
{$endif}

procedure Register;
begin
   RegisterComponents('GLScene',
                      [TGLScene,
                       TGLSceneViewer, TGLMemoryViewer,
                       TGLMaterialLibrary
                       {$ifdef WIN32}
                       ,
                       TGLFullScreenViewer,
                       TGLGuiLayout,
                       TGLCadencer, TAsyncTimer,
                       TGLPolygonPFXManager, TGLPointLightPFXManager,
                       TGLBitmapFont, TGLWindowsBitmapFont,
                       TGLBitmapHDS, TGLCustomHDS, TGLHeightTileFileHDS,
                       TCollisionManager, TGLFireFXManager, TGLThorFXManager,
                       TGLAnimationControler
                       {$endif}
                      ]);

   RegisterComponentEditor(TGLSceneViewer, TGLSceneViewerEditor);
   RegisterComponentEditor(TGLScene, TGLSceneEditor);

{$ifdef GLS_DELPHI_5_UP}
   GLRegisterPropertiesInCategories;
   {$ifdef WIN32}
	RegisterComponentEditor(TGLMaterialLibrary, TGLMaterialLibraryEditor);
   {$endif}
{$endif}

{$ifdef WIN32}
	RegisterPropertyEditor(TypeInfo(TResolution), nil, '', TResolutionProperty);
	RegisterPropertyEditor(TypeInfo(TGLTexture), TGLMaterial, '', TGLTextureProperty);
	RegisterPropertyEditor(TypeInfo(TGLTextureImage), TGLTexture, '', TGLTextureImageProperty);
	RegisterPropertyEditor(TypeInfo(String), TGLTexture, 'ImageClassName', TGLImageClassProperty);
	RegisterPropertyEditor(TypeInfo(TGLSoundFile), TGLSoundSample, '', TSoundFileProperty);
	RegisterPropertyEditor(TypeInfo(String), TGLBaseSoundSource, 'SoundName', TSoundNameProperty);
	RegisterPropertyEditor(TypeInfo(TGLCoordinates), nil, '', TGLCoordinatesProperty);
{$ifdef GLS_DELPHI_5_UP}
	RegisterPropertyEditor(TypeInfo(TGLColor), nil, '', TGLColorProperty);
	RegisterPropertyEditor(TypeInfo(TGLMaterial), nil, '', TGLMaterialProperty);
	RegisterPropertyEditor(TypeInfo(TGLLibMaterialName), TGLMaterial, '', TGLLibMaterialNameProperty);
	RegisterPropertyEditor(TypeInfo(TGLLibMaterialName), TGLLibMaterial, '', TGLLibMaterialNameProperty);
	RegisterPropertyEditor(TypeInfo(TActorAnimationName), TGLAnimationControler, '', TGLAnimationNameProperty);
{$endif}
   RegisterPropertyEditor(TypeInfo(TFileName), TGLFreeForm, 'FileName', TVectorFileProperty);
{$endif}
end;

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
initialization
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

   GLMisc.vUseDefaultSets:=True;

   with ObjectManager do begin
      RegisterSceneObject(TGLCamera, 'Camera', '');
      RegisterSceneObject(TGLLightSource, 'LightSource', '');
      RegisterSceneObject(TGLDummyCube, 'DummyCube', '');

      RegisterSceneObject(TGLSprite, 'Sprite', glsOCBasicGeometry);
      RegisterSceneObject(TGLPoints, 'Points', glsOCBasicGeometry);
      RegisterSceneObject(TGLLines, 'Lines', glsOCBasicGeometry);
      RegisterSceneObject(TGLPlane, 'Plane', glsOCBasicGeometry);
      RegisterSceneObject(TGLPolygon, 'Polygon', glsOCBasicGeometry);
      RegisterSceneObject(TGLCube, 'Cube', glsOCBasicGeometry);
      RegisterSceneObject(TGLFrustrum, 'Frustrum', glsOCBasicGeometry);
      RegisterSceneObject(TGLSphere, 'Sphere', glsOCBasicGeometry);
      RegisterSceneObject(TGLDisk, 'Disk', glsOCBasicGeometry);
      RegisterSceneObject(TGLCone, 'Cone', glsOCBasicGeometry);
      RegisterSceneObject(TGLCylinder, 'Cylinder', glsOCBasicGeometry);
      RegisterSceneObject(TGLDodecahedron, 'Dodecahedron', glsOCBasicGeometry);

      RegisterSceneObject(TGLArrowLine, 'ArrowLine', glsOCAdvancedGeometry);
      RegisterSceneObject(TGLAnnulus, 'Annulus', glsOCAdvancedGeometry);
      RegisterSceneObject(TGLExtrusionSolid, 'ExtrusionSolid', glsOCAdvancedGeometry);
      RegisterSceneObject(TGLMultiPolygon, 'MultiPolygon', glsOCAdvancedGeometry);
      RegisterSceneObject(TGLPipe, 'Pipe', glsOCAdvancedGeometry);
      RegisterSceneObject(TGLRevolutionSolid, 'RevolutionSolid', glsOCAdvancedGeometry);
      RegisterSceneObject(TGLTorus, 'Torus', glsOCAdvancedGeometry);

      RegisterSceneObject(TGLActor, 'Actor', glsOCMeshObjects);
      RegisterSceneObject(TGLFreeForm, 'FreeForm', glsOCMeshObjects);
      RegisterSceneObject(TGLMesh, 'Mesh', glsOCMeshObjects);
      RegisterSceneObject(TGLPortal, 'Portal', glsOCMeshObjects);
      RegisterSceneObject(TGLTerrainRenderer, 'TerrainRenderer', glsOCMeshObjects);

      RegisterSceneObject(TGLFlatText, 'FlatText', glsOCGraphPlottingObjects);
      RegisterSceneObject(TGLHeightField, 'HeightField', glsOCGraphPlottingObjects);
      RegisterSceneObject(TGLXYZGrid, 'XYZGrid', glsOCGraphPlottingObjects);

      RegisterSceneObject(TGLParticles, 'Particles', glsOCParticleSystems);
      RegisterSceneObject(TGLParticleFXRenderer, 'PFX Renderer', glsOCParticleSystems);

      RegisterSceneObject(TGLEarthSkyDome, 'EarthSkyDome', glsOCEnvironmentObjects);
      RegisterSceneObject(TGLSkyDome, 'SkyDome', glsOCEnvironmentObjects);

      RegisterSceneObject(TGLHUDSprite, 'HUDSprite', glsOCHUDObjects);
      RegisterSceneObject(TGLHUDText, 'HUDText', glsOCHUDObjects);

      {$ifdef WIN32}
      RegisterSceneObject(TGLBaseControl, 'Root Control', glsOCGuiObjects);
      RegisterSceneObject(TGLPopupMenu, 'GLPopupMenu', glsOCGuiObjects);
      RegisterSceneObject(TGLForm, 'GLForm', glsOCGuiObjects);
      RegisterSceneObject(TGLPanel, 'GLPanel', glsOCGuiObjects);
      RegisterSceneObject(TGLButton, 'GLButton', glsOCGuiObjects);
      RegisterSceneObject(TGLCheckBox, 'GLCheckBox', glsOCGuiObjects);
      RegisterSceneObject(TGLEdit, 'GLEdit', glsOCGuiObjects);
      RegisterSceneObject(TGLLabel, 'GLLabel', glsOCGuiObjects);
      RegisterSceneObject(TGLAdvancedLabel, 'GLAdvancedLabel', glsOCGuiObjects);
      RegisterSceneObject(TGLScrollbar, 'GLScrollbar', glsOCGuiObjects);
      RegisterSceneObject(TGLStringGrid, 'GLStringGrid', glsOCGuiObjects);
      RegisterSceneObject(TGLCustomControl, 'GLBitmapControl', glsOCGuiObjects);
      {$endif}

      RegisterSceneObject(TGLLensFlare, 'LensFlare', glsOCSpecialObjects);
      RegisterSceneObject(TGLMirror, 'Mirror', glsOCSpecialObjects);
      RegisterSceneObject(TGLShadowPlane, 'ShadowPlane', glsOCSpecialObjects);
      RegisterSceneObject(TGLShadowVolume, 'ShadowVolume', glsOCSpecialObjects);
      {$ifdef WIN32}
      RegisterSceneObject(TGLZShadows, 'ZShadows', glsOCSpecialObjects);
      {$endif}

      {$ifdef WIN32}
      RegisterSceneObject(TGLSpaceText, 'SpaceText', glsOCDoodad);
      {$endif}
      RegisterSceneObject(TGLTeapot, 'Teapot', glsOCDoodad);

      RegisterSceneObject(TGLDirectOpenGL, 'Direct OpenGL', '');
      RegisterSceneObject(TGLProxyObject, 'ProxyObject', '');
   end;

finalization

   ObjectManager.Free;

end.
