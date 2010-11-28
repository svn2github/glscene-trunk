{*******************************************************************************}
{                                                                               }
{      Newton Game Dynamics Delphi-Headertranslation                            }
{       Current SDK version 2.24                                                }
{                                                                               }
{      Copyright (c) 04,05,06,09,2010 Dmitriy "Executor" Bespalov		}
{                                     Stuart "Stucuk" Carey                     }
{                                     Sascha Willems                            }
{                                     Jon Walton                                }
{                                     Dominique Louis                           }
{                                                                               }
{      Initial Author : S.Spasov (Sury)                                         }
{                                                                               }
{*******************************************************************************}
{                                                                               }
{ License :                                                                     }
{                                                                               }
{  The contents of this file are used with permission, subject to               }
{  the Mozilla Public License Version 1.1 (the "License"); you may              }
{  not use this file except in compliance with the License. You may             }
{  obtain a copy of the License at                                              }
{  http://www.mozilla.org/MPL/MPL-1.1.html                                      }
{                                                                               }
{  Software distributed under the License is distributed on an                  }
{  "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or               }
{  implied. See the License for the specific language governing                 }
{  rights and limitations under the License.                                    }
{                                                                               }
{*******************************************************************************}
{                                                                               }
{  See "Readme_NewtonImport.txt" for more information and detailed history      }
{                                                                               }
{*******************************************************************************}

unit NewtonImport;

{$I delphinewton.inc}

// Note: Declare the following in Projects->Options->Conditionals not in this unit! - Stucuk
//{$DEFINE NEWTON_DOUBLE_PRECISION} // This is needed when you want to use double precision

interface

uses
{$IFDEF __GPC__}
  system,
  gpc,
{$ENDIF}

{$IFDEF UNIX}
{$IFDEF FPC}
{$IFDEF Ver1_0}
  linux,
{$ELSE}
  pthreads,
  baseunix,
  unix,
{$ENDIF}
  x,
  xlib,
{$ELSE}
  Types,
  Libc,
  Xlib,
{$ENDIF}
{$ENDIF}

{$IFDEF __MACH__}
  GPCMacOSAll,
{$ENDIF}
  Classes;

const
{$IFDEF WIN32}
  {$IFDEF NEWTONTUTORIAL}
   NewtonDLL = '..\..\sdk\dll\Newton.dll';
  {$ELSE}
   NewtonDLL = 'Newton.dll';
  {$ENDIF}
{$ENDIF}

{$IFDEF UNIX}
{$IFDEF DARWIN} // MacOS X
  NewtonDLL = 'libnewton.dylib';
{$ELSE}
  NewtonDLL = 'libNewton.so';
{$ENDIF}
{$ENDIF}

{$IFDEF MACOS}
  NewtonDLL = 'libnewton';
{$ENDIF}

// Note: Declare the following in Projects->Options->Conditionals not in this unit! - Stucuk
//{$DEFINE NEWTON_DOUBLE_PRECISION} // This is needed when you want to use double precision

const
NEWTON_PROFILER_WORLD_UPDATE                   =  0;
NEWTON_PROFILER_COLLISION_UPDATE               =  1;
NEWTON_PROFILER_FORCE_CALLBACK_UPDATE          =  2;
NEWTON_PROFILER_COLLISION_UPDATE_BROAD_PHASE   =  3;
NEWTON_PROFILER_COLLISION_UPDATE_NARROW_PHASE  =  4;
NEWTON_PROFILER_DYNAMICS_UPDATE                =  5;
NEWTON_PROFILER_DYNAMICS_CONSTRAINT_GRAPH      =  6;
NEWTON_PROFILER_DYNAMICS_SOLVE_CONSTRAINT_GRAP =  7;

SERIALIZE_ID_BOX                               =  0;
SERIALIZE_ID_CONE                              =  1;
SERIALIZE_ID_SPHERE                            =  2;
SERIALIZE_ID_CAPSULE                           =  3;
SERIALIZE_ID_CYLINDER                          =  4;
SERIALIZE_ID_COMPOUND                          =  5;
SERIALIZE_ID_CONVEXHULL                        =  6;
SERIALIZE_ID_CONVEXMODIFIER                    =  7;
SERIALIZE_ID_CHAMFERCYLINDER                   =  8;
SERIALIZE_ID_TREE                              =  9;
SERIALIZE_ID_NULL                              = 10;
SERIALIZE_ID_HEIGHTFIELD                       = 11;
SERIALIZE_ID_USERMESH                          = 12;
SERIALIZE_ID_SCENE                             = 13;
SERIALIZE_ID_COMPOUND_BREAKABLE                = 14;

(*Comment this line if you get weird errors*)
{$DEFINE NICE_CODE_PARAMS}

type
// *****************************************************************************************************************************
//
//  Data Types
//
// *****************************************************************************************************************************

{I did this to speed up the translation process and avoid bugs}
{if you don't like me screw up the Delphi syntax with those
(C++ types just do a simple find and replace =)}

{$IFDEF NEWTON_DOUBLE_PRECISION}
  NGDFloat = Double;
  {$ELSE}
  NGDFloat = Single;
  {$ENDIF}
  PNGDFloat = ^NGDFloat;

  Long_double = Extended;

  Int = Integer;
  __int8 = ShortInt;
  __int16 = SmallInt;
  __int32 = LongInt;
  __int64 = Int64;
  UInt16 = Word;
  NChar = ShortInt;
  Unsigned_char = Byte;
  Short = SmallInt;
  Unsigned_short = Word;
  Long = LongInt;
  Unsigned_long = LongWord;
  Unsigned_int = Cardinal;
  CharArray = Array [0..255] of Char;

  PInt = ^Int;
  P__int8 = ^__int8;
  P__int16 = ^__int16;
  P__int32 = ^__int32;
  P__int64 = ^__int64;
  P2Char = ^NChar;
  PUnsigned_char = ^Unsigned_char;
  PShort = ^Short;
  PUnsigned_short = ^Unsigned_short;
  PLong = ^Long;
  PUnsigned_long = ^Unsigned_long;
  PUnsigned_int = ^Unsigned_int;
{$IFDEF Delphi}
  size_t = Cardinal;
{$ENDIF}
  Psize_t = ^size_t;
  PLong_double = ^Long_double;
  PCharArray = ^CharArray;

{Pascal to C++}
  {simple types}
  Bool = Boolean;

  //Moved Maths related C++ Definitions to Maths3D.pas

  {Pointer types}
  Pvoid = Pointer; //void pointer
  PBool = ^Bool;
{end Pascal to C++}

  {well this might look stupid
  but i did it in order to make
  code complete and code parameters hint window
  to show the actual type for ex. PNewtonWorld
  instead of just "Pointer" , thus making programming a lot easier}
{$IFDEF NICE_CODE_PARAMS}
  PNewtonMesh = ^Pointer;
  PNewtonBody = ^Pointer;
  PNewtonWorld = ^Pointer;
  PNewtonJoint = ^Pointer;
  PNewtonContact = ^Pointer;
  PNewtonMaterial = ^Pointer;
  PNewtonCollision = ^Pointer;
  PNewtonSceneProxy = ^Pointer;
  PNewtonBreakableComponentMesh = ^Pointer;
  PNewtonMeshVertex = ^Pointer;
  PNewtonMeshEdge = ^Pointer;
  PNewtonMeshFace = ^Pointer;
  PNewtonMeshPoint= ^Pointer;
  // JointLibrary
  PNewtonUserJoint = ^Pointer;

  //PNewtonRagDoll = ^Pointer;
  //PNewtonRagDollBone = ^Pointer;
{$ELSE}

  PNewtonMesh = Pointer;
  PNewtonBody = Pointer;
  PNewtonWorld = Pointer;
  PNewtonJoint = Pointer;
  PNewtonContact = Pointer;
  PNewtonMaterial = Pointer;
  PNewtonCollision = Pointer;
  PNewtonSceneProxy = Pointer;
  PNewtonBreakableComponentMesh = Pointer;
  PNewtonMeshVertex = Pointer;
  PNewtonMeshEdge = Pointer;
  PNewtonMeshFace = Pointer;
  // JointLibrary
  PNewtonUserJoint = Pointer;

  //PNewtonRagDoll = Pointer;
  //PNewtonRagDollBone = Pointer;
{$ENDIF}

        // NewtonCollisionInfoRecord

      TNewtonBoxParam = packed record
             m_x,
             m_y,
             m_z: NGDFloat;
      end;

       TNewtonSphereParam = packed record
             m_r0,
             m_r1,
             m_r2: NGDFloat;
      end;

      TNewtonCylinderParam = packed record
          m_r0,
          m_r1,
        m_height: NGDFloat;
      end;

      TNewtonCapsuleParam = packed record
          m_r0,
          m_r1,
        m_height: NGDFloat;
      end;

      TNewtonConeParam = packed record
          m_r,
          m_height: NGDFloat;
      end;

      TNewtonChamferCylinderParam = packed record
             m_r,
             m_height: NGDFloat;
      end;

      TNewtonConvexHullParam = packed record
             m_vertexCount,
             m_vertexStrideInBytes,
	     m_faceCount : Integer;
             m_vertex    : PNGDFloat;
      end;

      TNewtonConvexHullModifierParam = packed record
         m_chidren: PNewtonCollision;
      end;

      TNewtonCompoundCollisionParam = packed record
         m_chidrenCount: integer;
        m_chidren: pointer; // pointer to array of pnewtoncollisions
      end;

      TNewtonCollisionTreeParam = packed record
         m_vertexCount,
	 m_indexCount  : Integer;
      end;

      TNewtonHeightFieldCollisionParam = packed record
             m_width,
             m_height,
             m_gridsDiagonals: integer;
             m_horizonalScale,
             m_verticalScale: NGDFloat;
             m_elevation: pointer; //unsigned short *m_elevation;
             m_atributes: pchar;
      end;

      TNewtonSceneCollisionParam = packed record
          m_childrenProxyCount: integer;
      end;

      TNewtonCollisionNullParam = packed record
       // nothing.
      end;

      TNewtonCollisionInfoRecord = packed record
    m_offsetMatrix: array[0..3,0..3] of NGDFloat;
      m_collisionType,                 // tag id to identify the collision primitive
      m_referenceCount: integer;       // the current reference count for this collision
    m_collisionUserID: integer;
  Case integer of
       SERIALIZE_ID_BOX :
         (shapedatabox: TNewtonBoxParam );
       SERIALIZE_ID_CONE :
         (shapedata: TNewtonConeParam );
        SERIALIZE_ID_SPHERE :
         (shapedatasphere: TNewtonSphereParam );
        SERIALIZE_ID_CAPSULE :
         (shapedatacapsule: TNewtonCapsuleParam );
        SERIALIZE_ID_CYLINDER :
         (shapedatacylinder: TNewtonCylinderParam );
       SERIALIZE_ID_COMPOUND :
         (shapedatacompound: TNewtonCompoundCollisionParam );
        SERIALIZE_ID_CONVEXHULL :
         (shapedataconvexhull: TNewtonConvexHullParam);
        SERIALIZE_ID_CONVEXMODIFIER :
         (shapedataxonvexhull: TNewtonConvexHullModifierParam );
        SERIALIZE_ID_CHAMFERCYLINDER :
         (shapedatachamfercylinder: TNewtonChamferCylinderParam );
        SERIALIZE_ID_TREE :
         (shapedatatree: TNewtonCollisionTreeParam );
        SERIALIZE_ID_NULL :
         (shapedatanull: TNewtonCollisionNullParam );
        SERIALIZE_ID_HEIGHTFIELD :
         (shapedataheightfield: TNewtonHeightFieldCollisionParam );
       SERIALIZE_ID_USERMESH :
         (m_paramArray: array[0..63] of NGDFloat);
        SERIALIZE_ID_SCENE :
         (shapedatascenecollision: TNewtonSceneCollisionParam);
  end;

  PNewtonCollisionInfoRecord = ^TNewtonCollisionInfoRecord;

  PNewtonJointRecord = ^NewtonJointRecord;
  NewtonJointRecord = record
    m_attachmenMatrix_0 : array[ 0..3,0..3 ] of NGDFloat;
    m_attachmenMatrix_1 : array[ 0..3,0..3 ] of NGDFloat;
    m_minLinearDof      : array[ 0..2 ] of NGDFloat;
    m_maxLinearDof      : array[ 0..2 ] of NGDFloat;
    m_minAngularDof     : array[ 0..2 ] of NGDFloat;
    m_maxAngularDof     : array[ 0..2 ] of NGDFloat;
    m_attachBody_0      : PNewtonBody;
    m_attachBody_1      : PNewtonBody;
    m_extraParameters   : array[ 0..15 ] of NGDFloat;
    m_bodiesCollisionOn : int;
    m_descriptionType   : array[ 0..31 ] of NChar;
  end;


  PNewtonUserMeshCollisionCollideDesc = ^NewtonUserMeshCollisionCollideDesc;
  NewtonUserMeshCollisionCollideDesc = record
    m_boxP0               : array[ 0..3 ] of NGDFloat; // lower bounding box of intersection query in local space
    m_boxP1               : array[ 0..3 ] of NGDFloat; // upper bounding box of intersection query in local space
    m_threadNumber        : int;                    // current thread executing this query
    m_faceCount           : int;                    // the application should set here how many polygons intersect the query box
    m_vertexStrideInBytes : int;                    // the application should set here the size of each vertex
    m_userData            : Pointer;                // user data passed to the collision geometry at creation time
    m_vertex              : PNGDFloat;                 // the application should the pointer to the vertex array.
    m_userAttribute       : PInt;                   // the application should set here the pointer to the user data, one for each face
    m_faceIndexCount      : PInt;                   // the application should set here the pointer to the vertex count of each face.
    m_faceVertexIndex     : PInt;                   // the application should set here the pointer index array for each vertex on a face.
    m_objBody             : PNewtonBody;            // pointer to the colliding body
    m_polySoupBody        : PNewtonBody;            // pointer to the rigid body owner of this collision tree
  end;

  PNewtonWorldConvexCastReturnInfo = ^NewtonWorldConvexCastReturnInfo;
  NewtonWorldConvexCastReturnInfo = record
    m_point            : array[ 0..3 ] of NGDFloat; // collision point in global space
    m_normal           : array[ 0..3 ] of NGDFloat; // surface normal at collision point in global space
    m_normalOnHitPoint : array[ 0..3 ] of NGDFloat; // surface normal at the surface of the hit body,
					         // is the same as the normal calculated by a ray cast hitting the body at the hit poi
    m_penetration      : NGDFloat;                  // contact penetration at collision point
    m_contactID        : int;                    // collision ID at contact point
    m_hitBody          : PNewtonBody;            // body hit at contact point
  end;

  PNewtonUserMeshCollisionRayHitDesc = ^NewtonUserMeshCollisionRayHitDesc;
  NewtonUserMeshCollisionRayHitDesc = record
    m_p0        : array[ 0..3 ] of NGDFloat; // ray origin in collision local space
    m_p1        : array[ 0..3 ] of NGDFloat; // ray destination in collision local space
    m_normalOut : array[ 0..3 ] of NGDFloat; // copy here the normal at the ray intersection
    m_userIdOut : int;                    // copy here a user defined id for further feedback
    m_userData  : Pointer;                // user data passed to the collision geometry at creation time
  end;


  PNewtonHingeSliderUpdateDesc = ^NewtonHingeSliderUpdateDesc;
  NewtonHingeSliderUpdateDesc = record
    m_accel       : NGDFloat;
    m_minFriction : NGDFloat;
    m_maxFriction : NGDFloat;
    m_timestep    : NGDFloat;
  end;

// *****************************************************************************************************************************
//
//  Callbacks
//
// *****************************************************************************************************************************
NewtonAllocMemory = function( sizeInBytes : int ) : Pointer; cdecl;
PNewtonAllocMemory = ^NewtonAllocMemory;

NewtonFreeMemory = procedure( ptr : Pointer; sizeInBytes : int ); cdecl;
PNewtonFreeMemory = ^NewtonFreeMemory;

NewtonDestroyWorld = procedure( const NewtonWorld : PNewtonWorld ); cdecl;
PNewtonDestroyWorld = ^NewtonDestroyWorld;
                

NewtonGetTicksCountCallback = function () : cardinal; cdecl;
PNewtonGetTicksCountCallback = ^NewtonGetTicksCountCallback;

NewtonSerialize = procedure( serializeHandle : Pointer; const buffer : Pointer; size : size_t ); cdecl;
PNewtonSerialize = ^NewtonSerialize;

NewtonDeserialize = procedure( serializeHandle : Pointer; buffer : Pointer; size : size_t ); cdecl;
PNewtonDeserialize = ^NewtonDeserialize;

NewtonUserMeshCollisionDestroyCallback = procedure( descData : Pointer ); cdecl;
PNewtonUserMeshCollisionDestroyCallback = ^NewtonUserMeshCollisionDestroyCallback;

NewtonUserMeshCollisionCollideCallback = procedure( NewtonUserMeshCollisionCollideDesc : PNewtonUserMeshCollisionCollideDesc ); cdecl;
PNewtonUserMeshCollisionCollideCallback = ^NewtonUserMeshCollisionCollideCallback;

NewtonUserMeshCollisionRayHitCallback = function( NewtonUserMeshCollisionRayHitDesc : PNewtonUserMeshCollisionRayHitDesc ) : int; cdecl;
PNewtonUserMeshCollisionRayHitCallback = ^NewtonUserMeshCollisionRayHitCallback;


NewtonUserMeshCollisionGetCollisionInfo = procedure( userData : Pointer; infoRecord : PNewtonCollisionInfoRecord ); cdecl;
PNewtonUserMeshCollisionGetCollisionInfo = ^NewtonUserMeshCollisionGetCollisionInfo;



NewtonUserMeshCollisionGetFacesInAABB = function( userData : Pointer; const p0  : PNGDFloat; const p1 : PNGDFloat; const vertexArray : PNGDFloat; vertexCount : pint;
                                                   vertexStrideInBytes : pint; const indexList : pint; maxIndexCount : int; const userDataList : pint ) : int; cdecl;
PNewtonUserMeshCollisionGetFacesInAABB = ^NewtonUserMeshCollisionGetFacesInAABB;

NewtonCollisionTreeRayCastCallback = function( interception : NGDFloat; normal : PNGDFloat; faceId : int; usedData : Pointer) : NGDFloat; cdecl;
PNewtonCollisionTreeRayCastCallback = ^NewtonCollisionTreeRayCastCallback;

// - collision tree call back (obsoleted no recommended)
NewtonTreeCollisionCallback = procedure( const bodyWithTreeCollision : PNewtonBody; const body : PNewtonBody; faceID : int;
                                         const vertex : PNGDFloat; vertexstrideInBytes : int); cdecl;
PNewtonTreeCollisionCallback = ^NewtonTreeCollisionCallback;

NewtonBodyDestructor = procedure( const body : PNewtonBody ); cdecl;
PNewtonBodyDestructor = ^NewtonBodyDestructor;


NewtonApplyForceAndTorque = procedure( const body : PNewtonBody; timestep : NGDFloat; threadIndex : int ); cdecl;
PNewtonApplyForceAndTorque = ^NewtonApplyForceAndTorque;


NewtonSetTransform = procedure( const body : PNewtonBody; const matrix : PNGDFloat; threadIndex : int ); cdecl;
PNewtonSetTransform = ^NewtonSetTransform;

// 2.15 - Added parameter "world" - SW
NewtonIslandUpdate = function(const World : PNewtonWorld; islandHandle : Pointer; bodyCount : int) : int; cdecl;
 PNewtonIslandUpdate = ^NewtonIslandUpdate;

NewtonBodyLeaveWorld = procedure( const body : PNewtonBody; threadIndex : int ); cdecl;
 PNewtonBodyLeaveWorld = ^NewtonBodyLeaveWorld;

// 2.15 - Added const for parameter "contact" - SW
NewtonDestroyBodyByExeciveForce = procedure( const body : PNewtonBody; const contact : PNewtonJoint ); cdecl;
 PNewtonDestroyBodyByExeciveForce = ^NewtonDestroyBodyByExeciveForce;

// 2.15 - Added parameter "World" - SW
NewtonCollisionDestructor = procedure (const World : PNewtonWorld; const collision : PNewtonCollision); cdecl;
 PNewtonCollisionDestructor = ^NewtonCollisionDestructor;

NewtonCollisionCompoundBreakableCallback = function(const Mesh : PNewtonMesh; userData : Pointer; planeMatrixOut : PNGDFloat) : Int; cdecl;
 PNewtonCollisionCompoundBreakableCallback = ^NewtonCollisionCompoundBreakableCallback;

NewtonGetBuoyancyPlane = function(const collisionID : Int; context : Pointer; const globalSpaceMatrix : PNGDFloat; globalSpacePlane : PNGDFloat ) : Int; cdecl;
 PNewtonGetBuoyancyPlane = ^NewtonGetBuoyancyPlane;

NewtonWorldRayPrefilterCallback = function (const body : PNewtonBody; const collision : PNewtonCollision; userData : Pointer) : cardinal; cdecl;
 PNewtonWorldRayPrefilterCallback = ^NewtonWorldRayPrefilterCallback;

NewtonWorldRayFilterCallback = function( const body : PNewtonBody; const hitNormal: PNGDFloat; collisionID : Int; userData: Pointer; intersetParam: NGDFloat ) : NGDFloat; cdecl;
 PNewtonWorldRayFilterCallback = ^NewtonWorldRayFilterCallback;


NewtonOnAABBOverlap = function( const material : PNewtonMaterial; const body0 : PNewtonBody; const body1 : PNewtonBody; threadIndex : int ) : int; cdecl;
 PNewtonOnAABBOverlap = ^NewtonOnAABBOverlap;


NewtonContactsProcess = procedure( const contact : PNewtonJoint; timestep : NGDFloat; threadIndex : int ); cdecl;
 PNewtonContactsProcess = ^NewtonContactsProcess;

// 2.15 - Added parameter "userData" - SW
NewtonBodyIterator = procedure( const body : PNewtonBody; userData : Pointer ); cdecl;
 PNewtonBodyIterator = ^NewtonBodyIterator;

// 2.15 - Added parameter "userData" - SW
NewtonJointIterator = procedure( const joint : PNewtonJoint; userData : Pointer ); cdecl;
 PNewtonJointIterator = ^NewtonJointIterator;


NewtonCollisionIterator = procedure( userData : Pointer; vertexCount : int; const FaceArray : PNGDFloat; faceId : int ); cdecl;
PNewtonCollisionIterator = ^NewtonCollisionIterator;


NewtonBallCallBack = procedure( const ball : PNewtonJoint; timestep : NGDFloat ); cdecl;
PNewtonBallCallBack = ^NewtonBallCallBack;

NewtonHingeCallBack = function( const hinge : PNewtonJoint; desc : PNewtonHingeSliderUpdateDesc ) : Unsigned_int; cdecl;
PNewtonHingeCallBack = ^NewtonHingeCallBack;

NewtonSliderCallBack = function( const slider : PNewtonJoint; desc : PNewtonHingeSliderUpdateDesc ) : Unsigned_int; cdecl;
PNewtonSliderCallBack = ^NewtonSliderCallBack;

NewtonUniversalCallBack = function( const universal : PNewtonJoint; desc : PNewtonHingeSliderUpdateDesc ) : Unsigned_int; cdecl;
PNewtonUniversalCallBack = ^NewtonUniversalCallBack;

NewtonCorkscrewCallBack = function( const corkscrew : PNewtonJoint; desc : PNewtonHingeSliderUpdateDesc ) : Unsigned_int; cdecl;
PNewtonCorkscrewCallBack = ^NewtonCorkscrewCallBack;


NewtonUserBilateralCallBack = procedure( const userJoint: PNewtonJoint; timestep : NGDFloat; threadIndex : int); cdecl;
PNewtonUserBilateralCallBack = ^NewtonUserBilateralCallBack;


NewtonUserBilateralGetInfoCallBack = procedure( const userJoint : PNewtonJoint; info : PNewtonJointRecord ); cdecl;
PNewtonUserBilateralGetInfoCallBack = ^NewtonUserBilateralGetInfoCallBack;

NewtonConstraintDestructor = procedure( const me : PNewtonJoint ); cdecl;
PNewtonConstraintDestructor = ^NewtonConstraintDestructor;


// *****************************************************************************************************************************
//
// world control functions
//
// *****************************************************************************************************************************
function  NewtonCreate( malloc : NewtonAllocMemory; mfree : NewtonFreeMemory ) : PNewtonWorld; cdecl; external{$IFDEF __GPC__}name 'NewtonCreate'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonDestroy( const newtonWorld : PNewtonWorld ); cdecl; external{$IFDEF __GPC__}name 'NewtonDestroy'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonDestroyAllBodies( const newtonWorld : PNewtonWorld ); cdecl; external{$IFDEF __GPC__}name 'NewtonDestroyAllBodies'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonGetMemoryUsed() : int; cdecl; external{$IFDEF __GPC__}name 'NewtonGetMemoryUsed'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// Propably not possible with Delphi? But present in 2.15 - SW
//  procedure NewtonSetMemorySystem (NewtonAllocMemory malloc, NewtonFreeMemory mfree);

procedure NewtonUpdate( const newtonWorld : PNewtonWorld; timestep : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonUpdate'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonInvalidateCache( const newtonWorld : PNewtonWorld); cdecl; external{$IFDEF __GPC__}name 'NewtonInvalidateCache'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionUpdate( const newtonWorld : PNewtonWorld); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionUpdate'{$ELSE}NewtonDLL{$ENDIF __GPC__};


procedure NewtonSetSolverModel(const NewtonWorld : PNewtonWorld; Model : Int); cdecl; external{$IFDEF __GPC__}name 'NewtonSetSolverModel'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonSetPlatformArchitecture (const newtonWorld : PNewtonWorld; mode : Int); cdecl; external{$IFDEF __GPC__}name 'NewtonSetPlatformArchitecture'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonGetPlatformArchitecture (const newtonWorld : PNewtonWorld; description : PCharArray) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonGetPlatformArchitecture'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSetMultiThreadSolverOnfloatIsland (const newtonWorld : PNewtonWorld; mode : Int); cdecl; external{$IFDEF __GPC__}name 'NewtonSetMultiThreadSolverOnfloatIsland'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonGetMultiThreadSolverOnfloatIsland (const newtonWorld : PNewtonWorld) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonGetMultiThreadSolverOnfloatIsland'{$ELSE}NewtonDLL{$ENDIF __GPC__};


procedure NewtonSetPerformanceClock (const newtonWorld : PNewtonWorld; NewtonGetTicksCountCallback : PNewtonGetTicksCountCallback); cdecl; external{$IFDEF __GPC__}name 'NewtonSetPerformanceClock'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonReadPerformanceTicks (const newtonWorld : PNewtonWorld; performanceEntry : cardinal) : cardinal; cdecl; external{$IFDEF __GPC__}name 'NewtonReadPerformanceTicks'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonWorldCriticalSectionLock (const newtonWorld : PNewtonWorld); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldCriticalSectionLock'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonWorldCriticalSectionUnlock (const newtonWorld : PNewtonWorld); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldCriticalSectionUnlock'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSetThreadsCount (const newtonWorld : PNewtonWorld; threads : int); cdecl; external{$IFDEF __GPC__}name 'NewtonSetThreadsCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonGetThreadsCount (const newtonWorld : PNewtonWorld) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonGetThreadsCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};


procedure NewtonSetFrictionModel(const NewtonWorld : PNewtonWorld; Model : Int); cdecl; external{$IFDEF __GPC__}name 'NewtonSetFrictionModel'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSetMinimumFrameRate( const newtonWorld : PNewtonWorld; frameRate : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonSetMinimumFrameRate'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonSetBodyLeaveWorldEvent( const newtonWorld : PNewtonWorld; callback : PNewtonBodyLeaveWorld ); cdecl; external{$IFDEF __GPC__}name 'NewtonSetBodyLeaveWorldEvent'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonSetWorldSize( const newtonWorld : PNewtonWorld; const minPoint : PNGDFloat; const maxPoint : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonSetWorldSize'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSetIslandUpdateEvent( const newtonWorld : PNewtonWorld; NewtonIslandUpdate : PNewtonIslandUpdate ); cdecl; external{$IFDEF __GPC__}name 'NewtonSetIslandUpdateEvent'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSetCollisionDestructor( const newtonWorld : PNewtonWorld; callback : PNewtonCollisionDestructor ); cdecl; external{$IFDEF __GPC__}name 'NewtonSetCollisionDestructor'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSetDestroyBodyByExeciveForce( const newtonWorld : PNewtonWorld; callback : PNewtonDestroyBodyByExeciveForce ); cdecl; external{$IFDEF __GPC__}name 'NewtonSetDestroyBodyByExeciveForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// 2.15 - Added parameter "userData" - SW
procedure NewtonWorldForEachJointDo (const newtonWorld : PNewtonWorld; callback : PNewtonJointIterator; userData : Pointer); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldForEachJointDo'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// 2.15 - Added parameter "userData" - SW
procedure NewtonWorldForEachBodyInAABBDo (const newtonWorld : PNewtonWorld; const p0 : PNGDFloat; const p1 : PNGDFloat; callback : PNewtonBodyIterator; userData : Pointer); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldForEachBodyInAABBDo'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonWorldGetVersion( const newtonWorld : PNewtonWorld) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetVersion'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonWorldSetUserData( const newtonWorld : PNewtonWorld; userData : Pointer); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldSetUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonWorldGetUserData( const newtonWorld : PNewtonWorld) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonWorldSetDestructorCallBack( const newtonWorld : PNewtonWorld; NewtonDestroyWorld : PNewtonDestroyWorld); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldSetDestructorCallBack'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonWorldGetDestructorCallBack( const newtonWorld : PNewtonWorld) : PNewtonDestroyWorld; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetDestructorCallBack'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonWorldRayCast( const newtonWorld : PNewtonWorld; const p0 : PNGDFloat; const p1 : PNGDFloat;
                              filter : PNewtonWorldRayFilterCallback; userData: Pointer;
                              prefilter : NewtonWorldRayPrefilterCallback); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldRayCast'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonWorldConvexCast( const newtonWorld : PNewtonWorld; const matrix : PNGDFloat; const target : PNGDFloat; const shape : PNewtonCollision;
                              hitParam : PNGDFloat; userData: Pointer; prefilter : NewtonWorldRayPrefilterCallback;
                              info : PNewtonWorldConvexCastReturnInfo; maxContactsCount : int; threadIndex : int); cdecl; external{$IFDEF __GPC__}name 'NewtonWorldConvexCast'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function  NewtonWorldGetBodyCount( const newtonWorld : PNewtonWorld) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetBodyCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonWorldGetConstraintCount( const newtonWorld : PNewtonWorld) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetConstraintCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};


// *****************************************************************************************************************************
//
// Simulation islands
//
// *****************************************************************************************************************************

function  NewtonIslandGetBody( const island : Pointer; bodyIndex : int) : PNewtonBody; cdecl; external{$IFDEF __GPC__}name 'NewtonIslandGetBody'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonIslandGetBodyAABB( const island : Pointer; bodyIndex : int; p0 : PNGDFloat; p1 : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonIslandGetBodyAABB'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
//  Physics Material Section
//
// *****************************************************************************************************************************
function  NewtonMaterialCreateGroupID( const newtonWorld : PNewtonWorld ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialCreateGroupID'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMaterialGetDefaultGroupID( const newtonWorld : PNewtonWorld ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetDefaultGroupID'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialDestroyAllGroupID( const newtonWorld : PNewtonWorld ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialDestroyAllGroupID'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMaterialGetUserData( const NewtonWorld: PNewtonWorld; id0: int; id1: int): Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMaterialSetSurfaceThickness( const newtonWorld : PNewtonWorld; id0 : int; id1 : int; thickness : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetSurfaceThickness'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetContinuousCollisionMode (const newtonWorld : PNewtonWOrld; id0, id1, state : int);  cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContinuousCollisionMode'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMaterialSetCollisionCallback( const newtonWorld : PNewtonWorld; id0 : int; id1 : int; userData : Pointer; AABBOverlap : PNewtonOnAABBOverlap; process : PNewtonContactsProcess ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetCollisionCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMaterialSetDefaultSoftness( const newtonWorld : PNewtonWorld; id0 : int; id1 : int; value : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetDefaultSoftness'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetDefaultElasticity( const newtonWorld : PNewtonWorld; id0 : int; id1 : int; elasticCoef : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetDefaultElasticity'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetDefaultCollidable( const newtonWorld : PNewtonWorld; id0 : int; id1 : int; state : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetDefaultCollidable'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetDefaultFriction( const newtonWorld : PNewtonWorld; id0 : int; id1 : int; staticFriction : NGDFloat; kineticFriction : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetDefaultFriction'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function  NewtonWorldGetFirstMaterial( const NewtonWorld: PNewtonWorld): PNewtonMaterial; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetFirstMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonWorldGetNextMaterial( const NewtonWorld: PNewtonWorld; const material : PNewtonMaterial): PNewtonMaterial; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetNextMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// - These 2 should proberly be moved to the newtonworld section
function  NewtonWorldGetFirstBody( const NewtonWorld: PNewtonWorld): PNewtonBody; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetFirstBody'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonWorldGetNextBody( const NewtonWorld: PNewtonWorld; const curBody : PNewtonBody): PNewtonBody; cdecl; external{$IFDEF __GPC__}name 'NewtonWorldGetNextBody'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// Physics Contact control functions
//
// *****************************************************************************************************************************

function  NewtonMaterialGetMaterialPairUserData( const material : PNewtonMaterial) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetMaterialPairUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMaterialGetContactFaceAttribute( const material : PNewtonMaterial) : Unsigned_int; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetContactFaceAttribute'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMaterialGetBodyCollisionID( const material : PNewtonMaterial; body : PNewtonBody) : Unsigned_int; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetBodyCollisionID'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMaterialGetContactNormalSpeed( const material : PNewtonMaterial ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetContactNormalSpeed'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialGetContactForce( const material : PNewtonMaterial; force : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetContactForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialGetContactPositionAndNormal( const material : PNewtonMaterial; posit : PNGDFloat; normal : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetContactPositionAndNormal'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialGetContactTangentDirections( const material : PNewtonMaterial; dir0 : PNGDFloat; dir : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetContactTangentDirections'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMaterialGetContactTangentSpeed( const material : PNewtonMaterial; index : int ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialGetContactTangentSpeed'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMaterialSetContactSoftness( const material : PNewtonMaterial; softness : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContactSoftness'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetContactElasticity( const material : PNewtonMaterial; restitution : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContactElasticity'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetContactFrictionState( const material : PNewtonMaterial; state : int; index : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContactFrictionState'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetContactFrictionCoef( const material : PNewtonMaterial; staticFrictionCoef,kineticFrictionCoef : NGDFloat; index : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContactStaticFrictionCoef'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMaterialSetContactNormalAcceleration (const material : PNewtonMaterial; accel : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContactNormalAcceleration'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialSetContactNormalDirection(const material : PNewtonMaterial; directionVector : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContactNormalDirection'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMaterialSetContactTangentAcceleration( const material : PNewtonMaterial; accel : NGDFloat; index : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialSetContactTangentAcceleration'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMaterialContactRotateTangentDirections( const material : PNewtonMaterial; const directionVector : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonMaterialContactRotateTangentDirections'{$ELSE}NewtonDLL{$ENDIF __GPC__};


// *****************************************************************************************************************************
//
// convex collision primitives creation functions
//
// *****************************************************************************************************************************

function  NewtonCreateNull( const newtonWorld : PNewtonWorld) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateNull'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCreateSphere( const newtonWorld : PNewtonWorld; radiusX, radiusY, radiusZ : NGDFloat; shapeID : int; const offsetMatrix : PNGDFloat ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateSphere'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCreateBox( const newtonWorld : PNewtonWorld; dx : NGDFloat; dy : NGDFloat; dz : NGDFloat; shapeID : int; const offsetMatrix : PNGDFloat ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateBox'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCreateCone( const newtonWorld : PNewtonWorld; radius : NGDFloat; height : NGDFloat; shapeID : int; const offsetMatrix : PNGDFloat) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateCone'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCreateCapsule( const newtonWorld : PNewtonWorld; radius : NGDFloat; height : NGDFloat; shapeID : int; const offsetMatrix : PNGDFloat) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateCapsule'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCreateCylinder( const newtonWorld : PNewtonWorld; radius : NGDFloat; height : NGDFloat; shapeID : int; const offsetMatrix : PNGDFloat) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateCylinder'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCreateChamferCylinder( const newtonWorld : PNewtonWorld; raduis : NGDFloat; height : NGDFloat; shapeID : int; const offsetMatrix : PNGDFloat) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateChamferCylinder'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCreateConvexHull( const newtonWorld : PNewtonWorld; count : int; const vertexCloud : PNGDFloat; strideInBytes : int; tolerance : NGDFloat; shapeID : int; const offsetMatrix : PNGDFloat) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateConvexHull'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonCreateConvexHullFromMesh( const newtonWorld : PNewtonWorld; mesh : PNewtonMesh; tolerance : NGDFloat; shapeID : int ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateConvexHullFromMesh'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonCreateConvexHullModifier( const newtonWorld : PNewtonWorld; const convexHullCollision : PNewtonCollision; shapeID : int): PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateConvexHullModifier'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonConvexHullModifierGetMatrix(const convexHullCollision : PNewtonCollision; matrix : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonConvexHullModifierGetMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonConvexHullModifierSetMatrix(const convexHullCollision : PNewtonCollision; const matrix : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonConvexHullModifierSetMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function  NewtonCollisionIsTriggerVolume( const convexCollision : PNewtonCollision): int; cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionIsTriggerVolume'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionSetAsTriggerVolume( const convexCollision : PNewtonCollision; trigger : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionSetAsTriggerVolume'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionSetMaxBreakImpactImpulse( const convexHullCollision : PNewtonCollision; maxImpactImpulse : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionSetAsTriggerVolume'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCollisionGetMaxBreakImpactImpulse( const convexHullCollision : PNewtonCollision) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionGetMaxBreakImpactImpulse'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionSetUserID( const convexCollision : PNewtonCollision; id : unsigned_int ); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionSetUserID'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCollisionGetUserID( const convexCollision : PNewtonCollision) : unsigned_int; cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionGetUserID'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonConvexHullGetFaceIndices( const convexHullCollision : PNewtonCollision; face : int; faceIndices : PInt) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonConvexHullGetFaceIndices'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonConvexCollisionCalculateVolume(const convexCollision : PNewtonCollision) : NGDFloat;  cdecl; external{$IFDEF __GPC__}name 'NewtonConvexCollisionCalculateVolume'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonConvexCollisionCalculateInertialMatrix (const convexCollision : PNewtonCollision; inertia, origin : PNGDFloat);  cdecl; external{$IFDEF __GPC__}name 'NewtonConvexCollisionCalculateInertialMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionMakeUnique (const newtonWorld : PNewtonWorld; const collision : PNewtonCollision); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionMakeUnique'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonReleaseCollision( const newtonWorld : PNewtonWorld; const collision : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonReleaseCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonAddCollisionReference( const Collision : PNewtonCollision): int; cdecl; external{$IFDEF __GPC__}name 'NewtonAddCollisionReference'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// complex collision primitives creation functions
// note: can only be used with static bodies (bodies with infinite mass)
//
// *****************************************************************************************************************************

function NewtonCreateCompoundCollision( const newtonWorld : PNewtonWorld; count : int;
                                        const collisionPrimitiveArray : PNewtonCollision; shapeID : Int ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateCompoundCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonCreateCompoundCollisionFromMesh( const newtonWorld : PNewtonWorld; const mesh : PNewtonMesh; concavity : NGDFloat; maxShapeCount : int; shapeID : Int ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateCompoundCollisionFromMesh'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function NewtonCreateUserMeshCollision( const newtonWorld : PNewtonWorld; const minBox : PNGDFloat;
                                        const maxBox : PNGDFloat; userData : Pointer; collideCallback : NewtonUserMeshCollisionCollideCallback;
                                        rayHitCallback : NewtonUserMeshCollisionRayHitCallback; destroyCallback : NewtonUserMeshCollisionDestroyCallback;
                                        getInfoCallback : NewtonUserMeshCollisionGetCollisionInfo; facesInAABBCallback : NewtonUserMeshCollisionGetFacesInAABB; shapeID : Int ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateUserMeshCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function NewtonCreateSceneCollision( const newtonWorld : PNewtonWorld; shapeID : Int ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateSceneCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonSceneCollisionCreateProxy( scene : PNewtonCollision; collision : PNewtonCollision ) : PNewtonSceneProxy; cdecl; external{$IFDEF __GPC__}name 'NewtonSceneCollisionCreateProxy'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSceneCollisionDestroyProxy( scene : PNewtonCollision; Proxy : PNewtonSceneProxy ); cdecl; external{$IFDEF __GPC__}name 'NewtonSceneCollisionDestroyProxy'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSceneProxySetMatrix( Proxy : PNewtonSceneProxy; const Matrix : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonSceneProxySetMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSceneProxyGetMatrix( Proxy : PNewtonSceneProxy; Matrix : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonSceneProxyGetMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSceneCollisionOptimize( scene : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonSceneCollisionOptimize'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// **********************************************************************************************
//
// complex breakable collision primitives interface
//
// **********************************************************************************************
function NewtonCreateCompoundBreakable( const NewtonWorld : PNewtonWorld; meshCount : int; const SolidsArray : PNewtonMesh; const ShapeIDArray : PInt; Densities : PNGDFloat; interialFaceMaterial : PInt; ShapeID : Int; debriID : Int; DebreSeapasationGap : NGDFloat ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateCompoundBreakable'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCompoundBreakableResetAnchoredPieces( const compoundBreakable : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonCompoundBreakableResetAnchoredPieces'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonCompoundBreakableSetAnchoredPieces( const compoundBreakable : PNewtonCollision; fixshapesCount : Int; matrixPallete : PNGDFloat; fixedShapesArray : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonCompoundBreakableSetAnchoredPieces'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonCompoundBreakableGetVertexCount( const compoundBreakable : PNewtonCollision ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonCompoundBreakableGetVertexCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonCompoundBreakableGetVertexStreams( const compoundBreakable : PNewtonCollision; vertexStrideInByte : Int; Vertex : PNGDFloat; normalStrideInByte : Int; normal : PNGDFloat; uvStrideInByte : Int; uv : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonCompoundBreakableGetVertexStreams'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonBreakableGetMainMesh( const compoundBreakable : PNewtonCollision ) : PNewtonBreakableComponentMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableGetMainMesh'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBreakableGetFirstComponent( const compoundBreakable : PNewtonCollision ) : PNewtonBreakableComponentMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableGetFirstComponent'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBreakableGetNextComponent( const component : PNewtonBreakableComponentMesh ) : PNewtonBreakableComponentMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableGetNextComponent'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBreakableBeginDelete( const compoundBreakable : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableBeginDelete'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBreakableCreateDebrieBody( const compoundBreakable : PNewtonCollision; const component : PNewtonBreakableComponentMesh ) : PNewtonBody; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableCreateDebrieBody'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBreakableDeleteComponent( const compoundBreakable : PNewtonCollision; const component : PNewtonBreakableComponentMesh ); cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableDeleteComponent'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBreakableEndDelete( const compoundBreakable : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableBeginDelete'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonBreakableGetComponentsInRadius( const compoundBreakable : PNewtonCollision; const position : PNGDFloat; radius : NGDFloat; Segments : PNewtonBreakableComponentMesh; maxCount : Int ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableGetComponentsInRadius'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonBreakableGetFirstSegment( const BreakableComponent : PNewtonBreakableComponentMesh ) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableGetFirstSegment'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBreakableGetNextSegment( const Segment : Pointer ) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableGetNextSegment'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonBreakableSegmentGetMaterial( const Segment : Pointer ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableSegmentGetMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBreakableSegmentGetIndexCount( const Segment : Pointer ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableSegmentGetIndexCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBreakableSegmentGetIndexStream( CompoundBreakable : PNewtonCollision; const MeshOwner : PNewtonBreakableComponentMesh; const Segment : Pointer; Index : PInt ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableSegmentGetIndexStream'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBreakableSegmentGetIndexStreamShort( CompoundBreakable : PNewtonCollision; const MeshOwner : PNewtonBreakableComponentMesh; const Segment : Pointer; Index : PShort ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBreakableSegmentGetIndexStreamShort'{$ELSE}NewtonDLL{$ENDIF __GPC__};


//  ***********************************************************************************************************
//
//	Collision serialization functions
//
// ***********************************************************************************************************

function NewtonCreateCollisionFromSerialization( const newtonWorld : PNewtonWorld; deserializeFunction : PNewtonDeserialize; serializeHandle : Pointer ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateCollisionFromSerialization'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionSerialize( const newtonWorld : PNewtonWorld; const collision : PNewtonCollision; serializeFunction : PNewtonSerialize; serializeHandle : Pointer ); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionSerialize'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionGetInfo( const collision : PNewtonCollision; collisionInfo : PNewtonCollisionInfoRecord); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionGetInfo'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// **********************************************************************************************
//
// Static collision shapes functions
//
// **********************************************************************************************

function  NewtonCreateHeightFieldCollision( const newtonWorld : PNewtonWorld; width, height, gridDiagonals : int; elevationMap : PUnsigned_short; attributeMap : P2Char; horizontalScale,verticalScale : NGDFloat; shapeID : Int) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateHeightFieldCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonCreateTreeCollision( const newtonWorld : PNewtonWorld; shapeID : Int ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateTreeCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonTreeCollisionSetUserRayCastCallback( const treeCollision : PNewtonCollision; rayHitCallback : PNewtonCollisionTreeRayCastCallback ); cdecl; external{$IFDEF __GPC__}name 'NewtonTreeCollisionSetUserRayCastCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonTreeCollisionBeginBuild( const treeCollision : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonTreeCollisionBeginBuild'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonTreeCollisionAddFace( const treeCollision : PNewtonCollision; vertexCount : int; const vertexPtr : PNGDFloat;
                                      strideInBytes : int; faceAttribute : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonTreeCollisionAddFace'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonTreeCollisionEndBuild( const treeCollision : PNewtonCollision; optimize : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonTreeCollisionEndBuild'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonTreeCollisionGetFaceAtribute( const treeCollision : PNewtonCollision; const faceIndexArray : Pint ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonTreeCollisionGetFaceAtribute'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonTreeCollisionSetFaceAtribute( const treeCollision : PNewtonCollision; const faceIndexArray : Pint;
                                              attribute : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonTreeCollisionSetFaceAtribute'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonTreeCollisionGetVertexListIndexListInAABB( const treeCollision : PNewtonCollision; const p0, p1 : PNGDFloat; const vertexArray : PNGDFloat; vertexCount,vertexStrideInBytes : PInt; const indexList : PInt; maxIndexCount : Int; const faceAttribute : PInt ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonTreeCollisionGetVertexListIndexListInAABB'{$ELSE}NewtonDLL{$ENDIF __GPC__};


procedure NewtonStaticCollisionSetDebugCallback( const staticCollision : PNewtonCollision; userCallback : PNewtonTreeCollisionCallback ); cdecl; external{$IFDEF __GPC__}name 'NewtonStaticCollisionSetDebugCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};


// *****************************************************************************************************************************
//
// General purpose collision library functions
//
// *****************************************************************************************************************************

function  NewtonCollisionPointDistance (const newtonWorld : PNewtonWorld; const point : PNGDFloat;
		                                    const collision : PNewtonCollision; const matrix : PNGDFloat;	contact : PNGDFloat; normal : PNGDFloat; threadIndex : int) : Int;
                                        cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionPointDistance'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonCollisionClosestPoint (const newtonWorld : PNewtonWorld; const collsionA : PNewtonCollision;
                                       const matrixA : PNGDFloat; const collisionB : PNewtonCollision; const matrixB : PNGDFloat;
		                                   contactA, contactB, normalAB : PNGDFloat; threadIndex : int) : Int;
                                       cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionClosestPoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonCollisionCollide (const newtonWorld : PNewtonWorld; maxSize : Int; const collsionA : PNewtonCollision;
                                  const matrixA : PNGDFloat; const collisionB : PNewtonCollision; const matrixB : PNGDFloat;
                                  contacts, normals, penetration : PNGDFloat; threadIndex : int) : Int;
                                  cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionCollide'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonCollisionCollideContinue (const newtonWorld : PNewtonWorld; maxSize : Int; const timestep : NGDFloat;
		                                     const collsionA : PNewtonCollision; const matrixA : PNGDFloat; const velocA : PNGDFloat; const omegaA : NGDFloat;
		                                     const collsionB : PNewtonCollision; const matrixB : PNGDFloat; const velocB : PNGDFloat; const omegaB : NGDFloat;
		                                     timeOfImpact : PNGDFloat; contacts : PNGDFloat; normals : PNGDFloat; penetration : PNGDFloat; threadIndex : int) : Int;
                                         cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionCollideContinue'{$ELSE}NewtonDLL{$ENDIF __GPC__};


procedure NewtonCollisionSupportVertex( const collision : PNewtonCollision; const dir : PNGDFloat; vertex : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionSupportVertex'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCollisionRayCast(const collision : PNewtonCollision; const p0: PNGDFloat; const p1: PNGDFloat; normals: PNGDFloat; attribute: pint): NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionRayCast'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonCollisionCalculateAABB( const collision : PNewtonCollision; const matrix : PNGDFloat; p0 : PNGDFloat; p1 : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionCalculateAABB'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCollisionForEachPolygonDo (const collision : PNewtonCollision; const matrix : PNGDFloat; callback : NewtonCollisionIterator; UserData : Pointer);cdecl; external{$IFDEF __GPC__}name 'NewtonCollisionForEachPolygonDo'{$ELSE}NewtonDLL{$ENDIF __GPC__};


// *****************************************************************************************************************************
//
// transforms utility functions
//
// *****************************************************************************************************************************
procedure NewtonGetEulerAngle( const matrix : PNGDFloat; eulersAngles : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonGetEulerAngle'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonSetEulerAngle( const eulersAngles : PNGDFloat; matrix : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonSetEulerAngle'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonCalculateSpringDamperAcceleration(dt, ks, x, kd, s : NGDFloat): NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCalculateSpringDamperAcceleration'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// body manipulation functions
//
// *****************************************************************************************************************************
function  NewtonCreateBody( const newtonWorld : PNewtonWorld; const collision : PNewtonCollision ) : PNewtonBody; cdecl; external{$IFDEF __GPC__}name 'NewtonCreateBody'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonDestroyBody( const newtonWorld : PNewtonWorld; const body : PNewtonBody ); cdecl; external{$IFDEF __GPC__}name 'NewtonDestroyBody'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyAddForce( const body : PNewtonBody; const force : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyAddForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyAddTorque( const body : PNewtonBody; const torque : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyAddTorque'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyCalculateInverseDynamicsForce( const body : PNewtonBody; timestep : NGDFloat; const desiredVeloc : PNGDFloat; forceOut : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyCalculateInverseDynamicsForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodySetMatrix( const body : PNewtonBody; const matrix : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetMatrixRecursive( const body : PNewtonBody; const matrix : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetMatrixRecursive'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetMassMatrix( const body : PNewtonBody; mass : NGDFloat; Ixx : NGDFloat; Iyy : NGDFloat; Izz : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetMassMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetMaterialGroupID( const body : PNewtonBody; id : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetMaterialGroupID'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetContinuousCollisionMode(const body : PNewtonbody; state : int); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetContinuousCollisionMode'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetJointRecursiveCollision( const body : PNewtonBody; state : unsigned_int ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetJointRecursiveCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetOmega( const body : PNewtonBody; const omega : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetOmega'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetVelocity( const body : PNewtonBody; const velocity : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetVelocity'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetForce( const body : PNewtonBody; const force : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetTorque( const body : PNewtonBody; const torque : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetTorque'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodySetCentreOfMass(const body : PNewtonBody; const com : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetCentreOfMass'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetLinearDamping( const body : PNewtonBody; linearDamp : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetLinearDamping'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetAngularDamping( const body : PNewtonBody; const angularDamp : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetAngularDamping'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodySetUserData( const body : PNewtonBody; userData : Pointer ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodySetCollision( const body : PNewtonBody; const collision : PNewtonCollision ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonBodyGetSleepState( const body : PNewtonBody) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetSleepState'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonBodyGetAutoSleep( const body : PNewtonBody) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetAutoSleep'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodySetAutoSleep( const body : PNewtonBody; state : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetAutoSleep'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function  NewtonBodyGetFreezeState( const body : PNewtonBody) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetFreezeState'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodySetFreezeState( const body : PNewtonBody; state : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetFreezeState'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodySetDestructorCallback( const body : PNewtonBody; callback : NewtonBodyDestructor ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetDestructorCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodySetTransformCallback( const body : PNewtonBody; callback : NewtonSetTransform ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetTransformCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBodyGetTransformCallback( const body : PNewtonBody ): NewtonSetTransform; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetForceAndTorqueCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};


procedure NewtonBodySetForceAndTorqueCallback( const body : PNewtonBody; callback : NewtonApplyForceAndTorque ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodySetForceAndTorqueCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function NewtonBodyGetForceAndTorqueCallback( const body : PNewtonBody ): NewtonApplyForceAndTorque; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetForceAndTorqueCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetUserData( const body : PNewtonBody ) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetWorld( const body : PNewtonBody) : PNewtonWorld; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetWorld'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetCollision( const body : PNewtonBody ) : PNewtonCollision; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetMaterialGroupID( const body : PNewtonBody ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetMaterialGroupID'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonBodyGetContinuousCollisionMode( const body : PNewtonBody ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetContinuousCollisionMode'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetJointRecursiveCollision( const body : PNewtonBody ) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetJointRecursiveCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyGetMatrix( const body : PNewtonBody; matrix : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyGetRotation( const body : PNewtonBody; rotation : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetRotation'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetMassMatrix( const body : PNewtonBody; mass : PNGDFloat; Ixx : PNGDFloat; Iyy : PNGDFloat; Izz : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetMassMatrix'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetInvMass( const body : PNewtonBody; invMass : PNGDFloat; invIxx : PNGDFloat; invIyy : PNGDFloat; invIzz : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetInvMass'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetOmega( const body : PNewtonBody; vector : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetOmega'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetVelocity( const body : PNewtonBody; vector : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetVelocity'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetForce( const body : PNewtonBody; vector : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetTorque( const body : PNewtonBody; vector : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetTorque'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyGetForceAcc( const body : PNewtonBody; vector : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetForceAcc'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyGetTorqueAcc( const body : PNewtonBody; vector : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetTorqueAcc'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetCentreOfMass(const body : PNewtonBody; com : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetCentreOfMass'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function  NewtonBodyGetLinearDamping( const body : PNewtonBody ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetLinearDamping'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetAngularDamping( const body : PNewtonBody; vector : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetAngularDamping'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBodyGetAABB( const body : PNewtonBody; p0 : PNGDFloat; p1 : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetAABB'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyGetFreezeTreshold( const body : PNewtonBody; freezeSpeed2 : PNGDFloat; freezeOmega2 : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetFreezeTreshold'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonBodyGetFirstJoint( const body : PNewtonBody ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetFirstJoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetNextJoint( const body : PNewtonBody; const joint : PNewtonJoint ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetNextJoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetFirstContactJoint( const body : PNewtonBody ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetFirstContactJoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonBodyGetNextContactJoint( const body : PNewtonBody; const contactJoint : PNewtonJoint ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonBodyGetNextContactJoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonContactJointGetFirstContact( const contactJoint : PNewtonJoint ) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonContactJointGetFirstContact'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonContactJointGetNextContact( const contactJoint : PNewtonJoint; contact : Pointer ) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonContactJointGetNextContact'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonContactJointGetContactCount( const contactJoint : PNewtonJoint ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonContactJointGetContactCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonContactJointRemoveContact( const contactJoint : PNewtonJoint; contact : Pointer ); cdecl; external{$IFDEF __GPC__}name 'NewtonContactJointRemoveContact'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function NewtonContactGetMaterial( const contact : Pointer ) : PNewtonMaterial; cdecl; external{$IFDEF __GPC__}name 'NewtonContactGetMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyAddBuoyancyForce( const body : PNewtonBody; fluidDensity : NGDFloat; fluidLinearViscosity : NGDFloat; fluidAngularViscosity : NGDFloat;
                                      const gravityVector : PNGDFloat; buoyancyPlane : NewtonGetBuoyancyPlane; context : Pointer ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyAddBuoyancyForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBodyAddImpulse(const body : PNewtonBody; const pointDeltaVeloc : PNGDFloat; const pointPosit : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBodyAddImpulse'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// Common joint funtions
//
// *****************************************************************************************************************************
function  NewtonJointGetUserData( const joint : PNewtonJoint ) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonJointGetUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonJointSetUserData( const joint : PNewtonJoint; userData : Pointer ); cdecl; external{$IFDEF __GPC__}name 'NewtonJointSetUserData'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonJointGetBody0( const joint : PNewtonJoint ) : PNewtonBody; cdecl; external{$IFDEF __GPC__}name 'NewtonJointGetBody0'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonJointGetBody1( const joint : PNewtonJoint ) : PNewtonBody; cdecl; external{$IFDEF __GPC__}name 'NewtonJointGetBody1'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonJointGetInfo( const joint : PNewtonJoint; info : PNewtonJointRecord ); cdecl; external{$IFDEF __GPC__}name 'NewtonJointGetInfo'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonJointGetCollisionState( const joint : PNewtonJoint ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonJointGetCollisionState'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonJointSetCollisionState( const joint : PNewtonJoint; state : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonJointSetCollisionState'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonJointGetStiffness( const joint : PNewtonJoint): NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonJointGetStiffness'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonJointSetStiffness( const joint: PNewtonJoint; state: NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonJointSetStiffness'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonDestroyJoint( const newtonWorld : PNewtonWorld; const joint : PNewtonJoint ); cdecl; external{$IFDEF __GPC__}name 'NewtonDestroyJoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonJointSetDestructor( const joint : PNewtonJoint; _destructor : NewtonConstraintDestructor ); cdecl; external{$IFDEF __GPC__}name 'NewtonJointSetDestructor'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// Ball and Socket joint functions
//
// *****************************************************************************************************************************
function  NewtonConstraintCreateBall( const newtonWorld : PNewtonWorld; const pivotPoint : PNGDFloat;
                                      const childBody : PNewtonBody; const parentBody : PNewtonBody ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonConstraintCreateBall'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonBallSetUserCallback( const ball : PNewtonJoint; callback : NewtonBallCallBack ); cdecl; external{$IFDEF __GPC__}name 'NewtonBallSetUserCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBallGetJointAngle( const ball : PNewtonJoint; angle : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBallGetJointAngle'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBallGetJointOmega( const ball : PNewtonJoint; omega : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBallGetJointOmega'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBallGetJointForce( const ball : PNewtonJoint; force : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBallGetJointForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonBallSetConeLimits( const ball : PNewtonJoint; const pin : PNGDFloat; maxConeAngle : NGDFloat; maxTwistAngle : NGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonBallSetConeLimits'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// Hinge joint functions
//
// *****************************************************************************************************************************
function  NewtonConstraintCreateHinge( const newtonWorld : PNewtonWorld;
                                       const pivotPoint : PNGDFloat; const pinDir : PNGDFloat;
                                       const childBody : PNewtonBody; const parentBody : PNewtonBody ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonConstraintCreateHinge'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonHingeSetUserCallback( const hinge : PNewtonJoint; callback : NewtonHingeCallBack ); cdecl; external{$IFDEF __GPC__}name 'NewtonHingeSetUserCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonHingeGetJointAngle( const hinge : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonHingeGetJointAngle'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonHingeGetJointOmega( const hinge : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonHingeGetJointOmega'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonHingeGetJointForce( const hinge : PNewtonJoint; force : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonHingeGetJointForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonHingeCalculateStopAlpha( const hinge : PNewtonJoint; const desc : PNewtonHingeSliderUpdateDesc; angle : NGDFloat ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonHingeCalculateStopAlpha'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// Slider joint functions
//
// *****************************************************************************************************************************
function  NewtonConstraintCreateSlider( const newtonWorld : PNewtonWorld;
                                        const pivotPoint : PNGDFloat; const pinDir : PNGDFloat;
                                        const childBody : PNewtonBody; const parentBody : PNewtonBody ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonConstraintCreateSlider'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonSliderSetUserCallback( const slider : PNewtonJoint; callback : NewtonSliderCallBack ); cdecl; external{$IFDEF __GPC__}name 'NewtonSliderSetUserCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonSliderGetJointPosit( const slider : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonSliderGetJointPosit'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonSliderGetJointVeloc( const slider : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonSliderGetJointVeloc'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonSliderGetJointForce( const slider : PNewtonJoint; force : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonSliderGetJointForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonSliderCalculateStopAccel( const slider : PNewtonJoint; const desc : PNewtonHingeSliderUpdateDesc; position : NGDFloat ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonSliderCalculateStopAccel'{$ELSE}NewtonDLL{$ENDIF __GPC__};


// *****************************************************************************************************************************
//
// Corkscrew joint functions
//
// *****************************************************************************************************************************
function  NewtonConstraintCreateCorkscrew( const newtonWorld : PNewtonWorld;
                                           const pivotPoint : PNGDFloat; const pinDir : PNGDFloat;
                                           const childBody : PNewtonBody; const parentBody : PNewtonBody ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonConstraintCreateCorkscrew'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonCorkscrewSetUserCallback( const corkscrew : PNewtonJoint; callback : NewtonCorkscrewCallBack ); cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewSetUserCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCorkscrewGetJointPosit( const corkscrew : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewGetJointPosit'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCorkscrewGetJointAngle( const corkscrew : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewGetJointAngle'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCorkscrewGetJointVeloc( const corkscrew : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewGetJointVeloc'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCorkscrewGetJointOmega( const corkscrew : PNewtonJoint ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewGetJointOmega'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonCorkscrewGetJointForce( const corkscrew : PNewtonJoint; force : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewGetJointForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCorkscrewCalculateStopAlpha( const corkscrew : PNewtonJoint; const desc : PNewtonHingeSliderUpdateDesc; angle : NGDFloat ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewCalculateStopAlpha'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonCorkscrewCalculateStopAccel( const corkscrew : PNewtonJoint; const desc : PNewtonHingeSliderUpdateDesc; position : NGDFloat ) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonCorkscrewCalculateStopAccel'{$ELSE}NewtonDLL{$ENDIF __GPC__};


// *****************************************************************************************************************************
//
// Universal joint functions
//
// *****************************************************************************************************************************
function  NewtonConstraintCreateUniversal( const newtonWorld: PNewtonWorld; const pivotPoint: PNGDFloat; const pinDir0: PNGDFloat;
                                          const pinDir1: PNGDFloat; const childBody: PNewtonBody; const parentBody: PNewtonBody): PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonConstraintCreateUniversal'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUniversalSetUserCallback(const universal: PNewtonJoint; callback: NewtonUniversalCallback); cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalSetUserCallback'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonUniversalGetJointAngle0(const universal: PNewtonJoint):NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalGetJointAngle0'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonUniversalGetJointAngle1(const universal: PNewtonJoint):NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalGetJointAngle1'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonUniversalGetJointOmega0(const universal: PNewtonJoint):NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalGetJointOmega0'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonUniversalGetJointOmega1(const universal: PNewtonJoint):NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalGetJointOmega1'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUniversalGetJointForce(const universal: PNewtonJoint; force: PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalGetJointForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonUniversalCalculateStopAlpha0(const universal : PNewtonJoint; const desc: PNewtonHingeSliderUpdateDesc; angle: NGDFloat): NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalCalculateStopAlpha0'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonUniversalCalculateStopAlpha1(const universal : PNewtonJoint; const desc: PNewtonHingeSliderUpdateDesc; angle: NGDFloat): NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonUniversalCalculateStopAlpha1'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// Up vector joint unctions
//
// *****************************************************************************************************************************
function  NewtonConstraintCreateUpVector( const newtonWorld : PNewtonWorld; const pinDir : PNGDFloat; const body : PNewtonBody ) : PNewtonJoint; cdecl; external{$IFDEF __GPC__}name 'NewtonConstraintCreateUpVector'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUpVectorGetPin( const upVector : PNewtonJoint; pin : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonUpVectorGetPin'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUpVectorSetPin( const upVector : PNewtonJoint; const pin : PNGDFloat ); cdecl; external{$IFDEF __GPC__}name 'NewtonUpVectorSetPin'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// *****************************************************************************************************************************
//
// User defined bilateral Joint
//
// *****************************************************************************************************************************
function  NewtonConstraintCreateUserJoint(const NewtonWorld : PNewtonWorld; MaxDOF : Integer; Callback : PNewtonUserBilateralCallBack;
                                          GetInfo : PNewtonUserBilateralGetInfoCallBack; const ChildBody: PNewtonBody; const parentBody: PNewtonBody): PNewtonJoint;
                                          cdecl; external{$IFDEF __GPC__}name 'NewtonConstraintCreateUserJoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointAddLinearRow(const Joint : PNewtonJoint; const pivot0 : PNGDFloat; const pivot1 : PNGDFloat; const Dir : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointAddLinearRow'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointAddAngularRow(const Joint : PNewtonJoint; RelativeAngle : NGDFloat; const Dir : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointAddAngularRow'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointAddGeneralRow(const Joint : PNewtonJoint; const Jacobian0 : PNGDFloat; const Jacobian1 : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointAddGeneralRow'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointSetRowMinimumFriction(const Joint : PNewtonJoint; Friction : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointSetRowMinimumFriction'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointSetRowMaximumFriction(const Joint : PNewtonJoint; Friction : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointSetRowMaximumFriction'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointSetRowAcceleration(const Joint : PNewtonJoint; Acceleration : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointSetRowAcceleration'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointSetRowSpringDamperAcceleration(const joint : PNewtonJoint; springK : NGDFloat; springD : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointSetRowSpringDamperAcceleration'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonUserJointSetRowStiffness(const Joint : PNewtonJoint; Stiffness : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointSetRowStiffness'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonUserJointGetRowForce (const Joint : PNewtonJoint; Row : Int) : NGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonUserJointGetRowForce'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// **********************************************************************************************
//
// Mesh joint functions
//
// **********************************************************************************************

// 2.15 - Added parameter "world" - SW
function  NewtonMeshCreate (const World : PNewtonWorld) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCreate'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshCreateFromMesh(const mesh : PNewtonMesh) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCreateFromMesh'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshCreateFromCollision (const collision : PNewtonCollision) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCreateFromCollision'{$ELSE}NewtonDLL{$ENDIF __GPC__};
// 2.15 - Added parameter "world", renamed "textureMatrix" to "textureMatrix0" and added parameter "textureMatrix1" - SW
function  NewtonMeshCreatePlane (const World : PNewtonWorld; const locationMatrix : PNGDFloat; width : NGDFloat; breadth : NGDFloat; material : Int; const textureMatrix0 : PNGDFloat; const textureMatrix1) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCreatePlane'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshConvexApproximation (const mesh : PNewtonMesh; const world : PNewtonWorld; maxConvexity : NGDFloat; maxCount : int; convexArray : PNewtonCollision) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshConvexApproximation'{$ELSE}NewtonDLL{$ENDIF __GPC__};


procedure NewtonMeshDestroy(const mesh : PNewtonMesh); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshDestroy'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// 2.15 - Changed dataytpe for "matrix" from NGDFloat to PNGDFloat - SW
procedure NewtonMeshCalculateOOBB(const mesh : PNewtonMesh; matrix : PNGDFloat; x : PNGDFloat; y : PNGDFloat; z : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCalculateOOBB'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMeshCalculateVertexNormals(const mesh : PNewtonMesh; angleInRadians : NGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCalculateVertexNormals'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshApplySphericalMapping(const mesh : PNewtonMesh; material : int); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshApplySphericalMapping'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshApplyBoxMapping(const mesh : PNewtonMesh; front,side,top : int); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshApplyBoxMapping'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshApplyCylindricalMapping(const mesh : PNewtonMesh; cylinderMaterial,capMaterial : int); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshApplyCylindricalMapping'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshIsOpenMesh (const mesh : PNewtonMesh) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshIsOpenMesh'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshPolygonize (const mesh : PNewtonMesh); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshPolygonize'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshTriangulate (const mesh : PNewtonMesh); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshTriangulate'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshUnion (const mesh : PNewtonMesh; clipper : PNewtonMesh; clipperMatrix : PNGDFloat) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshUnion'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshDifference (const mesh : PNewtonMesh; clipper : PNewtonMesh; clipperMatrix : PNGDFloat) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshDifference'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshIntersection (const mesh : PNewtonMesh; clipper : PNewtonMesh; clipperMatrix : PNGDFloat) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshIntersection'{$ELSE}NewtonDLL{$ENDIF __GPC__};

// WARNING: Unknown if the NewtonMesh** should be a PNewtonMesh as i don't know what ** means - Stucuk
procedure  NewtonMeshClip (const mesh : PNewtonMesh; const clipper : PNewtonMesh; const clippermatrix : PNGDFloat; const topMesh : PNewtonMesh; const bottomMesh : PNewtonMesh); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshClip'{$ELSE}NewtonDLL{$ENDIF __GPC__};
//NEWTON_API void NewtonMeshClip (const NewtonMesh* mesh, const NewtonMesh* clipper, const dFloat* clipperMatrix, NewtonMesh** topMesh, NewtonMesh** bottomMesh);

procedure NewtonMeshBeginFace(const mesh : PNewtonMesh); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshBeginFace'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshAddFace(const mesh : PNewtonMesh; vertexCount : int; const vertex : PNGDFloat; strideInBytes,materialIndex : int ); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshAddFace'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshEndFace(const mesh : PNewtonMesh); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshEndFace'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMeshBuildFromVertexListIndexList(const mesh : PNewtonMesh; faceCount : int; const faceIndexCount : PInt; const faceMaterialIndex : PInt;
                                                 const vertex : PNGDFloat; vertexStrideInBytes : Int; const vertexIndex : PInt;
                                                 const normal : PNGDFloat; normalStrideInBytes : Int; const normalIndex : PInt;
                                                 const uv0    : PNGDFloat; uv0StrideInBytes    : Int; const uv0Index    : PInt;
                                                 const uv1    : PNGDFloat; uv1StrideInBytes    : Int; const uv1Index    : PInt); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshBuildFromVertexListIndexList'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMeshGetVertexStreams(const mesh : PNewtonMesh; vertexStrideInByte : int; vertex : PNGDFloat; normalStrideInByte : int; normal : PNGDFloat; uvStrideInByte1 : int; uv1 : PNGDFloat; uvStrideInByte2 : int; uv2 : PNGDFloat); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetVertexStreams'{$ELSE}NewtonDLL{$ENDIF __GPC__};

procedure NewtonMeshGetIndirectVertexStreams(const mesh : PNewtonMesh; vertexStrideInByte : int; vertex : PNGDFloat; vertexIndices : PInt; vertexCount : PInt; normalStrideInByte : int; normal : PNGDFloat; normalIndices : PInt; normalCount : PInt; uvStrideInByte1 : int; uv1 : PNGDFloat; uvIndices1 : PInt; uvCount1 : PInt; uvStrideInByte2 : int; uv2 : PNGDFloat; uvIndices2 : PInt; uvCount2 : PInt); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetIndirectVertexStreams'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshBeginHandle (const mesh : PNewtonMesh) : Pointer; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshBeginHandle'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshEndHandle (const mesh : PNewtonMesh; Handle : Pointer); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshEndHandle'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshFirstMaterial (const mesh : PNewtonMesh; Handle : Pointer) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshFirstMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshNextMaterial (const mesh : PNewtonMesh; Handle : Pointer; materialID : int) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshNextMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshMaterialGetMaterial (const mesh : PNewtonMesh; Handle : Pointer; materialID : int) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshMaterialGetMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshMaterialGetIndexCount (const mesh : PNewtonMesh; Handle : Pointer; materialID : int) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshMaterialGetIndexCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshMaterialGetIndexStream(const mesh : PNewtonMesh; Handle : Pointer; materialID : int; index : PInt); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshMaterialGetIndexStream'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshMaterialGetIndexStreamShort(const mesh : PNewtonMesh; Handle : Pointer; materialID : int; index : PShort); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshMaterialGetIndexStreamShort'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshCreateFirstfloatSegment (const mesh : PNewtonMesh) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCreateFirstfloatSegment'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshCreateNextfloatSegment (const mesh : PNewtonMesh; Segment : PNewtonMesh) : PNewtonMesh; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshCreateNextfloatSegment'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshGetTotalFaceCount (const mesh : PNewtonMesh) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetTotalFaceCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetTotalIndexCount (const mesh : PNewtonMesh) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetTotalIndexCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshGetFaces (const mesh : PNewtonMesh; const faceIndexCount : PInt; faceMaterial : PInt; faceIndices : PInt); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFaces'{$ELSE}NewtonDLL{$ENDIF __GPC__};


function  NewtonMeshGetPointCount (const mesh : PNewtonMesh) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetPointCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetPointStrideInByte (const mesh : PNewtonMesh) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetPointStrideInByte'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetPointArray (const mesh : PNewtonMesh) : PNGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetPointArray'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshGetVertexCount (const mesh : PNewtonMesh) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetVertexCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshGetVertexStrideInByte (const mesh : PNewtonMesh) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetVertexStrideInByte'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetVertexArray (const mesh : PNewtonMesh) : PNGDFloat; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetVertexArray'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshGetFirstVertex (const mesh : PNewtonMesh) : PNewtonMeshVertex; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFirstVertex'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetNextVertex (const mesh : PNewtonMesh; vertex : PNewtonMeshVertex) : PNewtonMeshVertex; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetNextVertex'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetVertexIndex (const mesh : PNewtonMesh; vertex : PNewtonMeshVertex) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetVertexIndex'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshGetFirstPoint (const mesh : PNewtonMesh) : PNewtonMeshPoint; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFirstPoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetNextPoint (const mesh : PNewtonMesh; const point : PNewtonMeshPoint ) : PNewtonMeshPoint; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetNextPoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetPointIndex (const mesh : PNewtonMesh; const point : PNewtonMeshPoint ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetPointIndex'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetVertexIndexFromPoint (const mesh : PNewtonMesh; const point : PNewtonMeshPoint ) : int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetVertexIndexFromPoint'{$ELSE}NewtonDLL{$ENDIF __GPC__};

function  NewtonMeshGetFirstEdge (const mesh : PNewtonMesh) : PNewtonMeshEdge; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFirstEdge'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetNextEdge (const mesh : PNewtonMesh; edge : PNewtonMeshEdge) : PNewtonMeshEdge; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetNextEdge'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshGetEdgeIndices (const mesh : PNewtonMesh; const edge : PNewtonMeshEdge; v0 : PInt; v1 : PInt); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetEdgeIndices'{$ELSE}NewtonDLL{$ENDIF __GPC__};
//NEWTON_API void NewtonMeshGetEdgePointIndices (const NewtonMesh *mesh, const void* edge, int* v0, int* v1);

function  NewtonMeshGetFirstFace (const mesh : PNewtonMesh) : PNewtonMeshFace; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFirstFace'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetNextFace (const mesh : PNewtonMesh; const face : PNewtonMeshFace) : PNewtonMeshFace; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetNextFace'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshIsFaceOpen (const mesh : PNewtonMesh; const face : PNewtonMeshFace) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshIsFaceOpen'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetFaceMaterial (const mesh : PNewtonMesh; const face : PNewtonMeshFace) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFaceMaterial'{$ELSE}NewtonDLL{$ENDIF __GPC__};
function  NewtonMeshGetFaceIndexCount (const mesh : PNewtonMesh; const face : PNewtonMeshFace) : Int; cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFaceIndexCount'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshGetFaceIndices (const mesh : PNewtonMesh; const face : PNewtonMeshFace; indices : PInt); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFaceIndices'{$ELSE}NewtonDLL{$ENDIF __GPC__};
procedure NewtonMeshGetFacePointIndices (const mesh : PNewtonMesh; const face : PNewtonMeshFace; indices : PInt); cdecl; external{$IFDEF __GPC__}name 'NewtonMeshGetFacePointIndices'{$ELSE}NewtonDLL{$ENDIF __GPC__};

implementation

end.

