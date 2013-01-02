// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'GeometryCoordinates.pas' rev: 24.00 (Win32)

#ifndef GeometrycoordinatesHPP
#define GeometrycoordinatesHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <VectorGeometry.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Geometrycoordinates
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall Cylindrical_Cartesian(const float r, const float theta, const float z1, float &x, float &y, float &z)/* overload */;
extern PACKAGE void __fastcall Cylindrical_Cartesian(const double r, const double theta, const double z1, double &x, double &y, double &z)/* overload */;
extern PACKAGE void __fastcall Cylindrical_Cartesian(const float r, const float theta, const float z1, float &x, float &y, float &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall Cylindrical_Cartesian(const double r, const double theta, const double z1, double &x, double &y, double &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall Cartesian_Cylindrical(const float x, const float y, const float z1, float &r, float &theta, float &z)/* overload */;
extern PACKAGE void __fastcall Cartesian_Cylindrical(const double x, const double y, const double z1, double &r, double &theta, double &z)/* overload */;
extern PACKAGE void __fastcall Spherical_Cartesian(const float r, const float theta, const float phi, float &x, float &y, float &z)/* overload */;
extern PACKAGE void __fastcall Spherical_Cartesian(const double r, const double theta, const double phi, double &x, double &y, double &z)/* overload */;
extern PACKAGE void __fastcall Spherical_Cartesian(const float r, const float theta, const float phi, float &x, float &y, float &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall Spherical_Cartesian(const double r, const double theta, const double phi, double &x, double &y, double &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall Cartesian_Spherical(const float x, const float y, const float z, float &r, float &theta, float &phi)/* overload */;
extern PACKAGE void __fastcall Cartesian_Spherical(const Vectortypes::TVector3f &v, float &r, float &theta, float &phi)/* overload */;
extern PACKAGE void __fastcall Cartesian_Spherical(const double x, const double y, const double z, double &r, double &theta, double &phi)/* overload */;
extern PACKAGE void __fastcall ProlateSpheroidal_Cartesian(const float xi, const float eta, const float phi, const float a, float &x, float &y, float &z)/* overload */;
extern PACKAGE void __fastcall ProlateSpheroidal_Cartesian(const double xi, const double eta, const double phi, const double a, double &x, double &y, double &z)/* overload */;
extern PACKAGE void __fastcall ProlateSpheroidal_Cartesian(const float xi, const float eta, const float phi, const float a, float &x, float &y, float &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall ProlateSpheroidal_Cartesian(const double xi, const double eta, const double phi, const double a, double &x, double &y, double &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall OblateSpheroidal_Cartesian(const float xi, const float eta, const float phi, const float a, float &x, float &y, float &z)/* overload */;
extern PACKAGE void __fastcall OblateSpheroidal_Cartesian(const double xi, const double eta, const double phi, const double a, double &x, double &y, double &z)/* overload */;
extern PACKAGE void __fastcall OblateSpheroidal_Cartesian(const float xi, const float eta, const float phi, const float a, float &x, float &y, float &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall OblateSpheroidal_Cartesian(const double xi, const double eta, const double phi, const double a, double &x, double &y, double &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall BipolarCylindrical_Cartesian(const float u, const float v, const float z1, const float a, float &x, float &y, float &z)/* overload */;
extern PACKAGE void __fastcall BipolarCylindrical_Cartesian(const double u, const double v, const double z1, const double a, double &x, double &y, double &z)/* overload */;
extern PACKAGE void __fastcall BipolarCylindrical_Cartesian(const float u, const float v, const float z1, const float a, float &x, float &y, float &z, int &ierr)/* overload */;
extern PACKAGE void __fastcall BipolarCylindrical_Cartesian(const double u, const double v, const double z1, const double a, double &x, double &y, double &z, int &ierr)/* overload */;
}	/* namespace Geometrycoordinates */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_GEOMETRYCOORDINATES)
using namespace Geometrycoordinates;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GeometrycoordinatesHPP
