//
// This unit is part of the GLScene Project, http://glscene.org
//
{: GLViewer<p>

   Platform independant viewer.<p>

    History:
      <li>21/03/07 - DaStr - Improved Cross-Platform compatibility
                             (thanks Burkhard Carstens) (Bugtracker ID = 1684432)
      <li>17/03/07 - DaStr - Dropped Kylix support in favor of FPC (BugTrackerID=1681585)
      <li>24/01/02 -  EG   - Initial version
}

unit GLViewer;

interface

{$I GLScene.inc}

uses
{$IFDEF FPC}
  GLLCLViewer;
{$ELSE}
  {$IFDEF UNIX}GLLinuxViewer; {$ENDIF UNIX}
  {$IFDEF MSWINDOWS}GLWin32Viewer; {$ENDIF MSWINDOWS}
{$ENDIF FPC}

type
{$IFDEF FPC}  //For FPC, always use LCLViewer
  TGLSceneViewer = class(GLLCLViewer.TGLSceneViewer);
{$ELSE}  // if not FPC then
  {$IFDEF UNIX}  // kylix
  TGLSceneViewer = class(GLLinuxViewer.TGLLinuxSceneViewer);
  {$ENDIF UNIX}
  {$IFDEF MSWINDOWS} // windows
  TGLSceneViewer = class(GLWin32Viewer.TGLWin32SceneViewer);
  {$ENDIF MSWINDOWS}
{$ENDIF FPC}

implementation

end.
 
