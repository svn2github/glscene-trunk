// GLHeightData
{: Classes for height data access.<p>

   The components and classes in the unit are the core data providers for
   height-based objects (terrain rendering mainly), they are independant
   from the rendering stage.<p>

   In short: access to raw height data is performed by a THeightDataSource
   subclass, that must take care of performing all necessary data access,
   cacheing and manipulation to provide THeightData objects. A THeightData
   is basicly a square, power of two dimensionned raster heightfield, and
   holds the data a renderer needs.<p>

	<b>History : </b><font size=-1><ul>
      <li>21/02/02 - EG - hdtWord replaced by hdtSmallInt, added MarkDirty
      <li>04/02/02 - EG - CreateMonochromeBitmap now shielded against Jpeg "Change" oddity
      <li>10/09/01 - EG - Added TGLTerrainBaseHDS
      <li>04/03/01 - EG - Added InterpolatedHeight
	   <li>11/02/01 - EG - Creation
	</ul></font>
}
unit GLHeightData;

interface

uses Classes, Graphics, Geometry, GLCrossPlatform;

{$i GLScene.inc}
{$IFDEF LINUX}{$Message Error 'Unit not supported'}{$ENDIF LINUX}

type

   TByteArray = array [0..MaxInt shr 1] of Byte;
   PByteArray = ^TByteArray;
   TByteRaster = array [0..MaxInt shr 3] of PByteArray;
   PByteRaster = ^TByteRaster;
   TSmallintArray = array [0..MaxInt shr 2] of SmallInt;
   PSmallIntArray = ^TSmallIntArray;
   TSmallIntRaster = array [0..MaxInt shr 3] of PSmallIntArray;
   PSmallIntRaster = ^TSmallIntRaster;
   TSingleArray = array [0..MaxInt shr 3] of Single;
   PSingleArray = ^TSingleArray;
   TSingleRaster = array [0..MaxInt shr 3] of PSingleArray;
   PSingleRaster = ^TSingleRaster;

   THeightData = class;
   THeightDataClass = class of THeightData;

   // THeightDataType
   //
   {: Determines the type of data stored in a THeightData.<p>
      There are 3 data types (8 bits unsigned, signed 16 bits and 32 bits).<p>
      Conversions: (128*(ByteValue-128)) = SmallIntValue = Round(SingleValue) }
   THeightDataType = (hdtByte, hdtSmallInt, hdtSingle);

	// THeightDataSource
	//
   {: Base class for height datasources.<p>
      This class is abstract and presents the standard interfaces for height
      data retrieval (THeightData objects). The class offers the following
      features (that a subclass may decide to implement or not, what follow
      is the complete feature set, check subclass doc to see what is actually
      supported):<ul>
      <li>Pooling / Cacheing (return a THeightData with its "Release" method)
      <li>Pre-loading : specify a list of THeightData you want to preload
      <li>Multi-threaded preload/queueing : specified list can be loaded in
         a background task.
      </p> }
	THeightDataSource = class (TComponent)
	   private
	      { Private Declarations }
         FData : TThreadList; // stores all THeightData, whatever their state/type
         FThread : TThread;   // queue manager
         FMaxThreads : Integer;
         FMaxPoolSize : Integer;
         FHeightDataClass : THeightDataClass;

	   protected
	      { Protected Declarations }
         procedure SetMaxThreads(const val : Integer);

         {: Adjust this property in you subclasses. }
         property HeightDataClass : THeightDataClass read FHeightDataClass write FHeightDataClass;

         {: Access to currently pooled THeightData objects. }
         property Data : TThreadList read FData;

         {: Looks up the list and returns the matching THeightData, if any. }
         function FindMatchInList(xLeft, yTop, size : Integer;
                                  dataType : THeightDataType) : THeightData;

         {: Request to start preparing data.<p>
            If your subclass is thread-enabled, this is here that you'll create
            your thread and fire it (don't forget the requirements), if not,
            that'll be here you'll be doing your work.<br>
            Either way, you are responsible for adjusting the DataState to
            hdsReady when you're done (DataState will be hdsPreparing when this
            method will be invoked). }
         procedure StartPreparingData(heightData : THeightData); virtual;

	   public
	      { Public Declarations }
	      constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;

{$ifndef GLS_DELPHI_5_UP}
         procedure RemoveFreeNotification(AComponent: TComponent);
{$endif}

         {: Empties the Data list, terminating thread if necessary.<p>
            If some THeightData are hdsInUse, triggers an exception and does
            nothing. }
         procedure Clear;
         {: Removes less used TDataHeight objects from the pool.<p>
            Only removes objects whose state is hdsReady and UseCounter is zero,
            starting from the end of the list untill total data size gets below
            MaxPoolSize (or nothing can be removed). }
         procedure CleanUp;

         {: Base THeightData requester method.<p>
            Returns (by rebuilding it or from the cache) a THeightData
            corresponding to the given area. Size must be a power of two.<p>
            Subclasses may choose to publish it or just publish datasource-
            specific requester method using specific parameters. }
         function GetData(xLeft, yTop, size : Integer;
                          dataType : THeightDataType) : THeightData; virtual;
         {: Preloading request.<p>
            See GetData for details. }
         function PreLoad(xLeft, yTop, size : Integer;
                          dataType : THeightDataType) : THeightData; virtual;
         {: Notification that the data is no longer used by the renderer.<p>
            Default behaviour is just to change DataState to hdsReady (ie. return
            the data to the pool) }
         procedure Release(aHeightData : THeightData);
         {: Marks the given area as "dirty" (ie source data changed).<p>
            All loaded and in-cache tiles overlapping the area are flushed. }
         procedure MarkDirty(const area : TGLRect); overload; virtual;
         procedure MarkDirty(xLeft, yTop, xRight, yBottom : Integer); overload;
         procedure MarkDirty; overload;

         {: Maximum number of background threads.<p>
            If 0 (zero), multithreading is disabled and StartPreparingData
            will be called from the mainthread, and all preload requirements
            (queued THeightData objects) will be loaded in sequence from
            the main thread.<p>
            If 1, basic multithreading and queueing gets enabled,
            ie. StartPreparingData will be called from a thread, but from one
            thread only (ie. there is no need to implement a THeightDataThread,
            just make sure StartPreparingData code is thread-safe).<p>
            Other values (2 and more) are relevant only if you implement
            a THeightDataThread subclass and fire it in StartPreparingData. }
         property MaxThreads : Integer read FMaxThreads write SetMaxThreads;
         {: Maximum size of TDataHeight pool in bytes.<p>
            The pool (cache) can actually get larger if more data than the pool
            can accomodate is used, but as soon as data gets released and returns
            to the pool, TDataHeight will be freed untill total pool size gets
            below this figure.<br>
            The pool manager frees TDataHeight objects who haven't been requested
            for the longest time first.<p>
            The default value of zero effectively disables pooling. }
         property MaxPoolSize : Integer read FMaxPoolSize write FMaxPoolSize;

         {: Interpolates height for the given point. } 
         function InterpolatedHeight(x, y : Single) : Single; virtual;
	end;

   // THeightDataState
   //
   {: Possible states for a THeightData.<p>
      <ul>
      <li>hdsQueued : the data has been queued for loading
      <li>hdsPreparing : the data is currently loading or being prepared for use
      <li>hdsReady : the data is fully loaded and ready for use
      </ul> }
   THeightDataState = ( hdsQueued, hdsPreparing, hdsReady);

   THeightDataThread = class;
   TOnHeightDataDirtyEvent = procedure (sender : THeightData) of object;

   THeightDataUser = record
      user : TObject;
      event : TOnHeightDataDirtyEvent;
   end;

	// THeightData
	//
   {: Base class for height data, stores a height-field raster.<p>
      The raster is a square, whose size must be a power of two. Data can be
      accessed through a base pointer ("ByteData[n]" f.i.), or through pointer
      indirections ("ByteRaster[y][x]" f.i.), this are the fastest way to access
      height data (and the most unsecure).<br>
      Secure (with range checking) data access is provided by specialized
      methods (f.i. "ByteHeight"), in which coordinates (x & y) are always
      considered relative (like in raster access).<p>
      The class offers conversion facility between the types (as a whole data
      conversion), but in any case, the THeightData should be directly requested
      from the THeightDataSource with the appropriate format.<p>
      Though this class can be instantiated, you will usually prefer to subclass
      it in real-world cases, f.i. to add texturing data. }
	THeightData = class (TObject)
	   private
	      { Private Declarations }
         FUsers : array of THeightDataUser;
         FOwner : THeightDataSource;
         FDataState : THeightDataState;
         FSize : Integer;
         FXLeft, FYTop : Integer;
         FUseCounter : Integer;
         FDataType : THeightDataType;
         FDataSize : Integer;
         FByteData : PByteArray;
         FByteRaster : PByteRaster;
         FSmallIntData : PSmallIntArray;
         FSmallIntRaster : PSmallIntRaster;
         FSingleData : PSingleArray;
         FSingleRaster : PSingleRaster;
         FObjectTag : TObject;
         FTag, FTag2 : Integer;
         FOnDestroy : TNotifyEvent;
         FDirty : Boolean;

         procedure BuildByteRaster;
         procedure BuildSmallIntRaster;
         procedure BuildSingleRaster;

         procedure ConvertByteToSmallInt;
         procedure ConvertByteToSingle;
         procedure ConvertSmallIntToByte;
         procedure ConvertSmallIntToSingle;
         procedure ConvertSingleToByte;
         procedure ConvertSingleToSmallInt;

	   protected
	      { Protected Declarations }
         FThread : THeightDataThread; // thread used for multi-threaded processing (if any)

         procedure SetDataType(const val : THeightDataType);

	   public
	      { Public Declarations }
	      constructor Create(aOwner : THeightDataSource;
                            aXLeft, aYTop, aSize : Integer;
                            aDataType : THeightDataType); virtual;
         destructor Destroy; override;

         {: The component who created and maintains this data. }
         property Owner : THeightDataSource read FOwner;

         {: Fired when the object is destroyed. }
         property OnDestroy : TNotifyEvent read FOnDestroy write FOnDestroy;

         {: Counter for use registration.<p>
            A THeightData is not returned to the pool untill this counter reaches
            a value of zero. }
         property UseCounter : Integer read FUseCounter;
         {: Increments UseCounter.<p>
            User objects should implement a method that will be notified when
            the data becomes dirty, when invoked they should release the heightdata
            immediately after performing their own cleanups. }
         procedure RegisterUse;
         {: Decrements UseCounter.<p>
            When the counter reaches zero, notifies the Owner THeightDataSource
            that the data is no longer used.<p>
            The renderer should call Release when it no longer needs a THeighData,
            and never free/destroy the object directly. }
         procedure Release;
         {: Marks the tile as dirty.<p>
            The immediate effect is currently the destruction of the tile. }
         procedure MarkDirty;

         {: World X coordinate of top left point. }
         property XLeft : Integer read FXLeft;
         {: World Y coordinate of top left point. }
         property YTop : Integer read FYTop;
         {: Type of the data.<p>
            Assigning a new datatype will result in the data being converted. }
         property DataType : THeightDataType read FDataType write SetDataType;
         {: Current state of the data. }
         property DataState : THeightDataState read FDataState write FDataState;
         {: Size of the data square, in data units. }
         property Size : Integer read FSize;
         {: True if the data is dirty (ie. no longer up-to-date). }
         property Dirty : Boolean read FDirty;

         {: Memory size of the raw data in bytes. }
         property DataSize : Integer read FDataSize;

         {: Access to data as a byte array (n = y*Size+x).<p>
            If THeightData is not of type hdtByte, this value is nil. }
         property ByteData : PByteArray read FByteData;
         {: Access to data as a byte raster (y, x).<p>
            If THeightData is not of type hdtByte, this value is nil. }
         property ByteRaster : PByteRaster read FByteRaster;
         {: Access to data as a SmallInt array (n = y*Size+x).<p>
            If THeightData is not of type hdtSmallInt, this value is nil. }
         property SmallIntData : PSmallIntArray read FSmallIntData;
         {: Access to data as a SmallInt raster (y, x).<p>
            If THeightData is not of type hdtSmallInt, this value is nil. }
         property SmallIntRaster : PSmallIntRaster read FSmallIntRaster;
         {: Access to data as a Single array (n = y*Size+x).<p>
            If THeightData is not of type hdtSingle, this value is nil. }
         property SingleData : PSingleArray read FSingleData;
         {: Access to data as a Single raster (y, x).<p>
            If THeightData is not of type hdtSingle, this value is nil. }
         property SingleRaster : PSingleRaster read FSingleRaster;

         {: Height of point x, y as a Byte.<p> }
	      function ByteHeight(x, y : Integer) : Byte;
         {: Height of point x, y as a SmallInt.<p> }
	      function SmallIntHeight(x, y : Integer) : SmallInt;
         {: Height of point x, y as a Single.<p> }
	      function SingleHeight(x, y : Integer) : Single;
         {: Interopolated height of point x, y as a Single.<p> }
         function InterpolatedHeight(x, y : Single) : Single;

         {: Returns the height as a single, whatever the DataType (slow). }
	      function Height(x, y : Integer) : Single;

         {: Calculates and returns the normal for point x, y.<p>
            Sub classes may provide normal cacheing, the default implementation
            being rather blunt. }
         function Normal(x, y : Integer; const scale : TAffineVector) : TAffineVector; virtual;

         {: Returns True if the data tile overlaps the area. }
         function OverlapsArea(const area : TGLRect) : Boolean;

         {: Reserved for renderer use. }
         property ObjectTag : TObject read FObjectTag write FObjectTag;
         {: Reserved for renderer use. }
         property Tag : Integer read FTag write FTag;
         {: Reserved for renderer use. }
         property Tag2 : Integer read FTag2 write FTag2;
	end;

   // THeightDataThread
   //
   {: A thread specialized for processing THeightData in background.<p>
      Requirements:<ul>
      <li>must have FreeOnTerminate set to true,
      <li>must check and honour Terminated swiftly
      </ul> }
   THeightDataThread = class (TThread)
      protected
	      { Protected Declarations }
         FHeightData : THeightData;

      public
	      { Public Declarations }
         destructor Destroy; override;
   end;

	// TGLBitmapHDS
	//
   {: Bitmap-based Height Data Source.<p>
      The image is automatically wrapped if requested data is out of picture size,
      or if requested data is larger than the picture.<p>
      The internal format is an 8 bit bitmap whose dimensions are a power of two,
      if the original image does not comply, it is StretchDraw'ed on a monochrome
      (gray) bitmap. }
	TGLBitmapHDS = class (THeightDataSource)
	   private
	      { Private Declarations }
         FBitmap : Graphics.TBitmap;
         FPicture : TPicture;

	   protected
	      { Protected Declarations }
         procedure SetPicture(const val : TPicture);
         procedure OnPictureChanged(Sender : TObject);

         procedure CreateMonochromeBitmap(size : Integer);
         procedure FreeMonochromeBitmap;

         procedure StartPreparingData(heightData : THeightData); override;

	   public
	      { Public Declarations }
	      constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;

         procedure MarkDirty(const area : TGLRect); override;

	   published
	      { Published Declarations }
         {: The picture serving as Height field data reference.<p>
            The picture is (if not already) internally converted to a 8 bit
            bitmap (grayscale). For better performance and to save memory,
            feed it this format! }
         property Picture : TPicture read FPicture write SetPicture;

         property MaxPoolSize;
	end;

	// TGLTerrainBaseHDS
	//
   {: TerrainBase-based Height Data Source.<p>
      This component takes its data from the TerrainBase Gobal Terrain Model.<br>
      Though it can be used directly, the resolution of the TerrainBase dataset
      isn't high enough for accurate short-range representation and the data
      should rather be used as basis for further (fractal) refinement.<p>
      TerrainBase is freely available from the National Geophysical Data Center
      and World Data Center web site (http://ngdc.noaa.com).<p>
      (this component expects to find "tbase.bin" in the current directory). }
	TGLTerrainBaseHDS = class (THeightDataSource)
	   private
	      { Private Declarations }

	   protected
	      { Protected Declarations }
         procedure StartPreparingData(heightData : THeightData); override;

	   public
	      { Public Declarations }
	      constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;

	   published
	      { Published Declarations }
         property MaxPoolSize;
	end;

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

uses SysUtils, Windows, GLMisc;

// ------------------
// ------------------ THeightDataSourceThread ------------------
// ------------------

type
   THeightDataSourceThread = class (TThread)
      FOwner : THeightDataSource;
      FIdleLoops : Integer;
      procedure Execute; override;
   end;

// Execute
//
procedure THeightDataSourceThread.Execute;
var
   i, n : Integer;
   isIdle : Boolean;
begin
   while not Terminated do begin
      isIdle:=True;
      if FOwner.MaxThreads>0 then begin
         // current estimated nb threads running
         n:=0;
         with FOwner.FData.LockList do begin
            try
               for i:=0 to Count-1 do
                  if THeightData(Items[i]).FThread<>nil then Inc(n);
               i:=0;
               while (n<FOwner.MaxThreads) and (i<Count) do begin
                  if THeightData(Items[i]).DataState=hdsQueued then begin
                     FOwner.StartPreparingData(THeightData(Items[i]));
                     isIdle:=False;
                     Inc(n);
                  end;
                  Inc(i);
               end;
            finally
               FOwner.FData.UnlockList;
            end;
         end;
      end;
      if isIdle then
         Inc(FIdleLoops)
      else FIdleLoops:=0;
      if FIdleLoops<10 then
         Sleep(0) // "fast" mode
      else Sleep(10); // "doze" mode
   end;
end;

// ------------------
// ------------------ THeightDataSource ------------------
// ------------------

// Create
//
constructor THeightDataSource.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);
   FHeightDataClass:=THeightData;
   FData:=TThreadList.Create;
   FThread:=THeightDataSourceThread.Create(True);
   FThread.FreeOnTerminate:=False;
   THeightDataSourceThread(FThread).FOwner:=Self;
   FThread.Resume;
end;

// Destroy
//
destructor THeightDataSource.Destroy;
begin
   FThread.Terminate;
   FThread.WaitFor;
   FThread.Free;
   Clear;
   FData.Free;
	inherited Destroy;
end;

{$ifndef GLS_DELPHI_5_UP}
// RemoveFreeNotification
//
procedure THeightDataSource.RemoveFreeNotification(AComponent: TComponent);
begin
   Notification(AComponent, opRemove);
end;
{$endif}

// Clear
//
procedure THeightDataSource.Clear;
var
   i : Integer;
begin
   with FData.LockList do begin
      try
         for i:=0 to Count-1 do
            if THeightData(Items[i]).UseCounter>0 then
               raise Exception.Create('ERR: HeightData still in use');
         for i:=0 to Count-1 do begin
            THeightData(Items[i]).FOwner:=nil;
            THeightData(Items[i]).Free;
         end;
         Clear;
      finally
         FData.UnlockList;
      end;
   end;
end;

// FindMatchInList
//
function THeightDataSource.FindMatchInList(xLeft, yTop, size : Integer;
                                           dataType : THeightDataType) : THeightData;
var
   i : Integer;
   hd : THeightData;
begin
   Result:=nil;
   with FData.LockList do begin
      try
         for i:=0 to Count-1 do begin
            hd:=THeightData(Items[i]);
            if (hd.XLeft=xLeft) and (hd.YTop=yTop) and (hd.Size=size) and (hd.DataType=dataType) then begin
               Result:=hd;
               Break;
            end;
         end;
      finally
         FData.UnlockList;
      end;
   end;
end;

// GetData
//
function THeightDataSource.GetData(xLeft, yTop, size : Integer;
                                   dataType : THeightDataType) : THeightData;
begin
   Result:=FindMatchInList(xLeft, yTop, size, dataType);
   if not Assigned(Result) then
      Result:=PreLoad(xLeft, yTop, size, dataType)
   else with FData.LockList do begin
      try
         Move(IndexOf(Result), 0);
      finally
         FData.UnlockList;
      end;
   end;
   // got one... can be used ?
   while Result.DataState<>hdsReady do Sleep(1);
end;

// PreLoad
//
function THeightDataSource.PreLoad(xLeft, yTop, size : Integer;
                                   dataType : THeightDataType) : THeightData;
begin
   CleanUp;
   Result:=HeightDataClass.Create(Self, xLeft, yTop, size, dataType);
   FData.LockList.Insert(0, Result);
   FData.UnlockList;
   if MaxThreads=0 then
      StartPreparingData(Result);
end;

// Release
//
procedure THeightDataSource.Release(aHeightData : THeightData);
begin
   CleanUp;
end;

// MarkDirty (rect)
//
procedure THeightDataSource.MarkDirty(const area : TGLRect);
var
   i : Integer;
   hd : THeightData;
begin
   with FData.LockList do begin
      try
         for i:=Count-1 downto 0 do begin
            hd:=THeightData(Items[i]);
            if hd.OverlapsArea(area) then
               hd.MarkDirty;
         end;
      finally
         FData.UnlockList;
      end;
   end;
end;

// MarkDirty (ints)
//
procedure THeightDataSource.MarkDirty(xLeft, yTop, xRight, yBottom : Integer);
var
   r : TGLRect;
begin
   r.Left:=xLeft;
   r.Top:=yTop;
   r.Right:=xRight;
   r.Bottom:=yBottom;
   MarkDirty(r);
end;

// MarkDirty
//
procedure THeightDataSource.MarkDirty;
const
   m = MaxInt-1;
begin
   MarkDirty(-m, -m, m, m);
end;

// CleanUp
//
procedure THeightDataSource.CleanUp;
var
   i : Integer;
   usedMemory : Integer;
begin
   with FData.LockList do begin
      try
         usedMemory:=0;
         // cleanup dirty tiles and compute used memory
         for i:=Count-1 downto 0 do with THeightData(Items[i]) do begin
            if Dirty then begin
               FOwner:=nil;
               Free;
               Delete(i);
            end else usedMemory:=usedMemory+THeightData(Items[i]).DataSize;
         end;
         // if MaxPoolSize exceeded, release all that may be
         if usedMemory>MaxPoolSize then begin
            for i:=Count-1 downto 0 do with THeightData(Items[i]) do begin
               if (DataState=hdsReady) and (UseCounter=0) then begin
                  usedMemory:=usedMemory-DataSize;
                  FOwner:=nil;
                  Free;
                  Delete(i);
                  if usedMemory<=MaxPoolSize then Break;
               end;
            end;
         end; 
      finally
         FData.UnlockList;
      end;
   end;
end;

// SetMaxThreads
//
procedure THeightDataSource.SetMaxThreads(const val : Integer);
begin
   if val<0 then
      FMaxThreads:=0
   else FMaxThreads:=val;
end;

// StartPreparingData
//
procedure THeightDataSource.StartPreparingData(heightData : THeightData);
begin
   heightData.FDataState:=hdsReady;
end;

// InterpolatedHeight
//
function THeightDataSource.InterpolatedHeight(x, y : Single) : Single;
var
   i : Integer;
   hd, foundHd : THeightData;
begin
   with FData.LockList do begin
      try
         // first, lookup data list to find if aHeightData contains our point
         foundHd:=nil;
         for i:=0 to Count-1 do begin
            hd:=THeightData(Items[i]);
            if (hd.XLeft<=x) and (hd.YTop<=y)
                  and (hd.XLeft+hd.Size-1>x) and (hd.YTop+hd.Size-1>y) then begin
               foundHd:=hd;
               Break;
            end;
         end;
      finally
         FData.UnlockList;
      end;
   end;
   if foundHd=nil then begin
      // not found, request one... slowest mode (should be avoided)
      foundHd:=GetData(Trunc(x)-1, Trunc(y)-1, 4, hdtSingle);
   end else begin
      // request it using "standard" way (takes care of threads)
      foundHd:=GetData(foundHd.XLeft, foundHd.YTop, foundHd.Size, foundHd.DataType);
   end;
   Result:=foundHd.InterpolatedHeight(x-foundHd.XLeft, y-foundHd.YTop);
end;

// ------------------
// ------------------ THeightData ------------------
// ------------------

// Create
//
constructor THeightData.Create(aOwner : THeightDataSource;
                               aXLeft, aYTop, aSize : Integer;
                               aDataType : THeightDataType);
begin
	inherited Create;
   FOwner:=aOwner;
   FXLeft:=aXLeft;
   FYTop:=aYTop;
   FSize:=aSize;
   FDataType:=aDataType;
   FDataState:=hdsQueued;
   case DataType of
      hdtByte : begin
         FDataSize:=Size*Size*SizeOf(Byte);
         GetMem(FByteData, FDataSize);
         BuildByteRaster;
      end;
      hdtSmallInt : begin
         FDataSize:=Size*Size*SizeOf(SmallInt);
         GetMem(FSmallIntData, FDataSize);
         BuildSmallIntRaster;
      end;
      hdtSingle : begin
         FDataSize:=Size*Size*SizeOf(Single);
         GetMem(FSingleData, FDataSize);
         BuildSingleRaster;
      end;
   else
      Assert(False);
   end;
end;

// Destroy
//
destructor THeightData.Destroy;
begin
   Assert(Length(FUsers)=0, 'You should *not* free a THeightData, use "Release" instead');
   Assert(not Assigned(FOwner), 'You should *not* free a THeightData, use "Release" instead');
   if Assigned(FThread) then begin
      FThread.Terminate;
      FThread.WaitFor;
   end;
   if Assigned(FOnDestroy) then
      FOnDestroy(Self);
   case DataType of
      hdtByte : begin
         FreeMem(FByteData);
         FreeMem(FByteRaster);
      end;
      hdtSmallInt : begin
         FreeMem(FSmallIntData);
         FreeMem(FSmallIntRaster);
      end;
      hdtSingle : begin
         FreeMem(FSingleData);
         FreeMem(FSingleRaster);
      end;
   else
      Assert(False);
   end;
	inherited Destroy;
end;

// RegisterUse
//
procedure THeightData.RegisterUse;
begin
   Inc(FUseCounter);
end;

// Release
//
procedure THeightData.Release;
begin
   Dec(FUseCounter);
   Assert(FUseCounter>=0);
   if FUseCounter=0 then
      Owner.Release(Self);
end;

// MarkDirty
//
procedure THeightData.MarkDirty;
begin
   if not Dirty then begin
      FDirty:=True;
      FUseCounter:=0;
      FOwner.Release(Self);
   end;
end;

// SetDataType
//
procedure THeightData.SetDataType(const val : THeightDataType);
begin
   if val<>FDataType then begin
      case FDataType of
         hdtByte : case val of
               hdtSmallInt : ConvertByteToSmallInt;
               hdtSingle : ConvertByteToSingle;
            else
               Assert(False);
            end;
         hdtSmallInt : case val of
               hdtByte : ConvertSmallIntToByte;
               hdtSingle : ConvertSmallIntToSingle;
            else
               Assert(False);
            end;
         hdtSingle : case val of
               hdtByte : ConvertSingleToByte;
               hdtSmallInt : ConvertSingleToSmallInt;
            else
               Assert(False);
            end;
      else
         Assert(False);
      end;
      FDataType:=val;
   end;
end;

// BuildByteRaster
//
procedure THeightData.BuildByteRaster;
var
   i : Integer;
begin
   GetMem(FByteRaster, Size*SizeOf(PByteArray));
   for i:=0 to Size-1 do
      FByteRaster[i]:=@FByteData[i*Size]
end;

// BuildSmallIntRaster
//
procedure THeightData.BuildSmallIntRaster;
var
   i : Integer;
begin
   GetMem(FSmallIntRaster, Size*SizeOf(PSmallIntArray));
   for i:=0 to Size-1 do
      FSmallIntRaster[i]:=@FSmallIntData[i*Size]
end;

// BuildSingleRaster
//
procedure THeightData.BuildSingleRaster;
var
   i : Integer;
begin
   GetMem(FSingleRaster, Size*SizeOf(PSingleArray));
   for i:=0 to Size-1 do
      FSingleRaster[i]:=@FSingleData[i*Size]
end;

// ConvertByteToSmallInt
//
procedure THeightData.ConvertByteToSmallInt;
var
   i : Integer;
begin
   FreeMem(FByteRaster);
   FByteRaster:=nil;
   FDataSize:=Size*Size*SizeOf(SmallInt);
   GetMem(FSmallIntData, FDataSize);
   for i:=0 to Size*Size-1 do
      FSmallIntData[i]:=(FByteData[i]-128) shl 7;
   FreeMem(FByteData);
   FByteData:=nil;
   BuildSmallIntRaster;
end;

// ConvertByteToSingle
//
procedure THeightData.ConvertByteToSingle;
var
   i : Integer;
begin
   FreeMem(FByteRaster);
   FByteRaster:=nil;
   FDataSize:=Size*Size*SizeOf(Single);
   GetMem(FSingleData, FDataSize);
   for i:=0 to Size*Size-1 do
      FSingleData[i]:=(FByteData[i]-128) shl 7;
   FreeMem(FByteData);
   FByteData:=nil;
   BuildSingleRaster;
end;

// ConvertSmallIntToByte
//
procedure THeightData.ConvertSmallIntToByte;
var
   i : Integer;
begin
   FreeMem(FSmallIntRaster);
   FSmallIntRaster:=nil;
   FByteData:=Pointer(FSmallIntData);
   for i:=0 to Size*Size-1 do
      FByteData[i]:=(FSmallIntData[i] div 128)+128;
   FDataSize:=Size*Size*SizeOf(Byte);
   ReallocMem(FByteData, FDataSize);
   FSmallIntData:=nil;
   BuildByteRaster;
end;

// ConvertSmallIntToSingle
//
procedure THeightData.ConvertSmallIntToSingle;
var
   i : Integer;
begin
   FreeMem(FSmallIntRaster);
   FSmallIntRaster:=nil;
   FDataSize:=Size*Size*SizeOf(Single);
   GetMem(FSingleData, FDataSize);
   for i:=0 to Size*Size-1 do
      FSingleData[i]:=FSmallIntData[i];
   FreeMem(FSmallIntData);
   FSmallIntData:=nil;
   BuildSingleRaster;
end;

// ConvertSingleToByte
//
procedure THeightData.ConvertSingleToByte;
var
   i : Integer;
begin
   FreeMem(FSingleRaster);
   FSingleRaster:=nil;
   FByteData:=Pointer(FSingleData);
   for i:=0 to Size*Size-1 do
      FByteData[i]:=Round(FSingleData[i]) div 128+128;
   FDataSize:=Size*Size*SizeOf(Byte);
   ReallocMem(FByteData, FDataSize);
   FSingleData:=nil;
   BuildByteRaster;
end;

// ConvertSingleToSmallInt
//
procedure THeightData.ConvertSingleToSmallInt;
var
   i : Integer;
begin
   FreeMem(FSingleRaster);
   FSingleRaster:=nil;
   FSmallIntData:=Pointer(FSingleData);
   for i:=0 to Size*Size-1 do
      FSmallIntData[i]:=Round(FSingleData[i]);
   FDataSize:=Size*Size*SizeOf(SmallInt);
   ReallocMem(FSmallIntData, FDataSize);
   FSingleData:=nil;
   BuildSmallIntRaster;
end;

// ByteHeight
//
function THeightData.ByteHeight(x, y : Integer) : Byte;
begin
   Assert((Cardinal(x)<Cardinal(Size)) and (Cardinal(y)<Cardinal(Size)));
	Result:=ByteRaster[y][x];
end;

// SmallIntHeight
//
function THeightData.SmallIntHeight(x, y : Integer) : SmallInt;
begin
   Assert((Cardinal(x)<Cardinal(Size)) and (Cardinal(y)<Cardinal(Size)));
	Result:=SmallIntRaster[y][x];
end;

// SingleHeight
//
function THeightData.SingleHeight(x, y : Integer) : Single;
begin
   Assert((Cardinal(x)<Cardinal(Size)) and (Cardinal(y)<Cardinal(Size)));
	Result:=SingleRaster[y][x];
end;

// InterpolatedHeight
//
function THeightData.InterpolatedHeight(x, y : Single) : Single;
var
   ix, iy : Integer;
   h1, h2, h3 : Single;
begin
   ix:=Trunc(x);  x:=Frac(x);
   iy:=Trunc(y);  y:=Frac(y);
   if x+y<=1 then begin
      // top-left triangle
      h1:=Height(ix,    iy);
      h2:=Height(ix+1,  iy);
      h3:=Height(ix,    iy+1);
      Result:=h1+(h2-h1)*x+(h3-h1)*y;
   end else begin
      // bottom-right triangle
      h1:=Height(ix+1,  iy+1);
      h2:=Height(ix,    iy+1);
      h3:=Height(ix+1,  iy);
      Result:=h1+(h2-h1)*(1-x)+(h3-h1)*(1-y);
   end;
end;

// Height
//
function THeightData.Height(x, y : Integer) : Single;
begin
   case DataType of
      hdtByte : Result:=ByteHeight(x, y);
      hdtSmallInt : Result:=SmallIntHeight(x, y);
      hdtSingle : Result:=SingleHeight(x, y);
   else
      Result:=0;
      Assert(False);
   end;
end;

// Normal
//
function THeightData.Normal(x, y : Integer; const scale : TAffineVector) : TAffineVector;
var
   dx, dy : Single;
begin
   if x>0 then
      if x<Size-1 then
         dx:=(Height(x+1, y)-Height(x-1, y))*scale[0]*scale[2]
      else dx:=(Height(x, y)-Height(x-1, y))*scale[0]*scale[2]
   else dx:=(Height(x+1, y)-Height(x, y))*scale[0]*scale[2];
   if y>0 then
      if y<Size-1 then
         dy:=(Height(x, y+1)-Height(x, y-1))*scale[1]*scale[2]
      else dy:=(Height(x, y)-Height(x, y-1))*scale[1]*scale[2]
   else dy:=(Height(x, y+1)-Height(x, y))*scale[1]*scale[2];
   Result[0]:=dx;
   Result[1]:=dy;
   Result[2]:=1;
   NormalizeVector(Result);
end;

// OverlapsArea
//
function THeightData.OverlapsArea(const area : TGLRect) : Boolean;
begin
   Result:=(XLeft<=area.Right) and (YTop<=area.Bottom)
           and (XLeft+Size>area.Left) and (YTop+Size>area.Top); 
end;

// ------------------
// ------------------ THeightDataThread ------------------
// ------------------

// Destroy
//
destructor THeightDataThread.Destroy;
begin
   if Assigned(FHeightData) then
      FHeightData.FThread:=nil;
   inherited;
end;

// ------------------
// ------------------ TGLBitmapHDS ------------------
// ------------------

// Create
//
constructor TGLBitmapHDS.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);
   FPicture:=TPicture.Create;
   FPicture.OnChange:=OnPictureChanged;
end;

// Destroy
//
destructor TGLBitmapHDS.Destroy;
begin
   FreeMonochromeBitmap;
   FPicture.Free;
	inherited Destroy;
end;

// SetPicture
//
procedure TGLBitmapHDS.SetPicture(const val : TPicture);
begin
   FPicture.Assign(val);
end;

// OnPictureChanged
//
procedure TGLBitmapHDS.OnPictureChanged(Sender : TObject);
var
   oldPoolSize, size : Integer;
begin
   // cleanup pool
   oldPoolSize:=MaxPoolSize;
   MaxPoolSize:=0;
   CleanUp;
   MaxPoolSize:=oldPoolSize;
   // prepare MonoChromeBitmap
   FreeMonochromeBitmap;
   size:=Picture.Width;
   if size>0 then
      CreateMonochromeBitmap(size);
end;

// MarkDirty
//
procedure TGLBitmapHDS.MarkDirty(const area : TGLRect);
begin
   inherited;
   FreeMonochromeBitmap;
   if Picture.Width>0 then
      CreateMonochromeBitmap(Picture.Width);
end;

// CreateMonochromeBitmap
//
procedure TGLBitmapHDS.CreateMonochromeBitmap(size : Integer);
type
   TPaletteEntryArray = array [0..255] of TPaletteEntry;
   PPaletteEntryArray = ^TPaletteEntryArray;
   TLogPal = record
      lpal : TLogPalette;
      pe : TPaletteEntryArray;
   end;

var
   x : Integer;
   logpal : TLogPal;
   hPal : HPalette;
begin
   size:=RoundUpToPowerOf2(size);
   FBitmap:=Graphics.TBitmap.Create;
   FBitmap.PixelFormat:=pf8bit;
   FBitmap.Width:=size;
   FBitmap.Height:=size;
   for x:=0 to 255 do with PPaletteEntryArray(@logPal.lpal.palPalEntry[0])[x] do begin
      peRed:=x;
      peGreen:=x;
      peBlue:=x;
      peFlags:=0;
   end;
   with logpal.lpal do begin
      palVersion:=$300;
      palNumEntries:=256;
   end;
   hPal:=CreatePalette(logPal.lpal);
   Assert(hPal<>0);
   FBitmap.Palette:=hPal;
   // some picture formats trigger a "change" when drawed
   Picture.OnChange:=nil;
   try
      FBitmap.Canvas.StretchDraw(Rect(0, 0, size, size), Picture.Graphic);
   finally
      Picture.OnChange:=OnPictureChanged;
   end;
end;

// FreeMonochromeBitmap
//
procedure TGLBitmapHDS.FreeMonochromeBitmap;
begin
   FBitmap.Free;
   FBitmap:=nil;
end;

// StartPreparingData
//
procedure TGLBitmapHDS.StartPreparingData(heightData : THeightData);
var
   y, x : Integer;
   bmpSize, wrapMask : Integer;
   bitmapLine, rasterLine : PByteArray;
   oldType : THeightDataType;
   b : Byte;
begin
   if FBitmap=nil then Exit;
   bmpSize:=FBitmap.Width;
   wrapMask:=bmpSize-1;
   // retrieve data
   with heightData do begin
      oldType:=DataType;
      DataType:=hdtByte;
      for y:=YTop to YTop+Size-1 do begin
         bitmapLine:=FBitmap.ScanLine[y and wrapMask];
         rasterLine:=ByteRaster[y-YTop];
         // *BIG CAUTION HERE* : Don't remove the intermediate variable here!!!
         // or Delphi compiler will "optimize" to 32 bits access with clamping
         // resulting in possible reads of stuff beyon bitmapLine length!!!! 
         for x:=XLeft to XLeft+Size-1 do begin
            b:=bitmapLine[x and wrapMask];
            rasterLine[x-XLeft]:=b;
         end;
      end;
      if oldType<>hdtByte then
         DataType:=oldType;
   end;
   inherited;
end;

// ------------------
// ------------------ TGLTerrainBaseHDS ------------------
// ------------------

// Create
//
constructor TGLTerrainBaseHDS.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);
end;

// Destroy
//
destructor TGLTerrainBaseHDS.Destroy;
begin
	inherited Destroy;
end;

// StartPreparingData
//
procedure TGLTerrainBaseHDS.StartPreparingData(heightData : THeightData);
const
   cTBWidth : Integer = 4320;
   cTBHeight : Integer = 2160;
var
   y, x, offset : Integer;
   rasterLine : PSmallIntArray;
   oldType : THeightDataType;
   b : SmallInt;
   fs : TFileStream;
begin
   if not FileExists('tbase.bin') then Exit;
   fs:=TFileStream.Create('tbase.bin', fmOpenRead+fmShareDenyNone);
   try
      // retrieve data
      with heightData do begin
         oldType:=DataType;
         DataType:=hdtSmallInt;
         for y:=YTop to YTop+Size-1 do begin
            offset:=(y mod cTBHeight)*(cTBWidth*2);
            rasterLine:=SmallIntRaster[y-YTop];
            for x:=XLeft to XLeft+Size-1 do begin
               fs.Seek(offset+(x mod cTBWidth)*2, soFromBeginning);
               fs.Read(b, 2);
               if b<0 then b:=0;
               rasterLine[x-XLeft]:=SmallInt(b);
            end;
         end;
         if oldType<>hdtSmallInt then
            DataType:=oldType;
      end;
      inherited;
   finally
      fs.Free;
   end;
end;

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
initialization
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

	// class registrations
   Classes.RegisterClasses([TGLBitmapHDS, TGLTerrainBaseHDS]);

end.
