{: GLNavigator<p>

   Unit for navigating TGLBaseObjects.<p>

	<b>History : </b><font size=-1><ul>
      <li>01/06/03 - JAJ - Added notification to movingobject...
      <li>01/06/03 - fig - CurrentHangle implementet...
      <li>14/07/02 - EG - InvertMouse (Joen A. Joensen)
      <li>18/03/02 - EG - Added MouseLookActive property, Fixed framerate dependency
      <li>15/03/02 - JAJ - Structure Change - Mouselook moved to newly created TGLUserInterface.
      <li>15/03/02 - RMCH - Added Mouselook capability.
      <li>09/11/00 - JAJ - First submitted. Base Class TGLNavigator included.
	</ul></font>
}
unit GLNavigator;

interface

uses SysUtils, Classes, Geometry, GLScene, GLMisc, Windows, Forms;

type

	// TGLNavigator
	//
	{: TGLNavigator is the component for moving a TGLBaseSceneObject, and all Classes based on it,
      this includes all the objects from the Scene Editor.<p>

	   The three calls to get you started is
      <ul>
  	   <li>TurnHorisontal : it turns left and right.
	   <li>TurnVertical : it turns up and down.
	   <li>MoveForward :	moves back and forth.
      </ul>
	   The three properties to get you started is
      <ul>
	   <li>MovingObject : The Object that you are moving.
	   <li>UseVirtualUp : When UseVirtualUp is set you navigate Quake style. If it isn't
   		it's more like Descent.
	   <li>AngleLock : Allows you to block the Vertical angles. Should only be used in
			conjunction with UseVirtualUp.
      </ul>
   }
   TGLNavigator = class(TComponent)
      private
         FObject           : TGLBaseSceneObject;
         FVirtualRight     : TVector;
         FVirtualUp        : TGLCoordinates;
         FUseVirtualUp     : Boolean;
         FAutoUpdateObject : Boolean;
         FMaxAngle         : Single;
         FMinAngle         : Single;
         FCurrentVAngle    : Single;
         FCurrentHAngle    : Single;
         FAngleLock        : Boolean;
      public
         Constructor Create(AOwner : TComponent); override;
         Destructor  Destroy; override;
         Procedure   SetObject(NewObject : TGLBaseSceneObject);
         procedure   Notification(AComponent: TComponent; Operation: TOperation); override;
         Procedure   SetUseVirtualUp(UseIt : Boolean);
         Procedure   SetVirtualUp(Up : TGLCoordinates);
         Function    CalcRight : TVector;
      protected
      public
         Procedure   TurnHorizontal(Angle : Single);
         Procedure   TurnVertical(Angle : Single);
         Procedure   MoveForward(Distance : Single);
         Procedure   StrafeHorizontal(Distance : Single);
         Procedure   StrafeVertical(Distance : Single);
         Procedure   Straighten;

         Procedure   LoadState(Stream : TStream);
         Procedure   SaveState(Stream : TStream);

         property   CurrentVAngle  : Single read FCurrentVAngle;
         property   CurrentHAngle  : Single read FCurrentHAngle;
      published
         property    VirtualUp    : TGLCoordinates read FVirtualUp write SetVirtualUp;
         property    MovingObject : TGLBaseSceneObject read FObject write SetObject;
         property    UseVirtualUp : Boolean read FUseVirtualUp write SetUseVirtualUp;
         property    AutoUpdateObject : Boolean read FAutoUpdateObject write FAutoUpdateObject;
         property    MaxAngle     : Single read FMaxAngle write FMaxAngle;
         property    MinAngle     : Single read FMinAngle write FMinAngle;
         property    AngleLock    : Boolean read FAngleLock write FAngleLock;

   end;

	// TGLUserInterface
	//
	{: TGLUserInterface is the component which reads the userinput and transform it into action.<p>

	   The four calls to get you started is
      <ul>
  	   <li>MouseLookActivate : set us up the bomb.
  	   <li>MouseLookDeActivate : defuses it.
	   <li>Mouselook(deltaTime: double) : handles mouse look... Should be called in the Cadencer event. (Though it works every where!)
	   <li>MouseUpdate : Resets mouse position so that you don't notice that the mouse is limited to the screen should be called after Mouselook.
      </ul>
	   The two properties to get you started is
      <ul>
	   <li>MouseSpeed      : Also known as mouse sensitivity.
	   <li>GLNavigator     : The Navigator which receives the user movement.
	   <li>GLVertNavigator : The Navigator which if set receives the vertical user movement. Used mostly for cameras....
      </ul>
   }

   TGLUserInterface = class(TComponent)
   private
     point1: TPoint;
     midScreenX, midScreenY: integer;
     FMouseActive       : Boolean;
     FMouseSpeed       : Single;
     FGLNavigator      : TGLNavigator;
     FGLVertNavigator  : TGLNavigator;
     FInvertMouse      : Boolean;

     procedure   MouseInitialize;
     procedure   SetMouseLookActive(const val : Boolean);

   public
     constructor Create(AOwner : TComponent); override;
     destructor  Destroy; override;

     procedure   MouseUpdate;
     function    MouseLook : Boolean;
     procedure   MouseLookActiveToggle(q: Boolean);
     procedure   MouseLookActivate;
     procedure   MouseLookDeactivate;
     function    IsMouseLookOn: Boolean;
     procedure   TurnHorizontal(Angle : Double);
     procedure   TurnVertical(Angle : Double);


     property    MouseLookActive : Boolean read FMouseActive write SetMouseLookActive;

   published
     property    InvertMouse     : Boolean read FInvertMouse write FInvertMouse;
     property    MouseSpeed      : Single read FMouseSpeed write FMouseSpeed;
     property    GLNavigator     : TGLNavigator read FGLNavigator write FGLNavigator;
     property    GLVertNavigator : TGLNavigator read FGLVertNavigator write FGLVertNavigator;
   End;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('GLScene', [TGLNavigator, TGLUserInterface]);
end;

Constructor TGLNavigator.Create(AOwner : TComponent);
Begin
  inherited;
  FVirtualUp    := TGLCoordinates.Create(Self);
  FCurrentVAngle := 0;
  FCurrentHAngle := 0;
End;

Destructor  TGLNavigator.Destroy;

Begin
  FVirtualUp.Free;
  inherited;
End;


Procedure   TGLNavigator.SetObject(NewObject : TGLBaseSceneObject);
Begin
  If FObject <> NewObject then
  Begin
    If Assigned(FObject) then
      FObject.RemoveFreeNotification(Self);

    FObject := NewObject;
    If Assigned(FObject) then
    Begin
      if csdesigning in componentstate then
      Begin
        If VectorLength(FVirtualUp.AsVector) = 0 then
        Begin
          FVirtualUp.AsVector := FObject.Up.AsVector;
        End;
        Exit;
      End;

      If FUseVirtualUp Then FVirtualRight := CalcRight;

      FObject.FreeNotification(Self);
    End;
  End;
End;

procedure   TGLNavigator.Notification(AComponent: TComponent; Operation: TOperation);

Begin
  If Operation = opRemove then
  If AComponent = FObject then
    MovingObject := Nil;

  inherited;
End;

Function    TGLNavigator.CalcRight : TVector;

Begin
  If Assigned(FObject) then
  If FUseVirtualUp Then
  Begin
    VectorCrossProduct(FObject.Direction.AsVector, FVirtualUp.AsVector, Result);
    ScaleVector(Result,1/VectorLength(Result));
  End else VectorCrossProduct(FObject.Direction.AsVector, FObject.Up.AsVector, Result); { automaticly length(1), if not this is a bug }
End;

Procedure   TGLNavigator.TurnHorizontal(Angle : Single);

Var
  T : TVector;
  U : TAffineVector;


Begin

  FCurrentHAngle:=(FCurrentHAngle-Angle);
  if FCurrentHAngle>360 then
    FCurrentHAngle:=FCurrentHAngle-360;
  if FCurrentHAngle<0 then
    FCurrentHAngle:=FCurrentHAngle+360;
  Angle := DegToRad(Angle); {make it ready for Cos and Sin }
  If FUseVirtualUp Then
  Begin
    SetVector(U, VirtualUp.AsVector);
    T := FObject.Up.AsVector;
    RotateVector(T,U,Angle);
    FObject.Up.AsVector := T;

    T := FObject.Direction.AsVector;
    RotateVector(T,U,Angle);
    FObject.Direction.AsVector := T;
  End else FObject.Direction.AsVector := VectorCombine(FObject.Direction.AsVector,CalcRight,Cos(Angle),Sin(Angle));
End;

Procedure   TGLNavigator.TurnVertical(Angle : Single);

Var
  CosAngle, SinAngle : Single;
  Direction : TVector;

Begin
  If FAngleLock then
  Begin
    CosAngle := FCurrentVAngle+Angle; {used as a temp angle, to save stack}
    If CosAngle > FMaxAngle then
    Begin
      If FCurrentVAngle = FMaxAngle then Exit;
      CosAngle := FMaxAngle;
    End else
    Begin
      If CosAngle < FMinAngle then
      Begin
        If FCurrentVAngle = FMinAngle then Exit;
        CosAngle := FMinAngle;
      End;
    End;
  End;
  FCurrentVAngle := CosAngle; {CosAngle temp, use stopped}

  Angle := DegToRad(Angle); {make it ready for Cos and Sin }
  SinCos(Angle,SinAngle,CosAngle);
  Direction := VectorCombine(MovingObject.Direction.AsVector,MovingObject.Up.AsVector,CosAngle,SinAngle);
  MovingObject.Up.AsVector := VectorCombine(MovingObject.Direction.AsVector,MovingObject.Up.AsVector,SinAngle,CosAngle);
  MovingObject.Direction.AsVector := Direction;
End;

Procedure   TGLNavigator.MoveForward(Distance : Single);
Begin
  If FUseVirtualUp Then
  Begin
    FObject.Position.AsVector := VectorCombine(FObject.Position.AsVector,VectorCrossProduct(FVirtualUp.AsVector,CalcRight),1,Distance);
  End else FObject.Position.AsVector := VectorCombine(FObject.Position.AsVector,FObject.Direction.AsVector,1,Distance);
End;

Procedure   TGLNavigator.StrafeHorizontal(Distance : Single);
Begin
  FObject.Position.AsVector := VectorCombine(FObject.Position.AsVector,CalcRight,1,Distance);
End;

Procedure   TGLNavigator.StrafeVertical(Distance : Single);
Begin
  If UseVirtualUp Then
  Begin
    FObject.Position.AsVector := VectorCombine(FObject.Position.AsVector,FVirtualUp.AsVector,1,Distance);
  End else FObject.Position.AsVector := VectorCombine(FObject.Position.AsVector,FObject.Up.AsVector,1,Distance);
End;

Procedure   TGLNavigator.Straighten;

Var
  R : TVector;
  D : TVector;
  A : Single;

Begin
  FCurrentVAngle     := 0;
  FCurrentHAngle     := 0;

  R := CalcRight;
  A := VectorAngleCosine(AffineVectorMake(MovingObject.Up.AsVector), AffineVectorMake(VirtualUp.AsVector));
  MovingObject.Up.AsVector := VirtualUp.AsVector;

  VectorCrossProduct(R, FVirtualUp.AsVector, D);

  If A >= 0 then
    ScaleVector(D,-1/VectorLength(D))
  else
    ScaleVector(D,1/VectorLength(D));

  MovingObject.Direction.AsVector := D;
End;

Procedure   TGLNavigator.SetUseVirtualUp(UseIt : Boolean);

Begin
  FUseVirtualUp := UseIt;
  if csdesigning in componentstate then Exit;
  If FUseVirtualUp then FVirtualRight := CalcRight;
End;


Procedure   TGLNavigator.SetVirtualUp(Up : TGLCoordinates);
Begin
  FVirtualUp.Assign(Up);
  if csdesigning in componentstate then Exit;
  If FUseVirtualUp then FVirtualRight := CalcRight;
End;

Procedure   TGLNavigator.LoadState(Stream : TStream);

Var
  Vector : TAffineVector;
  B : ByteBool;
  S : Single;

Begin
  Stream.Read(Vector,SizeOf(TAffineVector));
  FObject.Position.AsAffineVector := Vector;
  Stream.Read(Vector,SizeOf(TAffineVector));
  FObject.Direction.AsAffineVector := Vector;
  Stream.Read(Vector,SizeOf(TAffineVector));
  FObject.Up.AsAffineVector := Vector;
  Stream.Read(B,SizeOf(ByteBool));
  UseVirtualUp := B;
  Stream.Read(B,SizeOf(ByteBool));
  FAngleLock := B;
  Stream.Read(S,SizeOf(Single));
  FMaxAngle := S;
  Stream.Read(S,SizeOf(Single));
  FMinAngle := S;
  Stream.Read(S,SizeOf(Single));
  FCurrentVAngle := S;
  Stream.Read(S,SizeOf(Single));
  FCurrentHAngle := S;
End;

Procedure   TGLNavigator.SaveState(Stream : TStream);

Var
  Vector : TAffineVector;
  B : ByteBool;
  S : Single;

Begin
  Vector := FObject.Position.AsAffineVector;
  Stream.Write(Vector,SizeOf(TAffineVector));
  Vector := FObject.Direction.AsAffineVector;
  Stream.Write(Vector,SizeOf(TAffineVector));
  Vector := FObject.Up.AsAffineVector;
  Stream.Write(Vector,SizeOf(TAffineVector));
  B := UseVirtualUp;
  Stream.Write(B,SizeOf(ByteBool));
  B := FAngleLock;
  Stream.Write(B,SizeOf(ByteBool));
  S := FMaxAngle;
  Stream.Write(S,SizeOf(Single));
  S := FMinAngle;
  Stream.Write(S,SizeOf(Single));
  S := FCurrentVAngle;
  Stream.Write(S,SizeOf(Single));
  S := FCurrentHAngle;
  Stream.Write(S,SizeOf(Single));
End;

function TGLUserInterface.IsMouseLookOn: Boolean;
begin
   Result:=FMouseActive;
end;

Procedure   TGLUserInterface.TurnHorizontal(Angle : Double);

Begin
  GLNavigator.TurnHorizontal(Angle);
End;

Procedure   TGLUserInterface.TurnVertical(Angle : Double);

Begin
  If Assigned(GLVertNavigator) then GLVertNavigator.TurnVertical(Angle)
  else GLNavigator.TurnVertical(Angle);
End;

procedure TGLUserInterface.MouseLookActiveToggle;
begin
   if FMouseActive then
      MouseLookDeactivate
   else MouseLookActivate;
end;

procedure TGLUserInterface.MouseLookActivate;
begin
   if not FMouseActive then begin
      FMouseActive := True;
      MouseInitialize;
      ShowCursor(False);
   end;
end;

procedure TGLUserInterface.MouseLookDeactivate;
begin
   if FMouseActive then begin
      FMouseActive := False;
      ShowCursor(True);
   end;
end;

procedure TGLUserInterface.MouseInitialize;
begin
   midScreenX:=Screen.Width div 2;
   midScreenY:=Screen.Height div 2;

   point1.x:=midScreenX; point1.Y:=midScreenY;
   SetCursorPos(midScreenX, midScreenY);
end;

// SetMouseLookActive
//
procedure TGLUserInterface.SetMouseLookActive(const val : Boolean);
begin
   if val<>FMouseActive then
      if val then
         MouseLookActivate
      else MouseLookDeactivate;
end;

procedure TGLUserInterface.MouseUpdate;
begin
   if FMouseActive then
   windows.GetCursorPos(point1);
end;

// Mouselook
//
function  TGLUserInterface.Mouselook : Boolean;
var
   deltaX, deltaY : Single;
begin
   Result := False;
   if not FMouseActive then exit;

   deltax:=(point1.x-midscreenX)*mousespeed;
   deltay:=-(point1.y-midscreenY)*mousespeed;
   If InvertMouse then deltay:=-deltay;

   if deltax <> 0 then begin
     TurnHorizontal(deltax*0.01);
     result := True;
   end;
   if deltay <> 0 then begin
     TurnVertical(deltay*0.01);
     result := True;
   end;

   if (point1.x <> midScreenX) or (point1.y <> midScreenY) then
      SetCursorPos(midScreenX, midScreenY);
end;

Constructor TGLUserInterface.Create(AOwner : TComponent);
Begin
  inherited;
  FMouseSpeed :=0;
  FMouseActive:=False;
  midScreenX:=Screen.Width div 2;
  midScreenY:=Screen.Height div 2;
  point1.x:=midScreenX; point1.Y:=midScreenY;
End;

Destructor  TGLUserInterface.Destroy;

Begin
  if FMouseActive then MouseLookDeactivate; // added by JAJ
  inherited;
End;

end.
