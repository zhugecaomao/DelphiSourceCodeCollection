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

    gl.h

Abstract:

    Procedure declarations, constant definitions and macros for the OpenGL
    component.

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

//*************************************************************/

unit GL;

interface

type
  INT            = Integer;
  UNSIGNED_INT   = Cardinal;
  UNSIGNED_CHAR  = Byte;
  SIGNED_CHAR    = ShortInt;
  SHORT          = SmallInt;
  UNSIGNED_SHORT = Word;
  FLOAT          = Single;
  DOUBLE_        = Double;

type
  GLenum        = UNSIGNED_INT;
  GLboolean     = Boolean;      {unsigned char}
  PGLboolean    = ^GLboolean;
  GLbitfield    = UNSIGNED_INT;
  GLbyte        = SIGNED_CHAR;
  PGLbyte       = ^GLbyte;
  GLshort       = SHORT;
  PGLshort      = ^GLshort;
  GLint         = INT;
  PGLint        = ^GLint;
  GLsizei       = INT;
  GLubyte       = UNSIGNED_CHAR;
  PGLubyte      = ^GLubyte;
  GLushort      = UNSIGNED_SHORT;
  PGLushort     = ^GLushort;
  GLuint        = UNSIGNED_INT;
  PGLuint       = ^GLuint;
  GLfloat       = FLOAT;
  PGLfloat      = ^GLfloat;
  GLclampf      = FLOAT;
  GLdouble      = DOUBLE_;
  PGLdouble     = ^GLdouble;
  GLclampd      = DOUBLE_;
  {void GLvoid;}


// AccumOp
const
  GL_ACCUM                  = $0100;
  GL_LOAD                   = $0101;
  GL_RETURN                 = $0102;
  GL_MULT                   = $0103;
  GL_ADD                    = $0104;

// AlphaFunction
const
  GL_NEVER                  = $0200;
  GL_LESS                   = $0201;
  GL_EQUAL                  = $0202;
  GL_LEQUAL                 = $0203;
  GL_GREATER                = $0204;
  GL_NOTEQUAL               = $0205;
  GL_GEQUAL                 = $0206;
  GL_ALWAYS                 = $0207;

// AttribMask
const
  GL_CURRENT_BIT            = $00000001;
  GL_POINT_BIT              = $00000002;
  GL_LINE_BIT               = $00000004;
  GL_POLYGON_BIT            = $00000008;
  GL_POLYGON_STIPPLE_BIT    = $00000010;
  GL_PIXEL_MODE_BIT         = $00000020;
  GL_LIGHTING_BIT           = $00000040;
  GL_FOG_BIT                = $00000080;
  GL_DEPTH_BUFFER_BIT       = $00000100;
  GL_ACCUM_BUFFER_BIT       = $00000200;
  GL_STENCIL_BUFFER_BIT     = $00000400;
  GL_VIEWPORT_BIT           = $00000800;
  GL_TRANSFORM_BIT          = $00001000;
  GL_ENABLE_BIT             = $00002000;
  GL_COLOR_BUFFER_BIT       = $00004000;
  GL_HINT_BIT               = $00008000;
  GL_EVAL_BIT               = $00010000;
  GL_LIST_BIT               = $00020000;
  GL_TEXTURE_BIT            = $00040000;
  GL_SCISSOR_BIT            = $00080000;
  GL_ALL_ATTRIB_BITS        = $000fffff;

// BeginMode
const
  GL_POINTS                 = $0000;
  GL_LINES                  = $0001;
  GL_LINE_LOOP              = $0002;
  GL_LINE_STRIP             = $0003;
  GL_TRIANGLES              = $0004;
  GL_TRIANGLE_STRIP         = $0005;
  GL_TRIANGLE_FAN           = $0006;
  GL_QUADS                  = $0007;
  GL_QUAD_STRIP             = $0008;
  GL_POLYGON                = $0009;

// BlendingFactorDest
const
(*GL_ZERO *)
(*GL_ONE *)
  GL_ZERO                   = 0;
  GL_ONE                    = 1;
  GL_SRC_COLOR              = $0300;
  GL_ONE_MINUS_SRC_COLOR    = $0301;
  GL_SRC_ALPHA              = $0302;
  GL_ONE_MINUS_SRC_ALPHA    = $0303;
  GL_DST_ALPHA              = $0304;
  GL_ONE_MINUS_DST_ALPHA    = $0305;
(*GL_SRC_ALPHA *)
(*GL_ONE_MINUS_SRC_ALPHA *)
(*GL_DST_ALPHA *)
(*GL_ONE_MINUS_DST_ALPHA *)

// BlendingFactorSrc
const
  GL_DST_COLOR              = $0306;
  GL_ONE_MINUS_DST_COLOR    = $0307;
  GL_SRC_ALPHA_SATURATE     = $0308;

// Boolean
const
  GL_TRUE                   = True;
  GL_FALSE                  = False;

// ClearBufferMask
(*GL_COLOR_BUFFER_BIT*)
(*GL_ACCUM_BUFFER_BIT*)
(*GL_STENCIL_BUFFER_BIT*)
(*GL_DEPTH_BUFFER_BIT*)

// ClipPlaneName
const
  GL_CLIP_PLANE0            = $3000;
  GL_CLIP_PLANE1            = $3001;
  GL_CLIP_PLANE2            = $3002;
  GL_CLIP_PLANE3            = $3003;
  GL_CLIP_PLANE4            = $3004;
  GL_CLIP_PLANE5            = $3005;

// ColorMaterialFace
(*GL_FRONT*)
(*GL_BACK*)
(*GL_FRONT_AND_BACK*)

// ColorMaterialParameter
(*GL_AMBIENT*)
(*GL_DIFFUSE*)
(*GL_SPECULAR*)
(*GL_EMISSION*)
(*GL_AMBIENT_AND_DIFFUSE*)

// ColorPointerType
(*GL_BYTE*)
(*GL_UNSIGNED_BYTE*)
(*GL_SHORT*)
(*GL_UNSIGNED_SHORT*)
(*GL_INT*)
(*GL_UNSIGNED_INT*)
(*GL_FLOAT*)
(*GL_DOUBLE_EXT*)

// CullFaceMode
(*GL_FRONT*)
(*GL_BACK*)
(*GL_FRONT_AND_BACK*)

// DepthFunction
(*GL_NEVER*)
(*GL_LESS*)
(*GL_EQUAL*)
(*GL_LEQUAL*)
(*GL_GREATER*)
(*GL_NOTEQUAL*)
(*GL_GEQUAL*)
(*GL_ALWAYS*)

// DrawBufferMode
const
  GL_NONE                   = 0;
  GL_FRONT_LEFT             = $0400;
  GL_FRONT_RIGHT            = $0401;
  GL_BACK_LEFT              = $0402;
  GL_BACK_RIGHT             = $0403;
  GL_FRONT                  = $0404;
  GL_BACK                   = $0405;
  GL_LEFT                   = $0406;
  GL_RIGHT                  = $0407;
  GL_FRONT_AND_BACK         = $0408;
  GL_AUX0                   = $0409;
  GL_AUX1                   = $040A;
  GL_AUX2                   = $040B;
  GL_AUX3                   = $040C;

// Enable
(*GL_FOG*)
(*GL_LIGHTING*)
(*GL_TEXTURE_1D*)
(*GL_TEXTURE_2D*)
(*GL_LINE_STIPPLE*)
(*GL_POLYGON_STIPPLE*)
(*GL_CULL_FACE*)
(*GL_ALPHA_TEST*)
(*GL_BLEND*)
(*GL_LOGIC_OP*)
(*GL_DITHER*)
(*GL_STENCIL_TEST*)
(*GL_DEPTH_TEST*)
(*GL_CLIP_PLANE0*)
(*GL_CLIP_PLANE1*)
(*GL_CLIP_PLANE2*)
(*GL_CLIP_PLANE3*)
(*GL_CLIP_PLANE4*)
(*GL_CLIP_PLANE5*)
(*GL_LIGHT0*)
(*GL_LIGHT1*)
(*GL_LIGHT2*)
(*GL_LIGHT3*)
(*GL_LIGHT4*)
(*GL_LIGHT5*)
(*GL_LIGHT6*)
(*GL_LIGHT7*)
(*GL_TEXTURE_GEN_S*)
(*GL_TEXTURE_GEN_T*)
(*GL_TEXTURE_GEN_R*)
(*GL_TEXTURE_GEN_Q*)
(*GL_MAP1_VERTEX_3*)
(*GL_MAP1_VERTEX_4*)
(*GL_MAP1_COLOR_4*)
(*GL_MAP1_INDEX*)
(*GL_MAP1_NORMAL*)
(*GL_MAP1_TEXTURE_COORD_1*)
(*GL_MAP1_TEXTURE_COORD_2*)
(*GL_MAP1_TEXTURE_COORD_3*)
(*GL_MAP1_TEXTURE_COORD_4*)
(*GL_MAP2_VERTEX_3*)
(*GL_MAP2_VERTEX_4*)
(*GL_MAP2_COLOR_4*)
(*GL_MAP2_INDEX*)
(*GL_MAP2_NORMAL*)
(*GL_MAP2_TEXTURE_COORD_1*)
(*GL_MAP2_TEXTURE_COORD_2*)
(*GL_MAP2_TEXTURE_COORD_3*)
(*GL_MAP2_TEXTURE_COORD_4*)
(*GL_POINT_SMOOTH*)
(*GL_LINE_SMOOTH*)
(*GL_POLYGON_SMOOTH*)
(*GL_SCISSOR_TEST*)
(*GL_COLOR_MATERIAL*)
(*GL_NORMALIZE*)
(*GL_AUTO_NORMAL*)
(*GL_VERTEX_ARRAY_EXT*)
(*GL_NORMAL_ARRAY_EXT*)
(*GL_COLOR_ARRAY_EXT*)
(*GL_INDEX_ARRAY_EXT*)
(*GL_TEXTURE_COORD_ARRAY_EXT*)
(*GL_EDGE_FLAG_ARRAY_EXT*)

// ErrorCode
const
  GL_NO_ERROR               = 0;
  GL_INVALID_ENUM           = $0500;
  GL_INVALID_VALUE          = $0501;
  GL_INVALID_OPERATION      = $0502;
  GL_STACK_OVERFLOW         = $0503;
  GL_STACK_UNDERFLOW        = $0504;
  GL_OUT_OF_MEMORY          = $0505;

// FeedBackMode
const
  GL_2D                     = $0600;
  GL_3D                     = $0601;
  GL_3D_COLOR               = $0602;
  GL_3D_COLOR_TEXTURE       = $0603;
  GL_4D_COLOR_TEXTURE       = $0604;

// FeedBackToken
const
  GL_PASS_THROUGH_TOKEN     = $0700;
  GL_POINT_TOKEN            = $0701;
  GL_LINE_TOKEN             = $0702;
  GL_POLYGON_TOKEN          = $0703;
  GL_BITMAP_TOKEN           = $0704;
  GL_DRAW_PIXEL_TOKEN       = $0705;
  GL_COPY_PIXEL_TOKEN       = $0706;
  GL_LINE_RESET_TOKEN       = $0707;

// FogMode
(*GL_LINEAR*)
const
  GL_EXP                    = $0800;
  GL_EXP2                   = $0801;

// FogParameter
(*GL_FOG_COLOR*)
(*GL_FOG_DENSITY*)
(*GL_FOG_END*)
(*GL_FOG_INDEX*)
(*GL_FOG_MODE*)
(*GL_FOG_START*)

// FrontFaceDirection
const
  GL_CW                     = $0900;
  GL_CCW                    = $0901;

// GetMapTarget
const
  GL_COEFF                  = $0A00;
  GL_ORDER                  = $0A01;
  GL_DOMAIN                 = $0A02;

// GetPixelMap
(*GL_PIXEL_MAP_I_TO_I*)
(*GL_PIXEL_MAP_S_TO_S*)
(*GL_PIXEL_MAP_I_TO_R*)
(*GL_PIXEL_MAP_I_TO_G*)
(*GL_PIXEL_MAP_I_TO_B*)
(*GL_PIXEL_MAP_I_TO_A*)
(*GL_PIXEL_MAP_R_TO_R*)
(*GL_PIXEL_MAP_G_TO_G*)
(*GL_PIXEL_MAP_B_TO_B*)
(*GL_PIXEL_MAP_A_TO_A*)

// GetPointerTarget
(*GL_VERTEX_ARRAY_POINTER_EXT*)
(*GL_NORMAL_ARRAY_POINTER_EXT*)
(*GL_COLOR_ARRAY_POINTER_EXT*)
(*GL_INDEX_ARRAY_POINTER_EXT*)
(*GL_TEXTURE_COORD_ARRAY_POINTER_EXT*)
(*GL_EDGE_FLAG_ARRAY_POINTER_EXT*)

// GetTarget
const
  GL_CURRENT_COLOR                  = $0B00;
  GL_CURRENT_INDEX                  = $0B01;
  GL_CURRENT_NORMAL                 = $0B02;
  GL_CURRENT_TEXTURE_COORDS         = $0B03;
  GL_CURRENT_RASTER_COLOR           = $0B04;
  GL_CURRENT_RASTER_INDEX           = $0B05;
  GL_CURRENT_RASTER_TEXTURE_COORDS  = $0B06;
  GL_CURRENT_RASTER_POSITION        = $0B07;
  GL_CURRENT_RASTER_POSITION_VALID  = $0B08;
  GL_CURRENT_RASTER_DISTANCE        = $0B09;
  GL_POINT_SMOOTH                   = $0B10;
  GL_POINT_SIZE                     = $0B11;
  GL_POINT_SIZE_RANGE               = $0B12;
  GL_POINT_SIZE_GRANULARITY         = $0B13;
  GL_LINE_SMOOTH                    = $0B20;
  GL_LINE_WIDTH                     = $0B21;
  GL_LINE_WIDTH_RANGE               = $0B22;
  GL_LINE_WIDTH_GRANULARITY         = $0B23;
  GL_LINE_STIPPLE                   = $0B24;
  GL_LINE_STIPPLE_PATTERN           = $0B25;
  GL_LINE_STIPPLE_REPEAT            = $0B26;
  GL_LIST_MODE                      = $0B30;
  GL_MAX_LIST_NESTING               = $0B31;
  GL_LIST_BASE                      = $0B32;
  GL_LIST_INDEX                     = $0B33;
  GL_POLYGON_MODE                   = $0B40;
  GL_POLYGON_SMOOTH                 = $0B41;
  GL_POLYGON_STIPPLE                = $0B42;
  GL_EDGE_FLAG                      = $0B43;
  GL_CULL_FACE                      = $0B44;
  GL_CULL_FACE_MODE                 = $0B45;
  GL_FRONT_FACE                     = $0B46;
  GL_LIGHTING                       = $0B50;
  GL_LIGHT_MODEL_LOCAL_VIEWER       = $0B51;
  GL_LIGHT_MODEL_TWO_SIDE           = $0B52;
  GL_LIGHT_MODEL_AMBIENT            = $0B53;
  GL_SHADE_MODEL                    = $0B54;
  GL_COLOR_MATERIAL_FACE            = $0B55;
  GL_COLOR_MATERIAL_PARAMETER       = $0B56;
  GL_COLOR_MATERIAL                 = $0B57;
  GL_FOG                            = $0B60;
  GL_FOG_INDEX                      = $0B61;
  GL_FOG_DENSITY                    = $0B62;
  GL_FOG_START                      = $0B63;
  GL_FOG_END                        = $0B64;
  GL_FOG_MODE                       = $0B65;
  GL_FOG_COLOR                      = $0B66;
  GL_DEPTH_RANGE                    = $0B70;
  GL_DEPTH_TEST                     = $0B71;
  GL_DEPTH_WRITEMASK                = $0B72;
  GL_DEPTH_CLEAR_VALUE              = $0B73;
  GL_DEPTH_FUNC                     = $0B74;
  GL_ACCUM_CLEAR_VALUE              = $0B80;
  GL_STENCIL_TEST                   = $0B90;
  GL_STENCIL_CLEAR_VALUE            = $0B91;
  GL_STENCIL_FUNC                   = $0B92;
  GL_STENCIL_VALUE_MASK             = $0B93;
  GL_STENCIL_FAIL                   = $0B94;
  GL_STENCIL_PASS_DEPTH_FAIL        = $0B95;
  GL_STENCIL_PASS_DEPTH_PASS        = $0B96;
  GL_STENCIL_REF                    = $0B97;
  GL_STENCIL_WRITEMASK              = $0B98;
  GL_MATRIX_MODE                    = $0BA0;
  GL_NORMALIZE                      = $0BA1;
  GL_VIEWPORT                       = $0BA2;
  GL_MODELVIEW_STACK_DEPTH          = $0BA3;
  GL_PROJECTION_STACK_DEPTH         = $0BA4;
  GL_TEXTURE_STACK_DEPTH            = $0BA5;
  GL_MODELVIEW_MATRIX               = $0BA6;
  GL_PROJECTION_MATRIX              = $0BA7;
  GL_TEXTURE_MATRIX                 = $0BA8;
  GL_ATTRIB_STACK_DEPTH             = $0BB0;
  GL_ALPHA_TEST                     = $0BC0;
  GL_ALPHA_TEST_FUNC                = $0BC1;
  GL_ALPHA_TEST_REF                 = $0BC2;
  GL_DITHER                         = $0BD0;
  GL_BLEND_DST                      = $0BE0;
  GL_BLEND_SRC                      = $0BE1;
  GL_BLEND                          = $0BE2;
  GL_LOGIC_OP_MODE                  = $0BF0;
  GL_LOGIC_OP                       = $0BF1;
  GL_AUX_BUFFERS                    = $0C00;
  GL_DRAW_BUFFER                    = $0C01;
  GL_READ_BUFFER                    = $0C02;
  GL_SCISSOR_BOX                    = $0C10;
  GL_SCISSOR_TEST                   = $0C11;
  GL_INDEX_CLEAR_VALUE              = $0C20;
  GL_INDEX_WRITEMASK                = $0C21;
  GL_COLOR_CLEAR_VALUE              = $0C22;
  GL_COLOR_WRITEMASK                = $0C23;
  GL_INDEX_MODE                     = $0C30;
  GL_RGBA_MODE                      = $0C31;
  GL_DOUBLEBUFFER                   = $0C32;
  GL_STEREO                         = $0C33;
  GL_RENDER_MODE                    = $0C40;
  GL_PERSPECTIVE_CORRECTION_HINT    = $0C50;
  GL_POINT_SMOOTH_HINT              = $0C51;
  GL_LINE_SMOOTH_HINT               = $0C52;
  GL_POLYGON_SMOOTH_HINT            = $0C53;
  GL_FOG_HINT                       = $0C54;
  GL_TEXTURE_GEN_S                  = $0C60;
  GL_TEXTURE_GEN_T                  = $0C61;
  GL_TEXTURE_GEN_R                  = $0C62;
  GL_TEXTURE_GEN_Q                  = $0C63;
  GL_PIXEL_MAP_I_TO_I               = $0C70;
  GL_PIXEL_MAP_S_TO_S               = $0C71;
  GL_PIXEL_MAP_I_TO_R               = $0C72;
  GL_PIXEL_MAP_I_TO_G               = $0C73;
  GL_PIXEL_MAP_I_TO_B               = $0C74;
  GL_PIXEL_MAP_I_TO_A               = $0C75;
  GL_PIXEL_MAP_R_TO_R               = $0C76;
  GL_PIXEL_MAP_G_TO_G               = $0C77;
  GL_PIXEL_MAP_B_TO_B               = $0C78;
  GL_PIXEL_MAP_A_TO_A               = $0C79;
  GL_PIXEL_MAP_I_TO_I_SIZE          = $0CB0;
  GL_PIXEL_MAP_S_TO_S_SIZE          = $0CB1;
  GL_PIXEL_MAP_I_TO_R_SIZE          = $0CB2;
  GL_PIXEL_MAP_I_TO_G_SIZE          = $0CB3;
  GL_PIXEL_MAP_I_TO_B_SIZE          = $0CB4;
  GL_PIXEL_MAP_I_TO_A_SIZE          = $0CB5;
  GL_PIXEL_MAP_R_TO_R_SIZE          = $0CB6;
  GL_PIXEL_MAP_G_TO_G_SIZE          = $0CB7;
  GL_PIXEL_MAP_B_TO_B_SIZE          = $0CB8;
  GL_PIXEL_MAP_A_TO_A_SIZE          = $0CB9;
  GL_UNPACK_SWAP_BYTES              = $0CF0;
  GL_UNPACK_LSB_FIRST               = $0CF1;
  GL_UNPACK_ROW_LENGTH              = $0CF2;
  GL_UNPACK_SKIP_ROWS               = $0CF3;
  GL_UNPACK_SKIP_PIXELS             = $0CF4;
  GL_UNPACK_ALIGNMENT               = $0CF5;
  GL_PACK_SWAP_BYTES                = $0D00;
  GL_PACK_LSB_FIRST                 = $0D01;
  GL_PACK_ROW_LENGTH                = $0D02;
  GL_PACK_SKIP_ROWS                 = $0D03;
  GL_PACK_SKIP_PIXELS               = $0D04;
  GL_PACK_ALIGNMENT                 = $0D05;
  GL_MAP_COLOR                      = $0D10;
  GL_MAP_STENCIL                    = $0D11;
  GL_INDEX_SHIFT                    = $0D12;
  GL_INDEX_OFFSET                   = $0D13;
  GL_RED_SCALE                      = $0D14;
  GL_RED_BIAS                       = $0D15;
  GL_ZOOM_X                         = $0D16;
  GL_ZOOM_Y                         = $0D17;
  GL_GREEN_SCALE                    = $0D18;
  GL_GREEN_BIAS                     = $0D19;
  GL_BLUE_SCALE                     = $0D1A;
  GL_BLUE_BIAS                      = $0D1B;
  GL_ALPHA_SCALE                    = $0D1C;
  GL_ALPHA_BIAS                     = $0D1D;
  GL_DEPTH_SCALE                    = $0D1E;
  GL_DEPTH_BIAS                     = $0D1;
  GL_MAX_EVAL_ORDER                 = $0D30;
  GL_MAX_LIGHTS                     = $0D31;
  GL_MAX_CLIP_PLANES                = $0D32;
  GL_MAX_TEXTURE_SIZE               = $0D33;
  GL_MAX_PIXEL_MAP_TABLE            = $0D34;
  GL_MAX_ATTRIB_STACK_DEPTH         = $0D35;
  GL_MAX_MODELVIEW_STACK_DEPTH      = $0D36;
  GL_MAX_NAME_STACK_DEPTH           = $0D37;
  GL_MAX_PROJECTION_STACK_DEPTH     = $0D38;
  GL_MAX_TEXTURE_STACK_DEPTH        = $0D39;
  GL_MAX_VIEWPORT_DIMS              = $0D3A;
  GL_SUBPIXEL_BITS                  = $0D50;
  GL_INDEX_BITS                     = $0D51;
  GL_RED_BITS                       = $0D52;
  GL_GREEN_BITS                     = $0D53;
  GL_BLUE_BITS                      = $0D54;
  GL_ALPHA_BITS                     = $0D55;
  GL_DEPTH_BITS                     = $0D56;
  GL_STENCIL_BITS                   = $0D57;
  GL_ACCUM_RED_BITS                 = $0D58;
  GL_ACCUM_GREEN_BITS               = $0D59;
  GL_ACCUM_BLUE_BITS                = $0D5A;
  GL_ACCUM_ALPHA_BITS               = $0D5B;
  GL_NAME_STACK_DEPTH               = $0D70;
  GL_AUTO_NORMAL                    = $0D80;
  GL_MAP1_COLOR_4                   = $0D90;
  GL_MAP1_INDEX                     = $0D91;
  GL_MAP1_NORMAL                    = $0D92;
  GL_MAP1_TEXTURE_COORD_1           = $0D93;
  GL_MAP1_TEXTURE_COORD_2           = $0D94;
  GL_MAP1_TEXTURE_COORD_3           = $0D95;
  GL_MAP1_TEXTURE_COORD_4           = $0D96;
  GL_MAP1_VERTEX_3                  = $0D97;
  GL_MAP1_VERTEX_4                  = $0D98;
  GL_MAP2_COLOR_4                   = $0DB0;
  GL_MAP2_INDEX                     = $0DB1;
  GL_MAP2_NORMAL                    = $0DB2;
  GL_MAP2_TEXTURE_COORD_1           = $0DB3;
  GL_MAP2_TEXTURE_COORD_2           = $0DB4;
  GL_MAP2_TEXTURE_COORD_3           = $0DB5;
  GL_MAP2_TEXTURE_COORD_4           = $0DB6;
  GL_MAP2_VERTEX_3                  = $0DB7;
  GL_MAP2_VERTEX_4                  = $0DB8;
  GL_MAP1_GRID_DOMAIN               = $0DD0;
  GL_MAP1_GRID_SEGMENTS             = $0DD1;
  GL_MAP2_GRID_DOMAIN               = $0DD2;
  GL_MAP2_GRID_SEGMENTS             = $0DD3;
  GL_TEXTURE_1D                     = $0DE0;
  GL_TEXTURE_2D                     = $0DE1;
(*GL_VERTEX_ARRAY_EXT*)
(*GL_NORMAL_ARRAY_EXT*)
(*GL_COLOR_ARRAY_EXT*)
(*GL_INDEX_ARRAY_EXT*)
(*GL_TEXTURE_COORD_ARRAY_EXT*)
(*GL_EDGE_FLAG_ARRAY_EXT*)
(*GL_VERTEX_ARRAY_SIZE_EXT*)
(*GL_VERTEX_ARRAY_TYPE_EXT*)
(*GL_VERTEX_ARRAY_STRIDE_EXT*)
(*GL_VERTEX_ARRAY_COUNT_EXT*)
(*GL_NORMAL_ARRAY_TYPE_EXT*)
(*GL_NORMAL_ARRAY_STRIDE_EXT*)
(*GL_NORMAL_ARRAY_COUNT_EXT*)
(*GL_COLOR_ARRAY_SIZE_EXT*)
(*GL_COLOR_ARRAY_TYPE_EXT*)
(*GL_COLOR_ARRAY_STRIDE_EXT*)
(*GL_COLOR_ARRAY_COUNT_EXT*)
(*GL_INDEX_ARRAY_TYPE_EXT*)
(*GL_INDEX_ARRAY_STRIDE_EXT*)
(*GL_INDEX_ARRAY_COUNT_EXT*)
(*GL_TEXTURE_COORD_ARRAY_SIZE_EXT*)
(*GL_TEXTURE_COORD_ARRAY_TYPE_EXT*)
(*GL_TEXTURE_COORD_ARRAY_STRIDE_EXT*)
(*GL_TEXTURE_COORD_ARRAY_COUNT_EXT*)
(*GL_EDGE_FLAG_ARRAY_STRIDE_EXT*)
(*GL_EDGE_FLAG_ARRAY_COUNT_EXT*)

// GetTextureParameter
(*GL_TEXTURE_MAG_FILTER*)
(*GL_TEXTURE_MIN_FILTER*)
(*GL_TEXTURE_WRAP_S*)
(*GL_TEXTURE_WRAP_T*)
const
  GL_TEXTURE_WIDTH          = $1000;
  GL_TEXTURE_HEIGHT         = $1001;
  GL_TEXTURE_COMPONENTS     = $1003;
  GL_TEXTURE_BORDER_COLOR   = $1004;
  GL_TEXTURE_BORDER         = $1005;

// HintMode
const
  GL_DONT_CARE              = $1100;
  GL_FASTEST                = $1101;
  GL_NICEST                 = $1102;

// HintTarget
(*GL_PERSPECTIVE_CORRECTION_HINT*)
(*GL_POINT_SMOOTH_HINT*)
(*GL_LINE_SMOOTH_HINT*)
(*GL_POLYGON_SMOOTH_HINT*)
(*GL_FOG_HINT*)

// IndexPointerType
(*GL_SHORT*)
(*GL_INT*)
(*GL_FLOAT*)
(*GL_DOUBLE_EXT*)

// LightModelParameter
(*GL_LIGHT_MODEL_AMBIENT*)
(*GL_LIGHT_MODEL_LOCAL_VIEWER*)
(*GL_LIGHT_MODEL_TWO_SIDE*)

// LightName
const
  GL_LIGHT0                 = $4000;
  GL_LIGHT1                 = $4001;
  GL_LIGHT2                 = $4002;
  GL_LIGHT3                 = $4003;
  GL_LIGHT4                 = $4004;
  GL_LIGHT5                 = $4005;
  GL_LIGHT6                 = $4006;
  GL_LIGHT7                 = $4007;

// LightParameter
const
  GL_AMBIENT                = $1200;
  GL_DIFFUSE                = $1201;
  GL_SPECULAR               = $1202;
  GL_POSITION               = $1203;
  GL_SPOT_DIRECTION         = $1204;
  GL_SPOT_EXPONENT          = $1205;
  GL_SPOT_CUTOFF            = $1206;
  GL_CONSTANT_ATTENUATION   = $1207;
  GL_LINEAR_ATTENUATION     = $1208;
  GL_QUADRATIC_ATTENUATION  = $1209;

// ListMode
const
  GL_COMPILE                = $1300;
  GL_COMPILE_AND_EXECUTE    = $1301;

// ListNameType
const
  GL_BYTE                   = $1400;
  GL_UNSIGNED_BYTE          = $1401;
  GL_SHORT                  = $1402;
  GL_UNSIGNED_SHORT         = $1403;
  GL_INT                    = $1404;
  GL_UNSIGNED_INT           = $1405;
  GL_FLOAT                  = $1406;
  GL_2_BYTES                = $1407;
  GL_3_BYTES                = $1408;
  GL_4_BYTES                = $1409;
  GL_DOUBLE_EXT             = $140A;

// LogicOp
const
  GL_CLEAR                  = $1500;
  GL_AND                    = $1501;
  GL_AND_REVERSE            = $1502;
  GL_COPY                   = $1503;
  GL_AND_INVERTED           = $1504;
  GL_NOOP                   = $1505;
  GL_XOR                    = $1506;
  GL_OR                     = $1507;
  GL_NOR                    = $1508;
  GL_EQUIV                  = $1509;
  GL_INVERT                 = $150A;
  GL_OR_REVERSE             = $150B;
  GL_COPY_INVERTED          = $150C;
  GL_OR_INVERTED            = $150D;
  GL_NAND                   = $150E;
  GL_SET                    = $150;

// MapTarget
(*GL_MAP1_COLOR_4*)
(*GL_MAP1_INDEX*)
(*GL_MAP1_NORMAL*)
(*GL_MAP1_TEXTURE_COORD_1*)
(*GL_MAP1_TEXTURE_COORD_2*)
(*GL_MAP1_TEXTURE_COORD_3*)
(*GL_MAP1_TEXTURE_COORD_4*)
(*GL_MAP1_VERTEX_3*)
(*GL_MAP1_VERTEX_4*)
(*GL_MAP2_COLOR_4*)
(*GL_MAP2_INDEX*)
(*GL_MAP2_NORMAL*)
(*GL_MAP2_TEXTURE_COORD_1*)
(*GL_MAP2_TEXTURE_COORD_2*)
(*GL_MAP2_TEXTURE_COORD_3*)
(*GL_MAP2_TEXTURE_COORD_4*)
(*GL_MAP2_VERTEX_3*)
(*GL_MAP2_VERTEX_4*)

// MaterialFace
(*GL_FRONT*)
(*GL_BACK*)
(*GL_FRONT_AND_BACK*)

// MaterialParameter
const
  GL_EMISSION               = $1600;
  GL_SHININESS              = $1601;
  GL_AMBIENT_AND_DIFFUSE    = $1602;
  GL_COLOR_INDEXES          = $1603;
(*GL_AMBIENT*)
(*GL_DIFFUSE*)
(*GL_SPECULAR*)

// MatrixMode
const
  GL_MODELVIEW              = $1700;
  GL_PROJECTION             = $1701;
  GL_TEXTURE                = $1702;

// MeshMode1
(*GL_POINT*)
(*GL_LINE*)

// MeshMode2
(*GL_POINT*)
(*GL_LINE*)
(*GL_FILL*)

// NormalPointerType
(*GL_BYTE*)
(*GL_SHORT*)
(*GL_INT*)
(*GL_FLOAT*)
(*GL_DOUBLE_EXT*)

// PixelCopyType*)
const
  GL_COLOR                  = $1800;
  GL_DEPTH                  = $1801;
  GL_STENCIL                = $1802;

// PixelFormat
const
  GL_COLOR_INDEX            = $1900;
  GL_STENCIL_INDEX          = $1901;
  GL_DEPTH_COMPONENT        = $1902;
  GL_RED                    = $1903;
  GL_GREEN                  = $1904;
  GL_BLUE                   = $1905;
  GL_ALPHA                  = $1906;
  GL_RGB                    = $1907;
  GL_RGBA                   = $1908;
  GL_LUMINANCE              = $1909;
  GL_LUMINANCE_ALPHA        = $190A;

// PixelMap
(*GL_PIXEL_MAP_I_TO_I*)
(*GL_PIXEL_MAP_S_TO_S*)
(*GL_PIXEL_MAP_I_TO_R*)
(*GL_PIXEL_MAP_I_TO_G*)
(*GL_PIXEL_MAP_I_TO_B*)
(*GL_PIXEL_MAP_I_TO_A*)
(*GL_PIXEL_MAP_R_TO_R*)
(*GL_PIXEL_MAP_G_TO_G*)
(*GL_PIXEL_MAP_B_TO_B*)
(*GL_PIXEL_MAP_A_TO_A*)

// PixelStore
(*GL_UNPACK_SWAP_BYTES*)
(*GL_UNPACK_LSB_FIRST*)
(*GL_UNPACK_ROW_LENGTH*)
(*GL_UNPACK_SKIP_ROWS*)
(*GL_UNPACK_SKIP_PIXELS*)
(*GL_UNPACK_ALIGNMENT*)
(*GL_PACK_SWAP_BYTES*)
(*GL_PACK_LSB_FIRST*)
(*GL_PACK_ROW_LENGTH*)
(*GL_PACK_SKIP_ROWS*)
(*GL_PACK_SKIP_PIXELS*)
(*GL_PACK_ALIGNMENT*)

// PixelTransfer
(*GL_MAP_COLOR*)
(*GL_MAP_STENCIL*)
(*GL_INDEX_SHIFT*)
(*GL_INDEX_OFFSET*)
(*GL_RED_SCALE*)
(*GL_RED_BIAS*)
(*GL_GREEN_SCALE*)
(*GL_GREEN_BIAS*)
(*GL_BLUE_SCALE*)
(*GL_BLUE_BIAS*)
(*GL_ALPHA_SCALE*)
(*GL_ALPHA_BIAS*)
(*GL_DEPTH_SCALE*)
(*GL_DEPTH_BIAS*)

// PixelType
const
  GL_BITMAP                 = $1A00;
(*GL_BYTE*)
(*GL_UNSIGNED_BYTE*)
(*GL_SHORT*)
(*GL_UNSIGNED_SHORT*)
(*GL_INT*)
(*GL_UNSIGNED_INT*)
(*GL_FLOAT*)

// PolygonMode
const
  GL_POINT                  = $1B00;
  GL_LINE                   = $1B01;
  GL_FILL                   = $1B02;

// ReadBufferMode
(*GL_FRONT_LEFT*)
(*GL_FRONT_RIGHT*)
(*GL_BACK_LEFT*)
(*GL_BACK_RIGHT*)
(*GL_FRONT*)
(*GL_BACK*)
(*GL_LEFT*)
(*GL_RIGHT*)
(*GL_AUX0*)
(*GL_AUX1*)
(*GL_AUX2*)
(*GL_AUX3*)

// RenderingMode
const
  GL_RENDER                 = $1C00;
  GL_FEEDBACK               = $1C01;
  GL_SELECT                 = $1C02;

// ShadingModel
const
  GL_FLAT                   = $1D00;
  GL_SMOOTH                 = $1D01;

// StencilFunction
(*GL_NEVER*)
(*GL_LESS*)
(*GL_EQUAL*)
(*GL_LEQUAL*)
(*GL_GREATER*)
(*GL_NOTEQUAL*)
(*GL_GEQUAL*)
(*GL_ALWAYS*)

// StencilOp
(*GL_ZERO*)
const
  GL_KEEP                   = $1E00;
  GL_REPLACE                = $1E01;
  GL_INCR                   = $1E02;
  GL_DECR                   = $1E03;
(*GL_INVERT*)

// StringName
const
  GL_VENDOR                 = $1F00;
  GL_RENDERER               = $1F01;
  GL_VERSION                = $1F02;
  GL_EXTENSIONS             = $1F03;

// TextureCoordName
const
  GL_S                      = $2000;
  GL_T                      = $2001;
  GL_R                      = $2002;
  GL_Q                      = $2003;

// TexCoordPointerType
(*GL_SHORT*)
(*GL_INT*)
(*GL_FLOAT*)
(*GL_DOUBLE_EXT*)

// TextureEnvMode
const
  GL_MODULATE               = $2100;
  GL_DECAL                  = $2101;
(*GL_BLEND*)

// TextureEnvParameter
const
  GL_TEXTURE_ENV_MODE       = $2200;
  GL_TEXTURE_ENV_COLOR      = $2201;

// TextureEnvTarget
const
  GL_TEXTURE_ENV            = $2300;

// TextureGenMode
const
  GL_EYE_LINEAR             = $2400;
  GL_OBJECT_LINEAR          = $2401;
  GL_SPHERE_MAP             = $2402;

// TextureGenParameter
const
  GL_TEXTURE_GEN_MODE       = $2500;
  GL_OBJECT_PLANE           = $2501;
  GL_EYE_PLANE              = $2502;

// TextureMagFilter
const
  GL_NEAREST                = $2600;
  GL_LINEAR                 = $2601;

// TextureMinFilter
(*GL_NEAREST*)
(*GL_LINEAR*)
const
  GL_NEAREST_MIPMAP_NEAREST = $2700;
  GL_LINEAR_MIPMAP_NEAREST  = $2701;
  GL_NEAREST_MIPMAP_LINEAR  = $2702;
  GL_LINEAR_MIPMAP_LINEAR   = $2703;

// TextureParameterName
const
  GL_TEXTURE_MAG_FILTER     = $2800;
  GL_TEXTURE_MIN_FILTER     = $2801;
  GL_TEXTURE_WRAP_S         = $2802;
  GL_TEXTURE_WRAP_T         = $2803;
(*GL_TEXTURE_BORDER_COLOR*)

// TextureTarget
(*GL_TEXTURE_1D*)
(*GL_TEXTURE_2D*)

// TextureWrapMode
const
  GL_CLAMP                  = $2900;
  GL_REPEAT                 = $2901;

// VertexPointerType
(*GL_SHORT*)
(*GL_INT*)
(*GL_FLOAT*)
(*GL_DOUBLE_EXT*)

// Extensions
const
  GL_EXT_vertex_array       = 1;
  GL_WIN_swap_hint          = 1;

// EXT_vertex_array
const
  GL_VERTEX_ARRAY_EXT               = $8074;
  GL_NORMAL_ARRAY_EXT               = $8075;
  GL_COLOR_ARRAY_EXT                = $8076;
  GL_INDEX_ARRAY_EXT                = $8077;
  GL_TEXTURE_COORD_ARRAY_EXT        = $8078;
  GL_EDGE_FLAG_ARRAY_EXT            = $8079;
  GL_VERTEX_ARRAY_SIZE_EXT          = $807A;
  GL_VERTEX_ARRAY_TYPE_EXT          = $807B;
  GL_VERTEX_ARRAY_STRIDE_EXT        = $807C;
  GL_VERTEX_ARRAY_COUNT_EXT         = $807D;
  GL_NORMAL_ARRAY_TYPE_EXT          = $807E;
  GL_NORMAL_ARRAY_STRIDE_EXT        = $807;
  GL_NORMAL_ARRAY_COUNT_EXT         = $8080;
  GL_COLOR_ARRAY_SIZE_EXT           = $8081;
  GL_COLOR_ARRAY_TYPE_EXT           = $8082;
  GL_COLOR_ARRAY_STRIDE_EXT         = $8083;
  GL_COLOR_ARRAY_COUNT_EXT          = $8084;
  GL_INDEX_ARRAY_TYPE_EXT           = $8085;
  GL_INDEX_ARRAY_STRIDE_EXT         = $8086;
  GL_INDEX_ARRAY_COUNT_EXT          = $8087;
  GL_TEXTURE_COORD_ARRAY_SIZE_EXT   = $8088;
  GL_TEXTURE_COORD_ARRAY_TYPE_EXT   = $8089;
  GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = $808A;
  GL_TEXTURE_COORD_ARRAY_COUNT_EXT  = $808B;
  GL_EDGE_FLAG_ARRAY_STRIDE_EXT     = $808C;
  GL_EDGE_FLAG_ARRAY_COUNT_EXT      = $808D;
  GL_VERTEX_ARRAY_POINTER_EXT       = $808E;
  GL_NORMAL_ARRAY_POINTER_EXT       = $808;
  GL_COLOR_ARRAY_POINTER_EXT        = $8090;
  GL_INDEX_ARRAY_POINTER_EXT        = $8091;
  GL_TEXTURE_COORD_ARRAY_POINTER_EXT= $8092;
  GL_EDGE_FLAG_ARRAY_POINTER_EXT    = $8093;


//*************************************************************

Procedure glAccum(op: GLenum; value: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glAlphaFunc(func: GLenum; ref: GLclampf);
                            stdcall; external 'OPENGL32.DLL';
Procedure glBegin(mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glBitmap(width: GLsizei; height: GLsizei; xorig: GLfloat;
                    yorig: GLfloat; xmove: GLfloat; ymove: GLfloat; bitmap: PGLubyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glBlendFunc(sfactor: GLenum; dfactor: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glCallList(list: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glCallLists(n: GLsizei; atype: GLenum; const lists);
                            stdcall; external 'OPENGL32.DLL';
Procedure glClear(mask: GLbitfield);
                            stdcall; external 'OPENGL32.DLL';
Procedure glClearAccum(red: GLfloat; green: GLfloat; blue: GLfloat; alpha: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glClearColor(red: GLclampf; green: GLclampf; blue: GLclampf; alpha: GLclampf);
                            stdcall; external 'OPENGL32.DLL';
Procedure glClearDepth(depth: GLclampd);
                            stdcall; external 'OPENGL32.DLL';
Procedure glClearIndex(c: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glClearStencil(s: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glClipPlane(plane: GLenum; equation: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3b(red: GLbyte; green: GLbyte; blue: GLbyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3bv(v: PGLbyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3d(red: GLdouble; green: GLdouble; blue: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3f(red: GLfloat; green: GLfloat; blue: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3i(red: GLint; green: GLint; blue: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3s(red: GLshort; green: GLshort; blue: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3ub(red: GLubyte; green: GLubyte; blue: GLubyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3ubv(v: PGLubyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3ui(red: GLuint; green: GLuint; blue: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3uiv(v: PGLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3us(red: GLushort; green: GLushort; blue: GLushort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor3usv(v: PGLushort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4b(red: GLbyte; green: GLbyte; blue:  GLbyte; alpha:  GLbyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4bv(v: PGLbyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4d(red: GLdouble; green: GLdouble; blue: GLdouble; alpha: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4f(red: GLfloat; green: GLfloat; blue: GLfloat; alpha: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4i(red: GLint; green: GLint; blue: GLint; alpha: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4s(red: GLshort; green: GLshort; blue: GLshort; alpha: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4ub(red: GLubyte; green: GLubyte; blue: GLubyte; alpha: GLubyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4ubv(v: PGLubyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4ui(red: GLuint; green: GLuint; blue: GLuint; alpha: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4uiv(v: PGLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4us(red: GLushort; green: GLushort; blue: GLushort; alpha: GLushort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColor4usv(v: PGLushort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColorMask(red: GLboolean; green: GLboolean; blue: GLboolean; alpha: GLboolean);
                            stdcall; external 'OPENGL32.DLL';
Procedure glColorMaterial(face: GLenum; mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glCopyPixels(x: GLint; y: GLint; width: GLsizei; height: GLsizei; atype: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glCullFace(mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glDeleteLists(list: GLuint; range: GLsizei);
                            stdcall; external 'OPENGL32.DLL';
Procedure glDepthFunc(func: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glDepthMask(flag: GLboolean);
                            stdcall; external 'OPENGL32.DLL';
Procedure glDepthRange(zNear: GLclampd; zFar: GLclampd);
                            stdcall; external 'OPENGL32.DLL';
Procedure glDisable(cap: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glDrawBuffer(mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glDrawPixels(width: GLsizei; height: GLsizei; format: GLenum; atype: GLenum; const pixels);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEdgeFlag(flag: GLboolean);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEdgeFlagv(flag: PGLboolean);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEnable(cap: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEnd;
                            stdcall; external 'OPENGL32.DLL';
Procedure glEndList;
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord1d(u: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord1dv(u: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord1f(u: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord1fv(u: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord2d(u: GLdouble; v: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord2dv(u: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord2f(u: GLfloat; v: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalCoord2fv(u: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalMesh1(mode: GLenum; i1: GLint; i2: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalMesh2(mode: GLenum; i1: GLint; i2: GLint; j1: GLint; j2: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalPoint1(i: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glEvalPoint2(i: GLint; j: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glFeedbackBuffer(size: GLsizei; atype: GLenum; buffer: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glFinish;
                            stdcall; external 'OPENGL32.DLL';
Procedure glFlush;
                            stdcall; external 'OPENGL32.DLL';
Procedure glFogf(pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glFogfv(pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glFogi(pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glFogiv(pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glFrontFace(mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glFrustum(left: GLdouble; right: GLdouble; bottom: GLdouble; top: GLdouble;
                     zNear: GLdouble; zFar: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
{WINGDIAPI GLuint APIENTRY glGenLists (GLsizei range);}
Function glGenLists(range: GLsizei): GLuint;
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetBooleanv(pname: GLenum; params: PGLboolean);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetClipPlane(plane: GLenum; equation: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetDoublev(pname: GLenum; params: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
{WINGDIAPI GLenum APIENTRY glGetError (void);}
Function glGetError: GLenum;
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetFloatv(pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetIntegerv(pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetLightfv(light: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetLightiv(light: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetMapdv(target: GLenum; query: GLenum; v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetMapfv(target: GLenum; query: GLenum; v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetMapiv(target: GLenum; query: GLenum; v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetMaterialfv(face: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetMaterialiv(face: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetPixelMapfv(map: GLenum; values: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetPixelMapuiv(map: GLenum; values: PGLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetPixelMapusv(map: GLenum; values: PGLushort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetPolygonStipple(mask: PGLubyte);
                            stdcall; external 'OPENGL32.DLL';
{WINGDIAPI const GLubyte * APIENTRY glGetString(GLenum name);}
Function glGetString(name: GLenum): PGLubyte;
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexEnvfv(target: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexEnviv(target: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexGendv(coord: GLenum; pname: GLenum; params: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexGenfv(coord: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexGeniv(coord: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexImage(target: GLenum; level: GLint; format: GLenum; atype: GLenum; pixels: Pointer);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexLevelParameterfv(target: GLenum; level: GLint; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexLevelParameteriv(target: GLenum; level: GLint; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexParameterfv(target: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glGetTexParameteriv(target: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glHint(target: GLenum; mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexMask(mask: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexd(c: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexdv(c: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexf(c: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexfv(c: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexi(c: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexiv(c: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexs(c: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glIndexsv(c: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glInitNames;
                            stdcall; external 'OPENGL32.DLL';
{WINGDIAPI GLboolean APIENTRY glIsEnabled(GLenum cap);}
Function glIsEnabled(cap: GLenum): GLboolean;
                            stdcall; external 'OPENGL32.DLL';
{WINGDIAPI GLboolean APIENTRY glIsList(GLuint list);}
Function glIsList(list: GLuint): GLboolean;
                            stdcall; external 'OPENGL32.DLL';
Procedure glLightModelf(pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLightModelfv(pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLightModeli(pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLightModeliv(pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLightf(light: GLenum; pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLightfv(light: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLighti(light: GLenum; pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLightiv(light: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLineStipple(factor: GLint; pattern: GLushort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLineWidth(width: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glListBase(base: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLoadIdentity;
                            stdcall; external 'OPENGL32.DLL';
Procedure glLoadMatrixd(m: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLoadMatrixf(m: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLoadName(name: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glLogicOp(opcode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMap1d(target: GLenum; u1: GLdouble; u2: GLdouble; stride: GLint; order: GLint; points: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMap1f(target: GLenum; u1: GLfloat; u2: GLfloat; stride: GLint; order: GLint; points: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMap2d(target: GLenum; u1: GLdouble; u2: GLdouble; ustride: GLint; uorder: GLint; v1: GLdouble; v2: GLdouble;
                  vstride: GLint; vorder: GLint; points: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMap2f(target: GLenum; u1: GLfloat; u2: GLfloat; ustride: GLint;
                  uorder: GLint; v1: GLfloat; v2: GLfloat; vstride: GLint; vorder: GLint; points: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMapGrid1d(un: GLint; u1: GLdouble; u2: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMapGrid1f(un: GLint; u1: GLfloat; u2: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMapGrid2d(un: GLint; u1: GLdouble; u2: GLdouble; vn: GLint; v1: GLdouble; v2: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMapGrid2f(un: GLint; u1: GLfloat; u2: GLfloat; vn: GLint; v1: GLfloat; v2: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMaterialf(face: GLenum; pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMaterialfv(face: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMateriali(face: GLenum; pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMaterialiv(face: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMatrixMode(mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMultMatrixd(m: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glMultMatrixf(m: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNewList(list: GLuint; mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3b(nx: GLbyte; ny: GLbyte; nz: GLbyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3bv(v: PGLbyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3d(nx: GLdouble; ny: GLdouble; nz: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3f(nx: GLfloat; ny: GLfloat; nz: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3i(nx: GLint; ny: GLint; nz: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3s(nx: GLshort; ny: GLshort; nz: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glNormal3sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glOrtho(left: GLdouble; right: GLdouble; bottom: GLdouble; top: GLdouble; zNear: GLdouble; zFar: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPassThrough(token: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelMapfv(map: GLenum; mapsize: GLsizei; values: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelMapuiv(map: GLenum; mapsize: GLsizei; values: PGLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelMapusv(map: GLenum; mapsize: GLsizei; values: PGLushort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelStoref(pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelStorei(pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelTransferf(pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelTransferi(pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPixelZoom(xfactor: GLfloat; yfactor: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPointSize(size: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPolygonMode(face: GLenum; mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPolygonStipple(mask: PGLubyte);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPopAttrib;
                            stdcall; external 'OPENGL32.DLL';
Procedure glPopMatrix;
                            stdcall; external 'OPENGL32.DLL';
Procedure glPopName;
                            stdcall; external 'OPENGL32.DLL';
Procedure glPushAttrib(mask: GLbitfield);
                            stdcall; external 'OPENGL32.DLL';
Procedure glPushMatrix;
                            stdcall; external 'OPENGL32.DLL';
Procedure glPushName(name: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2d(x: GLdouble; y: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2f(x: GLfloat; y: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2i(x: GLint; y: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2s(x: GLshort; y: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos2sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3d(x: GLdouble; y: GLdouble; z: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3f(x: GLfloat; y: GLfloat; z: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3i(x: GLint; y: GLint; z: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3s(x: GLshort; y: GLshort; z: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos3sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4d(x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4f(x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4i(x: GLint; y: GLint; z: GLint; w: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4s(x: GLshort; y: GLshort; z: GLshort; w: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRasterPos4sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glReadBuffer(mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glReadPixels(x: GLint; y: GLint; width: GLsizei; height: GLsizei; format: GLenum; atype: GLenum; pixels: Pointer);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRectd(x1: GLdouble; y1: GLdouble; x2: GLdouble; y2: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRectdv(v1: PGLdouble; v2: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRectf(x1: GLfloat; y1: GLfloat; x2: GLfloat; y2: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRectfv(v1: PGLfloat; v2: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRecti(x1: GLint; y1: GLint; x2: GLint; y2: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRectiv(v1: PGLint; v2: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRects(x1: GLshort; y1: GLshort; x2: GLshort; y2: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRectsv(v1: PGLshort; v2: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
{WINGDIAPI GLint APIENTRY glRenderMode(GLenum mode);}
Function glRenderMode(mode: GLenum): GLint;
                            stdcall; external 'OPENGL32.DLL';
Procedure glRotated(angle: GLdouble; x: GLdouble; y: GLdouble; z: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glRotatef(angle: GLfloat; x: GLfloat; y: GLfloat; z: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glScaled(x: GLdouble; y: GLdouble; z: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glScalef(x: GLfloat; y: GLfloat; z: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glScissor(x: GLint; y: GLint; width: GLsizei; height: GLsizei);
                            stdcall; external 'OPENGL32.DLL';
Procedure glSelectBuffer(size: GLsizei; buffer: PGLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glShadeModel(mode: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glStencilFunc(func: GLenum; ref: GLint; mask: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glStencilMask(mask: GLuint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glStencilOp(fail: GLenum; zfail: GLenum; zpass: GLenum);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1d(s: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1f(s: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1i(s: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1s(s: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord1sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2d(s: GLdouble; t: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2f(s: GLfloat; t: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2i(s: GLint; t: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2s(s: GLshort; t: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord2sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3d(s: GLdouble; t: GLdouble; r: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3f(s: GLfloat; t: GLfloat; r: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3i(s: GLint; t: GLint; r: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3s(s: GLshort; t: GLshort; r: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord3sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4d(s: GLdouble; t: GLdouble; r: GLdouble; q: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4f(s: GLfloat; t: GLfloat; r: GLfloat; q: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4i(s: GLint; t: GLint; r: GLint; q: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4s(s: GLshort; t: GLshort; r: GLshort; q: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexCoord4sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexEnvf(target: GLenum; pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexEnvfv(target: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexEnvi(target: GLenum; pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexEnviv(target: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexGend(coord: GLenum; pname: GLenum; param: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexGendv(coord: GLenum; pname: GLenum; params: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexGenf(coord: GLenum; pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexGenfv(coord: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexGeni(coord: GLenum; pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexGeniv(coord: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexImage1D(target: GLenum; level: GLint; components: GLint; width: GLsizei; border: GLint;
                       format: GLenum; atype: GLenum; const pixels);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexImage2D(target: GLenum; level: GLint; components: GLint; width: GLsizei; height: GLsizei;
                       border: GLint; format: GLenum; atype: GLenum; const pixels);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexParameterf(target: GLenum; pname: GLenum; param: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexParameterfv(target: GLenum; pname: GLenum; params: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexParameteri(target: GLenum; pname: GLenum; param: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTexParameteriv(target: GLenum; pname: GLenum; params: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTranslated(x: GLdouble; y: GLdouble; z: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glTranslatef(x: GLfloat; y: GLfloat; z: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2d(x: GLdouble; y: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2f(x: GLfloat; y: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2i(x: GLint; y: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2s(x: GLshort; y: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex2sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3d(x: GLdouble; y: GLdouble; z: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3f(x: GLfloat; y: GLfloat; z: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3i(x: GLint; y: GLint; z: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3s(x: GLshort; y: GLshort; z: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex3sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4d(x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4dv(v: PGLdouble);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4f(x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4fv(v: PGLfloat);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4i(x: GLint; y: GLint; z: GLint; w: GLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4iv(v: PGLint);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4s(x: GLshort; y: GLshort; z: GLshort; w: GLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glVertex4sv(v: PGLshort);
                            stdcall; external 'OPENGL32.DLL';
Procedure glViewport(x: GLint; y: GLint; width: GLsizei; height: GLsizei);
                            stdcall; external 'OPENGL32.DLL';

type
  // EXT_vertex_array
  {typedef void(APIENTRY * PFNGLARRAYELEMENTEXTPROC)(GLint i);}
  TPFNGLARRAYELEMENTEXTPROC = Procedure(i: GLint);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLDRAWARRAYSEXTPROC)(GLenum mode; GLint first; GLsizei count);}
  TPFNGLDRAWARRAYSEXTPROC = Procedure(mode: GLenum; first: GLint; count: GLsizei);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLVERTEXPOINTEREXTPROC)(GLint size; GLenum type; GLsizei stride;
                                                      GLsizei count; const GLvoid *pointer);}
  TPFNGLVERTEXPOINTEREXTPROC = Procedure(size: GLint; atype: GLenum; stride: GLsizei; count: GLsizei; const p);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLNORMALPOINTEREXTPROC)(GLenum type; GLsizei stride; GLsizei count; const GLvoid *pointer);}
  TPFNGLNORMALPOINTEREXTPROC = Procedure(atype: GLenum; stride: GLsizei; count: GLsizei; const p);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLCOLORPOINTEREXTPROC)(GLint size; GLenum type; GLsizei stride;
                                                    GLsizei count; const GLvoid *pointer);}
  TPFNGLCOLORPOINTEREXTPROC = Procedure(size: GLint; atype: GLenum; stride: GLsizei; count: GLsizei; const p);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLINDEXPOINTEREXTPROC)(GLenum type; GLsizei stride; GLsizei count; const GLvoid *pointer);}
  TPFNGLINDEXPOINTEREXTPROC = Procedure(atype: GLenum; stride: GLsizei; count: GLsizei; const p);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLTEXCOORDPOINTEREXTPROC)(GLint size; GLenum type; GLsizei stride;
                                                       GLsizei count; const GLvoid *pointer);}
  TPFNGLTEXCOORDPOINTEREXTPROC = Procedure(size: GLint; atype: GLenum; stride: GLsizei; count: GLsizei; const p);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLEDGEFLAGPOINTEREXTPROC)(GLsizei stride; GLsizei count; const GLboolean *pointer);}
  TPFNGLEDGEFLAGPOINTEREXTPROC = Procedure(stride: GLsizei; count: GLsizei; p: PGLboolean);
                                  stdcall;

  {typedef void(APIENTRY * PFNGLGETPOINTERVEXTPROC)(GLenum pname; GLvoid* *params);}
  TPFNGLGETPOINTERVEXTPROC = Procedure(pname: GLenum; var params: Pointer);
                                  stdcall;

  // WIN_swap_hint
  {typedef WINGDIAPI void(APIENTRY * PFNGLADDSWAPHINTRECTWINPROC) (GLint x; GLint y; GLsizei width; GLsizei height);}
  TPFNGLADDSWAPHINTRECTWINPROC = Procedure(x: GLint; y: GLint; width: GLsizei; height: GLsizei);
                                  stdcall;


implementation

end.

