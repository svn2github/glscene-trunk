{: GLVectorFileObjects<p>

	Vector File related objects for GLScene<p>

	<b>History :</b><font size=-1><ul>
      <li>01/09/03 - SG - Added skeleton frame conversion methods to convert between
                          Rotations and Quaternions.
      <li>27/08/03 - SG - Fixed AddWeightedBone for multiple bones per vertex
      <li>13/08/03 - SG - Added quaternion transforms for skeletal animation
      <li>12/08/03 - SG - Fixed a tiny bug in TSkeleton.MorphMesh
      <li>08/07/03 - EG - Fixed puny bug in skeletal normals transformation 
      <li>05/06/03 - SG - Split SMD, MD2, 3DS, PLY, TIN and GTS code into separate units,
                          FileFormats\GLFile???.pas
      <li>16/05/03 - SG - Fixed OpenGL error caused by glColorMaterial in TMeshObject.BuildList
      <li>08/05/03 - DanB - added OctreeAABBIntersect (Matheus Degiovani)
      <li>07/05/03 - SG - Added TGLSMDVectorFile.SaveToFile method and [read,write] capabilities
      <li>17/04/03 - SG - Added TMeshObjectList.FindMeshByName method
      <li>01/04/03 - SG - Fixed TGLBaseMesh.Assign
      <li>13/02/03 - DanB - added AxisAlignedDimensionsUnscaled
      <li>03/02/03 - EG - Faster PrepareBuildList logic
      <li>31/01/03 - EG - Added MaterialCache logic
      <li>30/01/03 - EG - Fixed color array enable/disable (Nelson Chu),
                          Normals extraction and extraction standardization
      <li>27/01/03 - EG - Assign support, fixed MorphableMeshObjects persistence
      <li>16/01/03 - EG - Updated multiples Bones per vertex transformation code,
                          now makes use of CVAs 
      <li>14/01/03 - EG - Added DisableOpenGLArrays
      <li>09/01/03 - EG - Added Clear methods for MeshObjects
      <li>25/11/02 - EG - Colors and TexCoords lists now disabled if ignoreMaterials is true
      <li>23/10/02 - EG - Faster .GTS and .PLY imports (parsing)
      <li>22/10/02 - EG - Added actor options, fixed skeleton normals transform (thx Marcus)
      <li>21/10/02 - EG - Read support for .GTS (GNU Triangulated Surface library) 
      <li>18/10/02 - EG - FindExtByIndex (Adem)
      <li>17/10/02 - EG - TGLSTLVectorFile moved to new GLFileSTL unit
      <li>04/09/02 - EG - Fixed TGLBaseMesh.AxisAlignedDimensions
      <li>23/08/02 - EG - Added TGLBaseMesh.Visible
      <li>23/07/02 - EG - TGLBaseMesh.LoadFromStream fix (D. Angilella)
      <li>13/07/02 - EG - AutoCenter on barycenter
      <li>22/03/02 - EG - TGLAnimationControler basics now functional
      <li>13/03/02 - EG - Octree support (experimental)
      <li>18/02/02 - EG - Fixed persistence of skeletal meshes
      <li>04/01/02 - EG - Added basic RayCastIntersect implementation
      <li>17/12/01 - EG - Upgraded TGLActor.Synchronize (smooth transitions support)
      <li>30/11/01 - EG - Added smooth transitions (based on Mrqzzz code)
      <li>14/09/01 - EG - Use of vFileStreamClass
      <li>18/08/01 - EG - Added TriangleCount methods, STL export, PLY import
      <li>15/08/01 - EG - FaceGroups can now be rendered by material group
                          (activate with RenderingOption "moroGroupByMaterial")
      <li>14/08/01 - EG - Added TSkeletonBoneList and support for skeleton with
                          multiple root bones, updated SMD loader
      <li>13/08/01 - EG - Improved/fixed SMD loader
      <li>12/08/01 - EG - Completely rewritten handles management,
                          Fixed TActorAnimation.Assign,
                          Fixed persistence
      <li>08/08/01 - EG - Added TGLBaseMesh.AxisAlignedDimensions
      <li>19/07/01 - EG - AutoCentering is now a property of TGLBaseMesh,
                          3DS loader no longer auto-centers,
                          Added ExtractTriangles and related methods
      <li>18/07/01 - EG - VisibilityCulling compatibility changes
      <li>19/06/01 - EG - StrToFloat outlawed and replaced by StrToFloatDef
      <li>25/03/01 - EG - Added TGLAnimationControler
      <li>18/03/01 - EG - Added basic Skeleton structures & SMD importer
      <li>16/03/01 - EG - Introduced new PersistentClasses
      <li>15/03/01 - EG - Fix in TActorAnimation.SetEndFrame (thx David Costa)
      <li>08/03/01 - EG - TGL3DSVectorFile now loads materials for TGLBaseMesh
      <li>26/02/01 - EG - Added TBaseMeshObject & BuildNormals, MD2 normals auto-builded
      <li>21/02/01 - EG - Now XOpenGL based (multitexture)
      <li>15/01/01 - EG - Added Translate methods
      <li>10/01/01 - EG - Fixed in TGLBaseMesh.DoRender for RenderChildren states
      <li>08/01/01 - EG - Fixed TGLBaseMesh.BuildList messup of attrib states
      <li>22/12/00 - EG - Fixed non-interpolated TGLActor animation (was freezing),
                          Fixed TGLBaseMesh.DoRender messup of attrib states
      <li>18/12/00 - EG - TFGIndexTexCoordList now supports normals (automatically),
                          NormalsOrientation code moved to TGLBaseMesh
      <li>11/12/00 - EG - Fix for NormalOrientation (3DS importer)
      <li>06/12/00 - EG - Added PrepareBuildList mechanism
      <li>08/10/00 - EG - Removed TGLOBJVectorFile, use GLFileOBJ instead
      <li>13/08/00 - EG - Enhancements for Portal Rendering support,
                          Added utility methods & triangle fans
      <li>10/08/00 - EG - Added CurrentAnimation, fixed TMeshObject.GetExtents
      <li>21/07/00 - EG - Vastly improved memory use and mechanisms for MD2/TGLActor
      <li>19/07/00 - EG - Introduced enhanced mesh structure
      <li>16/07/00 - EG - Made use of new TDataFile class
      <li>15/07/00 - EG - FreeForm can now handle 3DS files with multiple textures,
                          Added TGLBaseMesh.GetExtents
      <li>28/06/00 - EG - Support for "ObjectStyle"
      <li>23/06/00 - EG - Reversed "t" texture coord for MD2,
                          TActorAnimations can now load/save
      <li>21/06/00 - EG - Added frame change events to TGLActor,
                          Added TActorAnimations collection
      <li>19/06/00 - EG - Completed smooth movement interpolation for TGLActor
      <li>07/06/00 - EG - TVectorFile now longers assumes a TGLFreeForm as Owner,
                          Added generic TVectorFile.LoadFromFile
      <li>26/05/00 - EG - Removed dependency to GLObjects,
                          TGLFreeForm now may use InterleavedArrays instead of
                          IndexedArrays (better BuildList compatibility)
      <li>22/04/00 - EG - Fixed Material handlings in TGLFreeForm, inverted CCW/CW
                          convention for 3DS Release3
		 <li>11/04/00 - EG - Removed unnecessary code in finalization (thanks Uwe)
	   <li>09/02/00 - EG - Creation from split of GLObjects,
                          fixed class registrations and formats unregistration
	</ul></font>
}
unit GLVectorFileObjects;

interface

uses Classes, GLScene, OpenGL1x, Geometry, SysUtils, GLMisc, GLTexture,
   GLMesh, VectorLists, PersistentClasses, Octree, GeometryBB,
   ApplicationFileIO, GLSilhouette;

type

   TMeshObjectList = class;
   TFaceGroups = class;

   // TMeshAutoCentering
   //
   TMeshAutoCentering = (macCenterX, macCenterY, macCenterZ, macUseBarycenter);
   TMeshAutoCenterings = set of TMeshAutoCentering;

   // TMeshObjectMode
   //
   TMeshObjectMode = (momTriangles, momTriangleStrip, momFaceGroups);

   // TBaseMeshObject
   //
   {: A base class for mesh objects.<p>
      The class introduces a set of vertices and normals for the object but
      does no rendering of its own. }
   TBaseMeshObject = class (TPersistentObject)
      private
         { Private Declarations }
         FName : String;
         FVertices : TAffineVectorList;
         FNormals : TAffineVectorList;
         FVisible : Boolean;

      protected
         { Protected Declarations }
         procedure SetVertices(const val : TAffineVectorList);
         procedure SetNormals(const val : TAffineVectorList);

         procedure ContributeToBarycenter(var currentSum : TAffineVector;
                                          var nb : Integer); dynamic;

      public
         { Public Declarations }
         constructor Create; override;
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         {: Clears all mesh object data, submeshes, facegroups, etc. }
         procedure Clear; dynamic;

         {: Translates all the vertices by the given delta. }
         procedure Translate(const delta : TAffineVector); dynamic;
         {: Builds (smoothed) normals for the vertex list.<p>
            If normalIndices is nil, the method assumes a bijection between
            vertices and normals sets, and when performed, Normals and Vertices
            list will have the same number of items (whatever previously was in
            the Normals list is ignored/removed).<p>
            If normalIndices is defined, normals will be added to the list and
            their indices will be added to normalIndices. Already defined
            normals and indices are preserved.<p>
            The only valid modes are currently momTriangles and momTriangleStrip
            (ie. momFaceGroups not supported). }
         procedure BuildNormals(vertexIndices : TIntegerList; mode : TMeshObjectMode;
                                normalIndices : TIntegerList = nil);
         {: Extracts all mesh triangles as a triangles list.<p>
            The resulting list size is a multiple of 3, each group of 3 vertices
            making up and independant triangle.<br>
            The returned list can be used independantly from the mesh object
            (all data is duplicated) and should be freed by caller.<p>
            If texCoords is specified, per vertex texture coordinates will be
            placed there, when available. }
         function ExtractTriangles(texCoords : TAffineVectorList = nil;
                                   normals : TAffineVectorList = nil) : TAffineVectorList; dynamic;

         property Name : String read FName write FName;
         property Visible : Boolean read FVisible write FVisible;
         property Vertices : TAffineVectorList read FVertices write SetVertices;
         property Normals : TAffineVectorList read FNormals write SetNormals;
   end;

   TSkeletonFrameList = class;

   TSkeletonFrameTransform = (sftRotation,sftQuaternion);

	// TSkeletonFrame
	//
   {: Stores position and rotation for skeleton joints.<p>
      If you directly alter some values, make sure to call FlushLocalMatrixList
      so that the local matrices will be recalculated (the call to Flush does
      not recalculate the matrices, but marks the current ones as dirty). }
	TSkeletonFrame = class (TPersistentObject)
	   private
	      { Private Declarations }
         FOwner : TSkeletonFrameList;
         FName : String;
         FPosition : TAffineVectorList;
         FRotation : TAffineVectorList;
         FLocalMatrixList : PMatrixArray;
         FQuaternion : TQuaternionList;
         FTransformMode : TSkeletonFrameTransform;

	   protected
	      { Protected Declarations }
         procedure SetPosition(const val : TAffineVectorList);
         procedure SetRotation(const val : TAffineVectorList);
         procedure SetQuaternion(const val : TQuaternionList);

	   public
	      { Public Declarations }
         constructor CreateOwned(aOwner : TSkeletonFrameList);
	      constructor Create; override;
         destructor Destroy; override;

	      procedure WriteToFiler(writer : TVirtualWriter); override;
	      procedure ReadFromFiler(reader : TVirtualReader); override;

         property Owner : TSkeletonFrameList read FOwner;
         property Name : String read FName write FName;
         {: Position values for the joints. }
         property Position : TAffineVectorList read FPosition write SetPosition;
         {: Rotation values for the joints. }
         property Rotation : TAffineVectorList read FRotation write SetRotation;
         {: Quaternions are an alternative to Euler rotations to build the
            global matrices for the skeleton bones. }
         property Quaternion : TQuaternionList read FQuaternion write SetQuaternion;
         {: TransformMode indicates whether to use Rotation or Quaternion to build
            the local transform matrices. }
         property TransformMode : TSkeletonFrameTransform read FTransformMode write FTransformMode;

         {: Calculate or retrieves an array of local bone matrices.<p>
            This array is calculated on the first call after creation, and the
            first call following a FlushLocalMatrixList. Subsequent calls return
            the same arrays. }
         function LocalMatrixList : PMatrixArray;
         {: Flushes (frees) then LocalMatrixList data.<p>
            Call this function to allow a recalculation of local matrices. }
         procedure FlushLocalMatrixList;
         //: As the name states; Convert Quaternions to Rotations or vice-versa.
         procedure ConvertQuaternionsToRotations(KeepQuaternions : Boolean = True);
         procedure ConvertRotationsToQuaternions(KeepRotations : Boolean = True);
	end;

   // TSkeletonFrameList
   //
   {: A list of TSkeletonFrame objects. }
   TSkeletonFrameList = class (TPersistentObjectList)
      private
         { Private Declarations }
         FOwner : TPersistent;

      protected
         { Protected Declarations }
         function GetSkeletonFrame(Index: Integer) : TSkeletonFrame;

      public
         { Public Declarations }
         constructor CreateOwned(AOwner : TPersistent);
         destructor Destroy; override;

			procedure ReadFromFiler(reader : TVirtualReader); override;

         //: As the name states; Convert Quaternions to Rotations or vice-versa.
         procedure ConvertQuaternionsToRotations(KeepQuaternions : Boolean = True);
         procedure ConvertRotationsToQuaternions(KeepRotations : Boolean = True);

         property Owner : TPersistent read FOwner;
         procedure Clear; override;
         property Items[Index: Integer] : TSkeletonFrame read GetSkeletonFrame; default;
   end;

   TSkeleton = class;
   TSkeletonBone = class;

	// TSkeletonBoneList
	//
   {: A list of skeleton bones.<p> }
	TSkeletonBoneList = class (TPersistentObjectList)
	   private
	      { Private Declarations }
         FSkeleton : TSkeleton;     // not persistent

	   protected
	      { Protected Declarations }
         function GetSkeletonBone(Index: Integer) : TSkeletonBone;
         procedure AfterObjectCreatedByReader(Sender : TObject); override;

	   public
	      { Public Declarations }
	      constructor CreateOwned(aOwner : TSkeleton);
	      constructor Create; override;
         destructor Destroy; override;

	      procedure WriteToFiler(writer : TVirtualWriter); override;
	      procedure ReadFromFiler(reader : TVirtualReader); override;

         property Skeleton : TSkeleton read FSkeleton;
         property Items[Index: Integer] : TSkeletonBone read GetSkeletonBone; default;

         {: Returns a bone by its BoneID, nil if not found. }
         function BoneByID(anID : Integer) : TSkeletonBone; virtual;

         //: Render skeleton wireframe
         procedure BuildList(var mrci : TRenderContextInfo); virtual; abstract;
         procedure PrepareGlobalMatrices; virtual;
	end;

	// TSkeletonRootBoneList
	//
   {: This list store skeleton root bones exclusively.<p> }
	TSkeletonRootBoneList = class (TSkeletonBoneList)
	   private
	      { Private Declarations }

	   protected
	      { Protected Declarations }

	   public
	      { Public Declarations }
	      constructor Create; override;
         destructor Destroy; override;

	      procedure WriteToFiler(writer : TVirtualWriter); override;
	      procedure ReadFromFiler(reader : TVirtualReader); override;

         //: Render skeleton wireframe
         procedure BuildList(var mrci : TRenderContextInfo); override;
   end;

	// TSkeletonBone
	//
   {: A skeleton bone or node and its children.<p>
      This class is the base item of the bones hierarchy in a skeletal model.
      The joint values are stored in a TSkeletonFrame, but the calculated bone
      matrices are stored here. }
	TSkeletonBone = class (TSkeletonBoneList)
	   private
	      { Private Declarations }
         FOwner : TSkeletonBoneList;    // indirectly persistent
         FBoneID : Integer;
         FName : String;
         FColor : Cardinal;
         FGlobalMatrix : TMatrix;

	   protected
	      { Protected Declarations }
         function GetSkeletonBone(Index: Integer) : TSkeletonBone;
         procedure SetColor(const val : Cardinal);

	   public
	      { Public Declarations }
	      constructor CreateOwned(aOwner : TSkeletonBoneList);
	      constructor Create; override;
         destructor Destroy; override;

	      procedure WriteToFiler(writer : TVirtualWriter); override;
	      procedure ReadFromFiler(reader : TVirtualReader); override;

         //: Render skeleton wireframe
         procedure BuildList(var mrci : TRenderContextInfo); override;

         property Owner : TSkeletonBoneList read FOwner;
         property Name : String read FName write FName;
         property BoneID : Integer read FBoneID write FBoneID;
         property Color : Cardinal read FColor write SetColor;
         property Items[Index: Integer] : TSkeletonBone read GetSkeletonBone; default;

         {: Returns a bone by its BoneID, nil if not found. }
         function BoneByID(anID : Integer) : TSkeletonBone; override;

         {: Calculates the global matrix for the bone and its sub-bone.<p>
            Call this function directly only the RootBone. }
         procedure PrepareGlobalMatrices; override;
         {: Global Matrix for the bone in the current frame.<p>
            Global matrices must be prepared by invoking PrepareGlobalMatrices
            on the root bone. }
         property GlobalMatrix : TMatrix read FGlobalMatrix;

         {: Free all sub bones and reset BoneID and Name. }
         procedure Clean; override;
	end;

   TGLBaseMesh = class;

   // TBlendedLerpInfo
   //
   {: Small structure to store a weighted lerp for use in blending. }
   TBlendedLerpInfo = record
      frameIndex1, frameIndex2 : Integer;
      lerpFactor : Single;
      weight : Single;
   end;

	// TSkeleton
	//
   {: Main skeleton object.<p>
      This class stores the bones hierarchy and animation frames.<br>
      It is also responsible for maintaining the "CurrentFrame" and allowing
      various frame blending operations. }
	TSkeleton = class (TPersistentObject)
	   private
	      { Private Declarations }
         FOwner : TGLBaseMesh;
         FRootBones : TSkeletonRootBoneList;
         FFrames : TSkeletonFrameList;
         FCurrentFrame : TSkeletonFrame; // not persistent
         FBonesByIDCache : TList;

	   protected
	      { Protected Declarations }
         procedure SetRootBones(const val : TSkeletonRootBoneList);
         procedure SetFrames(const val : TSkeletonFrameList);
         function GetCurrentFrame : TSkeletonFrame;
         procedure SetCurrentFrame(val : TSkeletonFrame);

	   public
	      { Public Declarations }
         constructor CreateOwned(AOwner : TGLBaseMesh);
	      constructor Create; override;
         destructor Destroy; override;

	      procedure WriteToFiler(writer : TVirtualWriter); override;
	      procedure ReadFromFiler(reader : TVirtualReader); override;

         property Owner : TGLBaseMesh read FOwner;
         property RootBones : TSkeletonRootBoneList read FRootBones write SetRootBones;
         property Frames : TSkeletonFrameList read FFrames write SetFrames;
         property CurrentFrame : TSkeletonFrame read GetCurrentFrame write SetCurrentFrame;

         procedure FlushBoneByIDCache;
         function BoneByID(anID : Integer) : TSkeletonBone;

         procedure MorphTo(frameIndex : Integer);
         procedure Lerp(frameIndex1, frameIndex2 : Integer;
                        lerpFactor : Single);
         procedure BlendedLerps(const lerpInfos : array of TBlendedLerpInfo);

         {: Linearly removes the translation component between skeletal frames.<p>
            This function will compute the translation of the first bone (index 0)
            and linearly subtract this translation in all frames between startFrame
            and endFrame. Its purpose is essentially to remove the 'slide' that
            exists in some animation formats (f.i. SMD). }
         procedure MakeSkeletalTranslationStatic(startFrame, endFrame : Integer);
         {: Removes the absolute rotation component of the skeletal frames.<p>
            Some formats will store frames with absolute rotation information,
            if this correct if the animation is the "main" animation.<br>
            This function removes that absolute information, making the animation
            frames suitable for blending purposes. }
         procedure MakeSkeletalRotationDelta(startFrame, endFrame : Integer);

         {: Applies current frame to morph all mesh objects. }
         procedure MorphMesh(normalize : Boolean);

         {: Release bones and frames info. }
         procedure Clear;
	end;

   // TMeshObjectRenderingOption
   //
   {: Rendering options per TMeshObject.<p>
   <ul>
   <li>moroGroupByMaterial : if set, the facegroups will be rendered by material
      in batchs, this will optimize rendering by reducing material switches, but
      also implies that facegroups will not be rendered in the order they are in
      the list.
   </ul> }
   TMeshObjectRenderingOption = (moroGroupByMaterial);
   TMeshObjectRenderingOptions = set of TMeshObjectRenderingOption;

   // TMeshObject
   //
   {: Base mesh class.<p>
      Introduces base methods and properties for mesh objects.<p>
      Subclasses are named "TMOxxx". }
   TMeshObject = class (TBaseMeshObject)
      private
         { Private Declarations }
         FOwner : TMeshObjectList;
         FTexCoords : TAffineVectorList; // provision for 3D textures
         FLighmapTexCoords : TTexPointList; // reserved for 2D surface needs
         FColors : TVectorList;
         FFaceGroups: TFaceGroups;
         FMode : TMeshObjectMode;
         FRenderingOptions : TMeshObjectRenderingOptions;
         FArraysDeclared : Boolean; // not persistent
         FLightMapArrayEnabled : Boolean; // not persistent

      protected
         { Protected Declarations }
         procedure SetTexCoords(const val : TAffineVectorList);
         procedure SetLightmapTexCoords(const val : TTexPointList);
         procedure SetColors(const val : TVectorList);

         procedure DeclareArraysToOpenGL(var mrci : TRenderContextInfo;
                                         evenIfAlreadyDeclared : Boolean = False);
         procedure DisableOpenGLArrays(var mrci : TRenderContextInfo);

         procedure EnableLightMapArray(var mrci : TRenderContextInfo);
         procedure DisableLightMapArray(var mrci : TRenderContextInfo);

      public
         { Public Declarations }
         {: Creates, assigns Owner and adds to list. } 
         constructor CreateOwned(AOwner : TMeshObjectList);
         constructor Create; override;
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure Clear; override;

         function ExtractTriangles(texCoords : TAffineVectorList = nil;
                                   normals : TAffineVectorList = nil) : TAffineVectorList; override;
         {: Returns number of triangles in the mesh object. }
         function TriangleCount : Integer; dynamic;

         procedure PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
         procedure DropMaterialLibraryCache;
         
         {: Prepare the texture and materials before rendering.<p>
            Invoked once, before building the list and NOT while building the list. }
         procedure PrepareBuildList(var mrci : TRenderContextInfo); virtual;
         //: Similar to regular scene object's BuildList method
         procedure BuildList(var mrci : TRenderContextInfo); virtual;

         //: The extents of the object (min and max coordinates)
         procedure GetExtents(var min, max : TAffineVector); dynamic;

         //: Precalculate whatever is needed for rendering, called once
         procedure Prepare; dynamic;

         function PointInObject(const aPoint : TAffineVector) : Boolean; virtual;

         property Owner : TMeshObjectList read FOwner;
         property Mode : TMeshObjectMode read FMode write FMode;
         property TexCoords : TAffineVectorList read FTexCoords write SetTexCoords;
         property LighmapTexCoords : TTexPointList read FLighmapTexCoords write SetLightmapTexCoords;
         property Colors : TVectorList read FColors write SetColors;
         property FaceGroups : TFaceGroups read FFaceGroups;
         property RenderingOptions : TMeshObjectRenderingOptions read FRenderingOptions write FRenderingOptions;

   end;

   // TMeshObjectList
   //
   {: A list of TMeshObject objects. }
   TMeshObjectList = class (TPersistentObjectList)
      private
         { Private Declarations }
         FOwner : TGLBaseMesh;

      protected
         { Protected Declarations }
         function GetMeshObject(Index: Integer) : TMeshObject;

      public
         { Public Declarations }
         constructor CreateOwned(aOwner : TGLBaseMesh);
         destructor Destroy; override;

			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
         procedure DropMaterialLibraryCache;

         {: Prepare the texture and materials before rendering.<p>
            Invoked once, before building the list and NOT while building the list. }
         procedure PrepareBuildList(var mrci : TRenderContextInfo); virtual;
         //: Similar to regular scene object's BuildList method
         procedure BuildList(var mrci : TRenderContextInfo); virtual;

         procedure MorphTo(morphTargetIndex : Integer);
         procedure Lerp(morphTargetIndex1, morphTargetIndex2 : Integer;
                        lerpFactor : Single);
         function MorphTargetCount : Integer;

         procedure GetExtents(var min, max : TAffineVector);
         procedure Translate(const delta : TAffineVector);
         function ExtractTriangles(texCoords : TAffineVectorList = nil;
                                   normals : TAffineVectorList = nil) : TAffineVectorList;
         {: Returns number of triangles in the meshes of the list. }
         function TriangleCount : Integer;

         //: Precalculate whatever is needed for rendering, called once
         procedure Prepare; dynamic;
         
         function FindMeshByName(MeshName : String) : TMeshObject;

         property Owner : TGLBaseMesh read FOwner;
         procedure Clear; override;
         property Items[Index: Integer] : TMeshObject read GetMeshObject; default;
   end;

   TMeshObjectListClass = class of TMeshObjectList;

   TMeshMorphTargetList = class;

   // TMeshMorphTarget
   //
   {: A morph target, stores alternate lists of vertices and normals. }
   TMeshMorphTarget = class (TBaseMeshObject)
      private
         { Private Declarations }
         FOwner : TMeshMorphTargetList;

      protected
         { Protected Declarations }

      public
         { Public Declarations }
         constructor CreateOwned(AOwner : TMeshMorphTargetList);
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         property Owner : TMeshMorphTargetList read FOwner;
   end;

   // TMeshMorphTargetList
   //
   {: A list of TMeshMorphTarget objects. }
   TMeshMorphTargetList = class (TPersistentObjectList)
      private
         { Private Declarations }
         FOwner : TPersistent;

      protected
         { Protected Declarations }
         function GetMeshMorphTarget(Index: Integer) : TMeshMorphTarget;

      public
         { Public Declarations }
         constructor CreateOwned(AOwner : TPersistent);
         destructor Destroy; override;

			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure Translate(const delta : TAffineVector);

         property Owner : TPersistent read FOwner;
         procedure Clear; override;
         property Items[Index: Integer] : TMeshMorphTarget read GetMeshMorphTarget; default;
   end;

   // TMorphableMeshObject
   //
   {: Mesh object with support for morph targets.<p>
      The morph targets allow to change vertices and normals according to pre-
      existing "morph targets". }
   TMorphableMeshObject = class (TMeshObject)
      private
         { Private Declarations }
         FMorphTargets : TMeshMorphTargetList;

      protected
         { Protected Declarations }

      public
         { Public Declarations }
         constructor Create; override;
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure Clear; override;

         procedure Translate(const delta : TAffineVector); override;

         procedure MorphTo(morphTargetIndex : Integer);
         procedure Lerp(morphTargetIndex1, morphTargetIndex2 : Integer;
                        lerpFactor : Single);

         property MorphTargets : TMeshMorphTargetList read FMorphTargets;
   end;

   // TVertexBoneWeight
   //
   TVertexBoneWeight = packed record
      BoneID : Integer;
      Weight : Single;
   end;

   TVertexBoneWeightArray = array [0..MaxInt shr 4] of TVertexBoneWeight;
   PVertexBoneWeightArray = ^TVertexBoneWeightArray;
   TVerticesBoneWeights = array [0..MaxInt shr 3] of PVertexBoneWeightArray;
   PVerticesBoneWeights = ^TVerticesBoneWeights;

	// TSkeletonMeshObject
	//
   {: A mesh object with vertice bone attachments.<p>
      The class adds per vertex bone weights to the standard morphable mesh.<br>
      The TVertexBoneWeight structures are accessed via VerticesBonesWeights,
      they must be initialized by adjusting the BonesPerVertex and
      VerticeBoneWeightCount properties, you can also add vertex by vertex
      by using the AddWeightedBone method.<p>
      When BonesPerVertex is 1, the weight is ignored (set to 1.0). }
	TSkeletonMeshObject = class (TMorphableMeshObject)
	   private
	      { Private Declarations }
         FVerticesBonesWeights : PVerticesBoneWeights;
         FVerticeBoneWeightCount : Integer;
         FBonesPerVertex : Integer;
         FLastVerticeBoneWeightCount, FLastBonesPerVertex : Integer; // not persistent
         FBoneMatrixInvertedMeshes : TList; // not persistent

	   protected
	      { Protected Declarations }
         procedure SetVerticeBoneWeightCount(const val : Integer);
         procedure SetBonesPerVertex(const val : Integer);
	      procedure ResizeVerticesBonesWeights;

	   public
	      { Public Declarations }
	      constructor Create; override;
         destructor Destroy; override;

	      procedure WriteToFiler(writer : TVirtualWriter); override;
	      procedure ReadFromFiler(reader : TVirtualReader); override;

	      procedure Clear; override;

         property VerticesBonesWeights : PVerticesBoneWeights read FVerticesBonesWeights;
         property VerticeBoneWeightCount : Integer read FVerticeBoneWeightCount write SetVerticeBoneWeightCount;
         property BonesPerVertex : Integer read FBonesPerVertex write SetBonesPerVertex;

         function FindOrAdd(boneID : Integer; const vertex, normal : TAffineVector) : Integer;

         procedure AddWeightedBone(aBoneID : Integer; aWeight : Single);
         procedure PrepareBoneMatrixInvertedMeshes;
         procedure ApplyCurrentSkeletonFrame(normalize : Boolean);

	end;

   // TFaceGroup
   //
   {: Describes a face group of a TMeshObject.<p>
      Face groups should be understood as "a way to use mesh data to render
      a part or the whole mesh object".<p>
      Subclasses implement the actual behaviours, and should have at least
      one "Add" method, taking in parameters all that is required to describe
      a single base facegroup element. }
   TFaceGroup = class (TPersistentObject)
      private
         { Private Declarations }
         FOwner : TFaceGroups;
         FMaterialName : String;
         FMaterialCache : TGLLibMaterial;
         FLightMapIndex : Integer;
         FRenderGroupID : Integer; // NOT Persistent, internal use only (rendering options)

	   protected
	      { Protected Declarations }
         procedure AttachLightmap(lightMap : TGLTexture; var mrci : TRenderContextInfo);
         procedure AttachOrDetachLightmap(var mrci : TRenderContextInfo);

      public
         { Public Declarations }
         constructor CreateOwned(AOwner : TFaceGroups); virtual;
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
         procedure DropMaterialLibraryCache;

         procedure BuildList(var mrci : TRenderContextInfo); virtual; abstract;

         {: Add to the list the triangles corresponding to the facegroup.<p>
            This function is used by TMeshObjects ExtractTriangles to retrieve
            all the triangles in a mesh. }
         procedure AddToTriangles(aList : TAffineVectorList;
                                  aTexCoords : TAffineVectorList = nil;
                                  aNormals : TAffineVectorList = nil); dynamic;
         {: Returns number of triangles in the facegroup. }
         function TriangleCount : Integer; dynamic; abstract;
         {: Reverses the rendering order of faces.<p>
            Default implementation does nothing }
         procedure Reverse; dynamic;

         //: Precalculate whatever is needed for rendering, called once
         procedure Prepare; dynamic;

         property Owner : TFaceGroups read FOwner write FOwner;
         property MaterialName : String read FMaterialName write FMaterialName;
         property MaterialCache : TGLLibMaterial read FMaterialCache;
         {: Index of lightmap in the lightmap library. }
         property LightMapIndex : Integer read FLightMapIndex write FLightMapIndex;
   end;

   // TFaceGroupMeshMode
   //
   {: Known descriptions for face group mesh modes.<p>
      - fgmmTriangles : issue all vertices with GL_TRIANGLES<br>
      - fgmmTriangleStrip : issue all vertices with GL_TRIANGLE_STRIP<br>
      - fgmmFlatTriangles : same as fgmmTriangles, but take advantage of having
         the same normal for all vertices of a triangle.<br>
      - fgmmTriangleFan : issue all vertices with GL_TRIANGLE_FAN }
   TFaceGroupMeshMode = (fgmmTriangles, fgmmTriangleStrip, fgmmFlatTriangles,
                         fgmmTriangleFan);

   // TFGVertexIndexList
   //
   {: A face group based on an indexlist.<p>
      The index list refers to items in the mesh object (vertices, normals, etc.),
      that are all considered in sync, the render is obtained issueing the items
      in the order given by the vertices.<p> }
   TFGVertexIndexList = class (TFaceGroup)
      private
         { Private Declarations }
         FVertexIndices : TIntegerList;
         FMode : TFaceGroupMeshMode;

      protected
         { Protected Declarations }
         procedure SetVertexIndices(const val : TIntegerList);

         procedure AddToList(source, destination : TAffineVectorList;
                             indices : TIntegerList);

      public
         { Public Declarations }
         constructor Create; override;
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure BuildList(var mrci : TRenderContextInfo); override;
         procedure AddToTriangles(aList : TAffineVectorList;
                                  aTexCoords : TAffineVectorList = nil;
                                  aNormals : TAffineVectorList = nil); override;
         function TriangleCount : Integer; override;
         procedure Reverse; override;

         procedure Add(idx : Integer);
         procedure GetExtents(var min, max : TAffineVector);
         {: If mode is strip or fan, convert the indices to triangle list indices. }
         procedure ConvertToList;

         //: Return the normal from the 1st three points in the facegroup
         function  GetNormal : TAffineVector;

         property Mode : TFaceGroupMeshMode read FMode write FMode;
         property VertexIndices : TIntegerList read FVertexIndices write SetVertexIndices;
   end;

   // TFGVertexNormalTexIndexList
   //
   {: Adds normals and texcoords indices.<p>
      Allows very compact description of a mesh. The Normals ad TexCoords
      indices are optionnal, if missing (empty), VertexIndices will be used. }
   TFGVertexNormalTexIndexList = class (TFGVertexIndexList)
      private
         { Private Declarations }
         FNormalIndices : TIntegerList;
         FTexCoordIndices : TIntegerList;

      protected
         { Protected Declarations }
         procedure SetNormalIndices(const val : TIntegerList);
         procedure SetTexCoordIndices(const val : TIntegerList);

      public
         { Public Declarations }
         constructor Create; override;
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure BuildList(var mrci : TRenderContextInfo); override;
         procedure AddToTriangles(aList : TAffineVectorList;
                                  aTexCoords : TAffineVectorList = nil;
                                  aNormals : TAffineVectorList = nil); override;

         procedure Add(vertexIdx, normalIdx, texCoordIdx : Integer);

         property NormalIndices : TIntegerList read FNormalIndices write SetNormalIndices;
         property TexCoordIndices : TIntegerList read FTexCoordIndices write SetTexCoordIndices;
   end;

   // TFGIndexTexCoordList
   //
   {: Adds per index texture coordinates to its ancestor.<p>
      Per index texture coordinates allows having different texture coordinates
      per triangle, depending on the face it is used in. }
   TFGIndexTexCoordList = class (TFGVertexIndexList)
      private
         { Private Declarations }
         FTexCoords : TAffineVectorList;

      protected
         { Protected Declarations }
         procedure SetTexCoords(const val : TAffineVectorList);

      public
         { Public Declarations }
         constructor Create; override;
         destructor Destroy; override;

			procedure WriteToFiler(writer : TVirtualWriter); override;
			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure BuildList(var mrci : TRenderContextInfo); override;
         procedure AddToTriangles(aList : TAffineVectorList;
                                  aTexCoords : TAffineVectorList = nil;
                                  aNormals : TAffineVectorList = nil); override;

         procedure Add(idx : Integer; const texCoord : TAffineVector); overload;
         procedure Add(idx : Integer; const s, t : Single); overload;

         property TexCoords : TAffineVectorList read FTexCoords write SetTexCoords;
   end;

   // TFaceGroups
   //
   {: A list of TFaceGroup objects. }
   TFaceGroups = class (TPersistentObjectList)
      private
         { Private Declarations }
         FOwner : TMeshObject;

      protected
         { Protected Declarations }
         function GetFaceGroup(Index: Integer) : TFaceGroup;

      public
         { Public Declarations }
         constructor CreateOwned(AOwner : TMeshObject);
         destructor Destroy; override;

			procedure ReadFromFiler(reader : TVirtualReader); override;

         procedure PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
         procedure DropMaterialLibraryCache;
         
         property Owner : TMeshObject read FOwner;
         procedure Clear; override;
         property Items[Index: Integer] : TFaceGroup read GetFaceGroup; default;

         procedure AddToTriangles(aList : TAffineVectorList;
                                  aTexCoords : TAffineVectorList = nil;
                                  aNormals : TAffineVectorList = nil);

         {: Material Library of the owner TGLBaseMesh. }
         function MaterialLibrary : TGLMaterialLibrary;
         {: Sort faces by material.<p>
            Those without material first in list, followed by opaque materials,
            then transparent materials. }
         procedure SortByMaterial;
   end;

   // TMeshNormalsOrientation
   //
   {: Determines how normals orientation is defined in a mesh.<p>
      - mnoDefault : uses default orientation<br>
      - mnoInvert : inverse of default orientation<br>
      - mnoAutoSolid : autocalculate to make the mesh globally solid<br>
      - mnoAutoHollow : autocalculate to make the mesh globally hollow<br> }
   TMeshNormalsOrientation = (mnoDefault, mnoInvert); //, mnoAutoSolid, mnoAutoHollow);

   // TVectorFile
   //
   {: Abstract base class for different vector file formats.<p>
      The actual implementation for these files (3DS, DXF..) must be done
      seperately. The concept for TVectorFile is very similar to TGraphic
      (see Delphi Help). }
   TVectorFile = class (TDataFile)
      private
         { Private Declarations }
         FNormalsOrientation : TMeshNormalsOrientation;

      protected
         { Protected Declarations }
         procedure SetNormalsOrientation(const val : TMeshNormalsOrientation); virtual;

      public
         { Public Declarations }
         constructor Create(AOwner: TPersistent); override;

         function Owner : TGLBaseMesh;

         property NormalsOrientation : TMeshNormalsOrientation read FNormalsOrientation write SetNormalsOrientation;
   end;

   TVectorFileClass = class of TVectorFile;

   // TGLGLSMVectorFile
   //
   {: GLSM (GLScene Mesh) vector file.<p>
      This corresponds to the 'native' GLScene format, and object persistence
      stream, which should be the 'fastest' of all formats to load, and supports
      all of GLScene features. }
   TGLGLSMVectorFile = class (TVectorFile)
      public
         { Public Declarations }
         class function Capabilities : TDataFileCapabilities; override;

         procedure LoadFromStream(aStream : TStream); override;
         procedure SaveToStream(aStream : TStream); override;
   end;

   // TGLBaseMesh
   //
   {: Base class for mesh objects. }
   TGLBaseMesh = class(TGLSceneObject)
      private
         { Private Declarations }
         FNormalsOrientation : TMeshNormalsOrientation;
         FMaterialLibrary : TGLMaterialLibrary;
         FLightmapLibrary : TGLMaterialLibrary;
         FAxisAlignedDimensionsCache : TVector;
         FUseMeshMaterials : Boolean;
         FOverlaySkeleton : Boolean;
         FIgnoreMissingTextures : Boolean;
         FAutoCentering : TMeshAutoCenterings;
         FMaterialLibraryCachesPrepared : Boolean;
         FConnectivity : TObject;

      protected
         { Protected Declarations }
         FMeshObjects : TMeshObjectList;     // a list of mesh objects
         FSkeleton : TSkeleton;              // skeleton data & frames
         procedure SetUseMeshMaterials(const val : Boolean);
         procedure SetMaterialLibrary(const val : TGLMaterialLibrary);
         procedure SetLightmapLibrary(const val : TGLMaterialLibrary);
         procedure SetNormalsOrientation(const val : TMeshNormalsOrientation);
         procedure SetOverlaySkeleton(const val : Boolean);

         procedure DestroyHandle; override;

         {: Invoked after creating a TVectorFile and before loading.<p>
            Triggered by LoadFromFile/Stream and AddDataFromFile/Stream.<br>
            Allows to adjust/transfer subclass-specific features. }
         procedure PrepareVectorFile(aFile : TVectorFile); dynamic;

         {: Invoked after a mesh has been loaded.<p>
            Should auto-center according to the AutoCentering property. }
         procedure PerformAutoCentering; dynamic;
         {: Invoked after a mesh has been loaded/added.<p>
            Triggered by LoadFromFile/Stream and AddDataFromFile/Stream.<br>
            Allows to adjust/transfer subclass-specific features. }
         procedure PrepareMesh; dynamic;

         {: Recursively propagated to mesh object and facegroups.<p>
            Notifies that they all can establish their material library caches. }
         procedure PrepareMaterialLibraryCache;
         {: Recursively propagated to mesh object and facegroups.<p>
            Notifies that they all should forget their material library caches. }
         procedure DropMaterialLibraryCache;

         {: Prepare the texture and materials before rendering.<p>
            Invoked once, before building the list and NOT while building the list,
            MaterialLibraryCache can be assumed to having been prepared if materials
            are active. Default behaviour is to prepare build lists for the
            meshobjects. }
         procedure PrepareBuildList(var mrci : TRenderContextInfo); dynamic;

      public
         { Public Declarations }
         constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;
         procedure Assign(Source: TPersistent); override;
         procedure Notification(AComponent: TComponent; Operation: TOperation); override;

         function AxisAlignedDimensionsUnscaled : TVector;override;

         procedure BuildList(var rci : TRenderContextInfo); override;
			procedure DoRender(var rci : TRenderContextInfo;
                            renderSelf, renderChildren : Boolean); override;
         procedure StructureChanged; override;
         {: Notifies that geometry data changed, but no re-preparation is needed.<p>
            Using this method will usually be faster, but may result in incorrect
            rendering, reduced performance and/or invalid bounding box data
            (ie. invalid collision detection). Use with caution. } 
         procedure StructureChangedNoPrepare;

         {: BEWARE! Utterly inefficient implementation! }
         function RayCastIntersect(const rayStart, rayVector : TVector;
                                   intersectPoint : PVector = nil;
                                   intersectNormal : PVector = nil) : Boolean; override;
         function GenerateSilhouette(const silhouetteParameters : TGLSilhouetteParameters) : TGLSilhouette; override;
         procedure BuildSilhouetteConnectivityData;

         property MeshObjects : TMeshObjectList read FMeshObjects;
         property Skeleton : TSkeleton read FSkeleton;

         {: Computes the extents of the mesh.<p> }
         procedure GetExtents(var min, max : TAffineVector);
         {: Computes the barycenter of the mesh.<p> }
         function GetBarycenter : TAffineVector;

         {: Loads a vector file.<p>
            A vector files (for instance a ".3DS") stores the definition of
            a mesh as well as materials property.<p>
            Loading a file replaces the current one (if any). }
         procedure LoadFromFile(const filename : String); dynamic;
         {: Loads a vector file from a stream.<p>
            See LoadFromFile.<br>
            The filename attribute is required to identify the type data you're
            streaming (3DS, OBJ, etc.) }
         procedure LoadFromStream(const filename : String; aStream : TStream); dynamic;
         {: Saves to a vector file.<p>
            Note that only some of the vector files formats can be written to
            by GLScene. }
         procedure SaveToFile(const fileName : String); dynamic;
         {: Saves to a vector file in a stream.<p>
            Note that only some of the vector files formats can be written to
            by GLScene. }
         procedure SaveToStream(const fileName : String; aStream : TStream); dynamic;

         {: Loads additionnal data from a file.<p>
            Additionnal data could be more animation frames or morph target.<br>
            The VectorFile importer must be able to handle addition of data
            flawlessly. }
         procedure AddDataFromFile(const filename : String); dynamic;
         {: Loads additionnal data from stream.<p>
            See AddDataFromFile. }
         procedure AddDataFromStream(const filename : String; aStream : TStream); dynamic;

         {: Determines if a mesh should be centered and how.<p>
            AutoCentering is performed <b>only</b> after loading a mesh, it has
            no effect on already loaded mesh data or when adding from a file/stream.<br>
            If you want to alter mesh data, use direct manipulation methods
            (on the TMeshObjects). }
         property AutoCentering : TMeshAutoCenterings read FAutoCentering write FAutoCentering default [];

         {: Material library where mesh materials will be stored/retrieved.<p>
            If this property is not defined or if UseMeshMaterials is false,
            only the FreeForm's material will be used (and the mesh's materials
            will be ignored. }
         property MaterialLibrary : TGLMaterialLibrary read FMaterialLibrary write SetMaterialLibrary;
         {: Defines wether materials declared in the vector file mesh are used.<p>
            You must also define the MaterialLibrary property. }
         property UseMeshMaterials : Boolean read FUseMeshMaterials write SetUseMeshMaterials default True;
         {: Lighmap library where lightmaps will be stored/retrieved.<p>
            If this property is not defined, lightmaps won't be used.
            Lightmaps currently *always* use the second texture unit (unit 1),
            and may interfere with multi-texture materials. }
         property LightmapLibrary : TGLMaterialLibrary read FLightmapLibrary write SetLightmapLibrary;
         {: If True, exceptions about missing textures will be ignored.<p>
            Implementation is up to the file loader class (ie. this property
            may be ignored by some loaders) }
         property IgnoreMissingTextures : Boolean read FIgnoreMissingTextures write FIgnoreMissingTextures default False;

         {: Normals orientation for owned mesh.<p> }
         property NormalsOrientation : TMeshNormalsOrientation read FNormalsOrientation write SetNormalsOrientation default mnoDefault;

         {: Request rendering of skeleton bones over the mesh. }
         property OverlaySkeleton : Boolean read FOverlaySkeleton write SetOverlaySkeleton default False;
   end;

   // TGLFreeForm
   //
   {: Container objects for a vector file mesh.<p>
      FreeForms allows loading and rendering vector files (like 3DStudio
      ".3DS" file) in GLScene. Meshes can be loaded with the LoadFromFile
      method.<p>
      A FreeForm may contain more than one mesh, but they will all be handled
      as a single object in a scene. }
   TGLFreeForm = class (TGLBaseMesh)
      private
         { Private Declarations }
         FOctree : TOctree;

      protected
         { Protected Declarations }
         function GetOctree : TOctree;

      public
         { Public Declarations }
         constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;

         function OctreeRayCastIntersect(const rayStart, rayVector : TVector;
                                         intersectPoint : PVector = nil;
                                         intersectNormal : PVector = nil) : Boolean;
         function OctreeSphereSweepIntersect(const rayStart, rayVector : TVector;
                                        const velocity, radius: Single;
                                        intersectPoint : PVector = nil;
                                        intersectNormal : PVector = nil) : Boolean;
         function OctreeTriangleIntersect(const v1, v2, v3: TAffineVector): boolean;
         function OctreeAABBIntersect(const AABB: TAABB; objMatrix,invObjMatrix: TMatrix; triangles:TAffineVectorList=nil): boolean;
//         TODO:  function OctreeSphereIntersect         

         {: Octree support *experimental*.<p>
            Use only if you understand what you're doing! }
         property Octree : TOctree read GetOctree;
         procedure BuildOctree;

      published
         { Published Declarations }
         property AutoCentering;
         property MaterialLibrary;
         property LightmapLibrary;
         property UseMeshMaterials;
         property NormalsOrientation;
   end;

   // TGLActorOption
   //
   {: Miscellanious actor options.<p>
      <ul>
      <li>aoSkeletonNormalizeNormals : if set the normals of a skeleton-animated
          mesh will be normalized, this is not required if no normals-based texture
          coordinates generation occurs, and thus may be unset to improve performance.
      </ul> }
   TGLActorOption = (aoSkeletonNormalizeNormals);
   TGLActorOptions = set of TGLActorOption;

const
   cDefaultGLActorOptions = [aoSkeletonNormalizeNormals];

type

   TGLActor = class;

   // TActorAnimationReference
   //
   TActorAnimationReference = (aarMorph, aarSkeleton, aarNone);

	// TActorAnimation
	//
   {: An actor animation sequence.<p>
      An animation sequence is a named set of contiguous frames that can be used
      for animating an actor. The referred frames can be either morph or skeletal
      frames (choose which via the Reference property).<p>
      An animation can be directly "played" by the actor by selecting it with
      SwitchAnimation, and can also be "blended" via a TGLAnimationControler. }
	TActorAnimation = class (TCollectionItem)
	   private
	      { Private Declarations }
         FName : String;
         FStartFrame : Integer;
         FEndFrame : Integer;
         FReference : TActorAnimationReference;

	   protected
	      { Protected Declarations }
         function GetDisplayName : String; override;
         function FrameCount : Integer;
         procedure SetStartFrame(const val : Integer);
         procedure SetEndFrame(const val : Integer);
         procedure SetReference(val : TActorAnimationReference);
         procedure SetAsString(const val : String);
         function GetAsString : String;

      public
	      { Public Declarations }
	      constructor Create(Collection : TCollection); override;
	      destructor Destroy; override;
	      procedure Assign(Source: TPersistent); override;

         property AsString : String read GetAsString write SetAsString;

         function OwnerActor : TGLActor;
         
         {: Linearly removes the translation component between skeletal frames.<p>
            This function will compute the translation of the first bone (index 0)
            and linearly subtract this translation in all frames between startFrame
            and endFrame. Its purpose is essentially to remove the 'slide' that
            exists in some animation formats (f.i. SMD). }
         procedure MakeSkeletalTranslationStatic;
         {: Removes the absolute rotation component of the skeletal frames.<p>
            Some formats will store frames with absolute rotation information,
            if this correct if the animation is the "main" animation.<br>
            This function removes that absolute information, making the animation
            frames suitable for blending purposes. }
         procedure MakeSkeletalRotationDelta;

	   published
	      { Published Declarations }
         property Name : String read FName write FName;
         {: Index of the initial frame of the animation. }
         property StartFrame : Integer read FStartFrame write SetStartFrame;
         {: Index of the final frame of the animation. }
         property EndFrame : Integer read FEndFrame write SetEndFrame;
         {: Indicates if this is a skeletal or a morph-based animation. }
         property Reference : TActorAnimationReference read FReference write SetReference default aarMorph;
	end;

   TActorAnimationName = String;

	// TActorAnimations
	//
   {: Collection of actor animations sequences. }
	TActorAnimations = class (TCollection)
	   private
	      { Private Declarations }
	      owner : TGLActor;

	   protected
	      { Protected Declarations }
	      function GetOwner: TPersistent; override;
         procedure SetItems(index : Integer; const val : TActorAnimation);
	      function GetItems(index : Integer) : TActorAnimation;

      public
	      { Public Declarations }
	      constructor Create(AOwner : TGLActor);
         function Add: TActorAnimation;
	      function FindItemID(ID: Integer): TActorAnimation;
	      function FindName(const aName : String) : TActorAnimation;
         function FindFrame(aFrame : Integer; aReference : TActorAnimationReference) : TActorAnimation;

	      procedure SetToStrings(aStrings : TStrings);
         procedure SaveToStream(aStream : TStream);
         procedure LoadFromStream(aStream : TStream);
         procedure SaveToFile(const fileName : String);
         procedure LoadFromFile(const fileName : String);

	      property Items[index : Integer] : TActorAnimation read GetItems write SetItems; default;
   end;

	// TGLAnimationControler
	//
   {: Controls the blending of an additionnal skeletal animation into an actor.<p>
      The animation controler allows animating an actor with several animations
      at a time, for instance, you could use a "run" animation as base animation
      (in TGLActor), blend an animation that makes the arms move differently
      depending on what the actor is carrying, along with an animation that will
      make the head turn toward a target. }
   TGLAnimationControler = class (TComponent)
	   private
	      { Private Declarations }
         FActor : TGLActor;
         FAnimationName : TActorAnimationName;
         FRatio : Single;

	   protected
	      { Protected Declarations }
         procedure Notification(AComponent: TComponent; Operation: TOperation); override;
         procedure DoChange;
         procedure SetActor(const val : TGLActor);
         procedure SetAnimationName(const val : TActorAnimationName);
         procedure SetRatio(const val : Single);

         function Apply(var lerpInfo : TBlendedLerpInfo) : Boolean;

	   public
	      { Public Declarations }
	      constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;

      published
         { Published Declarations }
         property Actor : TGLActor read FActor write SetActor;
         property AnimationName : String read FAnimationName write SetAnimationName;
         property Ratio : Single read FRatio write SetRatio;
	end;

   // TActorFrameInterpolation
   //
   {: Actor frame-interpolation mode.<p>
      - afpNone : no interpolation, display CurrentFrame only<br>
      - afpLinear : perform linear interpolation between current and next frame }
   TActorFrameInterpolation = (afpNone, afpLinear);

   // TActorActionMode
   //
   {: Defines how an actor plays between its StartFrame and EndFrame.<p>
      <ul>
      <li>aamNone : no animation is performed
      <li>aamPlayOnce : play from current frame to EndFrame, once end frame has
         been reached, switches to aamNone
      <li>aamLoop : play from current frame to EndFrame, once end frame has
         been reached, sets CurrentFrame to StartFrame
      <li>aamBounceForward : play from current frame to EndFrame, once end frame
         has been reached, switches to aamBounceBackward
      <li>aamBounceBackward : play from current frame to StartFrame, once start
         frame has been reached, switches to aamBounceForward
      </ul> }
   TActorAnimationMode = (aamNone, aamPlayOnce, aamLoop, aamBounceForward,
                          aamBounceBackward);

   // TGLActor
   //
   {: Mesh class specialized in animated meshes.<p>
      The TGLActor provides a quick interface to animated meshes based on morph
      or skeleton frames, it is capable of performing frame interpolation and
      animation blending (via TGLAnimationControler components). }
   TGLActor = class (TGLBaseMesh)
      private
         { Private Declarations }
         FStartFrame, FEndFrame : Integer;
         FReference : TActorAnimationReference;
         FCurrentFrame : Integer;
         FCurrentFrameDelta : Single;
         FFrameInterpolation : TActorFrameInterpolation;
         FInterval : Integer;
         FAnimationMode : TActorAnimationMode;
         FOnFrameChanged : TNotifyEvent;
         FOnEndFrameReached, FOnStartFrameReached : TNotifyEvent;
         FAnimations : TActorAnimations;
         FTargetSmoothAnimation : TActorAnimation;
         FControlers : TList;
         FOptions : TGLActorOptions;

      protected
         { Protected Declarations }
         procedure SetCurrentFrame(val : Integer);
         procedure SetStartFrame(val : Integer);
         procedure SetEndFrame(val : Integer);
         procedure SetReference(val : TActorAnimationReference);
         procedure SetAnimations(const val : TActorAnimations);
         function  StoreAnimations : Boolean;
         procedure SetOptions(const val : TGLActorOptions);

         procedure PrepareMesh; override;
         procedure PrepareBuildList(var mrci : TRenderContextInfo); override;

         procedure RegisterControler(aControler : TGLAnimationControler);
         procedure UnRegisterControler(aControler : TGLAnimationControler);

      public
         { Public Declarations }
         constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;
         procedure Assign(Source: TPersistent); override;

         procedure BuildList(var rci : TRenderContextInfo); override;

			procedure DoProgress(const progressTime : TProgressTimes); override;

         procedure LoadFromStream(const filename : String; aStream : TStream); override;

	      procedure SwitchToAnimation(anAnimation : TActorAnimation; smooth : Boolean = False); overload;
	      procedure SwitchToAnimation(const animationName : String; smooth : Boolean = False); overload;
	      procedure SwitchToAnimation(animationIndex : Integer; smooth : Boolean = False); overload;
         function CurrentAnimation : String;

         {: Synchronize self animation with an other actor.<p>
            Copies Start/Current/End Frame values, CurrentFrameDelta,
            AnimationMode and FrameInterpolation. }
         procedure Synchronize(referenceActor : TGLActor);

         function  NextFrameIndex : Integer;

         procedure NextFrame(nbSteps : Integer = 1);
         procedure PrevFrame(nbSteps : Integer = 1);

         function FrameCount : Integer;

      published
         { Published Declarations }
         property StartFrame : Integer read FStartFrame write SetStartFrame default 0;
         property EndFrame : Integer read FEndFrame write SetEndFrame default 0;

         {: Reference Frame Animation mode.<p>
            Allows specifying if the model is primarily morph or skeleton based. }
         property Reference : TActorAnimationReference read FReference write FReference default aarMorph;

         {: Current animation frame. }
         property CurrentFrame : Integer read FCurrentFrame write SetCurrentFrame default 0;
         {: Value in the [0; 1] range expressing the delta to the next frame.<p> }
         property CurrentFrameDelta : Single read FCurrentFrameDelta write FCurrentFrameDelta;
         {: Frame interpolation mode (afpNone/afpLinear). }
         property FrameInterpolation : TActorFrameInterpolation read FFrameInterpolation write FFrameInterpolation default afpLinear;

         {: See TActorAnimationMode.<p> }
         property AnimationMode : TActorAnimationMode read FAnimationMode write FAnimationMode default aamNone;
         {: Interval between frames, in milliseconds. }
         property Interval : Integer read FInterval write FInterval;
         {: Actor and animation miscellanious options. }
         property Options : TGLActorOptions read FOptions write SetOptions default cDefaultGLActorOptions; 

         {: Triggered after each CurrentFrame change. }
         property OnFrameChanged : TNotifyEvent read FOnFrameChanged write FOnFrameChanged;
         {: Triggered after EndFrame has been reached by progression or "nextframe" }
         property OnEndFrameReached : TNotifyEvent read FOnEndFrameReached write FOnEndFrameReached;
         {: Triggered after StartFrame has been reached by progression or "nextframe" }
         property OnStartFrameReached : TNotifyEvent read FOnStartFrameReached write FOnStartFrameReached;

         {: Collection of animations sequences. }
         property Animations : TActorAnimations read FAnimations write SetAnimations stored StoreAnimations;

         property AutoCentering;
         property MaterialLibrary;
         property LightmapLibrary;
         property UseMeshMaterials;
         property NormalsOrientation;
         property OverlaySkeleton;
   end;

   // TVectorFileFormat
   //
   PVectorFileFormat = ^TVectorFileFormat;
   TVectorFileFormat = record
      VectorFileClass : TVectorFileClass;
      Extension       : String;
      Description     : String;
      DescResID       : Integer;
   end;

   // TVectorFileFormatsList
   //
   {: Stores registered vector file formats. }
   TVectorFileFormatsList = class(TList)
      public
         { Public Declarations }
         destructor Destroy; override;

         procedure Add(const Ext, Desc: String; DescID: Integer; AClass: TVectorFileClass);
         function FindExt(ext : string) : TVectorFileClass;
         function FindFromFileName(const fileName : String) : TVectorFileClass;
         procedure Remove(AClass: TVectorFileClass);
         procedure BuildFilterStrings(vectorFileClass : TVectorFileClass;
                                      var descriptions, filters : String;
                                      formatsThatCanBeOpened : Boolean = True;
                                      formatsThatCanBeSaved : Boolean = False);
         function FindExtByIndex(index : Integer;
                                 formatsThatCanBeOpened : Boolean = True;
                                 formatsThatCanBeSaved : Boolean = False) : String;
   end;

   EInvalidVectorFile = class(Exception);

//: Read access to the list of registered vector file formats
function GetVectorFileFormats : TVectorFileFormatsList;
//: A file extension filter suitable for dialog's 'Filter' property
function VectorFileFormatsFilter : String;
//: A file extension filter suitable for a savedialog's 'Filter' property
function VectorFileFormatsSaveFilter : String;
{: Returns an extension by its index in the vector files dialogs filter.<p>
   Use VectorFileFormatsFilter to obtain the filter. }
function VectorFileFormatExtensionByIndex(index : Integer) : String;

procedure RegisterVectorFileFormat(const aExtension, aDescription: String;
                                   aClass : TVectorFileClass);
procedure UnregisterVectorFileClass(aClass : TVectorFileClass);


var
   vGLVectorFileObjectsAllocateMaterials : boolean = True; // Mrqzzz : Flag to avoid loading materials (useful for IDE Extentions or scene editors)


// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

uses GLStrings, consts, XOpenGL, GLCrossPlatform, MeshUtils, 
  GLBaseMeshSilhouette;

var
   vVectorFileFormats : TVectorFileFormatsList;
   vNextRenderGroupID : Integer = 1;

const
   cAAFHeader = 'AAF';

// GetVectorFileFormats
//
function GetVectorFileFormats: TVectorFileFormatsList;
begin
   if not Assigned(vVectorFileFormats)then
      vVectorFileFormats:=TVectorFileFormatsList.Create;
   Result:=vVectorFileFormats;
end;

// VectorFileFormatsFilter
//
function VectorFileFormatsFilter : String;
var
   f : String;
begin
   GetVectorFileFormats.BuildFilterStrings(TVectorFile, Result, f);
end;

// VectorFileFormatsSaveFilter
//
function VectorFileFormatsSaveFilter : String;
var
   f : String;
begin
   GetVectorFileFormats.BuildFilterStrings(TVectorFile, Result, f, False, True);
end;

// RegisterVectorFileFormat
//
procedure RegisterVectorFileFormat(const AExtension, ADescription: String; AClass: TVectorFileClass);
begin
   RegisterClass(AClass);
	GetVectorFileFormats.Add(AExtension, ADescription, 0, AClass);
end;

// UnregisterVectorFileClass
//
procedure UnregisterVectorFileClass(AClass: TVectorFileClass);
begin
	if Assigned(vVectorFileFormats) then
		vVectorFileFormats.Remove(AClass);
end;

// VectorFileFormatExtensionByIndex
//
function VectorFileFormatExtensionByIndex(index : Integer) : String;
begin
   Result:=GetVectorFileFormats.FindExtByIndex(index);
end;

//----------------- vector format support --------------------------------------

destructor TVectorFileFormatsList.Destroy;

var I: Integer;

begin
  for I:=0 to Count - 1 do Dispose(PVectorFileFormat(Items[I]));
  inherited Destroy;
end;

//------------------------------------------------------------------------------

procedure TVectorFileFormatsList.Add(const Ext, Desc: String; DescID: Integer;
                                     AClass: TVectorFileClass);

var NewRec: PVectorFileFormat;

begin
  New(NewRec);
  with NewRec^ do
  begin
    Extension:=AnsiLowerCase(Ext);
    VectorFileClass:=AClass;
    Description:=Desc;
    DescResID:=DescID;
  end;
  inherited Add(NewRec);
end;

// FindExt
//
function TVectorFileFormatsList.FindExt(ext : String) : TVectorFileClass;
var
   i : Integer;
begin
   ext:=AnsiLowerCase(ext);
   for i:=Count-1 downto 0 do
      with PVectorFileFormat(Items[I])^ do
         if Extension=ext then begin
            Result:=VectorFileClass;
            Exit;
         end;
  Result:=nil;
end;

// FindFromFileName
//
function TVectorFileFormatsList.FindFromFileName(const fileName : String) : TVectorFileClass;
var
   ext : String;
begin
   ext:=ExtractFileExt(Filename);
   System.Delete(ext, 1, 1);
   Result:=FindExt(ext);
   if not Assigned(Result) then
      raise EInvalidVectorFile.CreateFmt(glsUnknownExtension,
                                         [ext, 'GLFile'+UpperCase(ext)]);
end;

//------------------------------------------------------------------------------

procedure TVectorFileFormatsList.Remove(AClass: TVectorFileClass);

var I : Integer;
    P : PVectorFileFormat;

begin
  for I:=Count-1 downto 0 do
  begin
    P:=PVectorFileFormat(Items[I]);
    if P^.VectorFileClass.InheritsFrom(AClass) then
    begin
      Dispose(P);
      Delete(I);
    end;
  end;
end;

// BuildFilterStrings
//
procedure TVectorFileFormatsList.BuildFilterStrings(
                                       vectorFileClass : TVectorFileClass;
                                       var descriptions, filters : String;
                                       formatsThatCanBeOpened : Boolean = True;
                                       formatsThatCanBeSaved : Boolean = False);
var
   k, i : Integer;
   p : PVectorFileFormat;
begin
   descriptions:='';
   filters:='';
   k:=0;
   for i:=0 to Count-1 do begin
      p:=PVectorFileFormat(Items[i]);
      if     p.VectorFileClass.InheritsFrom(vectorFileClass) and (p.Extension<>'')
         and (   (formatsThatCanBeOpened and (dfcRead in p.VectorFileClass.Capabilities))
              or (formatsThatCanBeSaved and (dfcWrite in p.VectorFileClass.Capabilities))) then begin
         with p^ do begin
            if k<>0 then begin
               descriptions:=descriptions+'|';
               filters:=filters+';';
            end;
            if (Description='') and (DescResID<>0) then
               Description:=LoadStr(DescResID);
            FmtStr(descriptions, '%s%s (*.%s)|*.%2:s',
                   [descriptions, Description, Extension]);
            FmtStr(filters, '%s*.%s', [filters, Extension]);
            Inc(k);
         end;
      end;
   end;
   if (k>1) and (not formatsThatCanBeSaved) then
      FmtStr(descriptions, '%s (%s)|%1:s|%s',
             [sAllFilter, filters, descriptions]);
end;

// FindExtByIndex
//
function TVectorFileFormatsList.FindExtByIndex(index : Integer;
                                       formatsThatCanBeOpened : Boolean = True;
                                       formatsThatCanBeSaved : Boolean = False) : String;
var
   i : Integer;
   p : PVectorFileFormat;
begin
   Result:='';
   if index>0 then begin
      for i:=0 to Count-1 do begin
         p:=PVectorFileFormat(Items[i]);
         if    (formatsThatCanBeOpened and (dfcRead in p.VectorFileClass.Capabilities))
            or (formatsThatCanBeSaved and (dfcWrite in p.VectorFileClass.Capabilities)) then begin
            if index=1 then begin
               Result:=p.Extension;
               Break;
            end else Dec(index);
         end;
      end;
   end;
end;

// ------------------
// ------------------ TBaseMeshObject ------------------
// ------------------

// Create
//
constructor TBaseMeshObject.Create;
begin
   FVertices:=TAffineVectorList.Create;
   FNormals:=TAffineVectorList.Create;
   FVisible:=True;
   inherited Create;
end;

// Destroy
//
destructor TBaseMeshObject.Destroy;
begin
   FNormals.Free;
   FVertices.Free;
   inherited;
end;

// WriteToFiler
//
procedure TBaseMeshObject.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(1);  // Archive Version 1, added FVisible
      WriteString(FName);
      FVertices.WriteToFiler(writer);
      FNormals.WriteToFiler(writer);
      WriteBoolean(FVisible);
   end;
end;

// ReadFromFiler
//
procedure TBaseMeshObject.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion in [0..1] then with reader do begin
      FName:=ReadString;
      FVertices.ReadFromFiler(reader);
      FNormals.ReadFromFiler(reader);
      if archiveVersion>=1 then
         FVisible:=ReadBoolean
      else FVisible:=True;
   end else RaiseFilerException(archiveVersion);
end;

// Clear
//
procedure TBaseMeshObject.Clear;
begin
   FNormals.Clear;
   FVertices.Clear;
end;

// ContributeToBarycenter
//
procedure TBaseMeshObject.ContributeToBarycenter(var currentSum : TAffineVector;
                                                 var nb : Integer);
begin
   AddVector(currentSum, FVertices.Sum);
   nb:=nb+FVertices.Count;
end;

// Translate
//
procedure TBaseMeshObject.Translate(const delta : TAffineVector);
begin
   FVertices.Translate(delta);
end;

// BuildNormals
//
procedure TBaseMeshObject.BuildNormals(vertexIndices : TIntegerList; mode : TMeshObjectMode;
                                       normalIndices : TIntegerList = nil);
var
   i, base : Integer;
   n : TAffineVector;
   newNormals : TList;

   procedure TranslateNewNormal(vertexIndex : Integer; const delta : TAffineVector);
   var
      pv : PAffineVector;
   begin
      pv:=PAffineVector(newNormals[vertexIndex]);
      if not Assigned(pv) then begin
         Normals.Add(NullVector);
         pv:=@Normals.List[Normals.Count-1];
         newNormals[vertexIndex]:=pv;
      end;
      AddVector(pv^, delta);
   end;

begin
   if not Assigned(normalIndices) then begin
      // build bijection
      Normals.Clear;
      Normals.Count:=Vertices.Count;
      case mode of
         momTriangles : begin
            i:=0; while i<=vertexIndices.Count-3 do with Normals do begin
               with Vertices do begin
                  CalcPlaneNormal(Items[vertexIndices[i+0]], Items[vertexIndices[i+1]],
                                  Items[vertexIndices[i+2]], n);
               end;
               with Normals do begin
                  TranslateItem(vertexIndices[i+0], n);
                  TranslateItem(vertexIndices[i+1], n);
                  TranslateItem(vertexIndices[i+2], n);
               end;
               Inc(i, 3);
            end;
         end;
         momTriangleStrip : begin
            i:=0; while i<=vertexIndices.Count-3 do with Normals do begin
               with Vertices do begin
                  if (i and 1)=0 then
                     CalcPlaneNormal(Items[vertexIndices[i+0]], Items[vertexIndices[i+1]],
                                     Items[vertexIndices[i+2]], n)
                  else CalcPlaneNormal(Items[vertexIndices[i+0]], Items[vertexIndices[i+2]],
                                       Items[vertexIndices[i+1]], n);
               end;
               with Normals do begin
                  TranslateItem(vertexIndices[i+0], n);
                  TranslateItem(vertexIndices[i+1], n);
                  TranslateItem(vertexIndices[i+2], n);
               end;
               Inc(i, 1);
            end;
         end;
      else
         Assert(False);
      end;
      Normals.Normalize;
   end else begin
      // add new normals
      base:=Normals.Count;
      newNormals:=TList.Create;
      newNormals.Count:=Vertices.Count;
      case mode of
         momTriangles : begin
            i:=0; while i<=vertexIndices.Count-3 do begin
               with Vertices do begin
                  CalcPlaneNormal(Items[vertexIndices[i+0]], Items[vertexIndices[i+1]],
                                  Items[vertexIndices[i+2]], n);
               end;
               with Normals do begin
                  TranslateNewNormal(vertexIndices[i+0], n);
                  TranslateNewNormal(vertexIndices[i+1], n);
                  TranslateNewNormal(vertexIndices[i+2], n);
               end;
               Inc(i, 3);
            end;
         end;
         momTriangleStrip : begin
            i:=0; while i<=vertexIndices.Count-3 do begin
               with Vertices do begin
                  if (i and 1)=0 then
                     CalcPlaneNormal(Items[vertexIndices[i+0]], Items[vertexIndices[i+1]],
                                     Items[vertexIndices[i+2]], n)
                  else CalcPlaneNormal(Items[vertexIndices[i+0]], Items[vertexIndices[i+2]],
                                       Items[vertexIndices[i+1]], n);
               end;
               with Normals do begin
                  TranslateNewNormal(vertexIndices[i+0], n);
                  TranslateNewNormal(vertexIndices[i+1], n);
                  TranslateNewNormal(vertexIndices[i+2], n);
               end;
               Inc(i, 1);
            end;
         end;
      else
         Assert(False);
      end;
      for i:=base to Normals.Count-1 do
         NormalizeVector(Normals.List[i]);
      newNormals.Free;
   end;
end;

// ExtractTriangles
//
function TBaseMeshObject.ExtractTriangles(texCoords : TAffineVectorList = nil;
                                          normals : TAffineVectorList = nil) : TAffineVectorList;
begin
   Result:=TAffineVectorList.Create;
   if (Vertices.Count mod 3)=0 then begin
      Result.Assign(Vertices);
      if Assigned(normals) then
         normals.Assign(Self.Normals);
   end;
end;

// SetVertices
//
procedure TBaseMeshObject.SetVertices(const val : TAffineVectorList);
begin
   FVertices.Assign(val);
end;

// SetNormals
//
procedure TBaseMeshObject.SetNormals(const val : TAffineVectorList);
begin
   FNormals.Assign(val);
end;

// ------------------
// ------------------ TSkeletonFrame ------------------
// ------------------

// CreateOwned
//
constructor TSkeletonFrame.CreateOwned(aOwner : TSkeletonFrameList);
begin
   FOwner:=aOwner;
   aOwner.Add(Self);
   Create;
end;

// Create
//
constructor TSkeletonFrame.Create;
begin
	inherited Create;
   FPosition:=TAffineVectorList.Create;
   FRotation:=TAffineVectorList.Create;
   FQuaternion:=TQuaternionList.Create;
   FTransformMode:=sftRotation;
end;

// Destroy
//
destructor TSkeletonFrame.Destroy;
begin
   FlushLocalMatrixList;
   FRotation.Free;
   FPosition.Free;
   FQuaternion.Free;
	inherited Destroy;
end;

// WriteToFiler
//
procedure TSkeletonFrame.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(1); // Archive Version 1
      WriteString(FName);
      FPosition.WriteToFiler(writer);
      FRotation.WriteToFiler(writer);
      FQuaternion.WriteToFiler(writer);
      WriteInteger(Integer(FTransformMode));
   end;
end;

// ReadFromFiler
//
procedure TSkeletonFrame.ReadFromFiler(reader : TVirtualReader);
var
	archiveVersion : integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
	if (archiveVersion=0) or (archiveVersion=1) then with reader do begin
      FName:=ReadString;
      FPosition.ReadFromFiler(reader);
      FRotation.ReadFromFiler(reader);
      if (archiveVersion=1) then begin
        FQuaternion.ReadFromFiler(reader);
        FTransformMode:=TSkeletonFrameTransform(ReadInteger);
      end;
	end else RaiseFilerException(archiveVersion);
   FlushLocalMatrixList;
end;

// SetPosition
//
procedure TSkeletonFrame.SetPosition(const val : TAffineVectorList);
begin
   FPosition.Assign(val);
end;

// SetRotation
//
procedure TSkeletonFrame.SetRotation(const val : TAffineVectorList);
begin
   FRotation.Assign(val);
end;

// SetQuaternion
//
procedure TSkeletonFrame.SetQuaternion(const val : TQuaternionList);
begin
   FQuaternion.Assign(val);
end;

// LocalMatrixList
//
function TSkeletonFrame.LocalMatrixList : PMatrixArray;
var
   i : Integer;
   s, c : Single;
   mat, rmat : TMatrix;
   quat : TQuaternion;
begin
   if not Assigned(FLocalMatrixList) then begin
      case FTransformMode of
         sftRotation : begin
            FLocalMatrixList:=AllocMem(SizeOf(TMatrix)*Rotation.Count);
            for i:=0 to Rotation.Count-1 do begin
               mat:=IdentityHmgMatrix;
               SinCos(Rotation[i][0], s, c);
               rmat:=CreateRotationMatrixX(s, c);
               mat:=MatrixMultiply(mat, rmat);
               SinCos(Rotation[i][1], s, c);
               rmat:=CreateRotationMatrixY(s, c);
               mat:=MatrixMultiply(mat, rmat);
               SinCos(Rotation[i][2], s, c);
               rmat:=CreateRotationMatrixZ(s, c);
               mat:=MatrixMultiply(mat, rmat);
               mat[3][0]:=Position[i][0];
               mat[3][1]:=Position[i][1];
               mat[3][2]:=Position[i][2];
               FLocalMatrixList[i]:=mat;
            end;
         end;
         sftQuaternion : begin
            FLocalMatrixList:=AllocMem(SizeOf(TMatrix)*Quaternion.Count);
            for i:=0 to Quaternion.Count-1 do begin
               quat:=Quaternion[i];
               mat:=QuaternionToMatrix(quat);
               mat[3][0]:=Position[i][0];
               mat[3][1]:=Position[i][1];
               mat[3][2]:=Position[i][2];
               mat[3][3]:=1;
               FLocalMatrixList[i]:=mat;
            end;
         end;
      end;
   end;
   Result:=FLocalMatrixList;
end;

// FlushLocalMatrixList
//
procedure TSkeletonFrame.FlushLocalMatrixList;
begin
   if Assigned(FLocalMatrixList) then begin
      FreeMem(FLocalMatrixList);
      FLocalMatrixList:=nil;
   end;
end;

// ConvertQuaternionsToRotations
//
procedure TSkeletonFrame.ConvertQuaternionsToRotations(KeepQuaternions : Boolean = True);
var
  i : integer;
  t : TTransformations;
  m : TMatrix;
begin
  Rotation.Clear;
  for i:=0 to Quaternion.Count-1 do begin
    m:=QuaternionToMatrix(Quaternion[i]);
    if MatrixDecompose(m,t) then
      Rotation.Add(t[ttRotateX],t[ttRotateY],t[ttRotateZ])
    else
      Rotation.Add(NullVector);
  end;
  if not KeepQuaternions then
    Quaternion.Clear;
end;

// ConvertRotationsToQuaternions
//
procedure TSkeletonFrame.ConvertRotationsToQuaternions(KeepRotations : Boolean = True);
var
  i : integer;
  mat,rmat : TMatrix;
  s,c : Single;
begin
  Quaternion.Clear;
  for i:= 0 to Rotation.Count-1 do begin
    mat:=IdentityHmgMatrix;
    SinCos(Rotation[i][0], s, c);
    rmat:=CreateRotationMatrixX(s, c);
    mat:=MatrixMultiply(mat, rmat);
    SinCos(Rotation[i][1], s, c);
    rmat:=CreateRotationMatrixY(s, c);
    mat:=MatrixMultiply(mat, rmat);
    SinCos(Rotation[i][2], s, c);
    rmat:=CreateRotationMatrixZ(s, c);
    mat:=MatrixMultiply(mat, rmat);
    Quaternion.Add(QuaternionFromMatrix(mat));
  end;
  if not KeepRotations then
    Rotation.Clear;
end;

// ------------------
// ------------------ TSkeletonFrameList ------------------
// ------------------

// CreateOwned
//
constructor TSkeletonFrameList.CreateOwned(AOwner : TPersistent);
begin
   FOwner:=AOwner;
   Create;
end;

// Destroy
//
destructor TSkeletonFrameList.Destroy;
begin
   Clear;
   inherited;
end;

// ReadFromFiler
//
procedure TSkeletonFrameList.ReadFromFiler(reader : TVirtualReader);
var
   i : Integer;
begin
   inherited;
   for i:=0 to Count-1 do Items[i].FOwner:=Self;
end;

// Clear
//
procedure TSkeletonFrameList.Clear;
var
   i : Integer;
begin
   for i:=0 to Count-1 do with Items[i] do begin
      FOwner:=nil;
      Free;
   end;
   inherited;
end;

// GetSkeletonFrame
//
function TSkeletonFrameList.GetSkeletonFrame(Index: Integer): TSkeletonFrame;
begin
   Result:=TSkeletonFrame(List^[Index]);
end;

// ConvertQuaternionsToRotations
//
procedure TSkeletonFrameList.ConvertQuaternionsToRotations(KeepQuaternions : Boolean = True);
var
  i : integer;
begin
  for i:=0 to Count-1 do
    Items[i].ConvertQuaternionsToRotations(KeepQuaternions);
end;

// ConvertRotationsToQuaternions
//
procedure TSkeletonFrameList.ConvertRotationsToQuaternions(KeepRotations : Boolean = True);
var
  i : integer;
begin
  for i:=0 to Count-1 do
    Items[i].ConvertRotationsToQuaternions(KeepRotations);
end;

// ------------------
// ------------------ TSkeletonBoneList ------------------
// ------------------

// CreateOwned
//
constructor TSkeletonBoneList.CreateOwned(aOwner : TSkeleton);
begin
   FSkeleton:=aOwner;
	Create;
end;

// Create
//
constructor TSkeletonBoneList.Create;
begin
	inherited;
end;

// Destroy
//
destructor TSkeletonBoneList.Destroy;
begin
	inherited;
end;

// WriteToFiler
//
procedure TSkeletonBoneList.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0); // Archive Version 0
      // nothing, yet
   end;
end;

// ReadFromFiler
//
procedure TSkeletonBoneList.ReadFromFiler(reader : TVirtualReader);
var
	archiveVersion, i : integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
	if archiveVersion=0 then with reader do begin
      // nothing, yet
	end else RaiseFilerException(archiveVersion);
   for i:=0 to Count-1 do Items[i].FOwner:=Self;
end;

// AfterObjectCreatedByReader
//
procedure TSkeletonBoneList.AfterObjectCreatedByReader(Sender : TObject);
begin
   with (Sender as TSkeletonBone) do begin
      FOwner:=Self;
      FSkeleton:=Self.Skeleton;
   end;
end;

// GetSkeletonBone
//
function TSkeletonBoneList.GetSkeletonBone(Index : Integer) : TSkeletonBone;
begin
   Result:=TSkeletonBone(List^[Index]);
end;

// BoneByID
//
function TSkeletonBoneList.BoneByID(anID : Integer) : TSkeletonBone;
var
   i : Integer;
begin
   Result:=nil;
   for i:=0 to Count-1 do begin
      Result:=Items[i].BoneByID(anID);
      if Assigned(Result) then Break;
   end;
end;

// PrepareGlobalMatrices
//
procedure TSkeletonBoneList.PrepareGlobalMatrices;
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      Items[i].PrepareGlobalMatrices;
end;

// ------------------
// ------------------ TSkeletonRootBoneList ------------------
// ------------------

// Create
//
constructor TSkeletonRootBoneList.Create;
begin
	inherited;
end;

// Destroy
//
destructor TSkeletonRootBoneList.Destroy;
begin
	inherited;
end;

// WriteToFiler
//
procedure TSkeletonRootBoneList.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0); // Archive Version 0
      // nothing, yet
   end;
end;

// ReadFromFiler
//
procedure TSkeletonRootBoneList.ReadFromFiler(reader : TVirtualReader);
var
	archiveVersion, i : integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
	if archiveVersion=0 then with reader do begin
      // nothing, yet
	end else RaiseFilerException(archiveVersion);
   for i:=0 to Count-1 do Items[i].FOwner:=Self;
end;

// BuildList
//
procedure TSkeletonRootBoneList.BuildList(var mrci : TRenderContextInfo);
var
   i : Integer;
begin
   // root node setups and restore OpenGL stuff
   glPushAttrib(GL_ENABLE_BIT);
   glDisable(GL_COLOR_MATERIAL);
   glDisable(GL_LIGHTING);
   glColor3f(1, 1, 1);
   // render root-bones
   for i:=0 to Count-1 do
      Items[i].BuildList(mrci);
   glPopAttrib;
end;

// ------------------
// ------------------ TSkeletonBone ------------------
// ------------------

// CreateOwned
//
constructor TSkeletonBone.CreateOwned(aOwner : TSkeletonBoneList);
begin
   FOwner:=aOwner;
   aOwner.Add(Self);
   FSkeleton:=aOwner.Skeleton;
	Create;
end;

// Create
//
constructor TSkeletonBone.Create;
begin
   FColor:=$FFFFFFFF; // opaque white
	inherited;
end;

// Destroy
//
destructor TSkeletonBone.Destroy;
begin
   if Assigned(Owner) then
      Owner.Remove(Self);
	inherited Destroy;
end;

// WriteToFiler
//
procedure TSkeletonBone.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0); // Archive Version 0
      WriteString(FName);
      WriteInteger(FBoneID);
      WriteInteger(FColor);
   end;
end;

// ReadFromFiler
//
procedure TSkeletonBone.ReadFromFiler(reader : TVirtualReader);
var
	archiveVersion, i : integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
	if archiveVersion=0 then with reader do begin
      FName:=ReadString;
      FBoneID:=ReadInteger;
      FColor:=ReadInteger;
	end else RaiseFilerException(archiveVersion);
   for i:=0 to Count-1 do Items[i].FOwner:=Self;
end;

// BuildList
//
procedure TSkeletonBone.BuildList(var mrci : TRenderContextInfo);

   procedure IssueColor(color : Cardinal);
   begin
      glColor4f(GetRValue(color)/255, GetGValue(color)/255, GetBValue(color)/255,
                ((color shr 24) and 255)/255);
   end;

var
   i : Integer;
begin
   // point for self
   glPointSize(5);
   glBegin(GL_POINTS);
      IssueColor(Color);
      glVertex3fv(@GlobalMatrix[3][0]);
   glEnd;
   glPointSize(1);
   // parent-self bone line
   if Owner is TSkeletonBone then begin
      glBegin(GL_LINES);
         glVertex3fv(@TSkeletonBone(Owner).GlobalMatrix[3][0]);
         glVertex3fv(@GlobalMatrix[3][0]);
      glEnd;
   end;
   // render sub-bones
   for i:=0 to Count-1 do
      Items[i].BuildList(mrci);
end;

// GetSkeletonBone
//
function TSkeletonBone.GetSkeletonBone(Index: Integer): TSkeletonBone;
begin
   Result:=TSkeletonBone(List^[Index]);
end;

// SetColor
//
procedure TSkeletonBone.SetColor(const val : Cardinal);
begin
   FColor:=val;
end;

// BoneByID
//
function TSkeletonBone.BoneByID(anID : Integer) : TSkeletonBone;
begin
   if BoneID=anID then
      Result:=Self
   else Result:=inherited BoneByID(anID);
end;

// Clean
//
procedure TSkeletonBone.Clean;
begin
   BoneID:=0;
   Name:='';
   inherited;
end;

// PrepareGlobalMatrices
//
procedure TSkeletonBone.PrepareGlobalMatrices;
begin
   if Owner is TSkeletonBone then
      FGlobalMatrix:=MatrixMultiply(Skeleton.CurrentFrame.LocalMatrixList[BoneID],
                                    TSkeletonBone(Owner).FGlobalMatrix)
   else FGlobalMatrix:=Skeleton.CurrentFrame.LocalMatrixList[BoneID];
   inherited;
end;

// ------------------
// ------------------ TSkeleton ------------------
// ------------------

// CreateOwned
//
constructor TSkeleton.CreateOwned(AOwner : TGLBaseMesh);
begin
   FOwner:=aOwner;
   Create;
end;

// Create
//
constructor TSkeleton.Create;
begin
	inherited Create;
   FRootBones:=TSkeletonRootBoneList.CreateOwned(Self);
   FFrames:=TSkeletonFrameList.CreateOwned(Self);
end;

// Destroy
//
destructor TSkeleton.Destroy;
begin
   FlushBoneByIDCache;
   FCurrentFrame.Free;
   FFrames.Free;
   FRootBones.Free;
	inherited Destroy;
end;

// WriteToFiler
//
procedure TSkeleton.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0); // Archive Version 0
      FRootBones.WriteToFiler(writer);
      FFrames.WriteToFiler(writer);
   end;
end;

// ReadFromFiler
//
procedure TSkeleton.ReadFromFiler(reader : TVirtualReader);
var
	archiveVersion : integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
	if archiveVersion=0 then with reader do begin
      FRootBones.ReadFromFiler(reader);
      FFrames.ReadFromFiler(reader);
	end else RaiseFilerException(archiveVersion);
end;

// SetRootBones
//
procedure TSkeleton.SetRootBones(const val : TSkeletonRootBoneList);
begin
   FRootBones.Assign(val);
end;

// SetFrames
//
procedure TSkeleton.SetFrames(const val : TSkeletonFrameList);
begin
   FFrames.Assign(val);
end;

// GetCurrentFrame
//
function TSkeleton.GetCurrentFrame : TSkeletonFrame;
begin
   if not Assigned(FCurrentFrame) then
      FCurrentFrame:=TSkeletonFrame(FFrames.Items[0].CreateClone);
   Result:=FCurrentFrame;
end;

// SetCurrentFrame
//
procedure TSkeleton.SetCurrentFrame(val : TSkeletonFrame);
begin
   if Assigned(FCurrentFrame) then
      FCurrentFrame.Free;
   FCurrentFrame:=TSkeletonFrame(val.CreateClone);
end;

// FlushBoneByIDCache
//
procedure TSkeleton.FlushBoneByIDCache;
begin
   FBonesByIDCache.Free;
   FBonesByIDCache:=nil;
end;

// BoneByID
//
function TSkeleton.BoneByID(anID : Integer) : TSkeletonBone;

   procedure CollectBones(bone : TSkeletonBone);
   var
      i : Integer;
   begin
      if bone.BoneID>=FBonesByIDCache.Count then
         FBonesByIDCache.Count:=bone.BoneID+1;
      FBonesByIDCache[bone.BoneID]:=bone;
      for i:=0 to bone.Count-1 do
         CollectBones(bone[i]);
   end;

var
   i : Integer;
begin
   if not Assigned(FBonesByIDCache) then begin
      FBonesByIDCache:=TList.Create;
      for i:=0 to RootBones.Count-1 do
         CollectBones(RootBones[i]);
   end;
   Result:=TSkeletonBone(FBonesByIDCache[anID])
end;

// MorphTo
//
procedure TSkeleton.MorphTo(frameIndex : Integer);
begin
   CurrentFrame:=Frames[frameIndex];
end;

// Lerp
//
procedure TSkeleton.Lerp(frameIndex1, frameIndex2 : Integer; lerpFactor : Single);
begin
   if Assigned(FCurrentFrame) then
      FCurrentFrame.Free;
   FCurrentFrame:=TSkeletonFrame.Create;
   FCurrentFrame.TransformMode:=Frames[frameIndex1].TransformMode;
   with FCurrentFrame do begin
      Position.Lerp(Frames[frameIndex1].Position,
                    Frames[frameIndex2].Position, lerpFactor);
      case TransformMode of 
         sftRotation   : Rotation.AngleLerp(Frames[frameIndex1].Rotation,
                                          Frames[frameIndex2].Rotation, lerpFactor);
         sftQuaternion : Quaternion.Lerp(Frames[frameIndex1].Quaternion,
                                         Frames[frameIndex2].Quaternion, lerpFactor);
      end;
   end;
end;

// BlendedLerps
//
procedure TSkeleton.BlendedLerps(const lerpInfos : array of TBlendedLerpInfo);
var
   i, n : Integer;
   blendRotations : TAffineVectorList;
   blendQuaternions : TQuaternionList;
begin
   n:=High(lerpInfos)-Low(lerpInfos)+1;
   Assert(n>=1);
   i:=Low(lerpInfos);
   if n=1 then begin
      // use fast lerp (no blend)
      with lerpInfos[i] do
         Lerp(frameIndex1, frameIndex2, lerpFactor);
   end else begin
      if Assigned(FCurrentFrame) then
         FCurrentFrame.Free;
      FCurrentFrame:=TSkeletonFrame.Create;
      FCurrentFrame.TransformMode:=Frames[lerpInfos[i].frameIndex1].TransformMode;
      with FCurrentFrame do begin
         Position.Lerp(Frames[lerpInfos[i].frameIndex1].Position,
                       Frames[lerpInfos[i].frameIndex2].Position,
                       lerpInfos[i].lerpFactor);
         if lerpInfos[i].weight<>1 then
            Position.Scale(lerpInfos[i].weight);
         case TransformMode of
            sftRotation : begin
               blendRotations:=TAffineVectorList.Create;
               // lerp first item separately
               Rotation.AngleLerp(Frames[lerpInfos[i].frameIndex1].Rotation,
                                  Frames[lerpInfos[i].frameIndex2].Rotation,
                                  lerpInfos[i].lerpFactor);
               Inc(i);
               // combine the other items
               while i<=High(lerpInfos) do begin
                  blendRotations.AngleLerp(Frames[lerpInfos[i].frameIndex1].Rotation,
                                           Frames[lerpInfos[i].frameIndex2].Rotation,
                                           lerpInfos[i].lerpFactor);
                  Rotation.AngleCombine(blendRotations, 1);
                  Inc(i);
               end;
               blendRotations.Free;
            end;
         
            sftQuaternion : begin
               blendQuaternions:=TQuaternionList.Create;
               // Initial frame lerp
               Quaternion.Lerp(Frames[lerpInfos[i].frameIndex1].Quaternion,
                               Frames[lerpInfos[i].frameIndex2].Quaternion,
                               lerpInfos[i].lerpFactor);
               Inc(i);
               // Combine the lerped frames together
               while i<=High(lerpInfos) do begin
                  blendQuaternions.Lerp(Frames[lerpInfos[i].frameIndex1].Quaternion,
                                        Frames[lerpInfos[i].frameIndex2].Quaternion,
                                        lerpInfos[i].lerpFactor);
                  Quaternion.Combine(blendQuaternions, 1);
                  Inc(i);
               end;
               blendQuaternions.Free;
            end;
         end;
      end;
   end;
end;

// MakeSkeletalTranslationStatic
//
procedure TSkeleton.MakeSkeletalTranslationStatic(startFrame, endFrame : Integer);
var
   delta : TAffineVector;
   i : Integer;
   f : Single;
begin
   if endFrame<=startFrame then Exit;
   delta:=VectorSubtract(Frames[endFrame].Position[0], Frames[startFrame].Position[0]);
   f:=-1/(endFrame-startFrame);
   for i:=startFrame to endFrame do
      Frames[i].Position[0]:=VectorCombine(Frames[i].Position[0], delta,
                                           1, (i-startFrame)*f);
end;

// MakeSkeletalRotationDelta
//
procedure TSkeleton.MakeSkeletalRotationDelta(startFrame, endFrame : Integer);
var
   i, j : Integer;
   v : TAffineVector;
begin
   if endFrame<=startFrame then Exit;
   for i:=startFrame to endFrame do begin
      for j:=0 to Frames[i].Position.Count-1 do begin
         Frames[i].Position[j]:=NullVector;
         v:=VectorSubtract(Frames[i].Rotation[j],
                           Frames[0].Rotation[j]);
         if VectorNorm(v)<1e-6 then
            Frames[i].Rotation[j]:=NullVector
         else Frames[i].Rotation[j]:=v;
      end;
   end;
end;

// MorphMesh
//
procedure TSkeleton.MorphMesh(normalize : Boolean);
var
   i : Integer;
   mesh : TBaseMeshObject;
begin
   if Owner.MeshObjects.Count>0 then begin
      RootBones.PrepareGlobalMatrices;
      for i:=0 to Owner.MeshObjects.Count-1 do begin
         mesh:=Owner.MeshObjects.Items[i];
         if mesh is TSkeletonMeshObject then
            TSkeletonMeshObject(mesh).ApplyCurrentSkeletonFrame(normalize);
      end;
   end;
end;

// Clear
//
procedure TSkeleton.Clear;
begin
   FlushBoneByIDCache;
   RootBones.Clean;
   Frames.Clear;
   FCurrentFrame.Free;
   FCurrentFrame:=nil;
end;

// ------------------
// ------------------ TMeshObject ------------------
// ------------------

// CreateOwned
//
constructor TMeshObject.CreateOwned(AOwner : TMeshObjectList);
begin
   FOwner:=AOwner;
   Create;
   if Assigned(FOwner) then
      FOwner.Add(Self);
end;

// Create
//
constructor TMeshObject.Create;
begin
   FMode:=momTriangles;
   FTexCoords:=TAffineVectorList.Create;
   FLighmapTexCoords:=TTexPointList.Create;
   FColors:=TVectorList.Create;
   FFaceGroups:=TFaceGroups.CreateOwned(Self);
   inherited;
end;

// Destroy
//
destructor TMeshObject.Destroy;
begin
   FFaceGroups.Free;
   FColors.Free;
   FTexCoords.Free;
   FLighmapTexCoords.Free;
   if Assigned(FOwner) then
      FOwner.Remove(Self);
   inherited;
end;

// WriteToFiler
//
procedure TMeshObject.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      if LighmapTexCoords.Count>0 then begin
         WriteInteger(1);        // Archive Version 1, added FLighmapTexCoords
         FTexCoords.WriteToFiler(writer);
         FLighmapTexCoords.WriteToFiler(writer);
      end else begin
         WriteInteger(0);        // Archive Version 0
         FTexCoords.WriteToFiler(writer);
      end;
      FColors.WriteToFiler(writer);
      FFaceGroups.WriteToFiler(writer);
      WriteInteger(Integer(FMode));
      WriteInteger(SizeOf(FRenderingOptions));
      Write(FRenderingOptions, SizeOf(FRenderingOptions));
   end;
end;

// ReadFromFiler
//
procedure TMeshObject.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion in [0..1] then with reader do begin
      FTexCoords.ReadFromFiler(reader);
      if archiveVersion>=1 then
         FLighmapTexCoords.ReadFromFiler(reader)
      else FLighmapTexCoords.Clear;
      FColors.ReadFromFiler(reader);
      FFaceGroups.ReadFromFiler(reader);
      FMode:=TMeshObjectMode(ReadInteger);
      if ReadInteger<>SizeOf(FRenderingOptions) then Assert(False);
      Read(FRenderingOptions, SizeOf(FRenderingOptions));
   end else RaiseFilerException(archiveVersion);
end;

// Clear;
//
procedure TMeshObject.Clear;
begin
   inherited;
   FFaceGroups.Clear;
   FColors.Clear;
   FTexCoords.Clear;
   FLighmapTexCoords.Clear;
end;

// ExtractTriangles
//
function TMeshObject.ExtractTriangles(texCoords : TAffineVectorList = nil;
                                      normals : TAffineVectorList = nil) : TAffineVectorList;
begin
   case mode of
      momTriangles : begin
         Result:=inherited ExtractTriangles;
         if Assigned(texCoords) then
            texCoords.Assign(Self.TexCoords);
         if Assigned(normals) then
            normals.Assign(Self.Normals);
      end;
      momTriangleStrip : begin
         Result:=TAffineVectorList.Create;
         ConvertStripToList(Vertices, Result);
         if Assigned(texCoords) then
            ConvertStripToList(Self.TexCoords, texCoords);
         if Assigned(normals) then
            ConvertStripToList(Self.Normals, normals);
      end;
      momFaceGroups : begin
         Result:=TAffineVectorList.Create;
         FaceGroups.AddToTriangles(Result, texCoords, normals);
      end;
   else
      Result:=nil;
      Assert(False);
   end;
end;

// TriangleCount
//
function TMeshObject.TriangleCount : Integer;
var
   i : Integer;
begin
   case Mode of
      momTriangles :
         Result:=(Vertices.Count div 3);
      momTriangleStrip : begin
         Result:=Vertices.Count-2;
         if Result<0 then Result:=0;
      end;
      momFaceGroups : begin
         Result:=0;
         for i:=0 to FaceGroups.Count-1 do
            Result:=Result+FaceGroups[i].TriangleCount;
      end;
   else
      Result:=0;
      Assert(False);
   end;
end;

// PrepareMaterialLibraryCache
//
procedure TMeshObject.PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
begin
   FaceGroups.PrepareMaterialLibraryCache(matLib);
end;

// DropMaterialLibraryCache
//
procedure TMeshObject.DropMaterialLibraryCache;
begin
   FaceGroups.DropMaterialLibraryCache;
end;

// GetExtents
//
procedure TMeshObject.GetExtents(var min, max : TAffineVector);
begin
   FVertices.GetExtents(min, max);
end;

// Prepare
//
procedure TMeshObject.Prepare;
var
   i : Integer;
begin
   for i:=0 to FaceGroups.Count-1 do
      FaceGroups[i].Prepare;
end;

// PointInObject
//
function TMeshObject.PointInObject(const aPoint : TAffineVector) : Boolean;
var
   min, max : TAffineVector;
begin
   GetExtents(min, max);
   Result:=    (aPoint[0]>=min[0]) and (aPoint[1]>=min[1]) and (aPoint[2]>=min[2])
           and (aPoint[0]<=max[0]) and (aPoint[1]<=max[1]) and (aPoint[2]<=max[2]);
end;

// SetTexCoords
//
procedure TMeshObject.SetTexCoords(const val : TAffineVectorList);
begin
   FTexCoords.Assign(val);
end;

// SetLightmapTexCoords
//
procedure TMeshObject.SetLightmapTexCoords(const val : TTexPointList);
begin
   FLighmapTexCoords.Assign(val);
end;

// SetColors
//
procedure TMeshObject.SetColors(const val : TVectorList);
begin
   FColors.Assign(val);
end;

// DeclareArraysToOpenGL
//
procedure TMeshObject.DeclareArraysToOpenGL(var mrci : TRenderContextInfo; evenIfAlreadyDeclared : Boolean = False);
begin
   if evenIfAlreadyDeclared or (not FArraysDeclared) then begin
      if Vertices.Count>0 then begin
         glEnableClientState(GL_VERTEX_ARRAY);
         glVertexPointer(3, GL_FLOAT, 0, Vertices.List);
      end else glDisableClientState(GL_VERTEX_ARRAY);
      if not mrci.ignoreMaterials then begin
         if Normals.Count>0 then begin
            glEnableClientState(GL_NORMAL_ARRAY);
            glNormalPointer(GL_FLOAT, 0, Normals.List);
         end else glDisableClientState(GL_NORMAL_ARRAY);
         if (Colors.Count>0) and (not mrci.ignoreMaterials) then begin
            glEnableClientState(GL_COLOR_ARRAY);
            glColorPointer(4, GL_FLOAT, 0, Colors.List);
         end else glDisableClientState(GL_COLOR_ARRAY);
         if TexCoords.Count>0 then begin
            xglEnableClientState(GL_TEXTURE_COORD_ARRAY);
            xglTexCoordPointer(2, GL_FLOAT, SizeOf(TAffineVector), TexCoords.List);
         end else xglDisableClientState(GL_TEXTURE_COORD_ARRAY);
         if GL_ARB_multitexture and (LighmapTexCoords.Count>0) then begin
            glClientActiveTextureARB(GL_TEXTURE1_ARB);
            glTexCoordPointer(2, GL_FLOAT, SizeOf(TTexPoint), LighmapTexCoords.List);
            glEnableClientState(GL_TEXTURE_COORD_ARRAY);
            glClientActiveTextureARB(GL_TEXTURE0_ARB);
         end;
      end else begin
         glDisableClientState(GL_NORMAL_ARRAY);
         glDisableClientState(GL_COLOR_ARRAY);
         xglDisableClientState(GL_TEXTURE_COORD_ARRAY);
      end;
      // with lightmap texcoords units active, wee seem to actually lose performance...
      if GL_EXT_compiled_vertex_array and (LighmapTexCoords.Count=0) then
         glLockArraysEXT(0, vertices.Count); 
      FArraysDeclared:=True;
      FLightMapArrayEnabled:=False;
   end;
end;

// DisableOpenGLArrays
//
procedure TMeshObject.DisableOpenGLArrays(var mrci : TRenderContextInfo);
begin
   if FArraysDeclared then begin
      DisableLightMapArray(mrci);
      if GL_EXT_compiled_vertex_array and (LighmapTexCoords.Count=0) then
         glUnLockArraysEXT;
      if Vertices.Count>0 then
         glDisableClientState(GL_VERTEX_ARRAY);
      if not mrci.ignoreMaterials then begin
         if Normals.Count>0 then
            glDisableClientState(GL_NORMAL_ARRAY);
         if (Colors.Count>0) and (not mrci.ignoreMaterials) then
            glDisableClientState(GL_COLOR_ARRAY);
         if TexCoords.Count>0 then
            xglDisableClientState(GL_TEXTURE_COORD_ARRAY);
         if GL_ARB_multitexture and (LighmapTexCoords.Count>0) then begin
            glClientActiveTextureARB(GL_TEXTURE1_ARB);
            glDisableClientState(GL_TEXTURE_COORD_ARRAY);
            glClientActiveTextureARB(GL_TEXTURE0_ARB);
         end;
      end;
      FArraysDeclared:=False;
   end;
end;

// EnableLightMapArray
//
procedure TMeshObject.EnableLightMapArray(var mrci : TRenderContextInfo);
begin
   if GL_ARB_multitexture and (not mrci.ignoreMaterials) then begin
      Assert(FArraysDeclared);
      if not FLightMapArrayEnabled then begin
         glActiveTextureARB(GL_TEXTURE1_ARB);
         glEnable(GL_TEXTURE_2D);
         glActiveTextureARB(GL_TEXTURE0_ARB);
         FLightMapArrayEnabled:=True;
      end;
   end;
end;

// DisableLightMapArray
//
procedure TMeshObject.DisableLightMapArray(var mrci : TRenderContextInfo);
begin
   if GL_ARB_multitexture and FLightMapArrayEnabled then begin
      glActiveTextureARB(GL_TEXTURE1_ARB);
      glDisable(GL_TEXTURE_2D);
      glActiveTextureARB(GL_TEXTURE0_ARB);
      FLightMapArrayEnabled:=False;
   end;
end;

// PrepareMaterials
//
procedure TMeshObject.PrepareBuildList(var mrci : TRenderContextInfo);
var
   i : Integer;
begin
   if (Mode=momFaceGroups) and Assigned(mrci.materialLibrary) then begin
      for i:=0 to FaceGroups.Count-1 do with TFaceGroup(FaceGroups.List[i]) do begin
         if MaterialCache<>nil then
            MaterialCache.PrepareBuildList;
      end;
   end;
end;

// BuildList
//
procedure TMeshObject.BuildList(var mrci : TRenderContextInfo);
var
   i, j, groupID : Integer;
   gotNormals, gotTexCoords, gotColor : Boolean;
   libMat : TGLLibMaterial;
begin
   FArraysDeclared:=False;
   gotColor:=(Vertices.Count=Colors.Count);
   if gotColor then begin
      glPushAttrib(GL_ENABLE_BIT);
      glEnable(GL_COLOR_MATERIAL);
      glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
      ResetGLMaterialColors;
   end;
   case Mode of
      momTriangles, momTriangleStrip : if Vertices.Count>0 then begin
         DeclareArraysToOpenGL(mrci);
         gotNormals:=(Vertices.Count=Normals.Count);
         gotTexCoords:=(Vertices.Count=TexCoords.Count);
         if Mode=momTriangles then
            glBegin(GL_TRIANGLES)
         else glBegin(GL_TRIANGLE_STRIP);
         for i:=0 to Vertices.Count-1 do begin
            if gotNormals   then glNormal3fv(@Normals.List[i]);
            if gotTexCoords then xglTexCoord2fv(@TexCoords.List[i]);
            if gotColor     then glColor4fv(@Colors.List[i]);
            glVertex3fv(@Vertices.List[i]);
         end;
         glEnd;
      end;
      momFaceGroups : begin
         if Assigned(mrci.materialLibrary) then begin
            if moroGroupByMaterial in RenderingOptions then begin
               // group-by-material rendering, reduces material switches,
               // but alters rendering order
               groupID:=vNextRenderGroupID;
               Inc(vNextRenderGroupID);
               for i:=0 to FaceGroups.Count-1 do begin
                  if FaceGroups[i].FRenderGroupID<>groupID then begin
                     libMat:=FaceGroups[i].FMaterialCache;
                     if Assigned(libMat) then
                        libMat.Apply(mrci);
                     repeat
                        for j:=i to FaceGroups.Count-1 do with FaceGroups[j] do begin
                           if (FRenderGroupID<>groupID)
                                 and (FMaterialCache=libMat) then begin
                              FRenderGroupID:=groupID;
                              BuildList(mrci);
                           end;
                        end;
                     until (not Assigned(libMat)) or (not libMat.UnApply(mrci));
                  end;
               end;
            end else begin
               // canonical rendering
               for i:=0 to FaceGroups.Count-1 do with FaceGroups[i] do begin
                  libMat:=FMaterialCache;
                  if Assigned(libMat) then begin
                     libMat.Apply(mrci);
                     repeat
                        BuildList(mrci);
                     until not libMat.UnApply(mrci);
                  end else BuildList(mrci);
               end;
            end;
            // restore faceculling
            if (stCullFace in mrci.currentStates) then begin
               if not mrci.bufferFaceCull then
                  UnSetGLState(mrci.currentStates, stCullFace);
            end else begin
               if mrci.bufferFaceCull then
                  SetGLState(mrci.currentStates, stCullFace);
            end;
         end else for i:=0 to FaceGroups.Count-1 do
            FaceGroups[i].BuildList(mrci);
      end;
   else
      Assert(False);
   end;
   if gotColor then glPopAttrib;
   DisableOpenGLArrays(mrci);
end;

// ------------------
// ------------------ TMeshObjectList ------------------
// ------------------

// CreateOwned
//
constructor TMeshObjectList.CreateOwned(aOwner : TGLBaseMesh);
begin
   FOwner:=AOwner;
   Create;
end;

// Destroy
//
destructor TMeshObjectList.Destroy;
begin
   Clear;
   inherited;
end;

// ReadFromFiler
//
procedure TMeshObjectList.ReadFromFiler(reader : TVirtualReader);
var
   i : Integer;
   mesh : TMeshObject;
begin
   inherited;
   for i:=0 to Count-1 do begin
      mesh:=Items[i];
      mesh.FOwner:=Self;
      if mesh is TSkeletonMeshObject then
         TSkeletonMeshObject(mesh).PrepareBoneMatrixInvertedMeshes;
   end;
end;

// PrepareMaterialLibraryCache
//
procedure TMeshObjectList.PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      TMeshObject(List[i]).PrepareMaterialLibraryCache(matLib);
end;

// DropMaterialLibraryCache
//
procedure TMeshObjectList.DropMaterialLibraryCache;
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      TMeshObject(List[i]).DropMaterialLibraryCache;
end;

// PrepareBuildList
//
procedure TMeshObjectList.PrepareBuildList(var mrci : TRenderContextInfo);
var
   i : Integer;
begin
   for i:=0 to Count-1 do with Items[i] do
      if Visible then
         PrepareBuildList(mrci);
end;

// BuildList
//
procedure TMeshObjectList.BuildList(var mrci : TRenderContextInfo);
var
   i : Integer;
begin
   for i:=0 to Count-1 do with Items[i] do
      if Visible then
         BuildList(mrci);
end;

// MorphTo
//
procedure TMeshObjectList.MorphTo(morphTargetIndex : Integer);
var
   i : Integer;
begin
   for i:=0 to Count-1 do if Items[i] is TMorphableMeshObject then
      TMorphableMeshObject(Items[i]).MorphTo(morphTargetIndex);
end;

// Lerp
//
procedure TMeshObjectList.Lerp(morphTargetIndex1, morphTargetIndex2 : Integer;
                               lerpFactor : Single);
var
   i : Integer;
begin
   for i:=0 to Count-1 do if Items[i] is TMorphableMeshObject then
      TMorphableMeshObject(Items[i]).Lerp(morphTargetIndex1, morphTargetIndex2, lerpFactor);
end;

// MorphTargetCount
//
function TMeshObjectList.MorphTargetCount : Integer;
var
   i : Integer;
begin
   Result:=MaxInt;
   for i:=0 to Count-1 do if Items[i] is TMorphableMeshObject then
      with TMorphableMeshObject(Items[i]) do
         if Result>MorphTargets.Count then
            Result:=MorphTargets.Count;
   if Result=MaxInt then
      Result:=0;
end;

// Clear
//
procedure TMeshObjectList.Clear;
var
   i : Integer;
begin
   DropMaterialLibraryCache;
   for i:=0 to Count-1 do with Items[i] do begin
      FOwner:=nil;
      Free;
   end;
   inherited;
end;

// GetMeshObject
//
function TMeshObjectList.GetMeshObject(Index: Integer): TMeshObject;
begin
   Result:=TMeshObject(List^[Index]);
end;

// GetExtents
//
procedure TMeshObjectList.GetExtents(var min, max : TAffineVector);
var
   i, k : Integer;
   lMin, lMax : TAffineVector;
const
   cBigValue : Single = 1e30;
   cSmallValue : Single = -1e30;
begin
   SetVector(min, cBigValue, cBigValue, cBigValue);
   SetVector(max, cSmallValue, cSmallValue, cSmallValue);
   for i:=0 to Count-1 do begin
      GetMeshObject(i).GetExtents(lMin, lMax);
      for k:=0 to 2 do begin
          if lMin[k]<min[k] then min[k]:=lMin[k];
          if lMax[k]>max[k] then max[k]:=lMax[k];
      end;
   end;
end;

// Translate
//
procedure TMeshObjectList.Translate(const delta : TAffineVector);
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      GetMeshObject(i).Translate(delta);
end;

// ExtractTriangles
//
function TMeshObjectList.ExtractTriangles(texCoords : TAffineVectorList = nil;
                                          normals : TAffineVectorList = nil) : TAffineVectorList;
var
   i : Integer;
   objTris : TAffineVectorList;
   objTexCoords : TAffineVectorList;
   objNormals : TAffineVectorList;
begin
   Result:=TAffineVectorList.Create;
   if Assigned(texCoords) then
      objTexCoords:=TAffineVectorList.Create
   else objTexCoords:=nil;
   if Assigned(normals) then
      objNormals:=TAffineVectorList.Create
   else objNormals:=nil;
   try
      for i:=0 to Count-1 do begin
         objTris:=GetMeshObject(i).ExtractTriangles(objTexCoords, objNormals);
         try
            Result.Add(objTris);
            if Assigned(texCoords) then begin
               texCoords.Add(objTexCoords);
               objTexCoords.Count:=0;
            end;
            if Assigned(normals) then begin
               normals.Add(objNormals);
               objNormals.Count:=0;
            end;
         finally
            objTris.Free;
         end;
      end;
   finally
      objTexCoords.Free;
      objNormals.Free;
   end;
end;

// TriangleCount
//
function TMeshObjectList.TriangleCount : Integer;
var
   i : Integer;
begin
   Result:=0;
   for i:=0 to Count-1 do
      Result:=Result+Items[i].TriangleCount;
end;

// Prepare
//
procedure TMeshObjectList.Prepare;
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      Items[i].Prepare;
end;

// FindMeshByName
//
function TMeshObjectList.FindMeshByName(MeshName : String) : TMeshObject;
var
   i : integer;
begin
   Result:=nil;
   for i:=0 to Count-1 do
      if Items[i].Name = MeshName then begin
        Result:=Items[i];
        break;
      end;
end;


// ------------------
// ------------------ TMeshMorphTarget ------------------
// ------------------

// CreateOwned
//
constructor TMeshMorphTarget.CreateOwned(AOwner : TMeshMorphTargetList);
begin
   FOwner:=AOwner;
   Create;
   if Assigned(FOwner) then
      FOwner.Add(Self);
end;

// Destroy
//
destructor TMeshMorphTarget.Destroy;
begin
   if Assigned(FOwner) then
      FOwner.Remove(Self);
   inherited;
end;

// WriteToFiler
//
procedure TMeshMorphTarget.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0);  // Archive Version 0
      //nothing
   end;
end;

// ReadFromFiler
//
procedure TMeshMorphTarget.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion=0 then with reader do begin
      //nothing
   end else RaiseFilerException(archiveVersion);
end;

// ------------------
// ------------------ TMeshMorphTargetList ------------------
// ------------------

// CreateOwned
//
constructor TMeshMorphTargetList.CreateOwned(AOwner : TPersistent);
begin
   FOwner:=AOwner;
   Create;
end;

// Destroy
//
destructor TMeshMorphTargetList.Destroy;
begin
   Clear;
   inherited;
end;

// ReadFromFiler
//
procedure TMeshMorphTargetList.ReadFromFiler(reader : TVirtualReader);
var
   i : Integer;
begin
   inherited;
   for i:=0 to Count-1 do Items[i].FOwner:=Self;
end;

// Translate
//
procedure TMeshMorphTargetList.Translate(const delta : TAffineVector);
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      Items[i].Translate(delta);
end;

// Clear
//
procedure TMeshMorphTargetList.Clear;
var
   i : Integer;
begin
   for i:=0 to Count-1 do with Items[i] do begin
      FOwner:=nil;
      Free;
   end;
   inherited;
end;

// GetMeshMorphTarget
//
function TMeshMorphTargetList.GetMeshMorphTarget(Index: Integer): TMeshMorphTarget;
begin
   Result:=TMeshMorphTarget(List^[Index]);
end;

// ------------------
// ------------------ TMorphableMeshObject ------------------
// ------------------

// Create
//
constructor TMorphableMeshObject.Create;
begin
   FMorphTargets:=TMeshMorphTargetList.CreateOwned(Self);
   inherited;
end;

// Destroy
//
destructor TMorphableMeshObject.Destroy;
begin
   FMorphTargets.Free;
   inherited;
end;

// WriteToFiler
//
procedure TMorphableMeshObject.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0);  // Archive Version 0
      FMorphTargets.WriteToFiler(writer);
   end;
end;

// ReadFromFiler
//
procedure TMorphableMeshObject.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion=0 then with reader do begin
      FMorphTargets.ReadFromFiler(reader);
   end else RaiseFilerException(archiveVersion);
end;

// Clear;
//
procedure TMorphableMeshObject.Clear;
begin
   inherited;
   FMorphTargets.Clear;
end;

// Translate
//
procedure TMorphableMeshObject.Translate(const delta : TAffineVector);
begin
   inherited;
   MorphTargets.Translate(delta);
end;

// MorphTo
//
procedure TMorphableMeshObject.MorphTo(morphTargetIndex : Integer);
begin
   if (morphTargetIndex=0) and (MorphTargets.Count=0) then Exit;
   Assert(Cardinal(morphTargetIndex)<Cardinal(MorphTargets.Count));
   with MorphTargets[morphTargetIndex] do begin
      if Vertices.Count>0 then
         Self.Vertices.Assign(Vertices);
      if Normals.Count>0 then
         Self.Normals.Assign(Normals);
   end;
end;

// Lerp
//
procedure TMorphableMeshObject.Lerp(morphTargetIndex1, morphTargetIndex2 : Integer;
                                    lerpFactor : Single);
var
   mt1, mt2 : TMeshMorphTarget;
begin
   Assert((Cardinal(morphTargetIndex1)<Cardinal(MorphTargets.Count))
          and (Cardinal(morphTargetIndex2)<Cardinal(MorphTargets.Count)));
   if lerpFactor=0 then
      MorphTo(morphTargetIndex1)
   else if lerpFactor=1 then
      MorphTo(morphTargetIndex2)
   else begin
      mt1:=MorphTargets[morphTargetIndex1];
      mt2:=MorphTargets[morphTargetIndex2];
      if mt1.Vertices.Count>0 then
         Vertices.Lerp(mt1.Vertices, mt2.Vertices, lerpFactor);
      if mt1.Normals.Count>0 then begin
         Normals.Lerp(mt1.Normals, mt2.Normals, lerpFactor);
         Normals.Normalize;
      end;
   end;
end;

// ------------------
// ------------------ TSkeletonMeshObject ------------------
// ------------------

// Create
//
constructor TSkeletonMeshObject.Create;
begin
   FBoneMatrixInvertedMeshes:=TList.Create;
	inherited Create;
end;

// Destroy
//
destructor TSkeletonMeshObject.Destroy;
begin
   Clear;
   FBoneMatrixInvertedMeshes.Free;
	inherited Destroy;
end;

// WriteToFiler
//
procedure TSkeletonMeshObject.WriteToFiler(writer : TVirtualWriter);
var
   i : Integer;
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0); // Archive Version 0
      WriteInteger(FVerticeBoneWeightCount);
      WriteInteger(FBonesPerVertex);
      for i:=0 to FVerticeBoneWeightCount-1 do
         Write(FVerticesBonesWeights[i][0], FBonesPerVertex*SizeOf(TVertexBoneWeight));
   end;
end;

// ReadFromFiler
//
procedure TSkeletonMeshObject.ReadFromFiler(reader : TVirtualReader);
var
	archiveVersion, i : integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
	if archiveVersion=0 then with reader do begin
      FVerticeBoneWeightCount:=ReadInteger;
      FBonesPerVertex:=ReadInteger;
      ResizeVerticesBonesWeights;
      for i:=0 to FVerticeBoneWeightCount-1 do
         Read(FVerticesBonesWeights[i][0], FBonesPerVertex*SizeOf(TVertexBoneWeight));
	end else RaiseFilerException(archiveVersion);
end;

// Clear
//
procedure TSkeletonMeshObject.Clear;
var
   i : Integer;
begin
   inherited;
   FVerticeBoneWeightCount:=0;
   FBonesPerVertex:=0;
   ResizeVerticesBonesWeights;
   for i:=0 to FBoneMatrixInvertedMeshes.Count-1 do
      TBaseMeshObject(FBoneMatrixInvertedMeshes[i]).Free;
   FBoneMatrixInvertedMeshes.Clear;
end;

// SetVerticeBoneWeightCount
//
procedure TSkeletonMeshObject.SetVerticeBoneWeightCount(const val : Integer);
begin
   if val<>FVerticeBoneWeightCount then begin
      FVerticeBoneWeightCount:=val;
      ResizeVerticesBonesWeights;
   end;
end;

// SetBonesPerVertex
//
procedure TSkeletonMeshObject.SetBonesPerVertex(const val : Integer);
begin
   if val<>FBonesPerVertex then begin
      FBonesPerVertex:=val;
      ResizeVerticesBonesWeights;
   end;
end;

// ResizeVerticesBonesWeights
//
procedure TSkeletonMeshObject.ResizeVerticesBonesWeights;
var
   n, m, i, j : Integer;
   newArea : PVerticesBoneWeights;
begin
   n:=BonesPerVertex*VerticeBoneWeightCount;
   if n=0 then begin
      // release everything
      if Assigned(FVerticesBonesWeights) then begin
         FreeMem(FVerticesBonesWeights[0]);
         FreeMem(FVerticesBonesWeights);
         FVerticesBonesWeights:=nil;
      end;
   end else begin
      // allocate new area
      newArea:=AllocMem(VerticeBoneWeightCount*SizeOf(PVertexBoneWeightArray));
      newArea[0]:=AllocMem(n*SizeOf(TVertexBoneWeight));
      for i:=1 to VerticeBoneWeightCount-1 do
         newArea[i]:=PVertexBoneWeightArray(Integer(newArea[0])+i*SizeOf(TVertexBoneWeight));
      // transfer old data
      if FLastVerticeBoneWeightCount<VerticeBoneWeightCount then
         n:=FLastVerticeBoneWeightCount
      else n:=VerticeBoneWeightCount;
      if FLastBonesPerVertex<BonesPerVertex then
         m:=FLastBonesPerVertex
      else m:=BonesPerVertex;
      for i:=0 to n-1 do
         for j:=0 to m-1 do newArea[i][j]:=VerticesBonesWeights[i][j];
      // release old area and switch to new
      if Assigned(FVerticesBonesWeights) then begin
         FreeMem(FVerticesBonesWeights[0]);
         FreeMem(FVerticesBonesWeights);
      end;
      FVerticesBonesWeights:=newArea;
   end;
   FLastVerticeBoneWeightCount:=FVerticeBoneWeightCount;
   FLastBonesPerVertex:=FBonesPerVertex;
end;

// AddWeightedBone
//
procedure TSkeletonMeshObject.AddWeightedBone(aBoneID : Integer; aWeight : Single);
var
   i,j : integer;
begin
   if BonesPerVertex<1 then BonesPerVertex:=1;
   VerticeBoneWeightCount:=VerticeBoneWeightCount+1;
   i:=(VerticeBoneWeightCount-1) div BonesPerVertex;
   j:=(VerticeBoneWeightCount-1) mod BonesPerVertex;
   with VerticesBonesWeights[i][j] do 
   begin
      BoneID:=aBoneID;
      Weight:=aWeight;
   end;
end;

// FindOrAdd
//
function TSkeletonMeshObject.FindOrAdd(boneID : Integer; const vertex, normal : TAffineVector) : Integer;
var
   i : Integer;
begin
   Result:=-1;
   for i:=0 to Vertices.Count-1 do
      if (VerticesBonesWeights[i][0].BoneID=boneID)
            and VectorEquals(Vertices[i], vertex)
            and VectorEquals(Normals[i], normal) then begin
         Result:=i;
         Break;
      end;
   if Result<0 then begin
      AddWeightedBone(boneID, 1);
      Vertices.Add(vertex);
      Result:=Normals.Add(normal);
   end;
end;

// PrepareBoneMatrixInvertedMeshes
//
procedure TSkeletonMeshObject.PrepareBoneMatrixInvertedMeshes;
var
   i, k, boneIndex : Integer;
   invMesh : TBaseMeshObject;
   invMat : TMatrix;
   bone : TSkeletonBone;
   p : TVector;
begin
   // cleanup existing stuff
   for i:=0 to FBoneMatrixInvertedMeshes.Count-1 do
      TBaseMeshObject(FBoneMatrixInvertedMeshes[i]).Free;
   FBoneMatrixInvertedMeshes.Clear;
   // calculate
   for k:=0 to BonesPerVertex-1 do begin
      invMesh:=TBaseMeshObject.Create;
      FBoneMatrixInvertedMeshes.Add(invMesh);
      invMesh.Vertices:=Vertices;
      invMesh.Normals:=Normals;
      for i:=0 to Vertices.Count-1 do begin
         boneIndex:=VerticesBonesWeights[i][k].BoneID;
         bone:=Owner.Owner.Skeleton.RootBones.BoneByID(boneIndex);
         // transform point
         MakePoint(p, Vertices[i]);
         invMat:=bone.GlobalMatrix;
         InvertMatrix(invMat);
         p:=VectorTransform(p, invMat);
         invMesh.Vertices[i]:=PAffineVector(@p)^;
         // transform normal
         SetVector(p, Normals[i]);
         invMat:=bone.GlobalMatrix;
         invMat[3]:=NullHmgPoint;
         InvertMatrix(invMat);
         p:=VectorTransform(p, invMat);
         invMesh.Normals[i]:=PAffineVector(@p)^;
      end;
   end;
end;

// ApplyCurrentSkeletonFrame
//
procedure TSkeletonMeshObject.ApplyCurrentSkeletonFrame(normalize : Boolean);
var
   i, j, boneID : Integer;
   refVertices, refNormals : TAffineVectorList;
   n, nt : TVector;
   bone : TSkeletonBone;
   skeleton : TSkeleton;
begin
   with TBaseMeshObject(FBoneMatrixInvertedMeshes[0]) do begin
      refVertices:=Vertices;
      refNormals:=Normals;
   end;
   skeleton:=Owner.Owner.Skeleton;
   n[3]:=0;
   if BonesPerVertex=1 then begin
      // simple case, one bone per vertex
      for i:=0 to refVertices.Count-1 do begin
         boneID:=VerticesBonesWeights[i][0].BoneID;
         bone:=skeleton.BoneByID(boneID);
         Vertices.List[i]:=VectorTransform(refVertices.List[i], bone.GlobalMatrix);
         PAffineVector(@n)^:=refNormals.List[i];
         nt:=VectorTransform(n, bone.GlobalMatrix);
         Normals.List[i]:=PAffineVector(@nt)^;
      end;
   end else begin
      // multiple bones per vertex
      for i:=0 to refVertices.Count-1 do begin
         for j:=0 to BonesPerVertex-1 do begin
            Vertices.List[i]:=NullVector;
            Normals.List[i]:=NullVector;
            if VerticesBonesWeights[i][j].Weight<>0 then begin
               boneID:=VerticesBonesWeights[i][j].BoneID;
               bone:=skeleton.BoneByID(boneID);
               CombineVector(Vertices.List[i],
                             VectorTransform(refVertices.List[i], bone.GlobalMatrix),
                             VerticesBonesWeights[i][j].Weight);
               PAffineVector(@n)^:=refNormals.List[i];
               n:=VectorTransform(n, bone.GlobalMatrix);
               CombineVector(Normals.List[i],
                             PAffineVector(@n)^,
                             VerticesBonesWeights[i][j].Weight);
            end;
         end;
      end;
   end;
   if normalize then
      Normals.Normalize;
end;

// ------------------
// ------------------ TFaceGroup ------------------
// ------------------

// CreateOwned
//
constructor TFaceGroup.CreateOwned(AOwner : TFaceGroups);
begin
   FOwner:=AOwner;
   FLightMapIndex:=-1;
   Create;
   if Assigned(FOwner) then
      FOwner.Add(Self);
end;

// Destroy
//
destructor TFaceGroup.Destroy;
begin
   if Assigned(FOwner) then
      FOwner.Remove(Self);
   inherited;
end;

// WriteToFiler
//
procedure TFaceGroup.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      if FLightMapIndex<0 then begin
         WriteInteger(0);  // Archive Version 0
         WriteString(FMaterialName);
      end else begin
         WriteInteger(1);  // Archive Version 1, added FLightMapIndex
         WriteString(FMaterialName);
         WriteInteger(FLightMapIndex);
      end;
   end;
end;

// ReadFromFiler
//
procedure TFaceGroup.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion in [0..1] then with reader do begin
      FMaterialName:=ReadString;
      if archiveVersion>=1 then
         FLightMapIndex:=ReadInteger
      else FLightMapIndex:=-1;
   end else RaiseFilerException(archiveVersion);
end;

// AttachLightmap
//
procedure TFaceGroup.AttachLightmap(lightMap : TGLTexture; var mrci : TRenderContextInfo);
begin
   if GL_ARB_multitexture then with lightMap do begin
      Assert(Image.NativeTextureTarget=GL_TEXTURE_2D);
      glActiveTextureARB(GL_TEXTURE1_ARB);

      SetGLCurrentTexture(1, GL_TEXTURE_2D, Handle);
      glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

      glActiveTextureARB(GL_TEXTURE0_ARB);
   end;
end;

// AttachOrDetachLightmap
//
procedure TFaceGroup.AttachOrDetachLightmap(var mrci : TRenderContextInfo);
var
   libMat : TGLLibMaterial;
begin
   if GL_ARB_multitexture then begin
      if (not mrci.ignoreMaterials) and Assigned(mrci.lightmapLibrary) then begin
         if lightMapIndex>=0 then begin
            // attach and activate lightmap
            Assert(lightMapIndex<mrci.lightmapLibrary.Materials.Count);
            libMat:=mrci.lightmapLibrary.Materials[lightMapIndex];
            AttachLightmap(libMat.Material.Texture, mrci);
            Owner.Owner.EnableLightMapArray(mrci);
         end else begin
            // desactivate lightmap
            Owner.Owner.DisableLightMapArray(mrci);
         end;
      end;
   end;
end;

// PrepareMaterialLibraryCache
//
procedure TFaceGroup.PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
begin
   if FMaterialName<>'' then
      FMaterialCache:=matLib.Materials.GetLibMaterialByName(FMaterialName)
   else FMaterialCache:=nil;
end;

// DropMaterialLibraryCache
//
procedure TFaceGroup.DropMaterialLibraryCache;
begin
   FMaterialCache:=nil;
end;

// AddToTriangles
//
procedure TFaceGroup.AddToTriangles(aList : TAffineVectorList;
                                    aTexCoords : TAffineVectorList = nil;
                                    aNormals : TAffineVectorList = nil);
begin
   // nothing
end;

// Reverse
//
procedure TFaceGroup.Reverse;
begin
   // nothing
end;

// Prepare
//
procedure TFaceGroup.Prepare;
begin
   // nothing
end;

// ------------------
// ------------------ TFGVertexIndexList ------------------
// ------------------

// Create
//
constructor TFGVertexIndexList.Create;
begin
   inherited;
   FVertexIndices:=TIntegerList.Create;
   FMode:=fgmmTriangles;
end;

// Destroy
//
destructor TFGVertexIndexList.Destroy;
begin
   FVertexIndices.Free;
   inherited;
end;

// WriteToFiler
//
procedure TFGVertexIndexList.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0);  // Archive Version 0
      FVertexIndices.WriteToFiler(writer);
      WriteInteger(Integer(FMode));
   end;
end;

// ReadFromFiler
//
procedure TFGVertexIndexList.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion=0 then with reader do begin
      FVertexIndices.ReadFromFiler(reader);
      FMode:=TFaceGroupMeshMode(ReadInteger);
   end else RaiseFilerException(archiveVersion);
end;

// SetIndices
//
procedure TFGVertexIndexList.SetVertexIndices(const val : TIntegerList);
begin
   FVertexIndices.Assign(val);
end;

// BuildList
//
procedure TFGVertexIndexList.BuildList(var mrci : TRenderContextInfo);
begin
   if VertexIndices.Count=0 then Exit;
   case Mode of
      fgmmTriangles, fgmmFlatTriangles : begin
         Owner.Owner.DeclareArraysToOpenGL(mrci, False);
         AttachOrDetachLightmap(mrci);
         glDrawElements(GL_TRIANGLES, VertexIndices.Count,
                        GL_UNSIGNED_INT, VertexIndices.List);
      end;
      fgmmTriangleStrip : begin
         Owner.Owner.DeclareArraysToOpenGL(mrci, False);
         AttachOrDetachLightmap(mrci);
         glDrawElements(GL_TRIANGLE_STRIP, VertexIndices.Count,
                        GL_UNSIGNED_INT, VertexIndices.List);
      end;
      fgmmTriangleFan : begin
         Owner.Owner.DeclareArraysToOpenGL(mrci, False);
         AttachOrDetachLightmap(mrci);
         glDrawElements(GL_TRIANGLE_FAN, VertexIndices.Count,
                        GL_UNSIGNED_INT, VertexIndices.List);
      end;
   else
      Assert(False);
   end;
end;

// AddToList
//
procedure TFGVertexIndexList.AddToList(source, destination : TAffineVectorList;
                                       indices : TIntegerList);
var
   i, n : Integer;
begin
   if not Assigned(destination) then Exit;
   if indices.Count<3 then Exit;
   case Mode of
      fgmmTriangles, fgmmFlatTriangles : begin
         n:=(indices.Count div 3)*3;
         if source.Count>0 then begin
            destination.AdjustCapacityToAtLeast(destination.Count+n);
            for i:=0 to n-1 do
               destination.Add(source[indices.List[i]]);
         end else destination.AddNulls(destination.Count+n);
      end;
      fgmmTriangleStrip : begin
         if source.Count>0 then
            ConvertStripToList(source, indices, destination)
         else destination.AddNulls(destination.Count+(indices.Count-2)*3);
      end;
      fgmmTriangleFan : begin
         n:=(indices.Count-2)*3;
         if source.Count>0 then begin
            destination.AdjustCapacityToAtLeast(destination.Count+n);
            for i:=2 to VertexIndices.Count-1 do begin
               destination.Add(source[indices.List[0]],
                               source[indices.List[i-1]],
                               source[indices.List[i]]);
            end;
         end else destination.AddNulls(destination.Count+n);
      end;
   else
      Assert(False);
   end;
end;

// AddToTriangles
//
procedure TFGVertexIndexList.AddToTriangles(aList : TAffineVectorList;
                                            aTexCoords : TAffineVectorList = nil;
                                            aNormals : TAffineVectorList = nil);
var
   mo : TMeshObject;
begin
   mo:=Owner.Owner;
   AddToList(mo.Vertices,  aList,      VertexIndices);
   AddToList(mo.TexCoords, aTexCoords, VertexIndices);
   AddToList(mo.Normals,   aNormals,   VertexIndices);
end;

// TriangleCount
//
function TFGVertexIndexList.TriangleCount : Integer;
begin
   case Mode of
      fgmmTriangles, fgmmFlatTriangles :
         Result:=VertexIndices.Count div 3;
      fgmmTriangleFan, fgmmTriangleStrip : begin
         Result:=VertexIndices.Count-2;
         if Result<0 then Result:=0;
      end;
   else
      Result:=0;
      Assert(False);
   end;
end;

// Reverse
//
procedure TFGVertexIndexList.Reverse;
begin
   VertexIndices.Reverse;
end;

// Add
//
procedure TFGVertexIndexList.Add(idx : Integer);
begin
   FVertexIndices.Add(idx);
end;

// GetExtents
//
procedure TFGVertexIndexList.GetExtents(var min, max : TAffineVector);
var
   i, k : Integer;
   f : Single;
   ref : PFloatArray;
const
   cBigValue : Single = 1e50;
   cSmallValue : Single = -1e50;
begin
   SetVector(min, cBigValue, cBigValue, cBigValue);
   SetVector(max, cSmallValue, cSmallValue, cSmallValue);
   for i:=0 to VertexIndices.Count-1 do begin
      ref:=Owner.Owner.Vertices.ItemAddress[VertexIndices[i]];
      for k:=0 to 2 do begin
         f:=ref[k];
         if f<min[k] then min[k]:=f;
         if f>max[k] then max[k]:=f;
      end;
   end;
end;

// ConvertToList
//
procedure TFGVertexIndexList.ConvertToList;
var
   i : Integer;
   bufList : TIntegerList;
begin
   if VertexIndices.Count>=3 then begin
      case Mode of
         fgmmTriangleStrip : begin
            bufList:=TIntegerList.Create;
            try
               ConvertStripToList(VertexIndices, bufList);
               VertexIndices:=bufList;
            finally
               bufList.Free;
            end;
            FMode:=fgmmTriangles;
         end;
         fgmmTriangleFan : begin
            bufList:=TIntegerList.Create;
            try
               for i:=0 to VertexIndices.Count-3 do
                  bufList.Add(VertexIndices[0], VertexIndices[i], VertexIndices[i+1]);
               VertexIndices:=bufList;
            finally
               bufList.Free;
            end;
            FMode:=fgmmTriangles;
         end;
      end;
   end;
end;

// GetNormal
//
function TFGVertexIndexList.GetNormal : TAffineVector;
begin
   if VertexIndices.Count<3 then
      Result:=NullVector
   else with Owner.Owner.Vertices do
      CalcPlaneNormal(Items[VertexIndices[0]], Items[VertexIndices[1]],
                      Items[VertexIndices[2]], Result);
end;

// ------------------
// ------------------ TFGVertexNormalTexIndexList ------------------
// ------------------

// Create
//
constructor TFGVertexNormalTexIndexList.Create;
begin
   inherited;
   FNormalIndices:=TIntegerList.Create;
   FTexCoordIndices:=TIntegerList.Create;
end;

// Destroy
//
destructor TFGVertexNormalTexIndexList.Destroy;
begin
   FTexCoordIndices.Free;
   FNormalIndices.Free;
   inherited;
end;

// WriteToFiler
//
procedure TFGVertexNormalTexIndexList.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0);  // Archive Version 0
      FNormalIndices.WriteToFiler(writer);
      FTexCoordIndices.WriteToFiler(writer);
   end;
end;

// ReadFromFiler
//
procedure TFGVertexNormalTexIndexList.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion=0 then with reader do begin
      FNormalIndices.ReadFromFiler(reader);
      FTexCoordIndices.ReadFromFiler(reader);
   end else RaiseFilerException(archiveVersion);
end;

// SetNormalIndices
//
procedure TFGVertexNormalTexIndexList.SetNormalIndices(const val : TIntegerList);
begin
   FNormalIndices.Assign(val);
end;

// SetTexCoordIndices
//
procedure TFGVertexNormalTexIndexList.SetTexCoordIndices(const val : TIntegerList);
begin
   FTexCoordIndices.Assign(val);
end;

// BuildList
//
procedure TFGVertexNormalTexIndexList.BuildList(var mrci : TRenderContextInfo);
var
   i : Integer;
   vertexPool : PAffineVectorArray;
   normalPool : PAffineVectorArray;
   texCoordPool : PAffineVectorArray;
   normalIdxList, texCoordIdxList, vertexIdxList : PIntegerVector;
begin
   Assert(    ((TexCoordIndices.Count=0) or (VertexIndices.Count<=TexCoordIndices.Count))
          and ((NormalIndices.Count=0) or (VertexIndices.Count<=NormalIndices.Count)));
   vertexPool:=Owner.Owner.Vertices.List;
   normalPool:=Owner.Owner.Normals.List;
   texCoordPool:=Owner.Owner.TexCoords.List;
   case Mode of
      fgmmTriangles, fgmmFlatTriangles : glBegin(GL_TRIANGLES);
      fgmmTriangleStrip :                glBegin(GL_TRIANGLE_STRIP);
      fgmmTriangleFan   :                glBegin(GL_TRIANGLE_FAN);
   else
      Assert(False);
   end;
   vertexIdxList:=VertexIndices.List;
   if NormalIndices.Count>0 then
      normalIdxList:=NormalIndices.List
   else normalIdxList:=vertexIdxList;
   if TexCoordIndices.Count>0 then
      texCoordIdxList:=TexCoordIndices.List
   else texCoordIdxList:=vertexIdxList;
   if Assigned(texCoordPool) then begin
      for i:=0 to VertexIndices.Count-1 do begin
         glNormal3fv(@normalPool[normalIdxList[i]]);
         xglTexCoord2fv(@texCoordPool[texCoordIdxList[i]]);
         glVertex3fv(@vertexPool[vertexIdxList[i]]);
      end;
   end else begin
      for i:=0 to VertexIndices.Count-1 do begin
         glNormal3fv(@normalPool[normalIdxList[i]]);
         glVertex3fv(@vertexPool[vertexIdxList[i]]);
      end;
   end;
   glEnd;
end;

// AddToTriangles
//
procedure TFGVertexNormalTexIndexList.AddToTriangles(aList : TAffineVectorList;
                                                     aTexCoords : TAffineVectorList = nil;
                                                     aNormals : TAffineVectorList = nil);
begin
   AddToList(Owner.Owner.Vertices,  aList,      VertexIndices);
   AddToList(Owner.Owner.TexCoords, aTexCoords, TexCoordIndices);
   AddToList(Owner.Owner.Normals,   aNormals,   NormalIndices);
end;

// Add
//
procedure TFGVertexNormalTexIndexList.Add(vertexIdx, normalIdx, texCoordIdx : Integer);
begin
   inherited Add(vertexIdx);
   FNormalIndices.Add(normalIdx);
   FTexCoordIndices.Add(texCoordIdx);
end;

// ------------------
// ------------------ TFGIndexTexCoordList ------------------
// ------------------

// Create
//
constructor TFGIndexTexCoordList.Create;
begin
   inherited;
   FTexCoords:=TAffineVectorList.Create;
end;

// Destroy
//
destructor TFGIndexTexCoordList.Destroy;
begin
   FTexCoords.Free;
   inherited;
end;

// WriteToFiler
//
procedure TFGIndexTexCoordList.WriteToFiler(writer : TVirtualWriter);
begin
   inherited WriteToFiler(writer);
   with writer do begin
      WriteInteger(0);  // Archive Version 0
      FTexCoords.WriteToFiler(writer);
   end;
end;

// ReadFromFiler
//
procedure TFGIndexTexCoordList.ReadFromFiler(reader : TVirtualReader);
var
   archiveVersion : Integer;
begin
   inherited ReadFromFiler(reader);
   archiveVersion:=reader.ReadInteger;
   if archiveVersion=0 then with reader do begin
      FTexCoords.ReadFromFiler(reader);
   end else RaiseFilerException(archiveVersion);
end;

// SetTexCoords
//
procedure TFGIndexTexCoordList.SetTexCoords(const val : TAffineVectorList);
begin
   FTexCoords.Assign(val);
end;

// BuildList
//
procedure TFGIndexTexCoordList.BuildList(var mrci : TRenderContextInfo);
var
   i, k : Integer;
   texCoordPool : PAffineVectorArray;
   vertexPool : PAffineVectorArray;
   normalPool : PAffineVectorArray;
   indicesPool : PIntegerArray;
begin
   Assert(VertexIndices.Count=TexCoords.Count);
   texCoordPool:=TexCoords.List;
   vertexPool:=Owner.Owner.Vertices.List;
   indicesPool:=@VertexIndices.List[0];
   case Mode of
      fgmmTriangles, fgmmFlatTriangles :
         glBegin(GL_TRIANGLES);
      fgmmTriangleStrip :
         glBegin(GL_TRIANGLE_STRIP);
      fgmmTriangleFan :
         glBegin(GL_TRIANGLE_FAN);
   else
      Assert(False);
   end;
   if Owner.Owner.Normals.Count=Owner.Owner.Vertices.Count then begin
      normalPool:=Owner.Owner.Normals.List;
      for i:=0 to VertexIndices.Count-1 do begin
         xglTexCoord2fv(@texCoordPool[i]);
         k:=indicesPool[i];
         glNormal3fv(@normalPool[k]);
         glVertex3fv(@vertexPool[k]);
      end;
   end else begin
      for i:=0 to VertexIndices.Count-1 do begin
         xglTexCoord2fv(@texCoordPool[i]);
         glVertex3fv(@vertexPool[indicesPool[i]]);
      end;
   end;
   glEnd;
end;

// AddToTriangles
//
procedure TFGIndexTexCoordList.AddToTriangles(aList : TAffineVectorList;
                                              aTexCoords : TAffineVectorList = nil;
                                              aNormals : TAffineVectorList = nil);
var
   i, n : Integer;
   texCoordList : TAffineVectorList;
begin
   AddToList(Owner.Owner.Vertices,  aList,      VertexIndices);
   AddToList(Owner.Owner.Normals,   aNormals,   VertexIndices);
   texCoordList:=Self.TexCoords;
   case Mode of
      fgmmTriangles, fgmmFlatTriangles : begin
         if Assigned(aTexCoords) then begin
            n:=(VertexIndices.Count div 3)*3;
            aTexCoords.AdjustCapacityToAtLeast(aTexCoords.Count+n);
            for i:=0 to n-1 do
               aTexCoords.Add(texCoordList[i]);
         end;
      end;
      fgmmTriangleStrip : begin
         if Assigned(aTexCoords) then
            ConvertStripToList(aTexCoords, texCoordList);
      end;
      fgmmTriangleFan : begin
         if Assigned(aTexCoords) then begin
            aTexCoords.AdjustCapacityToAtLeast(aTexCoords.Count+(VertexIndices.Count-2)*3);
            for i:=2 to VertexIndices.Count-1 do begin
               aTexCoords.Add(texCoordList[0],
                              texCoordList[i-1],
                              texCoordList[i]);
            end;
         end;
      end;
   else
      Assert(False);
   end;
end;

// Add (affine)
//
procedure TFGIndexTexCoordList.Add(idx : Integer; const texCoord : TAffineVector);
begin
   TexCoords.Add(texCoord);
   inherited Add(idx);
end;

// Add (s, t)
//
procedure TFGIndexTexCoordList.Add(idx : Integer; const s, t : Single);
begin
   TexCoords.Add(s, t, 0);
   inherited Add(idx);
end;

// ------------------
// ------------------ TFaceGroups ------------------
// ------------------

// CreateOwned
//
constructor TFaceGroups.CreateOwned(AOwner : TMeshObject);
begin
   FOwner:=AOwner;
   Create;
end;

// Destroy
//
destructor TFaceGroups.Destroy;
begin
   Clear;
   inherited;
end;

// ReadFromFiler
//
procedure TFaceGroups.ReadFromFiler(reader : TVirtualReader);
var
   i : Integer;
begin
   inherited;
   for i:=0 to Count-1 do Items[i].FOwner:=Self;
end;

// Clear
//
procedure TFaceGroups.Clear;
var
   i : Integer;
   fg : TFaceGroup;
begin
   for i:=0 to Count-1 do begin
      fg:=GetFaceGroup(i);
      if Assigned(fg) then begin
         fg.FOwner:=nil;
         fg.Free;
      end;
   end;
   inherited;
end;

// GetFaceGroup
//
function TFaceGroups.GetFaceGroup(Index: Integer): TFaceGroup;
begin
   Result:=TFaceGroup(List^[Index]);
end;

// PrepareMaterialLibraryCache
//
procedure TFaceGroups.PrepareMaterialLibraryCache(matLib : TGLMaterialLibrary);
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      TFaceGroup(List[i]).PrepareMaterialLibraryCache(matLib);
end;

// DropMaterialLibraryCache
//
procedure TFaceGroups.DropMaterialLibraryCache;
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      TFaceGroup(List[i]).DropMaterialLibraryCache;
end;

// AddToTriangles
//
procedure TFaceGroups.AddToTriangles(aList : TAffineVectorList;
                                     aTexCoords : TAffineVectorList = nil;
                                     aNormals : TAffineVectorList = nil);
var
   i : Integer;
begin
   for i:=0 to Count-1 do
      Items[i].AddToTriangles(aList, aTexCoords, aNormals);
end;

// MaterialLibrary
//
function TFaceGroups.MaterialLibrary : TGLMaterialLibrary;
var
   mol : TMeshObjectList;
   bm : TGLBaseMesh;
begin
   if Assigned(Owner) then begin
      mol:=Owner.Owner;
      if Assigned(mol) then begin
         bm:=mol.Owner;
         if Assigned(bm) then begin
            Result:=bm.MaterialLibrary;;
            Exit;
         end;
      end;
   end;
   Result:=nil;
end;

// SortByMaterial
//
procedure TFaceGroups.SortByMaterial;
var
   i, j : Integer;
   cur : String;
   curIsOpaque, isOpaque : Boolean;
   curIdx : Integer;
   matLib : TGLMaterialLibrary;

   function MaterialIsOpaque(const materialName : String) : Boolean;
   var
      libMat : TGLLibMaterial;
   begin
      if Assigned(matLib) then begin
         libMat:=matLib.Materials.GetLibMaterialByName(materialName);
         if Assigned(libMat) then begin
            Result:=not libMat.Material.Blended;
            Exit;
         end;
      end;
      Result:=True;
   end;

begin
   matLib:=MaterialLibrary;
   // slow but simple sort, we are not supposed to do this every frame
   for i:=0 to Count-2 do begin
      curIdx:=i;
      cur:=Items[i].MaterialName;
      curIsOpaque:=MaterialIsOpaque(cur);
      for j:=i+1 to Count-1 do begin
         isOpaque:=MaterialIsOpaque(Items[j].MaterialName);
         if (Items[j].MaterialName<cur) and (isOpaque or (not curIsOpaque)) then begin
            cur:=Items[j].MaterialName;
            curIdx:=j;
         end;
      end;
      Exchange(curIdx, i);
   end;
end;

// ------------------
// ------------------ TVectorFile ------------------
// ------------------

// Create
//
constructor TVectorFile.Create(AOwner: TPersistent);
begin
   Assert(AOwner is TGLBaseMesh);
   inherited;
end;

// Owner
//
function TVectorFile.Owner : TGLBaseMesh;
begin
   Result:=TGLBaseMesh(GetOwner);
end;

// SetNormalsOrientation
//
procedure TVectorFile.SetNormalsOrientation(const val : TMeshNormalsOrientation);
begin
   FNormalsOrientation:=val;
end;

// ------------------
// ------------------ TGLGLSMVectorFile ------------------
// ------------------

// Capabilities
//
class function TGLGLSMVectorFile.Capabilities : TDataFileCapabilities;
begin
   Result:=[dfcRead, dfcWrite];
end;

// LoadFromStream
//
procedure TGLGLSMVectorFile.LoadFromStream(aStream : TStream);
begin
   Owner.MeshObjects.LoadFromStream(aStream);
end;

// SaveToStream
//
procedure TGLGLSMVectorFile.SaveToStream(aStream : TStream);
begin
   Owner.MeshObjects.SaveToStream(aStream);
end;


//----------------- TGLBaseMesh --------------------------------------------------

// Create
//
constructor TGLBaseMesh.Create(AOwner:TComponent);
begin
   inherited Create(AOwner);
   ObjectStyle:=ObjectStyle+[osDoesTemperWithColorsOrFaceWinding];
   if FMeshObjects=nil then
      FMeshObjects:=TMeshObjectList.CreateOwned(Self);
   if FSkeleton=nil then
      FSkeleton:=TSkeleton.CreateOwned(Self);
   FUseMeshMaterials:=True;
   FAutoCentering:=[];
   FAxisAlignedDimensionsCache[0]:=-1;
end;

// Destroy
//
destructor TGLBaseMesh.Destroy;
begin
   FConnectivity.Free;
   DropMaterialLibraryCache;
   FSkeleton.Free;
   FMeshObjects.Free;
   inherited Destroy;
end;

// Assign
//
procedure TGLBaseMesh.Assign(Source: TPersistent);
begin
   if Source is TGLBaseMesh then begin
      FNormalsOrientation:=TGLBaseMesh(Source).FNormalsOrientation;
      FMaterialLibrary:=TGLBaseMesh(Source).FMaterialLibrary;
      FLightmapLibrary:=TGLBaseMesh(Source).FLightmapLibrary;
      FAxisAlignedDimensionsCache:=TGLBaseMesh(Source).FAxisAlignedDimensionsCache;
      FUseMeshMaterials:=TGLBaseMesh(Source).FUseMeshMaterials;
      FOverlaySkeleton:=TGLBaseMesh(Source).FOverlaySkeleton;
      FIgnoreMissingTextures:=TGLBaseMesh(Source).FIgnoreMissingTextures;
      FAutoCentering:=TGLBaseMesh(Source).FAutoCentering;
      FSkeleton.Assign(TGLBaseMesh(Source).FSkeleton);
      FMeshObjects.Assign(TGLBaseMesh(Source).FMeshObjects);
   end;
   inherited Assign(Source);
end;

// LoadFromFile
//
procedure TGLBaseMesh.LoadFromFile(const filename : String);
var
   fs : TStream;
begin
   if fileName<>'' then begin
      fs:=CreateFileStream(fileName, fmOpenRead+fmShareDenyWrite);
      try
         LoadFromStream(fileName, fs);
      finally
         fs.Free;
      end;
   end;
end;

// LoadFromStream
//
procedure TGLBaseMesh.LoadFromStream(const fileName : String; aStream : TStream);
var
   newVectorFile : TVectorFile;
   vectorFileClass : TVectorFileClass;
begin
   if fileName<>'' then begin
      MeshObjects.Clear;
      Skeleton.Clear;
      vectorFileClass:=GetVectorFileFormats.FindFromFileName(filename);
      newVectorFile:=VectorFileClass.Create(Self);
      try
         newVectorFile.ResourceName:=filename;
         PrepareVectorFile(newVectorFile);
         if Assigned(Scene) then Scene.BeginUpdate;
         try
            newVectorFile.LoadFromStream(aStream);
         finally
            if Assigned(Scene) then Scene.EndUpdate;
         end;
      finally
         newVectorFile.Free;
      end;
      PerformAutoCentering;
      PrepareMesh;
   end;
end;

// SaveToFile
//
procedure TGLBaseMesh.SaveToFile(const filename : String);
var
   fs : TStream;
begin
   if fileName<>'' then begin
      fs:=CreateFileStream(fileName, fmCreate);
      try
         SaveToStream(fileName, fs);
      finally
         fs.Free;
      end;
   end;
end;

// SaveToStream
//
procedure TGLBaseMesh.SaveToStream(const fileName : String; aStream : TStream);
var
   newVectorFile : TVectorFile;
   vectorFileClass : TVectorFileClass;
begin
   if fileName<>'' then begin
      vectorFileClass:=GetVectorFileFormats.FindFromFileName(filename);
      newVectorFile:=VectorFileClass.Create(Self);
      try
         newVectorFile.ResourceName:=filename;
         PrepareVectorFile(newVectorFile);
         newVectorFile.SaveToStream(aStream);
      finally
         newVectorFile.Free;
      end;
   end;
end;

// AddDataFromFile
//
procedure TGLBaseMesh.AddDataFromFile(const filename : String);
var
   fs : TStream;
begin
   if fileName<>'' then begin
      fs:=CreateFileStream(fileName, fmOpenRead+fmShareDenyWrite);
      try
         AddDataFromStream(fileName, fs);
      finally
         fs.Free;
      end;
   end;
end;

// AddDataFromStream
//
procedure TGLBaseMesh.AddDataFromStream(const filename : String; aStream : TStream);
var
   newVectorFile : TVectorFile;
   vectorFileClass : TVectorFileClass;
begin
   if fileName <> '' then begin
      vectorFileClass:=GetVectorFileFormats.FindFromFileName(filename);
      newVectorFile:=VectorFileClass.Create(Self);
      newVectorFile.ResourceName:=filename;
      PrepareVectorFile(newVectorFile);
      try
         if Assigned(Scene) then Scene.BeginUpdate;
         newVectorFile.LoadFromStream(aStream);
         if Assigned(Scene) then Scene.EndUpdate;
      finally
         NewVectorFile.Free;
      end;
      PrepareMesh;
   end;
end;

// GetExtents
//
procedure TGLBaseMesh.GetExtents(var min, max : TAffineVector);
var
   i, k : Integer;
   lMin, lMax : TAffineVector;
const
   cBigValue : Single = 1e50;
   cSmallValue : Single = -1e50;
begin
   SetVector(min, cBigValue, cBigValue, cBigValue);
   SetVector(max, cSmallValue, cSmallValue, cSmallValue);
   for i:=0 to MeshObjects.Count-1 do begin
      TMeshObject(MeshObjects[i]).GetExtents(lMin, lMax);
      for k:=0 to 2 do begin
          if lMin[k]<min[k] then min[k]:=lMin[k];
          if lMax[k]>max[k] then max[k]:=lMax[k];
      end;
   end;
end;

// GetBarycenter
//
function TGLBaseMesh.GetBarycenter : TAffineVector;
var
   i, nb : Integer;
begin
   Result:=NullVector;
   nb:=0;
   for i:=0 to MeshObjects.Count-1 do
      TMeshObject(MeshObjects[i]).ContributeToBarycenter(Result, nb);
   if nb>0 then
      ScaleVector(Result, 1/nb);
end;

// SetMaterialLibrary
//
procedure TGLBaseMesh.SetMaterialLibrary(const val : TGLMaterialLibrary);
begin
   if FMaterialLibrary<>val then begin
      if FMaterialLibraryCachesPrepared then
         DropMaterialLibraryCache;
      if Assigned(FMaterialLibrary) then begin
         DestroyHandle;
         FMaterialLibrary.RemoveFreeNotification(Self);
      end;
      FMaterialLibrary:=val;
      if Assigned(FMaterialLibrary) then
         FMaterialLibrary.FreeNotification(Self);
      StructureChanged;
   end;
end;

// SetMaterialLibrary
//
procedure TGLBaseMesh.SetLightmapLibrary(const val : TGLMaterialLibrary);
begin
   if FLightmapLibrary<>val then begin
      if Assigned(FLightmapLibrary) then begin
         DestroyHandle;
         FLightmapLibrary.RemoveFreeNotification(Self);
      end;
      FLightmapLibrary:=val;
      if Assigned(FLightmapLibrary) then
         FLightmapLibrary.FreeNotification(Self);
      StructureChanged;
   end;
end;

// SetNormalsOrientation
//
procedure TGLBaseMesh.SetNormalsOrientation(const val : TMeshNormalsOrientation);
begin
   if val<>FNormalsOrientation then begin
      FNormalsOrientation:=val;
      StructureChanged;
   end;
end;

// SetOverlaySkeleton
//
procedure TGLBaseMesh.SetOverlaySkeleton(const val : Boolean);
begin
   if FOverlaySkeleton<>val then begin
      FOverlaySkeleton:=val;
      NotifyChange(Self);
   end;
end;

// Notification
//
procedure TGLBaseMesh.Notification(AComponent: TComponent; Operation: TOperation);
begin
   if Operation=opRemove then begin
      if AComponent=FMaterialLibrary then
         MaterialLibrary:=nil
      else if AComponent=FLightmapLibrary then
         LightmapLibrary:=nil;
   end;
   inherited;
end;

// AxisAlignedDimensions
//
{
function TGLBaseMesh.AxisAlignedDimensions : TVector;
var
   dMin, dMax : TAffineVector;
begin
   if FAxisAlignedDimensionsCache[0]<0 then begin
      MeshObjects.GetExtents(dMin, dMax);
      FAxisAlignedDimensionsCache[0]:=MaxFloat(Abs(dMin[0]), Abs(dMax[0]));
      FAxisAlignedDimensionsCache[1]:=MaxFloat(Abs(dMin[1]), Abs(dMax[1]));
      FAxisAlignedDimensionsCache[2]:=MaxFloat(Abs(dMin[2]), Abs(dMax[2]));
   end;
   SetVector(Result, FAxisAlignedDimensionsCache);
   ScaleVector(Result,Scale.AsVector);  //added by DanB
end;
}
// AxisAlignedDimensionsUnscaled
//
function TGLBaseMesh.AxisAlignedDimensionsUnscaled : TVector;
var
   dMin, dMax : TAffineVector;
begin
   if FAxisAlignedDimensionsCache[0]<0 then begin
      MeshObjects.GetExtents(dMin, dMax);
      FAxisAlignedDimensionsCache[0]:=MaxFloat(Abs(dMin[0]), Abs(dMax[0]));
      FAxisAlignedDimensionsCache[1]:=MaxFloat(Abs(dMin[1]), Abs(dMax[1]));
      FAxisAlignedDimensionsCache[2]:=MaxFloat(Abs(dMin[2]), Abs(dMax[2]));
   end;
   SetVector(Result, FAxisAlignedDimensionsCache);
end;

// DestroyHandle
//
procedure TGLBaseMesh.DestroyHandle;
begin
   if Assigned(FMaterialLibrary) then
      MaterialLibrary.DestroyHandles;
   if Assigned(FLightmapLibrary) then
      LightmapLibrary.DestroyHandles;
   inherited;
end;

// PrepareVectorFile
//
procedure TGLBaseMesh.PrepareVectorFile(aFile : TVectorFile);
begin
   aFile.NormalsOrientation:=NormalsOrientation;
end;

// PerformAutoCentering
//
procedure TGLBaseMesh.PerformAutoCentering;
var
   delta, min, max : TAffineVector;
begin
   if macUseBarycenter in AutoCentering then begin
      delta:=VectorNegate(GetBarycenter);
   end else begin
      GetExtents(min, max);
      if macCenterX in AutoCentering then
         delta[0]:=-0.5*(min[0]+max[0])
      else delta[0]:=0;
      if macCenterY in AutoCentering then
         delta[1]:=-0.5*(min[1]+max[1])
      else delta[1]:=0;
      if macCenterZ in AutoCentering then
         delta[2]:=-0.5*(min[2]+max[2])
      else delta[2]:=0;
   end;
   MeshObjects.Translate(delta);
end;

// PrepareMesh
//
procedure TGLBaseMesh.PrepareMesh;
begin
   StructureChanged;
end;

// PrepareMaterialLibraryCache
//
procedure TGLBaseMesh.PrepareMaterialLibraryCache;
begin
   if FMaterialLibraryCachesPrepared then
      DropMaterialLibraryCache;
   MeshObjects.PrepareMaterialLibraryCache(FMaterialLibrary);
   FMaterialLibraryCachesPrepared:=True;
end;

// DropMaterialLibraryCache
//
procedure TGLBaseMesh.DropMaterialLibraryCache;
begin
   if FMaterialLibraryCachesPrepared then begin
      MeshObjects.DropMaterialLibraryCache;
      FMaterialLibraryCachesPrepared:=False;
   end;
end;

// PrepareBuildList
//
procedure TGLBaseMesh.PrepareBuildList(var mrci : TRenderContextInfo);
begin
   MeshObjects.PrepareBuildList(mrci);
end;

// SetUseMeshMaterials
//
procedure TGLBaseMesh.SetUseMeshMaterials(const val : Boolean);
begin
   if val<>FUseMeshMaterials then begin
      FUseMeshMaterials:=val;
      if FMaterialLibraryCachesPrepared and (not val) then
         DropMaterialLibraryCache;
      StructureChanged;
   end;
end;

// BuildList
//
procedure TGLBaseMesh.BuildList(var rci : TRenderContextInfo);
begin
   MeshObjects.BuildList(rci);
end;

// DoRender
//
procedure TGLBaseMesh.DoRender(var rci : TRenderContextInfo;
                               renderSelf, renderChildren : Boolean);
begin
   if Assigned(LightmapLibrary) then
      xglForbidSecondTextureUnit;
   if renderSelf then begin
      // set winding
      case FNormalsOrientation of
         mnoDefault : ;// nothing
         mnoInvert : InvertGLFrontFace;
      else
         Assert(False);
      end;
      if not rci.ignoreMaterials then begin
         if UseMeshMaterials and Assigned(MaterialLibrary) then begin
            rci.materialLibrary:=MaterialLibrary;
            if not FMaterialLibraryCachesPrepared then
               PrepareMaterialLibraryCache;
         end else rci.materialLibrary:=nil;
         if Assigned(LightmapLibrary) then
            rci.lightmapLibrary:=LightmapLibrary
         else rci.lightmapLibrary:=nil;
         PrepareBuildList(rci);
         Material.Apply(rci);
         repeat
            if (osDirectDraw in ObjectStyle) or rci.amalgamating then
               BuildList(rci)
            else glCallList(GetHandle(rci));
         until not Material.UnApply(rci);
         rci.materialLibrary:=nil;
      end else begin
         if (osDirectDraw in ObjectStyle) or rci.amalgamating then
            BuildList(rci)
         else glCallList(GetHandle(rci));
      end;
      if FNormalsOrientation<>mnoDefault then
         InvertGLFrontFace;
   end;
   if Assigned(LightmapLibrary) then
      xglAllowSecondTextureUnit;
   if renderChildren and (Count>0) then
      Self.RenderChildren(0, Count-1, rci);
end;

// StructureChanged
//
procedure TGLBaseMesh.StructureChanged;
begin
   FAxisAlignedDimensionsCache[0]:=-1;
   DropMaterialLibraryCache;
   MeshObjects.Prepare;
   inherited;
end;

// StructureChangedNoPrepare
//
procedure TGLBaseMesh.StructureChangedNoPrepare;
begin
   inherited StructureChanged;
end;

// RayCastIntersect
//
function TGLBaseMesh.RayCastIntersect(const rayStart, rayVector : TVector;
                                    intersectPoint : PVector = nil;
                                    intersectNormal : PVector = nil) : Boolean;
var
   i : Integer;
   tris : TAffineVectorList;
   locRayStart, locRayVector, iPoint, iNormal : TVector;
   d, minD : Single;
begin
   // BEWARE! Utterly inefficient implementation!
   tris:=MeshObjects.ExtractTriangles;
   try
      SetVector(locRayStart,  AbsoluteToLocal(rayStart));
      SetVector(locRayVector, AbsoluteToLocal(rayVector));
      minD:=-1;
      i:=0; while i<tris.Count do begin
         if RayCastTriangleIntersect(locRayStart, locRayVector,
                                     tris.List[i], tris.List[i+1], tris.List[i+2],
                                     @iPoint, @iNormal) then begin
            d:=VectorDistance2(locRayStart, iPoint);
            if (d<minD) or (minD<0) then begin
               minD:=d;
               if intersectPoint<>nil then
                  intersectPoint^:=iPoint;
               if intersectNormal<>nil then
                  intersectNormal^:=iNormal;
            end;
         end;
         Inc(i, 3);
      end;
   finally
      tris.Free;
   end;
   Result:=(minD>=0);
   if Result then begin
      if intersectPoint<>nil then
         SetVector(intersectPoint^,  LocalToAbsolute(intersectPoint^));
      if intersectNormal<>nil then begin
         SetVector(intersectNormal^, LocalToAbsolute(intersectNormal^));
         if NormalsOrientation=mnoInvert then
            NegateVector(intersectNormal^);
      end;
   end;
end;

// GenerateSilhouette
//
function TGLBaseMesh.GenerateSilhouette(const silhouetteParameters : TGLSilhouetteParameters) : TGLSilhouette;
var
   mc : TGLBaseMeshConnectivity;
   sil : TGLSilhouette;
begin
   sil:=nil;
   if Assigned(FConnectivity) then begin
      mc:=TGLBaseMeshConnectivity(FConnectivity);
      mc.CreateSilhouette(silhouetteParameters,
                              sil,
                              true);
   end else begin
      mc:=TGLBaseMeshConnectivity.CreateFromMesh(Self);
      try
         mc.CreateSilhouette(silhouetteParameters,
                                 sil,
                                 true);
      finally
         mc.Free;
      end;
   end;
   Result:=sil;
end;

// BuildSilhouetteConnectivityData
//
procedure TGLBaseMesh.BuildSilhouetteConnectivityData;
var
   i, j : Integer;
   mo : TMeshObject;
begin
   FreeAndNil(FConnectivity);
   // connectivity data works only on facegroups of TFGVertexIndexList class
   for i:=0 to MeshObjects.Count-1 do begin
      mo:=(MeshObjects[i] as TMeshObject);
      if mo.Mode<>momFacegroups then Exit;
      for j:=0 to mo.FaceGroups.Count-1 do
         if not mo.FaceGroups[j].InheritsFrom(TFGVertexIndexList) then Exit;
   end;
   FConnectivity:=TGLBaseMeshConnectivity.CreateFromMesh(Self);
end;

// ------------------
// ------------------ TGLFreeForm ------------------
// ------------------

// Create
//
constructor TGLFreeForm.Create(AOwner:TComponent);
begin
   inherited;
   FUseMeshMaterials:=True;
end;

// Destroy
//
destructor TGLFreeForm.Destroy;
begin
   FOctree.Free;
   inherited Destroy;
end;

// GetOctree
//
function TGLFreeForm.GetOctree : TOctree;
begin
//   if not Assigned(FOctree) then     //If auto-created, can never use "if Assigned(GLFreeform1.Octree)"
//     FOctree:=TOctree.Create;        //moved this code to BuildOctree
   Result:=FOctree;
end;

// BuildOctree
//
procedure TGLFreeForm.BuildOctree;
var
   emin, emax : TAffineVector;
   tl : TAffineVectorList;
begin
   if not Assigned(FOctree) then        //moved here from GetOctree
      FOctree:=TOctree.Create;

   GetExtents(emin, emax);
   tl:=MeshObjects.ExtractTriangles;
   try
      with Octree do begin
         DisposeTree;
         InitializeTree(emin, emax, tl, 3);
      end;
   finally
      tl.Free;
   end;
end;

// OctreeRayCastIntersect
//
function TGLFreeForm.OctreeRayCastIntersect(const rayStart, rayVector : TVector;
                                          intersectPoint : PVector = nil;
                                          intersectNormal : PVector = nil) : Boolean;
var
   locRayStart, locRayVector : TVector;
begin
   Assert(Assigned(FOctree), 'Octree must have been prepared and setup before use.');
   SetVector(locRayStart,  AbsoluteToLocal(rayStart));
   SetVector(locRayVector, AbsoluteToLocal(rayVector));
   Result:=Octree.RayCastIntersect(locRayStart, locRayVector,
                                       intersectPoint, intersectNormal);
   if Result then begin
      if intersectPoint<>nil then
         SetVector(intersectPoint^,  LocalToAbsolute(intersectPoint^));
      if intersectNormal<>nil then begin
         SetVector(intersectNormal^, LocalToAbsolute(intersectNormal^));
         if NormalsOrientation=mnoInvert then
            NegateVector(intersectNormal^);
      end;
   end;
end;

// OctreeSphereIntersect
//
function TGLFreeForm.OctreeSphereSweepIntersect(const rayStart, rayVector : TVector;
                                         const velocity, radius: Single;
                                         intersectPoint : PVector = nil;
                                         intersectNormal : PVector = nil) : Boolean;
var
   locRayStart, locRayVector : TVector;
begin
   Assert(Assigned(FOctree), 'Octree must have been prepared and setup before use.');
   SetVector(locRayStart,  AbsoluteToLocal(rayStart));
   SetVector(locRayVector, AbsoluteToLocal(rayVector));
   Result:=Octree.SphereSweepIntersect(locRayStart, locRayVector,
                                      velocity, radius,
                                      intersectPoint, intersectNormal);
   if Result then begin
      if intersectPoint<>nil then
         SetVector(intersectPoint^,  LocalToAbsolute(intersectPoint^));
      if intersectNormal<>nil then begin
         SetVector(intersectNormal^, LocalToAbsolute(intersectNormal^));
         if NormalsOrientation=mnoInvert then
            NegateVector(intersectNormal^);
      end;
   end;
end;

// OctreeTriangleIntersect
//
function TGLFreeForm.OctreeTriangleIntersect(const v1, v2, v3: TAffineVector): boolean;
var
  t1, t2, t3: TAffineVector;
begin
   Assert(Assigned(FOctree), 'Octree must have been prepared and setup before use.');
   SetVector(t1, AbsoluteToLocal(v1));
   SetVector(t2, AbsoluteToLocal(v2));
   SetVector(t3, AbsoluteToLocal(v3));

   Result:= Octree.TriangleIntersect(t1, t2, t3);
end;


// OctreeAABBIntersect
//
function TGLFreeForm.OctreeAABBIntersect(const AABB: TAABB;
objMatrix, invObjMatrix: TMatrix; triangles:TAffineVectorList = nil): boolean;
var
  m1to2, m2to1: TMatrix;
begin
     Assert(Assigned(FOctree), 'Octree must have been prepared and setup before use.');

     //get matrixes needed
     //object to self
     MatrixMultiply(objMatrix, InvAbsoluteMatrix, m1to2);
     //self to object
     MatrixMultiply( AbsoluteMatrix,invObjMatrix, m2to1);

     result:=octree.AABBIntersect(aabb,m1to2,m2to1,triangles);
end;

// ------------------
// ------------------ TActorAnimation ------------------
// ------------------

// Create
//
constructor TActorAnimation.Create(Collection : TCollection);
begin
	inherited Create(Collection);
end;

// Destroy
//
destructor TActorAnimation.Destroy;
begin
   with (Collection as TActorAnimations).owner do
      if FTargetSmoothAnimation=Self then
         FTargetSmoothAnimation:=nil;
	inherited Destroy;
end;

// Assign
//
procedure TActorAnimation.Assign(Source: TPersistent);
begin
	if Source is TActorAnimation then begin
      FName:=TActorAnimation(Source).FName;
      FStartFrame:=TActorAnimation(Source).FStartFrame;
      FEndFrame:=TActorAnimation(Source).FEndFrame;
      FReference:=TActorAnimation(Source).FReference;
	end else inherited;
end;

// GetDisplayName
//
function TActorAnimation.GetDisplayName : String;
begin
	Result:=Format('%d - %s [%d - %d]', [Index, Name, StartFrame, EndFrame]);
end;

// FrameCount
//
function TActorAnimation.FrameCount : Integer;
begin
   case Reference of
      aarMorph :
         Result:=TActorAnimations(Collection).Owner.MeshObjects.MorphTargetCount;
      aarSkeleton :
         Result:=TActorAnimations(Collection).Owner.Skeleton.Frames.Count;
   else
      Result:=0;
      Assert(False);
   end;
end;

// SetStartFrame
//
procedure TActorAnimation.SetStartFrame(const val : Integer);
var
   m : Integer;
begin
   if val<0 then
      FStartFrame:=0
   else begin
      m:=FrameCount;
      if val>=m then
         FStartFrame:=m-1
      else FStartFrame:=val;
   end;
   if FStartFrame>FEndFrame then
      FEndFrame:=FStartFrame;
end;

// SetEndFrame
//
procedure TActorAnimation.SetEndFrame(const val : Integer);
var
   m : Integer;
begin
   if val<0 then
      FEndFrame:=0
   else begin
      m:=FrameCount;
      if val>=m then
        FEndFrame:=m-1
      else FEndFrame:=val;
   end;
   if FStartFrame>FEndFrame then
      FStartFrame:=FEndFrame;
end;

// SetReference
//
procedure TActorAnimation.SetReference(val : TActorAnimationReference);
begin
   if val<>FReference then begin
      FReference:=val;
      StartFrame:=StartFrame;
      EndFrame:=EndFrame;
   end;
end;

// SetAsString
//
procedure TActorAnimation.SetAsString(const val : String);
var
   sl : TStringList;
begin
   sl:=TStringList.Create;
   try
      sl.CommaText:=val;
      Assert(sl.Count>=3);
      FName:=sl[0];
      FStartFrame:=StrToInt(sl[1]);
      FEndFrame:=StrToInt(sl[2]);
      if sl.Count=4 then begin
         if LowerCase(sl[3])='morph' then
            Reference:=aarMorph
         else if LowerCase(sl[3])='skeleton' then
            Reference:=aarSkeleton
         else Assert(False);
      end else Reference:=aarMorph;
   finally
      sl.Free;
   end;
end;

// GetAsString
//
function TActorAnimation.GetAsString : String;
const
   cAARToString : array [aarMorph..aarSkeleton] of String = ('morph', 'skeleton');
begin
   Result:=Format('"%s",%d,%d,%s',
                  [FName, FStartFrame, FEndFrame, cAARToString[Reference]]);
end;

// OwnerActor
//
function TActorAnimation.OwnerActor : TGLActor;
begin
   Result:=((Collection as TActorAnimations).GetOwner as TGLActor);
end;

// MakeSkeletalTranslationStatic
//
procedure TActorAnimation.MakeSkeletalTranslationStatic;
begin
   OwnerActor.Skeleton.MakeSkeletalTranslationStatic(StartFrame, EndFrame);
end;

// MakeSkeletalRotationDelta
//
procedure TActorAnimation.MakeSkeletalRotationDelta;
begin
   OwnerActor.Skeleton.MakeSkeletalRotationDelta(StartFrame, EndFrame);
end;

// ------------------
// ------------------ TActorAnimations ------------------
// ------------------

// Create
//
constructor TActorAnimations.Create(AOwner : TGLActor);
begin
	Owner:=AOwner;
	inherited Create(TActorAnimation);
end;

// GetOwner
//
function TActorAnimations.GetOwner: TPersistent;
begin
	Result:=Owner;
end;

// SetItems
//
procedure TActorAnimations.SetItems(index : Integer; const val : TActorAnimation);
begin
	inherited Items[index]:=val;
end;

// GetItems
//
function TActorAnimations.GetItems(index : Integer) : TActorAnimation;
begin
	Result:=TActorAnimation(inherited Items[index]);
end;

// Add
//
function TActorAnimations.Add: TActorAnimation;
begin
	Result:=(inherited Add) as TActorAnimation;
end;

// FindItemID
//
function TActorAnimations.FindItemID(ID: Integer): TActorAnimation;
begin
	Result:=(inherited FindItemID(ID)) as TActorAnimation;
end;

// FindName
//
function TActorAnimations.FindName(const aName : String) : TActorAnimation;
var
   i : Integer;
begin
	Result:=nil;
   for i:=0 to Count-1 do if CompareText(Items[i].Name, aName)=0 then begin
      Result:=Items[i];
      Break;
   end;
end;

// FindFrame
//
function TActorAnimations.FindFrame(aFrame : Integer;
                        aReference : TActorAnimationReference) : TActorAnimation;
var
   i : Integer;
begin
	Result:=nil;
   for i:=0 to Count-1 do with Items[i] do
      if (StartFrame<=aFrame) and (EndFrame>=aFrame)
            and (Reference=aReference) then begin
         Result:=Items[i];
         Break;
      end;
end;

// SetToStrings
//
procedure TActorAnimations.SetToStrings(aStrings : TStrings);

var
   i : Integer;
begin
   with aStrings do begin
      BeginUpdate;
      Clear;
      for i:=0 to Self.Count-1 do
         Add(Self.Items[i].Name);
      EndUpdate;
   end;
end;

// SaveToStream
//
procedure TActorAnimations.SaveToStream(aStream : TStream);
var
   i : Integer;
begin
   WriteCRLFString(aStream, cAAFHeader);
   WriteCRLFString(aStream, IntToStr(Count));
   for i:=0 to Count-1 do
      WriteCRLFString(aStream, Items[i].AsString);
end;

// LoadFromStream
//
procedure TActorAnimations.LoadFromStream(aStream : TStream);
var
   i, n : Integer;
begin
   Clear;
   if ReadCRLFString(aStream)<>cAAFHeader then Assert(False);
   n:=StrToInt(ReadCRLFString(aStream));
   for i:=0 to n-1 do
      Add.AsString:=ReadCRLFString(aStream);
end;

// SaveToFile
//
procedure TActorAnimations.SaveToFile(const fileName : String);
var
   fs : TStream;
begin
   fs:=CreateFileStream(fileName, fmCreate);
   try
      SaveToStream(fs);
   finally
      fs.Free;
   end;
end;

// LoadFromFile
//
procedure TActorAnimations.LoadFromFile(const fileName : String);
var
   fs : TStream;
begin
   fs:=CreateFileStream(fileName, fmOpenRead+fmShareDenyWrite);
   try
      LoadFromStream(fs);
   finally
      fs.Free;
   end;
end;

// ------------------
// ------------------ TGLAnimationControler ------------------
// ------------------

// Create
//
constructor TGLAnimationControler.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);
end;

// Destroy
//
destructor TGLAnimationControler.Destroy;
begin
   SetActor(nil);
	inherited Destroy;
end;

// Notification
//
procedure TGLAnimationControler.Notification(AComponent: TComponent; Operation: TOperation);
begin
   if (AComponent=FActor) and (Operation=opRemove) then
      SetActor(nil);
   inherited;
end;

// DoChange
//
procedure TGLAnimationControler.DoChange;
begin
   if Assigned(FActor) and (AnimationName<>'') then
      FActor.NotifyChange(Self);
end;

// SetActor
//
procedure TGLAnimationControler.SetActor(const val : TGLActor);
begin
   if FActor<>val then begin
      if Assigned(FActor) then
         FActor.UnRegisterControler(Self);
      FActor:=val;
      if Assigned(FActor) then begin
         FActor.RegisterControler(Self);
         DoChange;
      end;
   end;
end;

// SetAnimationName
//
procedure TGLAnimationControler.SetAnimationName(const val : TActorAnimationName);
begin
   if FAnimationName<>val then begin
      FAnimationName:=val;
      DoChange;
   end;
end;

// SetRatio
//
procedure TGLAnimationControler.SetRatio(const val : Single);
begin
   if FRatio<>val then begin
      FRatio:=ClampValue(val, 0, 1);
      DoChange;
   end;
end;

// Apply
//
function TGLAnimationControler.Apply(var lerpInfo : TBlendedLerpInfo) : Boolean;
var
   anim : TActorAnimation;
   baseDelta : Integer;
begin
   anim:=Actor.Animations.FindName(AnimationName);
   Result:=(anim<>nil);
   if not Result then Exit;

   with lerpInfo do begin
      if Ratio=0 then begin
         frameIndex1:=anim.StartFrame;
         frameIndex2:=frameIndex1;
         lerpFactor:=0;
      end else if Ratio=1 then begin
         frameIndex1:=anim.EndFrame;
         frameIndex2:=frameIndex1;
         lerpFactor:=0;
      end else begin
         baseDelta:=anim.EndFrame-anim.StartFrame;
         lerpFactor:=anim.StartFrame+baseDelta*Ratio;
         frameIndex1:=Geometry.Trunc(lerpFactor);
         frameIndex2:=frameIndex1+1;
         lerpFactor:=Geometry.Frac(lerpFactor);
      end;
      weight:=1;
   end;
end;

// ------------------
// ------------------ TGLActor ------------------
// ------------------

// Create
//
constructor TGLActor.Create(AOwner:TComponent);
begin
   inherited Create(AOwner);
   ObjectStyle:=ObjectStyle+[osDirectDraw];
   FFrameInterpolation:=afpLinear;
   FAnimationMode:=aamNone;
   FInterval:=100; // 10 animation frames per second
   FAnimations:=TActorAnimations.Create(Self);
   FControlers:=nil; // created on request
   FOptions:=cDefaultGLActorOptions;
end;

// Destroy
//
destructor TGLActor.Destroy;
begin
   inherited Destroy;
   FControlers.Free;
   FAnimations.Free;
end;

// Assign
//
procedure TGLActor.Assign(Source: TPersistent);
begin
   inherited Assign(Source);
   if Source is TGLActor then begin
      FAnimations.Assign(TGLActor(Source).FAnimations);
      FAnimationMode:=TGLActor(Source).FAnimationMode;
      Synchronize(TGLActor(Source));
   end;
end;

// RegisterControler
//
procedure TGLActor.RegisterControler(aControler : TGLAnimationControler);
begin
   if not Assigned(FControlers) then
      FControlers:=TList.Create;
   FControlers.Add(aControler);
   FreeNotification(aControler);
end;

// UnRegisterControler
//
procedure TGLActor.UnRegisterControler(aControler : TGLAnimationControler);
begin
   Assert(Assigned(FControlers));
   FControlers.Remove(aControler);
   RemoveFreeNotification(aControler);
   if FControlers.Count=0 then
      FreeAndNil(FControlers);
end;

// SetCurrentFrame
//
procedure TGLActor.SetCurrentFrame(val : Integer);
begin
   if val<>CurrentFrame then begin
      if val>FrameCount-1 then
         FCurrentFrame:=FrameCount-1
      else if val<0 then
         FCurrentFrame:=0
      else FCurrentFrame:=val;
      FCurrentFrameDelta:=0;
      case AnimationMode of
         aamPlayOnce :
            if CurrentFrame=EndFrame then FAnimationMode:=aamNone;
         aamBounceForward :
            if CurrentFrame=EndFrame then FAnimationMode:=aamBounceBackward;
         aamBounceBackward :
            if CurrentFrame=StartFrame then FAnimationMode:=aamBounceForward;
      end;
      StructureChanged;
      if Assigned(FOnFrameChanged) then FOnFrameChanged(Self);
   end;
end;

// SetStartFrame
//
procedure TGLActor.SetStartFrame(val : Integer);
begin
   if (val>=0) and (val<FrameCount) and (val<>StartFrame) then
      FStartFrame:=val;
   if EndFrame<StartFrame then
      FEndFrame:=FStartFrame;
   if CurrentFrame<StartFrame then
      CurrentFrame:=FStartFrame;
end;

// SetEndFrame
//
procedure TGLActor.SetEndFrame(val : Integer);
begin
   if (val>=0) and (val<FrameCount) and (val<>EndFrame) then
      FEndFrame:=val;
   if CurrentFrame>EndFrame then
      CurrentFrame:=FEndFrame;
end;

// SetReference
//
procedure TGLActor.SetReference(val : TActorAnimationReference);
begin
   if val<>Reference then begin
      FReference:=val;
      StartFrame:=StartFrame;
      EndFrame:=EndFrame;
      CurrentFrame:=CurrentFrame;
      StructureChanged;
   end;
end;

// SetAnimations
//
procedure TGLActor.SetAnimations(const val : TActorAnimations);
begin
   FAnimations.Assign(val);
end;

// StoreAnimations
//
function TGLActor.StoreAnimations : Boolean;
begin
   Result:=(FAnimations.Count>0);
end;

// SetOptions
//
procedure TGLActor.SetOptions(const val : TGLActorOptions);
begin
   if val<>FOptions then begin
      FOptions:=val;
      StructureChanged;
   end;
end;

// NextFrameIndex
//
function TGLActor.NextFrameIndex : Integer;
begin
   case AnimationMode of
      aamLoop, aamBounceForward : begin
         if FTargetSmoothAnimation<>nil then
            Result:=FTargetSmoothAnimation.StartFrame
         else begin
            Result:=CurrentFrame+1;
            if Result>EndFrame then begin
               Result:=StartFrame+(Result-EndFrame-1);
               if Result>EndFrame then
                  Result:=EndFrame;
            end;
         end;
      end;
      aamNone, aamPlayOnce : begin
         if FTargetSmoothAnimation<>nil then
            Result:=FTargetSmoothAnimation.StartFrame
         else begin
            Result:=CurrentFrame+1;
            if Result>EndFrame then
               Result:=EndFrame;
         end;
      end;
      aamBounceBackward : begin
         if FTargetSmoothAnimation<>nil then
            Result:=FTargetSmoothAnimation.StartFrame
         else begin
            Result:=CurrentFrame-1;
            if Result<StartFrame then begin
               Result:=EndFrame-(StartFrame-Result-1);
               if Result<StartFrame then
                  Result:=StartFrame;
            end;
         end;
      end;
   else
      Result:=CurrentFrame;
      Assert(False);
   end;
end;

// NextFrame
//
procedure TGLActor.NextFrame(nbSteps : Integer = 1);
var
   n : Integer;
begin
   n:=nbSteps;
   while n>0 do begin
      CurrentFrame:=NextFrameIndex;
      Dec(n);
      if Assigned(FOnEndFrameReached) and (CurrentFrame=EndFrame) then
         FOnEndFrameReached(Self);
      if Assigned(FOnStartFrameReached) and (CurrentFrame=StartFrame) then
         FOnStartFrameReached(Self);
   end;
end;

// PrevFrame
//
procedure TGLActor.PrevFrame(nbSteps : Integer = 1);
var
   value : Integer;
begin
   value:=FCurrentFrame-nbSteps;
   if value<FStartFrame then begin
      value:=FEndFrame-(FStartFrame-value);
      if value<FStartFrame then
         value:=FStartFrame;
   end;
   CurrentFrame:=Value;
end;

// BuildList
//
procedure TGLActor.BuildList(var rci : TRenderContextInfo);
var
   i, k : Integer;
   nextFrameIdx : Integer;
   lerpInfos : array of TBlendedLerpInfo;
begin
   nextFrameIdx:=NextFrameIndex;
   if nextFrameIdx>=0 then begin
      case Reference of
         aarMorph : begin
            case FrameInterpolation of
               afpLinear :
                  MeshObjects.Lerp(CurrentFrame, nextFrameIdx, CurrentFrameDelta)
            else
               MeshObjects.MorphTo(CurrentFrame);
            end;
         end;
         aarSkeleton : if Skeleton.Frames.Count>0 then begin
            if Assigned(FControlers) then begin
               // Blended Skeletal Lerping
               SetLength(lerpInfos, FControlers.Count+1);
               case FrameInterpolation of
                  afpLinear : with lerpInfos[0] do begin
                     frameIndex1:=CurrentFrame;
                     frameIndex2:=nextFrameIdx;
                     lerpFactor:=CurrentFrameDelta;
                     weight:=1;
                  end;
               else
                  with lerpInfos[0] do begin
                     frameIndex1:=CurrentFrame;
                     frameIndex2:=CurrentFrame;
                     lerpFactor:=0;
                     weight:=1;
                  end;
               end;
               k:=1;
               for i:=0 to FControlers.Count-1 do
                  if TGLAnimationControler(FControlers[i]).Apply(lerpInfos[k]) then
                     Inc(k);
               SetLength(lerpInfos, k);
               Skeleton.BlendedLerps(lerpInfos);
            end else begin
               // Single Skeletal Lerp
               case FrameInterpolation of
                  afpLinear :
                     Skeleton.Lerp(CurrentFrame, nextFrameIdx, CurrentFrameDelta);
               else
                  Skeleton.SetCurrentFrame(Skeleton.Frames[CurrentFrame]);
               end;
            end;
            Skeleton.MorphMesh(aoSkeletonNormalizeNormals in Options);
         end;
         aarNone : ; // do nothing
      end;
   end;
   inherited;
   if OverlaySkeleton then begin
      glPushAttrib(GL_ENABLE_BIT);
      glDisable(GL_DEPTH_TEST);
      Skeleton.RootBones.BuildList(rci);
      glPopAttrib;
   end;
end;

// PrepareMesh
//
procedure TGLActor.PrepareMesh;
begin
   FStartFrame:=0;
   FEndFrame:=FrameCount-1;
   FCurrentFrame:=0;
   if Assigned(FOnFrameChanged) then FOnFrameChanged(Self);
   inherited;
end;

// PrepareBuildList
//
procedure TGLActor.PrepareBuildList(var mrci : TRenderContextInfo);
begin
   // no preparation needed for actors, they don't use buildlists
end;

// FrameCount
//
function TGLActor.FrameCount : Integer;
begin
   case Reference of
      aarMorph :
         Result:=MeshObjects.MorphTargetCount;
      aarSkeleton :
         Result:=Skeleton.Frames.Count;
      aarNone :
         Result:=0;
   else
      Result:=0;
      Assert(False);
   end;
end;

// DoProgress
//
procedure TGLActor.DoProgress(const progressTime : TProgressTimes);
var
   fDelta : Single;
begin
   inherited;
   if (AnimationMode<>aamNone) and (Interval>0) then begin
      if (StartFrame<>EndFrame) and (FrameCount>1)  then begin
         FCurrentFrameDelta:=FCurrentFrameDelta+(progressTime.deltaTime*1000)/FInterval;
         if FCurrentFrameDelta>1 then begin
            if Assigned(FTargetSmoothAnimation) then begin
               SwitchToAnimation(FTargetSmoothAnimation);
               FTargetSmoothAnimation:=nil;
            end;
            // we need to step on
            fDelta:=Frac(FCurrentFrameDelta);
            NextFrame(Trunc(FCurrentFrameDelta));
            FCurrentFrameDelta:=fDelta;
            StructureChanged;
         end else if FrameInterpolation<>afpNone then
            StructureChanged;
      end;
   end;
end;

// LoadFromStream
//
procedure TGLActor.LoadFromStream(const fileName : String; aStream : TStream);
begin
   if fileName<>'' then begin
      Animations.Clear;
      inherited LoadFromStream(fileName, aStream);
   end;
end;

// SwitchToAnimation
//
procedure TGLActor.SwitchToAnimation(const animationName : String; smooth : Boolean = False);
begin
   SwitchToAnimation(Animations.FindName(animationName), smooth);
end;

// SwitchToAnimation
//
procedure TGLActor.SwitchToAnimation(animationIndex : Integer; smooth : Boolean = False);
begin
   if (animationIndex>=0) and (animationIndex<Animations.Count) then
      SwitchToAnimation(Animations[animationIndex], smooth);
end;

// SwitchToAnimation
//
procedure TGLActor.SwitchToAnimation(anAnimation : TActorAnimation; smooth : Boolean = False);
begin
   if Assigned(anAnimation) then begin
      if smooth then begin
         FTargetSmoothAnimation:=anAnimation;
         FCurrentFrameDelta:=0;
      end else begin
         Reference:=anAnimation.Reference;
         StartFrame:=anAnimation.StartFrame;
         EndFrame:=anAnimation.EndFrame;
         CurrentFrame:=StartFrame;
      end;
   end;
end;

// CurrentAnimation
//
function TGLActor.CurrentAnimation : String;
var
   aa : TActorAnimation;
begin
   aa:=Animations.FindFrame(CurrentFrame, Reference);
   if Assigned(aa) then
      Result:=aa.Name
   else Result:='';
end;

// Synchronize
//
procedure TGLActor.Synchronize(referenceActor : TGLActor);
begin
   if Assigned(referenceActor) then begin
      if referenceActor.StartFrame<FrameCount then
         FStartFrame:=referenceActor.StartFrame;
      if referenceActor.EndFrame<FrameCount then
         FEndFrame:=referenceActor.EndFrame;
      FReference:=referenceActor.Reference;
      if referenceActor.CurrentFrame<FrameCount then
         FCurrentFrame:=referenceActor.CurrentFrame;
      FCurrentFrameDelta:=referenceActor.CurrentFrameDelta;
      FAnimationMode:=referenceActor.AnimationMode;
      FFrameInterpolation:=referenceActor.FrameInterpolation;
      if referenceActor.FTargetSmoothAnimation<>nil then
         FTargetSmoothAnimation:=Animations.FindName(referenceActor.FTargetSmoothAnimation.Name)
      else FTargetSmoothAnimation:=nil;
   end;
end;


// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
initialization
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

   RegisterVectorFileFormat('glsm', 'GLScene Mesh', TGLGLSMVectorFile);

   RegisterClasses([TGLFreeForm, TGLActor, TSkeleton, TSkeletonFrame, TSkeletonBone,
                    TSkeletonMeshObject, TMeshObject, TSkeletonFrame, TMeshMorphTarget,
                    TMorphableMeshObject, TFaceGroup, TFGVertexIndexList,
                    TFGVertexNormalTexIndexList, TGLAnimationControler,
                    TFGIndexTexCoordList]);

finalization

   vVectorFileFormats.Free;

end.

