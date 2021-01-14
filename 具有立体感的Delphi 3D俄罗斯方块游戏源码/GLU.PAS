//*********************************************************************
//
//  This translataion for Delphi 32 bit provided courtesy of:
//
//  Artemis Alliance, Inc.
//  289 E. 5th St, #211
//  St. Paul, Mn 55101
//  (612) 227-7172
//  71043.2142@compuserve.com
//
//  Custom software development, specializing in Delphi and CAD.
//
//
//*********************************************************************
//
// NOTE : If you find any errors or omissions please email them to
//        Richard Hansen at :
//
//        71043.2142@compuserve.com or 70242.3367@compuserve.com
//
//        Any future updates will be placed on the BDELPHI32 forum on
//        CompuServe.
//
//
//*********************************************************************
//  HISTORY
//*********************************************************************
//  03/25/96  First translation  RWH
//
//
//*********************************************************************


(*++ BUILD Version: 0004    // Increment this if a change has global effects

Copyright (c) 1985-95, Microsoft Corporation

Module Name:

    glu.h

Abstract:

    Procedure declarations, constant definitions and macros for the OpenGL
    Utility Library.

--*)

(*
** Copyright 1991-1993, Silicon Graphics, Inc.
** All Rights Reserved.
**
** This is UNPUBLISHED PROPRIETARY SOURCE CODE of Silicon Graphics, Inc.;
** the contents of this file may not be disclosed to third parties, copied or
** duplicated in any form, in whole or in part, without the prior written
** permission of Silicon Graphics, Inc.
**
** RESTRICTED RIGHTS LEGEND:
** Use, duplication or disclosure by the Government is subject to restrictions
** as set forth in subdivision (c)(1)(ii) of the Rights in Technical Data
** and Computer Software clause at DFARS 252.227-7013, and/or in similar or
** successor clauses in the FAR, DOD or NASA FAR Supplement. Unpublished -
** rights reserved under the Copyright Laws of the United States.
*)

unit GLU;

interface

Uses
  GL;

  
type
  TViewPortArray  = Array[0..3] of GLint;
  TMatrixDblArray = Array[0..15] of GLdouble;
  TMatrixFltArray = Array[0..15] of GLfloat;
  TCoordArray     = Array[0..2] of GLdouble;
  T4PointerArray  = Array[0..3] of Pointer;
  T4FloatArray    = Array[0..3] of GLfloat;


  TGLUquadricObj  = record end;
  PGLUquadricObj  = ^TGLUquadricObj;

  TGLUtesselator  = record end;
  PGLUtesselator  = ^TGLUtesselator;

  TGLUnurbsObj    = record end;
  PGLUnurbsObj    = ^TGLUnurbsObj;


//****           Callback function prototypes    ****
type
  // gluQuadricCallback
  TGLQuadricErrorProc   = Procedure(errcode: GLenum); stdcall;

  // gluNurbsCallback
  TGLNurbsErrorProc     = Procedure(errcode: GLenum); stdcall;

  // gluTessCallback
  TGLUtessBeginProc         = Procedure(atype: GLenum); stdcall;
  TGLUtessEdgeFlagProc      = Procedure(flag: GLboolean); stdcall;
  TGLUtessVertexProc        = Procedure(vertex_data: Pointer); stdcall;
  TGLUtessEndProc           = Procedure; stdcall;
  TGLUtessErrorProc         = Procedure(errno: GLenum);
  TGLUtessCombineProc       = Procedure(var coords: TCoordArray; var vertex_data: T4PointerArray;
                                        var weight: T4FloatArray; var dataOut: Pointer); stdcall;
  TGLUtessBeginDataProc     = Procedure(atype: GLenum; polygon_data: Pointer); stdcall;
  TGLUtessEdgeFlagDataProc  = Procedure(flag: GLboolean; polygon_data: Pointer); stdcall;
  TGLUtessVertexDataProc    = Procedure(vertex_data: Pointer; polygon_data: Pointer); stdcall;
  TGLUtessEndDataProc       = Procedure(polygon_data: Pointer); stdcall;
  TGLUtessErrorDataProc     = Procedure(errno: GLenum; polygon_data: Pointer); stdcall;
  TGLUtessCombineDataProc   = Procedure(var coords: TCoordArray; var vertex_data: T4PointerArray;
                                        var weight: T4FloatArray; var dataOut: Pointer; polygon_data: Pointer); stdcall;


Function gluErrorString(errCode: GLenum): PGLubyte;
                          stdcall; external 'GLU32.DLL';
Function gluErrorUnicodeStringEXT(errCode: GLenum): PWideChar;
                          stdcall; external 'GLU32.DLL';
Function gluGetString(name: GLenum): PGLubyte;
                          stdcall; external 'GLU32.DLL';
Procedure gluOrtho2D(left: GLdouble; right: GLdouble; bottom: GLdouble; top: GLdouble);
                          stdcall; external 'GLU32.DLL';
Procedure gluPerspective(fovy: GLdouble; aspect: GLdouble; zNear: GLdouble; zFar: GLdouble);
                          stdcall; external 'GLU32.DLL';
Procedure gluPickMatrix(x: GLdouble; y: GLdouble; width: GLdouble; height: GLdouble; viewport: TViewPortArray);
                          stdcall; external 'GLU32.DLL';
Procedure gluLookAt(eyex: GLdouble; eyey: GLdouble; eyez: GLdouble; centerx: GLdouble; centery: GLdouble;
                    centerz: GLdouble; upx: GLdouble; upy: GLdouble; upz: GLdouble);
                          stdcall; external 'GLU32.DLL';
Function gluProject(objx: GLdouble; objy: GLdouble; objz: GLdouble; const modelMatrix: TMatrixDblArray;
                    const projMatrix: TMatrixDblArray; const viewport: TViewPortArray;
                    var winx: GLdouble; var winy: GLdouble; var winz: GLdouble): INT;
                          stdcall; external 'GLU32.DLL';
Function gluUnProject(winx: GLdouble; winy: GLdouble; winz: GLdouble; const modelMatrix: TMatrixDblArray;
                      const projMatrix: TMatrixDblArray; const viewport: TViewPortArray; var objx: GLdouble;
                      var objy: GLdouble; var objz: GLdouble): INT;
                          stdcall; external 'GLU32.DLL';

Function gluScaleImage(format: GLenum; widthin: GLint; heightin: GLint; typein: GLenum; const datain;
                       widthout: GLint; heightout: GLint; typeout: GLenum; var dataout): INT;
                          stdcall; external 'GLU32.DLL';

Function gluBuild1DMipmaps(target: GLenum; components: GLint; width: GLint; format: GLenum; atype: GLenum;
                           const data): INT;
                          stdcall; external 'GLU32.DLL';
Function gluBuild2DMipmaps(target: GLenum; components: GLint; width: GLint; height: GLint; format: GLenum; atype: GLenum;
                           const data): INT;
                          stdcall; external 'GLU32.DLL';

Function gluNewQuadric: PGLUquadricObj;
                          stdcall; external 'GLU32.DLL';
Procedure gluDeleteQuadric(state: PGLUquadricObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluQuadricNormals(quadObject: PGLUquadricObj; normals: GLenum);
                          stdcall; external 'GLU32.DLL';
Procedure gluQuadricTexture(quadObject: PGLUquadricObj; textureCoords: GLboolean);
                          stdcall; external 'GLU32.DLL';
Procedure gluQuadricOrientation(quadObject: PGLUquadricObj; orientation: GLenum);
                          stdcall; external 'GLU32.DLL';
Procedure gluQuadricDrawStyle(quadObject: PGLUquadricObj; drawStyle: GLenum);
                          stdcall; external 'GLU32.DLL';
Procedure gluCylinder(qobj: PGLUquadricObj; baseRadius: GLdouble; topRadius: GLdouble; height: GLdouble;
                      slices: GLint; stacks: GLint);
                          stdcall; external 'GLU32.DLL';
Procedure gluDisk(qobj: PGLUquadricObj; innerRadius: GLdouble; outerRadius: GLdouble; slices: GLint; loops: GLint);
                          stdcall; external 'GLU32.DLL';
Procedure gluPartialDisk(qobj: PGLUquadricObj; innerRadius: GLdouble; outerRadius: GLdouble; slices: GLint;
                         loops: GLint; startAngle: GLdouble; sweepAngle: GLdouble);
                          stdcall; external 'GLU32.DLL';
Procedure gluSphere(qobj: PGLUquadricObj; radius: GLdouble; slices: GLint; stacks: GLint);
                          stdcall; external 'GLU32.DLL';
Procedure gluQuadricCallback(qobj: PGLUquadricObj; which: GLenum; callback: TGLQuadricErrorProc);
                          stdcall; external 'GLU32.DLL';

Function gluNewTess: PGLUtesselator;
                          stdcall; external 'GLU32.DLL';
Procedure gluDeleteTess(tess: PGLUtesselator);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessBeginPolygon(tess: PGLUtesselator; polygon_data: Pointer);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessBeginContour(tess: PGLUtesselator);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessVertex(tess: PGLUtesselator; var coords: TCoordArray; data: Pointer);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessEndContour(tess: PGLUtesselator);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessEndPolygon(tess: PGLUtesselator);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessProperty(tess: PGLUtesselator; which: GLenum; value: GLdouble);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessNormal(tess: PGLUtesselator; x: GLdouble; y: GLdouble; z: GLdouble);
                          stdcall; external 'GLU32.DLL';
Procedure gluTessCallback(tess: PGLUtesselator; which: GLenum; callback: Pointer);
                          stdcall; external 'GLU32.DLL';
Procedure gluGetTessProperty(tess: PGLUtesselator; which: GLenum; var value: GLdouble);
                          stdcall; external 'GLU32.DLL';


Function gluNewNurbsRenderer: PGLUnurbsObj;
                          stdcall; external 'GLU32.DLL';
Procedure gluDeleteNurbsRenderer(nobj: PGLUnurbsObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluBeginSurface(nobj: PGLUnurbsObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluBeginCurve(nobj: PGLUnurbsObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluEndCurve(nobj: PGLUnurbsObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluEndSurface(nobj: PGLUnurbsObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluBeginTrim(nobj: PGLUnurbsObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluEndTrim(nobj: PGLUnurbsObj);
                          stdcall; external 'GLU32.DLL';
Procedure gluPwlCurve(nobj: PGLUnurbsObj; count: GLint; parray: PGLfloat; stride: GLint; atype: GLenum);
                          stdcall; external 'GLU32.DLL';
Procedure gluNurbsCurve(nobj: PGLUnurbsObj; nknots: GLint; knot: PGLfloat; stride: GLint; ctlarray: PGLfloat;
                        order: GLint; atype: GLenum);
                          stdcall; external 'GLU32.DLL';
Procedure gluNurbsSurface(nobj: PGLUnurbsObj; sknot_count: GLint; sknot: PGLfloat; tknot_count: GLint; tknot: PGLfloat;
                          s_stride: GLint; t_stride: GLint; ctlarray: PGLfloat; sorder: GLint; torder: GLint; atype: GLenum);
                          stdcall; external 'GLU32.DLL';
Procedure gluLoadSamplingMatrices(nobj: PGLUnurbsObj; const modelMatrix: TMatrixFltArray; const projMatrix: TMatrixFltArray;
                                  const viewport: TViewPortArray);
                          stdcall; external 'GLU32.DLL';
Procedure gluNurbsProperty(nobj: PGLUnurbsObj; aproperty: GLenum; value: GLfloat);
                          stdcall; external 'GLU32.DLL';
Procedure gluGetNurbsProperty(nobj: PGLUnurbsObj; aproperty: GLenum; value: PGLfloat);
                          stdcall; external 'GLU32.DLL';
Procedure gluNurbsCallback(nobj: PGLUnurbsObj; which: GLenum; callback: TGLNurbsErrorProc);
                          stdcall; external 'GLU32.DLL';


//*** Generic constants ****
const
  GLU_VERSION_1_1             = 1;
  GLU_VERSION_1_2             = 1;

// Errors:(return value 0 = no error)
const
  GLU_INVALID_ENUM            = 100900;
  GLU_INVALID_VALUE           = 100901;
  GLU_OUT_OF_MEMORY           = 100902;
  GLU_INCOMPATIBLE_GL_VERSION = 100903;

// gets
const
  GLU_VERSION                 = 100800;
  GLU_EXTENSIONS              = 100801;

// For laughs:
const
  GLU_TRUE                    = GL_TRUE;
  GLU_FALSE                   = GL_FALSE;

//*** Quadric constants ****

// Types of normals:
const
  GLU_SMOOTH                  = 100000;
  GLU_FLAT                    = 100001;
  GLU_NONE                    = 100002;

// DrawStyle types:
const
  GLU_POINT                   = 100010;
  GLU_LINE                    = 100011;
  GLU_FILL                    = 100012;
  GLU_SILHOUETTE              = 100013;

// Orientation types:
const
  GLU_OUTSIDE                 = 100020;
  GLU_INSIDE                  = 100021;

// Callback types:
(*GLU_ERROR 100103*)


//*** Tesselation constants****/ }
const
  GLU_TESS_MAX_COORD          = 1.0e150;

// Property types:
const
  GLU_TESS_WINDING_RULE       = 100140;
  GLU_TESS_BOUNDARY_ONLY      = 100141;
  GLU_TESS_TOLERANCE          = 100142;

// Possible winding rules:
const
  GLU_TESS_WINDING_ODD        = 100130;
  GLU_TESS_WINDING_NONZERO    = 100131;
  GLU_TESS_WINDING_POSITIVE   = 100132;
  GLU_TESS_WINDING_NEGATIVE   = 100133;
  GLU_TESS_WINDING_ABS_GEQ_TWO= 100134;

// Callback types:
const
  GLU_TESS_BEGIN              = 100100;   { void(CALLBACK* )(GLenum type)}
  GLU_TESS_VERTEX             = 100101;   { void(CALLBACK* )(void*data)}
  GLU_TESS_END                = 100102;   { void(CALLBACK* )(void)}
  GLU_TESS_ERROR              = 100103;   { void(CALLBACK* )(GLenum errno)}
  GLU_TESS_EDGE_FLAG          = 100104;   { void(CALLBACK* )(GLboolean boundaryEdge)}
  GLU_TESS_COMBINE            = 100105;   { void(CALLBACK* )(GLdouble coords[3];
                                                              void      *data[4];
                                                              GLfloat   weight[4];
                                                              void      **dataOut)}
  GLU_TESS_BEGIN_DATA         = 100106;   { void(CALLBACK*)(GLenum    type;
                                                             void      *polygon_data)}
  GLU_TESS_VERTEX_DATA        = 100107;   { void(CALLBACK*)(void      *data;
                                                             void      *polygon_data)}
  GLU_TESS_END_DATA           = 100108;   { void(CALLBACK*)(void      *polygon_data)}
  GLU_TESS_ERROR_DATA         = 100109;   { void(CALLBACK*)(GLenum    errno;
                                                            void      *polygon_data)}
  GLU_TESS_EDGE_FLAG_DATA     = 100110;   { void(CALLBACK*)(GLboolean boundaryEdge;
                                                             void      *polygon_data)}
  GLU_TESS_COMBINE_DATA       = 100111;   { void(CALLBACK*)(GLdouble  coords[3];
                                                             void      *data[4];
                                                             GLfloat   weight[4];
                                                             void      **dataOut;
                                                             void      *polygon_data)}

// Errors:
const
  GLU_TESS_ERROR1             = 100151;
  GLU_TESS_ERROR2             = 100152;
  GLU_TESS_ERROR3             = 100153;
  GLU_TESS_ERROR4             = 100154;
  GLU_TESS_ERROR5             = 100155;
  GLU_TESS_ERROR6             = 100156;
  GLU_TESS_ERROR7             = 100157;
  GLU_TESS_ERROR8             = 100158;

  GLU_TESS_MISSING_BEGIN_POLYGON  = GLU_TESS_ERROR1;
  GLU_TESS_MISSING_BEGIN_CONTOUR  = GLU_TESS_ERROR2;
  GLU_TESS_MISSING_END_POLYGON    = GLU_TESS_ERROR3;
  GLU_TESS_MISSING_END_CONTOUR    = GLU_TESS_ERROR4;
  GLU_TESS_COORD_TOO_LARGE        = GLU_TESS_ERROR5;
  GLU_TESS_NEED_COMBINE_CALLBACK  = GLU_TESS_ERROR6;

//*** NURBS constants****

// Properties:
const
  GLU_AUTO_LOAD_MATRIX        = 100200;
  GLU_CULLING                 = 100201;
  GLU_SAMPLING_TOLERANCE      = 100203;
  GLU_DISPLAY_MODE            = 100204;
  GLU_PARAMETRIC_TOLERANCE    = 100202;
  GLU_SAMPLING_METHOD         = 100205;
  GLU_U_STEP                  = 100206;
  GLU_V_STEP                  = 100207;

// Sampling methods:
const
  GLU_PATH_LENGTH             = 100215;
  GLU_PARAMETRIC_ERROR        = 100216;
  GLU_DOMAIN_DISTANCE         = 100217;

// Trimming curve types
const
  GLU_MAP1_TRIM_2             = 100210;
  GLU_MAP1_TRIM_3             = 100211;

// Display modes:
// GLU_FILL 100012
const
  GLU_OUTLINE_POLYGON         = 100240;
  GLU_OUTLINE_PATCH           = 100241;

// Callbacks:
// GLU_ERROR 100103

// Errors:
const
  GLU_NURBS_ERROR1            = 100251;
  GLU_NURBS_ERROR2            = 100252;
  GLU_NURBS_ERROR3            = 100253;
  GLU_NURBS_ERROR4            = 100254;
  GLU_NURBS_ERROR5            = 100255;
  GLU_NURBS_ERROR6            = 100256;
  GLU_NURBS_ERROR7            = 100257;
  GLU_NURBS_ERROR8            = 100258;
  GLU_NURBS_ERROR9            = 100259;
  GLU_NURBS_ERROR10           = 100260;
  GLU_NURBS_ERROR11           = 100261;
  GLU_NURBS_ERROR12           = 100262;
  GLU_NURBS_ERROR13           = 100263;
  GLU_NURBS_ERROR14           = 100264;
  GLU_NURBS_ERROR15           = 100265;
  GLU_NURBS_ERROR16           = 100266;
  GLU_NURBS_ERROR17           = 100267;
  GLU_NURBS_ERROR18           = 100268;
  GLU_NURBS_ERROR19           = 100269;
  GLU_NURBS_ERROR20           = 100270;
  GLU_NURBS_ERROR21           = 100271;
  GLU_NURBS_ERROR22           = 100272;
  GLU_NURBS_ERROR23           = 100273;
  GLU_NURBS_ERROR24           = 100274;
  GLU_NURBS_ERROR25           = 100275;
  GLU_NURBS_ERROR26           = 100276;
  GLU_NURBS_ERROR27           = 100277;
  GLU_NURBS_ERROR28           = 100278;
  GLU_NURBS_ERROR29           = 100279;
  GLU_NURBS_ERROR30           = 100280;
  GLU_NURBS_ERROR31           = 100281;
  GLU_NURBS_ERROR32           = 100282;
  GLU_NURBS_ERROR33           = 100283;
  GLU_NURBS_ERROR34           = 100284;
  GLU_NURBS_ERROR35           = 100285;
  GLU_NURBS_ERROR36           = 100286;
  GLU_NURBS_ERROR37           = 100287;

//*** Backwards compatibility for old tesselator ***
(*
Type
  GLUtriangulatorObj = GLUTESSELATOR;


procedure gluBeginPolygon(tess: PGLUTESSELATOR);

Procedure   gluBeginPolygon( GLUtesselator *tess );

Procedure   gluNextContour(  GLUtesselator *tess;
                                 GLenum        type );

Procedure   gluEndPolygon(   GLUtesselator *tess );
*)

// Names without "TESS_" prefix
const
  GLU_BEGIN     = GLU_TESS_BEGIN;
  GLU_VERTEX    = GLU_TESS_VERTEX;
  GLU_END       = GLU_TESS_END;
  GLU_ERROR     = GLU_TESS_ERROR;
  GLU_EDGE_FLAG = GLU_TESS_EDGE_FLAG;


implementation

end.
