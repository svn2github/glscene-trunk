{: GLMultiMaterialShader<p>

   A shader that applies a render pass for each material in
   its assigned MaterialLibrary.<p>

   <b>History : </b><font size=-1><ul>
      <li>29/07/03 - SG - Removed design-time rendering option
                          (shader unstable at design-time)
      <li>29/07/03 - SG - Creation
   </ul></font>
}
unit GLMultiMaterialShader;

interface

uses
   Classes, GLTexture, OpenGL1x;

type
   TGLMultiMaterialShader = class(TGLShader)
      private
         FPass : Integer;
         FMaterialLibrary : TGLMaterialLibrary;
      protected
         procedure SetMaterialLibrary(const val : TGLMaterialLibrary);
         procedure DoApply(var rci : TRenderContextInfo; Sender : TObject); override;
         function DoUnApply(var rci : TRenderContextInfo) : Boolean; override;
      public
         constructor Create(aOwner : TComponent); override;
      published
         property MaterialLibrary : TGLMaterialLibrary read FMaterialLibrary write SetMaterialLibrary;
   end;

procedure Register;

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

procedure Register;
begin
   RegisterComponents('GLScene Shaders', [TGLMultiMaterialShader]);
end;

// ------------------
// ------------------ TGLMultiMaterialShader ------------------
// ------------------

// Create
//
constructor TGLMultiMaterialShader.Create(aOwner : TComponent);
begin
   inherited;
   ShaderStyle:=ssReplace;
end;

// DoApply
//
procedure TGLMultiMaterialShader.DoApply(var rci: TRenderContextInfo; Sender : TObject);
begin
   if not Assigned(FMaterialLibrary) then exit;

   FPass:=1;
   if not (csDesigning in ComponentState) then begin
      glPushAttrib(GL_ALL_ATTRIB_BITS);
      glEnable(GL_DEPTH_TEST);
      glDepthFunc(GL_LEQUAL);
      if FMaterialLibrary.Materials.Count>0 then
         FMaterialLibrary.Materials[0].Apply(rci);
  end;
end;

// DoUnApply
//
function TGLMultiMaterialShader.DoUnApply(
   var rci: TRenderContextInfo): Boolean;
begin
   Result:=False;
   if not Assigned(FMaterialLibrary) then exit;
   if not (csDesigning in ComponentState) then begin
      if FMaterialLibrary.Materials.Count>0 then
         FMaterialLibrary.Materials[FPass-1].UnApply(rci);
      if (FPass >= FMaterialLibrary.Materials.Count) then begin
         glDepthFunc(GL_LESS);
         glPopAttrib;
         exit;
      end;
      FMaterialLibrary.Materials[FPass].Apply(rci);
      Result:=True;
      Inc(FPass);
   end;
end;

// SetMaterialLibrary
//
procedure TGLMultiMaterialShader.SetMaterialLibrary(
   const val: TGLMaterialLibrary);
begin
   if val<>FMaterialLibrary then begin
      FMaterialLibrary:=val;
      NotifyChange(Self);
   end;
end;

end.
