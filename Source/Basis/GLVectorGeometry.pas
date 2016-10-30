//
// This unit is part of the GLScene Project, http://glscene.org
//
{
  Base classes and structures for GLScene.

  Most common functions/procedures come in various flavours (using overloads),
  the naming convention is :
  TypeOperation: functions returning a result, or accepting a "var" as last
  parameter to place result (VectorAdd, VectorCrossProduct...)
  OperationType : procedures taking as first parameter a "var" that will be
  used as operand and result (AddVector, CombineVector...)

  As a general rule, procedures implementations (asm or not) are the fastest
  (up to 800% faster than function equivalents), due to reduced return value
  duplication overhead (the exception being the matrix operations).

  For better performance, it is recommended  not  to use the "Math" unit
  that comes with Delphi, and only use functions/procedures from this unit
  (the single-based functions have been optimized and are up to 100% faster,
  than extended-based ones from "Math").

  3DNow! SIMD instructions are automatically detected and used in *some* of the
  functions/procedures, typical gains (over FPU implementation) are approx a
  100% speed increase on K6-2/3, and 20-60% on K7, and sometimes more
  (f.i. 650% on 4x4 matrix multiplication for the K6, 300% for RSqrt on K7).

  Cyrix, NexGen and other "exotic" CPUs may fault in the 3DNow! detection
  (initialization section), comment out or replace with your own detection
  routines if you want to support these. All AMD processors after K5, and
  all Intel processors after Pentium should be immune to this.
}
unit GLVectorGeometry;

interface

uses
  System.SysUtils, System.Types, System.Math,
  //GLS
  GLVectorTypes;

const
  cMaxArray = (MaxInt shr 4);
  cColinearBias = 1E-8;

{$I GLScene.inc}

type
  // data types needed for 3D graphics calculation,
  // included are 'C like' aliases for each type (to be
  // conformal with OpenGL types)
  PFloat = PSingle;

  PTexPoint = ^TTexPoint;

  TTexPoint = packed record
    S, T: Single;
  end;

  // types to specify continous streams of a specific type
  // switch off range checking to access values beyond the limits
  PByteVector = ^TByteVector;
  PByteArray = PByteVector;
  TByteVector = array [0 .. cMaxArray] of Byte;

  PWordVector = ^TWordVector;
  TWordVector = array [0 .. cMaxArray] of Word;

  PIntegerVector = ^TIntegerVector;
  PIntegerArray = PIntegerVector;
  TIntegerVector = array [0 .. cMaxArray] of Integer;

  PFloatVector = ^TFloatVector;
  PFloatArray = PFloatVector;
  PSingleArray = PFloatArray;
  TFloatVector = array [0 .. cMaxArray] of Single;
  TSingleArray = array of Single;

  PDoubleVector = ^TDoubleVector;
  PDoubleArray = PDoubleVector;
  TDoubleVector = array [0 .. cMaxArray] of Double;

  PExtendedVector = ^TExtendedVector;
  PExtendedArray = PExtendedVector;
  TExtendedVector = array [0 .. cMaxArray] of Extended;

  PPointerVector = ^TPointerVector;
  PPointerArray = PPointerVector;
  TPointerVector = array [0 .. cMaxArray] of Pointer;

  PCardinalVector = ^TCardinalVector;
  PCardinalArray = PCardinalVector;
  TCardinalVector = array [0 .. cMaxArray] of Cardinal;

  PLongWordVector = ^TLongWordVector;
  PLongWordArray = PLongWordVector;
  TLongWordVector = array [0 .. cMaxArray] of LongWord;

  // common vector and matrix types with predefined limits
  // indices correspond like: x -> 0
  // y -> 1
  // z -> 2
  // w -> 3

  PHomogeneousByteVector = ^THomogeneousByteVector;
  THomogeneousByteVector = TVector4b;

  PHomogeneousWordVector = ^THomogeneousWordVector;
  THomogeneousWordVector = TVector4w;

  PHomogeneousIntVector = ^THomogeneousIntVector;
  THomogeneousIntVector = TVector4i;

  PHomogeneousFltVector = ^THomogeneousFltVector;
  THomogeneousFltVector = TVector4f;

  PHomogeneousDblVector = ^THomogeneousDblVector;
  THomogeneousDblVector = TVector4d;

  PHomogeneousExtVector = ^THomogeneousExtVector;
  THomogeneousExtVector = TVector4e;

  PHomogeneousPtrVector = ^THomogeneousPtrVector;
  THomogeneousPtrVector = TVector4p;

  PAffineByteVector = ^TAffineByteVector;
  TAffineByteVector = TVector3b;

  PAffineWordVector = ^TAffineWordVector;
  TAffineWordVector = TVector3w;

  PAffineIntVector = ^TAffineIntVector;
  TAffineIntVector = TVector3i;

  PAffineFltVector = ^TAffineFltVector;
  TAffineFltVector = TVector3f;

  PAffineDblVector = ^TAffineDblVector;
  TAffineDblVector = TVector3d;

  PAffineExtVector = ^TAffineExtVector;
  TAffineExtVector = TVector3e;

  PAffinePtrVector = ^TAffinePtrVector;
  TAffinePtrVector = TVector3p;

  PVector2f = ^TVector2f;

  // some simplified names
  PVector = ^TVector;
  TVector = THomogeneousFltVector;

  PHomogeneousVector = ^THomogeneousVector;
  THomogeneousVector = THomogeneousFltVector;

  PAffineVector = ^TAffineVector;
  TAffineVector = TVector3f;

  PVertex = ^TVertex;
  TVertex = TAffineVector;

  // arrays of vectors
  PAffineVectorArray = ^TAffineVectorArray;
  TAffineVectorArray = array [0 .. MaxInt shr 4] of TAffineVector;

  PVectorArray = ^TVectorArray;
  TVectorArray = array [0 .. MaxInt shr 5] of TVector;

  PTexPointArray = ^TTexPointArray;
  TTexPointArray = array [0 .. MaxInt shr 4] of TTexPoint;

  // matrices
  THomogeneousByteMatrix = TMatrix4b;

  THomogeneousWordMatrix = array [0 .. 3] of THomogeneousWordVector;

  THomogeneousIntMatrix = TMatrix4i;

  THomogeneousFltMatrix = TMatrix4f;

  THomogeneousDblMatrix = TMatrix4d;

  THomogeneousExtMatrix = array [0 .. 3] of THomogeneousExtVector;

  TAffineByteMatrix = TMatrix3b;

  TAffineWordMatrix = array [0 .. 2] of TAffineWordVector;

  TAffineIntMatrix = TMatrix3i;

  TAffineFltMatrix = TMatrix3f;

  TAffineDblMatrix = TMatrix3d;

  TAffineExtMatrix = array [0 .. 2] of TAffineExtVector;

  // some simplified names
  PMatrix = ^TMatrix;
  TMatrix = THomogeneousFltMatrix;

  TMatrixArray = array [0 .. MaxInt shr 7] of TMatrix;
  PMatrixArray = ^TMatrixArray;

  PHomogeneousMatrix = ^THomogeneousMatrix;
  THomogeneousMatrix = THomogeneousFltMatrix;

  PAffineMatrix = ^TAffineMatrix;
  TAffineMatrix = TAffineFltMatrix;

  { A plane equation.
    Defined by its equation A.x+B.y+C.z+D , a plane can be mapped to the
    homogeneous space coordinates, and this is what we are doing here.
    The typename is just here for easing up data manipulation. }
  THmgPlane = TVector;
  TDoubleHmgPlane = THomogeneousDblVector;

  // q = ([x, y, z], w)
  PQuaternion = ^TQuaternion;

  TQuaternion = record
    ImagPart: TAffineVector;
    RealPart: Single;
  end;

  PQuaternionArray = ^TQuaternionArray;
  TQuaternionArray = array [0 .. MaxInt shr 5] of TQuaternion;

  TRectangle = record
    Left, Top, Width, Height: Integer;
  end;

  TFrustum = record
    pLeft, pTop, pRight, pBottom, pNear, pFar: THmgPlane;
  end;

  TTransType = (ttScaleX, ttScaleY, ttScaleZ, ttShearXY, ttShearXZ, ttShearYZ,
    ttRotateX, ttRotateY, ttRotateZ, ttTranslateX, ttTranslateY, ttTranslateZ,
    ttPerspectiveX, ttPerspectiveY, ttPerspectiveZ, ttPerspectiveW);

  // used to describe a sequence of transformations in following order:
  // [Sx][Sy][Sz][ShearXY][ShearXZ][ShearZY][Rx][Ry][Rz][Tx][Ty][Tz][P(x,y,z,w)]
  // constants are declared for easier access (see MatrixDecompose below)
  TTransformations = array [TTransType] of Single;

  TPackedRotationMatrix = array [0 .. 2] of SmallInt;

const
  // useful constants

  // TexPoints (2D space)
  XTexPoint: TTexPoint = (S: 1; T: 0);
  YTexPoint: TTexPoint = (S: 0; T: 1);
  XYTexPoint: TTexPoint = (S: 1; T: 1);
  NullTexPoint: TTexPoint = (S: 0; T: 0);
  MidTexPoint: TTexPoint = (S: 0.5; T: 0.5);

  // standard vectors
  XVector: TAffineVector = (X: 1; Y: 0; Z: 0);
  YVector: TAffineVector = (X: 0; Y: 1; Z: 0);
  ZVector: TAffineVector = (X: 0; Y: 0; Z: 1);
  XYVector: TAffineVector = (X: 1; Y: 1; Z: 0);
  XZVector: TAffineVector = (X: 1; Y: 0; Z: 1);
  YZVector: TAffineVector = (X: 0; Y: 1; Z: 1);
  XYZVector: TAffineVector = (X: 1; Y: 1; Z: 1);
  NullVector: TAffineVector = (X: 0; Y: 0; Z: 0);
  MinusXVector: TAffineVector = (X: - 1; Y: 0; Z: 0);
  MinusYVector: TAffineVector = (X: 0; Y: - 1; Z: 0);
  MinusZVector: TAffineVector = (X: 0; Y: 0; Z: - 1);
  // standard homogeneous vectors
  XHmgVector: THomogeneousVector = (X: 1; Y: 0; Z: 0; W: 0);
  YHmgVector: THomogeneousVector = (X: 0; Y: 1; Z: 0; W: 0);
  ZHmgVector: THomogeneousVector = (X: 0; Y: 0; Z: 1; W: 0);
  WHmgVector: THomogeneousVector = (X: 0; Y: 0; Z: 0; W: 1);
  XYHmgVector: THomogeneousVector = (X: 1; Y: 1; Z: 0; W: 0);
  YZHmgVector: THomogeneousVector = (X: 0; Y: 1; Z: 1; W: 0);
  XZHmgVector: THomogeneousVector = (X: 1; Y: 0; Z: 1; W: 0);
  XYZHmgVector: THomogeneousVector = (X: 1; Y: 1; Z: 1; W: 0);
  XYZWHmgVector: THomogeneousVector = (X: 1; Y: 1; Z: 1; W: 1);
  NullHmgVector: THomogeneousVector = (X: 0; Y: 0; Z: 0; W: 0);
  // standard homogeneous points
  XHmgPoint: THomogeneousVector = (X: 1; Y: 0; Z: 0; W: 1);
  YHmgPoint: THomogeneousVector = (X: 0; Y: 1; Z: 0; W: 1);
  ZHmgPoint: THomogeneousVector = (X: 0; Y: 0; Z: 1; W: 1);
  WHmgPoint: THomogeneousVector = (X: 0; Y: 0; Z: 0; W: 1);
  NullHmgPoint: THomogeneousVector = (X: 0; Y: 0; Z: 0; W: 1);

  IdentityMatrix: TAffineMatrix = (V: ((X: 1; Y: 0; Z: 0), (X: 0; Y: 1;
    Z: 0), (X: 0; Y: 0; Z: 1)));
  IdentityHmgMatrix: TMatrix = (V: ((X: 1; Y: 0; Z: 0; W: 0), (X: 0; Y: 1; Z: 0;
    W: 0), (X: 0; Y: 0; Z: 1; W: 0), (X: 0; Y: 0; Z: 0; W: 1)));
  IdentityHmgDblMatrix: THomogeneousDblMatrix = (V: ((X: 1; Y: 0; Z: 0;
    W: 0), (X: 0; Y: 1; Z: 0; W: 0), (X: 0; Y: 0; Z: 1; W: 0), (X: 0; Y: 0;
    Z: 0; W: 1)));
  EmptyMatrix: TAffineMatrix = (V: ((X: 0; Y: 0; Z: 0), (X: 0; Y: 0;
    Z: 0), (X: 0; Y: 0; Z: 0)));
  EmptyHmgMatrix: TMatrix = (V: ((X: 0; Y: 0; Z: 0; W: 0), (X: 0; Y: 0; Z: 0;
    W: 0), (X: 0; Y: 0; Z: 0; W: 0), (X: 0; Y: 0; Z: 0; W: 0)));


  // Quaternions

  IdentityQuaternion: TQuaternion = (ImagPart: (X: 0; Y: 0; Z: 0); RealPart: 1);

  // some very small numbers
  EPSILON: Single = 1E-40;
  EPSILON2: Single = 1E-30;

  // ------------------------------------------------------------------------------
  // Vector functions
  // ------------------------------------------------------------------------------

function TexPointMake(const S, T: Single): TTexPoint;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function AffineVectorMake(const X, Y, Z: Single): TAffineVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function AffineVectorMake(const V: TVector): TAffineVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetAffineVector(out V: TAffineVector; const X, Y, Z: Single);
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TAffineVector; const X, Y, Z: Single); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TAffineVector; const vSrc: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TAffineVector; const vSrc: TAffineVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TAffineDblVector; const vSrc: TAffineVector);
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TAffineDblVector; const vSrc: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorMake(const V: TAffineVector; W: Single = 0): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorMake(const X, Y, Z: Single; W: Single = 0): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function PointMake(const X, Y, Z: Single): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function PointMake(const V: TAffineVector): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function PointMake(const V: TVector): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TVector; const X, Y, Z: Single; W: Single = 0);
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TVector; const av: TAffineVector; W: Single = 0);
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure SetVector(out V: TVector; const vSrc: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure MakePoint(out V: TVector; const X, Y, Z: Single); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure MakePoint(out V: TVector; const av: TAffineVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure MakePoint(out V: TVector; const av: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure MakeVector(out V: TAffineVector; const X, Y, Z: Single); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure MakeVector(out V: TVector; const X, Y, Z: Single); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure MakeVector(out V: TVector; const av: TAffineVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure MakeVector(out V: TVector; const av: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure RstVector(var V: TAffineVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM_VICE_ASM}inline; {$ENDIF}
procedure RstVector(var V: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM_VICE_ASM}inline; {$ENDIF}
// 2
function VectorEquals(const Vector1, Vector2: TVector2f): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const Vector1, Vector2: TVector2i): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector2d): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector2s): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector2b): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// 3
// function VectorEquals(const V1, V2: TVector3f): Boolean; overload; //declared further
function VectorEquals(const V1, V2: TVector3i): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector3d): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector3s): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector3b): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// 4
// function VectorEquals(const V1, V2: TVector4f): Boolean; overload; //declared further
function VectorEquals(const V1, V2: TVector4i): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector4d): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector4s): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorEquals(const V1, V2: TVector4b): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// 3x3
function MatrixEquals(const Matrix1, Matrix2: TMatrix3f): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix3i): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix3d): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix3s): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix3b): Boolean; overload;

// 4x4
function MatrixEquals(const Matrix1, Matrix2: TMatrix4f): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix4i): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix4d): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix4s): Boolean; overload;
function MatrixEquals(const Matrix1, Matrix2: TMatrix4b): Boolean; overload;

// 2x
function Vector2fMake(const X, Y: Single): TVector2f; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2iMake(const X, Y: Longint): TVector2i; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2sMake(const X, Y: SmallInt): TVector2s; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2dMake(const X, Y: Double): TVector2d; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2bMake(const X, Y: Byte): TVector2b; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2fMake(const Vector: TVector3f): TVector2f; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2iMake(const Vector: TVector3i): TVector2i; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2sMake(const Vector: TVector3s): TVector2s; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2dMake(const Vector: TVector3d): TVector2d; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2bMake(const Vector: TVector3b): TVector2b; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2fMake(const Vector: TVector4f): TVector2f; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2iMake(const Vector: TVector4i): TVector2i; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2sMake(const Vector: TVector4s): TVector2s; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2dMake(const Vector: TVector4d): TVector2d; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector2bMake(const Vector: TVector4b): TVector2b; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// 3x
function Vector3fMake(const X: Single; const Y: Single = 0; const Z: Single = 0)
  : TVector3f; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3iMake(const X: Longint; const Y: Longint = 0;
  const Z: Longint = 0): TVector3i; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3sMake(const X: SmallInt; const Y: SmallInt = 0;
  const Z: SmallInt = 0): TVector3s; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3dMake(const X: Double; const Y: Double = 0; const Z: Double = 0)
  : TVector3d; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3bMake(const X: Byte; const Y: Byte = 0; const Z: Byte = 0)
  : TVector3b; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3fMake(const Vector: TVector2f; const Z: Single = 0): TVector3f;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3iMake(const Vector: TVector2i; const Z: Longint = 0): TVector3i;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3sMake(const Vector: TVector2s; const Z: SmallInt = 0)
  : TVector3s; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3dMake(const Vector: TVector2d; const Z: Double = 0): TVector3d;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3bMake(const Vector: TVector2b; const Z: Byte = 0): TVector3b;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3fMake(const Vector: TVector4f): TVector3f; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3iMake(const Vector: TVector4i): TVector3i; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3sMake(const Vector: TVector4s): TVector3s; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3dMake(const Vector: TVector4d): TVector3d; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector3bMake(const Vector: TVector4b): TVector3b; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// 4x
function Vector4fMake(const X: Single; const Y: Single = 0; const Z: Single = 0;
  const W: Single = 0): TVector4f; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline;
{$ENDIF}
function Vector4iMake(const X: Longint; const Y: Longint = 0;
  const Z: Longint = 0; const W: Longint = 0): TVector4i; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4sMake(const X: SmallInt; const Y: SmallInt = 0;
  const Z: SmallInt = 0; const W: SmallInt = 0): TVector4s; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4dMake(const X: Double; const Y: Double = 0; const Z: Double = 0;
  const W: Double = 0): TVector4d; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline;
{$ENDIF}
function Vector4bMake(const X: Byte; const Y: Byte = 0; const Z: Byte = 0;
  const W: Byte = 0): TVector4b; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline;
{$ENDIF}
function Vector4fMake(const Vector: TVector3f; const W: Single = 0): TVector4f;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4iMake(const Vector: TVector3i; const W: Longint = 0): TVector4i;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4sMake(const Vector: TVector3s; const W: SmallInt = 0)
  : TVector4s; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4dMake(const Vector: TVector3d; const W: Double = 0): TVector4d;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4bMake(const Vector: TVector3b; const W: Byte = 0): TVector4b;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4fMake(const Vector: TVector2f; const Z: Single = 0;
  const W: Single = 0): TVector4f; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline;
{$ENDIF}
function Vector4iMake(const Vector: TVector2i; const Z: Longint = 0;
  const W: Longint = 0): TVector4i; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4sMake(const Vector: TVector2s; const Z: SmallInt = 0;
  const W: SmallInt = 0): TVector4s; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function Vector4dMake(const Vector: TVector2d; const Z: Double = 0;
  const W: Double = 0): TVector4d; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline;
{$ENDIF}
function Vector4bMake(const Vector: TVector2b; const Z: Byte = 0;
  const W: Byte = 0): TVector4b; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline;
{$ENDIF}
// : Vector comparison functions:
// ComparedVector
// 3f
function VectorMoreThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;
function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;

function VectorLessThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;
function VectorLessEqualThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;
// 4f
function VectorMoreThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;
function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;

function VectorLessThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;
function VectorLessEqualThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;
// 3i
function VectorMoreThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;
function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;

function VectorLessThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;
function VectorLessEqualThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;
// 4i
function VectorMoreThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;
function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;

function VectorLessThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;
function VectorLessEqualThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;

// 3s
function VectorMoreThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;
function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;

function VectorLessThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;
function VectorLessEqualThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;
// 4s
function VectorMoreThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;
function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;

function VectorLessThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;
function VectorLessEqualThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;

// ComparedNumber
// 3f
function VectorMoreThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;
function VectorMoreEqualThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;

function VectorLessThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;
function VectorLessEqualThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;
// 4f
function VectorMoreThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;
function VectorMoreEqualThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;

function VectorLessThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;
function VectorLessEqualThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;
// 3i
function VectorMoreThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;
function VectorMoreEqualThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;

function VectorLessThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;
function VectorLessEqualThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;
// 4i
function VectorMoreThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;
function VectorMoreEqualThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;

function VectorLessThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;
function VectorLessEqualThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;
// 3s
function VectorMoreThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;
function VectorMoreEqualThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;

function VectorLessThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;
function VectorLessEqualThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;
// 4s
function VectorMoreThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;
function VectorMoreEqualThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;

function VectorLessThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;
function VectorLessEqualThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;

function VectorAdd(const V1, V2: TVector2f): TVector2f; overload;
// : Returns the sum of two affine vectors
function VectorAdd(const V1, V2: TAffineVector): TAffineVector; overload;
// : Adds two vectors and places result in vr
procedure VectorAdd(const V1, V2: TAffineVector;
  var vr: TAffineVector); overload;
procedure VectorAdd(const V1, V2: TAffineVector; vr: PAffineVector); overload;
// : Returns the sum of two homogeneous vectors
function VectorAdd(const V1, V2: TVector): TVector; overload;
procedure VectorAdd(const V1, V2: TVector; var vr: TVector); overload;
// : Sums up f to each component of the vector
function VectorAdd(const V: TAffineVector; const f: Single): TAffineVector;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Sums up f to each component of the vector
function VectorAdd(const V: TVector; const f: Single): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Adds V2 to V1, result is placed in V1
procedure AddVector(var V1: TAffineVector; const V2: TAffineVector); overload;
// : Adds V2 to V1, result is placed in V1
procedure AddVector(var V1: TAffineVector; const V2: TVector); overload;
// : Adds V2 to V1, result is placed in V1
procedure AddVector(var V1: TVector; const V2: TVector); overload;
// : Sums up f to each component of the vector
procedure AddVector(var V: TAffineVector; const f: Single); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Sums up f to each component of the vector
procedure AddVector(var V: TVector; const f: Single); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Adds V2 to V1, result is placed in V1. W coordinate is always 1.
procedure AddPoint(var V1: TVector; const V2: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Returns the sum of two homogeneous vectors. W coordinate is always 1.
function PointAdd(var V1: TVector; const V2: TVector): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Adds delta to nb texpoints in src and places result in dest
procedure TexPointArrayAdd(const src: PTexPointArray; const delta: TTexPoint;
  const nb: Integer; dest: PTexPointArray); overload;
procedure TexPointArrayScaleAndAdd(const src: PTexPointArray;
  const delta: TTexPoint; const nb: Integer; const scale: TTexPoint;
  dest: PTexPointArray); overload;
// : Adds delta to nb vectors in src and places result in dest
procedure VectorArrayAdd(const src: PAffineVectorArray;
  const delta: TAffineVector; const nb: Integer;
  dest: PAffineVectorArray); overload;

// : Returns V1-V2
function VectorSubtract(const V1, V2: TVector2f): TVector2f; overload;
// : Subtracts V2 from V1, result is placed in V1
procedure SubtractVector(var V1: TVector2f; const V2: TVector2f); overload;

// : Returns V1-V2
function VectorSubtract(const V1, V2: TAffineVector): TAffineVector; overload;
// : Subtracts V2 from V1 and return value in result
procedure VectorSubtract(const V1, V2: TAffineVector;
  var result: TAffineVector); overload;
// : Subtracts V2 from V1 and return value in result
procedure VectorSubtract(const V1, V2: TAffineVector;
  var result: TVector); overload;
// : Subtracts V2 from V1 and return value in result
procedure VectorSubtract(const V1: TVector; V2: TAffineVector;
  var result: TVector); overload;
// : Returns V1-V2
function VectorSubtract(const V1, V2: TVector): TVector; overload;
// : Subtracts V2 from V1 and return value in result
procedure VectorSubtract(const V1, V2: TVector; var result: TVector); overload;
// : Subtracts V2 from V1 and return value in result
procedure VectorSubtract(const V1, V2: TVector;
  var result: TAffineVector); overload;
function VectorSubtract(const V1: TAffineVector; delta: Single): TAffineVector;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorSubtract(const V1: TVector; delta: Single): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Subtracts V2 from V1, result is placed in V1
procedure SubtractVector(var V1: TAffineVector;
  const V2: TAffineVector); overload;
// : Subtracts V2 from V1, result is placed in V1
procedure SubtractVector(var V1: TVector; const V2: TVector); overload;

// : Combine the first vector with the second : vr:=vr+v*f
procedure CombineVector(var vr: TAffineVector; const V: TAffineVector;
  var f: Single); overload;
procedure CombineVector(var vr: TAffineVector; const V: TAffineVector;
  pf: PFloat); overload;
// : Makes a linear combination of two texpoints
function TexPointCombine(const t1, t2: TTexPoint; f1, f2: Single): TTexPoint;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Makes a linear combination of two vectors and return the result
function VectorCombine(const V1, V2: TAffineVector; const f1, f2: Single)
  : TAffineVector; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Makes a linear combination of three vectors and return the result
function VectorCombine3(const V1, V2, V3: TAffineVector;
  const f1, f2, F3: Single): TAffineVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure VectorCombine3(const V1, V2, V3: TAffineVector;
  const f1, f2, F3: Single; var vr: TAffineVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Combine the first vector with the second : vr:=vr+v*f
procedure CombineVector(var vr: TVector; const V: TVector;
  var f: Single); overload;
// : Combine the first vector with the second : vr:=vr+v*f
procedure CombineVector(var vr: TVector; const V: TAffineVector;
  var f: Single); overload;
// : Makes a linear combination of two vectors and return the result
function VectorCombine(const V1, V2: TVector; const f1, f2: Single): TVector;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Makes a linear combination of two vectors and return the result
function VectorCombine(const V1: TVector; const V2: TAffineVector;
  const f1, f2: Single): TVector; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline;
{$ENDIF}
// : Makes a linear combination of two vectors and place result in vr
procedure VectorCombine(const V1: TVector; const V2: TAffineVector;
  const f1, f2: Single; var vr: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Makes a linear combination of two vectors and place result in vr
procedure VectorCombine(const V1, V2: TVector; const f1, f2: Single;
  var vr: TVector); overload;
// : Makes a linear combination of two vectors and place result in vr, F1=1.0
procedure VectorCombine(const V1, V2: TVector; const f2: Single;
  var vr: TVector); overload;
// : Makes a linear combination of three vectors and return the result
function VectorCombine3(const V1, V2, V3: TVector; const f1, f2, F3: Single)
  : TVector; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Makes a linear combination of three vectors and return the result
procedure VectorCombine3(const V1, V2, V3: TVector; const f1, f2, F3: Single;
  var vr: TVector); overload;

{ Calculates the dot product between V1 and V2.
  Result:=V1[X] * V2[X] + V1[Y] * V2[Y] }
function VectorDotProduct(const V1, V2: TVector2f): Single; overload;
{ Calculates the dot product between V1 and V2.
  Result:=V1[X] * V2[X] + V1[Y] * V2[Y] + V1[Z] * V2[Z] }
function VectorDotProduct(const V1, V2: TAffineVector): Single; overload;
{ Calculates the dot product between V1 and V2.
  Result:=V1[X] * V2[X] + V1[Y] * V2[Y] + V1[Z] * V2[Z] }
function VectorDotProduct(const V1, V2: TVector): Single; overload;
{ Calculates the dot product between V1 and V2.
  Result:=V1[X] * V2[X] + V1[Y] * V2[Y] + V1[Z] * V2[Z] }
function VectorDotProduct(const V1: TVector; const V2: TAffineVector)
  : Single; overload;

{ Projects p on the line defined by o and direction.
  Performs VectorDotProduct(VectorSubtract(p, origin), direction), which,
  if direction is normalized, computes the distance between origin and the
  projection of p on the (origin, direction) line. }
function PointProject(const p, origin, direction: TAffineVector)
  : Single; overload;
function PointProject(const p, origin, direction: TVector): Single; overload;

// : Calculates the cross product between vector 1 and 2
function VectorCrossProduct(const V1, V2: TAffineVector)
  : TAffineVector; overload;
// : Calculates the cross product between vector 1 and 2
function VectorCrossProduct(const V1, V2: TVector): TVector; overload;
// : Calculates the cross product between vector 1 and 2, place result in vr
procedure VectorCrossProduct(const V1, V2: TVector; var vr: TVector); overload;
// : Calculates the cross product between vector 1 and 2, place result in vr
procedure VectorCrossProduct(const V1, V2: TAffineVector;
  var vr: TVector); overload;
// : Calculates the cross product between vector 1 and 2, place result in vr
procedure VectorCrossProduct(const V1, V2: TVector;
  var vr: TAffineVector); overload;
// : Calculates the cross product between vector 1 and 2, place result in vr
procedure VectorCrossProduct(const V1, V2: TAffineVector;
  var vr: TAffineVector); overload;

// : Calculates linear interpolation between start and stop at point t
function Lerp(const start, stop, T: Single): Single;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Calculates angular interpolation between start and stop at point t
function AngleLerp(start, stop, T: Single): Single;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
{ This is used for interpolating between 2 matrices. The result
  is used to reposition the model parts each frame. }
function MatrixLerp(const m1, m2: TMatrix; const delta: Single): TMatrix;

{ Calculates the angular distance between two angles in radians.
  Result is in the [0; PI] range. }
function DistanceBetweenAngles(angle1, angle2: Single): Single;

// : Calculates linear interpolation between texpoint1 and texpoint2 at point t
function TexPointLerp(const t1, t2: TTexPoint; T: Single): TTexPoint; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Calculates linear interpolation between vector1 and vector2 at point t
function VectorLerp(const V1, V2: TAffineVector; T: Single)
  : TAffineVector; overload;
// : Calculates linear interpolation between vector1 and vector2 at point t, places result in vr
procedure VectorLerp(const V1, V2: TAffineVector; T: Single;
  var vr: TAffineVector); overload;
// : Calculates linear interpolation between vector1 and vector2 at point t
function VectorLerp(const V1, V2: TVector; T: Single): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Calculates linear interpolation between vector1 and vector2 at point t, places result in vr
procedure VectorLerp(const V1, V2: TVector; T: Single; var vr: TVector);
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorAngleLerp(const V1, V2: TAffineVector; T: Single)
  : TAffineVector; overload;
function VectorAngleCombine(const V1, V2: TAffineVector; f: Single)
  : TAffineVector; overload;

// : Calculates linear interpolation between vector arrays
procedure VectorArrayLerp(const src1, src2: PVectorArray; T: Single; n: Integer;
  dest: PVectorArray); overload;
procedure VectorArrayLerp(const src1, src2: PAffineVectorArray; T: Single;
  n: Integer; dest: PAffineVectorArray); overload;
procedure VectorArrayLerp(const src1, src2: PTexPointArray; T: Single;
  n: Integer; dest: PTexPointArray); overload;

type
  TGLInterpolationType = (itLinear, itPower, itSin, itSinAlt, itTan,
    itLn, itExp);

  { There functions that do the same as "Lerp", but add some distortions. }
function InterpolatePower(const start, stop, delta: Single;
  const DistortionDegree: Single): Single;
function InterpolateLn(const start, stop, delta: Single;
  const DistortionDegree: Single): Single;
function InterpolateExp(const start, stop, delta: Single;
  const DistortionDegree: Single): Single;

{ Only valid where Delta belongs to [0..1] }
function InterpolateSin(const start, stop, delta: Single): Single;
function InterpolateTan(const start, stop, delta: Single): Single;

{ "Alt" functions are valid everywhere }
function InterpolateSinAlt(const start, stop, delta: Single): Single;

function InterpolateCombinedFastPower(const OriginalStart, OriginalStop,
  OriginalCurrent: Single; const TargetStart, TargetStop: Single;
  const DistortionDegree: Single): Single;
function InterpolateCombinedSafe(const OriginalStart, OriginalStop,
  OriginalCurrent: Single; const TargetStart, TargetStop: Single;
  const DistortionDegree: Single;
  const InterpolationType: TGLInterpolationType): Single;
function InterpolateCombinedFast(const OriginalStart, OriginalStop,
  OriginalCurrent: Single; const TargetStart, TargetStop: Single;
  const DistortionDegree: Single;
  const InterpolationType: TGLInterpolationType): Single;
function InterpolateCombined(const start, stop, delta: Single;
  const DistortionDegree: Single;
  const InterpolationType: TGLInterpolationType): Single;

{ Calculates the length of a vector following the equation sqrt(x*x+y*y). }
function VectorLength(const X, Y: Single): Single; overload;
{ Calculates the length of a vector following the equation sqrt(x*x+y*y+z*z). }
function VectorLength(const X, Y, Z: Single): Single; overload;
// : Calculates the length of a vector following the equation sqrt(x*x+y*y).
function VectorLength(const V: TVector2f): Single; overload;
// : Calculates the length of a vector following the equation sqrt(x*x+y*y+z*z).
function VectorLength(const V: TAffineVector): Single; overload;
// : Calculates the length of a vector following the equation sqrt(x*x+y*y+z*z+w*w).
function VectorLength(const V: TVector): Single; overload;
{ Calculates the length of a vector following the equation: sqrt(x*x+y*y+...).
  Note: The parameter of this function is declared as open array. Thus
  there's no restriction about the number of the components of the vector. }
function VectorLength(const V: array of Single): Single; overload;

{ Calculates norm of a vector which is defined as norm = x * x + y * y
  Also known as "Norm 2" in the math world, this is sqr(VectorLength). }
function VectorNorm(const X, Y: Single): Single; overload;
{ Calculates norm of a vector which is defined as norm = x*x + y*y + z*z
  Also known as "Norm 2" in the math world, this is sqr(VectorLength). }
function VectorNorm(const V: TAffineVector): Single; overload;
{ Calculates norm of a vector which is defined as norm = x*x + y*y + z*z
  Also known as "Norm 2" in the math world, this is sqr(VectorLength). }
function VectorNorm(const V: TVector): Single; overload;
{ Calculates norm of a vector which is defined as norm = v.X*v.X + ...
  Also known as "Norm 2" in the math world, this is sqr(VectorLength). }
function VectorNorm(var V: array of Single): Single; overload;

// : Transforms a vector to unit length
procedure NormalizeVector(var V: TVector2f); overload;
// : Returns the vector transformed to unit length
// : Transforms a vector to unit length
procedure NormalizeVector(var V: TAffineVector); overload;
// : Transforms a vector to unit length
procedure NormalizeVector(var V: TVector); overload;
// : Returns the vector transformed to unit length
function VectorNormalize(const V: TVector2f): TVector2f; overload;
// : Returns the vector transformed to unit length
function VectorNormalize(const V: TAffineVector): TAffineVector; overload;
// : Returns the vector transformed to unit length (w component dropped)
function VectorNormalize(const V: TVector): TVector; overload;

// : Transforms vectors to unit length
procedure NormalizeVectorArray(list: PAffineVectorArray; n: Integer); overload;

{ Calculates the cosine of the angle between Vector1 and Vector2.
  Result = DotProduct(V1, V2) / (Length(V1) * Length(V2)) }
function VectorAngleCosine(const V1, V2: TAffineVector): Single; overload;

{ Calculates the cosine of the angle between Vector1 and Vector2.
  Result = DotProduct(V1, V2) / (Length(V1) * Length(V2)) }
function VectorAngleCosine(const V1, V2: TVector): Single; overload;

// : Negates the vector
function VectorNegate(const Vector: TAffineVector): TAffineVector; overload;
function VectorNegate(const Vector: TVector): TVector; overload;

// : Negates the vector
procedure NegateVector(var V: TAffineVector); overload;
// : Negates the vector
procedure NegateVector(var V: TVector); overload;
// : Negates the vector
procedure NegateVector(var V: array of Single); overload;

// : Scales given vector by a factor
procedure ScaleVector(var V: TVector2f; factor: Single); overload;
// : Scales given vector by a factor
procedure ScaleVector(var V: TAffineVector; factor: Single); overload;
{ Scales given vector by another vector.
  v[x]:=v[x]*factor[x], v[y]:=v[y]*factor[y] etc. }
procedure ScaleVector(var V: TAffineVector;
  const factor: TAffineVector); overload;
// : Scales given vector by a factor
procedure ScaleVector(var V: TVector; factor: Single); overload;
{ Scales given vector by another vector.
  v[x]:=v[x]*factor[x], v[y]:=v[y]*factor[y] etc. }
procedure ScaleVector(var V: TVector; const factor: TVector); overload;

// : Returns a vector scaled by a factor
function VectorScale(const V: TVector2f; factor: Single): TVector2f; overload;
// : Returns a vector scaled by a factor
function VectorScale(const V: TAffineVector; factor: Single)
  : TAffineVector; overload;
// : Scales a vector by a factor and places result in vr
procedure VectorScale(const V: TAffineVector; factor: Single;
  var vr: TAffineVector); overload;
// : Returns a vector scaled by a factor
function VectorScale(const V: TVector; factor: Single): TVector; overload;
// : Scales a vector by a factor and places result in vr
procedure VectorScale(const V: TVector; factor: Single;
  var vr: TVector); overload;
// : Scales a vector by a factor and places result in vr
procedure VectorScale(const V: TVector; factor: Single;
  var vr: TAffineVector); overload;
// : Scales given vector by another vector
function VectorScale(const V: TAffineVector; const factor: TAffineVector)
  : TAffineVector; overload;
// : RScales given vector by another vector
function VectorScale(const V: TVector; const factor: TVector): TVector;
  overload;

{ Divides given vector by another vector.
  v[x]:=v[x]/divider[x], v[y]:=v[y]/divider[y] etc. }
procedure DivideVector(var V: TVector; const divider: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
procedure DivideVector(var V: TAffineVector; const divider: TAffineVector);
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorDivide(const V: TVector; const divider: TVector): TVector;
  overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function VectorDivide(const V: TAffineVector; const divider: TAffineVector)
  : TAffineVector; overload; {$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : True if all components are equal.
function TexpointEquals(const p1, p2: TTexPoint): Boolean;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : True if all components are equal.
function RectEquals(const Rect1, Rect2: TRect): Boolean;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : True if all components are equal.
function VectorEquals(const V1, V2: TVector): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM_VICE_ASM}inline; {$ENDIF}
// : True if all components are equal.
function VectorEquals(const V1, V2: TAffineVector): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM_VICE_ASM}inline; {$ENDIF}
// : True if X, Y and Z components are equal.
function AffineVectorEquals(const V1, V2: TVector): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM_VICE_ASM}inline; {$ENDIF}
// : True if x=y=z=0, w ignored
function VectorIsNull(const V: TVector): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : True if x=y=z=0, w ignored
function VectorIsNull(const V: TAffineVector): Boolean; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
{ Calculates Abs(v1[x]-v2[x])+Abs(v1[y]-v2[y]), also know as "Norm1". }
function VectorSpacing(const V1, V2: TTexPoint): Single; overload;
{ Calculates Abs(v1[x]-v2[x])+Abs(v1[y]-v2[y])+..., also know as "Norm1". }
function VectorSpacing(const V1, V2: TAffineVector): Single; overload;
{ Calculates Abs(v1[x]-v2[x])+Abs(v1[y]-v2[y])+..., also know as "Norm1". }
function VectorSpacing(const V1, V2: TVector): Single; overload;

{ Calculates distance between two vectors.
  ie. sqrt(sqr(v1[x]-v2[x])+...) }
function VectorDistance(const V1, V2: TAffineVector): Single; overload;
{ Calculates distance between two vectors.
  ie. sqrt(sqr(v1[x]-v2[x])+...) (w component ignored) }
function VectorDistance(const V1, V2: TVector): Single; overload;

{ Calculates the "Norm 2" between two vectors.
  ie. sqr(v1[x]-v2[x])+... }
function VectorDistance2(const V1, V2: TAffineVector): Single; overload;
{ Calculates the "Norm 2" between two vectors.
  ie. sqr(v1[x]-v2[x])+... (w component ignored) }
function VectorDistance2(const V1, V2: TVector): Single; overload;

{ Calculates a vector perpendicular to N.
  N is assumed to be of unit length, subtract out any component parallel to N }
function VectorPerpendicular(const V, n: TAffineVector): TAffineVector;
// : Reflects vector V against N (assumes N is normalized)
function VectorReflect(const V, n: TAffineVector): TAffineVector;
// : Rotates Vector about Axis with Angle radians
procedure RotateVector(var Vector: TVector; const axis: TAffineVector;
  angle: Single); overload;
// : Rotates Vector about Axis with Angle radians
procedure RotateVector(var Vector: TVector; const axis: TVector;
  angle: Single); overload;

// : Rotate given vector around the Y axis (alpha is in rad)
procedure RotateVectorAroundY(var V: TAffineVector; alpha: Single);
// : Returns given vector rotated around the X axis (alpha is in rad)
function VectorRotateAroundX(const V: TAffineVector; alpha: Single)
  : TAffineVector; overload;
// : Returns given vector rotated around the Y axis (alpha is in rad)
function VectorRotateAroundY(const V: TAffineVector; alpha: Single)
  : TAffineVector; overload;
// : Returns given vector rotated around the Y axis in vr (alpha is in rad)
procedure VectorRotateAroundY(const V: TAffineVector; alpha: Single;
  var vr: TAffineVector); overload;
// : Returns given vector rotated around the Z axis (alpha is in rad)
function VectorRotateAroundZ(const V: TAffineVector; alpha: Single)
  : TAffineVector; overload;

// : Vector components are replaced by their Abs() value. }
procedure AbsVector(var V: TVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Vector components are replaced by their Abs() value. }
procedure AbsVector(var V: TAffineVector); overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Returns a vector with components replaced by their Abs value. }
function VectorAbs(const V: TVector): TVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Returns a vector with components replaced by their Abs value. }
function VectorAbs(const V: TAffineVector): TAffineVector; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// : Returns true if both vector are colinear
function IsColinear(const V1, V2: TVector2f): Boolean; overload;
// : Returns true if both vector are colinear
function IsColinear(const V1, V2: TAffineVector): Boolean; overload;
// : Returns true if both vector are colinear
function IsColinear(const V1, V2: TVector): Boolean; overload;

// ------------------------------------------------------------------------------
// Matrix functions
// ------------------------------------------------------------------------------

procedure SetMatrix(var dest: THomogeneousDblMatrix;
  const src: TMatrix); overload;
procedure SetMatrix(var dest: TAffineMatrix; const src: TMatrix); overload;
procedure SetMatrix(var dest: TMatrix; const src: TAffineMatrix); overload;

procedure SetMatrixRow(var dest: TMatrix; rowNb: Integer;
  const aRow: TVector); overload;

// : Creates scale matrix
function CreateScaleMatrix(const V: TAffineVector): TMatrix; overload;
// : Creates scale matrix
function CreateScaleMatrix(const V: TVector): TMatrix; overload;
// : Creates translation matrix
function CreateTranslationMatrix(const V: TAffineVector): TMatrix; overload;
// : Creates translation matrix
function CreateTranslationMatrix(const V: TVector): TMatrix; overload;
{ Creates a scale+translation matrix.
  Scale is applied BEFORE applying offset }
function CreateScaleAndTranslationMatrix(const scale, offset: TVector)
  : TMatrix; overload;
// : Creates matrix for rotation about x-axis (angle in rad)
function CreateRotationMatrixX(const sine, cosine: Single): TMatrix; overload;
function CreateRotationMatrixX(const angle: Single): TMatrix; overload;
// : Creates matrix for rotation about y-axis (angle in rad)
function CreateRotationMatrixY(const sine, cosine: Single): TMatrix; overload;
function CreateRotationMatrixY(const angle: Single): TMatrix; overload;
// : Creates matrix for rotation about z-axis (angle in rad)
function CreateRotationMatrixZ(const sine, cosine: Single): TMatrix; overload;
function CreateRotationMatrixZ(const angle: Single): TMatrix; overload;
// : Creates a rotation matrix along the given Axis by the given Angle in radians.
function CreateRotationMatrix(const anAxis: TAffineVector; angle: Single)
  : TMatrix; overload;
function CreateRotationMatrix(const anAxis: TVector; angle: Single)
  : TMatrix; overload;
// : Creates a rotation matrix along the given Axis by the given Angle in radians.
function CreateAffineRotationMatrix(const anAxis: TAffineVector; angle: Single)
  : TAffineMatrix;

// : Multiplies two 3x3 matrices
function MatrixMultiply(const m1, m2: TAffineMatrix): TAffineMatrix; overload;
// : Multiplies two 4x4 matrices
function MatrixMultiply(const m1, m2: TMatrix): TMatrix; overload;
// : Multiplies M1 by M2 and places result in MResult
procedure MatrixMultiply(const m1, m2: TMatrix; var MResult: TMatrix); overload;

// : Transforms a homogeneous vector by multiplying it with a matrix
function VectorTransform(const V: TVector; const M: TMatrix): TVector; overload;
// : Transforms a homogeneous vector by multiplying it with a matrix
function VectorTransform(const V: TVector; const M: TAffineMatrix)
  : TVector; overload;
// : Transforms an affine vector by multiplying it with a matrix
function VectorTransform(const V: TAffineVector; const M: TMatrix)
  : TAffineVector; overload;
// : Transforms an affine vector by multiplying it with a matrix
function VectorTransform(const V: TAffineVector; const M: TAffineMatrix)
  : TAffineVector; overload;

// : Determinant of a 3x3 matrix
function MatrixDeterminant(const M: TAffineMatrix): Single; overload;
// : Determinant of a 4x4 matrix
function MatrixDeterminant(const M: TMatrix): Single; overload;

{ Adjoint of a 4x4 matrix.
  used in the computation of the inverse of a 4x4 matrix }
procedure AdjointMatrix(var M: TMatrix); overload;
{ Adjoint of a 3x3 matrix.
  used in the computation of the inverse of a 3x3 matrix }
procedure AdjointMatrix(var M: TAffineMatrix); overload;

// : Multiplies all elements of a 3x3 matrix with a factor
procedure ScaleMatrix(var M: TAffineMatrix; const factor: Single); overload;
// : Multiplies all elements of a 4x4 matrix with a factor
procedure ScaleMatrix(var M: TMatrix; const factor: Single); overload;

// : Adds the translation vector into the matrix
procedure TranslateMatrix(var M: TMatrix; const V: TAffineVector); overload;
procedure TranslateMatrix(var M: TMatrix; const V: TVector); overload;

{ Normalize the matrix and remove the translation component.
  The resulting matrix is an orthonormal matrix (Y direction preserved, then Z) }
procedure NormalizeMatrix(var M: TMatrix);

// : Computes transpose of 3x3 matrix
procedure TransposeMatrix(var M: TAffineMatrix); overload;
// : Computes transpose of 4x4 matrix
procedure TransposeMatrix(var M: TMatrix); overload;

// : Finds the inverse of a 4x4 matrix
procedure InvertMatrix(var M: TMatrix); overload;
function MatrixInvert(const M: TMatrix): TMatrix; overload;

// : Finds the inverse of a 3x3 matrix;
procedure InvertMatrix(var M: TAffineMatrix); overload;
function MatrixInvert(const M: TAffineMatrix): TAffineMatrix; overload;

{ Finds the inverse of an angle preserving matrix.
  Angle preserving matrices can combine translation, rotation and isotropic
  scaling, other matrices won't be properly inverted by this function. }
function AnglePreservingMatrixInvert(const mat: TMatrix): TMatrix;

{ Decompose a non-degenerated 4x4 transformation matrix into the sequence of transformations that produced it.
  Modified by ml then eg, original Author: Spencer W. Thomas, University of Michigan
  The coefficient of each transformation is returned in the corresponding
  element of the vector Tran.
  Returns true upon success, false if the matrix is singular. }
function MatrixDecompose(const M: TMatrix; var Tran: TTransformations): Boolean;

function CreateLookAtMatrix(const eye, center, normUp: TVector): TMatrix;
function CreateMatrixFromFrustum(Left, Right, Bottom, Top, ZNear,
  ZFar: Single): TMatrix;
function CreatePerspectiveMatrix(FOV, Aspect, ZNear, ZFar: Single): TMatrix;
function CreateOrthoMatrix(Left, Right, Bottom, Top, ZNear,
  ZFar: Single): TMatrix;
function CreatePickMatrix(X, Y, deltax, deltay: Single;
  const viewport: TVector4i): TMatrix;
function Project(objectVector: TVector; const ViewProjMatrix: TMatrix;
  const viewport: TVector4i; out WindowVector: TVector): Boolean;
function UnProject(WindowVector: TVector; ViewProjMatrix: TMatrix;
  const viewport: TVector4i; out objectVector: TVector): Boolean;
// ------------------------------------------------------------------------------
// Plane functions
// ------------------------------------------------------------------------------

// : Computes the parameters of a plane defined by three points.
function PlaneMake(const p1, p2, p3: TAffineVector): THmgPlane; overload;
function PlaneMake(const p1, p2, p3: TVector): THmgPlane; overload;
// : Computes the parameters of a plane defined by a point and a normal.
function PlaneMake(const point, normal: TAffineVector): THmgPlane; overload;
function PlaneMake(const point, normal: TVector): THmgPlane; overload;
// : Converts from single to double representation
procedure SetPlane(var dest: TDoubleHmgPlane; const src: THmgPlane);

// : Normalize a plane so that point evaluation = plane distance. }
procedure NormalizePlane(var plane: THmgPlane);

{ Calculates the cross-product between the plane normal and plane to point vector.
  This functions gives an hint as to were the point is, if the point is in the
  half-space pointed by the vector, result is positive.
  This function performs an homogeneous space dot-product. }
function PlaneEvaluatePoint(const plane: THmgPlane; const point: TAffineVector)
  : Single; overload;
function PlaneEvaluatePoint(const plane: THmgPlane; const point: TVector)
  : Single; overload;

{ Calculate the normal of a plane defined by three points. }
function CalcPlaneNormal(const p1, p2, p3: TAffineVector)
  : TAffineVector; overload;
procedure CalcPlaneNormal(const p1, p2, p3: TAffineVector;
  var vr: TAffineVector); overload;
procedure CalcPlaneNormal(const p1, p2, p3: TVector;
  var vr: TAffineVector); overload;

{ Returns true if point is in the half-space defined by a plane with normal.
  The plane itself is not considered to be in the tested halfspace. }
function PointIsInHalfSpace(const point, planePoint, planeNormal: TVector)
  : Boolean; overload;
function PointIsInHalfSpace(const point, planePoint, planeNormal: TAffineVector)
  : Boolean; overload;
function PointIsInHalfSpace(const point: TAffineVector; plane: THmgPlane)
  : Boolean; overload;

{ Computes algebraic distance between point and plane.
  Value will be positive if the point is in the halfspace pointed by the normal,
  negative on the other side. }
function PointPlaneDistance(const point, planePoint, planeNormal: TVector)
  : Single; overload;
function PointPlaneDistance(const point, planePoint, planeNormal: TAffineVector)
  : Single; overload;
function PointPlaneDistance(const point: TAffineVector; plane: THmgPlane)
  : Single; overload;

{ Computes point to plane projection. Plane and direction have to be normalized }
function PointPlaneOrthoProjection(const point: TAffineVector;
  const plane: THmgPlane; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
function PointPlaneProjection(const point, direction: TAffineVector;
  const plane: THmgPlane; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;

{ Computes segment / plane intersection return false if there isn't an intersection }
function SegmentPlaneIntersection(const ptA, ptB: TAffineVector;
  const plane: THmgPlane; var inter: TAffineVector): Boolean;

{ Computes point to triangle projection. Direction has to be normalized }
function PointTriangleOrthoProjection(const point, ptA, ptB, ptC: TAffineVector;
  var inter: TAffineVector; bothface: Boolean = True): Boolean;
function PointTriangleProjection(const point, direction, ptA, ptB,
  ptC: TAffineVector; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;

{ Returns true if line intersect ABC triangle. }
function IsLineIntersectTriangle(const point, direction, ptA, ptB,
  ptC: TAffineVector): Boolean;

{ Computes point to Quad projection. Direction has to be normalized. Quad have to be flat and convex }
function PointQuadOrthoProjection(const point, ptA, ptB, ptC,
  ptD: TAffineVector; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
function PointQuadProjection(const point, direction, ptA, ptB, ptC,
  ptD: TAffineVector; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;

{ Returns true if line intersect ABCD quad. Quad have to be flat and convex }
function IsLineIntersectQuad(const point, direction, ptA, ptB, ptC,
  ptD: TAffineVector): Boolean;

{ Computes point to disk projection. Direction has to be normalized }
function PointDiskOrthoProjection(const point, center, up: TAffineVector;
  const radius: Single; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
function PointDiskProjection(const point, direction, center, up: TAffineVector;
  const radius: Single; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;

{ Computes closest point on a segment (a segment is a limited line). }
function PointSegmentClosestPoint(const point, segmentStart,
  segmentStop: TAffineVector): TAffineVector; overload;
function PointSegmentClosestPoint(const point, segmentStart,
  segmentStop: TVector): TVector; overload;

{ Computes algebraic distance between segment and line (a segment is a limited line). }
function PointSegmentDistance(const point, segmentStart,
  segmentStop: TAffineVector): Single;

{ Computes closest point on a line. }
function PointLineClosestPoint(const point, linePoint, lineDirection
  : TAffineVector): TAffineVector;

{ Computes algebraic distance between point and line. }
function PointLineDistance(const point, linePoint, lineDirection
  : TAffineVector): Single;

{ Computes the closest points (2) given two segments. }
procedure SegmentSegmentClosestPoint(const S0Start, S0Stop, S1Start,
  S1Stop: TAffineVector; var Segment0Closest, Segment1Closest: TAffineVector);

{ Computes the closest distance between two segments. }
function SegmentSegmentDistance(const S0Start, S0Stop, S1Start,
  S1Stop: TAffineVector): Single;

{ Computes the closest distance between two lines. }
function LineLineDistance(const linePt0, lineDir0, linePt1,
  lineDir1: TAffineVector): Single;

// ------------------------------------------------------------------------------
// Quaternion functions
// ------------------------------------------------------------------------------

type
  TEulerOrder = (eulXYZ, eulXZY, eulYXZ, eulYZX, eulZXY, eulZYX);

  // : Creates a quaternion from the given values
function QuaternionMake(const Imag: array of Single; Real: Single): TQuaternion;
// : Returns the conjugate of a quaternion
function QuaternionConjugate(const Q: TQuaternion): TQuaternion;
// : Returns the magnitude of the quaternion
function QuaternionMagnitude(const Q: TQuaternion): Single;
// : Normalizes the given quaternion
procedure NormalizeQuaternion(var Q: TQuaternion);

// : Constructs a unit quaternion from two points on unit sphere
function QuaternionFromPoints(const V1, V2: TAffineVector): TQuaternion;
// : Converts a unit quaternion into two points on a unit sphere
procedure QuaternionToPoints(const Q: TQuaternion;
  var ArcFrom, ArcTo: TAffineVector);
// : Constructs a unit quaternion from a rotation matrix
function QuaternionFromMatrix(const mat: TMatrix): TQuaternion;
{ Constructs a rotation matrix from (possibly non-unit) quaternion.
  Assumes matrix is used to multiply column vector on the left:
  vnew = mat vold.
  Works correctly for right-handed coordinate system and right-handed rotations. }
function QuaternionToMatrix(quat: TQuaternion): TMatrix;
{ Constructs an affine rotation matrix from (possibly non-unit) quaternion. }
function QuaternionToAffineMatrix(quat: TQuaternion): TAffineMatrix;
// : Constructs quaternion from angle (in deg) and axis
function QuaternionFromAngleAxis(const angle: Single; const axis: TAffineVector)
  : TQuaternion;
// : Constructs quaternion from Euler angles
function QuaternionFromRollPitchYaw(const r, p, Y: Single): TQuaternion;
// : Constructs quaternion from Euler angles in arbitrary order (angles in degrees)
function QuaternionFromEuler(const X, Y, Z: Single; eulerOrder: TEulerOrder)
  : TQuaternion;

{ Returns quaternion product qL * qR.
  Note: order is important!
  To combine rotations, use the product QuaternionMuliply(qSecond, qFirst),
  which gives the effect of rotating by qFirst then qSecond. }
function QuaternionMultiply(const qL, qR: TQuaternion): TQuaternion;

{ Spherical linear interpolation of unit quaternions with spins.
  QStart, QEnd - start and end unit quaternions
  t            - interpolation parameter (0 to 1)
  Spin         - number of extra spin rotations to involve }
function QuaternionSlerp(const QStart, QEnd: TQuaternion; Spin: Integer;
  T: Single): TQuaternion; overload;
function QuaternionSlerp(const source, dest: TQuaternion; const T: Single)
  : TQuaternion; overload;

// ------------------------------------------------------------------------------
// Logarithmic and exponential functions
// ------------------------------------------------------------------------------

{ Return ln(1 + X),  accurate for X near 0. }
function LnXP1(X: Extended): Extended;
{ Log base 10 of X }
function Log10(X: Extended): Extended;
{ Log base 2 of X }
function Log2(X: Extended): Extended; overload;
{ Log base 2 of X }
function Log2(X: Single): Single; overload;
{ Log base N of X }
function LogN(Base, X: Extended): Extended;
{ Raise base to an integer. }
function IntPower(Base: Extended; Exponent: Integer): Extended;
{ Raise base to any power.
  For fractional exponents, or |exponents| > MaxInt, base must be > 0. }
function PowerSingle(const Base, Exponent: Single): Single; overload;
{ Raise base to an integer. }
function PowerInteger(Base: Single; Exponent: Integer): Single; overload;
function PowerInt64(Base: Single; Exponent: Int64): Single; overload;

// ------------------------------------------------------------------------------
// Trigonometric functions
// ------------------------------------------------------------------------------

function DegToRadian(const Degrees: Extended): Extended; overload;
function DegToRadian(const Degrees: Single): Single; overload;
function RadianToDeg(const Radians: Extended): Extended; overload;
function RadianToDeg(const Radians: Single): Single; overload;

// : Normalize to an angle in the [-PI; +PI] range
function NormalizeAngle(angle: Single): Single;
// : Normalize to an angle in the [-180; 180] range
function NormalizeDegAngle(angle: Single): Single;

// : Calculates sine and cosine from the given angle Theta
{$IFDEF GLS_PLATFORM_HAS_EXTENDED}
procedure SinCosine(const Theta: Extended; out Sin, Cos: Extended); overload;
{$ENDIF}
// : Calculates sine and cosine from the given angle Theta
procedure SinCosine(const Theta: Double; out Sin, Cos: Double); overload;
// : Calculates sine and cosine from the given angle Theta
procedure SinCosine(const Theta: Single; out Sin, Cos: Single); overload;
{ Calculates sine and cosine from the given angle Theta and Radius.
  sin and cos values calculated from theta are multiplicated by radius. }
{$IFDEF GLS_PLATFORM_HAS_EXTENDED}
procedure SinCosine(const Theta, radius: Double;
  out Sin, Cos: Extended); overload;
{$ENDIF}
{ Calculates sine and cosine from the given angle Theta and Radius.
  sin and cos values calculated from theta are multiplicated by radius. }
procedure SinCosine(const Theta, radius: Double; out Sin, Cos: Double);
  overload;
{ Calculates sine and cosine from the given angle Theta and Radius.
  sin and cos values calculated from theta are multiplicated by radius. }
procedure SinCosine(const Theta, radius: Single; out Sin, Cos: Single);
  overload;

{ Fills up the two given dynamic arrays with sin cos values.
  start and stop angles must be given in degrees, the number of steps is
  determined by the length of the given arrays. }
procedure PrepareSinCosCache(var S, c: array of Single;
  startAngle, stopAngle: Single);

function ArcCosine(const X: Extended): Extended; overload;
function ArcCosine(const X: Single): Single; overload;
function ArcSine(const X: Extended): Extended; overload;
function ArcSine(const X: Single): Single; overload;
function ArcTangent2(const Y, X: Extended): Extended; overload;
function ArcTangent2(const Y, X: Single): Single; overload;
{ Fast ArcTangent2 approximation, about 0.07 rads accuracy. }
function FastArcTangent2(Y, X: Single): Single;
function Tangent(const X: Extended): Extended; overload;
function Tangent(const X: Single): Single; overload;
function CoTangent(const X: Extended): Extended; overload;
function CoTangent(const X: Single): Single; overload;

// ------------------------------------------------------------------------------
// Hyperbolic Trigonometric functions
// ------------------------------------------------------------------------------

function Sinh(const X: Single): Single; overload;
function Sinh(const X: Double): Double; overload;
function Cosh(const X: Single): Single; overload;
function Cosh(const X: Double): Double; overload;

// ------------------------------------------------------------------------------
// Miscellanious math functions
// ------------------------------------------------------------------------------

// Computes 1/Sqrt(v)
function RSqrt(V: Single): Single;
// Computes 1/Sqrt(Sqr(x)+Sqr(y)).
function RLength(X, Y: Single): Single;
// Computes an integer sqrt approximation
function ISqrt(i: Integer): Integer;
// Computes an integer length Result:=Sqrt(x*x+y*y)
function ILength(X, Y: Integer): Integer; overload;
function ILength(X, Y, Z: Integer): Integer; overload;

{$IFDEF GLS_ASM}
// Computes Exp(ST(0)) and leaves result on ST(0)
procedure RegisterBasedExp;
{$ENDIF}
// Generates a random point on the unit sphere.
// Point repartition is correctly isotropic with no privilegied direction
procedure RandomPointOnSphere(var p: TAffineVector);

// Rounds the floating point value to the closest integer.
// Behaves like Round but returns a floating point value like Int.
function RoundInt(V: Single): Single; overload;
function RoundInt(V: Extended): Extended; overload;

{$IFDEF GLS_ASM}
function Int(V: Single): Single; overload;
function Int(V: Extended): Extended; overload;
function Frac(V: Single): Single; overload;
function Frac(V: Extended): Extended; overload;
function Round(V: Single): Integer; overload;
function Round64(V: Extended): Int64; overload;
{$ELSE}
function Trunc(X: Extended): Int64;
function Round(X: Extended): Int64;
function Frac(X: Extended): Extended;
{$ENDIF}
function Ceil(V: Single): Integer; overload;
function Ceil64(V: Extended): Int64; overload;
function Floor(V: Single): Integer; overload;
function Floor64(V: Extended): Int64; overload;

// Multiples i by s and returns the rounded result.
function ScaleAndRound(i: Integer; var S: Single): Integer;

// Returns the sign of the x value using the (-1, 0, +1) convention
function Sign(X: Single): Integer;
function SignStrict(X: Single): Integer;

// Returns True if x is in [a; b]
function IsInRange(const X, a, b: Single): Boolean; overload;
function IsInRange(const X, a, b: Double): Boolean; overload;

// Returns True if p is in the cube defined by d.
function IsInCube(const p, d: TAffineVector): Boolean; overload;
function IsInCube(const p, d: TVector): Boolean; overload;

// Returns the minimum value of the array.
function MinFloat(values: PSingleArray; nbItems: Integer): Single; overload;
function MinFloat(values: PDoubleArray; nbItems: Integer): Double; overload;
function MinFloat(values: PExtendedArray; nbItems: Integer): Extended; overload;
// Returns the minimum of given values.
function MinFloat(const V1, V2: Single): Single; overload;
function MinFloat(const V: array of Single): Single; overload;
function MinFloat(const V1, V2: Double): Double; overload;
{$IFDEF GLS_PLATFORM_HAS_EXTENDED}
function MinFloat(const V1, V2: Extended): Extended; overload;
{$ENDIF}
function MinFloat(const V1, V2, V3: Single): Single; overload;
function MinFloat(const V1, V2, V3: Double): Double; overload;
{$IFDEF GLS_PLATFORM_HAS_EXTENDED}
function MinFloat(const V1, V2, V3: Extended): Extended; overload;
{$ENDIF}
// Returns the maximum value of the array.
function MaxFloat(values: PSingleArray; nbItems: Integer): Single; overload;
function MaxFloat(values: PDoubleArray; nbItems: Integer): Double; overload;
function MaxFloat(values: PExtendedArray; nbItems: Integer): Extended; overload;
function MaxFloat(const V: array of Single): Single; overload;
// Returns the maximum of given values.
function MaxFloat(const V1, V2: Single): Single; overload;
function MaxFloat(const V1, V2: Double): Double; overload;
{$IFDEF GLS_PLATFORM_HAS_EXTENDED}
function MaxFloat(const V1, V2: Extended): Extended; overload;
{$ENDIF GLS_PLATFORM_HAS_EXTENDED}
function MaxFloat(const V1, V2, V3: Single): Single; overload;
function MaxFloat(const V1, V2, V3: Double): Double; overload;
{$IFDEF GLS_PLATFORM_HAS_EXTENDED}
function MaxFloat(const V1, V2, V3: Extended): Extended; overload;
{$ENDIF GLS_PLATFORM_HAS_EXTENDED}
function MinInteger(const V1, V2: Integer): Integer; overload;
function MinInteger(const V1, V2: Cardinal): Cardinal; overload;
function MinInteger(const V1, V2, V3: Integer): Integer; overload;
function MinInteger(const V1, V2, V3: Cardinal): Cardinal; overload;

function MaxInteger(const V1, V2: Integer): Integer; overload;
function MaxInteger(const V1, V2: Cardinal): Cardinal; overload;
function MaxInteger(const V1, V2, V3: Integer): Integer; overload;
function MaxInteger(const V1, V2, V3: Cardinal): Cardinal; overload;

function ClampInteger(const value, min, max: Integer): Integer; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
function ClampInteger(const value, min, max: Cardinal): Cardinal; overload;
{$IFDEF GLS_INLINE_VICE_ASM}inline; {$ENDIF}
// Computes the triangle's area
function TriangleArea(const p1, p2, p3: TAffineVector): Single; overload;
// Computes the polygons's area. Points must be coplanar. Polygon needs not be convex
function PolygonArea(const p: PAffineVectorArray; nSides: Integer)
  : Single; overload;
// Computes a 2D triangle's signed area. Only X and Y coordinates are used, Z is ignored
function TriangleSignedArea(const p1, p2, p3: TAffineVector): Single; overload;
// Computes a 2D polygon's signed area. Only X and Y coordinates are used, Z is ignored. Polygon needs not be convex
function PolygonSignedArea(const p: PAffineVectorArray; nSides: Integer)
  : Single; overload;

{ Multiplies values in the array by factor.
  This function is especially efficient for large arrays, it is not recommended
  for arrays that have less than 10 items.
  Expected performance is 4 to 5 times that of a Deliph-compiled loop on AMD
  CPUs, and 2 to 3 when 3DNow! isn't available. }
procedure ScaleFloatArray(values: PSingleArray; nb: Integer;
  var factor: Single); overload;
procedure ScaleFloatArray(var values: TSingleArray; factor: Single); overload;

// Adds delta to values in the array. Array size must be a multiple of four
procedure OffsetFloatArray(values: PSingleArray; nb: Integer;
  var delta: Single); overload;
procedure OffsetFloatArray(var values: array of Single; delta: Single);
  overload;
procedure OffsetFloatArray(valuesDest, valuesDelta: PSingleArray;
  nb: Integer); overload;

// Returns the max of the X, Y and Z components of a vector (W is ignored)
function MaxXYZComponent(const V: TVector): Single; overload;
function MaxXYZComponent(const V: TAffineVector): Single; overload;
// Returns the min of the X, Y and Z components of a vector (W is ignored)
function MinXYZComponent(const V: TVector): Single; overload;
function MinXYZComponent(const V: TAffineVector): Single; overload;
// Returns the max of the Abs(X), Abs(Y) and Abs(Z) components of a vector (W is ignored)
function MaxAbsXYZComponent(V: TVector): Single;
// Returns the min of the Abs(X), Abs(Y) and Abs(Z) components of a vector (W is ignored)
function MinAbsXYZComponent(V: TVector): Single;
// Replace components of v with the max of v or v1 component. Maximum is computed per component
procedure MaxVector(var V: TVector; const V1: TVector); overload;
procedure MaxVector(var V: TAffineVector; const V1: TAffineVector); overload;
// Replace components of v with the min of v or v1 component. Minimum is computed per component
procedure MinVector(var V: TVector; const V1: TVector); overload;
procedure MinVector(var V: TAffineVector; const V1: TAffineVector); overload;

// Sorts given array in ascending order. NOTE : current implementation is a slow bubble sort...
procedure SortArrayAscending(var a: array of Extended);

// Clamps aValue in the aMin-aMax interval
function ClampValue(const aValue, aMin, aMax: Single): Single; overload;
// Clamps aValue in the aMin-INF interval
function ClampValue(const aValue, aMin: Single): Single; overload;

// Returns the detected optimization mode. Returned values is either 'FPU', '3DNow!' or 'SSE'
function GeometryOptimizationMode: String;

{ Begins a FPU-only section.
  You can use a FPU-only section to force use of FPU versions of the math
  functions, though typically slower than their SIMD counterparts, they have
  a higher precision (80 bits internally) that may be required in some cases.
  Each BeginFPUOnlySection call must be balanced by a EndFPUOnlySection (calls
  can be nested). }
procedure BeginFPUOnlySection;
// Ends a FPU-only section. See BeginFPUOnlySection
procedure EndFPUOnlySection;

// --------------------- Unstandardized functions after these lines
// --------------------- Unstandardized functions after these lines
// --------------------- Unstandardized functions after these lines
// --------------------- Unstandardized functions after these lines
// --------------------- Unstandardized functions after these lines

// mixed functions

// Turn a triplet of rotations about x, y, and z (in that order) into an equivalent rotation around a single axis (all in radians)
function ConvertRotation(const Angles: TAffineVector): TVector;

// miscellaneous functions

function MakeAffineDblVector(var V: array of Double): TAffineDblVector;
function MakeDblVector(var V: array of Double): THomogeneousDblVector;
function VectorAffineDblToFlt(const V: TAffineDblVector): TAffineVector;
function VectorDblToFlt(const V: THomogeneousDblVector): THomogeneousVector;
function VectorAffineFltToDbl(const V: TAffineVector): TAffineDblVector;
function VectorFltToDbl(const V: TVector): THomogeneousDblVector;

function PointInPolygon(var xp, yp: array of Single; X, Y: Single): Boolean;
function IsPointInPolygon(Polygon: array of TPoint; p: TPoint): Boolean;

procedure DivMod(Dividend: Integer; Divisor: Word; var result, Remainder: Word);

// coordinate system manipulation functions

// : Rotates the given coordinate system (represented by the matrix) around its Y-axis
function Turn(const Matrix: TMatrix; angle: Single): TMatrix; overload;
// : Rotates the given coordinate system (represented by the matrix) around MasterUp
function Turn(const Matrix: TMatrix; const MasterUp: TAffineVector;
  angle: Single): TMatrix; overload;
// : Rotates the given coordinate system (represented by the matrix) around its X-axis
function Pitch(const Matrix: TMatrix; angle: Single): TMatrix; overload;
// : Rotates the given coordinate system (represented by the matrix) around MasterRight
function Pitch(const Matrix: TMatrix; const MasterRight: TAffineVector;
  angle: Single): TMatrix; overload;
// : Rotates the given coordinate system (represented by the matrix) around its Z-axis
function Roll(const Matrix: TMatrix; angle: Single): TMatrix; overload;
// : Rotates the given coordinate system (represented by the matrix) around MasterDirection
function Roll(const Matrix: TMatrix; const MasterDirection: TAffineVector;
  angle: Single): TMatrix; overload;

// intersection functions

{ Compute the intersection point "res" of a line with a plane.
  Return value:
  0 : no intersection, line parallel to plane
  1 : res is valid
  -1 : line is inside plane

  Adapted from:
  E.Hartmann, Computeruntersttzte Darstellende Geometrie, B.G. Teubner Stuttgart 1988 }
function IntersectLinePlane(const point, direction: TVector;
  const plane: THmgPlane; intersectPoint: PVector = nil): Integer; overload;

{ Compute intersection between a triangle and a box.
  Returns True if an intersection was found. }
function IntersectTriangleBox(const p1, p2, p3, aMinExtent,
  aMaxExtent: TAffineVector): Boolean;

{ Compute intersection between a Sphere and a box.
  Up, Direction and Right must be normalized!
  Use CubDepht, CubeHeight and CubeWidth to scale TGLCube. }
function IntersectSphereBox(const SpherePos: TVector;
  const SphereRadius: Single; const BoxMatrix: TMatrix;
  const BoxScale: TAffineVector; intersectPoint: PAffineVector = nil;
  normal: PAffineVector = nil; depth: PSingle = nil): Boolean;

{ Compute intersection between a ray and a plane.
  Returns True if an intersection was found, the intersection point is placed
  in intersectPoint is the reference is not nil. }
function RayCastPlaneIntersect(const rayStart, rayVector: TVector;
  const planePoint, planeNormal: TVector; intersectPoint: PVector = nil)
  : Boolean; overload;
function RayCastPlaneXZIntersect(const rayStart, rayVector: TVector;
  const planeY: Single; intersectPoint: PVector = nil): Boolean; overload;

{ Compute intersection between a ray and a triangle. }
function RayCastTriangleIntersect(const rayStart, rayVector: TVector;
  const p1, p2, p3: TAffineVector; intersectPoint: PVector = nil;
  intersectNormal: PVector = nil): Boolean; overload;
{ Compute the min distance a ray will pass to a point. }
function RayCastMinDistToPoint(const rayStart, rayVector: TVector;
  const point: TVector): Single;
{ Determines if a ray will intersect with a given sphere. }
function RayCastIntersectsSphere(const rayStart, rayVector: TVector;
  const sphereCenter: TVector; const SphereRadius: Single): Boolean; overload;
{ Calculates the intersections between a sphere and a ray.
  Returns 0 if no intersection is found (i1 and i2 untouched), 1 if one
  intersection was found (i1 defined, i2 untouched), and 2 is two intersections
  were found (i1 and i2 defined). }
function RayCastSphereIntersect(const rayStart, rayVector: TVector;
  const sphereCenter: TVector; const SphereRadius: Single; var i1, i2: TVector)
  : Integer; overload;
{ Compute intersection between a ray and a box.
  Returns True if an intersection was found, the intersection point is
  placed in intersectPoint if the reference is not nil. }
function RayCastBoxIntersect(const rayStart, rayVector, aMinExtent,
  aMaxExtent: TAffineVector; intersectPoint: PAffineVector = nil): Boolean;

// Some 2d intersection functions.

{ Determine if 2 rectanges intersect. }
function RectanglesIntersect(const ACenterOfRect1, ACenterOfRect2, ASizeOfRect1,
  ASizeOfRect2: TVector2f): Boolean;

{ Determine if BigRect completely contains SmallRect. }
function RectangleContains(const ACenterOfBigRect1, ACenterOfSmallRect2,
  ASizeOfBigRect1, ASizeOfSmallRect2: TVector2f;
  const AEps: Single = 0.0): Boolean;

{ Computes the visible radius of a sphere in a perspective projection.
  This radius can be used for occlusion culling (cone extrusion) or 2D
  intersection testing. }
function SphereVisibleRadius(distance, radius: Single): Single;

{ Extracts a TFrustum for combined modelview and projection matrices. }
function ExtractFrustumFromModelViewProjection(const modelViewProj: TMatrix)
  : TFrustum;

// : Determines if volume is clipped or not
function IsVolumeClipped(const objPos: TAffineVector; const objRadius: Single;
  const Frustum: TFrustum): Boolean; overload;
function IsVolumeClipped(const objPos: TVector; const objRadius: Single;
  const Frustum: TFrustum): Boolean; overload;
function IsVolumeClipped(const min, max: TAffineVector; const Frustum: TFrustum)
  : Boolean; overload;

// misc funcs

{ Creates a parallel projection matrix.
  Transformed points will projected on the plane along the specified direction. }
function MakeParallelProjectionMatrix(const plane: THmgPlane;
  const dir: TVector): TMatrix;

{ Creates a shadow projection matrix.
  Shadows will be projected onto the plane defined by planePoint and planeNormal,
  from lightPos. }
function MakeShadowMatrix(const planePoint, planeNormal,
  lightPos: TVector): TMatrix;

{ Builds a reflection matrix for the given plane.
  Reflection matrix allow implementing planar reflectors in OpenGL (mirrors). }
function MakeReflectionMatrix(const planePoint, planeNormal
  : TAffineVector): TMatrix;

{ Packs an homogeneous rotation matrix to 6 bytes.
  The 6:64 (or 6:36) compression ratio is achieved by computing the quaternion
  associated to the matrix and storing its Imaginary components at 16 bits
  precision each.
  Deviation is typically below 0.01% and around 0.1% in worst case situations.
  Note: quaternion conversion is faster and more robust than an angle decomposition. }
function PackRotationMatrix(const mat: TMatrix): TPackedRotationMatrix;
{ Restores a packed rotation matrix.
  See PackRotationMatrix. }
function UnPackRotationMatrix(const packedMatrix
  : TPackedRotationMatrix): TMatrix;

{ Calculates the barycentric coordinates for the point p on the triangle
  defined by the vertices v1, v2 and v3. That is, solves
  p = u * v1 + v * v2 + (1-u-v) * v3
  for u,v.
  Returns true if the point is inside the triangle, false otherwise.
  NOTE: This function assumes that the point lies on the plane defined by the triangle.
  If this is not the case, the function will not work correctly! }
function BarycentricCoordinates(const V1, V2, V3, p: TAffineVector;
  var u, V: Single): Boolean;

{ Calculates angles for the Camera.MoveAroundTarget(pitch, turn) procedure.
  Initially from then GLCameraColtroller unit, requires AOriginalUpVector to contain only -1, 0 or 1.
  Result contains pitch and turn angles. }
function GetSafeTurnAngle(const AOriginalPosition, AOriginalUpVector,
  ATargetPosition, AMoveAroundTargetCenter: TVector): TVector2f; overload;
function GetSafeTurnAngle(const AOriginalPosition, AOriginalUpVector,
  ATargetPosition, AMoveAroundTargetCenter: TAffineVector): TVector2f; overload;

{ Extracted from Camera.MoveAroundTarget(pitch, turn). }
function MoveObjectAround(const AMovingObjectPosition, AMovingObjectUp,
  ATargetPosition: TVector; pitchDelta, turnDelta: Single): TVector;

{ Calcualtes Angle between 2 Vectors: (A-CenterPoint) and (B-CenterPoint). In radians. }
function AngleBetweenVectors(const a, b, ACenterPoint: TVector)
  : Single; overload;
function AngleBetweenVectors(const a, b, ACenterPoint: TAffineVector)
  : Single; overload;

{ AOriginalPosition - Object initial position.
  ACenter - some point, from which is should be distanced.

  ADistance + AFromCenterSpot - distance, which object should keep from ACenter
  or
  ADistance + not AFromCenterSpot - distance, which object should shift from his current position away from center.
}
function ShiftObjectFromCenter(const AOriginalPosition: TVector;
  const ACenter: TVector; const ADistance: Single;
  const AFromCenterSpot: Boolean): TVector; overload;
function ShiftObjectFromCenter(const AOriginalPosition: TAffineVector;
  const ACenter: TAffineVector; const ADistance: Single;
  const AFromCenterSpot: Boolean): TAffineVector; overload;

const
  cPI: Single = 3.141592654;
  cPIdiv180: Single = 0.017453292;
  c180divPI: Single = 57.29577951;
  c2PI: Single = 6.283185307;
  cPIdiv2: Single = 1.570796326;
  cPIdiv4: Single = 0.785398163;
  c3PIdiv2: Single = 4.71238898;
  c3PIdiv4: Single = 2.35619449;
  cInv2PI: Single = 1 / 6.283185307;
  cInv360: Single = 1 / 360;
  c180: Single = 180;
  c360: Single = 360;
  cOneHalf: Single = 0.5;
  cLn10: Single = 2.302585093;

  // Ranges of the IEEE floating point types, including denormals
  // with Math.pas compatible name
  MinSingle = 1.5E-45;
  MaxSingle = 3.4E+38;
  MinDouble = 5.0E-324;
  MaxDouble = 1.7E+308;
  MinExtended = 3.4E-4932;
  MaxExtended = MaxDouble; //1.1E+4932 <-Overflowing in c++;
  MinComp = -9.223372036854775807E+18;
  MaxComp = 9.223372036854775807E+18;

var
  // this var is adjusted during "initialization", current values are
  // + 0 : use standard optimized FPU code
  // + 1 : use 3DNow! optimized code (requires K6-2/3 CPU)
  // + 2 : use Intel SSE code (Pentium III, NOT IMPLEMENTED YET !)
  vSIMD: Byte = 0;

  // --------------------------------------------------------------
  // --------------------------------------------------------------
  // --------------------------------------------------------------
implementation

// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------

const
{$IFDEF GLS_ASM}
  // FPU status flags (high order byte)
  cwChop: Word = $1F3F;
{$ENDIF}
  // to be used as descriptive indices
  X = 0;
  Y = 1;
  Z = 2;
  W = 3;

  cZero: Single = 0.0;
  cOne: Single = 1.0;
  cOneDotFive: Single = 0.5;

  // OptimizationMode
  //
function GeometryOptimizationMode: String;
begin
  case vSIMD of
    0:
      result := 'FPU';
    1:
      result := '3DNow!';
    2:
      result := 'SSE';
  else
    result := '*ERR*';
  end;
end;

// BeginFPUOnlySection
//
var
  vOldSIMD: Byte;
  vFPUOnlySectionCounter: Integer;

procedure BeginFPUOnlySection;
begin
  if vFPUOnlySectionCounter = 0 then
    vOldSIMD := vSIMD;
  Inc(vFPUOnlySectionCounter);
  vSIMD := 0;
end;

// EndFPUOnlySection
//
procedure EndFPUOnlySection;
begin
  Dec(vFPUOnlySectionCounter);
  Assert(vFPUOnlySectionCounter >= 0);
  if vFPUOnlySectionCounter = 0 then
    vSIMD := vOldSIMD;
end;

// ------------------------------------------------------------------------------
// ----------------- vector functions -------------------------------------------
// ------------------------------------------------------------------------------

// TexPointMake
//
function TexPointMake(const S, T: Single): TTexPoint;
begin
  result.S := S;
  result.T := T;
end;

// AffineVectorMake
//
function AffineVectorMake(const X, Y, Z: Single): TAffineVector; overload;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
end;

// AffineVectorMake
//
function AffineVectorMake(const V: TVector): TAffineVector;
begin
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
end;

// SetAffineVector
//
procedure SetAffineVector(out V: TAffineVector; const X, Y, Z: Single);
  overload;
begin
  V.X := X;
  V.Y := Y;
  V.Z := Z;
end;

// SetVector (affine)
//
procedure SetVector(out V: TAffineVector; const X, Y, Z: Single);
begin
  V.X := X;
  V.Y := Y;
  V.Z := Z;
end;

// SetVector (affine-hmg)
//
procedure SetVector(out V: TAffineVector; const vSrc: TVector);
begin
  V.X := vSrc.X;
  V.Y := vSrc.Y;
  V.Z := vSrc.Z;
end;

// SetVector (affine-affine)
//
procedure SetVector(out V: TAffineVector; const vSrc: TAffineVector);
begin
  V.X := vSrc.X;
  V.Y := vSrc.Y;
  V.Z := vSrc.Z;
end;

// SetVector (affine double - affine single)
//
procedure SetVector(out V: TAffineDblVector; const vSrc: TAffineVector);
begin
  V.X := vSrc.X;
  V.Y := vSrc.Y;
  V.Z := vSrc.Z;
end;

// SetVector (affine double - hmg single)
//
procedure SetVector(out V: TAffineDblVector; const vSrc: TVector);
begin
  V.X := vSrc.X;
  V.Y := vSrc.Y;
  V.Z := vSrc.Z;
end;

// VectorMake
//
function VectorMake(const V: TAffineVector; W: Single = 0): TVector;
begin
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
  result.W := W;
end;

// VectorMake
//
function VectorMake(const X, Y, Z: Single; W: Single = 0): TVector;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
  result.W := W;
end;

// PointMake (xyz)
//
function PointMake(const X, Y, Z: Single): TVector; overload;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
  result.W := 1;
end;

// PointMake (affine)
//
function PointMake(const V: TAffineVector): TVector; overload;
begin
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
  result.W := 1;
end;

// PointMake (hmg)
//
function PointMake(const V: TVector): TVector; overload;
begin
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
  result.W := 1;
end;

// SetVector
//
procedure SetVector(out V: TVector; const X, Y, Z: Single; W: Single = 0);
begin
  V.X := X;
  V.Y := Y;
  V.Z := Z;
  V.W := W;
end;

// SetVector
//
procedure SetVector(out V: TVector; const av: TAffineVector; W: Single = 0);
begin
  V.X := av.X;
  V.Y := av.Y;
  V.Z := av.Z;
  V.W := W;
end;

// SetVector
//
procedure SetVector(out V: TVector; const vSrc: TVector);
begin
  // faster than memcpy, move or ':=' on the TVector...
  V.X := vSrc.X;
  V.Y := vSrc.Y;
  V.Z := vSrc.Z;
  V.W := vSrc.W;
end;

// MakePoint
//
procedure MakePoint(out V: TVector; const X, Y, Z: Single);
begin
  V.X := X;
  V.Y := Y;
  V.Z := Z;
  V.W := 1.0;
end;

// MakePoint
//
procedure MakePoint(out V: TVector; const av: TAffineVector);
begin
  V.X := av.X;
  V.Y := av.Y;
  V.Z := av.Z;
  V.W := 1.0; // cOne
end;

// MakePoint
//
procedure MakePoint(out V: TVector; const av: TVector);
begin
  V.X := av.X;
  V.Y := av.Y;
  V.Z := av.Z;
  V.W := 1.0; // cOne
end;

// MakeVector
//
procedure MakeVector(out V: TAffineVector; const X, Y, Z: Single); overload;
begin
  V.X := X;
  V.Y := Y;
  V.Z := Z;
end;

// MakeVector
//
procedure MakeVector(out V: TVector; const X, Y, Z: Single);
begin
  V.X := X;
  V.Y := Y;
  V.Z := Z;
  V.W := 0.0 // cZero;
end;

// MakeVector
//
procedure MakeVector(out V: TVector; const av: TAffineVector);
begin
  V.X := av.X;
  V.Y := av.Y;
  V.Z := av.Z;
  V.W := 0.0 // cZero;
end;

// MakeVector
//
procedure MakeVector(out V: TVector; const av: TVector);
begin
  V.X := av.X;
  V.Y := av.Y;
  V.Z := av.Z;
  V.W := 0.0; // cZero;
end;

// RstVector (affine)
//
{$IFDEF GLS_ASM}
procedure RstVector(var V: TAffineVector);
asm
  xor   edx, edx
  mov   [eax], edx
  mov   [eax+4], edx
  mov   [eax+8], edx
end;
{$ELSE}
procedure RstVector(var V: TAffineVector);
begin
  V.X := 0;
  V.Y := 0;
  V.Z := 0;
end;
{$ENDIF}

// RstVector (hmg)
//
{$IFDEF GLS_ASM}
procedure RstVector(var V: TVector);
asm
  xor   edx, edx
  mov   [eax], edx
  mov   [eax+4], edx
  mov   [eax+8], edx
  mov   [eax+12], edx
end;
{$ELSE}
procedure RstVector(var V: TVector);
begin
  V.X := 0;
  V.Y := 0;
  V.Z := 0;
  V.W := 0;
end;
{$ENDIF}

// VectorAdd (func)
//
{$IFDEF GLS_ASM}
function VectorAdd(const V1, V2: TVector2f): TVector2f;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
end;
{$ELSE}
function VectorAdd(const V1, V2: TVector2f): TVector2f;
begin
  result.X := V1.X + V2.X;
  result.Y := V1.Y + V2.Y;
end;
{$ENDIF}

// VectorAdd (func, affine)
//
{$IFDEF GLS_ASM}
function VectorAdd(const V1, V2: TAffineVector): TAffineVector;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
end;
{$ELSE}
function VectorAdd(const V1, V2: TAffineVector): TAffineVector;
begin
  result.X := V1.X + V2.X;
  result.Y := V1.Y + V2.Y;
  result.Z := V1.Z + V2.Z;
end;
{$ENDIF}

// VectorAdd (proc, affine)
//
{$IFDEF GLS_ASM}
procedure VectorAdd(const V1, V2: TAffineVector;
  var vr: TAffineVector); overload;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
end;
{$ELSE}
procedure VectorAdd(const V1, V2: TAffineVector;
  var vr: TAffineVector); overload;
begin
  vr.X := V1.X + V2.X;
  vr.Y := V1.Y + V2.Y;
  vr.Z := V1.Z + V2.Z;
end;
{$ENDIF}
// VectorAdd (proc, affine)
//
{$IFDEF GLS_ASM}
procedure VectorAdd(const V1, V2: TAffineVector; vr: PAffineVector); overload;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
end;
{$ELSE}
procedure VectorAdd(const V1, V2: TAffineVector; vr: PAffineVector); overload;
begin
  vr^.X := V1.X + V2.X;
  vr^.Y := V1.Y + V2.Y;
  vr^.Z := V1.Z + V2.Z;
end;
{$ENDIF}

// VectorAdd (hmg)
//
{$IFDEF GLS_ASM}
function VectorAdd(const V1, V2: TVector): TVector;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// movq  mm0, [eax]
  db $0F,$0F,$02,$9E       /// pfadd mm0, [edx]
  db $0F,$7F,$01           /// movq  [ecx], mm0
  db $0F,$6F,$48,$08       /// movq  mm1, [eax+8]
  db $0F,$0F,$4A,$08,$9E   /// pfadd mm1, [edx+8]
  db $0F,$7F,$49,$08       /// movq  [ecx+8], mm1
  db $0F,$0E               /// femms
  ret

@@FPU:
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
  FLD  DWORD PTR [EAX+12]
  FADD DWORD PTR [EDX+12]
  FSTP DWORD PTR [ECX+12]
end;
{$ELSE}
function VectorAdd(const V1, V2: TVector): TVector;
begin
  result.X := V1.X + V2.X;
  result.Y := V1.Y + V2.Y;
  result.Z := V1.Z + V2.Z;
  result.W := V1.W + V2.W;
end;
{$ENDIF}

// VectorAdd (hmg, proc)
//
{$IFDEF GLS_ASM}
procedure VectorAdd(const V1, V2: TVector; var vr: TVector);
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// movq  mm0, [eax]
  db $0F,$0F,$02,$9E       /// pfadd mm0, [edx]
  db $0F,$7F,$01           /// movq  [ecx], mm0
  db $0F,$6F,$48,$08       /// movq  mm1, [eax+8]
  db $0F,$0F,$4A,$08,$9E   /// pfadd mm1, [edx+8]
  db $0F,$7F,$49,$08       /// movq  [ecx+8], mm1
  db $0F,$0E               /// femms
  ret

@@FPU:
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
  FLD  DWORD PTR [EAX+12]
  FADD DWORD PTR [EDX+12]
  FSTP DWORD PTR [ECX+12]
end;
{$ELSE}
procedure VectorAdd(const V1, V2: TVector; var vr: TVector);
begin
  vr.X := V1.X + V2.X;
  vr.Y := V1.Y + V2.Y;
  vr.Z := V1.Z + V2.Z;
  vr.W := V1.W + V2.W;
end;
{$ENDIF}

// VectorAdd (affine, single)
//
function VectorAdd(const V: TAffineVector; const f: Single): TAffineVector;
begin
  result.X := V.X + f;
  result.Y := V.Y + f;
  result.Z := V.Z + f;
end;

// VectorAdd (hmg, single)
//
function VectorAdd(const V: TVector; const f: Single): TVector;
begin
  result.X := V.X + f;
  result.Y := V.Y + f;
  result.Z := V.Z + f;
  result.W := V.W + f;
end;

// PointAdd (hmg, W = 1)
//
function PointAdd(var V1: TVector; const V2: TVector): TVector;
begin
  result.X := V1.X + V2.X;
  result.Y := V1.Y + V2.Y;
  result.Z := V1.Z + V2.Z;
  result.W := 1;
end;

// AddVector (affine)
//
{$IFDEF GLS_ASM}
procedure AddVector(var V1: TAffineVector; const V2: TAffineVector);
// EAX contains address of V1
// EDX contains address of V2
asm
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure AddVector(var V1: TAffineVector; const V2: TAffineVector);
begin
  V1.X := V1.X + V2.X;
  V1.Y := V1.Y + V2.Y;
  V1.Z := V1.Z + V2.Z;
end;
{$ENDIF}

// AddVector (affine)
//
{$IFDEF GLS_ASM}
procedure AddVector(var V1: TAffineVector; const V2: TVector);
// EAX contains address of V1
// EDX contains address of V2
asm
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure AddVector(var V1: TAffineVector; const V2: TVector);
begin
  V1.X := V1.X + V2.X;
  V1.Y := V1.Y + V2.Y;
  V1.Z := V1.Z + V2.Z;
end;
{$ENDIF}

// AddVector (hmg)
//
{$IFDEF GLS_ASM}
procedure AddVector(var V1: TVector; const V2: TVector);
// EAX contains address of V1
// EDX contains address of V2
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// MOVQ  MM0, [EAX]
  db $0F,$0F,$02,$9E       /// PFADD MM0, [EDX]
  db $0F,$7F,$00           /// MOVQ  [EAX], MM0
  db $0F,$6F,$48,$08       /// MOVQ  MM1, [EAX+8]
  db $0F,$0F,$4A,$08,$9E   /// PFADD MM1, [EDX+8]
  db $0F,$7F,$48,$08       /// MOVQ  [EAX+8], MM1
  db $0F,$0E               /// FEMMS
  ret
@@FPU:
  FLD  DWORD PTR [EAX]
  FADD DWORD PTR [EDX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FADD DWORD PTR [EDX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EAX+8]
  FADD DWORD PTR [EDX+8]
  FSTP DWORD PTR [EAX+8]
  FLD  DWORD PTR [EAX+12]
  FADD DWORD PTR [EDX+12]
  FSTP DWORD PTR [EAX+12]
end;
  {$ELSE}
procedure AddVector(var V1: TVector; const V2: TVector);
begin
  V1.X := V1.X + V2.X;
  V1.Y := V1.Y + V2.Y;
  V1.Z := V1.Z + V2.Z;
  V1.W := V1.W + V2.W;
end;
{$ENDIF}

// AddVector (affine)
//
procedure AddVector(var V: TAffineVector; const f: Single);
begin
  V.X := V.X + f;
  V.Y := V.Y + f;
  V.Z := V.Z + f;
end;

// AddVector (hmg)
//
procedure AddVector(var V: TVector; const f: Single);
begin
  V.X := V.X + f;
  V.Y := V.Y + f;
  V.Z := V.Z + f;
  V.W := V.W + f;
end;

// AddPoint (hmg, W = 1)
//
procedure AddPoint(var V1: TVector; const V2: TVector);
begin
  V1.X := V1.X + V2.X;
  V1.Y := V1.Y + V2.Y;
  V1.Z := V1.Z + V2.Z;
  V1.W := 1;
end;

// TexPointArrayAdd
//
procedure TexPointArrayAdd(const src: PTexPointArray; const delta: TTexPoint;
  const nb: Integer; dest: PTexPointArray); overload;
var
  i: Integer;
begin
  for i := 0 to nb - 1 do
  begin
    dest^[i].S := src^[i].S + delta.S;
    dest^[i].T := src^[i].T + delta.T;
  end;

end;

// TexPointArrayScaleAndAdd
//
procedure TexPointArrayScaleAndAdd(const src: PTexPointArray;
  const delta: TTexPoint; const nb: Integer; const scale: TTexPoint;
  dest: PTexPointArray); overload;
var
  i: Integer;
begin
  for i := 0 to nb - 1 do
  begin
    dest^[i].S := src^[i].S * scale.S + delta.S;
    dest^[i].T := src^[i].T * scale.T + delta.T;
  end;
end;

// VectorArrayAdd
//
procedure VectorArrayAdd(const src: PAffineVectorArray;
  const delta: TAffineVector; const nb: Integer; dest: PAffineVectorArray);

var
  i: Integer;
begin
  for i := 0 to nb - 1 do
  begin
    dest^[i].X := src^[i].X + delta.X;
    dest^[i].Y := src^[i].Y + delta.Y;
    dest^[i].Z := src^[i].Z + delta.Z;
  end;
end;

// VectorSubtract (func, affine)
//
{$IFDEF GLS_ASM}
function VectorSubtract(const V1, V2: TAffineVector): TAffineVector;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
end;
{$ELSE}
function VectorSubtract(const V1, V2: TAffineVector): TAffineVector;
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
  result.Z := V1.Z - V2.Z;
end;
{$ENDIF}

// VectorSubtract (func, 2f)
//
{$IFDEF GLS_ASM}
function VectorSubtract(const V1, V2: TVector2f): TVector2f;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
end;
{$ELSE}
function VectorSubtract(const V1, V2: TVector2f): TVector2f;
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
end;
{$ENDIF}

// VectorSubtract (proc, affine)
//
{$IFDEF GLS_ASM}
procedure VectorSubtract(const V1, V2: TAffineVector;
  var result: TAffineVector);
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
end;
{$ELSE}
procedure VectorSubtract(const V1, V2: TAffineVector;
  var result: TAffineVector);
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
  result.Z := V1.Z - V2.Z;
end;
{$ENDIF}

// VectorSubtract (proc, affine-hmg)
//
{$IFDEF GLS_ASM}
procedure VectorSubtract(const V1, V2: TAffineVector; var result: TVector);
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
  xor   eax, eax
  mov   [ECX+12], eax
end;
{$ELSE}
procedure VectorSubtract(const V1, V2: TAffineVector; var result: TVector);
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
  result.Z := V1.Z - V2.Z;
  result.W := 0;
end;
{$ENDIF}

// VectorSubtract
//
{$IFDEF GLS_ASM}
procedure VectorSubtract(const V1: TVector; V2: TAffineVector;
  var result: TVector);
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
  mov   edx, [eax+12]
  mov   [ECX+12], edx
end;
{$ELSE}
procedure VectorSubtract(const V1: TVector; V2: TAffineVector;
  var result: TVector);
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
  result.Z := V1.Z - V2.Z;
  result.W := V1.X;
end;
{$ENDIF}

// VectorSubtract (hmg)
//
{$IFDEF GLS_ASM}
function VectorSubtract(const V1, V2: TVector): TVector;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// MOVQ  MM0, [EAX]
  db $0F,$0F,$02,$9A       /// PFSUB MM0, [EDX]
  db $0F,$7F,$01           /// MOVQ  [ECX], MM0
  db $0F,$6F,$48,$08       /// MOVQ  MM1, [EAX+8]
  db $0F,$0F,$4A,$08,$9A   /// PFSUB MM1, [EDX+8]
  db $0F,$7F,$49,$08       /// MOVQ  [ECX+8], MM1
  db $0F,$0E               /// FEMMS
  ret
@@FPU:
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
  FLD  DWORD PTR [EAX+12]
  FSUB DWORD PTR [EDX+12]
  FSTP DWORD PTR [ECX+12]
end;
{$ELSE}
function VectorSubtract(const V1, V2: TVector): TVector;
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
  result.Z := V1.Z - V2.Z;
  result.W := V1.W - V2.W;
end;
{$ENDIF}

// VectorSubtract (proc, hmg)
//
{$IFDEF GLS_ASM}
procedure VectorSubtract(const V1, V2: TVector; var result: TVector);
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// MOVQ  MM0, [EAX]
  db $0F,$0F,$02,$9A       /// PFSUB MM0, [EDX]
  db $0F,$7F,$01           /// MOVQ  [ECX], MM0
  db $0F,$6F,$48,$08       /// MOVQ  MM1, [EAX+8]
  db $0F,$0F,$4A,$08,$9A   /// PFSUB MM1, [EDX+8]
  db $0F,$7F,$49,$08       /// MOVQ  [ECX+8], MM1
  db $0F,$0E               /// FEMMS
  ret
@@FPU:
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
  FLD  DWORD PTR [EAX+12]
  FSUB DWORD PTR [EDX+12]
  FSTP DWORD PTR [ECX+12]
end;
{$ELSE}
procedure VectorSubtract(const V1, V2: TVector; var result: TVector);
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
  result.Z := V1.Z - V2.Z;
  result.W := V1.W - V2.W;
end;
{$ENDIF}

// VectorSubtract (proc, affine)
//
{$IFDEF GLS_ASM}
procedure VectorSubtract(const V1, V2: TVector;
  var result: TAffineVector); overload;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [ECX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [ECX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [ECX+8]
end;
{$ELSE}
procedure VectorSubtract(const V1, V2: TVector;
  var result: TAffineVector); overload;
begin
  result.X := V1.X - V2.X;
  result.Y := V1.Y - V2.Y;
  result.Z := V1.Z - V2.Z;
end;
{$ENDIF}

// VectorSubtract (affine, single)
//
function VectorSubtract(const V1: TAffineVector; delta: Single): TAffineVector;
begin
  result.X := V1.X - delta;
  result.Y := V1.Y - delta;
  result.Z := V1.Z - delta;
end;

// VectorSubtract (hmg, single)
//
function VectorSubtract(const V1: TVector; delta: Single): TVector;
begin
  result.X := V1.X - delta;
  result.Y := V1.Y - delta;
  result.Z := V1.Z - delta;
  result.W := V1.W - delta;
end;

// SubtractVector (affine)
//
{$IFDEF GLS_ASM}
procedure SubtractVector(var V1: TAffineVector; const V2: TAffineVector);
// EAX contains address of V1
// EDX contains address of V2
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure SubtractVector(var V1: TAffineVector; const V2: TAffineVector);
begin
  V1.X := V1.X - V2.X;
  V1.Y := V1.Y - V2.Y;
  V1.Z := V1.Z - V2.Z;
end;
{$ENDIF}

// SubtractVector (2f)
//
{$IFDEF GLS_ASM}
procedure SubtractVector(var V1: TVector2f; const V2: TVector2f);
// EAX contains address of V1
// EDX contains address of V2
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [EAX+4]
end;
{$ELSE}
procedure SubtractVector(var V1: TVector2f; const V2: TVector2f);
begin
  V1.X := V1.X - V2.X;
  V1.Y := V1.Y - V2.Y;
end;
{$ENDIF}

// SubtractVector (hmg)
//
{$IFDEF GLS_ASM}
procedure SubtractVector(var V1: TVector; const V2: TVector);
// EAX contains address of V1
// EDX contains address of V2
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// MOVQ  MM0, [EAX]
  db $0F,$0F,$02,$9A       /// PFSUB MM0, [EDX]
  db $0F,$7F,$00           /// MOVQ  [EAX], MM0
  db $0F,$6F,$48,$08       /// MOVQ  MM1, [EAX+8]
  db $0F,$0F,$4A,$08,$9A   /// PFSUB MM1, [EDX+8]
  db $0F,$7F,$48,$08       /// MOVQ  [EAX+8], MM1
  db $0F,$0E               /// FEMMS
  ret
@@FPU:
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FSTP DWORD PTR [EAX+8]
  FLD  DWORD PTR [EAX+12]
  FSUB DWORD PTR [EDX+12]
  FSTP DWORD PTR [EAX+12]
end;
{$ELSE}
procedure SubtractVector(var V1: TVector; const V2: TVector);
begin
  V1.X := V1.X - V2.X;
  V1.Y := V1.Y - V2.Y;
  V1.Z := V1.Z - V2.Z;
  V1.W := V1.W - V2.W;
end;
{$ENDIF}

// CombineVector (var)
//
{$IFDEF GLS_ASM}
procedure CombineVector(var vr: TAffineVector; const V: TAffineVector;
  var f: Single);
// EAX contains address of vr
// EDX contains address of v
// ECX contains address of f
asm
  FLD  DWORD PTR [EDX]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EDX+4]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EDX+8]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+8]
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure CombineVector(var vr: TAffineVector; const V: TAffineVector;
  var f: Single);
begin
  vr.X := vr.X + V.X * f;
  vr.Y := vr.Y + V.Y * f;
  vr.Z := vr.Z + V.Z * f;
end;
{$ENDIF}

// CombineVector (pointer)
//
{$IFDEF GLS_ASM}
procedure CombineVector(var vr: TAffineVector; const V: TAffineVector;
  pf: PFloat);
// EAX contains address of vr
// EDX contains address of v
// ECX contains address of f
asm
  FLD  DWORD PTR [EDX]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EDX+4]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EDX+8]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+8]
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure CombineVector(var vr: TAffineVector; const V: TAffineVector;
  pf: PFloat);
begin
  vr.X := vr.X + V.X * pf^;
  vr.Y := vr.Y + V.Y * pf^;
  vr.Z := vr.Z + V.Z * pf^;
end;
{$ENDIF}

// TexPointCombine
//
function TexPointCombine(const t1, t2: TTexPoint; f1, f2: Single): TTexPoint;
begin
  result.S := (f1 * t1.S) + (f2 * t2.S);
  result.T := (f1 * t1.T) + (f2 * t2.T);
end;

// VectorCombine
//
function VectorCombine(const V1, V2: TAffineVector; const f1, f2: Single)
  : TAffineVector;
begin
  result.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]);
  result.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]);
  result.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]);
end;

// VectorCombine3 (func)
//
function VectorCombine3(const V1, V2, V3: TAffineVector;
  const f1, f2, F3: Single): TAffineVector;
begin
  result.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]) + (F3 * V3.V[X]);
  result.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]) + (F3 * V3.V[Y]);
  result.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]) + (F3 * V3.V[Z]);
end;

// VectorCombine3 (vector)
//
procedure VectorCombine3(const V1, V2, V3: TAffineVector;
  const f1, f2, F3: Single; var vr: TAffineVector);
begin
  vr.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]) + (F3 * V3.V[X]);
  vr.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]) + (F3 * V3.V[Y]);
  vr.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]) + (F3 * V3.V[Z]);
end;

// CombineVector
//
{$IFDEF GLS_ASM}
procedure CombineVector(var vr: TVector; const V: TVector;
  var f: Single); overload;
// EAX contains address of vr
// EDX contains address of v
// ECX contains address of f
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6E,$11           /// MOVD  MM2, [ECX]
  db $0F,$62,$D2           /// PUNPCKLDQ MM2, MM2
  db $0F,$6F,$02           /// MOVQ  MM0, [EDX]
  db $0F,$0F,$C2,$B4       /// PFMUL MM0, MM2
  db $0F,$0F,$00,$9E       /// PFADD MM0, [EAX]
  db $0F,$7F,$00           /// MOVQ  [EAX], MM0
  db $0F,$6F,$4A,$08       /// MOVQ  MM1, [EDX+8]
  db $0F,$0F,$CA,$B4       /// PFMUL MM1, MM2
  db $0F,$0F,$48,$08,$9E   /// PFADD MM1, [EAX+8]
  db $0F,$7F,$48,$08       /// MOVQ  [EAX+8], MM1
  db $0F,$0E               /// FEMMS
  ret
@@FPU:
  FLD  DWORD PTR [EDX]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EDX+4]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EDX+8]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+8]
  FSTP DWORD PTR [EAX+8]
  FLD  DWORD PTR [EDX+12]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+12]
  FSTP DWORD PTR [EAX+12]
end;
{$ELSE}
procedure CombineVector(var vr: TVector; const V: TVector;
  var f: Single); overload;
begin
  vr.X := vr.X + V.X * f;
  vr.Y := vr.Y + V.Y * f;
  vr.Z := vr.Z + V.Z * f;
  vr.W := vr.W + V.W * f;
end;
{$ENDIF}

// CombineVector
//
{$IFDEF GLS_ASM}
procedure CombineVector(var vr: TVector; const V: TAffineVector;
  var f: Single); overload;
// EAX contains address of vr
// EDX contains address of v
// ECX contains address of f
asm
  FLD  DWORD PTR [EDX]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EDX+4]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+4]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EDX+8]
  FMUL DWORD PTR [ECX]
  FADD DWORD PTR [EAX+8]
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure CombineVector(var vr: TVector; const V: TAffineVector;
  var f: Single); overload;
begin
  vr.X := vr.X + V.X * f;
  vr.Y := vr.Y + V.Y * f;
  vr.Z := vr.Z + V.Z * f;
end;
{$ENDIF}

// VectorCombine
//
function VectorCombine(const V1, V2: TVector; const f1, f2: Single): TVector;
begin
  result.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]);
  result.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]);
  result.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]);
  result.V[W] := (f1 * V1.V[W]) + (f2 * V2.V[W]);
end;

// VectorCombine
//
function VectorCombine(const V1: TVector; const V2: TAffineVector;
  const f1, f2: Single): TVector; overload;
begin
  result.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]);
  result.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]);
  result.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]);
  result.V[W] := f1 * V1.V[W];
end;

// VectorCombine
//
procedure VectorCombine(const V1, V2: TVector; const f1, f2: Single;
  var vr: TVector); overload;
begin
  vr.X := (f1 * V1.X) + (f2 * V2.X);
  vr.Y := (f1 * V1.Y) + (f2 * V2.Y);
  vr.Z := (f1 * V1.Z) + (f2 * V2.Z);
  vr.W := (f1 * V1.W) + (f2 * V2.W);
end;

// VectorCombine (F1=1.0)
//
procedure VectorCombine(const V1, V2: TVector; const f2: Single;
  var vr: TVector); overload;
begin // 201283
  vr.X := V1.X + (f2 * V2.X);
  vr.Y := V1.Y + (f2 * V2.Y);
  vr.Z := V1.Z + (f2 * V2.Z);
  vr.W := V1.W + (f2 * V2.W);
end;

// VectorCombine
//
procedure VectorCombine(const V1: TVector; const V2: TAffineVector;
  const f1, f2: Single; var vr: TVector);
begin
  vr.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]);
  vr.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]);
  vr.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]);
  vr.V[W] := f1 * V1.V[W];
end;

// VectorCombine3
//
function VectorCombine3(const V1, V2, V3: TVector;
  const f1, f2, F3: Single): TVector;
begin
  result.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]) + (F3 * V3.V[X]);
  result.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]) + (F3 * V3.V[Y]);
  result.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]) + (F3 * V3.V[Z]);
  result.V[W] := (f1 * V1.V[W]) + (f2 * V2.V[W]) + (F3 * V3.V[W]);
end;

// VectorCombine3
//
procedure VectorCombine3(const V1, V2, V3: TVector; const f1, f2, F3: Single;
  var vr: TVector);
begin
  vr.V[X] := (f1 * V1.V[X]) + (f2 * V2.V[X]) + (F3 * V3.V[X]);
  vr.V[Y] := (f1 * V1.V[Y]) + (f2 * V2.V[Y]) + (F3 * V3.V[Y]);
  vr.V[Z] := (f1 * V1.V[Z]) + (f2 * V2.V[Z]) + (F3 * V3.V[Z]);
  vr.V[W] := (f1 * V1.V[W]) + (f2 * V2.V[W]) + (F3 * V3.V[W]);
end;

// VectorDotProduct (2f)
//
function VectorDotProduct(const V1, V2: TVector2f): Single;
begin
  result := V1.X * V2.X + V1.Y * V2.Y;
end;

// VectorDotProduct (affine)
//
{$IFDEF GLS_ASM}
function VectorDotProduct(const V1, V2: TAffineVector): Single;
// EAX contains address of V1
// EDX contains address of V2
// result is stored in ST(0)
asm
  FLD DWORD PTR [eax]
  FMUL DWORD PTR [edx]
  FLD DWORD PTR [eax+4]
  FMUL DWORD PTR [edx+4]
  faddp
  FLD DWORD PTR [eax+8]
  FMUL DWORD PTR [edx+8]
  faddp
end;
{$ELSE}
function VectorDotProduct(const V1, V2: TAffineVector): Single;
begin
  result := V1.X * V2.X + V1.Y * V2.Y + V1.Z * V2.Z;
end;
{$ENDIF}

// VectorDotProduct (hmg)
//
{$IFDEF GLS_ASM}
function VectorDotProduct(const V1, V2: TVector): Single;
// EAX contains address of V1
// EDX contains address of V2
// result is stored in ST(0)
asm
  FLD DWORD PTR [EAX]
  FMUL DWORD PTR [EDX]
  FLD DWORD PTR [EAX + 4]
  FMUL DWORD PTR [EDX + 4]
  FADDP
  FLD DWORD PTR [EAX + 8]
  FMUL DWORD PTR [EDX + 8]
  FADDP
  FLD DWORD PTR [EAX + 12]
  FMUL DWORD PTR [EDX + 12]
  FADDP
end;
{$ELSE}
function VectorDotProduct(const V1, V2: TVector): Single;
begin
  result := V1.X * V2.X + V1.Y * V2.Y + V1.Z * V2.Z + V1.W
    * V2.W;
end;
{$ENDIF}

// VectorDotProduct
//
{$IFDEF GLS_ASM}
function VectorDotProduct(const V1: TVector; const V2: TAffineVector): Single;
// EAX contains address of V1
// EDX contains address of V2
// result is stored in ST(0)
asm
  FLD DWORD PTR [EAX]
  FMUL DWORD PTR [EDX]
  FLD DWORD PTR [EAX + 4]
  FMUL DWORD PTR [EDX + 4]
  FADDP
  FLD DWORD PTR [EAX + 8]
  FMUL DWORD PTR [EDX + 8]
  FADDP
end;
{$ELSE}
function VectorDotProduct(const V1: TVector; const V2: TAffineVector): Single;
begin
  result := V1.X * V2.X + V1.Y * V2.Y + V1.Z * V2.Z;
end;
{$ENDIF}

// PointProject (affine)
//
{$IFDEF GLS_ASM}
function PointProject(const p, origin, direction: TAffineVector): Single;
// EAX -> p, EDX -> origin, ECX -> direction
asm
  fld   dword ptr [eax]
  fsub  dword ptr [edx]
  fmul  dword ptr [ecx]
  fld   dword ptr [eax+4]
  fsub  dword ptr [edx+4]
  fmul  dword ptr [ecx+4]
  fadd
  fld   dword ptr [eax+8]
  fsub  dword ptr [edx+8]
  fmul  dword ptr [ecx+8]
  fadd
end;
{$ELSE}
function PointProject(const p, origin, direction: TAffineVector): Single;
begin
  result := direction.X * (p.X - origin.X) + direction.Y *
    (p.Y - origin.Y) + direction.Z * (p.Z - origin.Z);
end;
{$ENDIF}

// PointProject (vector)
//
{$IFDEF GLS_ASM}
function PointProject(const p, origin, direction: TVector): Single;
// EAX -> p, EDX -> origin, ECX -> direction
asm
  fld   dword ptr [eax]
  fsub  dword ptr [edx]
  fmul  dword ptr [ecx]
  fld   dword ptr [eax+4]
  fsub  dword ptr [edx+4]
  fmul  dword ptr [ecx+4]
  fadd
  fld   dword ptr [eax+8]
  fsub  dword ptr [edx+8]
  fmul  dword ptr [ecx+8]
  fadd
end;
{$ELSE}
function PointProject(const p, origin, direction: TVector): Single;
begin
  result := direction.X * (p.X - origin.X) + direction.Y *
    (p.Y - origin.Y) + direction.Z * (p.Z - origin.Z);
end;
{$ENDIF}

// VectorCrossProduct
//
{$IFDEF GLS_ASM}
function VectorCrossProduct(const V1, V2: TAffineVector): TAffineVector;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx+$8]
  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx+$4]
  fsubp
  fstp  dword ptr [ecx]

  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx]
  fld   dword ptr [eax]
  fmul  dword ptr [edx+$8]
  fsubp
  fstp  dword ptr [ecx+$4]

  fld   dword ptr [eax]
  fmul  dword ptr [edx+$4]
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx]
  fsubp
  fstp  dword ptr [ecx+$8]
end;
{$ELSE}
function VectorCrossProduct(const V1, V2: TAffineVector): TAffineVector;
begin
  result.V[X] := V1.V[Y] * V2.V[Z] - V1.V[Z] * V2.V[Y];
  result.V[Y] := V1.V[Z] * V2.V[X] - V1.V[X] * V2.V[Z];
  result.V[Z] := V1.V[X] * V2.V[Y] - V1.V[Y] * V2.V[X];
end;
{$ENDIF}

// VectorCrossProduct
//
{$IFDEF GLS_ASM}
function VectorCrossProduct(const V1, V2: TVector): TVector;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx+$8]
  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx+$4]
  fsubp
  fstp  dword ptr [ecx]

  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx]
  fld   dword ptr [eax]
  fmul  dword ptr [edx+$8]
  fsubp
  fstp  dword ptr [ecx+$4]

  fld   dword ptr [eax]
  fmul  dword ptr [edx+$4]
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx]
  fsubp
  fstp  dword ptr [ecx+$8]

  xor   eax, eax
  mov   [ecx+$c], eax
end;
{$ELSE}
function VectorCrossProduct(const V1, V2: TVector): TVector;
begin
  result.V[X] := V1.V[Y] * V2.V[Z] - V1.V[Z] * V2.V[Y];
  result.V[Y] := V1.V[Z] * V2.V[X] - V1.V[X] * V2.V[Z];
  result.V[Z] := V1.V[X] * V2.V[Y] - V1.V[Y] * V2.V[X];
  result.V[W] := 0;
end;
{$ENDIF}

// VectorCrossProduct
//
{$IFDEF GLS_ASM}
procedure VectorCrossProduct(const V1, V2: TVector; var vr: TVector);
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx+$8]
  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx+$4]
  fsubp
  fstp  dword ptr [ecx]

  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx]
  fld   dword ptr [eax]
  fmul  dword ptr [edx+$8]
  fsubp
  fstp  dword ptr [ecx+$4]

  fld   dword ptr [eax]
  fmul  dword ptr [edx+$4]
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx]
  fsubp
  fstp  dword ptr [ecx+$8]

  xor   eax, eax
  mov   [ecx+$c], eax
end;
{$ELSE}
procedure VectorCrossProduct(const V1, V2: TVector; var vr: TVector);
begin
  vr.V[X] := V1.V[Y] * V2.V[Z] - V1.V[Z] * V2.V[Y];
  vr.V[Y] := V1.V[Z] * V2.V[X] - V1.V[X] * V2.V[Z];
  vr.V[Z] := V1.V[X] * V2.V[Y] - V1.V[Y] * V2.V[X];
  vr.V[W] := 0;
end;
{$ENDIF}

// VectorCrossProduct
//
{$IFDEF GLS_ASM}
procedure VectorCrossProduct(const V1, V2: TAffineVector;
  var vr: TVector); overload;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx+$8]
  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx+$4]
  fsubp
  fstp  dword ptr [ecx]

  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx]
  fld   dword ptr [eax]
  fmul  dword ptr [edx+$8]
  fsubp
  fstp  dword ptr [ecx+$4]

  fld   dword ptr [eax]
  fmul  dword ptr [edx+$4]
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx]
  fsubp
  fstp  dword ptr [ecx+$8]

  xor   eax, eax
  mov   [ecx+$c], eax
end;
{$ELSE}
procedure VectorCrossProduct(const V1, V2: TAffineVector;
  var vr: TVector); overload;
begin
  vr.V[X] := V1.V[Y] * V2.V[Z] - V1.V[Z] * V2.V[Y];
  vr.V[Y] := V1.V[Z] * V2.V[X] - V1.V[X] * V2.V[Z];
  vr.V[Z] := V1.V[X] * V2.V[Y] - V1.V[Y] * V2.V[X];
  vr.V[W] := 0;
end;
{$ENDIF}

// VectorCrossProduct
//
{$IFDEF GLS_ASM}
procedure VectorCrossProduct(const V1, V2: TVector;
  var vr: TAffineVector); overload;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx+$8]
  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx+$4]
  fsubp
  fstp  dword ptr [ecx]

  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx]
  fld   dword ptr [eax]
  fmul  dword ptr [edx+$8]
  fsubp
  fstp  dword ptr [ecx+$4]

  fld   dword ptr [eax]
  fmul  dword ptr [edx+$4]
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx]
  fsubp
  fstp  dword ptr [ecx+$8]
end;
{$ELSE}
procedure VectorCrossProduct(const V1, V2: TVector;
  var vr: TAffineVector); overload;
begin
  vr.V[X] := V1.V[Y] * V2.V[Z] - V1.V[Z] * V2.V[Y];
  vr.V[Y] := V1.V[Z] * V2.V[X] - V1.V[X] * V2.V[Z];
  vr.V[Z] := V1.V[X] * V2.V[Y] - V1.V[Y] * V2.V[X];
end;
{$ENDIF}

// VectorCrossProduct
//
{$IFDEF GLS_ASM}
procedure VectorCrossProduct(const V1, V2: TAffineVector;
  var vr: TAffineVector); overload;
// EAX contains address of V1
// EDX contains address of V2
// ECX contains the result
asm
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx+$8]
  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx+$4]
  fsubp
  fstp  dword ptr [ecx]

  fld   dword ptr [eax+$8]
  fmul  dword ptr [edx]
  fld   dword ptr [eax]
  fmul  dword ptr [edx+$8]
  fsubp
  fstp  dword ptr [ecx+$4]

  fld   dword ptr [eax]
  fmul  dword ptr [edx+$4]
  fld   dword ptr [eax+$4]
  fmul  dword ptr [edx]
  fsubp
  fstp  dword ptr [ecx+$8]
end;
{$ELSE}
procedure VectorCrossProduct(const V1, V2: TAffineVector;
  var vr: TAffineVector); overload;
begin
  vr.V[X] := V1.V[Y] * V2.V[Z] - V1.V[Z] * V2.V[Y];
  vr.V[Y] := V1.V[Z] * V2.V[X] - V1.V[X] * V2.V[Z];
  vr.V[Z] := V1.V[X] * V2.V[Y] - V1.V[Y] * V2.V[X];
end;
{$ENDIF}

// Lerp
//
function Lerp(const start, stop, T: Single): Single;
begin
  result := start + (stop - start) * T;
end;

// Angle Lerp
//
function AngleLerp(start, stop, T: Single): Single;
var
  d: Single;
begin
  start := NormalizeAngle(start);
  stop := NormalizeAngle(stop);
  d := stop - start;
  if d > PI then
  begin
    // positive d, angle on opposite side, becomes negative i.e. changes direction
    d := -d - c2PI;
  end
  else if d < -PI then
  begin
    // negative d, angle on opposite side, becomes positive i.e. changes direction
    d := d + c2PI;
  end;
  result := start + d * T;
end;

// DistanceBetweenAngles
//
function DistanceBetweenAngles(angle1, angle2: Single): Single;
begin
  angle1 := NormalizeAngle(angle1);
  angle2 := NormalizeAngle(angle2);
  result := Abs(angle2 - angle1);
  if result > PI then
    result := c2PI - result;
end;

// TexPointLerp
//
function TexPointLerp(const t1, t2: TTexPoint; T: Single): TTexPoint; overload;
begin
  result.S := t1.S + (t2.S - t1.S) * T;
  result.T := t1.T + (t2.T - t1.T) * T;
end;

// VectorAffineLerp
//
function VectorLerp(const V1, V2: TAffineVector; T: Single): TAffineVector;
begin
  result.V[X] := V1.V[X] + (V2.V[X] - V1.V[X]) * T;
  result.V[Y] := V1.V[Y] + (V2.V[Y] - V1.V[Y]) * T;
  result.V[Z] := V1.V[Z] + (V2.V[Z] - V1.V[Z]) * T;
end;

// VectorLerp
//
procedure VectorLerp(const V1, V2: TAffineVector; T: Single;
  var vr: TAffineVector);
begin
  vr.V[X] := V1.V[X] + (V2.V[X] - V1.V[X]) * T;
  vr.V[Y] := V1.V[Y] + (V2.V[Y] - V1.V[Y]) * T;
  vr.V[Z] := V1.V[Z] + (V2.V[Z] - V1.V[Z]) * T;
end;

// VectorLerp
//
function VectorLerp(const V1, V2: TVector; T: Single): TVector;
begin
  result.V[X] := V1.V[X] + (V2.V[X] - V1.V[X]) * T;
  result.V[Y] := V1.V[Y] + (V2.V[Y] - V1.V[Y]) * T;
  result.V[Z] := V1.V[Z] + (V2.V[Z] - V1.V[Z]) * T;
  result.V[W] := V1.V[W] + (V2.V[W] - V1.V[W]) * T;
end;

// VectorLerp
//
procedure VectorLerp(const V1, V2: TVector; T: Single; var vr: TVector);
begin
  vr.V[X] := V1.V[X] + (V2.V[X] - V1.V[X]) * T;
  vr.V[Y] := V1.V[Y] + (V2.V[Y] - V1.V[Y]) * T;
  vr.V[Z] := V1.V[Z] + (V2.V[Z] - V1.V[Z]) * T;
  vr.V[W] := V1.V[W] + (V2.V[W] - V1.V[W]) * T;
end;

// VectorAngleLerp
//
function VectorAngleLerp(const V1, V2: TAffineVector; T: Single): TAffineVector;
var
  q1, q2, qR: TQuaternion;
  M: TMatrix;
  Tran: TTransformations;
begin
  if VectorEquals(V1, V2) then
  begin
    result := V1;
  end
  else
  begin
    q1 := QuaternionFromEuler(RadToDeg(V1.X), RadToDeg(V1.Y),
      RadToDeg(V1.Z), eulZYX);
    q2 := QuaternionFromEuler(RadToDeg(V2.X), RadToDeg(V2.Y),
      RadToDeg(V2.Z), eulZYX);
    qR := QuaternionSlerp(q1, q2, T);
    M := QuaternionToMatrix(qR);
    MatrixDecompose(M, Tran);
    result.X := Tran[ttRotateX];
    result.Y := Tran[ttRotateY];
    result.Z := Tran[ttRotateZ];
  end;
end;

// VectorAngleCombine
//
function VectorAngleCombine(const V1, V2: TAffineVector; f: Single)
  : TAffineVector;
begin
  result := VectorCombine(V1, V2, 1, f);
end;

// VectorArrayLerp (hmg)
//
procedure VectorArrayLerp(const src1, src2: PVectorArray; T: Single; n: Integer;
  dest: PVectorArray);
var
  i: Integer;
begin
  for i := 0 to n - 1 do
  begin
    dest^[i].X := src1^[i].X + (src2^[i].X - src1^[i].X) * T;
    dest^[i].Y := src1^[i].Y + (src2^[i].Y - src1^[i].Y) * T;
    dest^[i].Z := src1^[i].Z + (src2^[i].Z - src1^[i].Z) * T;
    dest^[i].W := src1^[i].W + (src2^[i].W - src1^[i].W) * T;
  end;
 end;


// VectorArrayLerp (affine)
//
procedure VectorArrayLerp(const src1, src2: PAffineVectorArray; T: Single;
  n: Integer; dest: PAffineVectorArray);
var
  i: Integer;
begin
  for i := 0 to n - 1 do
  begin
    dest^[i].X := src1^[i].X + (src2^[i].X - src1^[i].X) * T;
    dest^[i].Y := src1^[i].Y + (src2^[i].Y - src1^[i].Y) * T;
    dest^[i].Z := src1^[i].Z + (src2^[i].Z - src1^[i].Z) * T;
  end;
end;

procedure VectorArrayLerp(const src1, src2: PTexPointArray; T: Single;
  n: Integer; dest: PTexPointArray);
var
  i: Integer;
begin
  for i := 0 to n - 1 do
  begin
    dest^[i].S := src1^[i].S + (src2^[i].S - src1^[i].S) * T;
    dest^[i].T := src1^[i].T + (src2^[i].T - src1^[i].T) * T;
  end;
end;

// InterpolateCombined
//
function InterpolateCombined(const start, stop, delta: Single;
  const DistortionDegree: Single;
  const InterpolationType: TGLInterpolationType): Single;
begin
  case InterpolationType of
    itLinear:
      result := Lerp(start, stop, delta);
    itPower:
      result := InterpolatePower(start, stop, delta, DistortionDegree);
    itSin:
      result := InterpolateSin(start, stop, delta);
    itSinAlt:
      result := InterpolateSinAlt(start, stop, delta);
    itTan:
      result := InterpolateTan(start, stop, delta);
    itLn:
      result := InterpolateLn(start, stop, delta, DistortionDegree);
    itExp:
      result := InterpolateExp(start, stop, delta, DistortionDegree);
  else
    begin
      result := -1;
      Assert(False);
    end;
  end;
end;

// InterpolateCombinedFastPower
//
function InterpolateCombinedFastPower(const OriginalStart, OriginalStop,
  OriginalCurrent: Single; const TargetStart, TargetStop: Single;
  const DistortionDegree: Single): Single;
begin
  result := InterpolatePower(TargetStart, TargetStop,
    (OriginalCurrent - OriginalStart) / (OriginalStop - OriginalStart),
    DistortionDegree);
end;

// InterpolateCombinedSafe
//
function InterpolateCombinedSafe(const OriginalStart, OriginalStop,
  OriginalCurrent: Single; const TargetStart, TargetStop: Single;
  const DistortionDegree: Single;
  const InterpolationType: TGLInterpolationType): Single;
var
  ChangeDelta: Single;
begin
  if OriginalStop = OriginalStart then
    result := TargetStart
  else
  begin
    ChangeDelta := (OriginalCurrent - OriginalStart) /
      (OriginalStop - OriginalStart);
    result := InterpolateCombined(TargetStart, TargetStop, ChangeDelta,
      DistortionDegree, InterpolationType);
  end;
end;

// InterpolateCombinedFast
//
function InterpolateCombinedFast(const OriginalStart, OriginalStop,
  OriginalCurrent: Single; const TargetStart, TargetStop: Single;
  const DistortionDegree: Single;
  const InterpolationType: TGLInterpolationType): Single;
var
  ChangeDelta: Single;
begin
  ChangeDelta := (OriginalCurrent - OriginalStart) /
    (OriginalStop - OriginalStart);
  result := InterpolateCombined(TargetStart, TargetStop, ChangeDelta,
    DistortionDegree, InterpolationType);
end;

// InterpolateLn
//
function InterpolateLn(const start, stop, delta: Single;
  const DistortionDegree: Single): Single;
begin
  result := (stop - start) * Ln(1 + delta * DistortionDegree) /
    Ln(1 + DistortionDegree) + start;
end;

// InterpolateExp
//
function InterpolateExp(const start, stop, delta: Single;
  const DistortionDegree: Single): Single;
begin
  result := (stop - start) * Exp(-DistortionDegree * (1 - delta)) + start;
end;

// InterpolateSinAlt
//
function InterpolateSinAlt(const start, stop, delta: Single): Single;
begin
  result := (stop - start) * delta * Sin(delta * PI / 2) + start;
end;

// InterpolateSin
//
function InterpolateSin(const start, stop, delta: Single): Single;
begin
  result := (stop - start) * Sin(delta * PI / 2) + start;
end;

// InterpolateTan
//
function InterpolateTan(const start, stop, delta: Single): Single;
begin
  result := (stop - start) * Tan(delta * PI / 4) + start;
end;

// InterpolatePower
//
function InterpolatePower(const start, stop, delta: Single;
  const DistortionDegree: Single): Single;
var
  i: Integer;
begin
  if (Round(DistortionDegree) <> DistortionDegree) and (delta < 0) then
  begin
    i := Round(DistortionDegree);
    result := (stop - start) * PowerInteger(delta, i) + start;
  end
  else
    result := (stop - start) * Power(delta, DistortionDegree) + start;
end;

// MatrixLerp
//
function MatrixLerp(const m1, m2: TMatrix; const delta: Single): TMatrix;
var
  i, J: Integer;
begin
  for J := 0 to 3 do
    for i := 0 to 3 do
      result.V[i].V[J] := m1.V[i].V[J] + (m2.V[i].V[J] - m1.V[i].V[J]) * delta;
end;

// VectorLength (array)
//
{$IFDEF GLS_ASM}
function VectorLength(const V: array of Single): Single;
// EAX contains address of V
// EDX contains the highest index of V
// the result is returned in ST(0)
asm
  FLDZ                           // initialize sum
@@Loop:
  FLD  DWORD PTR [EAX  +  4 * EDX] // load a component
  FMUL ST, ST
  FADDP
  SUB  EDX, 1
  JNL  @@Loop
  FSQRT
end;
{$ELSE}
function VectorLength(const V: array of Single): Single;
var
  i: Integer;
begin
  result := 0;
  for i := Low(V) to High(V) do
    result := result + Sqr(V[i]);
  result := Sqrt(result);
end;
{$ENDIF}

// VectorLength  (x, y)
//
function VectorLength(const X, Y: Single): Single;
begin
  result := Sqrt(X * X + Y * Y);
end;

// VectorLength (x, y, z)
//
function VectorLength(const X, Y, Z: Single): Single;
begin
  result := Sqrt(X * X + Y * Y + Z * Z);
end;

// VectorLength
//
function VectorLength(const V: TVector2f): Single;
begin
  result := Sqrt(VectorNorm(V.X, V.Y));
end;

// VectorLength
//
function VectorLength(const V: TAffineVector): Single;
// EAX contains address of V
// result is passed in ST(0)
begin
  result := Sqrt(VectorNorm(V));
end;

// VectorLength
//
{$IFDEF GLS_ASM}
function VectorLength(const V: TVector): Single;
// EAX contains address of V
// result is passed in ST(0)
asm
  FLD  DWORD PTR [EAX]
  FMUL ST, ST
  FLD  DWORD PTR [EAX+4]
  FMUL ST, ST
  FADDP
  FLD  DWORD PTR [EAX+8]
  FMUL ST, ST
  FADDP
  FSQRT
end;
{$ELSE}
function VectorLength(const V: TVector): Single;
begin
  result := Sqrt(VectorNorm(V));
end;
{$ENDIF}

// VectorNorm
//
function VectorNorm(const X, Y: Single): Single;
begin
  result := Sqr(X) + Sqr(Y);
end;

// VectorNorm (affine)
//
{$IFDEF GLS_ASM}
function VectorNorm(const V: TAffineVector): Single;
// EAX contains address of V
// result is passed in ST(0)
asm
  FLD DWORD PTR [EAX];
  FMUL ST, ST
  FLD DWORD PTR [EAX+4];
  FMUL ST, ST
  FADD
  FLD DWORD PTR [EAX+8];
  FMUL ST, ST
  FADD
end;
{$ELSE}
function VectorNorm(const V: TAffineVector): Single;
begin
  result := V.X * V.X + V.Y * V.Y + V.Z * V.Z;
end;
{$ENDIF}

// VectorNorm (hmg)
//
{$IFDEF GLS_ASM}
function VectorNorm(const V: TVector): Single;
// EAX contains address of V
// result is passed in ST(0)
asm
  FLD DWORD PTR [EAX];
  FMUL ST, ST
  FLD DWORD PTR [EAX+4];
  FMUL ST, ST
  FADD
  FLD DWORD PTR [EAX+8];
  FMUL ST, ST
  FADD
end;
{$ELSE}
function VectorNorm(const V: TVector): Single;
begin
  result := V.X * V.X + V.Y * V.Y + V.Z * V.Z;
end;
{$ENDIF}

// VectorNorm
//
{$IFDEF GLS_ASM}
function VectorNorm(var V: array of Single): Single;
// EAX contains address of V
// EDX contains highest index in V
// result is passed in ST(0)
asm
  FLDZ                           // initialize sum
@@Loop:
  FLD  DWORD PTR [EAX + 4 * EDX] // load a component
  FMUL ST, ST                    // make square
  FADDP                          // add previous calculated sum
  SUB  EDX, 1
  JNL  @@Loop
end;
{$ELSE}
function VectorNorm(var V: array of Single): Single;
var
  i: Integer;
begin
  result := 0;
  for i := Low(V) to High(V) do
    result := result + V[i] * V[i];
end;
{$ENDIF}

// NormalizeVector (2f)
//
{$IFDEF GLS_ASM}
procedure NormalizeVector(var V: TVector2f);
asm
  test vSIMD, 1
@@FPU:
  mov   ecx, eax
  FLD  DWORD PTR [ECX]
  FMUL ST, ST
  FLD  DWORD PTR [ECX+4]
  FMUL ST, ST
  FADD
  FLDZ
  FCOMP
  FNSTSW AX
  sahf
  jz @@result
  FSQRT
  FLD1
  FDIVR
@@result:
  FLD  ST
  FMUL DWORD PTR [ECX]
  FSTP DWORD PTR [ECX]
  FLD  ST
  FMUL DWORD PTR [ECX+4]
  FSTP DWORD PTR [ECX+4]
end;
{$ELSE}
procedure NormalizeVector(var V: TVector2f);
var
  invLen: Single;
  vn: Single;
begin
  vn := VectorNorm(V.V);
  if vn > 0 then
  begin
    invLen := RSqrt(vn);
    V.X := V.X * invLen;
    V.Y := V.Y * invLen;
  end;
end;
{$ENDIF}

// NormalizeVector (affine)
//
{$IFDEF GLS_ASM}
procedure NormalizeVector(var V: TAffineVector);
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// movq        mm0,[eax]
  db $0F,$6E,$48,$08       /// movd        mm1,[eax+8]
  db $0F,$6F,$E0           /// movq        mm4,mm0
  db $0F,$6F,$D9           /// movq        mm3,mm1
  db $0F,$0F,$C0,$B4       /// pfmul       mm0,mm0
  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C0,$AE       /// pfacc       mm0,mm0
  db $0F,$0F,$C1,$9E       /// pfadd       mm0,mm1
  db $0F,$0F,$C8,$97       /// pfrsqrt     mm1,mm0
  db $0F,$6F,$D1           /// movq        mm2,mm1

  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C8,$A7       /// pfrsqit1    mm1,mm0
  db $0F,$0F,$CA,$B6       /// pfrcpit2    mm1,mm2
  db $0F,$62,$C9           /// punpckldq   mm1,mm1
  db $0F,$0F,$D9,$B4       /// pfmul       mm3,mm1
  db $0F,$0F,$E1,$B4       /// pfmul       mm4,mm1
  db $0F,$7E,$58,$08       /// movd        [eax+8],mm3
  db $0F,$7F,$20           /// movq        [eax],mm4
@@norm_end:
  db $0F,$0E               /// femms
  ret

@@FPU:
  mov   ecx, eax
  FLD  DWORD PTR [ECX]
  FMUL ST, ST
  FLD  DWORD PTR [ECX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [ECX+8]
  FMUL ST, ST
  FADD
  FLDZ
  FCOMP
  FNSTSW AX
  sahf
  jz @@result
  FSQRT
  FLD1
  FDIVR
@@result:
  FLD  ST
  FMUL DWORD PTR [ECX]
  FSTP DWORD PTR [ECX]
  FLD  ST
  FMUL DWORD PTR [ECX+4]
  FSTP DWORD PTR [ECX+4]
  FMUL DWORD PTR [ECX+8]
  FSTP DWORD PTR [ECX+8]
end;
{$ELSE}
procedure NormalizeVector(var V: TAffineVector);
var
  invLen: Single;
  vn: Single;
begin
  vn := VectorNorm(V);
  if vn > 0 then
  begin
    invLen := RSqrt(vn);
    V.X := V.X * invLen;
    V.Y := V.Y * invLen;
    V.Z := V.Z * invLen;
  end;
end;
{$ENDIF}

// VectorNormalize
//
function VectorNormalize(const V: TVector2f): TVector2f;
var
  invLen: Single;
  vn: Single;
begin
  vn := VectorNorm(V.X, V.Y);
  if vn = 0 then
    result := V
  else
  begin
    invLen := RSqrt(vn);
    result.X := V.X * invLen;
    result.Y := V.Y * invLen;
  end;
end;

// VectorNormalize
//
{$IFDEF GLS_ASM}
function VectorNormalize(const V: TAffineVector): TAffineVector;
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// movq        mm0,[eax]
  db $0F,$6E,$48,$08       /// movd        mm1,[eax+8]
  db $0F,$6F,$E0           /// movq        mm4,mm0
  db $0F,$6F,$D9           /// movq        mm3,mm1
  db $0F,$0F,$C0,$B4       /// pfmul       mm0,mm0
  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C0,$AE       /// pfacc       mm0,mm0
  db $0F,$0F,$C1,$9E       /// pfadd       mm0,mm1
  db $0F,$0F,$C8,$97       /// pfrsqrt     mm1,mm0
  db $0F,$6F,$D1           /// movq        mm2,mm1

  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C8,$A7       /// pfrsqit1    mm1,mm0
  db $0F,$0F,$CA,$B6       /// pfrcpit2    mm1,mm2
  db $0F,$62,$C9           /// punpckldq   mm1,mm1
  db $0F,$0F,$D9,$B4       /// pfmul       mm3,mm1
  db $0F,$0F,$E1,$B4       /// pfmul       mm4,mm1
  db $0F,$7E,$5A,$08       /// movd        [edx+8],mm3
  db $0F,$7F,$22           /// movq        [edx],mm4
@@norm_end:
  db $0F,$0E               /// femms
  ret

@@FPU:
  mov   ecx, eax
  FLD  DWORD PTR [ECX]
  FMUL ST, ST
  FLD  DWORD PTR [ECX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [ECX+8]
  FMUL ST, ST
  FADD
  FLDZ
  FCOMP
  FNSTSW AX
  sahf
  jz @@result
  FSQRT
  FLD1
  FDIVR
@@result:
  FLD  ST
  FMUL DWORD PTR [ECX]
  FSTP DWORD PTR [EDX]
  FLD  ST
  FMUL DWORD PTR [ECX+4]
  FSTP DWORD PTR [EDX+4]
  FMUL DWORD PTR [ECX+8]
  FSTP DWORD PTR [EDX+8]
end;
{$ELSE}
function VectorNormalize(const V: TAffineVector): TAffineVector;
var
  invLen: Single;
  vn: Single;
begin
  vn := VectorNorm(V);
  if vn = 0 then
    SetVector(result, V)
  else
  begin
    invLen := RSqrt(vn);
    result.X := V.X * invLen;
    result.Y := V.Y * invLen;
    result.Z := V.Z * invLen;
  end;
end;
{$ENDIF}

// NormalizeVectorArray
//
{$IFDEF GLS_ASM}
procedure NormalizeVectorArray(list: PAffineVectorArray; n: Integer);
// EAX contains list
// EDX contains n
asm
  OR    EDX, EDX
  JZ    @@End
  test vSIMD, 1
  jz @@FPU
@@3DNowLoop:
  db $0F,$6F,$00           /// movq        mm0,[eax]
  db $0F,$6E,$48,$08       /// movd        mm1,[eax+8]
  db $0F,$6F,$E0           /// movq        mm4,mm0
  db $0F,$6F,$D9           /// movq        mm3,mm1
  db $0F,$0F,$C0,$B4       /// pfmul       mm0,mm0
  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C0,$AE       /// pfacc       mm0,mm0
  db $0F,$0F,$C1,$9E       /// pfadd       mm0,mm1
  db $0F,$0F,$C8,$97       /// pfrsqrt     mm1,mm0
  db $0F,$6F,$D1           /// movq        mm2,mm1

  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C8,$A7       /// pfrsqit1    mm1,mm0
  db $0F,$0F,$CA,$B6       /// pfrcpit2    mm1,mm2
  db $0F,$62,$C9           /// punpckldq   mm1,mm1
  db $0F,$0F,$D9,$B4       /// pfmul       mm3,mm1
  db $0F,$0F,$E1,$B4       /// pfmul       mm4,mm1
  db $0F,$7E,$58,$08       /// movd        [eax+8],mm3
  db $0F,$7F,$20           /// movq        [eax],mm4
@@norm_end:
  db $0F,$0E               /// femms
  add   eax, 12
  db $0F,$0D,$40,$60       /// PREFETCH    [EAX+96]
  dec   edx
  jnz   @@3DNowLOOP
  ret

@@FPU:
  mov   ecx, eax
@@FPULoop:
  FLD   DWORD PTR [ECX]
  FMUL  ST, ST
  FLD   DWORD PTR [ECX+4]
  FMUL  ST, ST
  FADD
  FLD   DWORD PTR [ECX+8]
  FMUL  ST, ST
  FADD
  FLDZ
  FCOMP
  FNSTSW AX
  sahf
  jz @@result
  FSQRT
  FLD1
  FDIVR
@@result:
  FLD   ST
  FMUL  DWORD PTR [ECX]
  FSTP  DWORD PTR [ECX]
  FLD   ST
  FMUL  DWORD PTR [ECX+4]
  FSTP  DWORD PTR [ECX+4]
  FMUL  DWORD PTR [ECX+8]
  FSTP  DWORD PTR [ECX+8]
  ADD   ECX, 12
  DEC   EDX
  JNZ   @@FPULOOP
@@End:
end;
{$ELSE}
procedure NormalizeVectorArray(list: PAffineVectorArray; n: Integer);
var
  i: Integer;
begin
  for i := 0 to n - 1 do
    NormalizeVector(list^[i]);
end;
{$ENDIF}

// NormalizeVector (hmg)
//
{$IFDEF GLS_ASM}
procedure NormalizeVector(var V: TVector);
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// movq        mm0,[eax]
  db $0F,$6E,$48,$08       /// movd        mm1,[eax+8]
  db $0F,$6F,$E0           /// movq        mm4,mm0
  db $0F,$6F,$D9           /// movq        mm3,mm1
  db $0F,$0F,$C0,$B4       /// pfmul       mm0,mm0
  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C0,$AE       /// pfacc       mm0,mm0
  db $0F,$0F,$C1,$9E       /// pfadd       mm0,mm1
  db $0F,$0F,$C8,$97       /// pfrsqrt     mm1,mm0
  db $0F,$6F,$D1           /// movq        mm2,mm1

  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C8,$A7       /// pfrsqit1    mm1,mm0
  db $0F,$0F,$CA,$B6       /// pfrcpit2    mm1,mm2
  db $0F,$62,$C9           /// punpckldq   mm1,mm1
  db $0F,$0F,$D9,$B4       /// pfmul       mm3,mm1
  db $0F,$0F,$E1,$B4       /// pfmul       mm4,mm1
  db $0F,$7E,$58,$08       /// movd        [eax+8],mm3
  db $0F,$7F,$20           /// movq        [eax],mm4
@@norm_end:
  db $0F,$0E               /// femms
  xor   edx, edx
  mov   [eax+12], edx
  ret

@@FPU:
  mov   ecx, eax
  FLD  DWORD PTR [ECX]
  FMUL ST, ST
  FLD  DWORD PTR [ECX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [ECX+8]
  FMUL ST, ST
  FADD
  FLDZ
  FCOMP
  FNSTSW AX
  sahf
  jz @@result
  FSQRT
  FLD1
  FDIVR
@@result:
  FLD  ST
  FMUL DWORD PTR [ECX]
  FSTP DWORD PTR [ECX]
  FLD  ST
  FMUL DWORD PTR [ECX+4]
  FSTP DWORD PTR [ECX+4]
  FMUL DWORD PTR [ECX+8]
  FSTP DWORD PTR [ECX+8]
  xor   edx, edx
  mov   [ecx+12], edx
end;
{$ELSE}
procedure NormalizeVector(var V: TVector);
var
  invLen: Single;
  vn: Single;
begin
  vn := VectorNorm(V);
  if vn > 0 then
  begin
    invLen := RSqrt(vn);
    V.X := V.X * invLen;
    V.Y := V.Y * invLen;
    V.Z := V.Z * invLen;
  end;
  V.W := 0;
end;
{$ENDIF}

// VectorNormalize (hmg, func)
//
{$IFDEF GLS_ASM}
function VectorNormalize(const V: TVector): TVector;
asm
  test vSIMD, 1
  jz @@FPU
@@3DNow:
  db $0F,$6F,$00           /// movq        mm0,[eax]
  db $0F,$6E,$48,$08       /// movd        mm1,[eax+8]
  db $0F,$6F,$E0           /// movq        mm4,mm0
  db $0F,$6F,$D9           /// movq        mm3,mm1
  db $0F,$0F,$C0,$B4       /// pfmul       mm0,mm0
  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C0,$AE       /// pfacc       mm0,mm0
  db $0F,$0F,$C1,$9E       /// pfadd       mm0,mm1
  db $0F,$0F,$C8,$97       /// pfrsqrt     mm1,mm0
  db $0F,$6F,$D1           /// movq        mm2,mm1

  db $0F,$0F,$C9,$B4       /// pfmul       mm1,mm1
  db $0F,$0F,$C8,$A7       /// pfrsqit1    mm1,mm0
  db $0F,$0F,$CA,$B6       /// pfrcpit2    mm1,mm2
  db $0F,$62,$C9           /// punpckldq   mm1,mm1
  db $0F,$0F,$D9,$B4       /// pfmul       mm3,mm1
  db $0F,$0F,$E1,$B4       /// pfmul       mm4,mm1
  db $0F,$7E,$5A,$08       /// movd        [edx+8],mm3
  db $0F,$7F,$22           /// movq        [edx],mm4
@@norm_end:
  db $0F,$0E               /// femms
  xor   eax, eax
  mov   [edx+12], eax
  ret

@@FPU:
  mov	ecx, eax
  FLD  DWORD PTR [ECX]
  FMUL ST, ST
  FLD  DWORD PTR [ECX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [ECX+8]
  FMUL ST, ST
  FADD
  FLDZ
  FCOMP
  FNSTSW AX
  sahf
  jz @@result
  FSQRT
  FLD1
  FDIVR
@@result:
  FLD  ST
  FMUL DWORD PTR [ECX]
  FSTP DWORD PTR [EDX]
  FLD  ST
  FMUL DWORD PTR [ECX+4]
  FSTP DWORD PTR [EDX+4]
  FMUL DWORD PTR [ECX+8]
  FSTP DWORD PTR [EDX+8]
  xor   ecx, ecx
  mov   [edx+12], ecx
end;
{$ELSE}
function VectorNormalize(const V: TVector): TVector;
var
  invLen: Single;
  vn: Single;
begin
  vn := VectorNorm(V);
  if vn = 0 then
    SetVector(result, V)
  else
  begin
    invLen := RSqrt(vn);
    result.X := V.X * invLen;
    result.Y := V.Y * invLen;
    result.Z := V.Z * invLen;
  end;
  result.W := 0;
end;
{$ENDIF}

// VectorAngleCosine
//
{$IFDEF GLS_ASM}
function VectorAngleCosine(const V1, V2: TAffineVector): Single;
// EAX contains address of Vector1
// EDX contains address of Vector2
asm
  FLD DWORD PTR [EAX]           // V1[0]
  FLD ST                        // double V1[0]
  FMUL ST, ST                   // V1[0]^2 (prep. for divisor)
  FLD DWORD PTR [EDX]           // V2[0]
  FMUL ST(2), ST                // ST(2):=V1[0] * V2[0]
  FMUL ST, ST                   // V2[0]^2 (prep. for divisor)
  FLD DWORD PTR [EAX + 4]       // V1[1]
  FLD ST                        // double V1[1]
  FMUL ST, ST                   // ST(0):=V1[1]^2
  FADDP ST(3), ST               // ST(2):=V1[0]^2 + V1[1] *  * 2
  FLD DWORD PTR [EDX + 4]       // V2[1]
  FMUL ST(1), ST                // ST(1):=V1[1] * V2[1]
  FMUL ST, ST                   // ST(0):=V2[1]^2
  FADDP ST(2), ST               // ST(1):=V2[0]^2 + V2[1]^2
  FADDP ST(3), ST               // ST(2):=V1[0] * V2[0] + V1[1] * V2[1]
  FLD DWORD PTR [EAX + 8]       // load V2[1]
  FLD ST                        // same calcs go here
  FMUL ST, ST                   // (compare above)
  FADDP ST(3), ST
  FLD DWORD PTR [EDX + 8]
  FMUL ST(1), ST
  FMUL ST, ST
  FADDP ST(2), ST
  FADDP ST(3), ST
  FMULP                         // ST(0):=(V1[0]^2 + V1[1]^2 + V1[2]) *
  // (V2[0]^2 + V2[1]^2 + V2[2])
  FSQRT                         // sqrt(ST(0))
  FDIVP                         // ST(0):=Result:=ST(1) / ST(0)
  // the result is expected in ST(0), if it's invalid, an error is raised
end;
{$ELSE}
function VectorAngleCosine(const V1, V2: TAffineVector): Single;
begin
  result := VectorDotProduct(V1, V2) / (VectorLength(V1) * VectorLength(V2));
end;
{$ENDIF}

// VectorAngleCosine
//
{$IFDEF GLS_ASM}
function VectorAngleCosine(const V1, V2: TVector): Single;
// EAX contains address of Vector1
// EDX contains address of Vector2
asm
  FLD DWORD PTR [EAX]           // V1[0]
  FLD ST                        // double V1[0]
  FMUL ST, ST                   // V1[0]^2 (prep. for divisor)
  FLD DWORD PTR [EDX]           // V2[0]
  FMUL ST(2), ST                // ST(2):=V1[0] * V2[0]
  FMUL ST, ST                   // V2[0]^2 (prep. for divisor)
  FLD DWORD PTR [EAX + 4]       // V1[1]
  FLD ST                        // double V1[1]
  FMUL ST, ST                   // ST(0):=V1[1]^2
  FADDP ST(3), ST               // ST(2):=V1[0]^2 + V1[1] *  * 2
  FLD DWORD PTR [EDX + 4]       // V2[1]
  FMUL ST(1), ST                // ST(1):=V1[1] * V2[1]
  FMUL ST, ST                   // ST(0):=V2[1]^2
  FADDP ST(2), ST               // ST(1):=V2[0]^2 + V2[1]^2
  FADDP ST(3), ST               // ST(2):=V1[0] * V2[0] + V1[1] * V2[1]
  FLD DWORD PTR [EAX + 8]       // load V2[1]
  FLD ST                        // same calcs go here
  FMUL ST, ST                   // (compare above)
  FADDP ST(3), ST
  FLD DWORD PTR [EDX + 8]
  FMUL ST(1), ST
  FMUL ST, ST
  FADDP ST(2), ST
  FADDP ST(3), ST
  FMULP                         // ST(0):=(V1[0]^2 + V1[1]^2 + V1[2]) *
  // (V2[0]^2 + V2[1]^2 + V2[2])
  FSQRT                         // sqrt(ST(0))
  FDIVP                         // ST(0):=Result:=ST(1) / ST(0)
  // the result is expected in ST(0), if it's invalid, an error is raised
end;
{$ELSE}
function VectorAngleCosine(const V1, V2: TVector): Single;
begin
  result := VectorDotProduct(V1, V2) / (VectorLength(V1) * VectorLength(V2));
end;
{$ENDIF}

// VectorNegate (affine)
//
{$IFDEF GLS_ASM}
function VectorNegate(const Vector: TAffineVector): TAffineVector;
// EAX contains address of v
// EDX contains address of Result
asm
  FLD DWORD PTR [EAX]
  FCHS
  FSTP DWORD PTR [EDX]
  FLD DWORD PTR [EAX+4]
  FCHS
  FSTP DWORD PTR [EDX+4]
  FLD DWORD PTR [EAX+8]
  FCHS
  FSTP DWORD PTR [EDX+8]
end;
{$ELSE}
function VectorNegate(const Vector: TAffineVector): TAffineVector;
begin
  result.X := -Vector.X;
  result.Y := -Vector.Y;
  result.Z := -Vector.Z;
end;
{$ENDIF}

// VectorNegate (hmg)
//
{$IFDEF GLS_ASM}
function VectorNegate(const Vector: TVector): TVector;
// EAX contains address of v
// EDX contains address of Result
asm
  FLD DWORD PTR [EAX]
  FCHS
  FSTP DWORD PTR [EDX]
  FLD DWORD PTR [EAX+4]
  FCHS
  FSTP DWORD PTR [EDX+4]
  FLD DWORD PTR [EAX+8]
  FCHS
  FSTP DWORD PTR [EDX+8]
  FLD DWORD PTR [EAX+12]
  FCHS
  FSTP DWORD PTR [EDX+12]
end;
{$ELSE}
function VectorNegate(const Vector: TVector): TVector;
begin
  result.X := -Vector.X;
  result.Y := -Vector.Y;
  result.Z := -Vector.Z;
  result.W := -Vector.W;
end;
{$ENDIF}

// NegateVector
//
{$IFDEF GLS_ASM}
procedure NegateVector(var V: TAffineVector);
// EAX contains address of v
asm
  FLD DWORD PTR [EAX]
  FCHS
  FSTP DWORD PTR [EAX]
  FLD DWORD PTR [EAX+4]
  FCHS
  FSTP DWORD PTR [EAX+4]
  FLD DWORD PTR [EAX+8]
  FCHS
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure NegateVector(var V: TAffineVector);
begin
  V.X := -V.X;
  V.Y := -V.Y;
  V.Z := -V.Z;
end;
{$ENDIF}

// NegateVector
//
{$IFDEF GLS_ASM}
procedure NegateVector(var V: TVector);
// EAX contains address of v
asm
  FLD DWORD PTR [EAX]
  FCHS
  FSTP DWORD PTR [EAX]
  FLD DWORD PTR [EAX+4]
  FCHS
  FSTP DWORD PTR [EAX+4]
  FLD DWORD PTR [EAX+8]
  FCHS
  FSTP DWORD PTR [EAX+8]
  FLD DWORD PTR [EAX+12]
  FCHS
  FSTP DWORD PTR [EAX+12]
end;
{$ELSE}
procedure NegateVector(var V: TVector);
begin
  V.X := -V.X;
  V.Y := -V.Y;
  V.Z := -V.Z;
  V.W := -V.W;
end;
{$ENDIF}

// NegateVector
//
{$IFDEF GLS_ASM}
procedure NegateVector(var V: array of Single);
// EAX contains address of V
// EDX contains highest index in V
asm
@@Loop:
  FLD DWORD PTR [EAX + 4 * EDX]
  FCHS
  WAIT
  FSTP DWORD PTR [EAX + 4 * EDX]
  DEC EDX
  JNS @@Loop
end;
{$ELSE}
procedure NegateVector(var V: array of Single);
var
  i: Integer;
begin
  for i := Low(V) to High(V) do
    V[i] := -V[i];
end;
{$ENDIF}

// ScaleVector (2f)
//
{$IFDEF GLS_ASM}
procedure ScaleVector(var V: TVector2f; factor: Single);
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EAX+4]
end;
{$ELSE}
procedure ScaleVector(var V: TVector2f; factor: Single);
begin
  V.X := V.X * factor;
  V.Y := V.Y * factor;
end;
{$ENDIF}

// ScaleVector (affine)
//
{$IFDEF GLS_ASM}
procedure ScaleVector(var V: TAffineVector; factor: Single);
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EAX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EAX+4]
  FLD  DWORD PTR [EAX+8]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EAX+8]
end;
{$ELSE}
procedure ScaleVector(var V: TAffineVector; factor: Single);
begin
  V.X := V.X * factor;
  V.Y := V.Y * factor;
  V.Z := V.Z * factor;
end;
{$ENDIF}

// ScaleVector (hmg)
//
procedure ScaleVector(var V: TVector; factor: Single);
begin
  V.X := V.X * factor;
  V.Y := V.Y * factor;
  V.Z := V.Z * factor;
  V.W := V.W * factor;
end;

// ScaleVector (affine vector)
//
procedure ScaleVector(var V: TAffineVector; const factor: TAffineVector);
begin
  V.X := V.X * factor.X;
  V.Y := V.Y * factor.Y;
  V.Z := V.Z * factor.Z;
end;

// ScaleVector (hmg vector)
//
procedure ScaleVector(var V: TVector; const factor: TVector);
begin
  V.X := V.X * factor.X;
  V.Y := V.Y * factor.Y;
  V.Z := V.Z * factor.Z;
  V.W := V.W * factor.W;
end;

// VectorScale (2f)
//
{$IFDEF GLS_ASM}
function VectorScale(const V: TVector2f; factor: Single): TVector2f;
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+4]
end;
{$ELSE}
function VectorScale(const V: TVector2f; factor: Single): TVector2f;
begin
  result.X := V.X * factor;
  result.Y := V.Y * factor;
end;
{$ENDIF}
// VectorScale (affine)
//
{$IFDEF GLS_ASM}
function VectorScale(const V: TAffineVector; factor: Single): TAffineVector;
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+4]
  FLD  DWORD PTR [EAX+8]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+8]
end;
  {$ELSE}
function VectorScale(const V: TAffineVector; factor: Single): TAffineVector;
begin
  result.X := V.X * factor;
  result.Y := V.Y * factor;
  result.Z := V.Z * factor;
end;
{$ENDIF}

// VectorScale (proc, affine)
//
{$IFDEF GLS_ASM}
procedure VectorScale(const V: TAffineVector; factor: Single;
  var vr: TAffineVector);
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+4]
  FLD  DWORD PTR [EAX+8]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+8]
end;
{$ELSE}
procedure VectorScale(const V: TAffineVector; factor: Single;
  var vr: TAffineVector);
begin
  vr.X := V.X * factor;
  vr.Y := V.Y * factor;
  vr.Z := V.Z * factor;
end;
{$ENDIF}

// VectorScale (hmg)
//
{$IFDEF GLS_ASM}
function VectorScale(const V: TVector; factor: Single): TVector;
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+4]
  FLD  DWORD PTR [EAX+8]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+8]
  FLD  DWORD PTR [EAX+12]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+12]
end;
{$ELSE}
function VectorScale(const V: TVector; factor: Single): TVector;
begin
  result.X := V.X * factor;
  result.Y := V.Y * factor;
  result.Z := V.Z * factor;
  result.W := V.W * factor;
end;
{$ENDIF}

// VectorScale (proc, hmg)
//
{$IFDEF GLS_ASM}
procedure VectorScale(const V: TVector; factor: Single; var vr: TVector);
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+4]
  FLD  DWORD PTR [EAX+8]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+8]
  FLD  DWORD PTR [EAX+12]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+12]
end;
{$ELSE}
procedure VectorScale(const V: TVector; factor: Single; var vr: TVector);
begin
  vr.X := V.X * factor;
  vr.Y := V.Y * factor;
  vr.Z := V.Z * factor;
  vr.W := V.W * factor;
end;
{$ENDIF}

// VectorScale (proc, hmg-affine)
//
{$IFDEF GLS_ASM}
procedure VectorScale(const V: TVector; factor: Single; var vr: TAffineVector);
asm
  FLD  DWORD PTR [EAX]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX]
  FLD  DWORD PTR [EAX+4]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+4]
  FLD  DWORD PTR [EAX+8]
  FMUL DWORD PTR [EBP+8]
  FSTP DWORD PTR [EDX+8]
end;
{$ELSE}
procedure VectorScale(const V: TVector; factor: Single; var vr: TAffineVector);
begin
  vr.X := V.X * factor;
  vr.Y := V.Y * factor;
  vr.Z := V.Z * factor;
end;
{$ENDIF}

// VectorScale (func, affine)
//
function VectorScale(const V: TAffineVector; const factor: TAffineVector)
  : TAffineVector;
begin
  result.X := V.X * factor.X;
  result.Y := V.Y * factor.Y;
  result.Z := V.Z * factor.Z;
end;

// VectorScale (func, hmg)
//
function VectorScale(const V: TVector; const factor: TVector): TVector;
begin
  result.X := V.X * factor.X;
  result.Y := V.Y * factor.Y;
  result.Z := V.Z * factor.Z;
  result.W := V.W * factor.W;
end;

// DivideVector
//
procedure DivideVector(var V: TVector; const divider: TVector);
begin
  V.X := V.X / divider.X;
  V.Y := V.Y / divider.Y;
  V.Z := V.Z / divider.Z;
  V.W := V.W / divider.W;
end;

// DivideVector
//
procedure DivideVector(var V: TAffineVector;
  const divider: TAffineVector); overload;
begin
  V.X := V.X / divider.X;
  V.Y := V.Y / divider.Y;
  V.Z := V.Z / divider.Z;
end;

// VectorDivide
//
function VectorDivide(const V: TVector; const divider: TVector)
  : TVector; overload;
begin
  result.X := V.X / divider.X;
  result.Y := V.Y / divider.Y;
  result.Z := V.Z / divider.Z;
  result.W := V.W / divider.W;
end;

// VectorDivide
//
function VectorDivide(const V: TAffineVector; const divider: TAffineVector)
  : TAffineVector; overload;
begin
  result.X := V.X / divider.X;
  result.Y := V.Y / divider.Y;
  result.Z := V.Z / divider.Z;
end;

// TexpointEquals
//
function TexpointEquals(const p1, p2: TTexPoint): Boolean;
begin
  result := (p1.S = p2.S) and (p1.T = p2.T);
end;

// RectEquals
//
function RectEquals(const Rect1, Rect2: TRect): Boolean;
begin
  result := (Rect1.Left = Rect2.Left) and (Rect1.Right = Rect2.Right) and
    (Rect1.Top = Rect2.Top) and (Rect1.Bottom = Rect2.Left);
end;

// VectorEquals (hmg vector)
//
{$IFDEF GLS_ASM}
function VectorEquals(const V1, V2: TVector): Boolean;
// EAX contains address of v1
// EDX contains highest of v2
asm
  mov ecx, [edx]
  cmp ecx, [eax]
  jne @@Diff
  mov ecx, [edx+$4]
  cmp ecx, [eax+$4]
  jne @@Diff
  mov ecx, [edx+$8]
  cmp ecx, [eax+$8]
  jne @@Diff
  mov ecx, [edx+$C]
  cmp ecx, [eax+$C]
  jne @@Diff
@@Equal:
  mov eax, 1
  ret
@@Diff:
  xor eax, eax
end;
{$ELSE}
function VectorEquals(const V1, V2: TVector): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z)
    and (V1.W = V2.W);
end;
{$ENDIF}

// VectorEquals (affine vector)
//
{$IFDEF GLS_ASM}
function VectorEquals(const V1, V2: TAffineVector): Boolean;
// EAX contains address of v1
// EDX contains highest of v2
asm
  mov ecx, [edx]
  cmp ecx, [eax]
  jne @@Diff
  mov ecx, [edx+$4]
  cmp ecx, [eax+$4]
  jne @@Diff
  mov ecx, [edx+$8]
  cmp ecx, [eax+$8]
  jne @@Diff
@@Equal:
  mov al, 1
  ret
@@Diff:
  xor eax, eax
@@End:
end;
{$ELSE}
function VectorEquals(const V1, V2: TAffineVector): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z);
end;
{$ENDIF}

// AffineVectorEquals (hmg vector)
//
{$IFDEF GLS_ASM}
function AffineVectorEquals(const V1, V2: TVector): Boolean;
// EAX contains address of v1
// EDX contains highest of v2
asm
  mov ecx, [edx]
  cmp ecx, [eax]
  jne @@Diff
  mov ecx, [edx+$4]
  cmp ecx, [eax+$4]
  jne @@Diff
  mov ecx, [edx+$8]
  cmp ecx, [eax+$8]
  jne @@Diff
@@Equal:
  mov eax, 1
  ret
@@Diff:
  xor eax, eax
end;
{$ELSE}
function AffineVectorEquals(const V1, V2: TVector): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z);
end;
{$ENDIF}

// VectorIsNull (hmg)
//
function VectorIsNull(const V: TVector): Boolean;
begin
  result := ((V.X = 0) and (V.Y = 0) and (V.Z = 0));
end;

// VectorIsNull (affine)
//
function VectorIsNull(const V: TAffineVector): Boolean; overload;
begin
  result := ((V.X = 0) and (V.Y = 0) and (V.Z = 0));
end;

// VectorSpacing (texpoint)
//
{$IFDEF GLS_ASM}
function VectorSpacing(const V1, V2: TTexPoint): Single; overload;
// EAX contains address of v1
// EDX contains highest of v2
// Result  is passed on the stack
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FABS
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FABS
  FADD
end;
{$ELSE}
function VectorSpacing(const V1, V2: TTexPoint): Single; overload;
begin
  result := Abs(V2.S - V1.S) + Abs(V2.T - V1.T);
end;
{$ENDIF}

// VectorSpacing (affine)
//
{$IFDEF GLS_ASM}
function VectorSpacing(const V1, V2: TAffineVector): Single;
// EAX contains address of v1
// EDX contains highest of v2
// Result  is passed on the stack
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FABS
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FABS
  FADD
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FABS
  FADD
end;
{$ELSE}
function VectorSpacing(const V1, V2: TAffineVector): Single;
begin
  result := Abs(V2.X - V1.X) + Abs(V2.Y - V1.Y) +
    Abs(V2.Z - V1.Z);
end;
{$ENDIF}

// VectorSpacing (Hmg)
//
{$IFDEF GLS_ASM}
function VectorSpacing(const V1, V2: TVector): Single;
// EAX contains address of v1
// EDX contains highest of v2
// Result  is passed on the stack
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FABS
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FABS
  FADD
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FABS
  FADD
  FLD  DWORD PTR [EAX+12]
  FSUB DWORD PTR [EDX+12]
  FABS
  FADD
end;
{$ELSE}
function VectorSpacing(const V1, V2: TVector): Single;
begin
  result := Abs(V2.X - V1.X) + Abs(V2.Y - V1.Y) +
    Abs(V2.Z - V1.Z) + Abs(V2.W - V1.W);
end;
{$ENDIF}

// VectorDistance (affine)
//
{$IFDEF GLS_ASM}
function VectorDistance(const V1, V2: TAffineVector): Single;
// EAX contains address of v1
// EDX contains highest of v2
// Result  is passed on the stack
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FMUL ST, ST
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FMUL ST, ST
  FADD
  FSQRT
end;
{$ELSE}
function VectorDistance(const V1, V2: TAffineVector): Single;
begin
  result := Sqrt(Sqr(V2.X - V1.X) + Sqr(V2.Y - V1.Y) +
    Sqr(V2.Z - V1.Z));
end;
{$ENDIF}

// VectorDistance (hmg)
//
{$IFDEF GLS_ASM}
function VectorDistance(const V1, V2: TVector): Single;
// EAX contains address of v1
// EDX contains highest of v2
// Result  is passed on the stack
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FMUL ST, ST
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FMUL ST, ST
  FADD
  FSQRT
end;
{$ELSE}
function VectorDistance(const V1, V2: TVector): Single;
begin
  result := Sqrt(Sqr(V2.X - V1.X) + Sqr(V2.Y - V1.Y) +
    Sqr(V2.Z - V1.Z));
end;
{$ENDIF}

// VectorDistance2 (affine)
//
{$IFDEF GLS_ASM}
function VectorDistance2(const V1, V2: TAffineVector): Single;
// EAX contains address of v1
// EDX contains highest of v2
// Result is passed on the stack
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FMUL ST, ST
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FMUL ST, ST
  FADD
end;
{$ELSE}
function VectorDistance2(const V1, V2: TAffineVector): Single;
begin
  result := Sqr(V2.X - V1.X) + Sqr(V2.Y - V1.Y) +
    Sqr(V2.Z - V1.Z);
end;
{$ENDIF}

// VectorDistance2 (hmg)
//
{$IFDEF GLS_ASM}
function VectorDistance2(const V1, V2: TVector): Single;
// EAX contains address of v1
// EDX contains highest of v2
// Result is passed on the stack
asm
  FLD  DWORD PTR [EAX]
  FSUB DWORD PTR [EDX]
  FMUL ST, ST
  FLD  DWORD PTR [EAX+4]
  FSUB DWORD PTR [EDX+4]
  FMUL ST, ST
  FADD
  FLD  DWORD PTR [EAX+8]
  FSUB DWORD PTR [EDX+8]
  FMUL ST, ST
  FADD
end;
{$ELSE}
function VectorDistance2(const V1, V2: TVector): Single;
begin
  result := Sqr(V2.X - V1.X) + Sqr(V2.Y - V1.Y) +
    Sqr(V2.Z - V1.Z);
end;
{$ENDIF}

// VectorPerpendicular
//
function VectorPerpendicular(const V, n: TAffineVector): TAffineVector;
var
  dot: Single;
begin
  dot := VectorDotProduct(V, n);
  result.V[X] := V.V[X] - dot * n.V[X];
  result.V[Y] := V.V[Y] - dot * n.V[Y];
  result.V[Z] := V.V[Z] - dot * n.V[Z];
end;

// VectorReflect
//
function VectorReflect(const V, n: TAffineVector): TAffineVector;
begin
  result := VectorCombine(V, n, 1, -2 * VectorDotProduct(V, n));
end;

// RotateVector
//
procedure RotateVector(var Vector: TVector; const axis: TAffineVector;
  angle: Single);
var
  rotMatrix: TMatrix4f;
begin
  rotMatrix := CreateRotationMatrix(axis, angle);
  Vector := VectorTransform(Vector, rotMatrix);
end;

// RotateVector
//
procedure RotateVector(var Vector: TVector; const axis: TVector;
  angle: Single); overload;
var
  rotMatrix: TMatrix4f;
begin
  rotMatrix := CreateRotationMatrix(PAffineVector(@axis)^, angle);
  Vector := VectorTransform(Vector, rotMatrix);
end;

// RotateVectorAroundY
//
procedure RotateVectorAroundY(var V: TAffineVector; alpha: Single);
var
  c, S, v0: Single;
begin
  SinCosine(alpha, S, c);
  v0 := V.X;
  V.X := c * v0 + S * V.Z;
  V.Z := c * V.Z - S * v0;
end;

// VectorRotateAroundX (func)
//
function VectorRotateAroundX(const V: TAffineVector; alpha: Single)
  : TAffineVector;
var
  c, S: Single;
begin
  SinCosine(alpha, S, c);
  result.X := V.X;
  result.Y := c * V.Y + S * V.Z;
  result.Z := c * V.Z - S * V.Y;
end;

// VectorRotateAroundY (func)
//
function VectorRotateAroundY(const V: TAffineVector; alpha: Single)
  : TAffineVector;
var
  c, S: Single;
begin
  SinCosine(alpha, S, c);
  result.Y := V.Y;
  result.X := c * V.X + S * V.Z;
  result.Z := c * V.Z - S * V.X;
end;

// VectorRotateAroundY (proc)
//
procedure VectorRotateAroundY(const V: TAffineVector; alpha: Single;
  var vr: TAffineVector);
var
  c, S: Single;
begin
  SinCosine(alpha, S, c);
  vr.Y := V.Y;
  vr.X := c * V.X + S * V.Z;
  vr.Z := c * V.Z - S * V.X;
end;

// VectorRotateAroundZ (func)
//
function VectorRotateAroundZ(const V: TAffineVector; alpha: Single)
  : TAffineVector;
var
  c, S: Single;
begin
  SinCosine(alpha, S, c);
  result.X := c * V.X + S * V.Y;
  result.Y := c * V.Y - S * V.X;
  result.Z := V.Z;
end;

// AbsVector (hmg)
//
procedure AbsVector(var V: TVector);
begin
  V.X := Abs(V.X);
  V.Y := Abs(V.Y);
  V.Z := Abs(V.Z);
  V.W := Abs(V.W);
end;

// AbsVector (affine)
//
procedure AbsVector(var V: TAffineVector);
begin
  V.X := Abs(V.X);
  V.Y := Abs(V.Y);
  V.Z := Abs(V.Z);
end;

// VectorAbs (hmg)
//
function VectorAbs(const V: TVector): TVector;
begin
  result.X := Abs(V.X);
  result.Y := Abs(V.Y);
  result.Z := Abs(V.Z);
  result.W := Abs(V.W);
end;

// VectorAbs (affine)
//
function VectorAbs(const V: TAffineVector): TAffineVector;
begin
  result.X := Abs(V.X);
  result.Y := Abs(V.Y);
  result.Z := Abs(V.Z);
end;

// IsColinear (2f)
//
function IsColinear(const V1, V2: TVector2f): Boolean; overload;
var
  a, b, c: Single;
begin
  a := VectorDotProduct(V1, V1);
  b := VectorDotProduct(V1, V2);
  c := VectorDotProduct(V2, V2);
  result := (a * c - b * b) < cColinearBias;
end;

// IsColinear (affine)
//
function IsColinear(const V1, V2: TAffineVector): Boolean; overload;
var
  a, b, c: Single;
begin
  a := VectorDotProduct(V1, V1);
  b := VectorDotProduct(V1, V2);
  c := VectorDotProduct(V2, V2);
  result := (a * c - b * b) < cColinearBias;
end;

// IsColinear (hmg)
//
function IsColinear(const V1, V2: TVector): Boolean; overload;
var
  a, b, c: Single;
begin
  a := VectorDotProduct(V1, V1);
  b := VectorDotProduct(V1, V2);
  c := VectorDotProduct(V2, V2);
  result := (a * c - b * b) < cColinearBias;
end;

// SetMatrix (single->double)
//
procedure SetMatrix(var dest: THomogeneousDblMatrix; const src: TMatrix);
var
  i: Integer;
begin
  for i := X to W do
  begin
    dest.V[i].X := src.V[i].X;
    dest.V[i].Y := src.V[i].Y;
    dest.V[i].Z := src.V[i].Z;
    dest.V[i].W := src.V[i].W;
  end;
end;

// SetMatrix (hmg->affine)
//
procedure SetMatrix(var dest: TAffineMatrix; const src: TMatrix);
begin
  dest.X.X := src.X.X;
  dest.X.Y := src.X.Y;
  dest.X.Z := src.X.Z;
  dest.Y.X := src.Y.X;
  dest.Y.Y := src.Y.Y;
  dest.Y.Z := src.Y.Z;
  dest.Z.X := src.Z.X;
  dest.Z.Y := src.Z.Y;
  dest.Z.Z := src.Z.Z;
end;

// SetMatrix (affine->hmg)
//
procedure SetMatrix(var dest: TMatrix; const src: TAffineMatrix);
begin
  dest.X.X := src.X.X;
  dest.X.Y := src.X.Y;
  dest.X.Z := src.X.Z;
  dest.X.W := 0;
  dest.Y.X := src.Y.X;
  dest.Y.Y := src.Y.Y;
  dest.Y.Z := src.Y.Z;
  dest.Y.W := 0;
  dest.Z.X := src.Z.X;
  dest.Z.Y := src.Z.Y;
  dest.Z.Z := src.Z.Z;
  dest.Z.W := 0;
  dest.W.X := 0;
  dest.W.Y := 0;
  dest.W.Z := 0;
  dest.W.W := 1;
end;

// SetMatrixRow
//
procedure SetMatrixRow(var dest: TMatrix; rowNb: Integer; const aRow: TVector);
begin
  dest.X.V[rowNb] := aRow.X;
  dest.Y.V[rowNb] := aRow.Y;
  dest.Z.V[rowNb] := aRow.Z;
  dest.W.V[rowNb] := aRow.W;
end;

// CreateScaleMatrix (affine)
//
function CreateScaleMatrix(const V: TAffineVector): TMatrix;
begin
  result := IdentityHmgMatrix;
  result.X.X := V.V[X];
  result.Y.Y := V.V[Y];
  result.Z.Z := V.V[Z];
end;

// CreateScaleMatrix (Hmg)
//
function CreateScaleMatrix(const V: TVector): TMatrix;
begin
  result := IdentityHmgMatrix;
  result.X.X := V.V[X];
  result.Y.Y := V.V[Y];
  result.Z.Z := V.V[Z];
end;

// CreateTranslationMatrix (affine)
//
function CreateTranslationMatrix(const V: TAffineVector): TMatrix;
begin
  result := IdentityHmgMatrix;
  result.W.X := V.V[X];
  result.W.Y := V.V[Y];
  result.W.Z := V.V[Z];
end;

// CreateTranslationMatrix (hmg)
//
function CreateTranslationMatrix(const V: TVector): TMatrix;
begin
  result := IdentityHmgMatrix;
  result.W.X := V.V[X];
  result.W.Y := V.V[Y];
  result.W.Z := V.V[Z];
end;

// CreateScaleAndTranslationMatrix
//
function CreateScaleAndTranslationMatrix(const scale, offset: TVector): TMatrix;
begin
  result := IdentityHmgMatrix;
  result.X.X := scale.V[X];
  result.W.X := offset.V[X];
  result.Y.Y := scale.V[Y];
  result.W.Y := offset.V[Y];
  result.Z.Z := scale.V[Z];
  result.W.Z := offset.V[Z];
end;

// CreateRotationMatrixX
//
function CreateRotationMatrixX(const sine, cosine: Single): TMatrix;
begin
  result := EmptyHmgMatrix;
  result.X.X := 1;
  result.Y.Y := cosine;
  result.Y.Z := sine;
  result.Z.Y := -sine;
  result.Z.Z := cosine;
  result.W.W := 1;
end;

// CreateRotationMatrixX
//
function CreateRotationMatrixX(const angle: Single): TMatrix;
var
  S, c: Single;
begin
  SinCosine(angle, S, c);
  result := CreateRotationMatrixX(S, c);
end;

// CreateRotationMatrixY
//
function CreateRotationMatrixY(const sine, cosine: Single): TMatrix;
begin
  result := EmptyHmgMatrix;
  result.X.X := cosine;
  result.X.Z := -sine;
  result.Y.Y := 1;
  result.Z.X := sine;
  result.Z.Z := cosine;
  result.W.W := 1;
end;

// CreateRotationMatrixY
//
function CreateRotationMatrixY(const angle: Single): TMatrix;
var
  S, c: Single;
begin
  SinCosine(angle, S, c);
  result := CreateRotationMatrixY(S, c);
end;

// CreateRotationMatrixZ
//
function CreateRotationMatrixZ(const sine, cosine: Single): TMatrix;
begin
  result := EmptyHmgMatrix;
  result.X.X := cosine;
  result.X.Y := sine;
  result.Y.X := -sine;
  result.Y.Y := cosine;
  result.Z.Z := 1;
  result.W.W := 1;
end;

// CreateRotationMatrixZ
//
function CreateRotationMatrixZ(const angle: Single): TMatrix;
var
  S, c: Single;
begin
  SinCosine(angle, S, c);
  result := CreateRotationMatrixZ(S, c);
end;

// CreateRotationMatrix (affine)
//
function CreateRotationMatrix(const anAxis: TAffineVector;
  angle: Single): TMatrix;
var
  axis: TAffineVector;
  cosine, sine, one_minus_cosine: Single;
begin
  SinCosine(angle, sine, cosine);
  one_minus_cosine := 1 - cosine;
  axis := VectorNormalize(anAxis);

  result.X.X := (one_minus_cosine * axis.X * axis.X) + cosine;
  result.X.Y := (one_minus_cosine * axis.X * axis.Y) - (axis.Z * sine);
  result.X.Z := (one_minus_cosine * axis.Z * axis.X) + (axis.Y * sine);
  result.X.W := 0;

  result.Y.X := (one_minus_cosine * axis.X * axis.Y) + (axis.Z * sine);
  result.Y.Y := (one_minus_cosine * axis.Y * axis.Y) + cosine;
  result.Y.Z := (one_minus_cosine * axis.Y * axis.Z) - (axis.X * sine);
  result.Y.W := 0;

  result.Z.X := (one_minus_cosine * axis.Z * axis.X) - (axis.Y * sine);
  result.Z.Y := (one_minus_cosine * axis.Y * axis.Z) + (axis.X * sine);
  result.Z.Z := (one_minus_cosine * axis.Z * axis.Z) + cosine;
  result.Z.W := 0;

  result.W.X := 0;
  result.W.Y := 0;
  result.W.Z := 0;
  result.W.W := 1;
end;

// CreateRotationMatrix (hmg)
//
function CreateRotationMatrix(const anAxis: TVector; angle: Single): TMatrix;
begin
  result := CreateRotationMatrix(PAffineVector(@anAxis)^, angle);
end;

// CreateAffineRotationMatrix
//
function CreateAffineRotationMatrix(const anAxis: TAffineVector; angle: Single)
  : TAffineMatrix;
var
  axis: TAffineVector;
  cosine, sine, one_minus_cosine: Single;
begin
  SinCosine(angle, sine, cosine);
  one_minus_cosine := 1 - cosine;
  axis := VectorNormalize(anAxis);

  result.X.X := (one_minus_cosine * Sqr(axis.X)) + cosine;
  result.X.Y := (one_minus_cosine * axis.X * axis.Y) - (axis.Z * sine);
  result.X.Z := (one_minus_cosine * axis.Z * axis.X) + (axis.Y * sine);

  result.Y.X := (one_minus_cosine * axis.X * axis.Y) + (axis.Z * sine);
  result.Y.Y := (one_minus_cosine * Sqr(axis.Y)) + cosine;
  result.Y.Z := (one_minus_cosine * axis.Y * axis.Z) - (axis.X * sine);

  result.Z.X := (one_minus_cosine * axis.Z * axis.X) - (axis.Y * sine);
  result.Z.Y := (one_minus_cosine * axis.Y * axis.Z) + (axis.X * sine);
  result.Z.Z := (one_minus_cosine * Sqr(axis.Z)) + cosine;
end;

// MatrixMultiply (3x3 func)
//
function MatrixMultiply(const m1, m2: TAffineMatrix): TAffineMatrix;
begin
  result.X.X := m1.X.X * m2.X.X + m1.X.Y * m2.Y.X + m1.X.Z * m2.Z.X;
  result.X.Y := m1.X.X * m2.X.Y + m1.X.Y * m2.Y.Y + m1.X.Z * m2.Z.Y;
  result.X.Z := m1.X.X * m2.X.Z + m1.X.Y * m2.Y.Z + m1.X.Z * m2.Z.Z;
  result.Y.X := m1.Y.X * m2.X.X + m1.Y.Y * m2.Y.X + m1.Y.Z * m2.Z.X;
  result.Y.Y := m1.Y.X * m2.X.Y + m1.Y.Y * m2.Y.Y + m1.Y.Z * m2.Z.Y;
  result.Y.Z := m1.Y.X * m2.X.Z + m1.Y.Y * m2.Y.Z + m1.Y.Z * m2.Z.Z;
  result.Z.X := m1.Z.X * m2.X.X + m1.Z.Y * m2.Y.X + m1.Z.Z * m2.Z.X;
  result.Z.Y := m1.Z.X * m2.X.Y + m1.Z.Y * m2.Y.Y + m1.Z.Z * m2.Z.Y;
  result.Z.Z := m1.Z.X * m2.X.Z + m1.Z.Y * m2.Y.Z + m1.Z.Z * m2.Z.Z;
end;

// MatrixMultiply (4x4, func)
//
function MatrixMultiply(const m1, m2: TMatrix): TMatrix;
begin
  result.X.X := m1.X.X * m2.X.X + m1.X.Y * m2.Y.X + m1.X.Z * m2.Z.X +
    m1.X.W * m2.W.X;
  result.X.Y := m1.X.X * m2.X.Y + m1.X.Y * m2.Y.Y + m1.X.Z * m2.Z.Y +
    m1.X.W * m2.W.Y;
  result.X.Z := m1.X.X * m2.X.Z + m1.X.Y * m2.Y.Z + m1.X.Z * m2.Z.Z +
    m1.X.W * m2.W.Z;
  result.X.W := m1.X.X * m2.X.W + m1.X.Y * m2.Y.W + m1.X.Z * m2.Z.W +
    m1.X.W * m2.W.W;
  result.Y.X := m1.Y.X * m2.X.X + m1.Y.Y * m2.Y.X + m1.Y.Z * m2.Z.X +
    m1.Y.W * m2.W.X;
  result.Y.Y := m1.Y.X * m2.X.Y + m1.Y.Y * m2.Y.Y + m1.Y.Z * m2.Z.Y +
    m1.Y.W * m2.W.Y;
  result.Y.Z := m1.Y.X * m2.X.Z + m1.Y.Y * m2.Y.Z + m1.Y.Z * m2.Z.Z +
    m1.Y.W * m2.W.Z;
  result.Y.W := m1.Y.X * m2.X.W + m1.Y.Y * m2.Y.W + m1.Y.Z * m2.Z.W +
    m1.Y.W * m2.W.W;
  result.Z.X := m1.Z.X * m2.X.X + m1.Z.Y * m2.Y.X + m1.Z.Z * m2.Z.X +
    m1.Z.W * m2.W.X;
  result.Z.Y := m1.Z.X * m2.X.Y + m1.Z.Y * m2.Y.Y + m1.Z.Z * m2.Z.Y +
    m1.Z.W * m2.W.Y;
  result.Z.Z := m1.Z.X * m2.X.Z + m1.Z.Y * m2.Y.Z + m1.Z.Z * m2.Z.Z +
    m1.Z.W * m2.W.Z;
  result.Z.W := m1.Z.X * m2.X.W + m1.Z.Y * m2.Y.W + m1.Z.Z * m2.Z.W +
    m1.Z.W * m2.W.W;
  result.W.X := m1.W.X * m2.X.X + m1.W.Y * m2.Y.X + m1.W.Z * m2.Z.X +
    m1.W.W * m2.W.X;
  result.W.Y := m1.W.X * m2.X.Y + m1.W.Y * m2.Y.Y + m1.W.Z * m2.Z.Y +
    m1.W.W * m2.W.Y;
  result.W.Z := m1.W.X * m2.X.Z + m1.W.Y * m2.Y.Z + m1.W.Z * m2.Z.Z +
    m1.W.W * m2.W.Z;
  result.W.W := m1.W.X * m2.X.W + m1.W.Y * m2.Y.W + m1.W.Z * m2.Z.W +
    m1.W.W * m2.W.W;
end;

// MatrixMultiply (4x4, proc)
//
procedure MatrixMultiply(const m1, m2: TMatrix; var MResult: TMatrix);
begin
  MResult := MatrixMultiply(m1, m2);
end;

// VectorTransform
//
function VectorTransform(const V: TVector; const M: TMatrix): TVector;
begin
    result.V[X] := V.V[X] * M.X.X + V.V[Y] * M.Y.X + V.V[Z] * M.Z.X +
      V.V[W] * M.W.X;
    result.V[Y] := V.V[X] * M.X.Y + V.V[Y] * M.Y.Y + V.V[Z] * M.Z.Y +
      V.V[W] * M.W.Y;
    result.V[Z] := V.V[X] * M.X.Z + V.V[Y] * M.Y.Z + V.V[Z] * M.Z.Z +
      V.V[W] * M.W.Z;
    result.V[W] := V.V[X] * M.X.W + V.V[Y] * M.Y.W + V.V[Z] * M.Z.W +
      V.V[W] * M.W.W;
end;

// VectorTransform
//
function VectorTransform(const V: TVector; const M: TAffineMatrix): TVector;
begin
  result.V[X] := V.V[X] * M.X.X + V.V[Y] * M.Y.X + V.V[Z] * M.Z.X;
  result.V[Y] := V.V[X] * M.X.Y + V.V[Y] * M.Y.Y + V.V[Z] * M.Z.Y;
  result.V[Z] := V.V[X] * M.X.Z + V.V[Y] * M.Y.Z + V.V[Z] * M.Z.Z;
  result.V[W] := V.V[W];
end;

// VectorTransform
//
function VectorTransform(const V: TAffineVector; const M: TMatrix)
  : TAffineVector;
begin
  result.V[X] := V.V[X] * M.X.X + V.V[Y] * M.Y.X + V.V[Z] * M.Z.X + M.W.X;
  result.V[Y] := V.V[X] * M.X.Y + V.V[Y] * M.Y.Y + V.V[Z] * M.Z.Y + M.W.Y;
  result.V[Z] := V.V[X] * M.X.Z + V.V[Y] * M.Y.Z + V.V[Z] * M.Z.Z + M.W.Z;
end;

// VectorTransform
//
function VectorTransform(const V: TAffineVector; const M: TAffineMatrix)
  : TAffineVector;
begin
  result.V[X] := V.V[X] * M.X.X + V.V[Y] * M.Y.X + V.V[Z] * M.Z.X;
  result.V[Y] := V.V[X] * M.X.Y + V.V[Y] * M.Y.Y + V.V[Z] * M.Z.Y;
  result.V[Z] := V.V[X] * M.X.Z + V.V[Y] * M.Y.Z + V.V[Z] * M.Z.Z;
end;

// MatrixDeterminant (affine)
//
function MatrixDeterminant(const M: TAffineMatrix): Single;
begin
  result := M.X.X * (M.Y.Y * M.Z.Z - M.Z.Y * M.Y.Z) - M.X.Y *
    (M.Y.X * M.Z.Z - M.Z.X * M.Y.Z) + M.X.Z * (M.Y.X * M.Z.Y - M.Z.X * M.Y.Y);
end;

// MatrixDetInternal
//
function MatrixDetInternal(const a1, a2, a3, b1, b2, b3, c1, c2,
  c3: Single): Single;
// internal version for the determinant of a 3x3 matrix
begin
  result := a1 * (b2 * c3 - b3 * c2) - b1 * (a2 * c3 - a3 * c2) + c1 *
    (a2 * b3 - a3 * b2);
end;

// MatrixDeterminant (hmg)
//
function MatrixDeterminant(const M: TMatrix): Single;
begin
  result := M.X.X * MatrixDetInternal(M.Y.Y, M.Z.Y, M.W.Y, M.Y.Z, M.Z.Z, M.W.Z,
    M.Y.W, M.Z.W, M.W.W) - M.X.Y * MatrixDetInternal(M.Y.X, M.Z.X, M.W.X, M.Y.Z,
    M.Z.Z, M.W.Z, M.Y.W, M.Z.W, M.W.W) + M.X.Z * MatrixDetInternal(M.Y.X, M.Z.X,
    M.W.X, M.Y.Y, M.Z.Y, M.W.Y, M.Y.W, M.Z.W, M.W.W) - M.X.W *
    MatrixDetInternal(M.Y.X, M.Z.X, M.W.X, M.Y.Y, M.Z.Y, M.W.Y, M.Y.Z,
    M.Z.Z, M.W.Z);
end;

// AdjointMatrix
//
procedure AdjointMatrix(var M: TMatrix);
var
  a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, d1, d2, d3, d4: Single;
begin
  a1 := M.X.X;
  b1 := M.X.Y;
  c1 := M.X.Z;
  d1 := M.X.W;
  a2 := M.Y.X;
  b2 := M.Y.Y;
  c2 := M.Y.Z;
  d2 := M.Y.W;
  a3 := M.Z.X;
  b3 := M.Z.Y;
  c3 := M.Z.Z;
  d3 := M.Z.W;
  a4 := M.W.X;
  b4 := M.W.Y;
  c4 := M.W.Z;
  d4 := M.W.W;

  // row column labeling reversed since we transpose rows & columns
  M.X.X := MatrixDetInternal(b2, b3, b4, c2, c3, c4, d2, d3, d4);
  M.Y.X := -MatrixDetInternal(a2, a3, a4, c2, c3, c4, d2, d3, d4);
  M.Z.X := MatrixDetInternal(a2, a3, a4, b2, b3, b4, d2, d3, d4);
  M.W.X := -MatrixDetInternal(a2, a3, a4, b2, b3, b4, c2, c3, c4);

  M.X.Y := -MatrixDetInternal(b1, b3, b4, c1, c3, c4, d1, d3, d4);
  M.Y.Y := MatrixDetInternal(a1, a3, a4, c1, c3, c4, d1, d3, d4);
  M.Z.Y := -MatrixDetInternal(a1, a3, a4, b1, b3, b4, d1, d3, d4);
  M.W.Y := MatrixDetInternal(a1, a3, a4, b1, b3, b4, c1, c3, c4);

  M.X.Z := MatrixDetInternal(b1, b2, b4, c1, c2, c4, d1, d2, d4);
  M.Y.Z := -MatrixDetInternal(a1, a2, a4, c1, c2, c4, d1, d2, d4);
  M.Z.Z := MatrixDetInternal(a1, a2, a4, b1, b2, b4, d1, d2, d4);
  M.W.Z := -MatrixDetInternal(a1, a2, a4, b1, b2, b4, c1, c2, c4);

  M.X.W := -MatrixDetInternal(b1, b2, b3, c1, c2, c3, d1, d2, d3);
  M.Y.W := MatrixDetInternal(a1, a2, a3, c1, c2, c3, d1, d2, d3);
  M.Z.W := -MatrixDetInternal(a1, a2, a3, b1, b2, b3, d1, d2, d3);
  M.W.W := MatrixDetInternal(a1, a2, a3, b1, b2, b3, c1, c2, c3);
end;

// AdjointMatrix (affine)
//
procedure AdjointMatrix(var M: TAffineMatrix);
var
  a1, a2, a3, b1, b2, b3, c1, c2, c3: Single;
begin
  a1 := M.X.X;
  a2 := M.X.Y;
  a3 := M.X.Z;
  b1 := M.Y.X;
  b2 := M.Y.Y;
  b3 := M.Y.Z;
  c1 := M.Z.X;
  c2 := M.Z.Y;
  c3 := M.Z.Z;
  M.X.X := (b2 * c3 - c2 * b3);
  M.Y.X := -(b1 * c3 - c1 * b3);
  M.Z.X := (b1 * c2 - c1 * b2);

  M.X.Y := -(a2 * c3 - c2 * a3);
  M.Y.Y := (a1 * c3 - c1 * a3);
  M.Z.Y := -(a1 * c2 - c1 * a2);

  M.X.Z := (a2 * b3 - b2 * a3);
  M.Y.Z := -(a1 * b3 - b1 * a3);
  M.Z.Z := (a1 * b2 - b1 * a2);
end;

// ScaleMatrix (affine)
//
procedure ScaleMatrix(var M: TAffineMatrix; const factor: Single);
var
  i: Integer;
begin
  for i := 0 to 2 do
  begin
    M.V[i].X := M.V[i].X * factor;
    M.V[i].Y := M.V[i].Y * factor;
    M.V[i].Z := M.V[i].Z * factor;
  end;
end;

// ScaleMatrix (hmg)
//
procedure ScaleMatrix(var M: TMatrix; const factor: Single);
var
  i: Integer;
begin
  for i := 0 to 3 do
  begin
    M.V[i].X := M.V[i].X * factor;
    M.V[i].Y := M.V[i].Y * factor;
    M.V[i].Z := M.V[i].Z * factor;
    M.V[i].W := M.V[i].W * factor;
  end;
end;

// TranslateMatrix (affine vec)
//
procedure TranslateMatrix(var M: TMatrix; const V: TAffineVector);
begin
  M.W.X := M.W.X + V.X;
  M.W.Y := M.W.Y + V.Y;
  M.W.Z := M.W.Z + V.Z;
end;

// TranslateMatrix
//
procedure TranslateMatrix(var M: TMatrix; const V: TVector);
begin
  M.W.X := M.W.X + V.X;
  M.W.Y := M.W.Y + V.Y;
  M.W.Z := M.W.Z + V.Z;
end;

// NormalizeMatrix
//
procedure NormalizeMatrix(var M: TMatrix);
begin
  M.X.W := 0;
  NormalizeVector(M.X);
  M.Y.W := 0;
  NormalizeVector(M.Y);
  M.Z := VectorCrossProduct(M.X, M.Y);
  M.X := VectorCrossProduct(M.Y, M.Z);
  M.W := WHmgVector;
end;

// TransposeMatrix
//
procedure TransposeMatrix(var M: TAffineMatrix);
var
  f: Single;
begin
  f := M.X.Y;
  M.X.Y := M.Y.X;
  M.Y.X := f;
  f := M.X.Z;
  M.X.Z := M.Z.X;
  M.Z.X := f;
  f := M.Y.Z;
  M.Y.Z := M.Z.Y;
  M.Z.Y := f;
end;

// TransposeMatrix
//
procedure TransposeMatrix(var M: TMatrix);
var
  f: Single;
begin
  f := M.X.Y;
  M.X.Y := M.Y.X;
  M.Y.X := f;
  f := M.X.Z;
  M.X.Z := M.Z.X;
  M.Z.X := f;
  f := M.X.W;
  M.X.W := M.W.X;
  M.W.X := f;
  f := M.Y.Z;
  M.Y.Z := M.Z.Y;
  M.Z.Y := f;
  f := M.Y.W;
  M.Y.W := M.W.Y;
  M.W.Y := f;
  f := M.Z.W;
  M.Z.W := M.W.Z;
  M.W.Z := f;
end;

// InvertMatrix
//
procedure InvertMatrix(var M: TMatrix);
var
  det: Single;
begin
  det := MatrixDeterminant(M);
  if Abs(det) < EPSILON then
    M := IdentityHmgMatrix
  else
  begin
    AdjointMatrix(M);
    ScaleMatrix(M, 1 / det);
  end;
end;

// MatrixInvert
//
function MatrixInvert(const M: TMatrix): TMatrix;
begin
  result := M;
  InvertMatrix(result);
end;

// InvertMatrix (affine)
//
procedure InvertMatrix(var M: TAffineMatrix);
var
  det: Single;
begin
  det := MatrixDeterminant(M);
  if Abs(det) < EPSILON then
    M := IdentityMatrix
  else
  begin
    AdjointMatrix(M);
    ScaleMatrix(M, 1 / det);
  end;
end;

// MatrixInvert (affine)
//
function MatrixInvert(const M: TAffineMatrix): TAffineMatrix;
begin
  result := M;
  InvertMatrix(result);
end;

// transpose_scale_m33
//
{$IFDEF GLS_ASM}
procedure Transpose_Scale_M33(const src: TMatrix; var dest: TMatrix;
  var scale: Single);
// EAX src
// EDX dest
// ECX scale
asm
    // dest[0][0]:=scale*src[0][0];
    fld   dword ptr [ecx]
    fld   st(0)
    fmul  dword ptr [eax]
    fstp  dword ptr [edx]
    // dest[1][0]:=scale*src[0][1];
    fld   st(0)
    fmul  dword ptr [eax+4]
    fstp  dword ptr [edx+16]
    // dest[2][0]:=scale*src[0][2];
    fmul  dword ptr [eax+8]
    fstp  dword ptr [edx+32]

    // dest[0][1]:=scale*src[1][0];
    fld   dword ptr [ecx]
    fld   st(0)
    fmul  dword ptr [eax+16]
    fstp  dword ptr [edx+4]
    // dest[1][1]:=scale*src[1][1];
    fld   st(0)
    fmul  dword ptr [eax+20]
    fstp  dword ptr [edx+20]
    // dest[2][1]:=scale*src[1][2];
    fmul  dword ptr [eax+24]
    fstp  dword ptr [edx+36]

    // dest[0][2]:=scale*src[2][0];
    fld   dword ptr [ecx]
    fld   st(0)
    fmul  dword ptr [eax+32]
    fstp  dword ptr [edx+8]
    // dest[1][2]:=scale*src[2][1];
    fld   st(0)
    fmul  dword ptr [eax+36]
    fstp  dword ptr [edx+24]
    // dest[2][2]:=scale*src[2][2];
    fmul  dword ptr [eax+40]
    fstp  dword ptr [edx+40]
end;
{$ELSE}
procedure Transpose_Scale_M33(const src: TMatrix; var dest: TMatrix;
  var scale: Single);
begin
  dest.X.X := scale * src.X.X;
  dest.Y.X := scale * src.X.Y;
  dest.Z.X := scale * src.X.Z;
  dest.X.Y := scale * src.Y.X;
  dest.Y.Y := scale * src.Y.Y;
  dest.Z.Y := scale * src.Y.Z;
  dest.X.Z := scale * src.Z.X;
  dest.Y.Z := scale * src.Z.Y;
  dest.Z.Z := scale * src.Z.Z;
end;
{$ENDIF}

// AnglePreservingMatrixInvert
//
function AnglePreservingMatrixInvert(const mat: TMatrix): TMatrix;
var
  scale: Single;
begin
  scale := VectorNorm(mat.X);

  // Is the submatrix A singular?
  if Abs(scale) < EPSILON then
  begin
    // Matrix M has no inverse
    result := IdentityHmgMatrix;
    Exit;
  end
  else
  begin
    // Calculate the inverse of the square of the isotropic scale factor
    scale := 1.0 / scale;
  end;

  // Fill in last row while CPU is busy with the division
  result.X.W := 0.0;
  result.Y.W := 0.0;
  result.Z.W := 0.0;
  result.W.W := 1.0;

  // Transpose and scale the 3 by 3 upper-left submatrix
  Transpose_Scale_M33(mat, result, scale);

  // Calculate -(transpose(A) / s*s) C
  result.W.X := -(result.X.X * mat.W.X + result.Y.X *
    mat.W.Y + result.Z.X * mat.W.Z);
  result.W.Y := -(result.X.Y * mat.W.X + result.Y.Y *
    mat.W.Y + result.Z.Y * mat.W.Z);
  result.W.Z := -(result.X.Z * mat.W.X + result.Y.Z *
    mat.W.Y + result.Z.Z * mat.W.Z);
end;

// MatrixDecompose
//
function MatrixDecompose(const M: TMatrix; var Tran: TTransformations): Boolean;
var
  i, J: Integer;
  LocMat, pmat, invpmat: TMatrix;
  prhs, psol: TVector;
  row0, row1, row2: TAffineVector;
  f: Single;
begin
  result := False;
  LocMat := M;
  // normalize the matrix
  if LocMat.W.W = 0 then
    Exit;
  for i := 0 to 3 do
    for J := 0 to 3 do
      LocMat.V[i].V[J] := LocMat.V[i].V[J] / LocMat.W.W;

  // pmat is used to solve for perspective, but it also provides
  // an easy way to test for singularity of the upper 3x3 component.

  pmat := LocMat;
  for i := 0 to 2 do
    pmat.V[i].V[W] := 0;
  pmat.W.W := 1;

  if MatrixDeterminant(pmat) = 0 then
    Exit;

  // First, isolate perspective.  This is the messiest.
  if (LocMat.X.W <> 0) or (LocMat.Y.W <> 0) or (LocMat.Z.W <> 0) then
  begin
    // prhs is the right hand side of the equation.
    prhs.V[X] := LocMat.X.W;
    prhs.V[Y] := LocMat.Y.W;
    prhs.V[Z] := LocMat.Z.W;
    prhs.V[W] := LocMat.W.W;

    // Solve the equation by inverting pmat and multiplying
    // prhs by the inverse.  (This is the easiest way, not
    // necessarily the best.)

    invpmat := pmat;
    InvertMatrix(invpmat);
    TransposeMatrix(invpmat);
    psol := VectorTransform(prhs, invpmat);

    // stuff the answer away
    Tran[ttPerspectiveX] := psol.V[X];
    Tran[ttPerspectiveY] := psol.V[Y];
    Tran[ttPerspectiveZ] := psol.V[Z];
    Tran[ttPerspectiveW] := psol.V[W];

    // clear the perspective partition
    LocMat.X.W := 0;
    LocMat.Y.W := 0;
    LocMat.Z.W := 0;
    LocMat.W.W := 1;
  end
  else
  begin
    // no perspective
    Tran[ttPerspectiveX] := 0;
    Tran[ttPerspectiveY] := 0;
    Tran[ttPerspectiveZ] := 0;
    Tran[ttPerspectiveW] := 0;
  end;

  // next take care of translation (easy)
  for i := 0 to 2 do
  begin
    Tran[TTransType(Ord(ttTranslateX) + i)] := LocMat.V[W].V[i];
    LocMat.V[W].V[i] := 0;
  end;

  // now get scale and shear
  SetVector(row0, LocMat.X);
  SetVector(row1, LocMat.Y);
  SetVector(row2, LocMat.Z);

  // compute X scale factor and normalize first row
  Tran[ttScaleX] := VectorNorm(row0);
  VectorScale(row0, RSqrt(Tran[ttScaleX]));

  // compute XY shear factor and make 2nd row orthogonal to 1st
  Tran[ttShearXY] := VectorDotProduct(row0, row1);
  f := -Tran[ttShearXY];
  CombineVector(row1, row0, f);

  // now, compute Y scale and normalize 2nd row
  Tran[ttScaleY] := VectorNorm(row1);
  VectorScale(row1, RSqrt(Tran[ttScaleY]));
  Tran[ttShearXY] := Tran[ttShearXY] / Tran[ttScaleY];

  // compute XZ and YZ shears, orthogonalize 3rd row
  Tran[ttShearXZ] := VectorDotProduct(row0, row2);
  f := -Tran[ttShearXZ];
  CombineVector(row2, row0, f);
  Tran[ttShearYZ] := VectorDotProduct(row1, row2);
  f := -Tran[ttShearYZ];
  CombineVector(row2, row1, f);

  // next, get Z scale and normalize 3rd row
  Tran[ttScaleZ] := VectorNorm(row2);
  VectorScale(row2, RSqrt(Tran[ttScaleZ]));
  Tran[ttShearXZ] := Tran[ttShearXZ] / Tran[ttScaleZ];
  Tran[ttShearYZ] := Tran[ttShearYZ] / Tran[ttScaleZ];

  // At this point, the matrix (in rows[]) is orthonormal.
  // Check for a coordinate system flip.  If the determinant
  // is -1, then negate the matrix and the scaling factors.
  if VectorDotProduct(row0, VectorCrossProduct(row1, row2)) < 0 then
  begin
    for i := 0 to 2 do
      Tran[TTransType(Ord(ttScaleX) + i)] :=
        -Tran[TTransType(Ord(ttScaleX) + i)];
    NegateVector(row0);
    NegateVector(row1);
    NegateVector(row2);
  end;

  // now, get the rotations out, as described in the gem
  Tran[ttRotateY] := ArcSine(-row0.V[Z]);
  if Cos(Tran[ttRotateY]) <> 0 then
  begin
    Tran[ttRotateX] := ArcTangent2(row1.V[Z], row2.V[Z]);
    Tran[ttRotateZ] := ArcTangent2(row0.V[Y], row0.V[X]);
  end
  else
  begin
    Tran[ttRotateX] := ArcTangent2(row1.V[X], row1.V[Y]);
    Tran[ttRotateZ] := 0;
  end;
  // All done!
  result := True;
end;

function CreateLookAtMatrix(const eye, center, normUp: TVector): TMatrix;
var
  XAxis, YAxis, ZAxis, negEye: TVector;
begin
  ZAxis := VectorSubtract(center, eye);
  NormalizeVector(ZAxis);
  XAxis := VectorCrossProduct(ZAxis, normUp);
  NormalizeVector(XAxis);
  YAxis := VectorCrossProduct(XAxis, ZAxis);
  result.X := XAxis;
  result.Y := YAxis;
  result.Z := ZAxis;
  NegateVector(result.Z);
  result.W := NullHmgPoint;
  TransposeMatrix(result);
  negEye := eye;
  NegateVector(negEye);
  negEye.W := 1;
  negEye := VectorTransform(negEye, result);
  result.W := negEye;
end;

function CreateMatrixFromFrustum(Left, Right, Bottom, Top, ZNear,
  ZFar: Single): TMatrix;
begin
  result.X.X := 2 * ZNear / (Right - Left);
  result.X.Y := 0;
  result.X.Z := 0;
  result.X.W := 0;

  result.Y.X := 0;
  result.Y.Y := 2 * ZNear / (Top - Bottom);
  result.Y.Z := 0;
  result.Y.W := 0;

  result.Z.X := (Right + Left) / (Right - Left);
  result.Z.Y := (Top + Bottom) / (Top - Bottom);
  result.Z.Z := -(ZFar + ZNear) / (ZFar - ZNear);
  result.Z.W := -1;

  result.W.X := 0;
  result.W.Y := 0;
  result.W.Z := -2 * ZFar * ZNear / (ZFar - ZNear);
  result.W.W := 0;
end;

function CreatePerspectiveMatrix(FOV, Aspect, ZNear, ZFar: Single): TMatrix;
var
  X, Y: Single;
begin
  FOV := MinFloat(179.9, MaxFloat(0, FOV));
  Y := ZNear * Tangent(DegToRadian(FOV) * 0.5);
  X := Y * Aspect;
  result := CreateMatrixFromFrustum(-X, X, -Y, Y, ZNear, ZFar);
end;

function CreateOrthoMatrix(Left, Right, Bottom, Top, ZNear,
  ZFar: Single): TMatrix;
begin
  result.X.X := 2 / (Right - Left);
  result.X.Y := 0;
  result.X.Z := 0;
  result.X.W := 0;

  result.Y.X := 0;
  result.Y.Y := 2 / (Top - Bottom);
  result.Y.Z := 0;
  result.Y.W := 0;

  result.Z.X := 0;
  result.Z.Y := 0;
  result.Z.Z := -2 / (ZFar - ZNear);
  result.Z.W := 0;

  result.W.X := (Left + Right) / (Left - Right);
  result.W.Y := (Bottom + Top) / (Bottom - Top);
  result.W.Z := (ZNear + ZFar) / (ZNear - ZFar);
  result.W.W := 1;
end;

function CreatePickMatrix(X, Y, deltax, deltay: Single;
  const viewport: TVector4i): TMatrix;
begin
  if (deltax <= 0) or (deltay <= 0) then
  begin
    result := IdentityHmgMatrix;
    Exit;
  end;
  // Translate and scale the picked region to the entire window
  result := CreateTranslationMatrix
    (AffineVectorMake((viewport.Z - 2 * (X - viewport.X)) / deltax,
    (viewport.W - 2 * (Y - viewport.Y)) / deltay, 0.0));
  result.X.X := viewport.Z / deltax;
  result.Y.Y := viewport.W / deltay;
end;

function Project(objectVector: TVector; const ViewProjMatrix: TMatrix;
  const viewport: TVector4i; out WindowVector: TVector): Boolean;
begin
  result := False;
  objectVector.W := 1.0;
  WindowVector := VectorTransform(objectVector, ViewProjMatrix);
  if WindowVector.W = 0.0 then
    Exit;
  WindowVector.X := WindowVector.X / WindowVector.W;
  WindowVector.Y := WindowVector.Y / WindowVector.W;
  WindowVector.Z := WindowVector.Z / WindowVector.W;
  // Map x, y and z to range 0-1
  WindowVector.X := WindowVector.X * 0.5 + 0.5;
  WindowVector.Y := WindowVector.Y * 0.5 + 0.5;
  WindowVector.Z := WindowVector.Z * 0.5 + 0.5;

  // Map x,y to viewport
  WindowVector.X := WindowVector.X * viewport.Z + viewport.X;
  WindowVector.Y := WindowVector.Y * viewport.W + viewport.Y;
  result := True;
end;

function UnProject(WindowVector: TVector; ViewProjMatrix: TMatrix;
  const viewport: TVector4i; out objectVector: TVector): Boolean;
begin
  result := False;
  InvertMatrix(ViewProjMatrix);
  WindowVector.W := 1.0;
  // Map x and y from window coordinates
  WindowVector.X := (WindowVector.X - viewport.X) / viewport.Z;
  WindowVector.Y := (WindowVector.Y - viewport.Y) / viewport.W;
  // Map to range -1 to 1
  WindowVector.X := WindowVector.X * 2 - 1;
  WindowVector.Y := WindowVector.Y * 2 - 1;
  WindowVector.Z := WindowVector.Z * 2 - 1;
  objectVector := VectorTransform(WindowVector, ViewProjMatrix);
  if objectVector.W = 0.0 then
    Exit;
  objectVector.X := objectVector.X / objectVector.W;
  objectVector.Y := objectVector.Y / objectVector.W;
  objectVector.Z := objectVector.Z / objectVector.W;
  result := True;
end;

// CalcPlaneNormal (func, affine)
//
function CalcPlaneNormal(const p1, p2, p3: TAffineVector): TAffineVector;
var
  V1, V2: TAffineVector;
begin
  VectorSubtract(p2, p1, V1);
  VectorSubtract(p3, p1, V2);
  VectorCrossProduct(V1, V2, result);
  NormalizeVector(result);
end;

// CalcPlaneNormal (proc, affine)
//
procedure CalcPlaneNormal(const p1, p2, p3: TAffineVector;
  var vr: TAffineVector);
var
  V1, V2: TAffineVector;
begin
  VectorSubtract(p2, p1, V1);
  VectorSubtract(p3, p1, V2);
  VectorCrossProduct(V1, V2, vr);
  NormalizeVector(vr);
end;

// CalcPlaneNormal (proc, hmg)
//
procedure CalcPlaneNormal(const p1, p2, p3: TVector;
  var vr: TAffineVector); overload;
var
  V1, V2: TVector;
begin
  VectorSubtract(p2, p1, V1);
  VectorSubtract(p3, p1, V2);
  VectorCrossProduct(V1, V2, vr);
  NormalizeVector(vr);
end;

// PlaneMake (point + normal, affine)
//
function PlaneMake(const point, normal: TAffineVector): THmgPlane;
begin
  PAffineVector(@result)^ := normal;
  result.W := -VectorDotProduct(point, normal);
end;

// PlaneMake (point + normal, hmg)
//
function PlaneMake(const point, normal: TVector): THmgPlane;
begin
  PAffineVector(@result)^ := PAffineVector(@normal)^;
  result.W := -VectorDotProduct(PAffineVector(@point)^,
    PAffineVector(@normal)^);
end;

// PlaneMake (3 points, affine)
//
function PlaneMake(const p1, p2, p3: TAffineVector): THmgPlane;
begin
  CalcPlaneNormal(p1, p2, p3, PAffineVector(@result)^);
  result.W := -VectorDotProduct(p1, PAffineVector(@result)^);
end;

// PlaneMake (3 points, hmg)
//
function PlaneMake(const p1, p2, p3: TVector): THmgPlane;
begin
  CalcPlaneNormal(p1, p2, p3, PAffineVector(@result)^);
  result.W := -VectorDotProduct(p1, PAffineVector(@result)^);
end;

// SetPlane
//
procedure SetPlane(var dest: TDoubleHmgPlane; const src: THmgPlane);
begin
  dest.X := src.X;
  dest.Y := src.Y;
  dest.Z := src.Z;
  dest.W := src.W;
end;

// NormalizePlane
//
procedure NormalizePlane(var plane: THmgPlane);
var
  n: Single;
begin
  n := RSqrt(plane.X * plane.X + plane.Y * plane.Y + plane.Z *
    plane.Z);
  ScaleVector(plane, n);
end;

// PlaneEvaluatePoint (affine)
//
{$IFDEF GLS_ASM}
function PlaneEvaluatePoint(const plane: THmgPlane;
  const point: TAffineVector): Single;
// EAX contains address of plane
// EDX contains address of point
// result is stored in ST(0)
asm
  FLD DWORD PTR [EAX]
  FMUL DWORD PTR [EDX]
  FLD DWORD PTR [EAX + 4]
  FMUL DWORD PTR [EDX + 4]
  FADDP
  FLD DWORD PTR [EAX + 8]
  FMUL DWORD PTR [EDX + 8]
  FADDP
  FLD DWORD PTR [EAX + 12]
  FADDP
end;
{$ELSE}
function PlaneEvaluatePoint(const plane: THmgPlane;
  const point: TAffineVector): Single;
begin
  result := plane.X * point.X + plane.Y * point.Y + plane.Z *
    point.Z + plane.W;
end;
{$ENDIF}

// PlaneEvaluatePoint (hmg)
//
{$IFDEF GLS_ASM}
function PlaneEvaluatePoint(const plane: THmgPlane;
  const point: TVector): Single;
// EAX contains address of plane
// EDX contains address of point
// result is stored in ST(0)
asm
  FLD DWORD PTR [EAX]
  FMUL DWORD PTR [EDX]
  FLD DWORD PTR [EAX + 4]
  FMUL DWORD PTR [EDX + 4]
  FADDP
  FLD DWORD PTR [EAX + 8]
  FMUL DWORD PTR [EDX + 8]
  FADDP
  FLD DWORD PTR [EAX + 12]
  FADDP
end;
{$ELSE}
function PlaneEvaluatePoint(const plane: THmgPlane;
  const point: TVector): Single;
begin
  result := plane.X * point.X + plane.Y * point.Y + plane.Z *
    point.Z + plane.W;
end;
{$ENDIF}

// PointIsInHalfSpace
//
{$IFDEF GLS_ASM}
function PointIsInHalfSpace(const point, planePoint,
  planeNormal: TVector): Boolean;
asm
  fld   dword ptr [eax]         // 27
  fsub  dword ptr [edx]
  fmul  dword ptr [ecx]
  fld   dword ptr [eax+4]
  fsub  dword ptr [edx+4]
  fmul  dword ptr [ecx+4]
  faddp
  fld   dword ptr [eax+8]
  fsub  dword ptr [edx+8]
  fmul  dword ptr [ecx+8]
  faddp
  ftst
  fstsw ax
  sahf
  setnbe al
  ffree st(0)
end;
  {$ELSE}
function PointIsInHalfSpace(const point, planePoint,
  planeNormal: TVector): Boolean;
begin
  result := (PointPlaneDistance(point, planePoint, planeNormal) > 0); // 44
end;
{$ENDIF}

// PointIsInHalfSpace
//
function PointIsInHalfSpace(const point, planePoint,
  planeNormal: TAffineVector): Boolean;
begin
  result := (PointPlaneDistance(point, planePoint, planeNormal) > 0);
end;

// PointIsInHalfSpace
//
function PointIsInHalfSpace(const point: TAffineVector;
  plane: THmgPlane): Boolean;
begin
  result := (PointPlaneDistance(point, plane) > 0);
end;

// PointPlaneDistance
//
{$IFDEF GLS_ASM}
function PointPlaneDistance(const point, planePoint,
  planeNormal: TVector): Single;
// EAX contains address of point
// EDX contains address of planepoint
// ECX contains address of planeNormal
// result in St(0)
asm
  fld   dword ptr [eax]
  fsub  dword ptr [edx]
  fmul  dword ptr [ecx]

  fld   dword ptr [eax+$4]
  fsub  dword ptr [edx+$4]
  fmul  dword ptr [ecx+$4]
  faddp

  fld   dword ptr [eax+$8]
  fsub  dword ptr [edx+$8]
  fmul  dword ptr [ecx+$8]
  faddp
end;
{$ELSE}
function PointPlaneDistance(const point, planePoint,
  planeNormal: TVector): Single;
begin
  result := (point.X - planePoint.X) * planeNormal.X +
    (point.Y - planePoint.Y) * planeNormal.Y +
    (point.Z - planePoint.Z) * planeNormal.Z;
end;
{$ENDIF}

// PointPlaneDistance
//
{$IFDEF GLS_ASM}
function PointPlaneDistance(const point, planePoint,
  planeNormal: TAffineVector): Single;
// EAX contains address of point
// EDX contains address of planepoint
// ECX contains address of planeNormal
// result in St(0)
asm
  fld   dword ptr [eax]
  fsub  dword ptr [edx]
  fmul  dword ptr [ecx]

  fld   dword ptr [eax+$4]
  fsub  dword ptr [edx+$4]
  fmul  dword ptr [ecx+$4]
  faddp

  fld   dword ptr [eax+$8]
  fsub  dword ptr [edx+$8]
  fmul  dword ptr [ecx+$8]
  faddp
end;
{$ELSE}
function PointPlaneDistance(const point, planePoint,
  planeNormal: TAffineVector): Single;
begin
  result := (point.X - planePoint.X) * planeNormal.X +
    (point.Y - planePoint.Y) * planeNormal.Y +
    (point.Z - planePoint.Z) * planeNormal.Z;
end;
{$ENDIF}

// PointPlaneDistance
//
function PointPlaneDistance(const point: TAffineVector;
  plane: THmgPlane): Single;
begin
  result := PlaneEvaluatePoint(plane, point);
end;

// PointPlaneOrthoProjection
//
function PointPlaneOrthoProjection(const point: TAffineVector;
  const plane: THmgPlane; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
var
  h: Single;
  normal: TAffineVector;
begin
  result := False;

  h := PointPlaneDistance(point, plane);

  if (not bothface) and (h < 0) then
    Exit;

  normal := Vector3fMake(plane);
  inter := VectorAdd(point, VectorScale(normal, -h));
  result := True;
end;

// PointPlaneProjection
//
function PointPlaneProjection(const point, direction: TAffineVector;
  const plane: THmgPlane; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
var
  h, dot: Single;
  normal: TAffineVector;
begin
  result := False;

  normal := Vector3fMake(plane);
  dot := VectorDotProduct(VectorNormalize(direction), normal);

  if (not bothface) and (dot > 0) then
    Exit;

  if Abs(dot) >= 0.000000001 then
  begin
    h := PointPlaneDistance(point, plane);
    inter := VectorAdd(point, VectorScale(direction, -h / dot));
    result := True;
  end;
end;

// SegmentPlaneIntersection
//
function SegmentPlaneIntersection(const ptA, ptB: TAffineVector;
  const plane: THmgPlane; var inter: TAffineVector): Boolean;
var
  hA, hB, dot: Single;
  normal, direction: TVector3f;
begin
  result := False;
  hA := PointPlaneDistance(ptA, plane);
  hB := PointPlaneDistance(ptB, plane);
  if hA * hB <= 0 then
  begin
    normal := Vector3fMake(plane);
    direction := VectorNormalize(VectorSubtract(ptB, ptA));
    dot := VectorDotProduct(direction, normal);
    if Abs(dot) >= 0.000000001 then
    begin
      inter := VectorAdd(ptA, VectorScale(direction, -hA / dot));
      result := True;
    end;
  end;
end;

// PointTriangleOrthoProjection
//
function PointTriangleOrthoProjection(const point, ptA, ptB, ptC: TAffineVector;
  var inter: TAffineVector; bothface: Boolean = True): Boolean;
var
  plane: THmgPlane;
begin
  result := False;

  plane := PlaneMake(ptA, ptB, ptC);
  if not IsLineIntersectTriangle(point, Vector3fMake(plane), ptA, ptB, ptC) then
    Exit;

  result := PointPlaneOrthoProjection(point, plane, inter, bothface);
end;

// PointTriangleProjection
//
function PointTriangleProjection(const point, direction, ptA, ptB,
  ptC: TAffineVector; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
var
  plane: THmgPlane;
begin
  result := False;

  if not IsLineIntersectTriangle(point, direction, ptA, ptB, ptC) then
    Exit;

  plane := PlaneMake(ptA, ptB, ptC);
  result := PointPlaneProjection(point, direction, plane, inter, bothface);
end;

// IsLineIntersectTriangle
//
function IsLineIntersectTriangle(const point, direction, ptA, ptB,
  ptC: TAffineVector): Boolean;
var
  PA, PB, PC: TAffineVector;
  crossAB, crossBC, crossCA: TAffineVector;
begin
  result := False;

  PA := VectorSubtract(ptA, point);
  PB := VectorSubtract(ptB, point);
  PC := VectorSubtract(ptC, point);

  crossAB := VectorCrossProduct(PA, PB);
  crossBC := VectorCrossProduct(PB, PC);

  if VectorDotProduct(crossAB, direction) > 0 then
  begin
    if VectorDotProduct(crossBC, direction) > 0 then
    begin
      crossCA := VectorCrossProduct(PC, PA);
      if VectorDotProduct(crossCA, direction) > 0 then
        result := True;
    end;
  end
  else if VectorDotProduct(crossBC, direction) < 0 then
  begin
    crossCA := VectorCrossProduct(PC, PA);
    if VectorDotProduct(crossCA, direction) < 0 then
      result := True;
  end
end;

// PointQuadOrthoProjection
//
function PointQuadOrthoProjection(const point, ptA, ptB, ptC,
  ptD: TAffineVector; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
var
  plane: THmgPlane;
begin
  result := False;

  plane := PlaneMake(ptA, ptB, ptC);
  if not IsLineIntersectQuad(point, Vector3fMake(plane), ptA, ptB, ptC, ptD)
  then
    Exit;

  result := PointPlaneOrthoProjection(point, plane, inter, bothface);
end;

// PointQuadProjection
//
function PointQuadProjection(const point, direction, ptA, ptB, ptC,
  ptD: TAffineVector; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
var
  plane: THmgPlane;
begin
  result := False;

  if not IsLineIntersectQuad(point, direction, ptA, ptB, ptC, ptD) then
    Exit;

  plane := PlaneMake(ptA, ptB, ptC);
  result := PointPlaneProjection(point, direction, plane, inter, bothface);
end;

// IsLineIntersectQuad
//
function IsLineIntersectQuad(const point, direction, ptA, ptB, ptC,
  ptD: TAffineVector): Boolean;
var
  PA, PB, PC, PD: TAffineVector;
  crossAB, crossBC, crossCD, crossDA: TAffineVector;
begin
  result := False;

  PA := VectorSubtract(ptA, point);
  PB := VectorSubtract(ptB, point);
  PC := VectorSubtract(ptC, point);
  PD := VectorSubtract(ptD, point);

  crossAB := VectorCrossProduct(PA, PB);
  crossBC := VectorCrossProduct(PB, PC);

  if VectorDotProduct(crossAB, direction) > 0 then
  begin
    if VectorDotProduct(crossBC, direction) > 0 then
    begin
      crossCD := VectorCrossProduct(PC, PD);
      if VectorDotProduct(crossCD, direction) > 0 then
      begin
        crossDA := VectorCrossProduct(PD, PA);
        if VectorDotProduct(crossDA, direction) > 0 then
          result := True;
      end;
    end;
  end
  else if VectorDotProduct(crossBC, direction) < 0 then
  begin
    crossCD := VectorCrossProduct(PC, PD);
    if VectorDotProduct(crossCD, direction) < 0 then
    begin
      crossDA := VectorCrossProduct(PD, PA);
      if VectorDotProduct(crossDA, direction) < 0 then
        result := True;
    end;
  end
end;

// PointDiskOrthoProjection
//
function PointDiskOrthoProjection(const point, center, up: TAffineVector;
  const radius: Single; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
begin
  if PointPlaneOrthoProjection(point, PlaneMake(center, up), inter, bothface)
  then
    result := (VectorDistance2(inter, center) <= radius * radius)
  else
    result := False;
end;

// PointDiskProjection
//
function PointDiskProjection(const point, direction, center, up: TAffineVector;
  const radius: Single; var inter: TAffineVector;
  bothface: Boolean = True): Boolean;
begin
  if PointPlaneProjection(point, direction, PlaneMake(center, up), inter,
    bothface) then
    result := VectorDistance2(inter, center) <= radius * radius
  else
    result := False;
end;

// PointLineClosestPoint
//
function PointLineClosestPoint(const point, linePoint, lineDirection
  : TAffineVector): TAffineVector;
var
  W: TAffineVector;
  c1, c2, b: Single;
begin
  W := VectorSubtract(point, linePoint);

  c1 := VectorDotProduct(W, lineDirection);
  c2 := VectorDotProduct(lineDirection, lineDirection);
  b := c1 / c2;

  VectorAdd(linePoint, VectorScale(lineDirection, b), result);
end;

// PointLineDistance
//
function PointLineDistance(const point, linePoint, lineDirection
  : TAffineVector): Single;
var
  PB: TAffineVector;
begin
  PB := PointLineClosestPoint(point, linePoint, lineDirection);
  result := VectorDistance(point, PB);
end;

// PointSegmentClosestPoint
//
function PointSegmentClosestPoint(const point, segmentStart,
  segmentStop: TVector): TVector;
var
  W, lineDirection: TVector;
  c1, c2, b: Single;
begin
  lineDirection := VectorSubtract(segmentStop, segmentStart);
  W := VectorSubtract(point, segmentStart);

  c1 := VectorDotProduct(W, lineDirection);
  c2 := VectorDotProduct(lineDirection, lineDirection);
  b := ClampValue(c1 / c2, 0, 1);

  VectorAdd(segmentStart, VectorScale(lineDirection, b), result);
end;

// PointSegmentClosestPoint
//
function PointSegmentClosestPoint(const point, segmentStart,
  segmentStop: TAffineVector): TAffineVector;
var
  W, lineDirection: TAffineVector;
  c1, c2, b: Single;
begin
  lineDirection := VectorSubtract(segmentStop, segmentStart);
  W := VectorSubtract(point, segmentStart);

  c1 := VectorDotProduct(W, lineDirection);
  c2 := VectorDotProduct(lineDirection, lineDirection);
  b := ClampValue(c1 / c2, 0, 1);

  VectorAdd(segmentStart, VectorScale(lineDirection, b), result);
end;

// PointSegmentDistance
//
function PointSegmentDistance(const point, segmentStart,
  segmentStop: TAffineVector): Single;
var
  PB: TAffineVector;
begin
  PB := PointSegmentClosestPoint(point, segmentStart, segmentStop);
  result := VectorDistance(point, PB);
end;

// http://geometryalgorithms.com/Archive/algorithm_0104/algorithm_0104B.htm
// SegmentSegmentClosestPoint
//
procedure SegmentSegmentClosestPoint(const S0Start, S0Stop, S1Start,
  S1Stop: TAffineVector; var Segment0Closest, Segment1Closest: TAffineVector);
const
  cSMALL_NUM = 0.000000001;
var
  u, V, W: TAffineVector;
  a, b, c, smalld, e, largeD, sc, sn, sD, tc, tN, tD: Single;
begin
  VectorSubtract(S0Stop, S0Start, u);
  VectorSubtract(S1Stop, S1Start, V);
  VectorSubtract(S0Start, S1Start, W);

  a := VectorDotProduct(u, u);
  b := VectorDotProduct(u, V);
  c := VectorDotProduct(V, V);
  smalld := VectorDotProduct(u, W);
  e := VectorDotProduct(V, W);
  largeD := a * c - b * b;

  sD := largeD;
  tD := largeD;

  if largeD < cSMALL_NUM then
  begin
    sn := 0.0;
    sD := 1.0;
    tN := e;
    tD := c;
  end
  else
  begin
    sn := (b * e - c * smalld);
    tN := (a * e - b * smalld);
    if (sn < 0.0) then
    begin
      sn := 0.0;
      tN := e;
      tD := c;
    end
    else if (sn > sD) then
    begin
      sn := sD;
      tN := e + b;
      tD := c;
    end;
  end;

  if (tN < 0.0) then
  begin
    tN := 0.0;
    // recompute sc for this edge
    if (-smalld < 0.0) then
      sn := 0.0
    else if (-smalld > a) then
      sn := sD
    else
    begin
      sn := -smalld;
      sD := a;
    end;
  end
  else if (tN > tD) then
  begin
    tN := tD;
    // recompute sc for this edge
    if ((-smalld + b) < 0.0) then
      sn := 0
    else if ((-smalld + b) > a) then
      sn := sD
    else
    begin
      sn := (-smalld + b);
      sD := a;
    end;
  end;

  // finally do the division to get sc and tc
  // sc := (abs(sN) < SMALL_NUM ? 0.0 : sN / sD);
  if Abs(sn) < cSMALL_NUM then
    sc := 0
  else
    sc := sn / sD;

  // tc := (abs(tN) < SMALL_NUM ? 0.0 : tN / tD);
  if Abs(tN) < cSMALL_NUM then
    tc := 0
  else
    tc := tN / tD;

  // get the difference of the two closest points
  // Vector   dP = w + (sc * u) - (tc * v);  // = S0(sc) - S1(tc)

  Segment0Closest := VectorAdd(S0Start, VectorScale(u, sc));
  Segment1Closest := VectorAdd(S1Start, VectorScale(V, tc));
end;

// SegmentSegmentDistance
//
function SegmentSegmentDistance(const S0Start, S0Stop, S1Start,
  S1Stop: TAffineVector): Single;
var
  Pb0, PB1: TAffineVector;
begin
  SegmentSegmentClosestPoint(S0Start, S0Stop, S1Start, S1Stop, Pb0, PB1);
  result := VectorDistance(Pb0, PB1);
end;

// LineLineDistance
//
function LineLineDistance(const linePt0, lineDir0, linePt1,
  lineDir1: TAffineVector): Single;
const
  cBIAS = 0.000000001;
var
  det: Single;
begin
  det := Abs((linePt1.X - linePt0.X) * (lineDir0.Y * lineDir1.Z -
    lineDir1.Y * lineDir0.Z) - (linePt1.Y - linePt0.Y) *
    (lineDir0.X * lineDir1.Z - lineDir1.X * lineDir0.Z) +
    (linePt1.Z - linePt0.Z) * (lineDir0.X * lineDir1.Y -
    lineDir1.X * lineDir0.Y));
  if det < cBIAS then
    result := PointLineDistance(linePt0, linePt1, lineDir1)
  else
    result := det / VectorLength(VectorCrossProduct(lineDir0, lineDir1));
end;

// QuaternionMake
//
function QuaternionMake(const Imag: array of Single; Real: Single): TQuaternion;
var
  n: Integer;
begin
  n := Length(Imag);
  if n >= 1 then
    result.ImagPart.X := Imag[0];
  if n >= 2 then
    result.ImagPart.Y := Imag[1];
  if n >= 3 then
    result.ImagPart.Z := Imag[2];
  result.RealPart := Real;
end;

// QuaternionConjugate
//
function QuaternionConjugate(const Q: TQuaternion): TQuaternion;
begin
  result.ImagPart.X := -Q.ImagPart.X;
  result.ImagPart.Y := -Q.ImagPart.Y;
  result.ImagPart.Z := -Q.ImagPart.Z;
  result.RealPart := Q.RealPart;
end;

// QuaternionMagnitude
//
function QuaternionMagnitude(const Q: TQuaternion): Single;
begin
  result := Sqrt(VectorNorm(Q.ImagPart) + Sqr(Q.RealPart));
end;

// NormalizeQuaternion
//
procedure NormalizeQuaternion(var Q: TQuaternion);
var
  M, f: Single;
begin
  M := QuaternionMagnitude(Q);
  if M > EPSILON2 then
  begin
    f := 1 / M;
    ScaleVector(Q.ImagPart, f);
    Q.RealPart := Q.RealPart * f;
  end
  else
    Q := IdentityQuaternion;
end;

// QuaternionFromPoints
//
function QuaternionFromPoints(const V1, V2: TAffineVector): TQuaternion;
begin
  result.ImagPart := VectorCrossProduct(V1, V2);
  result.RealPart := Sqrt((VectorDotProduct(V1, V2) + 1) / 2);
end;

// QuaternionFromMatrix
//
function QuaternionFromMatrix(const mat: TMatrix): TQuaternion;
// the matrix must be a rotation matrix!
var
  traceMat, S, invS: Double;
begin
  traceMat := 1 + mat.X.X + mat.Y.Y + mat.Z.Z;
  if traceMat > EPSILON2 then
  begin
    S := Sqrt(traceMat) * 2;
    invS := 1 / S;
    result.ImagPart.X := (mat.Y.Z - mat.Z.Y) * invS;
    result.ImagPart.Y := (mat.Z.X - mat.X.Z) * invS;
    result.ImagPart.Z := (mat.X.Y - mat.Y.X) * invS;
    result.RealPart := 0.25 * S;
  end
  else if (mat.X.X > mat.Y.Y) and (mat.X.X > mat.Z.Z)
  then
  begin // Row 0:
    S := Sqrt(MaxFloat(EPSILON2, cOne + mat.X.X - mat.Y.Y -
      mat.Z.Z)) * 2;
    invS := 1 / S;
    result.ImagPart.X := 0.25 * S;
    result.ImagPart.Y := (mat.X.Y + mat.Y.X) * invS;
    result.ImagPart.Z := (mat.Z.X + mat.X.Z) * invS;
    result.RealPart := (mat.Y.Z - mat.Z.Y) * invS;
  end
  else if (mat.Y.Y > mat.Z.Z) then
  begin // Row 1:
    S := Sqrt(MaxFloat(EPSILON2, cOne + mat.Y.Y - mat.X.X -
      mat.Z.Z)) * 2;
    invS := 1 / S;
    result.ImagPart.X := (mat.X.Y + mat.Y.X) * invS;
    result.ImagPart.Y := 0.25 * S;
    result.ImagPart.Z := (mat.Y.Z + mat.Z.Y) * invS;
    result.RealPart := (mat.Z.X - mat.X.Z) * invS;
  end
  else
  begin // Row 2:
    S := Sqrt(MaxFloat(EPSILON2, cOne + mat.Z.Z - mat.X.X -
      mat.Y.Y)) * 2;
    invS := 1 / S;
    result.ImagPart.X := (mat.Z.X + mat.X.Z) * invS;
    result.ImagPart.Y := (mat.Y.Z + mat.Z.Y) * invS;
    result.ImagPart.Z := 0.25 * S;
    result.RealPart := (mat.X.Y - mat.Y.X) * invS;
  end;
  NormalizeQuaternion(result);
end;

// QuaternionMultiply
//
function QuaternionMultiply(const qL, qR: TQuaternion): TQuaternion;
var
  Temp: TQuaternion;
begin
  Temp.RealPart := qL.RealPart * qR.RealPart - qL.ImagPart.V[X] * qR.ImagPart.V
    [X] - qL.ImagPart.V[Y] * qR.ImagPart.V[Y] - qL.ImagPart.V[Z] *
    qR.ImagPart.V[Z];
  Temp.ImagPart.V[X] := qL.RealPart * qR.ImagPart.V[X] + qL.ImagPart.V[X] *
    qR.RealPart + qL.ImagPart.V[Y] * qR.ImagPart.V[Z] - qL.ImagPart.V[Z] *
    qR.ImagPart.V[Y];
  Temp.ImagPart.V[Y] := qL.RealPart * qR.ImagPart.V[Y] + qL.ImagPart.V[Y] *
    qR.RealPart + qL.ImagPart.V[Z] * qR.ImagPart.V[X] - qL.ImagPart.V[X] *
    qR.ImagPart.V[Z];
  Temp.ImagPart.V[Z] := qL.RealPart * qR.ImagPart.V[Z] + qL.ImagPart.V[Z] *
    qR.RealPart + qL.ImagPart.V[X] * qR.ImagPart.V[Y] - qL.ImagPart.V[Y] *
    qR.ImagPart.V[X];
  result := Temp;
end;

// QuaternionToMatrix
//
function QuaternionToMatrix(quat: TQuaternion): TMatrix;
var
  W, X, Y, Z, xx, xy, xz, xw, yy, yz, yw, zz, zw: Single;
begin
  NormalizeQuaternion(quat);
  W := quat.RealPart;
  X := quat.ImagPart.X;
  Y := quat.ImagPart.Y;
  Z := quat.ImagPart.Z;
  xx := X * X;
  xy := X * Y;
  xz := X * Z;
  xw := X * W;
  yy := Y * Y;
  yz := Y * Z;
  yw := Y * W;
  zz := Z * Z;
  zw := Z * W;
  result.X.X := 1 - 2 * (yy + zz);
  result.Y.X := 2 * (xy - zw);
  result.Z.X := 2 * (xz + yw);
  result.W.X := 0;
  result.X.Y := 2 * (xy + zw);
  result.Y.Y := 1 - 2 * (xx + zz);
  result.Z.Y := 2 * (yz - xw);
  result.W.Y := 0;
  result.X.Z := 2 * (xz - yw);
  result.Y.Z := 2 * (yz + xw);
  result.Z.Z := 1 - 2 * (xx + yy);
  result.W.Z := 0;
  result.X.W := 0;
  result.Y.W := 0;
  result.Z.W := 0;
  result.W.W := 1;
end;

// QuaternionToAffineMatrix
//
function QuaternionToAffineMatrix(quat: TQuaternion): TAffineMatrix;
var
  W, X, Y, Z, xx, xy, xz, xw, yy, yz, yw, zz, zw: Single;
begin
  NormalizeQuaternion(quat);
  W := quat.RealPart;
  X := quat.ImagPart.X;
  Y := quat.ImagPart.Y;
  Z := quat.ImagPart.Z;
  xx := X * X;
  xy := X * Y;
  xz := X * Z;
  xw := X * W;
  yy := Y * Y;
  yz := Y * Z;
  yw := Y * W;
  zz := Z * Z;
  zw := Z * W;
  result.X.X := 1 - 2 * (yy + zz);
  result.Y.X := 2 * (xy - zw);
  result.Z.X := 2 * (xz + yw);
  result.X.Y := 2 * (xy + zw);
  result.Y.Y := 1 - 2 * (xx + zz);
  result.Z.Y := 2 * (yz - xw);
  result.X.Z := 2 * (xz - yw);
  result.Y.Z := 2 * (yz + xw);
  result.Z.Z := 1 - 2 * (xx + yy);
end;

// QuaternionFromAngleAxis
//
function QuaternionFromAngleAxis(const angle: Single; const axis: TAffineVector)
  : TQuaternion;
var
  f, S, c: Single;
begin
  SinCosine(DegToRadian(angle * cOneDotFive), S, c);
  result.RealPart := c;
  f := S / VectorLength(axis);
  result.ImagPart.X := axis.X * f;
  result.ImagPart.Y := axis.Y * f;
  result.ImagPart.Z := axis.Z * f;
end;

// QuaternionFromRollPitchYaw
//
function QuaternionFromRollPitchYaw(const r, p, Y: Single): TQuaternion;
var
  qp, qy: TQuaternion;
begin
  result := QuaternionFromAngleAxis(r, ZVector);
  qp := QuaternionFromAngleAxis(p, XVector);
  qy := QuaternionFromAngleAxis(Y, YVector);

  result := QuaternionMultiply(qp, result);
  result := QuaternionMultiply(qy, result);
end;

// QuaternionFromEuler
//
function QuaternionFromEuler(const X, Y, Z: Single; eulerOrder: TEulerOrder)
  : TQuaternion;
// input angles in degrees
var
  gimbalLock: Boolean;
  quat1, quat2: TQuaternion;

  function EulerToQuat(const X, Y, Z: Single; eulerOrder: TEulerOrder)
    : TQuaternion;
  const
    cOrder: array [Low(TEulerOrder) .. High(TEulerOrder)] of array [1 .. 3]
      of Byte = ((1, 2, 3), (1, 3, 2), (2, 1, 3), // eulXYZ, eulXZY, eulYXZ,
      (3, 1, 2), (2, 3, 1), (3, 2, 1)); // eulYZX, eulZXY, eulZYX
  var
    Q: array [1 .. 3] of TQuaternion;
  begin
    Q[cOrder[eulerOrder][1]] := QuaternionFromAngleAxis(X, XVector);
    Q[cOrder[eulerOrder][2]] := QuaternionFromAngleAxis(Y, YVector);
    Q[cOrder[eulerOrder][3]] := QuaternionFromAngleAxis(Z, ZVector);
    result := QuaternionMultiply(Q[2], Q[3]);
    result := QuaternionMultiply(Q[1], result);
  end;

const
  SMALL_ANGLE = 0.001;
begin
  NormalizeDegAngle(X);
  NormalizeDegAngle(Y);
  NormalizeDegAngle(Z);
  case eulerOrder of
    eulXYZ, eulZYX:
      gimbalLock := Abs(Abs(Y) - 90.0) <= EPSILON2; // cos(Y) = 0;
    eulYXZ, eulZXY:
      gimbalLock := Abs(Abs(X) - 90.0) <= EPSILON2; // cos(X) = 0;
    eulXZY, eulYZX:
      gimbalLock := Abs(Abs(Z) - 90.0) <= EPSILON2; // cos(Z) = 0;
  else
    Assert(False);
    gimbalLock := False;
  end;
  if gimbalLock then
  begin
    case eulerOrder of
      eulXYZ, eulZYX:
        quat1 := EulerToQuat(X, Y - SMALL_ANGLE, Z, eulerOrder);
      eulYXZ, eulZXY:
        quat1 := EulerToQuat(X - SMALL_ANGLE, Y, Z, eulerOrder);
      eulXZY, eulYZX:
        quat1 := EulerToQuat(X, Y, Z - SMALL_ANGLE, eulerOrder);
    end;
    case eulerOrder of
      eulXYZ, eulZYX:
        quat2 := EulerToQuat(X, Y + SMALL_ANGLE, Z, eulerOrder);
      eulYXZ, eulZXY:
        quat2 := EulerToQuat(X + SMALL_ANGLE, Y, Z, eulerOrder);
      eulXZY, eulYZX:
        quat2 := EulerToQuat(X, Y, Z + SMALL_ANGLE, eulerOrder);
    end;
    result := QuaternionSlerp(quat1, quat2, 0.5);
  end
  else
  begin
    result := EulerToQuat(X, Y, Z, eulerOrder);
  end;
end;

// QuaternionToPoints
//
procedure QuaternionToPoints(const Q: TQuaternion;
  var ArcFrom, ArcTo: TAffineVector);
var
  S, invS: Single;
begin
  S := Q.ImagPart.V[X] * Q.ImagPart.V[X] + Q.ImagPart.V[Y] * Q.ImagPart.V[Y];
  if S = 0 then
    SetAffineVector(ArcFrom, 0, 1, 0)
  else
  begin
    invS := RSqrt(S);
    SetAffineVector(ArcFrom, -Q.ImagPart.V[Y] * invS,
      Q.ImagPart.V[X] * invS, 0);
  end;
  ArcTo.V[X] := Q.RealPart * ArcFrom.V[X] - Q.ImagPart.V[Z] * ArcFrom.V[Y];
  ArcTo.V[Y] := Q.RealPart * ArcFrom.V[Y] + Q.ImagPart.V[Z] * ArcFrom.V[X];
  ArcTo.V[Z] := Q.ImagPart.V[X] * ArcFrom.V[Y] - Q.ImagPart.V[Y] * ArcFrom.V[X];
  if Q.RealPart < 0 then
    SetAffineVector(ArcFrom, -ArcFrom.V[X], -ArcFrom.V[Y], 0);
end;

// LnXP1
//

function LnXP1(X: Extended): Extended;
begin
  result := System.Math.LnXP1(X);
end;

// Log10
//
function Log10(X: Extended): Extended;
// Log.10(X):=Log.2(X) * Log.10(2)
begin
  result := System.Math.Log10(X);
end;

// Log2
//
function Log2(X: Extended): Extended;
begin
  result := System.Math.Log2(X);
end;

// Log2
//
function Log2(X: Single): Single;
begin
{$HINTS OFF}
  result := System.Math.Log2(X);
{$HINTS ON}
end;

// LogN
//
function LogN(Base, X: Extended): Extended;
// Log.N(X):=Log.2(X) / Log.2(N)
begin
  result := System.Math.LogN(Base, X);
end;

// IntPower
//
function IntPower(Base: Extended; Exponent: Integer): Extended;
begin
  result := IntPower(Base, Exponent);
end;

// Power
//
function PowerSingle(const Base, Exponent: Single): Single;
begin
{$HINTS OFF}
  if Exponent = cZero then
    result := cOne
  else if (Base = cZero) and (Exponent > cZero) then
    result := cZero
  else if RoundInt(Exponent) = Exponent then
    result := Power(Base, Integer(Round(Exponent)))
  else
    result := Exp(Exponent * Ln(Base));
{$HINTS ON}
end;

// Power (int exponent)
//
function PowerInteger(Base: Single; Exponent: Integer): Single;
begin
{$HINTS OFF}
  result := Power(Base, Exponent);
{$HINTS ON}
end;

function PowerInt64(Base: Single; Exponent: Int64): Single;
begin
{$HINTS OFF}
  result := System.Math.Power(Base, Exponent);
{$HINTS ON}
end;

// DegToRad (extended)
//
function DegToRadian(const Degrees: Extended): Extended;
begin
  result := Degrees * (PI / 180);
end;

// DegToRadian (single)
//
{$IFDEF GLS_ASM}
function DegToRadian(const Degrees: Single): Single;
// Result:=Degrees * cPIdiv180;
// don't laugh, Delphi's compiler manages to make a nightmare of this one
// with pushs, pops, etc. in its default compile... (this one is twice faster !)
asm
  FLD  DWORD PTR [EBP+8]
  FMUL cPIdiv180
end;
{$ELSE}
function DegToRadian(const Degrees: Single): Single;
begin
  result := Degrees * cPIdiv180;
end;
{$ENDIF}

// RadianToDeg (extended)
//
function RadianToDeg(const Radians: Extended): Extended;
begin
  result := Radians * (180 / PI);
end;

// RadianToDeg (single)
//
{$IFDEF GLS_ASM}
function RadianToDeg(const Radians: Single): Single;
// Result:=Radians * c180divPI;
// don't laugh, Delphi's compiler manages to make a nightmare of this one
// with pushs, pops, etc. in its default compile... (this one is twice faster !)
asm
  FLD  DWORD PTR [EBP+8]
  FMUL c180divPI
end;
{$ELSE}
function RadianToDeg(const Radians: Single): Single;
begin
  result := Radians * c180divPI;
end;
{$ENDIF}

// NormalizeAngle
//
function NormalizeAngle(angle: Single): Single;
begin
  result := angle - Int(angle * cInv2PI) * c2PI;
  if result > PI then
    result := result - 2 * PI
  else if result < -PI then
    result := result + 2 * PI;
end;

// NormalizeDegAngle
//
function NormalizeDegAngle(angle: Single): Single;
begin
  result := angle - Int(angle * cInv360) * c360;
  if result > c180 then
    result := result - c360
  else if result < -c180 then
    result := result + c360;
end;

{$IFDEF GLS_PLATFORM_HAS_EXTENDED}

// SinCosine (Extended)
//
{$IFDEF GLS_ASM}
procedure SinCosine(const Theta: Extended; out Sin, Cos: Extended);
// EAX contains address of Sin
// EDX contains address of Cos
// Theta is passed over the stack
asm
  FLD  Theta
  FSinCos
  FSTP TBYTE PTR [EDX]    // cosine
  FSTP TBYTE PTR [EAX]    // sine
end;
{$ELSE}
procedure SinCosine(const Theta: Extended; out Sin, Cos: Extended);
begin
  Math.SinCos(Theta, Sin, Cos);
end;
{$ENDIF}
{$ENDIF GLS_PLATFORM_HAS_EXTENDED}

// SinCosine (Double)
//
procedure SinCosine(const Theta: Double; out Sin, Cos: Double);
var
  S, c: Extended;
begin
  SinCos(Theta, S, c);
{$HINTS OFF}
  Sin := S;
  Cos := c;
{$HINTS ON}
end;

// SinCosine (Single)
//
procedure SinCosine(const Theta: Single; out Sin, Cos: Single);
// EAX contains address of Sin
// EDX contains address of Cos
// Theta is passed over the stack
var
  S, c: Extended;
begin
  SinCos(Theta, S, c);
{$HINTS OFF}
  Sin := S;
  Cos := c;
{$HINTS ON}
end;

{$IFDEF GLS_PLATFORM_HAS_EXTENDED}

// SinCosine (Extended w radius)
//
procedure SinCosine(const Theta, radius: Double; out Sin, Cos: Extended);
// EAX contains address of Sin
// EDX contains address of Cos
// Theta is passed over the stack
var
  S, c: Extended;
begin
  Math.SinCos(Theta, S, c);
  Sin := S * radius;
  Cos := c * radius;
end;

{$ENDIF GLS_PLATFORM_HAS_EXTENDED}

// SinCosine (Double w radius)
//
procedure SinCosine(const Theta, radius: Double; out Sin, Cos: Double);
var
  S, c: Extended;
begin
  SinCos(Theta, S, c);
  Sin := S * radius;
  Cos := c * radius;
end;

// SinCosine (Single w radius)
//
procedure SinCosine(const Theta, radius: Single; out Sin, Cos: Single);
var
  S, c: Extended;
begin
  SinCos(Theta, S, c);
  Sin := S * radius;
  Cos := c * radius;
end;

// PrepareSinCosCache
//
procedure PrepareSinCosCache(var S, c: array of Single;
  startAngle, stopAngle: Single);
var
  i: Integer;
  d, alpha, beta: Single;
begin
  Assert((High(S) = High(c)) and (Low(S) = Low(c)));
  stopAngle := stopAngle + 1E-5;
  if High(S) > Low(S) then
    d := cPIdiv180 * (stopAngle - startAngle) / (High(S) - Low(S))
  else
    d := 0;

  if High(S) - Low(S) < 1000 then
  begin
    // Fast computation (approx 5.5x)
    alpha := 2 * Sqr(Sin(d * 0.5));
    beta := Sin(d);
    SinCosine(startAngle * cPIdiv180, S[Low(S)], c[Low(S)]);
    for i := Low(S) to High(S) - 1 do
    begin
      // Make use of the incremental formulae:
      // cos (theta+delta) = cos(theta) - [alpha*cos(theta) + beta*sin(theta)]
      // sin (theta+delta) = sin(theta) - [alpha*sin(theta) - beta*cos(theta)]
      c[i + 1] := c[i] - alpha * c[i] - beta * S[i];
      S[i + 1] := S[i] - alpha * S[i] + beta * c[i];
    end;
  end
  else
  begin
    // Slower, but maintains precision when steps are small
    startAngle := startAngle * cPIdiv180;
    for i := Low(S) to High(S) do
      SinCosine((i - Low(S)) * d + startAngle, S[i], c[i]);
  end;
end;

// ArcCosine (Extended)
//
function ArcCosine(const X: Extended): Extended;
begin
  result := ArcTangent2(Sqrt(1 - Sqr(X)), X);
end;

// ArcCosine (Single)
//
function ArcCosine(const X: Single): Single;
// Result:=ArcTan2(Sqrt(c1 - X * X), X);
begin
{$HINTS OFF}
  result := ArcCos(X);
{$HINTS ON}
end;

// ArcSine (Extended)
//
function ArcSine(const X: Extended): Extended;
begin
  result := ArcTangent2(X, Sqrt(1 - Sqr(X)))
end;

// ArcSine (Single)
//
function ArcSine(const X: Single): Single;
// Result:=ArcTan2(X, Sqrt(1 - X * X))
begin
{$HINTS OFF}
  result := ArcSin(X);
{$HINTS ON}
end;

// ArcTangent2 (Extended)
//
function ArcTangent2(const Y, X: Extended): Extended;
begin
  result := ArcTan2(Y, X);
end;

// ArcTangent2 (Single)
//
function ArcTangent2(const Y, X: Single): Single;
begin
{$HINTS OFF}
  result := ArcTan2(Y, X);
{$HINTS ON}
end;

// FastArcTangent2
//
function FastArcTangent2(Y, X: Single): Single;
// accuracy of about 0.07 rads
const
  cEpsilon: Single = 1E-10;
var
  abs_y: Single;
begin
  abs_y := Abs(Y) + cEpsilon; // prevent 0/0 condition
  if Y < 0 then
  begin
    if X >= 0 then
      result := cPIdiv4 * (X - abs_y) / (X + abs_y) - cPIdiv4
    else
      result := cPIdiv4 * (X + abs_y) / (abs_y - X) - c3PIdiv4;
  end
  else
  begin
    if X >= 0 then
      result := cPIdiv4 - cPIdiv4 * (X - abs_y) / (X + abs_y)
    else
      result := c3PIdiv4 - cPIdiv4 * (X + abs_y) / (abs_y - X);
  end;
end;

// Tangent (Extended)
//
function Tangent(const X: Extended): Extended;
begin
  result := Tan(X);
end;

// Tangent (Single)
//
function Tangent(const X: Single): Single;
begin
{$HINTS OFF}
  result := Tan(X);
{$HINTS ON}
end;

// CoTangent (Extended)
//
function CoTangent(const X: Extended): Extended;
begin
  result := CoTan(X);
end;

// CoTangent (Single)
//
function CoTangent(const X: Single): Single;
begin
{$HINTS OFF}
  result := CoTan(X);
{$HINTS ON}
end;

// Sinh
//
function Sinh(const X: Single): Single;
begin
  result := 0.5 * (Exp(X) - Exp(-X));
end;

// Sinh
//
function Sinh(const X: Double): Double;
begin
  result := 0.5 * (Exp(X) - Exp(-X));
end;

// Cosh
//
function Cosh(const X: Single): Single;
begin
  result := 0.5 * (Exp(X) + Exp(-X));
end;

// Cosh
//
function Cosh(const X: Double): Double;
begin
  result := 0.5 * (Exp(X) + Exp(-X));
end;

// RSqrt
//
function RSqrt(V: Single): Single;
begin
  result := 1 / Sqrt(V);
end;

// ISqrt
//
function ISqrt(i: Integer): Integer;
begin
{$HINTS OFF}
  result := Round(Sqrt(i));
{$HINTS ON}
end;

// ILength
//
function ILength(X, Y: Integer): Integer;
begin
{$HINTS OFF}
  result := Round(Sqrt(X * X + Y * Y));
{$HINTS ON}
end;

// ILength
//
function ILength(X, Y, Z: Integer): Integer;
begin
{$HINTS OFF}
  result := Round(Sqrt(X * X + Y * Y + Z * Z));
{$HINTS ON}
end;

// RLength
//
function RLength(X, Y: Single): Single;
begin
  result := 1 / Sqrt(X * X + Y * Y);
end;

// RegisterBasedExp
//
{$IFDEF GLS_ASM}
procedure RegisterBasedExp;
asm   // Exp(x) = 2^(x.log2(e))
  fldl2e
  fmul
  fld      st(0)
  frndint
  fsub     st(1), st
  fxch     st(1)
  f2xm1
  fld1
  fadd
  fscale
  fstp     st(1)
end;
{$ENDIF}

// RandomPointOnSphere
//
procedure RandomPointOnSphere(var p: TAffineVector);
var
  T, W: Single;
begin
  p.Z := 2 * Random - 1;
  T := 2 * PI * Random;
  W := Sqrt(1 - p.Z * p.Z);
  SinCosine(T, W, p.Y, p.X);
end;

// RoundInt (single)
//
function RoundInt(V: Single): Single;
begin
{$HINTS OFF}
  result := Int(V + cOneDotFive);
{$HINTS ON}
end;

// RoundInt (extended)
//
function RoundInt(V: Extended): Extended;
begin
  result := Int(V + 0.5);
end;

// Int (Extended)
//
{$IFDEF GLS_ASM}
function Int(V: Extended): Extended;
asm
  SUB     ESP,4
  FSTCW   [ESP]
  FLDCW   cwChop
  FLD     DWORD PTR[v]
  FRNDINT
  FLDCW   [ESP]
  ADD     ESP,4
end;
// Int (Single)
//
function Int(V: Single): Single;
asm
  SUB     ESP,4
  FSTCW   [ESP]
  FLDCW   cwChop
  FLD     DWORD PTR[V]
  FRNDINT
  FLDCW   [ESP]
  ADD     ESP,4
end;

// Frac (Extended)
//
function Frac(V: Extended): Extended;
asm
  SUB     ESP,4
  FSTCW   [ESP]
  FLDCW   cwChop
  FLD     DWORD PTR[V]
  FLD     ST
  FRNDINT
  FSUB
  FLDCW   [ESP]
  ADD     ESP,4
end;

// Frac (Extended)
//
function Frac(V: Single): Single;
asm
  SUB     ESP,4
  FSTCW   [ESP]
  FLDCW   cwChop
  FLD     DWORD PTR[V]
  FLD     ST
  FRNDINT
  FSUB
  FLDCW   [ESP]
  ADD     ESP,4
end;

// Round64 (Extended);
//
function Round64(V: Extended): Int64;
asm
  FLD      DWORD PTR[V]
  FISTP    qword ptr [v]           // use v as storage to place the result
  MOV      EAX, dword ptr [v]
  MOV      EDX, dword ptr [v+4]
end;

// Round (Single);
//
function Round(V: Single): Integer;
asm
  FLD     DWORD PTR[V]
  FISTP   DWORD PTR [V]     // use v as storage to place the result
  MOV     EAX, [v]
end;

{$ELSE}

function Trunc(X: Extended): Int64;
begin
  result := System.Trunc(X);
end;

function Round(X: Extended): Int64;
begin
  result := System.Round(X);
end;

function Frac(X: Extended): Extended;
begin
  result := System.Frac(X);
end;

{$ENDIF}

// Ceil64 (Extended)
//
function Ceil64(V: Extended): Int64; overload;
begin
  if Frac(V) > 0 then
    result := Trunc(V) + 1
  else
    result := Trunc(V);
end;

// Ceil (Single)
//
function Ceil(V: Single): Integer; overload;
begin
{$HINTS OFF}
  if Frac(V) > 0 then
    result := Trunc(V) + 1
  else
    result := Trunc(V);
{$HINTS ON}
end;

// Floor64 (Extended)
//
function Floor64(V: Extended): Int64; overload;
begin
  if V < 0 then
    result := Trunc(V) - 1
  else
    result := Trunc(V);
end;

// Floor (Single)
//
function Floor(V: Single): Integer; overload;
begin
{$HINTS OFF}
  if V < 0 then
    result := Trunc(V) - 1
  else
    result := Trunc(V);
{$HINTS ON}
end;

// Sign
//
function Sign(X: Single): Integer;
begin
  if X < 0 then
    result := -1
  else if X > 0 then
    result := 1
  else
    result := 0;
end;

// SignStrict
//
function SignStrict(X: Single): Integer;
begin
  if X < 0 then
    result := -1
  else
    result := 1
end;

// ScaleAndRound
//
function ScaleAndRound(i: Integer; var S: Single): Integer;
begin
{$HINTS OFF}
  result := Round(i * S);
{$HINTS ON}
end;

// IsInRange (single)
//
function IsInRange(const X, a, b: Single): Boolean;
begin
  if a < b then
    result := (a <= X) and (X <= b)
  else
    result := (b <= X) and (X <= a);
end;

// IsInRange (double)
//
function IsInRange(const X, a, b: Double): Boolean;
begin
  if a < b then
    result := (a <= X) and (X <= b)
  else
    result := (b <= X) and (X <= a);
end;

// IsInCube (affine)
//
function IsInCube(const p, d: TAffineVector): Boolean; overload;
begin
  result := ((p.X >= -d.X) and (p.X <= d.X)) and
    ((p.Y >= -d.Y) and (p.Y <= d.Y)) and
    ((p.Z >= -d.Z) and (p.Z <= d.Z));
end;

// IsInCube (hmg)
//
function IsInCube(const p, d: TVector): Boolean; overload;
begin
  result := ((p.X >= -d.X) and (p.X <= d.X)) and
    ((p.Y >= -d.Y) and (p.Y <= d.Y)) and
    ((p.Z >= -d.Z) and (p.Z <= d.Z));
end;

// MinFloat (single)
//
function MinFloat(values: PSingleArray; nbItems: Integer): Single;
var
  i, k: Integer;
begin
  if nbItems > 0 then
  begin
    k := 0;
    for i := 1 to nbItems - 1 do
      if values^[i] < values^[k] then
        k := i;
    result := values^[k];
  end
  else
    result := 0;
end;

// MinFloat (double)
//
function MinFloat(values: PDoubleArray; nbItems: Integer): Double;
var
  i, k: Integer;
begin
  if nbItems > 0 then
  begin
    k := 0;
    for i := 1 to nbItems - 1 do
      if values^[i] < values^[k] then
        k := i;
    result := values^[k];
  end
  else
    result := 0;
end;

// MinFloat (extended)
//
function MinFloat(values: PExtendedArray; nbItems: Integer): Extended;
var
  i, k: Integer;
begin
  if nbItems > 0 then
  begin
    k := 0;
    for i := 1 to nbItems - 1 do
      if values^[i] < values^[k] then
        k := i;
    result := values^[k];
  end
  else
    result := 0;
end;

// MinFloat (array)
//
function MinFloat(const V: array of Single): Single;
var
  i: Integer;
begin
  if Length(V) > 0 then
  begin
    result := V[0];
    for i := 1 to High(V) do
      if V[i] < result then
        result := V[i];
  end
  else
    result := 0;
end;

// MinFloat (single 2)
//
{$IFDEF GLS_ASM}
function MinFloat(const V1, V2: Single): Single;
asm
  fld  DWORD PTR[V1]
  fld  DWORD PTR[V2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MinFloat(const V1, V2: Single): Single;
begin
  if V1 < V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

// MinFloat (double 2)
//
{$IFDEF GLS_ASM}
function MinFloat(const V1, V2: Double): Double;
asm
  fld  DWORD PTR[v1]
  fld  DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MinFloat(const V1, V2: Double): Double;
begin
  if V1 < V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

{$IFDEF GLS_PLATFORM_HAS_EXTENDED}

// MinFloat (extended 2)
//
{$IFDEF GLS_ASM}
function MinFloat(const V1, V2: Extended): Extended;
asm
  fld  DWORD PTR[v1]
  fld  DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MinFloat(const V1, V2: Extended): Extended;
begin
  if V1 < V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

{$ENDIF GLS_PLATFORM_HAS_EXTENDED}

// MinFloat
//
{$IFDEF GLS_ASM}
function MinFloat(const V1, V2, V3: Single): Single;
asm
  fld  DWORD PTR[V1]
  fld  DWORD PTR[V2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
  fld   DWORD PTR[V3]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MinFloat(const V1, V2, V3: Single): Single;
begin
  if V1 <= V2 then
    if V1 <= V3 then
      result := V1
    else if V3 <= V2 then
      result := V3
    else
      result := V2
  else if V2 <= V3 then
    result := V2
  else if V3 <= V1 then
    result := V3
  else
    result := V1;
end;
{$ENDIF}

// MinFloat (double)
//
{$IFDEF GLS_ASM}
function MinFloat(const V1, V2, V3: Double): Double;
asm
  fld  DWORD PTR[v1]
  fld  DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
  fld  DWORD PTR[v3]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
end;
{$ELSE}

function MinFloat(const V1, V2, V3: Double): Double;
begin
  if V1 <= V2 then
    if V1 <= V3 then
      result := V1
    else if V3 <= V2 then
      result := V3
    else
      result := V2
  else if V2 <= V3 then
    result := V2
  else if V3 <= V1 then
    result := V3
  else
    result := V1;
end;
{$ENDIF}

{$IFDEF GLS_PLATFORM_HAS_EXTENDED}

// MinFloat
//
{$IFDEF GLS_ASM}
function MinFloat(const V1, V2, V3: Extended): Extended;
asm
  fld  DWORD PTR[v1]
  fld  DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
  fld  DWORD PTR[v3]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DB,$C1                 /// fcmovnb st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MinFloat(const V1, V2, V3: Extended): Extended;
begin
  if V1 <= V2 then
    if V1 <= V3 then
      result := V1
    else if V3 <= V2 then
      result := V3
    else
      result := V2
  else if V2 <= V3 then
    result := V2
  else if V3 <= V1 then
    result := V3
  else
    result := V1;
{$ENDIF}
{$ENDIF GLS_PLATFORM_HAS_EXTENDED}

// MaxFloat (single)
//
function MaxFloat(values: PSingleArray; nbItems: Integer): Single; overload;
var
  i, k: Integer;
begin
  if nbItems > 0 then
  begin
    k := 0;
    for i := 1 to nbItems - 1 do
      if values^[i] > values^[k] then
        k := i;
    result := values^[k];
  end
  else
    result := 0;
end;

// MaxFloat (double)
//
function MaxFloat(values: PDoubleArray; nbItems: Integer): Double; overload;
var
  i, k: Integer;
begin
  if nbItems > 0 then
  begin
    k := 0;
    for i := 1 to nbItems - 1 do
      if values^[i] > values^[k] then
        k := i;
    result := values^[k];
  end
  else
    result := 0;
end;

// MaxFloat (extended)
//
function MaxFloat(values: PExtendedArray; nbItems: Integer): Extended; overload;
var
  i, k: Integer;
begin
  if nbItems > 0 then
  begin
    k := 0;
    for i := 1 to nbItems - 1 do
      if values^[i] > values^[k] then
        k := i;
    result := values^[k];
  end
  else
    result := 0;
end;

// MaxFloat
//
function MaxFloat(const V: array of Single): Single;
var
  i: Integer;
begin
  if Length(V) > 0 then
  begin
    result := V[0];
    for i := 1 to High(V) do
      if V[i] > result then
        result := V[i];
  end
  else
    result := 0;
end;

// MaxFloat
//
{$IFDEF GLS_ASM}
function MaxFloat(const V1, V2: Single): Single;
asm
  fld  DWORD PTR[v1]
  fld  DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DA,$C1                 /// fcmovb  st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MaxFloat(const V1, V2: Single): Single;
begin
  if V1 > V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}
// MaxFloat
//
{$IFDEF GLS_ASM}
function MaxFloat(const V1, V2: Double): Double;
asm
  fld  DWORD PTR[v1]
  fld  DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DA,$C1                 /// fcmovb  st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MaxFloat(const V1, V2: Double): Double;
begin
  if V1 > V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

{$IFDEF GLS_PLATFORM_HAS_EXTENDED}

// MaxFloat
//
{$IFDEF GLS_ASM}
function MaxFloat(const V1, V2: Extended): Extended;
asm
  fld DWORD PTR[v1]
  fld DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DA,$C1                 /// fcmovb  st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MaxFloat(const V1, V2: Extended): Extended;
begin
  if V1 > V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}
{$ENDIF GLS_PLATFORM_HAS_EXTENDED}

// MaxFloat
//
{$IFDEF GLS_ASM}
function MaxFloat(const V1, V2, V3: Single): Single;
asm
  fld DWORD PTR[v1]
  fld DWORD PTR[v2]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DA,$C1                 /// fcmovb  st(0), st(1)
  ffree   st(1)
  fld DWORD PTR[v3]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DA,$C1                 /// fcmovb  st(0), st(1)
  ffree   st(1)
end;
{$ELSE}
function MaxFloat(const V1, V2, V3: Single): Single;
begin
  if V1 >= V2 then
    if V1 >= V3 then
      result := V1
    else if V3 >= V2 then
      result := V3
    else
      result := V2
  else if V2 >= V3 then
    result := V2
  else if V3 >= V1 then
    result := V3
  else
    result := V1;
end;
{$ENDIF}

// MaxFloat
//
{$IFDEF GLS_ASM}
function MaxFloat(const V1, V2, V3: Double): Double;
asm
  fld DWORD PTR[v1]
  fld DWORD PTR[v2]
  fld DWORD PTR[v3]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DA,$C1                 /// fcmovb  st(0), st(1)
  db $DB,$F2                 /// fcomi   st(0), st(2)
  db $DA,$C2                 /// fcmovb  st(0), st(2)
  ffree   st(2)
  ffree   st(1)
end;
{$ELSE}
function MaxFloat(const V1, V2, V3: Double): Double;
begin
  if V1 >= V2 then
    if V1 >= V3 then
      result := V1
    else if V3 >= V2 then
      result := V3
    else
      result := V2
  else if V2 >= V3 then
    result := V2
  else if V3 >= V1 then
    result := V3
  else
    result := V1;
end;
{$ENDIF}

{$IFDEF GLS_PLATFORM_HAS_EXTENDED}

// MaxFloat
//
{$IFDEF GLS_ASM}
function MaxFloat(const V1, V2, V3: Extended): Extended;
asm
  fld DWORD PTR[v1]
  fld DWORD PTR[v2]
  fld DWORD PTR[v3]
  db $DB,$F1                 /// fcomi   st(0), st(1)
  db $DA,$C1                 /// fcmovb  st(0), st(1)
  db $DB,$F2                 /// fcomi   st(0), st(2)
  db $DA,$C2                 /// fcmovb  st(0), st(2)
  ffree   st(2)
  ffree   st(1)
end;
{$ELSE}
function MaxFloat(const V1, V2, V3: Extended): Extended;
begin
  if V1 >= V2 then
    if V1 >= V3 then
      result := V1
    else if V3 >= V2 then
      result := V3
    else
      result := V2
  else if V2 >= V3 then
    result := V2
  else if V3 >= V1 then
    result := V3
  else
    result := V1;
end;
{$ENDIF}
{$ENDIF GLS_PLATFORM_HAS_EXTENDED}

// MinInteger (2 int)
//
{$IFDEF GLS_ASM}
function MinInteger(const V1, V2: Integer): Integer;
asm
  cmp   eax, edx
  db $0F,$4F,$C2             /// cmovg eax, edx
end;
{$ELSE}
function MinInteger(const V1, V2: Integer): Integer;
begin
  if V1 < V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

// MinInteger (2 card)
//
{$IFDEF GLS_ASM}
function MinInteger(const V1, V2: Cardinal): Cardinal;
asm
  cmp   eax, edx
  db $0F,$47,$C2             /// cmova eax, edx
end;
{$ELSE}
function MinInteger(const V1, V2: Cardinal): Cardinal;
begin
  if V1 < V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

// MinInteger
//
function MinInteger(const V1, V2, V3: Integer): Integer;
begin
  if V1 <= V2 then
    if V1 <= V3 then
      result := V1
    else if V3 <= V2 then
      result := V3
    else
      result := V2
  else if V2 <= V3 then
    result := V2
  else if V3 <= V1 then
    result := V3
  else
    result := V1;
end;

// MinInteger
//
function MinInteger(const V1, V2, V3: Cardinal): Cardinal;
begin
  if V1 <= V2 then
    if V1 <= V3 then
      result := V1
    else if V3 <= V2 then
      result := V3
    else
      result := V2
  else if V2 <= V3 then
    result := V2
  else if V3 <= V1 then
    result := V3
  else
    result := V1;
end;

// MaxInteger (2 int)
//
{$IFDEF GLS_ASM}
function MaxInteger(const V1, V2: Integer): Integer;
asm
  cmp   eax, edx
  db $0F,$4C,$C2             /// cmovl eax, edx

end;
{$ELSE}
function MaxInteger(const V1, V2: Integer): Integer;
begin
  if V1 > V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

// MaxInteger (2 card)
//
{$IFDEF GLS_ASM}
function MaxInteger(const V1, V2: Cardinal): Cardinal;
asm
  cmp   eax, edx
  db $0F,$42,$C2             /// cmovb eax, edx
end;
{$ELSE}
function MaxInteger(const V1, V2: Cardinal): Cardinal;
begin
  if V1 > V2 then
    result := V1
  else
    result := V2;
end;
{$ENDIF}

// MaxInteger
//
function MaxInteger(const V1, V2, V3: Integer): Integer;
begin
  if V1 >= V2 then
    if V1 >= V3 then
      result := V1
    else if V3 >= V2 then
      result := V3
    else
      result := V2
  else if V2 >= V3 then
    result := V2
  else if V3 >= V1 then
    result := V3
  else
    result := V1;
end;

// MaxInteger
//
function MaxInteger(const V1, V2, V3: Cardinal): Cardinal;
begin
  if V1 >= V2 then
    if V1 >= V3 then
      result := V1
    else if V3 >= V2 then
      result := V3
    else
      result := V2
  else if V2 >= V3 then
    result := V2
  else if V3 >= V1 then
    result := V3
  else
    result := V1;
end;

function ClampInteger(const value, min, max: Integer): Integer;
begin
  result := MinInteger(MaxInteger(value, min), max);
end;

function ClampInteger(const value, min, max: Cardinal): Cardinal;
begin
  result := MinInteger(MaxInteger(value, min), max);
end;

// TriangleArea
//
function TriangleArea(const p1, p2, p3: TAffineVector): Single;
begin
  result := 0.5 * VectorLength(VectorCrossProduct(VectorSubtract(p2, p1),
    VectorSubtract(p3, p1)));
end;

// PolygonArea
//
function PolygonArea(const p: PAffineVectorArray; nSides: Integer): Single;
var
  r: TAffineVector;
  i: Integer;
  p1, p2, p3: PAffineVector;
begin
  result := 0;
  if nSides > 2 then
  begin
    RstVector(r);
    p1 := @p[0];
    p2 := @p[1];
    for i := 2 to nSides - 1 do
    begin
      p3 := @p[i];
      AddVector(r, VectorCrossProduct(VectorSubtract(p2^, p1^),
        VectorSubtract(p3^, p1^)));
      p2 := p3;
    end;
    result := VectorLength(r) * 0.5;
  end;
end;

// TriangleSignedArea
//
function TriangleSignedArea(const p1, p2, p3: TAffineVector): Single;
begin
  result := 0.5 * ((p2.X - p1.X) * (p3.Y - p1.Y) -
    (p3.X - p1.X) * (p2.Y - p1.Y));
end;

// PolygonSignedArea
//
function PolygonSignedArea(const p: PAffineVectorArray;
  nSides: Integer): Single;
var
  i: Integer;
  p1, p2, p3: PAffineVector;
begin
  result := 0;
  if nSides > 2 then
  begin
    p1 := @(p^[0]);
    p2 := @(p^[1]);
    for i := 2 to nSides - 1 do
    begin
      p3 := @(p^[i]);
      result := result + (p2^.X - p1^.X) * (p3^.Y - p1^.Y) -
        (p3^.X - p1^.X) * (p2^.Y - p1^.Y);
      p2 := p3;
    end;
    result := result * 0.5;
  end;
end;

// ScaleFloatArray (raw)
//
procedure ScaleFloatArray(values: PSingleArray; nb: Integer;
  var factor: Single);
var
  i: Integer;
begin
  for i := 0 to nb - 1 do
    values^[i] := values^[i] * factor;
end;

// ScaleFloatArray (array)
//
procedure ScaleFloatArray(var values: TSingleArray; factor: Single);
begin
  if Length(values) > 0 then
    ScaleFloatArray(@values[0], Length(values), factor);
end;

// OffsetFloatArray (raw)
//
procedure OffsetFloatArray(values: PSingleArray; nb: Integer;
  var delta: Single);
var
  i: Integer;
begin
  for i := 0 to nb - 1 do
    values^[i] := values^[i] + delta;
end;

// ScaleFloatArray (array)
//
procedure OffsetFloatArray(var values: array of Single; delta: Single);
begin
  if Length(values) > 0 then
    ScaleFloatArray(@values[0], Length(values), delta);
end;

// OffsetFloatArray (raw, raw)
//
{$IFDEF GLS_ASM}
procedure OffsetFloatArray(valuesDest, valuesDelta: PSingleArray; nb: Integer);
asm
  test  ecx, ecx
  jz    @@End

@@FPULoop:
  dec   ecx
  fld   dword ptr [eax+ecx*4]
  fadd  dword ptr [edx+ecx*4]
  fstp  dword ptr [eax+ecx*4]
  jnz   @@FPULoop

@@End:
end;
  {$ELSE}
procedure OffsetFloatArray(valuesDest, valuesDelta: PSingleArray; nb: Integer);
var
  i: Integer;
begin
  for i := 0 to nb - 1 do
    valuesDest^[i] := valuesDest^[i] + valuesDelta^[i];
end;
{$ENDIF}

// MaxXYZComponent
//
function MaxXYZComponent(const V: TVector): Single; overload;
begin
  result := MaxFloat(V.X, V.Y, V.Z);
end;

// MaxXYZComponent
//
function MaxXYZComponent(const V: TAffineVector): Single; overload;
begin
  result := MaxFloat(V.X, V.Y, V.Z);
end;

// MinXYZComponent
//
function MinXYZComponent(const V: TVector): Single; overload;
begin
  if V.X <= V.Y then
    if V.X <= V.Z then
      result := V.X
    else if V.Z <= V.Y then
      result := V.Z
    else
      result := V.Y
  else if V.Y <= V.Z then
    result := V.Y
  else if V.Z <= V.X then
    result := V.Z
  else
    result := V.X;
end;

// MinXYZComponent
//
function MinXYZComponent(const V: TAffineVector): Single; overload;
begin
  result := MinFloat(V.X, V.Y, V.Z);
end;

// MaxAbsXYZComponent
//
function MaxAbsXYZComponent(V: TVector): Single;
begin
  AbsVector(V);
  result := MaxXYZComponent(V);
end;

// MinAbsXYZComponent
//
function MinAbsXYZComponent(V: TVector): Single;
begin
  AbsVector(V);
  result := MinXYZComponent(V);
end;

// MaxVector (hmg)
//
procedure MaxVector(var V: TVector; const V1: TVector);
begin
  if V1.X > V.X then
    V.X := V1.X;
  if V1.Y > V.Y then
    V.Y := V1.Y;
  if V1.Z > V.Z then
    V.Z := V1.Z;
  if V1.W > V.W then
    V.W := V1.W;
end;

// MaxVector (affine)
//
procedure MaxVector(var V: TAffineVector; const V1: TAffineVector); overload;
begin
  if V1.X > V.X then
    V.X := V1.X;
  if V1.Y > V.Y then
    V.Y := V1.Y;
  if V1.Z > V.Z then
    V.Z := V1.Z;
end;

// MinVector (hmg)
//
procedure MinVector(var V: TVector; const V1: TVector);
begin
  if V1.X < V.X then
    V.X := V1.X;
  if V1.Y < V.Y then
    V.Y := V1.Y;
  if V1.Z < V.Z then
    V.Z := V1.Z;
  if V1.W < V.W then
    V.W := V1.W;
end;

// MinVector (affine)
//
procedure MinVector(var V: TAffineVector; const V1: TAffineVector);
begin
  if V1.X < V.X then
    V.X := V1.X;
  if V1.Y < V.Y then
    V.Y := V1.Y;
  if V1.Z < V.Z then
    V.Z := V1.Z;
end;

// SortArrayAscending (extended)
//
procedure SortArrayAscending(var a: array of Extended);
var
  i, J, M: Integer;
  buf: Extended;
begin
  for i := Low(a) to High(a) - 1 do
  begin
    M := i;
    for J := i + 1 to High(a) do
      if a[J] < a[M] then
        M := J;
    if M <> i then
    begin
      buf := a[M];
      a[M] := a[i];
      a[i] := buf;
    end;
  end;
end;

// ClampValue (min-max)
//
function ClampValue(const aValue, aMin, aMax: Single): Single;
// begin
begin // 134
  if aValue < aMin then
    result := aMin
  else if aValue > aMax then
    result := aMax
  else
    result := aValue;
end;

// ClampValue (min-)
//
function ClampValue(const aValue, aMin: Single): Single;
begin
  if aValue < aMin then
    result := aMin
  else
    result := aValue;
end;

// MakeAffineDblVector
//
function MakeAffineDblVector(var V: array of Double): TAffineDblVector;
begin
  result.X := V[0];
  result.Y := V[1];
  result.Z := V[2];
end;

// MakeDblVector
//
function MakeDblVector(var V: array of Double): THomogeneousDblVector;
begin
  result.X := V[0];
  result.Y := V[1];
  result.Z := V[2];
  result.W := V[3];
end;

// PointInPolygon
//
function PointInPolygon(var xp, yp: array of Single; X, Y: Single): Boolean;
// The code below is from Wm. Randolph Franklin <wrf@ecse.rpi.edu>
// with some minor modifications for speed.  It returns 1 for strictly
// interior points, 0 for strictly exterior, and 0 or 1 for points on
// the boundary.
var
  i, J: Integer;
begin
  result := False;
  if High(xp) = High(yp) then
  begin
    J := High(xp);
    for i := 0 to High(xp) do
    begin
      if ((((yp[i] <= Y) and (Y < yp[J])) or ((yp[J] <= Y) and (Y < yp[i]))) and
        (X < (xp[J] - xp[i]) * (Y - yp[i]) / (yp[J] - yp[i]) + xp[i])) then
        result := not result;
      J := i;
    end;
  end;
end;

// IsPointInPolygon
//
function IsPointInPolygon(Polygon: array of TPoint; p: TPoint): Boolean;
var
  a: array of TPoint;
  n, i: Integer;
  inside: Boolean;
begin
  n := High(Polygon) + 1;
  SetLength(a, n + 2);
  a[0] := p;
  for i := 1 to n do
    a[i] := Polygon[i - 1];
  a[n + 1] := a[0];
  inside := True;

  for i := 1 to n do
  begin
    if (a[0].Y > a[i].Y) xor (a[0].Y <= a[i + 1].Y) then
      Continue;
    if (a[0].X - a[i].X) < ((a[0].Y - a[i].Y) * (a[i + 1].X - a[i].X) /
      (a[i + 1].Y - a[i].Y)) then
      inside := not inside;
  end;
  inside := not inside;

  result := inside;
end;

// DivMod
//
procedure DivMod(Dividend: Integer; Divisor: Word; var result, Remainder: Word);
begin
  result := Dividend div Divisor;
  Remainder := Dividend mod Divisor;
end;

// ConvertRotation
//
function ConvertRotation(const Angles: TAffineVector): TVector;

{ Rotation of the Angle t about the axis (X, Y, Z) is given by:

  | X^2 + (1-X^2) Cos(t),    XY(1-Cos(t))  +  Z Sin(t), XZ(1-Cos(t))-Y Sin(t) |
  M = | XY(1-Cos(t))-Z Sin(t), Y^2 + (1-Y^2) Cos(t),      YZ(1-Cos(t)) + X Sin(t) |
  | XZ(1-Cos(t)) + Y Sin(t), YZ(1-Cos(t))-X Sin(t),   Z^2 + (1-Z^2) Cos(t)    |

  Rotation about the three axes (Angles a1, a2, a3) can be represented as
  the product of the individual rotation matrices:

  | 1  0       0       | | Cos(a2) 0 -Sin(a2) | |  Cos(a3) Sin(a3) 0 |
  | 0  Cos(a1) Sin(a1) | * | 0       1  0       | * | -Sin(a3) Cos(a3) 0 |
  | 0 -Sin(a1) Cos(a1) | | Sin(a2) 0  Cos(a2) | |  0       0       1 |
  Mx                       My                     Mz

  We now want to solve for X, Y, Z, and t given 9 equations in 4 unknowns.
  Using the diagonal elements of the two matrices, we get:

  X^2 + (1-X^2) Cos(t) = M[0][0]
  Y^2 + (1-Y^2) Cos(t) = M[1][1]
  Z^2 + (1-Z^2) Cos(t) = M[2][2]

  Adding the three equations, we get:

  X^2  +  Y^2  +  Z^2 - (M[0][0]  +  M[1][1]  +  M[2][2]) =
  - (3 - X^2 - Y^2 - Z^2) Cos(t)

  Since (X^2  +  Y^2  +  Z^2) = 1, we can rewrite as:

  Cos(t) = (1 - (M[0][0]  +  M[1][1]  +  M[2][2])) / 2

  Solving for t, we get:

  t = Acos(((M[0][0]  +  M[1][1]  +  M[2][2]) - 1) / 2)

  We can substitute t into the equations for X^2, Y^2, and Z^2 above
  to get the values for X, Y, and Z.  To find the proper signs we note
  that:

  2 X Sin(t) = M[1][2] - M[2][1]
  2 Y Sin(t) = M[2][0] - M[0][2]
  2 Z Sin(t) = M[0][1] - M[1][0]
}
var
  Axis1, Axis2: TVector3f;
  M, m1, m2: TMatrix;
  cost, cost1, sint, s1, s2, s3: Single;
  i: Integer;
begin
  // see if we are only rotating about a single Axis
  if Abs(Angles.V[X]) < EPSILON then
  begin
    if Abs(Angles.V[Y]) < EPSILON then
    begin
      SetVector(result, 0, 0, 1, Angles.V[Z]);
      Exit;
    end
    else if Abs(Angles.V[Z]) < EPSILON then
    begin
      SetVector(result, 0, 1, 0, Angles.V[Y]);
      Exit;
    end
  end
  else if (Abs(Angles.V[Y]) < EPSILON) and (Abs(Angles.V[Z]) < EPSILON) then
  begin
    SetVector(result, 1, 0, 0, Angles.V[X]);
    Exit;
  end;

  // make the rotation matrix
  Axis1 := XVector;
  M := CreateRotationMatrix(Axis1, Angles.V[X]);

  Axis2 := YVector;
  m2 := CreateRotationMatrix(Axis2, Angles.V[Y]);
  m1 := MatrixMultiply(M, m2);

  Axis2 := ZVector;
  m2 := CreateRotationMatrix(Axis2, Angles.V[Z]);
  M := MatrixMultiply(m1, m2);

  cost := ((M.X.X + M.Y.Y + M.Z.Z) - 1) / 2;
  if cost < -1 then
    cost := -1
  else if cost > 1 - EPSILON then
  begin
    // Bad Angle - this would cause a crash
    SetVector(result, XHmgVector);
    Exit;
  end;

  cost1 := 1 - cost;
  SetVector(result, Sqrt((M.X.X - cost) / cost1), Sqrt((M.Y.Y - cost) / cost1),
    Sqrt((M.Z.Z - cost) / cost1), ArcCosine(cost));

  sint := 2 * Sqrt(1 - cost * cost); // This is actually 2 Sin(t)

  // Determine the proper signs
  for i := 0 to 7 do
  begin
    if (i and 1) > 1 then
      s1 := -1
    else
      s1 := 1;
    if (i and 2) > 1 then
      s2 := -1
    else
      s2 := 1;
    if (i and 4) > 1 then
      s3 := -1
    else
      s3 := 1;
    if (Abs(s1 * result.V[X] * sint - M.Y.Z + M.Z.Y) < EPSILON2) and
      (Abs(s2 * result.V[Y] * sint - M.Z.X + M.X.Z) < EPSILON2) and
      (Abs(s3 * result.V[Z] * sint - M.X.Y + M.Y.X) < EPSILON2) then
    begin
      // We found the right combination of signs
      result.V[X] := result.V[X] * s1;
      result.V[Y] := result.V[Y] * s2;
      result.V[Z] := result.V[Z] * s3;
      Exit;
    end;
  end;
end;

// QuaternionSlerp
//
function QuaternionSlerp(const QStart, QEnd: TQuaternion; Spin: Integer;
  T: Single): TQuaternion;
var
  beta, // complementary interp parameter
  Theta, // Angle between A and B
  sint, cost, // sine, cosine of theta
  phi: Single; // theta plus spins
  bflip: Boolean; // use negativ t?
begin
  // cosine theta
  cost := VectorAngleCosine(QStart.ImagPart, QEnd.ImagPart);

  // if QEnd is on opposite hemisphere from QStart, use -QEnd instead
  if cost < 0 then
  begin
    cost := -cost;
    bflip := True;
  end
  else
    bflip := False;

  // if QEnd is (within precision limits) the same as QStart,
  // just linear interpolate between QStart and QEnd.
  // Can't do spins, since we don't know what direction to spin.

  if (1 - cost) < EPSILON then
    beta := 1 - T
  else
  begin
    // normal case
    Theta := ArcCosine(cost);
    phi := Theta + Spin * PI;
    sint := Sin(Theta);
    beta := Sin(Theta - T * phi) / sint;
    T := Sin(T * phi) / sint;
  end;

  if bflip then
    T := -T;

  // interpolate
  result.ImagPart.V[X] := beta * QStart.ImagPart.V[X] + T * QEnd.ImagPart.V[X];
  result.ImagPart.V[Y] := beta * QStart.ImagPart.V[Y] + T * QEnd.ImagPart.V[Y];
  result.ImagPart.V[Z] := beta * QStart.ImagPart.V[Z] + T * QEnd.ImagPart.V[Z];
  result.RealPart := beta * QStart.RealPart + T * QEnd.RealPart;
end;

// QuaternionSlerp
//
function QuaternionSlerp(const source, dest: TQuaternion; const T: Single)
  : TQuaternion;
var
  to1: array [0 .. 4] of Single;
  omega, cosom, sinom, scale0, scale1: Extended;
  // t goes from 0 to 1
  // absolute rotations
begin
  // calc cosine
  cosom := source.ImagPart.X * dest.ImagPart.X + source.ImagPart.Y *
    dest.ImagPart.Y + source.ImagPart.Z * dest.ImagPart.Z +
    source.RealPart * dest.RealPart;
  // adjust signs (if necessary)
  if cosom < 0 then
  begin
    cosom := -cosom;
    to1[0] := -dest.ImagPart.X;
    to1[1] := -dest.ImagPart.Y;
    to1[2] := -dest.ImagPart.Z;
    to1[3] := -dest.RealPart;
  end
  else
  begin
    to1[0] := dest.ImagPart.X;
    to1[1] := dest.ImagPart.Y;
    to1[2] := dest.ImagPart.Z;
    to1[3] := dest.RealPart;
  end;
  // calculate coefficients
  if ((1.0 - cosom) > EPSILON2) then
  begin // standard case (slerp)
    omega := ArcCosine(cosom);
    sinom := 1 / Sin(omega);
    scale0 := Sin((1.0 - T) * omega) * sinom;
    scale1 := Sin(T * omega) * sinom;
  end
  else
  begin // "from" and "to" quaternions are very close
    // ... so we can do a linear interpolation
    scale0 := 1.0 - T;
    scale1 := T;
  end;
  // calculate final values
  result.ImagPart.X := scale0 * source.ImagPart.X + scale1 * to1[0];
  result.ImagPart.Y := scale0 * source.ImagPart.Y + scale1 * to1[1];
  result.ImagPart.Z := scale0 * source.ImagPart.Z + scale1 * to1[2];
  result.RealPart := scale0 * source.RealPart + scale1 * to1[3];
  NormalizeQuaternion(result);
end;

// VectorDblToFlt
//
// converts a vector containing double sized values into a vector with single sized values
{$IFDEF GLS_ASM}
function VectorDblToFlt(const V: THomogeneousDblVector): THomogeneousVector;
asm
  FLD  QWORD PTR [EAX]
  FSTP DWORD PTR [EDX]
  FLD  QWORD PTR [EAX + 8]
  FSTP DWORD PTR [EDX + 4]
  FLD  QWORD PTR [EAX + 16]
  FSTP DWORD PTR [EDX + 8]
  FLD  QWORD PTR [EAX + 24]
  FSTP DWORD PTR [EDX + 12]
end;
{$ELSE}
function VectorDblToFlt(const V: THomogeneousDblVector): THomogeneousVector;
begin
{$HINTS OFF}
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
  result.W := V.W;
{$HINTS ON}
end;
{$ENDIF}

// VectorAffineDblToFlt
//
// converts a vector containing double sized values into a vector with single sized values
{$IFDEF GLS_ASM}
function VectorAffineDblToFlt(const V: TAffineDblVector): TAffineVector;
asm
  FLD  QWORD PTR [EAX]
  FSTP DWORD PTR [EDX]
  FLD  QWORD PTR [EAX + 8]
  FSTP DWORD PTR [EDX + 4]
  FLD  QWORD PTR [EAX + 16]
  FSTP DWORD PTR [EDX + 8]
end;
{$ELSE}
function VectorAffineDblToFlt(const V: TAffineDblVector): TAffineVector;
begin
{$HINTS OFF}
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
{$HINTS ON}
end;
{$ENDIF}

// VectorAffineFltToDbl
//
// converts a vector containing single sized values into a vector with double sized values
{$IFDEF GLS_ASM}
function VectorAffineFltToDbl(const V: TAffineVector): TAffineDblVector;
asm
  FLD  DWORD PTR [EAX]
  FSTP QWORD PTR [EDX]
  FLD  DWORD PTR [EAX + 4]
  FSTP QWORD PTR [EDX + 8]
  FLD  DWORD PTR [EAX + 8]
  FSTP QWORD PTR [EDX + 16]
end;
{$ELSE}
function VectorAffineFltToDbl(const V: TAffineVector): TAffineDblVector;
begin
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
end;
{$ENDIF}

// VectorFltToDbl
//
// converts a vector containing single sized values into a vector with double sized values
{$IFDEF GLS_ASM}
function VectorFltToDbl(const V: TVector): THomogeneousDblVector;
asm
  FLD  DWORD PTR [EAX]
  FSTP QWORD PTR [EDX]
  FLD  DWORD PTR [EAX + 4]
  FSTP QWORD PTR [EDX + 8]
  FLD  DWORD PTR [EAX + 8]
  FSTP QWORD PTR [EDX + 16]
  FLD  DWORD PTR [EAX + 12]
  FSTP QWORD PTR [EDX + 24]
end;
{$ELSE}
function VectorFltToDbl(const V: TVector): THomogeneousDblVector;
begin
  result.X := V.X;
  result.Y := V.Y;
  result.Z := V.Z;
  result.W := V.W;
end;
{$ENDIF}

// ----------------- coordinate system manipulation functions -----------------------------------------------------------

// Turn (Y axis)
//
function Turn(const Matrix: TMatrix; angle: Single): TMatrix;
begin
  result := MatrixMultiply(Matrix,
    CreateRotationMatrix(AffineVectorMake(Matrix.Y.X, Matrix.Y.Y,
    Matrix.Y.Z), angle));
end;

// Turn (direction)
//
function Turn(const Matrix: TMatrix; const MasterUp: TAffineVector;
  angle: Single): TMatrix;
begin
  result := MatrixMultiply(Matrix, CreateRotationMatrix(MasterUp, angle));
end;

// Pitch (X axis)
//
function Pitch(const Matrix: TMatrix; angle: Single): TMatrix;
begin
  result := MatrixMultiply(Matrix,
    CreateRotationMatrix(AffineVectorMake(Matrix.X.X, Matrix.X.Y,
    Matrix.X.Z), angle));
end;

// Pitch (direction)
//
function Pitch(const Matrix: TMatrix; const MasterRight: TAffineVector;
  angle: Single): TMatrix; overload;
begin
  result := MatrixMultiply(Matrix, CreateRotationMatrix(MasterRight, angle));
end;

// Roll (Z axis)
//
function Roll(const Matrix: TMatrix; angle: Single): TMatrix;
begin
  result := MatrixMultiply(Matrix,
    CreateRotationMatrix(AffineVectorMake(Matrix.Z.X, Matrix.Z.Y,
    Matrix.Z.Z), angle));
end;

// Roll (direction)
//
function Roll(const Matrix: TMatrix; const MasterDirection: TAffineVector;
  angle: Single): TMatrix; overload;
begin
  result := MatrixMultiply(Matrix,
    CreateRotationMatrix(MasterDirection, angle));
end;

// RayCastPlaneIntersect (plane defined by point+normal)
//
function RayCastPlaneIntersect(const rayStart, rayVector: TVector;
  const planePoint, planeNormal: TVector;
  intersectPoint: PVector = nil): Boolean;
var
  sp: TVector;
  T, d: Single;
begin
  d := VectorDotProduct(rayVector, planeNormal);
  result := ((d > EPSILON2) or (d < -EPSILON2));
  if result and Assigned(intersectPoint) then
  begin
    VectorSubtract(planePoint, rayStart, sp);
    d := 1 / d; // will keep one FPU unit busy during dot product calculation
    T := VectorDotProduct(sp, planeNormal) * d;
    if T > 0 then
      VectorCombine(rayStart, rayVector, T, intersectPoint^)
    else
      result := False;
  end;
end;

// RayCastPlaneXZIntersect
//
function RayCastPlaneXZIntersect(const rayStart, rayVector: TVector;
  const planeY: Single; intersectPoint: PVector = nil): Boolean;
var
  T: Single;
begin
  if rayVector.Y = 0 then
    result := False
  else
  begin
    T := (rayStart.Y - planeY) / rayVector.Y;
    if T < 0 then
    begin
      if Assigned(intersectPoint) then
        VectorCombine(rayStart, rayVector, T, intersectPoint^);
      result := True;
    end
    else
      result := False;
  end;
end;

// RayCastTriangleIntersect
//
function RayCastTriangleIntersect(const rayStart, rayVector: TVector;
  const p1, p2, p3: TAffineVector; intersectPoint: PVector = nil;
  intersectNormal: PVector = nil): Boolean;
var
  pvec: TAffineVector;
  V1, V2, qvec, tvec: TVector;
  T, u, V, det, invDet: Single;
begin
  VectorSubtract(p2, p1, V1);
  VectorSubtract(p3, p1, V2);
  VectorCrossProduct(rayVector, V2, pvec);
  det := VectorDotProduct(V1, pvec);
  if ((det < EPSILON2) and (det > -EPSILON2)) then
  begin // vector is parallel to triangle's plane
    result := False;
    Exit;
  end;
  invDet := cOne / det;
  VectorSubtract(rayStart, p1, tvec);
  u := VectorDotProduct(tvec, pvec) * invDet;
  if (u < 0) or (u > 1) then
    result := False
  else
  begin
    qvec := VectorCrossProduct(tvec, V1);
    V := VectorDotProduct(rayVector, qvec) * invDet;
    result := (V >= 0) and (u + V <= 1);
    if result then
    begin
      T := VectorDotProduct(V2, qvec) * invDet;
      if T > 0 then
      begin
        if intersectPoint <> nil then
          VectorCombine(rayStart, rayVector, T, intersectPoint^);
        if intersectNormal <> nil then
          VectorCrossProduct(V1, V2, intersectNormal^);
      end
      else
        result := False;
    end;
  end;
end;

// RayCastMinDistToPoint
//
function RayCastMinDistToPoint(const rayStart, rayVector: TVector;
  const point: TVector): Single;
var
  proj: Single;
begin
  proj := PointProject(point, rayStart, rayVector);
  if proj <= 0 then
    proj := 0; // rays don't go backward!
  result := VectorDistance(point, VectorCombine(rayStart, rayVector, 1, proj));
end;

// RayCastIntersectsSphere
//
function RayCastIntersectsSphere(const rayStart, rayVector: TVector;
  const sphereCenter: TVector; const SphereRadius: Single): Boolean;
var
  proj: Single;
begin
  proj := PointProject(sphereCenter, rayStart, rayVector);
  if proj <= 0 then
    proj := 0; // rays don't go backward!
  result := (VectorDistance2(sphereCenter, VectorCombine(rayStart, rayVector, 1,
    proj)) <= Sqr(SphereRadius));
end;

// RayCastSphereIntersect
//
function RayCastSphereIntersect(const rayStart, rayVector: TVector;
  const sphereCenter: TVector; const SphereRadius: Single;
  var i1, i2: TVector): Integer;
var
  proj, d2: Single;
  id2: Integer;
  projPoint: TVector;
begin
  proj := PointProject(sphereCenter, rayStart, rayVector);
  VectorCombine(rayStart, rayVector, proj, projPoint);
  d2 := SphereRadius * SphereRadius - VectorDistance2(sphereCenter, projPoint);
  id2 := PInteger(@d2)^;
  if id2 >= 0 then
  begin
    if id2 = 0 then
    begin
      if PInteger(@proj)^ > 0 then
      begin
        VectorCombine(rayStart, rayVector, proj, i1);
        result := 1;
        Exit;
      end;
    end
    else if id2 > 0 then
    begin
      d2 := Sqrt(d2);
      if proj >= d2 then
      begin
        VectorCombine(rayStart, rayVector, proj - d2, i1);
        VectorCombine(rayStart, rayVector, proj + d2, i2);
        result := 2;
        Exit;
      end
      else if proj + d2 >= 0 then
      begin
        VectorCombine(rayStart, rayVector, proj + d2, i1);
        result := 1;
        Exit;
      end;
    end;
  end;
  result := 0;
end;

// RayCastBoxIntersect
//
function RayCastBoxIntersect(const rayStart, rayVector, aMinExtent,
  aMaxExtent: TAffineVector; intersectPoint: PAffineVector = nil): Boolean;
var
  i, planeInd: Integer;
  ResAFV, MaxDist, plane: TAffineVector;
  isMiddle: array [0 .. 2] of Boolean;
begin
  // Find plane.
  result := True;
  for i := 0 to 2 do
    if rayStart.V[i] < aMinExtent.V[i] then
    begin
      plane.V[i] := aMinExtent.V[i];
      isMiddle[i] := False;
      result := False;
    end
    else if rayStart.V[i] > aMaxExtent.V[i] then
    begin
      plane.V[i] := aMaxExtent.V[i];
      isMiddle[i] := False;
      result := False;
    end
    else
    begin
      isMiddle[i] := True;
    end;
  if result then
  begin
    // rayStart inside box.
    if intersectPoint <> nil then
      intersectPoint^ := rayStart;
  end
  else
  begin
    // Distance to plane.
    planeInd := 0;
    for i := 0 to 2 do
      if isMiddle[i] or (rayVector.V[i] = 0) then
        MaxDist.V[i] := -1
      else
      begin
        MaxDist.V[i] := (plane.V[i] - rayStart.V[i]) / rayVector.V[i];
        if MaxDist.V[i] > 0 then
        begin
          if MaxDist.V[planeInd] < MaxDist.V[i] then
            planeInd := i;
          result := True;
        end;
      end;
    // Inside box ?
    if result then
    begin
      for i := 0 to 2 do
        if planeInd = i then
          ResAFV.V[i] := plane.V[i]
        else
        begin
          ResAFV.V[i] := rayStart.V[i] + MaxDist.V[planeInd] * rayVector.V[i];
          result := (ResAFV.V[i] >= aMinExtent.V[i]) and
            (ResAFV.V[i] <= aMaxExtent.V[i]);
          if not result then
            Exit;
        end;
      if intersectPoint <> nil then
        intersectPoint^ := ResAFV;
    end;
  end;
end;

// SphereVisibleRadius
//
function SphereVisibleRadius(distance, radius: Single): Single;
var
  d2, r2, ir, tr: Single;
begin
  d2 := distance * distance;
  r2 := radius * radius;
  ir := Sqrt(d2 - r2);
  tr := (d2 + r2 - Sqr(ir)) / (2 * ir);

  result := Sqrt(r2 + Sqr(tr));
end;

// IntersectLinePlane
//
function IntersectLinePlane(const point, direction: TVector;
  const plane: THmgPlane; intersectPoint: PVector = nil): Integer;
var
  a, b: Extended;
  T: Single;
begin
  a := VectorDotProduct(plane, direction);
  // direction projected to plane normal
  b := PlaneEvaluatePoint(plane, point); // distance to plane
  if a = 0 then
  begin // direction is parallel to plane
    if b = 0 then
      result := -1 // line is inside plane
    else
      result := 0; // line is outside plane
  end
  else
  begin
    if Assigned(intersectPoint) then
    begin
      T := -b / a; // parameter of intersection
      intersectPoint^ := point;
      // calculate intersection = p + t*d
      CombineVector(intersectPoint^, direction, T);
    end;
    result := 1;
  end;
end;

// TriangleBoxIntersect
//
function IntersectTriangleBox(const p1, p2, p3, aMinExtent,
  aMaxExtent: TAffineVector): Boolean;
var
  RayDir, iPoint: TAffineVector;
  BoxDiagPt, BoxDiagPt2, BoxDiagDir, iPnt: TVector;
begin
  // Triangle edge (p2, p1) - Box intersection
  VectorSubtract(p2, p1, RayDir);
  result := RayCastBoxIntersect(p1, RayDir, aMinExtent, aMaxExtent, @iPoint);
  if result then
    result := VectorNorm(VectorSubtract(p1, iPoint)) <
      VectorNorm(VectorSubtract(p1, p2));
  if result then
    Exit;

  // Triangle edge (p3, p1) - Box intersection
  VectorSubtract(p3, p1, RayDir);
  result := RayCastBoxIntersect(p1, RayDir, aMinExtent, aMaxExtent, @iPoint);
  if result then
    result := VectorNorm(VectorSubtract(p1, iPoint)) <
      VectorNorm(VectorSubtract(p1, p3));
  if result then
    Exit;

  // Triangle edge (p2, p3) - Box intersection
  VectorSubtract(p2, p3, RayDir);
  result := RayCastBoxIntersect(p3, RayDir, aMinExtent, aMaxExtent, @iPoint);
  if result then
    result := VectorNorm(VectorSubtract(p3, iPoint)) <
      VectorNorm(VectorSubtract(p3, p2));
  if result then
    Exit;

  // Triangle - Box diagonal 1 intersection
  BoxDiagPt := VectorMake(aMinExtent);
  VectorSubtract(aMaxExtent, aMinExtent, BoxDiagDir);
  result := RayCastTriangleIntersect(BoxDiagPt, BoxDiagDir, p1, p2, p3, @iPnt);
  if result then
    result := VectorNorm(VectorSubtract(BoxDiagPt, iPnt)) <
      VectorNorm(VectorSubtract(aMaxExtent, aMinExtent));
  if result then
    Exit;

  // Triangle - Box diagonal 2 intersection
  BoxDiagPt := VectorMake(aMinExtent.X, aMinExtent.Y, aMaxExtent.Z);
  BoxDiagPt2 := VectorMake(aMaxExtent.X, aMaxExtent.Y, aMinExtent.Z);
  VectorSubtract(BoxDiagPt2, BoxDiagPt, BoxDiagDir);
  result := RayCastTriangleIntersect(BoxDiagPt, BoxDiagDir, p1, p2, p3, @iPnt);
  if result then
    result := VectorNorm(VectorSubtract(BoxDiagPt, iPnt)) <
      VectorNorm(VectorSubtract(BoxDiagPt, BoxDiagPt2));
  if result then
    Exit;

  // Triangle - Box diagonal 3 intersection
  BoxDiagPt := VectorMake(aMinExtent.X, aMaxExtent.Y, aMinExtent.Z);
  BoxDiagPt2 := VectorMake(aMaxExtent.X, aMinExtent.Y, aMaxExtent.Z);
  VectorSubtract(BoxDiagPt, BoxDiagPt, BoxDiagDir);
  result := RayCastTriangleIntersect(BoxDiagPt, BoxDiagDir, p1, p2, p3, @iPnt);
  if result then
    result := VectorLength(VectorSubtract(BoxDiagPt, iPnt)) <
      VectorLength(VectorSubtract(BoxDiagPt, BoxDiagPt));
  if result then
    Exit;

  // Triangle - Box diagonal 4 intersection
  BoxDiagPt := VectorMake(aMaxExtent.X, aMinExtent.Y, aMinExtent.Z);
  BoxDiagPt2 := VectorMake(aMinExtent.X, aMaxExtent.Y, aMaxExtent.Z);
  VectorSubtract(BoxDiagPt, BoxDiagPt, BoxDiagDir);
  result := RayCastTriangleIntersect(BoxDiagPt, BoxDiagDir, p1, p2, p3, @iPnt);
  if result then
    result := VectorLength(VectorSubtract(BoxDiagPt, iPnt)) <
      VectorLength(VectorSubtract(BoxDiagPt, BoxDiagPt));
end;

// IntersectSphereBox
//
function IntersectSphereBox(const SpherePos: TVector;
  const SphereRadius: Single; const BoxMatrix: TMatrix;
  // Up Direction and Right must be normalized!
  // Use CubDepht, CubeHeight and CubeWidth
  // for scale TGLCube.
  const BoxScale: TAffineVector; intersectPoint: PAffineVector = nil;
  normal: PAffineVector = nil; depth: PSingle = nil): Boolean;

  function dDOTByColumn(const V: TAffineVector; const M: TMatrix;
    const aColumn: Integer): Single;
  begin
    result := V.X * M.X.V[aColumn] + V.Y * M.Y.V[aColumn] + V.Z *
      M.Z.V[aColumn];
  end;

  function dDotByRow(const V: TAffineVector; const M: TMatrix;
    const aRow: Integer): Single;
  begin
    // Equal with: Result := VectorDotProduct(v, AffineVectorMake(m[aRow]));
    result := V.X * M.V[aRow].X + V.Y * M.V[aRow].Y + V.Z *
      M.V[aRow].Z;
  end;

  function dDotMatrByColumn(const V: TAffineVector; const M: TMatrix)
    : TAffineVector;
  begin
    result.X := dDOTByColumn(V, M, 0);
    result.Y := dDOTByColumn(V, M, 1);
    result.Z := dDOTByColumn(V, M, 2);
  end;

  function dDotMatrByRow(const V: TAffineVector; const M: TMatrix)
    : TAffineVector;
  begin
    result.X := dDotByRow(V, M, 0);
    result.Y := dDotByRow(V, M, 1);
    result.Z := dDotByRow(V, M, 2);
  end;

var
  tmp, l, T, p, Q, r: TAffineVector;
  FaceDistance, MinDistance, Depth1: Single;
  mini, i: Integer;
  isSphereCenterInsideBox: Boolean;
begin
  // this is easy. get the sphere center `p' relative to the box, and then clip
  // that to the boundary of the box (call that point `q'). if q is on the
  // boundary of the box and |p-q| is <= sphere radius, they touch.
  // if q is inside the box, the sphere is inside the box, so set a contact
  // normal to push the sphere to the closest box face.

  p.X := SpherePos.X - BoxMatrix.W.X;
  p.Y := SpherePos.Y - BoxMatrix.W.Y;
  p.Z := SpherePos.Z - BoxMatrix.W.Z;

  isSphereCenterInsideBox := True;
  for i := 0 to 2 do
  begin
    l.V[i] := 0.5 * BoxScale.V[i];
    T.V[i] := dDotByRow(p, BoxMatrix, i);
    if T.V[i] < -l.V[i] then
    begin
      T.V[i] := -l.V[i];
      isSphereCenterInsideBox := False;
    end
    else if T.V[i] > l.V[i] then
    begin
      T.V[i] := l.V[i];
      isSphereCenterInsideBox := False;
    end;
  end;

  if isSphereCenterInsideBox then
  begin

    MinDistance := l.X - Abs(T.X);
    mini := 0;
    for i := 1 to 2 do
    begin
      FaceDistance := l.V[i] - Abs(T.V[i]);
      if FaceDistance < MinDistance then
      begin
        MinDistance := FaceDistance;
        mini := i;
      end;
    end;

    if intersectPoint <> nil then
      intersectPoint^ := AffineVectorMake(SpherePos);

    if normal <> nil then
    begin
      tmp := NullVector;
      if T.V[mini] > 0 then
        tmp.V[mini] := 1
      else
        tmp.V[mini] := -1;
      normal^ := dDotMatrByRow(tmp, BoxMatrix);
    end;

    if depth <> nil then
      depth^ := MinDistance + SphereRadius;

    result := True;
  end
  else
  begin
    Q := dDotMatrByColumn(T, BoxMatrix);
    r := VectorSubtract(p, Q);
    Depth1 := SphereRadius - VectorLength(r);
    if Depth1 < 0 then
    begin
      result := False;
    end
    else
    begin
      if intersectPoint <> nil then
        intersectPoint^ := VectorAdd(Q, AffineVectorMake(BoxMatrix.W));
      if normal <> nil then
      begin
        normal^ := VectorNormalize(r);
      end;
      if depth <> nil then
        depth^ := Depth1;
      result := True;
    end;
  end;
end;

// ExtractFrustumFromModelViewProjection
//
function ExtractFrustumFromModelViewProjection(const modelViewProj: TMatrix)
  : TFrustum;
begin
  with result do
  begin
    // extract left plane
    pLeft.X := modelViewProj.X.W + modelViewProj.X.X;
    pLeft.Y := modelViewProj.Y.W + modelViewProj.Y.X;
    pLeft.Z := modelViewProj.Z.W + modelViewProj.Z.X;
    pLeft.W := modelViewProj.W.W + modelViewProj.W.X;
    NormalizePlane(pLeft);
    // extract top plane
    pTop.X := modelViewProj.X.W - modelViewProj.X.Y;
    pTop.Y := modelViewProj.Y.W - modelViewProj.Y.Y;
    pTop.Z := modelViewProj.Z.W - modelViewProj.Z.Y;
    pTop.W := modelViewProj.W.W - modelViewProj.W.Y;
    NormalizePlane(pTop);
    // extract right plane
    pRight.X := modelViewProj.X.W - modelViewProj.X.X;
    pRight.Y := modelViewProj.Y.W - modelViewProj.Y.X;
    pRight.Z := modelViewProj.Z.W - modelViewProj.Z.X;
    pRight.W := modelViewProj.W.W - modelViewProj.W.X;
    NormalizePlane(pRight);
    // extract bottom plane
    pBottom.X := modelViewProj.X.W + modelViewProj.X.Y;
    pBottom.Y := modelViewProj.Y.W + modelViewProj.Y.Y;
    pBottom.Z := modelViewProj.Z.W + modelViewProj.Z.Y;
    pBottom.W := modelViewProj.W.W + modelViewProj.W.Y;
    NormalizePlane(pBottom);
    // extract far plane
    pFar.X := modelViewProj.X.W - modelViewProj.X.Z;
    pFar.Y := modelViewProj.Y.W - modelViewProj.Y.Z;
    pFar.Z := modelViewProj.Z.W - modelViewProj.Z.Z;
    pFar.W := modelViewProj.W.W - modelViewProj.W.Z;
    NormalizePlane(pFar);
    // extract near plane
    pNear.X := modelViewProj.X.W + modelViewProj.X.Z;
    pNear.Y := modelViewProj.Y.W + modelViewProj.Y.Z;
    pNear.Z := modelViewProj.Z.W + modelViewProj.Z.Z;
    pNear.W := modelViewProj.W.W + modelViewProj.W.Z;
    NormalizePlane(pNear);
  end;
end;

// IsVolumeClipped
//
function IsVolumeClipped(const objPos: TAffineVector; const objRadius: Single;
  const Frustum: TFrustum): Boolean;
var
  negRadius: Single;
begin
  negRadius := -objRadius;
  result := (PlaneEvaluatePoint(Frustum.pLeft, objPos) < negRadius) or
    (PlaneEvaluatePoint(Frustum.pTop, objPos) < negRadius) or
    (PlaneEvaluatePoint(Frustum.pRight, objPos) < negRadius) or
    (PlaneEvaluatePoint(Frustum.pBottom, objPos) < negRadius) or
    (PlaneEvaluatePoint(Frustum.pNear, objPos) < negRadius) or
    (PlaneEvaluatePoint(Frustum.pFar, objPos) < negRadius);
end;

// IsVolumeClipped
//
function IsVolumeClipped(const objPos: TVector; const objRadius: Single;
  const Frustum: TFrustum): Boolean;
begin
  result := IsVolumeClipped(PAffineVector(@objPos)^, objRadius, Frustum);
end;

// IsVolumeClipped
//
function IsVolumeClipped(const min, max: TAffineVector;
  const Frustum: TFrustum): Boolean;
begin
  // change box to sphere
  result := IsVolumeClipped(VectorScale(VectorAdd(min, max), 0.5),
    VectorDistance(min, max) * 0.5, Frustum);
end;

// MakeParallelProjectionMatrix
//
function MakeParallelProjectionMatrix(const plane: THmgPlane;
  const dir: TVector): TMatrix;
// Based on material from a course by William D. Shoaff (www.cs.fit.edu)
var
  dot, invDot: Single;
begin
  dot := plane.X * dir.X + plane.Y * dir.Y + plane.Z * dir.Z;
  if Abs(dot) < 1E-5 then
  begin
    result := IdentityHmgMatrix;
    Exit;
  end;
  invDot := 1 / dot;

  result.X.X := (plane.Y * dir.Y + plane.Z * dir.Z) * invDot;
  result.Y.X := (-plane.Y * dir.X) * invDot;
  result.Z.X := (-plane.Z * dir.X) * invDot;
  result.W.X := (-plane.W * dir.X) * invDot;

  result.X.Y := (-plane.X * dir.Y) * invDot;
  result.Y.Y := (plane.X * dir.X + plane.Z * dir.Z) * invDot;
  result.Z.Y := (-plane.Z * dir.Y) * invDot;
  result.W.Y := (-plane.W * dir.Y) * invDot;

  result.X.Z := (-plane.X * dir.Z) * invDot;
  result.Y.Z := (-plane.Y * dir.Z) * invDot;
  result.Z.Z := (plane.X * dir.X + plane.Y * dir.Y) * invDot;
  result.W.Z := (-plane.W * dir.Z) * invDot;

  result.X.W := 0;
  result.Y.W := 0;
  result.Z.W := 0;
  result.W.W := 1;
end;

// MakeShadowMatrix
//
function MakeShadowMatrix(const planePoint, planeNormal,
  lightPos: TVector): TMatrix;
var
  planeNormal3, dot: Single;
begin
  // Find the last coefficient by back substitutions
  planeNormal3 := -(planeNormal.X * planePoint.X + planeNormal.Y *
    planePoint.Y + planeNormal.Z * planePoint.Z);
  // Dot product of plane and light position
  dot := planeNormal.X * lightPos.X + planeNormal.Y * lightPos.Y +
    planeNormal.Z * lightPos.Z + planeNormal3 * lightPos.W;
  // Now do the projection
  // First column
  result.X.X := dot - lightPos.X * planeNormal.X;
  result.Y.X := -lightPos.X * planeNormal.Y;
  result.Z.X := -lightPos.X * planeNormal.Z;
  result.W.X := -lightPos.X * planeNormal3;
  // Second column
  result.X.Y := -lightPos.Y * planeNormal.X;
  result.Y.Y := dot - lightPos.Y * planeNormal.Y;
  result.Z.Y := -lightPos.Y * planeNormal.Z;
  result.W.Y := -lightPos.Y * planeNormal3;
  // Third Column
  result.X.Z := -lightPos.Z * planeNormal.X;
  result.Y.Z := -lightPos.Z * planeNormal.Y;
  result.Z.Z := dot - lightPos.Z * planeNormal.Z;
  result.W.Z := -lightPos.Z * planeNormal3;
  // Fourth Column
  result.X.W := -lightPos.W * planeNormal.X;
  result.Y.W := -lightPos.W * planeNormal.Y;
  result.Z.W := -lightPos.W * planeNormal.Z;
  result.W.W := dot - lightPos.W * planeNormal3;
end;

// MakeReflectionMatrix
//
function MakeReflectionMatrix(const planePoint, planeNormal
  : TAffineVector): TMatrix;
var
  pv2: Single;
begin
  // Precalcs
  pv2 := 2 * VectorDotProduct(planePoint, planeNormal);
  // 1st column
  result.X.X := 1 - 2 * Sqr(planeNormal.X);
  result.X.Y := -2 * planeNormal.X * planeNormal.Y;
  result.X.Z := -2 * planeNormal.X * planeNormal.Z;
  result.X.W := 0;
  // 2nd column
  result.Y.X := -2 * planeNormal.Y * planeNormal.X;
  result.Y.Y := 1 - 2 * Sqr(planeNormal.Y);
  result.Y.Z := -2 * planeNormal.Y * planeNormal.Z;
  result.Y.W := 0;
  // 3rd column
  result.Z.X := -2 * planeNormal.Z * planeNormal.X;
  result.Z.Y := -2 * planeNormal.Z * planeNormal.Y;
  result.Z.Z := 1 - 2 * Sqr(planeNormal.Z);
  result.Z.W := 0;
  // 4th column
  result.W.X := pv2 * planeNormal.X;
  result.W.Y := pv2 * planeNormal.Y;
  result.W.Z := pv2 * planeNormal.Z;
  result.W.W := 1;
end;

// PackRotationMatrix
//
function PackRotationMatrix(const mat: TMatrix): TPackedRotationMatrix;
var
  Q: TQuaternion;
const
  cFact: Single = 32767;
begin
  Q := QuaternionFromMatrix(mat);
  NormalizeQuaternion(Q);
{$HINTS OFF}
  if Q.RealPart < 0 then
  begin
    result[0] := Round(-Q.ImagPart.X * cFact);
    result[1] := Round(-Q.ImagPart.Y * cFact);
    result[2] := Round(-Q.ImagPart.Z * cFact);
  end
  else
  begin
    result[0] := Round(Q.ImagPart.X * cFact);
    result[1] := Round(Q.ImagPart.Y * cFact);
    result[2] := Round(Q.ImagPart.Z * cFact);
  end;
{$HINTS ON}
end;

// UnPackRotationMatrix
//
function UnPackRotationMatrix(const packedMatrix
  : TPackedRotationMatrix): TMatrix;
var
  Q: TQuaternion;
const
  cFact: Single = 1 / 32767;
begin
  Q.ImagPart.X := packedMatrix[0] * cFact;
  Q.ImagPart.Y := packedMatrix[1] * cFact;
  Q.ImagPart.Z := packedMatrix[2] * cFact;
  Q.RealPart := 1 - VectorNorm(Q.ImagPart);
  if Q.RealPart < 0 then
    Q.RealPart := 0
  else
    Q.RealPart := Sqrt(Q.RealPart);
  result := QuaternionToMatrix(Q);
end;

// BarycentricCoordinates
//
function BarycentricCoordinates(const V1, V2, V3, p: TAffineVector;
  var u, V: Single): Boolean;
var
  a1, a2: Integer;
  n, e1, e2, pt: TAffineVector;
begin
  // calculate edges
  VectorSubtract(V1, V3, e1);
  VectorSubtract(V2, V3, e2);

  // calculate p relative to v3
  VectorSubtract(p, V3, pt);

  // find the dominant axis
  n := VectorCrossProduct(e1, e2);
  AbsVector(n);
  a1 := 0;
  if n.Y > n.V[a1] then
    a1 := 1;
  if n.Z > n.V[a1] then
    a1 := 2;

  // use dominant axis for projection
  case a1 of
    0:
      begin
        a1 := 1;
        a2 := 2;
      end;
    1:
      begin
        a1 := 0;
        a2 := 2;
      end;
  else // 2:
    a1 := 0;
    a2 := 1;
  end;

  // solve for u and v
  u := (pt.V[a2] * e2.V[a1] - pt.V[a1] * e2.V[a2]) /
    (e1.V[a2] * e2.V[a1] - e1.V[a1] * e2.V[a2]);
  V := (pt.V[a2] * e1.V[a1] - pt.V[a1] * e1.V[a2]) /
    (e2.V[a2] * e1.V[a1] - e2.V[a1] * e1.V[a2]);

  result := (u >= 0) and (V >= 0) and (u + V <= 1);
end;

{ ***************************************************************************** }

// VectorMake functions
// 2x
function Vector2fMake(const X, Y: Single): TVector2f;
begin
  result.X := X;
  result.Y := Y;
end;

function Vector2iMake(const X, Y: Longint): TVector2i;
begin
  result.X := X;
  result.Y := Y;
end;

function Vector2sMake(const X, Y: SmallInt): TVector2s;
begin
  result.X := X;
  result.Y := Y;
end;

function Vector2dMake(const X, Y: Double): TVector2d;
begin
  result.X := X;
  result.Y := Y;
end;

function Vector2bMake(const X, Y: Byte): TVector2b;
begin
  result.X := X;
  result.Y := Y;
end;

// **************

function Vector2fMake(const Vector: TVector3f): TVector2f;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2iMake(const Vector: TVector3i): TVector2i;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2sMake(const Vector: TVector3s): TVector2s;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2dMake(const Vector: TVector3d): TVector2d;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2bMake(const Vector: TVector3b): TVector2b;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

// **********

function Vector2fMake(const Vector: TVector4f): TVector2f;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2iMake(const Vector: TVector4i): TVector2i;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2sMake(const Vector: TVector4s): TVector2s;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2dMake(const Vector: TVector4d): TVector2d;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

function Vector2bMake(const Vector: TVector4b): TVector2b;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
end;

{ ***************************************************************************** }

// 3x
function Vector3fMake(const X, Y, Z: Single): TVector3f;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
end;

function Vector3iMake(const X, Y, Z: Longint): TVector3i;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
end;

function Vector3sMake(const X, Y, Z: SmallInt): TVector3s;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
end;

function Vector3dMake(const X, Y, Z: Double): TVector3d;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
end;

function Vector3bMake(const X, Y, Z: Byte): TVector3b;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
end;

// *******

function Vector3fMake(const Vector: TVector2f; const Z: Single): TVector3f;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
end;

function Vector3iMake(const Vector: TVector2i; const Z: Longint): TVector3i;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
end;

function Vector3sMake(const Vector: TVector2s; const Z: SmallInt): TVector3s;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
end;

function Vector3dMake(const Vector: TVector2d; const Z: Double): TVector3d;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
end;

function Vector3bMake(const Vector: TVector2b; const Z: Byte): TVector3b;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
end;

// *******

function Vector3fMake(const Vector: TVector4f): TVector3f;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
end;

function Vector3iMake(const Vector: TVector4i): TVector3i;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
end;

function Vector3sMake(const Vector: TVector4s): TVector3s;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
end;

function Vector3dMake(const Vector: TVector4d): TVector3d;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
end;

function Vector3bMake(const Vector: TVector4b): TVector3b;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
end;

{ ***************************************************************************** }

// 4x
function Vector4fMake(const X, Y, Z, W: Single): TVector4f;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4iMake(const X, Y, Z, W: Longint): TVector4i;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4sMake(const X, Y, Z, W: SmallInt): TVector4s;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4dMake(const X, Y, Z, W: Double): TVector4d;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4bMake(const X, Y, Z, W: Byte): TVector4b;
begin
  result.X := X;
  result.Y := Y;
  result.Z := Z;
  result.W := W;
end;

// ********

function Vector4fMake(const Vector: TVector3f; const W: Single): TVector4f;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
  result.W := W;
end;

function Vector4iMake(const Vector: TVector3i; const W: Longint): TVector4i;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
  result.W := W;
end;

function Vector4sMake(const Vector: TVector3s; const W: SmallInt): TVector4s;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
  result.W := W;
end;

function Vector4dMake(const Vector: TVector3d; const W: Double): TVector4d;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
  result.W := W;
end;

function Vector4bMake(const Vector: TVector3b; const W: Byte): TVector4b;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Vector.Z;
  result.W := W;
end;

// *******

function Vector4fMake(const Vector: TVector2f; const Z: Single; const W: Single)
  : TVector4f;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4iMake(const Vector: TVector2i; const Z: Longint;
  const W: Longint): TVector4i;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4sMake(const Vector: TVector2s; const Z: SmallInt;
  const W: SmallInt): TVector4s;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4dMake(const Vector: TVector2d; const Z: Double; const W: Double)
  : TVector4d;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
  result.W := W;
end;

function Vector4bMake(const Vector: TVector2b; const Z: Byte; const W: Byte)
  : TVector4b;
begin
  result.X := Vector.X;
  result.Y := Vector.Y;
  result.Z := Z;
  result.W := W;
end;

{ ***************************************************************************** }

// 2
function VectorEquals(const Vector1, Vector2: TVector2f): Boolean;
begin
  result := (Vector1.X = Vector2.X) and (Vector1.Y = Vector2.Y);
end;

function VectorEquals(const Vector1, Vector2: TVector2i): Boolean;
begin
  result := (Vector1.X = Vector2.X) and (Vector1.Y = Vector2.Y);
end;

function VectorEquals(const V1, V2: TVector2d): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y);
end;

function VectorEquals(const V1, V2: TVector2s): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y);
end;

function VectorEquals(const V1, V2: TVector2b): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y);
end;

{ ***************************************************************************** }

// 3
function VectorEquals(const V1, V2: TVector3i): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z);
end;

function VectorEquals(const V1, V2: TVector3d): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z);
end;

function VectorEquals(const V1, V2: TVector3s): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z);
end;

function VectorEquals(const V1, V2: TVector3b): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z);
end;

{ ***************************************************************************** }

// 4
function VectorEquals(const V1, V2: TVector4i): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z)
    and (V1.W = V2.W);
end;

function VectorEquals(const V1, V2: TVector4d): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z)
    and (V1.W = V2.W);
end;

function VectorEquals(const V1, V2: TVector4s): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z)
    and (V1.W = V2.W);
end;

function VectorEquals(const V1, V2: TVector4b): Boolean;
begin
  result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z)
    and (V1.W = V2.W);
end;

{ ***************************************************************************** }

// 3x3f
function MatrixEquals(const Matrix1, Matrix2: TMatrix3f): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z);
end;

// 3x3i
function MatrixEquals(const Matrix1, Matrix2: TMatrix3i): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z);
end;

// 3x3d
function MatrixEquals(const Matrix1, Matrix2: TMatrix3d): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z);
end;

// 3x3s
function MatrixEquals(const Matrix1, Matrix2: TMatrix3s): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z);
end;

// 3x3b
function MatrixEquals(const Matrix1, Matrix2: TMatrix3b): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z);
end;

{ ***************************************************************************** }

// 4x4f
function MatrixEquals(const Matrix1, Matrix2: TMatrix4f): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z) and
    VectorEquals(Matrix1.W, Matrix2.W);
end;

// 4x4i
function MatrixEquals(const Matrix1, Matrix2: TMatrix4i): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z) and
    VectorEquals(Matrix1.W, Matrix2.W);
end;

// 4x4d
function MatrixEquals(const Matrix1, Matrix2: TMatrix4d): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z) and
    VectorEquals(Matrix1.W, Matrix2.W);
end;

// 4x4s
function MatrixEquals(const Matrix1, Matrix2: TMatrix4s): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z) and
    VectorEquals(Matrix1.W, Matrix2.W);
end;

// 4x4b
function MatrixEquals(const Matrix1, Matrix2: TMatrix4b): Boolean;
begin
  result := VectorEquals(Matrix1.X, Matrix2.X) and
    VectorEquals(Matrix1.Y, Matrix2.Y) and
    VectorEquals(Matrix1.Z, Matrix2.Z) and
    VectorEquals(Matrix1.W, Matrix2.W);
end;

{ ***************************************************************************** }

// Vector comparison functions:
// 3f
function VectorMoreThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;
begin
  result := (SourceVector.X > ComparedVector.X) and
    (SourceVector.Y > ComparedVector.Y) and
    (SourceVector.Z > ComparedVector.Z);
end;

function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;
begin
  result := (SourceVector.X >= ComparedVector.X) and
    (SourceVector.Y >= ComparedVector.Y) and
    (SourceVector.Z >= ComparedVector.Z);
end;

function VectorLessThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;
begin
  result := (SourceVector.X < ComparedVector.X) and
    (SourceVector.Y < ComparedVector.Y) and
    (SourceVector.Z < ComparedVector.Z);
end;

function VectorLessEqualThen(const SourceVector, ComparedVector: TVector3f)
  : Boolean; overload;
begin
  result := (SourceVector.X <= ComparedVector.X) and
    (SourceVector.Y <= ComparedVector.Y) and
    (SourceVector.Z <= ComparedVector.Z);
end;

// 4f
function VectorMoreThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;
begin
  result := (SourceVector.X > ComparedVector.X) and
    (SourceVector.Y > ComparedVector.Y) and
    (SourceVector.Z > ComparedVector.Z) and
    (SourceVector.W > ComparedVector.W);
end;

function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;
begin
  result := (SourceVector.X >= ComparedVector.X) and
    (SourceVector.Y >= ComparedVector.Y) and
    (SourceVector.Z >= ComparedVector.Z) and
    (SourceVector.W >= ComparedVector.W);
end;

function VectorLessThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;
begin
  result := (SourceVector.X < ComparedVector.X) and
    (SourceVector.Y < ComparedVector.Y) and
    (SourceVector.Z < ComparedVector.Z) and
    (SourceVector.W < ComparedVector.W);
end;

function VectorLessEqualThen(const SourceVector, ComparedVector: TVector4f)
  : Boolean; overload;
begin
  result := (SourceVector.X <= ComparedVector.X) and
    (SourceVector.Y <= ComparedVector.Y) and
    (SourceVector.Z <= ComparedVector.Z) and
    (SourceVector.W <= ComparedVector.W);
end;

// 3i
// Vector comparison functions:
function VectorMoreThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;
begin
  result := (SourceVector.X > ComparedVector.X) and
    (SourceVector.Y > ComparedVector.Y) and
    (SourceVector.Z > ComparedVector.Z);
end;

function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;
begin
  result := (SourceVector.X >= ComparedVector.X) and
    (SourceVector.Y >= ComparedVector.Y) and
    (SourceVector.Z >= ComparedVector.Z);
end;

function VectorLessThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;
begin
  result := (SourceVector.X < ComparedVector.X) and
    (SourceVector.Y < ComparedVector.Y) and
    (SourceVector.Z < ComparedVector.Z);
end;

function VectorLessEqualThen(const SourceVector, ComparedVector: TVector3i)
  : Boolean; overload;
begin
  result := (SourceVector.X <= ComparedVector.X) and
    (SourceVector.Y <= ComparedVector.Y) and
    (SourceVector.Z <= ComparedVector.Z);
end;

// 4i
function VectorMoreThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;
begin
  result := (SourceVector.X > ComparedVector.X) and
    (SourceVector.Y > ComparedVector.Y) and
    (SourceVector.Z > ComparedVector.Z) and
    (SourceVector.W > ComparedVector.W);
end;

function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;
begin
  result := (SourceVector.X >= ComparedVector.X) and
    (SourceVector.Y >= ComparedVector.Y) and
    (SourceVector.Z >= ComparedVector.Z) and
    (SourceVector.W >= ComparedVector.W);
end;

function VectorLessThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;
begin
  result := (SourceVector.X < ComparedVector.X) and
    (SourceVector.Y < ComparedVector.Y) and
    (SourceVector.Z < ComparedVector.Z) and
    (SourceVector.W < ComparedVector.W);
end;

function VectorLessEqualThen(const SourceVector, ComparedVector: TVector4i)
  : Boolean; overload;
begin
  result := (SourceVector.X <= ComparedVector.X) and
    (SourceVector.Y <= ComparedVector.Y) and
    (SourceVector.Z <= ComparedVector.Z) and
    (SourceVector.W <= ComparedVector.W);
end;

// 3s
// Vector comparison functions:
function VectorMoreThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;
begin
  result := (SourceVector.X > ComparedVector.X) and
    (SourceVector.Y > ComparedVector.Y) and
    (SourceVector.Z > ComparedVector.Z);
end;

function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;
begin
  result := (SourceVector.X >= ComparedVector.X) and
    (SourceVector.Y >= ComparedVector.Y) and
    (SourceVector.Z >= ComparedVector.Z);
end;

function VectorLessThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;
begin
  result := (SourceVector.X < ComparedVector.X) and
    (SourceVector.Y < ComparedVector.Y) and
    (SourceVector.Z < ComparedVector.Z);
end;

function VectorLessEqualThen(const SourceVector, ComparedVector: TVector3s)
  : Boolean; overload;
begin
  result := (SourceVector.X <= ComparedVector.X) and
    (SourceVector.Y <= ComparedVector.Y) and
    (SourceVector.Z <= ComparedVector.Z);
end;

// 4s
function VectorMoreThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;
begin
  result := (SourceVector.X > ComparedVector.X) and
    (SourceVector.Y > ComparedVector.Y) and
    (SourceVector.Z > ComparedVector.Z) and
    (SourceVector.W > ComparedVector.W);
end;

function VectorMoreEqualThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;
begin
  result := (SourceVector.X >= ComparedVector.X) and
    (SourceVector.Y >= ComparedVector.Y) and
    (SourceVector.Z >= ComparedVector.Z) and
    (SourceVector.W >= ComparedVector.W);
end;

function VectorLessThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;
begin
  result := (SourceVector.X < ComparedVector.X) and
    (SourceVector.Y < ComparedVector.Y) and
    (SourceVector.Z < ComparedVector.Z) and
    (SourceVector.W < ComparedVector.W);
end;

function VectorLessEqualThen(const SourceVector, ComparedVector: TVector4s)
  : Boolean; overload;
begin
  result := (SourceVector.X <= ComparedVector.X) and
    (SourceVector.Y <= ComparedVector.Y) and
    (SourceVector.Z <= ComparedVector.Z) and
    (SourceVector.W <= ComparedVector.W);
end;

// ComparedNumber
// 3f
function VectorMoreThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X > ComparedNumber) and
    (SourceVector.Y > ComparedNumber) and
    (SourceVector.Z > ComparedNumber);
end;

function VectorMoreEqualThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X >= ComparedNumber) and
    (SourceVector.Y >= ComparedNumber) and
    (SourceVector.Z >= ComparedNumber);
end;

function VectorLessThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X < ComparedNumber) and
    (SourceVector.Y < ComparedNumber) and
    (SourceVector.Z < ComparedNumber);
end;

function VectorLessEqualThen(const SourceVector: TVector3f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X <= ComparedNumber) and
    (SourceVector.Y <= ComparedNumber) and
    (SourceVector.Z <= ComparedNumber);
end;

// 4f
function VectorMoreThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X > ComparedNumber) and
    (SourceVector.Y > ComparedNumber) and
    (SourceVector.Z > ComparedNumber) and
    (SourceVector.W > ComparedNumber);
end;

function VectorMoreEqualThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X >= ComparedNumber) and
    (SourceVector.Y >= ComparedNumber) and
    (SourceVector.Z >= ComparedNumber) and
    (SourceVector.W >= ComparedNumber);
end;

function VectorLessThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X < ComparedNumber) and
    (SourceVector.Y < ComparedNumber) and
    (SourceVector.Z < ComparedNumber) and
    (SourceVector.W < ComparedNumber);
end;

function VectorLessEqualThen(const SourceVector: TVector4f;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X <= ComparedNumber) and
    (SourceVector.Y <= ComparedNumber) and
    (SourceVector.Z <= ComparedNumber) and
    (SourceVector.W <= ComparedNumber);
end;

// 3i
function VectorMoreThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X > ComparedNumber) and
    (SourceVector.Y > ComparedNumber) and
    (SourceVector.Z > ComparedNumber);
end;

function VectorMoreEqualThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X >= ComparedNumber) and
    (SourceVector.Y >= ComparedNumber) and
    (SourceVector.Z >= ComparedNumber);
end;

function VectorLessThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X < ComparedNumber) and
    (SourceVector.Y < ComparedNumber) and
    (SourceVector.Z < ComparedNumber);
end;

function VectorLessEqualThen(const SourceVector: TVector3i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X <= ComparedNumber) and
    (SourceVector.Y <= ComparedNumber) and
    (SourceVector.Z <= ComparedNumber);
end;

// 4i
function VectorMoreThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X > ComparedNumber) and
    (SourceVector.Y > ComparedNumber) and
    (SourceVector.Z > ComparedNumber) and
    (SourceVector.W > ComparedNumber);
end;

function VectorMoreEqualThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X >= ComparedNumber) and
    (SourceVector.Y >= ComparedNumber) and
    (SourceVector.Z >= ComparedNumber) and
    (SourceVector.W >= ComparedNumber);
end;

function VectorLessThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X < ComparedNumber) and
    (SourceVector.Y < ComparedNumber) and
    (SourceVector.Z < ComparedNumber) and
    (SourceVector.W < ComparedNumber);
end;

function VectorLessEqualThen(const SourceVector: TVector4i;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X <= ComparedNumber) and
    (SourceVector.Y <= ComparedNumber) and
    (SourceVector.Z <= ComparedNumber) and
    (SourceVector.W <= ComparedNumber);
end;

// 3s
function VectorMoreThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X > ComparedNumber) and
    (SourceVector.Y > ComparedNumber) and
    (SourceVector.Z > ComparedNumber);
end;

function VectorMoreEqualThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X >= ComparedNumber) and
    (SourceVector.Y >= ComparedNumber) and
    (SourceVector.Z >= ComparedNumber);
end;

function VectorLessThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X < ComparedNumber) and
    (SourceVector.Y < ComparedNumber) and
    (SourceVector.Z < ComparedNumber);
end;

function VectorLessEqualThen(const SourceVector: TVector3s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X <= ComparedNumber) and
    (SourceVector.Y <= ComparedNumber) and
    (SourceVector.Z <= ComparedNumber);
end;

// 4s
function VectorMoreThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X > ComparedNumber) and
    (SourceVector.Y > ComparedNumber) and
    (SourceVector.Z > ComparedNumber) and
    (SourceVector.W > ComparedNumber);
end;

function VectorMoreEqualThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X >= ComparedNumber) and
    (SourceVector.Y >= ComparedNumber) and
    (SourceVector.Z >= ComparedNumber) and
    (SourceVector.W >= ComparedNumber);
end;

function VectorLessThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X < ComparedNumber) and
    (SourceVector.Y < ComparedNumber) and
    (SourceVector.Z < ComparedNumber) and
    (SourceVector.W < ComparedNumber);
end;

function VectorLessEqualThen(const SourceVector: TVector4s;
  const ComparedNumber: Single): Boolean; overload;
begin
  result := (SourceVector.X <= ComparedNumber) and
    (SourceVector.Y <= ComparedNumber) and
    (SourceVector.Z <= ComparedNumber) and
    (SourceVector.W <= ComparedNumber);
end;

{ Determine if 2 rectanges intersect. }
function RectanglesIntersect(const ACenterOfRect1, ACenterOfRect2, ASizeOfRect1,
  ASizeOfRect2: TVector2f): Boolean;
begin
  result := (Abs(ACenterOfRect1.X - ACenterOfRect2.X) <
    (ASizeOfRect1.X + ASizeOfRect2.X) / 2) and
    (Abs(ACenterOfRect1.Y - ACenterOfRect2.Y) <
    (ASizeOfRect1.Y + ASizeOfRect2.Y) / 2);
end;

{ Determine if BigRect completely contains SmallRect. }
function RectangleContains(const ACenterOfBigRect1, ACenterOfSmallRect2,
  ASizeOfBigRect1, ASizeOfSmallRect2: TVector2f;
  const AEps: Single = 0.0): Boolean;
begin
  result := (Abs(ACenterOfBigRect1.X - ACenterOfSmallRect2.X) +
    ASizeOfSmallRect2.X / 2 - ASizeOfBigRect1.X / 2 < AEps) and
    (Abs(ACenterOfBigRect1.Y - ACenterOfSmallRect2.Y) +
    ASizeOfSmallRect2.Y / 2 - ASizeOfBigRect1.Y / 2 < AEps);
end;

function GetSafeTurnAngle(const AOriginalPosition, AOriginalUpVector,
  ATargetPosition, AMoveAroundTargetCenter: TVector): TVector2f;
var
  pitchangle0, pitchangle1, turnangle0, turnangle1, pitchangledif, turnangledif,
    dx0, dy0, dz0, dx1, dy1, dz1: Double;
  Sign: shortint;
begin
  // determine relative positions to determine the lines which form the angles
  // distances from initial camera pos to target object
  dx0 := AOriginalPosition.X - AMoveAroundTargetCenter.X;
  dy0 := AOriginalPosition.Y - AMoveAroundTargetCenter.Y;
  dz0 := AOriginalPosition.Z - AMoveAroundTargetCenter.Z;

  // distances from final camera pos to target object
  dx1 := ATargetPosition.X - AMoveAroundTargetCenter.X;
  dy1 := ATargetPosition.Y - AMoveAroundTargetCenter.Y;
  dz1 := ATargetPosition.Z - AMoveAroundTargetCenter.Z;

  // just to make sure we don't get division by 0 exceptions
  if dx0 = 0 then
    dx0 := 0.001;
  if dy0 = 0 then
    dy0 := 0.001;
  if dz0 = 0 then
    dz0 := 0.001;
  if dx1 = 0 then
    dx1 := 0.001;
  if dy1 = 0 then
    dy1 := 0.001;
  if dz1 = 0 then
    dz1 := 0.001;

  // determine "pitch" and "turn" angles for the initial and  final camera position
  // the formulas differ depending on the camera.Up vector
  // I tested all quadrants for all possible integer FJoblist.Camera.Up directions
  if Abs(AOriginalUpVector.Z) = 1 then // Z=1/-1
  begin
    Sign := Round(AOriginalUpVector.Z / Abs(AOriginalUpVector.Z));
    pitchangle0 := arctan(dz0 / Sqrt(Sqr(dx0) + Sqr(dy0)));
    pitchangle1 := arctan(dz1 / Sqrt(Sqr(dx1) + Sqr(dy1)));
    turnangle0 := arctan(dy0 / dx0);
    if (dx0 < 0) and (dy0 < 0) then
      turnangle0 := -(PI - turnangle0)
    else if (dx0 < 0) and (dy0 > 0) then
      turnangle0 := -(PI - turnangle0);
    turnangle1 := arctan(dy1 / dx1);
    if (dx1 < 0) and (dy1 < 0) then
      turnangle1 := -(PI - turnangle1)
    else if (dx1 < 0) and (dy1 > 0) then
      turnangle1 := -(PI - turnangle1);
  end
  else if Abs(AOriginalUpVector.Y) = 1 then // Y=1/-1
  begin
    Sign := Round(AOriginalUpVector.Y / Abs(AOriginalUpVector.Y));
    pitchangle0 := arctan(dy0 / Sqrt(Sqr(dx0) + Sqr(dz0)));
    pitchangle1 := arctan(dy1 / Sqrt(Sqr(dx1) + Sqr(dz1)));
    turnangle0 := -arctan(dz0 / dx0);
    if (dx0 < 0) and (dz0 < 0) then
      turnangle0 := -(PI - turnangle0)
    else if (dx0 < 0) and (dz0 > 0) then
      turnangle0 := -(PI - turnangle0);
    turnangle1 := -arctan(dz1 / dx1);
    if (dx1 < 0) and (dz1 < 0) then
      turnangle1 := -(PI - turnangle1)
    else if (dx1 < 0) and (dz1 > 0) then
      turnangle1 := -(PI - turnangle1);
  end
  else if Abs(AOriginalUpVector.X) = 1 then // X=1/-1
  begin
    Sign := Round(AOriginalUpVector.X / Abs(AOriginalUpVector.X));
    pitchangle0 := arctan(dx0 / Sqrt(Sqr(dz0) + Sqr(dy0)));
    pitchangle1 := arctan(dx1 / Sqrt(Sqr(dz1) + Sqr(dy1)));
    turnangle0 := arctan(dz0 / dy0);
    if (dz0 > 0) and (dy0 > 0) then
      turnangle0 := -(PI - turnangle0)
    else if (dz0 < 0) and (dy0 > 0) then
      turnangle0 := -(PI - turnangle0);
    turnangle1 := arctan(dz1 / dy1);
    if (dz1 > 0) and (dy1 > 0) then
      turnangle1 := -(PI - turnangle1)
    else if (dz1 < 0) and (dy1 > 0) then
      turnangle1 := -(PI - turnangle1);
  end
  else
  begin
    Raise Exception.Create('The Camera.Up vector may contain only -1, 0 or 1');
  end;

  // determine pitch and turn angle differences
  pitchangledif := Sign * (pitchangle1 - pitchangle0);
  turnangledif := Sign * (turnangle1 - turnangle0);

  if Abs(turnangledif) > PI then
    turnangledif := -Abs(turnangledif) / turnangledif *
      (2 * PI - Abs(turnangledif));

  // Determine rotation speeds
  result.X := RadianToDeg(-pitchangledif);
  result.Y := RadianToDeg(turnangledif);
end;

function GetSafeTurnAngle(const AOriginalPosition, AOriginalUpVector,
  ATargetPosition, AMoveAroundTargetCenter: TAffineVector): TVector2f;
var
  pitchangle0, pitchangle1, turnangle0, turnangle1, pitchangledif, turnangledif,
    dx0, dy0, dz0, dx1, dy1, dz1: Double;
  Sign: shortint;
begin
  // determine relative positions to determine the lines which form the angles
  // distances from initial camera pos to target object
  dx0 := AOriginalPosition.X - AMoveAroundTargetCenter.X;
  dy0 := AOriginalPosition.Y - AMoveAroundTargetCenter.Y;
  dz0 := AOriginalPosition.Z - AMoveAroundTargetCenter.Z;

  // distances from final camera pos to target object
  dx1 := ATargetPosition.X - AMoveAroundTargetCenter.X;
  dy1 := ATargetPosition.Y - AMoveAroundTargetCenter.Y;
  dz1 := ATargetPosition.Z - AMoveAroundTargetCenter.Z;

  // just to make sure we don't get division by 0 exceptions
  if dx0 = 0 then
    dx0 := 0.001;
  if dy0 = 0 then
    dy0 := 0.001;
  if dz0 = 0 then
    dz0 := 0.001;
  if dx1 = 0 then
    dx1 := 0.001;
  if dy1 = 0 then
    dy1 := 0.001;
  if dz1 = 0 then
    dz1 := 0.001;

  // determine "pitch" and "turn" angles for the initial and  final camera position
  // the formulas differ depending on the camera.Up vector
  // I tested all quadrants for all possible integer FJoblist.Camera.Up directions
  if Abs(AOriginalUpVector.Z) = 1 then // Z=1/-1
  begin
    Sign := Round(AOriginalUpVector.Z / Abs(AOriginalUpVector.Z));
    pitchangle0 := arctan(dz0 / Sqrt(Sqr(dx0) + Sqr(dy0)));
    pitchangle1 := arctan(dz1 / Sqrt(Sqr(dx1) + Sqr(dy1)));
    turnangle0 := arctan(dy0 / dx0);
    if (dx0 < 0) and (dy0 < 0) then
      turnangle0 := -(PI - turnangle0)
    else if (dx0 < 0) and (dy0 > 0) then
      turnangle0 := -(PI - turnangle0);
    turnangle1 := arctan(dy1 / dx1);
    if (dx1 < 0) and (dy1 < 0) then
      turnangle1 := -(PI - turnangle1)
    else if (dx1 < 0) and (dy1 > 0) then
      turnangle1 := -(PI - turnangle1);
  end
  else if Abs(AOriginalUpVector.Y) = 1 then // Y=1/-1
  begin
    Sign := Round(AOriginalUpVector.Y / Abs(AOriginalUpVector.Y));
    pitchangle0 := arctan(dy0 / Sqrt(Sqr(dx0) + Sqr(dz0)));
    pitchangle1 := arctan(dy1 / Sqrt(Sqr(dx1) + Sqr(dz1)));
    turnangle0 := -arctan(dz0 / dx0);
    if (dx0 < 0) and (dz0 < 0) then
      turnangle0 := -(PI - turnangle0)
    else if (dx0 < 0) and (dz0 > 0) then
      turnangle0 := -(PI - turnangle0);
    turnangle1 := -arctan(dz1 / dx1);
    if (dx1 < 0) and (dz1 < 0) then
      turnangle1 := -(PI - turnangle1)
    else if (dx1 < 0) and (dz1 > 0) then
      turnangle1 := -(PI - turnangle1);
  end
  else if Abs(AOriginalUpVector.X) = 1 then // X=1/-1
  begin
    Sign := Round(AOriginalUpVector.X / Abs(AOriginalUpVector.X));
    pitchangle0 := arctan(dx0 / Sqrt(Sqr(dz0) + Sqr(dy0)));
    pitchangle1 := arctan(dx1 / Sqrt(Sqr(dz1) + Sqr(dy1)));
    turnangle0 := arctan(dz0 / dy0);
    if (dz0 > 0) and (dy0 > 0) then
      turnangle0 := -(PI - turnangle0)
    else if (dz0 < 0) and (dy0 > 0) then
      turnangle0 := -(PI - turnangle0);
    turnangle1 := arctan(dz1 / dy1);
    if (dz1 > 0) and (dy1 > 0) then
      turnangle1 := -(PI - turnangle1)
    else if (dz1 < 0) and (dy1 > 0) then
      turnangle1 := -(PI - turnangle1);
  end
  else
  begin
    Raise Exception.Create('The Camera.Up vector may contain only -1, 0 or 1');
  end;

  // determine pitch and turn angle differences
  pitchangledif := Sign * (pitchangle1 - pitchangle0);
  turnangledif := Sign * (turnangle1 - turnangle0);

  if Abs(turnangledif) > PI then
    turnangledif := -Abs(turnangledif) / turnangledif *
      (2 * PI - Abs(turnangledif));

  // Determine rotation speeds
  result.X := RadianToDeg(-pitchangledif);
  result.Y := RadianToDeg(turnangledif);
end;

function MoveObjectAround(const AMovingObjectPosition, AMovingObjectUp,
  ATargetPosition: TVector; pitchDelta, turnDelta: Single): TVector;
var
  originalT2C, normalT2C, normalCameraRight: TVector;
  pitchNow, dist: Single;
begin
  // normalT2C points away from the direction the camera is looking
  originalT2C := VectorSubtract(AMovingObjectPosition, ATargetPosition);
  SetVector(normalT2C, originalT2C);
  dist := VectorLength(normalT2C);
  NormalizeVector(normalT2C);
  // normalRight points to the camera's right
  // the camera is pitching around this axis.
  normalCameraRight := VectorCrossProduct(AMovingObjectUp, normalT2C);
  if VectorLength(normalCameraRight) < 0.001 then
    SetVector(normalCameraRight, XVector) // arbitrary vector
  else
    NormalizeVector(normalCameraRight);
  // calculate the current pitch.
  // 0 is looking down and PI is looking up
  pitchNow := ArcCosine(VectorDotProduct(AMovingObjectUp, normalT2C));
  pitchNow := ClampValue(pitchNow + DegToRadian(pitchDelta), 0 + 0.025,
    PI - 0.025);
  // create a new vector pointing up and then rotate it down
  // into the new position
  SetVector(normalT2C, AMovingObjectUp);
  RotateVector(normalT2C, normalCameraRight, -pitchNow);
  RotateVector(normalT2C, AMovingObjectUp, -DegToRadian(turnDelta));
  ScaleVector(normalT2C, dist);
  result := VectorAdd(AMovingObjectPosition, VectorSubtract(normalT2C,
    originalT2C));
end;

{ Calcualtes Angle between 2 Vectors: (A-CenterPoint) and (B-CenterPoint). In radians. }
function AngleBetweenVectors(const a, b, ACenterPoint: TVector): Single;
begin
  result := ArcCosine(VectorAngleCosine(VectorNormalize(VectorSubtract(a,
    ACenterPoint)), VectorNormalize(VectorSubtract(b, ACenterPoint))));
end;

{ Calcualtes Angle between 2 Vectors: (A-CenterPoint) and (B-CenterPoint). In radians. }
function AngleBetweenVectors(const a, b, ACenterPoint: TAffineVector): Single;
begin
  result := ArcCosine(VectorAngleCosine(VectorNormalize(VectorSubtract(a,
    ACenterPoint)), VectorNormalize(VectorSubtract(b, ACenterPoint))));
end;

{ AOriginalPosition - Object initial position.
  ACenter - some point, from which is should be distanced.

  ADistance + AFromCenterSpot - distance, which object should keep from ACenter
  or
  ADistance + not AFromCenterSpot - distance, which object should shift from his current position away from center.
}
function ShiftObjectFromCenter(const AOriginalPosition: TVector;
  const ACenter: TVector; const ADistance: Single;
  const AFromCenterSpot: Boolean): TVector;
var
  lDirection: TVector;
begin
  lDirection := VectorNormalize(VectorSubtract(AOriginalPosition, ACenter));
  if AFromCenterSpot then
    result := VectorAdd(ACenter, VectorScale(lDirection, ADistance))
  else
    result := VectorAdd(AOriginalPosition, VectorScale(lDirection, ADistance))
end;

{ AOriginalPosition - Object initial position.
  ACenter - some point, from which is should be distanced.

  ADistance + AFromCenterSpot - distance, which object should keep from ACenter
  or
  ADistance + not AFromCenterSpot - distance, which object should shift from his current position away from center.
}
function ShiftObjectFromCenter(const AOriginalPosition: TAffineVector;
  const ACenter: TAffineVector; const ADistance: Single;
  const AFromCenterSpot: Boolean): TAffineVector;
var
  lDirection: TAffineVector;
begin
  lDirection := VectorNormalize(VectorSubtract(AOriginalPosition, ACenter));
  if AFromCenterSpot then
    result := VectorAdd(ACenter, VectorScale(lDirection, ADistance))
  else
    result := VectorAdd(AOriginalPosition, VectorScale(lDirection, ADistance))
end;

// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------
initialization

// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------

vSIMD := 0;

end.
