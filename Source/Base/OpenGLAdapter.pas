// This unit is part of the GLScene Project, http://glscene.org

{ : OpenGLAdapter<p>

  <b>History : </b><font size=-1><ul>
  <li>18/01/11 - Yar - Added entry points for AGL
  <li>23/10/10 - Yar - Added GL_NV_vdpau_interop
  <li>25/09/10 - Yar - Added GL_get_program_binary
  <li>10/09/10 - Yar - Added GL_ATI_Meminfo, GL_NVX_gpu_memory_info
  <li>04/08/10 - Yar - Added GL_AMDX_debug_output, GL_ARB_debug_output extension. Added WGL and GLX
  <li>21/05/10 - Yar - Creation
  </ul></font>
}

unit OpenGLAdapter;

interface

{$I GLScene.inc}
{$IFDEF DARWIN}
  {$LINKFRAMEWORK OpenGL}
{$ENDIF}

uses
{$IFDEF MSWINDOWS}
  Windows,
{$ENDIF }
{$IFDEF UNIX}
  Xlib, Types, LCLType, X, XUtil, dynlibs,
{$ENDIF}
  OpenGLTokens,
  VectorGeometry,
  VectorTypes,
  SysUtils;

type

  EOpenGLError = class(Exception);

  TGLExtensionsAndEntryPoints = class
  private
    FBuffer: string;
    FInitialized: boolean;
    FDebug: boolean;
    FDebugIds: GLuint;
    function CheckExtension(const Extension: string): boolean;
{$IFDEF SUPPORT_WGL}
    procedure ReadWGLExtensions;
    procedure ReadWGLImplementationProperties;
{$ENDIF}
{$IFDEF SUPPORT_GLX}
    procedure ReadGLXExtensions;
    procedure ReadGLXImplementationProperties;
{$ENDIF}
{$IFDEF DARWIN}
    procedure ReadAGLExtensions;
{$ENDIF}
    function GetAddress(ProcName: string): Pointer;
    function GetAddressNoSuffixes(ProcName: string): Pointer;
    function GetAddressAlt(ProcName1, ProcName2: string): Pointer;
    function GetCapAddress: Pointer;
  public

{$IFDEF GLS_REGIONS}{$REGION 'Extensions'}{$ENDIF}
    // supported version checks
    VERSION_1_0, VERSION_1_1, VERSION_1_2, VERSION_1_3, VERSION_1_4,
    VERSION_1_5, VERSION_2_0, VERSION_2_1, VERSION_3_0, VERSION_3_1,
    VERSION_3_2, VERSION_3_3, VERSION_4_0, VERSION_4_1: boolean;

    // ARB approved OpenGL extension checks
    ARB_blend_func_extended, ARB_color_buffer_float, ARB_compatibility,
    ARB_copy_buffer, ARB_depth_buffer_float, ARB_depth_clamp, ARB_depth_texture,
    ARB_draw_buffers, ARB_draw_buffers_blend, ARB_draw_elements_base_vertex,
    ARB_draw_indirect, ARB_draw_instanced, ARB_explicit_attrib_location,
    ARB_fragment_coord_conventions, ARB_fragment_program, ARB_fragment_program_shadow,
    ARB_fragment_shader, ARB_framebuffer_object, ARB_framebuffer_sRGB,
    ARB_geometry_shader4, ARB_gpu_shader_fp64, ARB_gpu_shader5,
    ARB_half_float_pixel, ARB_half_float_vertex, ARB_imaging, ARB_instanced_arrays,
    ARB_map_buffer_range, ARB_matrix_palette, ARB_multisample, ARB_multitexture,
    ARB_occlusion_query, ARB_occlusion_query2, ARB_pixel_buffer_object,
    ARB_point_parameters, ARB_point_sprite, ARB_provoking_vertex,
    ARB_sample_shading, ARB_sampler_objects, ARB_seamless_cube_map,
    ARB_shader_bit_encoding, ARB_shader_subroutine, ARB_shader_texture_lod,
    ARB_shading_language_100, ARB_shadow, ARB_shadow_ambient, ARB_shader_objects,
    ARB_sync, ARB_tessellation_shader, ARB_texture_border_clamp,
    ARB_texture_buffer_object, ARB_texture_buffer_object_rgb32,
    ARB_texture_compression, ARB_texture_compression_rgtc, ARB_texture_cube_map,
    ARB_texture_cube_map_array, ARB_texture_env_add, ARB_texture_env_combine,
    ARB_texture_env_crossbar, ARB_texture_env_dot3, ARB_texture_float,
    ARB_texture_gather, ARB_texture_mirrored_repeat, ARB_texture_multisample,
    ARB_texture_non_power_of_two, ARB_texture_query_lod, ARB_texture_rectangle,
    ARB_texture_rg, ARB_texture_rgb10_a2ui, ARB_texture_swizzle,
    ARB_timer_query, ARB_transform_feedback2, ARB_transform_feedback3,
    ARB_transpose_matrix, ARB_uniform_buffer_object, ARB_vertex_array_bgra,
    ARB_vertex_array_object, ARB_vertex_blend, ARB_vertex_buffer_object,
    ARB_vertex_program, ARB_vertex_shader, ARB_vertex_type_2_10_10_10_rev,
    ARB_window_pos, ARB_texture_compression_bptc, ARB_get_program_binary,

    // Vendor/EXT OpenGL extension checks
    _3DFX_multisample, _3DFX_tbuffer, _3DFX_texture_compression_FXT1,
    ATI_draw_buffers, ATI_texture_compression_3dc, ATI_texture_float,
    ATI_texture_mirror_once, S3_s3tc, EXT_abgr, EXT_bgra, EXT_bindable_uniform,
    EXT_blend_color, EXT_blend_equation_separate, EXT_blend_func_separate,
    EXT_blend_logic_op, EXT_blend_minmax, EXT_blend_subtract, EXT_Cg_shader,
    EXT_clip_volume_hint, EXT_compiled_vertex_array, EXT_copy_texture,
    EXT_depth_bounds_test, EXT_draw_buffers2, EXT_draw_instanced,
    EXT_draw_range_elements, EXT_fog_coord, EXT_framebuffer_blit,
    EXT_framebuffer_multisample, EXT_framebuffer_object, EXT_framebuffer_sRGB,
    EXT_geometry_shader4, EXT_gpu_program_parameters, EXT_gpu_shader4,
    EXT_multi_draw_arrays, EXT_multisample, EXT_packed_depth_stencil,
    EXT_packed_float, EXT_packed_pixels, EXT_paletted_texture,
    EXT_pixel_buffer_object, EXT_polygon_offset, EXT_rescale_normal,
    EXT_secondary_color, EXT_separate_specular_color, EXT_shadow_funcs,
    EXT_shared_texture_palette, EXT_stencil_clear_tag, EXT_stencil_two_side,
    EXT_stencil_wrap, EXT_texture3D, EXT_texture_array,
    EXT_texture_buffer_object, EXT_texture_compression_latc,
    EXT_texture_compression_rgtc, EXT_texture_compression_s3tc,
    EXT_texture_cube_map, EXT_texture_edge_clamp, EXT_texture_env_add,
    EXT_texture_env_combine, EXT_texture_env_dot3, EXT_texture_filter_anisotropic,
    EXT_texture_integer, EXT_texture_lod, EXT_texture_lod_bias,
    EXT_texture_mirror_clamp, EXT_texture_object, EXT_texture_rectangle,
    EXT_texture_sRGB, EXT_texture_shared_exponent, EXT_timer_query,
    EXT_transform_feedback, EXT_vertex_array, HP_occlusion_test,
    IBM_rasterpos_clip, KTX_buffer_region, MESA_resize_buffers, NV_blend_square,
    NV_conditional_render, NV_copy_image, NV_depth_buffer_float, NV_fence,
    NV_float_buffer, NV_fog_distance, NV_geometry_program4, NV_light_max_exponent,
    NV_multisample_filter_hint, NV_occlusion_query, NV_point_sprite,
    NV_primitive_restart, NV_register_combiners, NV_shader_buffer_load,
    NV_texgen_reflection, NV_texture_compression_vtc, NV_texture_env_combine4,
    NV_texture_rectangle, NV_texture_shader, NV_texture_shader2,
    NV_texture_shader3, NV_transform_feedback, NV_vertex_array_range,
    NV_vertex_array_range2, NV_vertex_buffer_unified_memory, NV_vertex_program,
    SGI_color_matrix, SGIS_generate_mipmap, SGIS_multisample,
    SGIS_texture_border_clamp, SGIS_texture_color_mask, SGIS_texture_edge_clamp,
    SGIS_texture_lod, SGIX_depth_texture, SGIX_shadow, SGIX_shadow_ambient,
    AMD_vertex_shader_tessellator, WIN_swap_hint, ATI_meminfo, NVX_gpu_memory_info,
    NV_vdpau_interop,

    // Graphics Remedy's Extensions
    GREMEDY_frame_terminator, GREMEDY_string_marker: boolean;
    AMDX_debug_output, ARB_debug_output: boolean;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'OpenGL 1.1 core functions and procedures'}{$ENDIF}
    BindTexture:
    procedure(target: TGLEnum; texture: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    BlendFunc:
    procedure(sfactor: TGLEnum; dfactor: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Clear:
    procedure(mask: TGLbitfield);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ClearColor:
    procedure(red, green, blue, alpha: TGLclampf);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ClearDepth:
    procedure(depth: TGLclampd);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ClearStencil:
    procedure(s: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ColorMask:
    procedure(red, green, blue, alpha: TGLboolean);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CopyTexImage1D:
    procedure(target: TGLEnum; level: TGLint; internalFormat: TGLEnum;
      X, y: TGLint; Width: TGLsizei; border: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CopyTexImage2D:
    procedure(target: TGLEnum; level: TGLint; internalFormat: TGLEnum;
      X, y: TGLint; Width, Height: TGLsizei; border: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CopyTexSubImage1D:
    procedure(target: TGLEnum; level, xoffset, X, y: TGLint; Width: TGLsizei);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CopyTexSubImage2D:
    procedure(target: TGLEnum; level, xoffset, yoffset, X, y: TGLint;
      Width, Height: TGLsizei);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CullFace:
    procedure(mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DeleteTextures:
    procedure(n: TGLsizei; textures: PGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DepthFunc:
    procedure(func: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DepthMask:
    procedure(flag: TGLboolean);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DepthRange:
    procedure(zNear, zFar: TGLclampd);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Disable:
    procedure(cap: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DrawArrays:
    procedure(mode: TGLEnum; First: TGLint; Count: TGLsizei);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DrawBuffer:
    procedure(mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DrawElements:
    procedure(mode: TGLEnum; Count: TGLsizei; atype: TGLEnum; indices: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Enable:
    procedure(cap: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Finish:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Flush:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    FrontFace:
    procedure(mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GenTextures:
    procedure(n: TGLsizei; textures: PGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetBooleanv:
    procedure(pname: TGLEnum; params: PGLboolean);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetDoublev:
    procedure(pname: TGLEnum; params: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetError:
    function: TGLuint;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetFloatv:
    procedure(pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetIntegerv:
    procedure(pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetPointerv:
    procedure(pname: TGLEnum; var params);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetString:
    function(Name: TGLEnum): PGLChar;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexImage:
    procedure(target: TGLEnum; level: TGLint; format, atype: TGLEnum; pixels: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexLevelParameterfv:
    procedure(target: TGLEnum; level: TGLint; pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexLevelParameteriv:
    procedure(target: TGLEnum; level: TGLint; pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexParameterfv:
    procedure(target, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexParameteriv:
    procedure(target, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Hint:
    procedure(target, mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    IsEnabled:
    function(cap: TGLEnum): TGLboolean;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    IsTexture:
    function(texture: TGLuint): TGLboolean;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LineWidth:
    procedure(Width: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LogicOp:
    procedure(opcode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelStoref:
    procedure(pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelStorei:
    procedure(pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PointSize:
    procedure(size: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PolygonMode:
    procedure(face, mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PolygonOffset:
    procedure(factor, units: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ReadBuffer:
    procedure(mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ReadPixels:
    procedure(X, y: TGLint; Width, Height: TGLsizei; format, atype: TGLEnum;
      pixels: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Scissor:
    procedure(X, y: TGLint; Width, Height: TGLsizei);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    StencilFunc:
    procedure(func: TGLEnum; ref: TGLint; mask: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    StencilMask:
    procedure(mask: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    StencilOp:
    procedure(fail, zfail, zpass: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexImage1D:
    procedure(target: TGLEnum; level, internalFormat: TGLint; Width: TGLsizei;
      border: TGLint; format, atype: TGLEnum; pixels: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexImage2D:
    procedure(target: TGLEnum; level, internalFormat: TGLint; Width, Height: TGLsizei;
      border: TGLint; format, atype: TGLEnum; pixels: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexParameterf:
    procedure(target, pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexParameterfv:
    procedure(target, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexParameteri:
    procedure(target, pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexParameteriv:
    procedure(target, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexSubImage1D:
    procedure(target: TGLEnum; level, xoffset: TGLint; Width: TGLsizei;
      format, atype: TGLEnum; pixels: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexSubImage2D:
    procedure(target: TGLEnum; level, xoffset, yoffset: TGLint;
      Width, Height: TGLsizei; format, atype: TGLEnum; pixels: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Viewport:
    procedure(X, y: TGLint; Width, Height: TGLsizei);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'OpenGL 1.1 deprecated'}{$ENDIF}
    Accum:
    procedure(op: TGLuint; Value: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    AlphaFunc:
    procedure(func: TGLEnum; ref: TGLclampf);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    AreTexturesResident:
    function(n: TGLsizei; textures: PGLuint; residences: PGLboolean): TGLboolean;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ArrayElement:
    procedure(i: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Begin_:
    procedure(mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Bitmap:
    procedure(Width: TGLsizei; Height: TGLsizei; xorig, yorig: TGLfloat;
      xmove: TGLfloat; ymove: TGLfloat; Bitmap: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CallList:
    procedure(list: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CallLists:
    procedure(n: TGLsizei; atype: TGLEnum; lists: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ClearAccum:
    procedure(red, green, blue, alpha: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ClearIndex:
    procedure(c: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ClipPlane:
    procedure(plane: TGLEnum; equation: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3b:
    procedure(red, green, blue: TGLbyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3bv:
    procedure(v: PGLbyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3d:
    procedure(red, green, blue: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3f:
    procedure(red, green, blue: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3i:
    procedure(red, green, blue: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3s:
    procedure(red, green, blue: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3ub:
    procedure(red, green, blue: TGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3ubv:
    procedure(v: PGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3ui:
    procedure(red, green, blue: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3uiv:
    procedure(v: PGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3us:
    procedure(red, green, blue: TGLushort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color3usv:
    procedure(v: PGLushort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4b:
    procedure(red, green, blue, alpha: TGLbyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4bv:
    procedure(v: PGLbyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4d:
    procedure(red, green, blue, alpha: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4f:
    procedure(red, green, blue, alpha: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4i:
    procedure(red, green, blue, alpha: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4s:
    procedure(red, green, blue, alpha: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4sv:
    procedure(v: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4ub:
    procedure(red, green, blue, alpha: TGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4ubv:
    procedure(v: PGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4ui:
    procedure(red, green, blue, alpha: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4uiv:
    procedure(v: PGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4us:
    procedure(red, green, blue, alpha: TGLushort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Color4usv:
    procedure(v: PGLushort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ColorMaterial:
    procedure(face: TGLEnum; mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ColorPointer:
    procedure(size: TGLint; atype: TGLEnum; stride: TGLsizei; Data: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    CopyPixels:
    procedure(X, y: TGLint; Width, Height: TGLsizei; atype: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DeleteLists:
    procedure(list: TGLuint; range: TGLsizei);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DisableClientState:
    procedure(aarray: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DrawPixels:
    procedure(Width, Height: TGLsizei; format, atype: TGLEnum; pixels: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EdgeFlag:
    procedure(flag: TGLboolean);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EdgeFlagPointer:
    procedure(stride: TGLsizei; Data: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EdgeFlagv:
    procedure(flag: PGLboolean);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EnableClientState:
    procedure(aarray: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    End_:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EndList:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord1d:
    procedure(u: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord1dv:
    procedure(u: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord1f:
    procedure(u: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord1fv:
    procedure(u: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord2d:
    procedure(u: TGLdouble; v: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord2dv:
    procedure(u: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord2f:
    procedure(u, v: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalCoord2fv:
    procedure(u: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalMesh1:
    procedure(mode: TGLEnum; i1, i2: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalMesh2:
    procedure(mode: TGLEnum; i1, i2, j1, j2: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalPoint1:
    procedure(i: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    EvalPoint2:
    procedure(i, j: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    FeedbackBuffer:
    procedure(size: TGLsizei; atype: TGLEnum; buffer: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Fogf:
    procedure(pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Fogfv:
    procedure(pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Fogi:
    procedure(pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Fogiv:
    procedure(pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Frustum:
    procedure(left, right, bottom, top, zNear, zFar: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GenLists:
    function(range: TGLsizei): TGLuint;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetClipPlane:
    procedure(plane: TGLEnum; equation: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetLightfv:
    procedure(light, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetLightiv:
    procedure(light, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetMapdv:
    procedure(target, query: TGLEnum; v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetMapfv:
    procedure(target, query: TGLEnum; v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetMapiv:
    procedure(target, query: TGLEnum; v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetMaterialfv:
    procedure(face, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetMaterialiv:
    procedure(face, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetPixelMapfv:
    procedure(map: TGLEnum; values: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetPixelMapuiv:
    procedure(map: TGLEnum; values: PGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetPixelMapusv:
    procedure(map: TGLEnum; values: PGLushort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetPolygonStipple:
    procedure(mask: PGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexEnvfv:
    procedure(target, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexEnviv:
    procedure(target, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexGendv:
    procedure(coord, pname: TGLEnum; params: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexGenfv:
    procedure(coord, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetTexGeniv:
    procedure(coord, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    IndexMask:
    procedure(mask: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    IndexPointer:
    procedure(atype: TGLEnum; stride: TGLsizei; Data: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexd:
    procedure(c: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexdv:
    procedure(c: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexf:
    procedure(c: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexfv:
    procedure(c: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexi:
    procedure(c: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexiv:
    procedure(c: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexs:
    procedure(c: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexsv:
    procedure(c: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexub:
    procedure(c: TGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Indexubv:
    procedure(c: PGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    InitNames:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    InterleavedArrays:
    procedure(format: TGLEnum; stride: TGLsizei; Data: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    IsList:
    function(list: TGLuint): TGLboolean;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LightModelf:
    procedure(pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LightModelfv:
    procedure(pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LightModeli:
    procedure(pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LightModeliv:
    procedure(pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Lightf:
    procedure(light, pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Lightfv:
    procedure(light, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Lighti:
    procedure(light, pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Lightiv:
    procedure(light, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LineStipple:
    procedure(factor: TGLint; pattern: TGLushort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ListBase:
    procedure(base: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LoadIdentity:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LoadMatrixd:
    procedure(m: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LoadMatrixf:
    procedure(m: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    LoadName:
    procedure(Name: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Map1d:
    procedure(target: TGLEnum; u1, u2: TGLdouble; stride, order: TGLint; points: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Map1f:
    procedure(target: TGLEnum; u1, u2: TGLfloat; stride, order: TGLint; points: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Map2d:
    procedure(target: TGLEnum; u1, u2: TGLdouble; ustride, uorder: TGLint;
      v1, v2: TGLdouble; vstride, vorder: TGLint; points: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Map2f:
    procedure(target: TGLEnum; u1, u2: TGLfloat; ustride, uorder: TGLint;
      v1, v2: TGLfloat; vstride, vorder: TGLint; points: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    MapGrid1d:
    procedure(un: TGLint; u1, u2: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    MapGrid1f:
    procedure(un: TGLint; u1, u2: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    MapGrid2d:
    procedure(un: TGLint; u1, u2: TGLdouble; vn: TGLint; v1, v2: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    MapGrid2f:
    procedure(un: TGLint; u1, u2: TGLfloat; vn: TGLint; v1, v2: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Materialf:
    procedure(face, pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Materialfv:
    procedure(face, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Materiali:
    procedure(face, pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Materialiv:
    procedure(face, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    MatrixMode:
    procedure(mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    MultMatrixd:
    procedure(m: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    MultMatrixf:
    procedure(m: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    NewList:
    procedure(list: TGLuint; mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3b:
    procedure(nx, ny, nz: TGLbyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3bv:
    procedure(v: PGLbyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3d:
    procedure(nx, ny, nz: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3f:
    procedure(nx, ny, nz: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3i:
    procedure(nx, ny, nz: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3s:
    procedure(nx, ny, nz: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Normal3sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    NormalPointer:
    procedure(atype: TGLEnum; stride: TGLsizei; Data: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Ortho:
    procedure(left, right, bottom, top, zNear, zFar: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PassThrough:
    procedure(token: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelMapfv:
    procedure(map: TGLEnum; mapsize: TGLsizei; values: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelMapuiv:
    procedure(map: TGLEnum; mapsize: TGLsizei; values: PGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelMapusv:
    procedure(map: TGLEnum; mapsize: TGLsizei; values: PGLushort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelTransferf:
    procedure(pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelTransferi:
    procedure(pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PixelZoom:
    procedure(xfactor, yfactor: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PolygonStipple:
    procedure(mask: PGLubyte);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PopAttrib:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PopClientAttrib:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PopMatrix:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PopName:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PrioritizeTextures:
    procedure(n: TGLsizei; textures: PGLuint; priorities: PGLclampf);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PushAttrib:
    procedure(mask: TGLbitfield);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PushClientAttrib:
    procedure(mask: TGLbitfield);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PushMatrix:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    PushName:
    procedure(Name: TGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2d:
    procedure(X, y: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2f:
    procedure(X, y: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2i:
    procedure(X, y: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2s:
    procedure(X, y: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos2sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3d:
    procedure(X, y, z: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3f:
    procedure(X, y, z: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3i:
    procedure(X, y, z: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3s:
    procedure(X, y, z: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos3sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4d:
    procedure(X, y, z, w: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4f:
    procedure(X, y, z, w: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4i:
    procedure(X, y, z, w: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4s:
    procedure(X, y, z, w: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RasterPos4sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rectd:
    procedure(x1, y1, x2, y2: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rectdv:
    procedure(v1, v2: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rectf:
    procedure(x1, y1, x2, y2: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rectfv:
    procedure(v1, v2: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Recti:
    procedure(x1, y1, x2, y2: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rectiv:
    procedure(v1, v2: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rects:
    procedure(x1, y1, x2, y2: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rectsv:
    procedure(v1, v2: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    RenderMode:
    function(mode: TGLEnum): TGLint;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rotated:
    procedure(ane, X, y, z: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Rotatef:
    procedure(ane, X, y, z: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Scaled:
    procedure(X, y, z: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Scalef:
    procedure(X, y, z: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    SelectBuffer:
    procedure(size: TGLsizei; buffer: PGLuint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    ShadeModel:
    procedure(mode: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1d:
    procedure(s: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1f:
    procedure(s: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1i:
    procedure(s: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1s:
    procedure(s: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord1sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2d:
    procedure(s, t: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2f:
    procedure(s, t: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2i:
    procedure(s, t: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2s:
    procedure(s, t: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord2sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3d:
    procedure(s, t, r: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3f:
    procedure(s, t, r: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3i:
    procedure(s, t, r: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3s:
    procedure(s, t, r: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord3sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4d:
    procedure(s, t, r, q: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4f:
    procedure(s, t, r, q: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4i:
    procedure(s, t, r, q: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4s:
    procedure(s, t, r, q: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoord4sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexCoordPointer:
    procedure(size: TGLint; atype: TGLEnum; stride: TGLsizei; Data: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexEnvf:
    procedure(target, pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexEnvfv:
    procedure(target, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexEnvi:
    procedure(target, pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexEnviv:
    procedure(target, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexGend:
    procedure(coord, pname: TGLEnum; param: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexGendv:
    procedure(coord, pname: TGLEnum; params: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexGenf:
    procedure(coord, pname: TGLEnum; param: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexGenfv:
    procedure(coord, pname: TGLEnum; params: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexGeni:
    procedure(coord, pname: TGLEnum; param: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    TexGeniv:
    procedure(coord, pname: TGLEnum; params: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Translated:
    procedure(X, y, z: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Translatef:
    procedure(X, y, z: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2d:
    procedure(X, y: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2f:
    procedure(X, y: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2i:
    procedure(X, y: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2s:
    procedure(X, y: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex2sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3d:
    procedure(X, y, z: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3f:
    procedure(X, y, z: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3i:
    procedure(X, y, z: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3s:
    procedure(X, y, z: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex3sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4d:
    procedure(X, y, z, w: TGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4dv:
    procedure(v: PGLdouble);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4f:
    procedure(X, y, z, w: TGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4fv:
    procedure(v: PGLfloat);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4i:
    procedure(X, y, z, w: TGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4iv:
    procedure(v: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4s:
    procedure(X, y, z, w: TGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    Vertex4sv:
    procedure(v: PGLshort);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VertexPointer:
    procedure(size: TGLint; atype: TGLEnum; stride: TGLsizei; Data: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'New core function/procedure definitions in OpenGL 1.2'}
{$ENDIF}
    BlendColor: PFNGLBLENDCOLORPROC;
    BlendEquation: PFNGLBLENDEQUATIONPROC;
    DrawRangeElements: PFNGLDRAWRANGEELEMENTSPROC;
    TexImage3D: PFNGLTEXIMAGE3DPROC;
    TexSubImage3D: PFNGLTEXSUBIMAGE3DPROC;
    CopyTexSubImage3D: PFNGLCOPYTEXSUBIMAGE3DPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'New core function/procedure definitions in OpenGL 1.4'}
{$ENDIF}
    BlendFuncSeparate: PFNGLBLENDFUNCSEPARATEPROC;
    MultiDrawArrays: PFNGLMULTIDRAWARRAYSPROC;
    MultiDrawElements: PFNGLMULTIDRAWELEMENTSPROC;
    PointParameterf: PFNGLPOINTPARAMETERFPROC;
    PointParameterfv: PFNGLPOINTPARAMETERFVPROC;
    PointParameteri: PFNGLPOINTPARAMETERIPROC;
    PointParameteriv: PFNGLPOINTPARAMETERIVPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'New core function/procedure definitions in OpenGL 2.0'}
{$ENDIF}
    BlendEquationSeparate: PFNGLBLENDEQUATIONSEPARATEPROC;
    DrawBuffers: PFNGLDRAWBUFFERSPROC;
    StencilOpSeparate: PFNGLSTENCILOPSEPARATEPROC;
    StencilFuncSeparate: PFNGLSTENCILFUNCSEPARATEPROC;
    StencilMaskSeparate: PFNGLSTENCILMASKSEPARATEPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'Vertex buffer object'}{$ENDIF}
    LockArrays: PFNGLLOCKARRAYSEXTPROC; // EXT only
    UnlockArrays: PFNGLUNLOCKARRAYSEXTPROC; // EXT only
    BindBuffer: PFNGLBINDBUFFERPROC;
    DeleteBuffers: PFNGLDELETEBUFFERSPROC;
    GenBuffers: PFNGLGENBUFFERSPROC;
    IsBuffer: PFNGLISBUFFERPROC;
    BufferData: PFNGLBUFFERDATAPROC;
    BufferSubData: PFNGLBUFFERSUBDATAPROC;
    GetBufferSubData: PFNGLGETBUFFERSUBDATAPROC;
    MapBuffer: PFNGLMAPBUFFERPROC;
    UnmapBuffer: PFNGLUNMAPBUFFERPROC;
    GetBufferParameteriv: PFNGLGETBUFFERPARAMETERIVPROC;
    GetBufferPointerv: PFNGLGETBUFFERPOINTERVPROC;
    MapBufferRange: PFNGLMAPBUFFERRANGEPROC;
    FlushMappedBufferRange: PFNGLFLUSHMAPPEDBUFFERRANGEPROC;
    BindBufferRange: PFNGLBINDBUFFERRANGEPROC;
    BindBufferOffset: PFNGLBINDBUFFEROFFSETEXTPROC; // EXT + NV only
    BindBufferBase: PFNGLBINDBUFFERBASEPROC;
    TransformFeedbackAttribs: PFNGLTRANSFORMFEEDBACKATTRIBSNVPROC; // NV only
    TransformFeedbackVaryingsNV: PFNGLTRANSFORMFEEDBACKVARYINGSNVPROC; // NV only
    TransformFeedbackVaryings: PFNGLTRANSFORMFEEDBACKVARYINGSPROC;
    GetTransformFeedbackVarying: PFNGLGETTRANSFORMFEEDBACKVARYINGPROC;
    BeginTransformFeedback: PFNGLBEGINTRANSFORMFEEDBACKPROC;
    EndTransformFeedback: PFNGLENDTRANSFORMFEEDBACKPROC;
    TexBuffer: PFNGLTEXBUFFERPROC;
    ClearBufferiv: PFNGLCLEARBUFFERIVPROC;
    ClearBufferuiv: PFNGLCLEARBUFFERUIVPROC;
    ClearBufferfv: PFNGLCLEARBUFFERFVPROC;
    ClearBufferfi: PFNGLCLEARBUFFERFIPROC;
    GetStringi: PFNGLGETSTRINGIPROC;
    BindVertexArray: PFNGLBINDVERTEXARRAYPROC;
    DeleteVertexArrays: PFNGLDELETEVERTEXARRAYSPROC;
    GenVertexArrays: PFNGLGENVERTEXARRAYSPROC;
    IsVertexArray: PFNGLISVERTEXARRAYPROC;
    FlushVertexArrayRangeNV: PFNGLFLUSHVERTEXARRAYRANGENVPROC;
    VertexArrayRangeNV: PFNGLVERTEXARRAYRANGENVPROC;
    GetUniformIndices: PFNGLGETUNIFORMINDICESPROC;
    GetActiveUniformsiv: PFNGLGETACTIVEUNIFORMSIVPROC;
    GetActiveUniformName: PFNGLGETACTIVEUNIFORMNAMEPROC;
    GetUniformBlockIndex: PFNGLGETUNIFORMBLOCKINDEXPROC;
    GetActiveUniformBlockiv: PFNGLGETACTIVEUNIFORMBLOCKIVPROC;
    GetActiveUniformBlockName: PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC;
    UniformBlockBinding: PFNGLUNIFORMBLOCKBINDINGPROC;
    CopyBufferSubData: PFNGLCOPYBUFFERSUBDATAPROC;
    UniformBuffer: PFNGLUNIFORMBUFFEREXTPROC;
    GetUniformBufferSize: PFNGLGETUNIFORMBUFFERSIZEEXTPROC; // EXT only
    GetUniformOffset: PFNGLGETUNIFORMOFFSETEXTPROC; // EXT only
    PrimitiveRestartIndex: PFNGLPRIMITIVERESTARTINDEXPROC;
    DrawElementsBaseVertex: PFNGLDRAWELEMENTSBASEVERTEXPROC;
    DrawRangeElementsBaseVertex: PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC;
    DrawElementsInstancedBaseVertex: PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC;
    MultiDrawElementsBaseVertex: PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC;
    DrawArraysInstanced: PFNGLDRAWARRAYSINSTANCEDPROC;
    DrawElementsInstanced: PFNGLDRAWELEMENTSINSTANCEDPROC;
    VertexAttrib1d: PFNGLVERTEXATTRIB1DPROC;
    VertexAttrib1dv: PFNGLVERTEXATTRIB1DVPROC;
    VertexAttrib1f: PFNGLVERTEXATTRIB1FPROC;
    VertexAttrib1fv: PFNGLVERTEXATTRIB1FVPROC;
    VertexAttrib1s: PFNGLVERTEXATTRIB1SPROC;
    VertexAttrib1sv: PFNGLVERTEXATTRIB1SVPROC;
    VertexAttrib2d: PFNGLVERTEXATTRIB2DPROC;
    VertexAttrib2dv: PFNGLVERTEXATTRIB2DVPROC;
    VertexAttrib2f: PFNGLVERTEXATTRIB2FPROC;
    VertexAttrib2fv: PFNGLVERTEXATTRIB2FVPROC;
    VertexAttrib2s: PFNGLVERTEXATTRIB2SPROC;
    VertexAttrib2sv: PFNGLVERTEXATTRIB2SVPROC;
    VertexAttrib3d: PFNGLVERTEXATTRIB3DPROC;
    VertexAttrib3dv: PFNGLVERTEXATTRIB3DVPROC;
    VertexAttrib3f: PFNGLVERTEXATTRIB3FPROC;
    VertexAttrib3fv: PFNGLVERTEXATTRIB3FVPROC;
    VertexAttrib3s: PFNGLVERTEXATTRIB3SPROC;
    VertexAttrib3sv: PFNGLVERTEXATTRIB3SVPROC;
    VertexAttrib4Nbv: PFNGLVERTEXATTRIB4NBVPROC;
    VertexAttrib4Niv: PFNGLVERTEXATTRIB4NIVPROC;
    VertexAttrib4Nsv: PFNGLVERTEXATTRIB4NSVPROC;
    VertexAttrib4Nub: PFNGLVERTEXATTRIB4NUBPROC;
    VertexAttrib4Nubv: PFNGLVERTEXATTRIB4NUBVPROC;
    VertexAttrib4Nuiv: PFNGLVERTEXATTRIB4NUIVPROC;
    VertexAttrib4Nusv: PFNGLVERTEXATTRIB4NUSVPROC;
    VertexAttrib4bv: PFNGLVERTEXATTRIB4BVPROC;
    VertexAttrib4d: PFNGLVERTEXATTRIB4DPROC;
    VertexAttrib4dv: PFNGLVERTEXATTRIB4DVPROC;
    VertexAttrib4f: PFNGLVERTEXATTRIB4FPROC;
    VertexAttrib4fv: PFNGLVERTEXATTRIB4FVPROC;
    VertexAttrib4iv: PFNGLVERTEXATTRIB4IVPROC;
    VertexAttrib4s: PFNGLVERTEXATTRIB4SPROC;
    VertexAttrib4sv: PFNGLVERTEXATTRIB4SVPROC;
    VertexAttrib4ubv: PFNGLVERTEXATTRIB4UBVPROC;
    VertexAttrib4uiv: PFNGLVERTEXATTRIB4UIVPROC;
    VertexAttrib4usv: PFNGLVERTEXATTRIB4USVPROC;
    VertexAttribPointer: PFNGLVERTEXATTRIBPOINTERPROC;
    VertexAttribI1i: PFNGLVERTEXATTRIBI1IPROC;
    VertexAttribI2i: PFNGLVERTEXATTRIBI2IPROC;
    VertexAttribI3i: PFNGLVERTEXATTRIBI3IPROC;
    VertexAttribI4i: PFNGLVERTEXATTRIBI4IPROC;
    VertexAttribI1ui: PFNGLVERTEXATTRIBI1UIPROC;
    VertexAttribI2ui: PFNGLVERTEXATTRIBI2UIPROC;
    VertexAttribI3ui: PFNGLVERTEXATTRIBI3UIPROC;
    VertexAttribI4ui: PFNGLVERTEXATTRIBI4UIPROC;
    VertexAttribI1iv: PFNGLVERTEXATTRIBI1IVPROC;
    VertexAttribI2iv: PFNGLVERTEXATTRIBI2IVPROC;
    VertexAttribI3iv: PFNGLVERTEXATTRIBI3IVPROC;
    VertexAttribI4iv: PFNGLVERTEXATTRIBI4IVPROC;
    VertexAttribI1uiv: PFNGLVERTEXATTRIBI1UIVPROC;
    VertexAttribI2uiv: PFNGLVERTEXATTRIBI2UIVPROC;
    VertexAttribI3uiv: PFNGLVERTEXATTRIBI3UIVPROC;
    VertexAttribI4uiv: PFNGLVERTEXATTRIBI4UIVPROC;
    VertexAttribI4bv: PFNGLVERTEXATTRIBI4BVPROC;
    VertexAttribI4sv: PFNGLVERTEXATTRIBI4SVPROC;
    VertexAttribI4ubv: PFNGLVERTEXATTRIBI4UBVPROC;
    VertexAttribI4usv: PFNGLVERTEXATTRIBI4USVPROC;
    VertexAttribIPointer: PFNGLVERTEXATTRIBIPOINTERPROC;
    GetVertexAttribIiv: PFNGLGETVERTEXATTRIBIIVPROC;
    GetVertexAttribIuiv: PFNGLGETVERTEXATTRIBIUIVPROC;
    Uniform1ui: PFNGLUNIFORM1UIPROC;
    Uniform2ui: PFNGLUNIFORM2UIPROC;
    Uniform3ui: PFNGLUNIFORM3UIPROC;
    Uniform4ui: PFNGLUNIFORM4UIPROC;
    Uniform1uiv: PFNGLUNIFORM1UIVPROC;
    Uniform2uiv: PFNGLUNIFORM2UIVPROC;
    Uniform3uiv: PFNGLUNIFORM3UIVPROC;
    Uniform4uiv: PFNGLUNIFORM4UIVPROC;
    GetUniformuiv: PFNGLGETUNIFORMUIVPROC;
    BindFragDataLocation: PFNGLBINDFRAGDATALOCATIONPROC;
    GetFragDataLocation: PFNGLGETFRAGDATALOCATIONPROC;
    ClampColor: PFNGLCLAMPCOLORPROC;
    ColorMaski: PFNGLCOLORMASKIPROC;
    GetBooleani_v: PFNGLGETBOOLEANI_VPROC;
    GetIntegeri_v: PFNGLGETINTEGERI_VPROC;
    Enablei: PFNGLENABLEIPROC;
    Disablei: PFNGLDISABLEIPROC;
    IsEnabledi: PFNGLISENABLEDIPROC;
    EnableVertexAttribArray: PFNGLENABLEVERTEXATTRIBARRAYPROC;
    DisableVertexAttribArray: PFNGLDISABLEVERTEXATTRIBARRAYPROC;
    VertexAttribDivisor: PFNGLVERTEXATTRIBDIVISORPROC;
    ClearColorIi: PFNGLCLEARCOLORIIEXTPROC; // EXT only
    ClearColorIui: PFNGLCLEARCOLORIUIEXTPROC; // EXT only
    TexParameterIiv: PFNGLTEXPARAMETERIIVPROC;
    TexParameterIuiv: PFNGLTEXPARAMETERIUIVPROC;
    GetTexParameterIiv: PFNGLGETTEXPARAMETERIIVPROC;
    GetTexParameterIuiv: PFNGLGETTEXPARAMETERIUIVPROC;
    PatchParameteri: PFNGLPATCHPARAMETERIPROC;
    PatchParameterfv: PFNGLPATCHPARAMETERFVPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'Shader object'}{$ENDIF}
    DeleteObject: PFNGLDELETEOBJECTARBPROC; // ARB only
    GetHandle: PFNGLGETHANDLEARBPROC; // ARB only
    DetachShader: PFNGLDETACHSHADERPROC;
    CreateShader: PFNGLCREATESHADERPROC;
    ShaderSource: PFNGLSHADERSOURCEPROC;
    CompileShader: PFNGLCOMPILESHADERPROC;
    CreateProgram: PFNGLCREATEPROGRAMPROC;
    AttachShader: PFNGLATTACHSHADERPROC;
    LinkProgram: PFNGLLINKPROGRAMPROC;
    UseProgram: PFNGLUSEPROGRAMPROC;
    ValidateProgram: PFNGLVALIDATEPROGRAMPROC;
    Uniform1f: PFNGLUNIFORM1FPROC;
    Uniform2f: PFNGLUNIFORM2FPROC;
    Uniform3f: PFNGLUNIFORM3FPROC;
    Uniform4f: PFNGLUNIFORM4FPROC;
    Uniform1i: PFNGLUNIFORM1IPROC;
    Uniform2i: PFNGLUNIFORM2IPROC;
    Uniform3i: PFNGLUNIFORM3IPROC;
    Uniform4i: PFNGLUNIFORM4IPROC;
    Uniform1fv: PFNGLUNIFORM1FVPROC;
    Uniform2fv: PFNGLUNIFORM2FVPROC;
    Uniform3fv: PFNGLUNIFORM3FVPROC;
    Uniform4fv: PFNGLUNIFORM4FVPROC;
    Uniform1iv: PFNGLUNIFORM1IVPROC;
    Uniform2iv: PFNGLUNIFORM2IVPROC;
    Uniform3iv: PFNGLUNIFORM3IVPROC;
    Uniform4iv: PFNGLUNIFORM4IVPROC;
    UniformMatrix2fv: PFNGLUNIFORMMATRIX2FVPROC;
    UniformMatrix3fv: PFNGLUNIFORMMATRIX3FVPROC;
    UniformMatrix4fv: PFNGLUNIFORMMATRIX4FVPROC;
    GetObjectParameterfv: PFNGLGETOBJECTPARAMETERFVARBPROC; // ARB only
    GetObjectParameteriv: PFNGLGETOBJECTPARAMETERIVARBPROC; // ARB only
    GetInfoLog: PFNGLGETINFOLOGARBPROC; // ARB only
    GetAttachedObjects: PFNGLGETATTACHEDOBJECTSARBPROC; // ARB only
    GetActiveAttrib: PFNGLGETACTIVEATTRIBPROC;
    GetActiveUniform: PFNGLGETACTIVEUNIFORMPROC;
    GetAttachedShaders: PFNGLGETATTACHEDSHADERSPROC;
    GetAttribLocation: PFNGLGETATTRIBLOCATIONPROC;
    GetProgramiv: PFNGLGETPROGRAMIVPROC;
    GetProgramInfoLog: PFNGLGETPROGRAMINFOLOGPROC;
    GetShaderiv: PFNGLGETSHADERIVPROC;
    GetShaderInfoLog: PFNGLGETSHADERINFOLOGPROC;
    GetShaderSource: PFNGLGETSHADERSOURCEPROC;
    GetUniformLocation: PFNGLGETUNIFORMLOCATIONPROC;
    GetUniformfv: PFNGLGETUNIFORMFVPROC;
    GetUniformiv: PFNGLGETUNIFORMIVPROC;
    GetVertexAttribdv: PFNGLGETVERTEXATTRIBDVPROC;
    GetVertexAttribfv: PFNGLGETVERTEXATTRIBFVPROC;
    GetVertexAttribiv: PFNGLGETVERTEXATTRIBIVPROC;
    GetVertexAttribPointerv: PFNGLGETVERTEXATTRIBPOINTERVPROC;
    IsProgram: PFNGLISPROGRAMPROC;
    IsShader: PFNGLISSHADERPROC;
    BindAttribLocation: PFNGLBINDATTRIBLOCATIONPROC;
    BindFragDataLocationIndexed: PFNGLBINDFRAGDATALOCATIONINDEXEDPROC;
    GetFragDataIndex: PFNGLGETFRAGDATAINDEXPROC;
    GetVaryingLocation: PFNGLGETVARYINGLOCATIONNVPROC; // NV only
    GetActiveVarying: PFNGLGETACTIVEVARYINGNVPROC; // NV only
    ActiveVarying: PFNGLACTIVEVARYINGNVPROC; // NV only
    GetProgramBinary: PFNGLGETPROGRAMBINARYPROC;
    ProgramBinary: PFNGLPROGRAMBINARYPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'Framebuffer object'}{$ENDIF}
    IsRenderbuffer: PFNGLISRENDERBUFFERPROC;
    BindRenderbuffer: PFNGLBINDRENDERBUFFERPROC;
    DeleteRenderbuffers: PFNGLDELETERENDERBUFFERSPROC;
    GenRenderbuffers: PFNGLGENRENDERBUFFERSPROC;
    RenderbufferStorage: PFNGLRENDERBUFFERSTORAGEPROC;
    RenderbufferStorageMultisample: PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC;
    GetRenderbufferParameteriv: PFNGLGETRENDERBUFFERPARAMETERIVPROC;
    IsFramebuffer: PFNGLISFRAMEBUFFERPROC;
    BindFramebuffer: PFNGLBINDFRAMEBUFFERPROC;
    DeleteFramebuffers: PFNGLDELETEFRAMEBUFFERSPROC;
    GenFramebuffers: PFNGLGENFRAMEBUFFERSPROC;
    CheckFramebufferStatus: PFNGLCHECKFRAMEBUFFERSTATUSPROC;
    FramebufferTexture: PFNGLFRAMEBUFFERTEXTUREPROC;
    FramebufferTexture1D: PFNGLFRAMEBUFFERTEXTURE1DPROC;
    FramebufferTexture2D: PFNGLFRAMEBUFFERTEXTURE2DPROC;
    FramebufferTexture3D: PFNGLFRAMEBUFFERTEXTURE3DPROC;
    FramebufferTextureLayer: PFNGLFRAMEBUFFERTEXTURELAYERPROC;
    FramebufferTextureFace: PFNGLFRAMEBUFFERTEXTUREFACEARBPROC; // ARB only
    FramebufferRenderbuffer: PFNGLFRAMEBUFFERRENDERBUFFERPROC;
    GetFramebufferAttachmentParameteriv: PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC;
    BlitFramebuffer: PFNGLBLITFRAMEBUFFERPROC;
    GenerateMipmap: PFNGLGENERATEMIPMAPPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'Queries object'}{$ENDIF}
    GenQueries: PFNGLGENQUERIESPROC;
    DeleteQueries: PFNGLDELETEQUERIESPROC;
    IsQuery: PFNGLISQUERYPROC;
    BeginQuery: PFNGLBEGINQUERYPROC;
    EndQuery: PFNGLENDQUERYPROC;
    GetQueryiv: PFNGLGETQUERYIVPROC;
    GetQueryObjectiv: PFNGLGETQUERYOBJECTIVPROC;
    GetQueryObjectuiv: PFNGLGETQUERYOBJECTUIVPROC;
    QueryCounter: PFNGLQUERYCOUNTERPROC;
    GetQueryObjecti64v: PFNGLGETQUERYOBJECTI64VPROC;
    GetQueryObjectui64v: PFNGLGETQUERYOBJECTUI64VPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'Sampler object'}{$ENDIF}
    // promoted to core v1.3 from GL_ARB_multitexture (#1)
    ActiveTexture: PFNGLACTIVETEXTUREPROC;
    SampleCoverage: PFNGLSAMPLECOVERAGEPROC;
    // promoted to core v1.3 from GL_ARB_texture_compression (#12)
    CompressedTexImage3D: PFNGLCOMPRESSEDTEXIMAGE3DPROC;
    CompressedTexImage2D: PFNGLCOMPRESSEDTEXIMAGE2DPROC;
    CompressedTexImage1D: PFNGLCOMPRESSEDTEXIMAGE1DPROC;
    CompressedTexSubImage3D: PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC;
    CompressedTexSubImage2D: PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC;
    CompressedTexSubImage1D: PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC;
    GetCompressedTexImage: PFNGLGETCOMPRESSEDTEXIMAGEPROC;
    ClientActiveTexture: PFNGLCLIENTACTIVETEXTUREPROC;
    MultiTexCoord1d: PFNGLMULTITEXCOORD1DPROC;
    MultiTexCoord1dV: PFNGLMULTITEXCOORD1DVPROC;
    MultiTexCoord1f: PFNGLMULTITEXCOORD1FPROC;
    MultiTexCoord1fv: PFNGLMULTITEXCOORD1FVPROC;
    MultiTexCoord1i: PFNGLMULTITEXCOORD1IPROC;
    MultiTexCoord1iv: PFNGLMULTITEXCOORD1IVPROC;
    MultiTexCoord1s: PFNGLMULTITEXCOORD1SPROC;
    MultiTexCoord1sv: PFNGLMULTITEXCOORD1SVPROC;
    MultiTexCoord2d: PFNGLMULTITEXCOORD2DPROC;
    MultiTexCoord2dv: PFNGLMULTITEXCOORD2DVPROC;
    MultiTexCoord2f: PFNGLMULTITEXCOORD2FPROC;
    MultiTexCoord2fv: PFNGLMULTITEXCOORD2FVPROC;
    MultiTexCoord2i: PFNGLMULTITEXCOORD2IPROC;
    MultiTexCoord2iv: PFNGLMULTITEXCOORD2IVPROC;
    MultiTexCoord2s: PFNGLMULTITEXCOORD2SPROC;
    MultiTexCoord2sv: PFNGLMULTITEXCOORD2SVPROC;
    MultiTexCoord3d: PFNGLMULTITEXCOORD3DPROC;
    MultiTexCoord3dv: PFNGLMULTITEXCOORD3DVPROC;
    MultiTexCoord3f: PFNGLMULTITEXCOORD3FPROC;
    MultiTexCoord3fv: PFNGLMULTITEXCOORD3FVPROC;
    MultiTexCoord3i: PFNGLMULTITEXCOORD3IPROC;
    MultiTexCoord3iv: PFNGLMULTITEXCOORD3IVPROC;
    MultiTexCoord3s: PFNGLMULTITEXCOORD3SPROC;
    MultiTexCoord3sv: PFNGLMULTITEXCOORD3SVPROC;
    MultiTexCoord4d: PFNGLMULTITEXCOORD4DPROC;
    MultiTexCoord4dv: PFNGLMULTITEXCOORD4DVPROC;
    MultiTexCoord4f: PFNGLMULTITEXCOORD4FPROC;
    MultiTexCoord4fv: PFNGLMULTITEXCOORD4FVPROC;
    MultiTexCoord4i: PFNGLMULTITEXCOORD4IPROC;
    MultiTexCoord4iv: PFNGLMULTITEXCOORD4IVPROC;
    MultiTexCoord4s: PFNGLMULTITEXCOORD4SPROC;
    MultiTexCoord4sv: PFNGLMULTITEXCOORD4SVPROC;
    GetInteger64i_v: PFNGLGETINTEGER64I_VPROC;
    GetBufferParameteri64v: PFNGLGETBUFFERPARAMETERI64VPROC;
    ProgramParameteri: PFNGLPROGRAMPARAMETERIPROC;
    ProgramString: PFNGLPROGRAMSTRINGARBPROC; // ARB only
    BindProgram: PFNGLBINDPROGRAMARBPROC; // ARB + NV only
    DeletePrograms: PFNGLDELETEPROGRAMSARBPROC; // ARB + NV only
    GenPrograms: PFNGLGENPROGRAMSARBPROC; // ARB + NV only
    ProgramEnvParameter4d: PFNGLPROGRAMENVPARAMETER4DARBPROC; // ARB only
    ProgramEnvParameter4dv: PFNGLPROGRAMENVPARAMETER4DVARBPROC; // ARB only
    ProgramEnvParameter4f: PFNGLPROGRAMENVPARAMETER4FARBPROC; // ARB only
    ProgramEnvParameter4fv: PFNGLPROGRAMENVPARAMETER4FVARBPROC; // ARB only
    ProgramLocalParameter4d: PFNGLPROGRAMLOCALPARAMETER4DARBPROC; // ARB only
    ProgramLocalParameter4dv: PFNGLPROGRAMLOCALPARAMETER4DVARBPROC; // ARB only
    ProgramLocalParameter4f: PFNGLPROGRAMLOCALPARAMETER4FARBPROC; // ARB only
    ProgramLocalParameter4fv: PFNGLPROGRAMLOCALPARAMETER4FVARBPROC; // ARB only
    GetProgramEnvParameterdv: PFNGLGETPROGRAMENVPARAMETERDVARBPROC; // ARB only
    GetProgramEnvParameterfv: PFNGLGETPROGRAMENVPARAMETERFVARBPROC; // ARB only
    GetProgramLocalParameterdv: PFNGLGETPROGRAMLOCALPARAMETERDVARBPROC; // ARB only
    GetProgramLocalParameterfv: PFNGLGETPROGRAMLOCALPARAMETERFVARBPROC; // ARB only
    TexImage2DMultisample: PFNGLTEXIMAGE2DMULTISAMPLEPROC;
    TexImage3DMultisample: PFNGLTEXIMAGE3DMULTISAMPLEPROC;
    GetMultisamplefv: PFNGLGETMULTISAMPLEFVPROC;
    SampleMaski: PFNGLSAMPLEMASKIPROC;
    ProvokingVertex: PFNGLPROVOKINGVERTEXPROC;
    FenceSync: PFNGLFENCESYNCPROC;
    IsSync: PFNGLISSYNCPROC;
    DeleteSync: PFNGLDELETESYNCPROC;
    ClientWaitSync: PFNGLCLIENTWAITSYNCPROC;
    WaitSync: PFNGLWAITSYNCPROC;
    GetInteger64v: PFNGLGETINTEGER64VPROC;
    GetSynciv: PFNGLGETSYNCIVPROC;
    BlendEquationi: PFNGLBLENDEQUATIONIPROC;
    BlendEquationSeparatei: PFNGLBLENDEQUATIONSEPARATEIPROC;
    BlendFunci: PFNGLBLENDFUNCIPROC;
    BlendFuncSeparatei: PFNGLBLENDFUNCSEPARATEIPROC;
    MinSampleShading: PFNGLMINSAMPLESHADINGPROC;
    GenSamplers: PFNGLGENSAMPLERSPROC;
    DeleteSamplers: PFNGLDELETESAMPLERSPROC;
    IsSampler: PFNGLISSAMPLERPROC;
    BindSampler: PFNGLBINDSAMPLERPROC;
    SamplerParameteri: PFNGLSAMPLERPARAMETERIPROC;
    SamplerParameteriv: PFNGLSAMPLERPARAMETERIVPROC;
    SamplerParameterf: PFNGLSAMPLERPARAMETERFPROC;
    SamplerParameterfv: PFNGLSAMPLERPARAMETERFVPROC;
    SamplerParameterIiv: PFNGLSAMPLERPARAMETERIIVPROC;
    SamplerParameterIuiv: PFNGLSAMPLERPARAMETERIUIVPROC;
    GetSamplerParameteriv: PFNGLGETSAMPLERPARAMETERIVPROC;
    GetSamplerParameterIiv: PFNGLGETSAMPLERPARAMETERIIVPROC;
    GetSamplerParameterfv: PFNGLGETSAMPLERPARAMETERFVPROC;
    GetSamplerParameterIfv: PFNGLGETSAMPLERPARAMETERIFVPROC;
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'Debugging'}{$ENDIF}
    // Special Gremedy debugger extension
    FrameTerminatorGREMEDY: PFNGLFRAMETERMINATORGREMEDYPROC;
    StringMarkerGREMEDY: PFNGLSTRINGMARKERGREMEDYPROC;
    DebugMessageEnableAMDX:
    procedure(category: GLenum; severity: GLenum; Count: GLSizei;
      var ids: GLuint; Enabled: boolean);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DebugMessageCallbackAMDX:
    procedure(callback: TDebugProcAMD; userParam: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DebugMessageControl:
    procedure(type_: GLenum; Source: GLenum; severity: GLenum; Count: GLSizei;
      var ids: GLuint; Enabled: boolean);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DebugMessageInsert:
    procedure(Source: GLenum; severity: GLenum; id: GLuint; length: GLSizei;
      const buf: PGLChar);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    DebugMessageCallback:
    procedure(callback: TDebugProc; userParam: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    GetDebugMessageLog:
    function(Count: GLuint; bufSize: GLSizei; var severity: GLenum;
      var severities: GLuint; var ids: GLuint; var lengths: GLSizei;
      messageLog: PGLChar): GLuint;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'Interrop'}{$ENDIF}
{$IFDEF LINUX}
    VDPAUInitNV:
    procedure(const vdpDevice: Pointer; const getProcAddress: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAUFiniNV:
    procedure();
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAURegisterVideoSurfaceNV:
    function(const vdpSurface: Pointer; target: TGLEnum; numTextureNames: TGLsizei;
      const textureNames: PGLuint): TGLvdpauSurfaceNV;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAURegisterOutputSurfaceNV:
    function(const vdpSurface: Pointer; target: TGLEnum; numTextureNames: TGLsizei;
      const textureNames: PGLuint): TGLvdpauSurfaceNV;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAUIsSurfaceNV:
    procedure(surface: TGLvdpauSurfaceNV);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAUUnregisterSurfaceNV:
    procedure(surface: TGLvdpauSurfaceNV);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAUGetSurfaceivNV:
    procedure(surface: TGLvdpauSurfaceNV; pname: TGLEnum; bufSize: TGLsizei;
      length: PGLsizei; values: PGLint);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAUSurfaceAccessNV:
    procedure(surface: TGLvdpauSurfaceNV; access: TGLEnum);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAUMapSurfacesNV:
    procedure(numSurfaces: TGLsizei; const surfaces: PGLvdpauSurfaceNV);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    VDPAUUnmapSurfacesNV:
    procedure(numSurface: TGLsizei; const surfaces: PGLvdpauSurfaceNV);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
{$ENDIF LINUX}
{$IFDEF GLS_REGIONS}{$ENDREGION 'Interrop'}{$ENDIF}
{$IFDEF GLS_REGIONS}
{$REGION 'Windows OpenGL (WGL) function/procedure definitions for ARB approved extensions'}
{$ENDIF}
{$IFDEF SUPPORT_WGL}
    // ###########################################################
    // function and procedure definitions for
    // ARB approved WGL extensions
    // ###########################################################

    // ARB approved WGL extension checks
    W_ARB_buffer_region, W_ARB_create_context, W_ARB_create_context_profile,
    W_ARB_extensions_string, W_ARB_framebuffer_sRGB, W_ARB_make_current_read,
    W_ARB_multisample, W_ARB_pbuffer, W_ARB_pixel_format, W_ARB_pixel_format_float,
    W_ARB_render_texture,

    // Vendor/EXT WGL extension checks
    W_ATI_pixel_format_float, W_EXT_framebuffer_sRGB,
    W_EXT_pixel_format_packed_float, W_EXT_swap_control, W_NV_gpu_affinity: boolean;

    // WGL_buffer_region (ARB #4)
    WCreateBufferRegionARB: PFNWGLCREATEBUFFERREGIONARBPROC;
    WDeleteBufferRegionARB: PFNWGLDELETEBUFFERREGIONARBPROC;
    WSaveBufferRegionARB: PFNWGLSAVEBUFFERREGIONARBPROC;
    WRestoreBufferRegionARB: PFNWGLRESTOREBUFFERREGIONARBPROC;

    // WGL_ARB_extensions_string (ARB #8)
    WGetExtensionsStringARB: PFNWGLGETEXTENSIONSSTRINGARBPROC;

    // WGL_ARB_pixel_format (ARB #9)
    WGetPixelFormatAttribivARB: PFNWGLGETPIXELFORMATATTRIBIVARBPROC;
    WGetPixelFormatAttribfvARB: PFNWGLGETPIXELFORMATATTRIBFVARBPROC;
    WChoosePixelFormatARB: PFNWGLCHOOSEPIXELFORMATARBPROC;

    // WGL_make_current_read (ARB #10)
    WMakeContextCurrentARB: PFNWGLMAKECONTEXTCURRENTARBPROC;
    WGetCurrentReadDCARB: PFNWGLGETCURRENTREADDCARBPROC;

    // WGL_ARB_pbuffer (ARB #11)
    WCreatePbufferARB: PFNWGLCREATEPBUFFERARBPROC;
    WGetPbufferDCARB: PFNWGLGETPBUFFERDCARBPROC;
    WReleasePbufferDCARB: PFNWGLRELEASEPBUFFERDCARBPROC;
    WDestroyPbufferARB: PFNWGLDESTROYPBUFFERARBPROC;
    WQueryPbufferARB: PFNWGLQUERYPBUFFERARBPROC;

    // WGL_ARB_render_texture (ARB #20)
    WBindTexImageARB: PFNWGLBINDTEXIMAGEARBPROC;
    WReleaseTexImageARB: PFNWGLRELEASETEXIMAGEARBPROC;
    WSetPbufferAttribARB: PFNWGLSETPBUFFERATTRIBARBPROC;

    // WGL_ARB_create_context (ARB #55)
    WCreateContextAttribsARB: PFNWGLCREATECONTEXTATTRIBSARBPROC;
    // WGL_NV_gpu_affinity
    WEnumGpusNV: PFNWGLENUMGPUSNVPROC;
    WEnumGpuDevicesNV: PFNWGLENUMGPUDEVICESNVPROC;
    WCreateAffinityDCNV: PFNWGLCREATEAFFINITYDCNVPROC;
    WEnumGpusFromAffinityDCNV: PFNWGLENUMGPUSFROMAFFINITYDCNVPROC;
    WDeleteDCNV: PFNWGLDELETEDCNVPROC;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}
{$REGION 'Windows OpenGL (WGL) function/procedure definitions for Vendor/EXT extensions'}
{$ENDIF}
{$IFDEF SUPPORT_WGL}
    // ###########################################################
    // function and procedure definitions for
    // Vendor/EXT WGL extensions
    // ###########################################################

    // WGL_EXT_swap_control (EXT #172)
    WSwapIntervalEXT: PFNWGLSWAPINTERVALEXTPROC;
    WGetSwapIntervalEXT: PFNWGLGETSWAPINTERVALEXTPROC;

    // GL_NV_vertex_array_range (EXT #190)
    WAllocateMemoryNV: PFNWGLALLOCATEMEMORYNVPROC;
    WFreeMemoryNV: PFNWGLFREEMEMORYNVPROC;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'GLX function/procedure definitions for ARB approved extensions'}
{$ENDIF}
{$IFDEF SUPPORT_GLX}
    // ###########################################################
    // function and procedure definitions for
    // ARB approved GLX extensions
    // ###########################################################

    // GLX extension checks
    X_VERSION_1_1, X_VERSION_1_2, X_VERSION_1_3, X_VERSION_1_4,
    X_ARB_create_context, X_ARB_create_context_profile, X_ARB_framebuffer_sRGB,
    X_ARB_multisample, X_EXT_framebuffer_sRGB, X_EXT_fbconfig_packed_float,
    X_SGIS_multisample, X_EXT_visual_info, X_SGI_swap_control,
    X_SGI_video_sync, X_SGI_make_current_read, X_SGIX_video_source,
    X_EXT_visual_rating, X_EXT_import_context, X_SGIX_fbconfig, X_SGIX_pbuffer,
    X_SGI_cushion, X_SGIX_video_resize, X_SGIX_dmbuffer, X_SGIX_swap_group,
    X_SGIX_swap_barrier, X_SGIS_blended_overlay, X_SGIS_shared_multisample,
    X_SUN_get_transparent_index, X_3DFX_multisample, X_MESA_copy_sub_buffer,
    X_MESA_pixmap_colormap, X_MESA_release_buffers, X_MESA_set_3dfx_mode,
    X_SGIX_visual_select_group, X_SGIX_hyperpipe, X_NV_multisample_coverage: boolean;

    // GLX 1.3 and later
    XChooseFBConfig: PFNGLXCHOOSEFBCONFIGPROC;
    XGetFBConfigAttrib: PFNGLXGETFBCONFIGATTRIBPROC;
    XGetFBConfigs: PFNGLXGETFBCONFIGSPROC;
    XGetVisualFromFBConfig: PFNGLXGETVISUALFROMFBCONFIGPROC;
    XCreateWindow: PFNGLXCREATEWINDOWPROC;
    XDestroyWindow: PFNGLXDESTROYWINDOWPROC;
    XCreatePixmap: PFNGLXCREATEPIXMAPPROC;
    XDestroyPixmap: PFNGLXDESTROYPIXMAPPROC;
    XCreatePbuffer: PFNGLXCREATEPBUFFERPROC;
    XDestroyPbuffer: PFNGLXDESTROYPBUFFERPROC;
    XQueryDrawable: PFNGLXQUERYDRAWABLEPROC;
    XCreateNewContext: PFNGLXCREATENEWCONTEXTPROC;
    XMakeContextCurrent: PFNGLXMAKECONTEXTCURRENTPROC;
    XGetCurrentReadDrawable: PFNGLXGETCURRENTREADDRAWABLEPROC;
    XQueryContext: PFNGLXQUERYCONTEXTPROC;
    XSelectEvent: PFNGLXSELECTEVENTPROC;
    XGetSelectedEvent: PFNGLXGETSELECTEDEVENTPROC;
    XBindTexImageARB: PFNGLXBINDTEXIMAGEARBPROC;
    XReleaseTexImageARB: PFNGLXRELEASETEXIMAGEARBPROC;
    XDrawableAttribARB: PFNGLXDRAWABLEATTRIBARBPROC;

    // GLX 1.4
    // X_ARB_create_context (EXT #56)
    XCreateContextAttribsARB: PFNGLXCREATECONTEXTATTRIBSARBPROC;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'GLX function/procedure definitions for Vendor/EXT extensions'}
{$ENDIF}
{$IFDEF SUPPORT_GLX}
    // ###########################################################
    // function and procedure definitions for
    // Vendor/EXT GLX extensions
    // ###########################################################

    // X_SGI_swap_control (EXT #40)
    XSwapIntervalSGI: PFNGLXSWAPINTERVALSGIPROC;
    XGetVideoSyncSGI: PFNGLXGETVIDEOSYNCSGIPROC;
    XWaitVideoSyncSGI: PFNGLXWAITVIDEOSYNCSGIPROC;
    XFreeContextEXT: PFNGLXFREECONTEXTEXTPROC;
    XGetContextIDEXT: PFNGLXGETCONTEXTIDEXTPROC;
    XGetCurrentDisplayEXT: PFNGLXGETCURRENTDISPLAYEXTPROC;
    XImportContextEXT: PFNGLXIMPORTCONTEXTEXTPROC;
    XQueryContextInfoEXT: PFNGLXQUERYCONTEXTINFOEXTPROC;
    XCopySubBufferMESA: PFNGLXCOPYSUBBUFFERMESAPROC;
    XCreateGLXPixmapMESA: PFNGLXCREATEGLXPIXMAPMESAPROC;
    XReleaseBuffersMESA: PFNGLXRELEASEBUFFERSMESAPROC;
    XSet3DfxModeMESA: PFNGLXSET3DFXMODEMESAPROC;

    XBindTexImageEXT: PFNGLXBINDTEXIMAGEEXTPROC;
    XReleaseTexImageEXT: PFNGLXRELEASETEXIMAGEEXTPROC;

    // GLX 1.4
    XMakeCurrentReadSGI: PFNGLXMAKECURRENTREADSGIPROC;
    XGetCurrentReadDrawableSGI: PFNGLXGETCURRENTREADDRAWABLESGIPROC;
    XGetFBConfigAttribSGIX: PFNGLXGETFBCONFIGATTRIBSGIXPROC;
    XChooseFBConfigSGIX: PFNGLXCHOOSEFBCONFIGSGIXPROC;
    XCreateGLXPixmapWithConfigSGIX: PFNGLXCREATEGLXPIXMAPWITHCONFIGSGIXPROC;
    XCreateContextWithConfigSGIX: PFNGLXCREATECONTEXTWITHCONFIGSGIXPROC;
    XGetVisualFromFBConfigSGIX: PFNGLXGETVISUALFROMFBCONFIGSGIXPROC;
    XGetFBConfigFromVisualSGIX: PFNGLXGETFBCONFIGFROMVISUALSGIXPROC;
    XCreateGLXPbufferSGIX: PFNGLXCREATEGLXPBUFFERSGIXPROC;
    XDestroyGLXPbufferSGIX: PFNGLXDESTROYGLXPBUFFERSGIXPROC;
    XQueryGLXPbufferSGIX: PFNGLXQUERYGLXPBUFFERSGIXPROC;
    XSelectEventSGIX: PFNGLXSELECTEVENTSGIXPROC;
    XGetSelectedEventSGIX: PFNGLXGETSELECTEDEVENTSGIXPROC;
    XCushionSGI: PFNGLXCUSHIONSGIPROC;
    XBindChannelToWindowSGIX: PFNGLXBINDCHANNELTOWINDOWSGIXPROC;
    XChannelRectSGIX: PFNGLXCHANNELRECTSGIXPROC;
    XQueryChannelRectSGIX: PFNGLXQUERYCHANNELRECTSGIXPROC;
    XQueryChannelDeltasSGIX: PFNGLXQUERYCHANNELDELTASSGIXPROC;
    XChannelRectSyncSGIX: PFNGLXCHANNELRECTSYNCSGIXPROC;
    XJoinSwapGroupSGIX: PFNGLXJOINSWAPGROUPSGIXPROC;
    XBindSwapBarrierSGIX: PFNGLXBINDSWAPBARRIERSGIXPROC;
    XQueryMaxSwapBarriersSGIX: PFNGLXQUERYMAXSWAPBARRIERSSGIXPROC;
    XQueryHyperpipeNetworkSGIX: PFNGLXQUERYHYPERPIPENETWORKSGIXPROC;
    XHyperpipeConfigSGIX: PFNGLXHYPERPIPECONFIGSGIXPROC;
    XQueryHyperpipeConfigSGIX: PFNGLXQUERYHYPERPIPECONFIGSGIXPROC;
    XDestroyHyperpipeConfigSGIX: PFNGLXDESTROYHYPERPIPECONFIGSGIXPROC;
    XBindHyperpipeSGIX: PFNGLXBINDHYPERPIPESGIXPROC;
    XQueryHyperpipeBestAttribSGIX: PFNGLXQUERYHYPERPIPEBESTATTRIBSGIXPROC;
    XHyperpipeAttribSGIX: PFNGLXHYPERPIPEATTRIBSGIXPROC;
    XQueryHyperpipeAttribSGIX: PFNGLXQUERYHYPERPIPEATTRIBSGIXPROC;
    XGetAGPOffsetMESA: PFNGLXGETAGPOFFSETMESAPROC;
    XEnumerateVideoDevicesNV: PFNGLXENUMERATEVIDEODEVICESNVPROC;
    XBindVideoDeviceNV: PFNGLXBINDVIDEODEVICENVPROC;
    XGetVideoDeviceNV: PFNGLXGETVIDEODEVICENVPROC;

    XAllocateMemoryNV: PFNGLXALLOCATEMEMORYNVPROC;
    XFreeMemoryNV: PFNGLXFREEMEMORYNVPROC;

    XReleaseVideoDeviceNV: PFNGLXRELEASEVIDEODEVICENVPROC;
    XBindVideoImageNV: PFNGLXBINDVIDEOIMAGENVPROC;
    XReleaseVideoImageNV: PFNGLXRELEASEVIDEOIMAGENVPROC;
    XSendPbufferToVideoNV: PFNGLXSENDPBUFFERTOVIDEONVPROC;
    XGetVideoInfoNV: PFNGLXGETVIDEOINFONVPROC;
    XJoinSwapGroupNV: PFNGLXJOINSWAPGROUPNVPROC;
    XBindSwapBarrierNV: PFNGLXBINDSWAPBARRIERNVPROC;
    XQuerySwapGroupNV: PFNGLXQUERYSWAPGROUPNVPROC;
    XQueryMaxSwapGroupsNV: PFNGLXQUERYMAXSWAPGROUPSNVPROC;
    XQueryFrameCountNV: PFNGLXQUERYFRAMECOUNTNVPROC;
    XResetFrameCountNV: PFNGLXRESETFRAMECOUNTNVPROC;
    XBindVideoCaptureDeviceNV: PFNGLXBINDVIDEOCAPTUREDEVICENVPROC;
    XEnumerateVideoCaptureDevicesNV: PFNGLXENUMERATEVIDEOCAPTUREDEVICESNVPROC;
    XLockVideoCaptureDeviceNV: PFNGLXLOCKVIDEOCAPTUREDEVICENVPROC;
    XQueryVideoCaptureDeviceNV: PFNGLXQUERYVIDEOCAPTUREDEVICENVPROC;
    XReleaseVideoCaptureDeviceNV: PFNGLXRELEASEVIDEOCAPTUREDEVICENVPROC;
    XSwapIntervalEXT: PFNGLXSWAPINTERVALEXTPROC;
    XCopyImageSubDataNV: PFNGLXCOPYIMAGESUBDATANVPROC;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'AGL function/procedure'}{$ENDIF}
{$IFDEF DARWIN}
    ACreatePixelFormat: function(gdevs: PAGLDevice; ndev: GLint; attribs: PGLint): TAGLPixelFormat; cdecl;
    AChoosePixelFormat : function(gdevs: PAGLDevice; ndev: GLint; attribs: PGLint): TAGLPixelFormat; cdecl;
    ADestroyPixelFormat: procedure(pix: TAGLPixelFormat); cdecl;
    ADescribePixelFormat := function(pix: TAGLPixelFormat; attrib: TGLint; value: PGLint): TGLBoolean; cdecl;
    AGetCGLPixelFormat := function(pix: TAGLPixelFormat; cgl_pix: Pointer): TGLboolen; cdecl;
    ADisplaysOfPixelFormat := function(pix: TAGLPixelFormat; ndevs: PGLint): PCGDirectDisplayID; cdecl;
    ANextPixelFormat := function(pix: TAGLPixelFormat): TAGLPixelFormat; cdecl;
    // Managing context
    ACreateContext: function(pix: TAGLPixelFormat; share: TAGLContext): TAGLContext; cdecl;
    ACopyContext : function(src: TAGLContext; dst: TAGLContext; mask; TGLuint): TGLBoolean;
    ADestroyContext: function(ctx: TAGLContext): GLboolean; cdecl;
    AUpdateContext: function(ctx: TAGLContext): GLboolean; cdecl;
    ASetCurrentContext := function(ctx: TAGLContext): GLboolean; cdecl;
    AGetCGLContext : function(ctx: AGLContext; cgl_ctx: Pointer): GLboolean; cdecl;
    AGetCurrentContext := function(): TAGLContext; cdecl;
    ASwapBuffers : procedure(ctx: TAGLContext); cdecl;
    AUpdateContext := function(): TAGLContext; cdecl;
    // Managing Pixel Buffers
    ACreatePBuffer : function(Width: GLint; Height: GLint; target: GLenum; internalFormat: GLenum;
      max_level: longint; pbuffer: PAGLPbuffer): GLboolean; cdecl;
    ADestroyPBuffer : function(pbuffer: TAGLPbuffer): GLboolean; cdecl;
    ADescribePBuffer : function(pbuffer: TAGLPbuffer; width, height: PGLint; target: PGLenum; internalFormat: PGLenum; max_level: PGLint): TGLBoolean; cdecl;
    AGetPBuffer : function(ctx: AGLContext; out pbuffer: TAGLPbuffer; face, level, screen: PGLint): GLboolean; cdecl;
    ASetPBuffer : function(ctx: TAGLContext; pbuffer: TAGLPbuffer; face: GLint; level: GLint; cdecl;
      screen: GLint): GLboolean; cdecl;
    ATexImagePBuffer : function(ctx: TAGLContext; pbuffer: TAGLPbuffer; source: GLint): TGLBoolean; cdecl;
    // Managing Drawable Objects
    ASetDrawable: function(ctx: TAGLContext; draw: TAGLDrawable): GLboolean; cdecl; // deprecated
    AGetDrawable: function(ctx: TAGLContext): TAGLDrawable; cdecl; // deprecated
    ASetFullScreen: function(ctx: TAGLContext; Width: GLsizei; Height: GLsizei; freq: GLsizei;
      device: GLint): GLboolean; cdecl;
    ASetOffScreen : function(ctx: TAGLContext; width, height, rowbytes: TGLsizei; out baseaddr: Pointer): GLboolean; cdecl;
    // Getting and Setting Context Options
    AEnable : function(ctx: TAGLContext; pname: TGLenum): GLboolean; cdecl;
    ADisable : function(ctx: TAGLContext; pname: TGLenum): GLboolean; cdecl;
    AIsEnabled : function(ctx: TAGLContext; pname: TGLenum): GLboolean; cdecl;
    ASetInteger : function(ctx: TAGLContext; pname: GLenum; params: PGLint): GLboolean; cdecl;
    AGetInteger : function(ctx: TAGLContext; pname: GLenum; params: PGLint): GLboolean; cdecl;
    // Getting and Setting Global Information
    AConfigure : function(pname: TGLenum; param: TGLuint): TGLboolean; cdecl;
    AGetVersion : procedure(major: PGLint; minor: PGLint); cdecl;
    AResetLibrary := procedure(); cdecl;
    // Getting Renderer Information
    ADescribeRenderer : function(rend: TAGLRendererInfo; prop: GLint; value: PGLint): GLboolean; cdecl;
    ADestroyRendererInfo : procedure(rend: TAGLRendererInfo); cdecl;
    ANextRendererInfo := function(rend: TAGLRendererInfo): TAGLRendererInfo; cdecl;
    AQueryRendererInfoForCGDirectDisplayIDs : function(dspIDs: PCGDirectDisplayID; ndev: TGLint): TAGLRendererInfo; cdecl;
    // Managing Virtual Screens
    AGetVirtualScreen : function(ctx: TAGLContext): GLint; cdecl;
    ASetVirtualScreen : function(ctx: TAGLContext; screen: TGLint): TGLboolean; cdecl;
    // Getting and Setting Windows
    ASetWindowRef : function(ctx: TAGLContext; window: TWindowRef): TGLBoolean; cdecl;
    AGetWindowRef : function(ctx: TAGLContext): TGLint; cdecl;
    // Getting and Setting HIView Objects
    ASetHIViewRef : function(ctx: TAGLContext; hiview: THIViewRef): TGLboolean; cdecl;
    AGetHIViewRef : function(ctx: TAGLContext): THIViewRef; cdecl;
    // Getting Error Information
    AGetError : function(): TGLenum; cdecl;
    AErrorString : function(code: TGLenum): PGLChar; cdecl;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}

{$IFDEF GLS_REGIONS}
 {$REGION 'locate functions/procedures for OpenGL Utility (GLU) extensions'} {$ENDIF}

    // ###########################################################
    // locate functions and procedures for
    // GLU extensions
    // ###########################################################

    UNurbsCallbackDataEXT:
    procedure(nurb: PGLUnurbs; userData: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    UNewNurbsTessellatorEXT:
    function: PGLUnurbs;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
    UDeleteNurbsTessellatorEXT:
    procedure(nurb: PGLUnurbs);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
{$IFDEF GLS_REGIONS} {$ENDREGION} {$ENDIF}
    constructor Create;
    procedure Initialize(ATemporary: boolean = False);
    procedure Close;
    procedure CheckError;
    procedure ClearError;
    property IsInitialized: boolean read FInitialized;
    property DebugMode: boolean read FDebug write FDebug;
  end;

{$IFDEF GLS_REGIONS}{$REGION 'Windows OpenGL (WGL) support functions'}{$ENDIF}
{$IFDEF SUPPORT_WGL}

function wglGetProcAddress(ProcName: PGLChar): Pointer; stdcall; external opengl32;
function wglCopyContext(p1: HGLRC; p2: HGLRC; p3: cardinal): BOOL;
  stdcall; external opengl32;
function wglCreateContext(DC: HDC): HGLRC; stdcall; external opengl32;
function wglCreateLayerContext(p1: HDC; p2: integer): HGLRC; stdcall; external opengl32;
function wglDeleteContext(p1: HGLRC): BOOL; stdcall; external opengl32;
function wglDescribeLayerPlane(p1: HDC; p2, p3: integer; p4: cardinal;
  var p5: TLayerPlaneDescriptor): BOOL; stdcall; external opengl32;
function wglGetCurrentContext: HGLRC; stdcall; external opengl32;
function wglGetCurrentDC: HDC; stdcall; external opengl32;
function wglGetLayerPaletteEntries(p1: HDC; p2, p3, p4: integer; var pcr): integer;
  stdcall; external opengl32;
function wglMakeCurrent(DC: HDC; p2: HGLRC): BOOL; stdcall; external opengl32;
function wglRealizeLayerPalette(p1: HDC; p2: integer; p3: BOOL): BOOL;
  stdcall; external opengl32;
function wglSetLayerPaletteEntries(p1: HDC; p2, p3, p4: integer; var pcr): integer;
  stdcall; external opengl32;
function wglShareLists(p1, p2: HGLRC): BOOL; stdcall; external opengl32;
function wglSwapLayerBuffers(p1: HDC; p2: cardinal): BOOL; stdcall; external opengl32;
function wglSwapMultipleBuffers(p1: UINT; const p2: PWGLSwap): DWORD;
  stdcall; external opengl32;
function wglUseFontBitmapsA(DC: HDC; p2, p3, p4: DWORD): BOOL; stdcall;
  external opengl32;
function wglUseFontOutlinesA(p1: HDC; p2, p3, p4: DWORD; p5, p6: single;
  p7: integer; p8: PGlyphMetricsFloat): BOOL; stdcall; external opengl32;
function wglUseFontBitmapsW(DC: HDC; p2, p3, p4: DWORD): BOOL; stdcall;
  external opengl32;
function wglUseFontOutlinesW(p1: HDC; p2, p3, p4: DWORD; p5, p6: single;
  p7: integer; p8: PGlyphMetricsFloat): BOOL; stdcall; external opengl32;
function wglUseFontBitmaps(DC: HDC; p2, p3, p4: DWORD): BOOL; stdcall;
  external opengl32 Name 'wglUseFontBitmapsA';
function wglUseFontOutlines(p1: HDC; p2, p3, p4: DWORD; p5, p6: single;
  p7: integer; p8: PGlyphMetricsFloat): BOOL; stdcall;
  external opengl32 Name 'wglUseFontOutlinesA';
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS}{$REGION 'OpenGL Extension to the X Window System (GLX) support functions'}
{$ENDIF}
{$IFDEF SUPPORT_GLX}
// GLX 1.0
function glXGetProcAddress(const Name: PAnsiChar): Pointer; cdecl; external opengl32;
function glXGetProcAddressARB(const Name: PAnsiChar): Pointer; cdecl; external opengl32;
function glXChooseVisual(dpy: PDisplay; screen: TGLint;
  attribList: PGLint): PXVisualInfo; cdecl; external opengl32;
function glXCreateContext(dpy: PDisplay; vis: PXVisualInfo;
  shareList: GLXContext; direct: TGLboolean): GLXContext; cdecl; external opengl32;
procedure glXDestroyContext(dpy: PDisplay; ctx: GLXContext); cdecl; external opengl32;
function glXMakeCurrent(dpy: PDisplay; drawable: GLXDrawable;
  ctx: GLXContext): TGLboolean; cdecl; external opengl32;
procedure glXCopyContext(dpy: PDisplay; src: GLXContext; dst: GLXContext; mask: TGLuint);
  cdecl; external opengl32;
procedure glXSwapBuffers(dpy: PDisplay; drawable: GLXDrawable); cdecl; external opengl32;
function glXCreateGLXPixmap(dpy: PDisplay; visual: PXVisualInfo;
  pixmap: GLXPixmap): GLXPixmap; cdecl; external opengl32;
procedure glXDestroyGLXPixmap(dpy: PDisplay; pixmap: GLXPixmap);
  cdecl; external opengl32;
function glXQueryExtension(dpy: PDisplay; errorb: PGLint; event: PGLint): TGLboolean;
  cdecl; external opengl32;
function glXQueryVersion(dpy: PDisplay; maj: PGLint; min: PGLint): TGLboolean;
  cdecl; external opengl32;
function glXIsDirect(dpy: PDisplay; ctx: GLXContext): TGLboolean;
  cdecl; external opengl32;
function glXGetConfig(dpy: PDisplay; visual: PXVisualInfo; attrib: TGLint;
  Value: PGLint): TGLint; cdecl; external opengl32;
function glXGetCurrentContext: GLXContext; cdecl; external opengl32;
function glXGetCurrentDrawable: GLXDrawable; cdecl; external opengl32;
procedure glXWaitGL; cdecl; external opengl32;
procedure glXWaitX; cdecl; external opengl32;
procedure glXUseXFont(font: XFont; First: TGLint; Count: TGLint; list: TGLint);
  cdecl; external opengl32;

// GLX 1.1 and later
function glXQueryExtensionsString(dpy: PDisplay; screen: TGLint): PGLChar;
  cdecl; external opengl32;
function glXQueryServerString(dpy: PDisplay; screen: TGLint; Name: TGLint): PGLChar;
  cdecl; external opengl32;
function glXGetClientString(dpy: PDisplay; Name: TGLint): PGLChar;
  cdecl; external opengl32;

// GLX 1.2 and later
function glXGetCurrentDisplay: PDisplay; cdecl; external opengl32;
{$ENDIF}
{$IFDEF GLS_REGIONS}{$ENDREGION}{$ENDIF}
{$IFDEF GLS_REGIONS} {$REGION 'OpenGL utility (GLU) functions and procedures'}
 {$ENDIF}
function gluErrorString(errCode: TGLEnum): PGLChar; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluGetString(Name: TGLEnum): PGLChar; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluOrtho2D(left, right, bottom, top: TGLdouble);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluPerspective(fovy, aspect, zNear, zFar: TGLdouble);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluPickMatrix(X, y, Width, Height: TGLdouble; const Viewport: TVector4i);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluLookAt(eyex, eyey, eyez, centerx, centery, centerz, upx,
  upy, upz: TGLdouble);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluProject(objx, objy, objz: TGLdouble; const modelMatrix: TMatrix4d;
  const projMatrix: TMatrix4d; const Viewport: TVector4i;
  winx, winy, winz: PGLdouble): TGLint; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluUnProject(winx, winy, winz: TGLdouble; const modelMatrix: TMatrix4d;
  const projMatrix: TMatrix4d; const Viewport: TVector4i;
  objx, objy, objz: PGLdouble): TGLint; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluScaleImage(format: TGLEnum; widthin, heightin: TGLint;
  typein: TGLEnum; datain: Pointer; widthout, heightout: TGLint;
  typeout: TGLEnum; dataout: Pointer): TGLint; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluBuild1DMipmaps(target: TGLEnum; Components, Width: TGLint;
  format, atype: TGLEnum; Data: Pointer): TGLint; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluBuild2DMipmaps(target: TGLEnum; Components, Width, Height: TGLint;
  format, atype: TGLEnum; Data: Pointer): TGLint; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluNewQuadric: PGLUquadric; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluDeleteQuadric(state: PGLUquadric); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluQuadricNormals(quadObject: PGLUquadric; normals: TGLEnum);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluQuadricTexture(quadObject: PGLUquadric; textureCoords: TGLboolean);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluQuadricOrientation(quadObject: PGLUquadric; orientation: TGLEnum);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluQuadricDrawStyle(quadObject: PGLUquadric; drawStyle: TGLEnum);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluCylinder(quadObject: PGLUquadric; baseRadius, topRadius, Height: TGLdouble;
  slices, stacks: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl;
 {$ENDIF} external glu32;
procedure gluDisk(quadObject: PGLUquadric; innerRadius, outerRadius: TGLdouble;
  slices, loops: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl;
 {$ENDIF} external glu32;
procedure gluPartialDisk(quadObject: PGLUquadric; innerRadius, outerRadius: TGLdouble;
  slices, loops: TGLint; startAngle, sweepAngle: TGLdouble);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluSphere(quadObject: PGLUquadric; radius: TGLdouble; slices, stacks: TGLint);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluQuadricCallback(quadObject: PGLUquadric; which: TGLEnum;
  fn: TGLUQuadricErrorProc); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl;
 {$ENDIF} external glu32;
function gluNewTess: PGLUtesselator; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluDeleteTess(tess: PGLUtesselator); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessBeginPolygon(tess: PGLUtesselator; polygon_data: Pointer);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessBeginContour(tess: PGLUtesselator); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessVertex(tess: PGLUtesselator; const coords: TVector3d; Data: Pointer);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessEndContour(tess: PGLUtesselator); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessEndPolygon(tess: PGLUtesselator); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessProperty(tess: PGLUtesselator; which: TGLEnum; Value: TGLdouble);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessNormal(tess: PGLUtesselator; X, y, z: TGLdouble);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluTessCallback(tess: PGLUtesselator; which: TGLEnum; fn: Pointer);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluGetTessProperty(tess: PGLUtesselator; which: TGLEnum; Value: PGLdouble);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
function gluNewNurbsRenderer: PGLUnurbs; {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluDeleteNurbsRenderer(nobj: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluBeginSurface(nobj: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluBeginCurve(nobj: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluEndCurve(nobj: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluEndSurface(nobj: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluBeginTrim(nobj: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluEndTrim(nobj: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluPwlCurve(nobj: PGLUnurbs; Count: TGLint; points: PGLfloat;
  stride: TGLint; atype: TGLEnum); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluNurbsCurve(nobj: PGLUnurbs; nknots: TGLint; knot: PGLfloat;
  stride: TGLint; ctlarray: PGLfloat; order: TGLint; atype: TGLEnum);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluNurbsSurface(nobj: PGLUnurbs; sknot_count: TGLint;
  sknot: PGLfloat; tknot_count: TGLint; tknot: PGLfloat; s_stride, t_stride: TGLint;
  ctlarray: PGLfloat; sorder, torder: TGLint; atype: TGLEnum);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluLoadSamplingMatrices(nobj: PGLUnurbs; const modelMatrix: TMatrix4f;
  const projMatrix: TMatrix4f; const Viewport: TVector4i);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluNurbsProperty(nobj: PGLUnurbs; aproperty: TGLEnum; Value: TGLfloat);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluGetNurbsProperty(nobj: PGLUnurbs; aproperty: TGLEnum; Value: PGLfloat);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluNurbsCallback(nobj: PGLUnurbs; which: TGLEnum; fn: TGLUNurbsErrorProc);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluBeginPolygon(tess: PGLUtesselator); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluNextContour(tess: PGLUtesselator; atype: TGLEnum);
 {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;
procedure gluEndPolygon(tess: PGLUtesselator); {$IFDEF MSWINDOWS} stdcall;
 {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF} external glu32;

{$IFDEF GLS_REGIONS} {$ENDREGION} {$ENDIF}
function GLLibGetProcAddress(ProcName: PGLChar): Pointer;
function GLGetProcAddress(ProcName: PGLChar): Pointer;

procedure CloseOpenGL;
function InitOpenGL: boolean;
function InitOpenGLFromLibrary(const GLName, GLUName: string): boolean;
function IsOpenGLInitialized: boolean;

// compatibility routines
procedure UnloadOpenGL;
function LoadOpenGL: boolean;
function LoadOpenGLFromLibrary(GLName, GLUName: string): boolean;
function IsOpenGLLoaded: boolean;

function IsMesaGL: boolean;
procedure TrimAndSplitVersionString(buffer: string; var max, min: integer);
function IsVersionMet(MajorVersion, MinorVersion, actualMajorVersion,
  actualMinorVersion: integer): boolean;

implementation

uses
{$IFDEF FPC}
  Math,
{$ENDIF}
  GLSLog;

resourcestring
  rstrOpenGLError = 'OpenGL error - %s';

const
  glPrefix = 'gl';

// ************** Windows specific ********************
{$IFDEF MSWINDOWS}

const
  INVALID_MODULEHANDLE = 0;

var
  GLHandle: HINST;
  GLUHandle: HINST;

function GLGetProcAddress(ProcName: PGLChar): Pointer;
begin
  Result := wglGetProcAddress(ProcName);
end;

{$ENDIF}
// ************** UNIX specific ********************
{$IFDEF UNIX}

const
  INVALID_MODULEHANDLE = 0; // nil;

var
  GLHandle: TLibHandle = 0; // Pointer;
  GLUHandle: TLibHandle = 0; // Pointer;

function GLGetProcAddress(ProcName: PGLChar): Pointer;
begin
  if @glXGetProcAddress <> nil then
    Result := glXGetProcAddress(ProcName);

  if Result <> nil then
    exit;

  if @glXGetProcAddressARB <> nil then
    Result := glXGetProcAddressARB(ProcName);

  if Result <> nil then
    exit;

  Result := GetProcAddress(GLHandle, ProcName);
end;

{$ENDIF}

{$IFDEF DARWIN}
var
  GLHandle: Pointer;
  GLUHandle: Pointer;
  AGLHandle: Pointer;

function GLGetProcAddress(ProcName: PGLChar): Pointer;
begin
  Result := GetProcAddress(GLHandle, ProcName);
end;

function AGLGetProcAddress(ProcName: PGLChar): Pointer;
begin
  Result := GetProcAddress(AGLHandle, ProcName);
end;
{$ENDIF}

function GLLibGetProcAddress(ProcName: PGLChar): Pointer;
begin
  Result := GetProcAddress(GLHandle, ProcName);
end;

var
  vNotInformed: boolean = True;

procedure DebugCallBack(Source: GLenum; type_: GLenum; id: GLuint;
  severity: GLenum; length: GLSizei; const message: PGLChar; userParam: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
begin
  if length > 0 then
    GLSLogger.LogDebug(string(message));
end;

procedure DebugCallBackAMD(id: GLuint; category: GLenum; severity: GLenum;
  length: GLSizei; message: PGLChar; userParam: Pointer);
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
begin
  if length > 0 then
    GLSLogger.LogDebug(string(message));
end;

constructor TGLExtensionsAndEntryPoints.Create;
begin
  FInitialized := False;
end;

procedure glCap;
{$IFDEF MSWINDOWS} stdcall;
{$ENDIF}{$IFDEF UNIX} cdecl;
{$ENDIF}
begin
  GLSLogger.LogError('Call OpenGL function with undefined entry point');
  Abort;
end;

function TGLExtensionsAndEntryPoints.GetAddress(ProcName: string): Pointer;
var
  vName: string;
begin
  vName := glPrefix + ProcName;
  Result := GLGetProcAddress(PGLChar(TGLString(vName)));
  if Result = nil then
  begin
    vName := glPrefix + ProcName + 'ARB';
    Result := GLGetProcAddress(PGLChar(TGLString(vName)));
    if Result = nil then
    begin
      vName := glPrefix + ProcName;
      Result := GLLibGetProcAddress(PGLChar(TGLString(vName)));
      if Result = nil then
      begin
        vName := glPrefix + ProcName + 'EXT';
        Result := GLGetProcAddress(PGLChar(TGLString(vName)));
        if Result = nil then
        begin
          vName := glPrefix + ProcName + 'NV';
          Result := GLGetProcAddress(PGLChar(TGLString(vName)));
          if Result = nil then
          begin
            vName := glPrefix + ProcName + 'ATI';
            Result := GLGetProcAddress(PGLChar(TGLString(vName)));
            if Result = nil then
              Result := @glCap;
          end;
        end;
      end;
    end;
  end;
{$IFDEF GLS_OPENGL_DEBUG}
  if Result <> @glCap then
    GLSLogger.LogDebug('Finded entry point of ' + vName)
  else
    GLSLogger.LogDebug('Can''t find entry point of ' + vName);
{$ENDIF}
end;

function TGLExtensionsAndEntryPoints.GetAddressAlt(ProcName1, ProcName2:
  string): Pointer;
begin
  Result := GetAddress(ProcName1);
  if Result = @glCap then
    Result := GetAddress(ProcName2);
end;

function TGLExtensionsAndEntryPoints.GetAddressNoSuffixes(ProcName: string): Pointer;
var
  vName: string;
begin
  vName := glPrefix + ProcName;
  Result := GLGetProcAddress(PGLChar(TGLString(vName)));
  if Result = nil then
    Result := @glCap;
{$IFDEF GLS_OPENGL_DEBUG}
  if Result <> @glCap then
    GLSLogger.LogDebug('Finded entry point of ' + vName)
  else
    GLSLogger.LogDebug('Can''t find entry point of ' + vName);
{$ENDIF}
end;

function TGLExtensionsAndEntryPoints.GetCapAddress: Pointer;
begin
  Result := @glCap;
end;

procedure TGLExtensionsAndEntryPoints.CheckError;
var
  glError: TGLuint;
  Count: word;
begin
  if FInitialized then
    try
      glError := GetError();
      if glError <> GL_NO_ERROR then
      begin
        Count := 0;
        try
          while (GetError <> GL_NO_ERROR) and (Count < 6) do
            Inc(Count);
        except
        end;
        if not (FDebug and ARB_debug_output) then
          case glError of
            GL_INVALID_ENUM:
              GLSLogger.LogError(format(rstrOpenGLError, ['Invalid enum']));
            GL_INVALID_VALUE:
              GLSLogger.LogError(format(rstrOpenGLError, ['Invalid value']));
            GL_INVALID_OPERATION:
              GLSLogger.LogError(format(rstrOpenGLError, ['Invalid Operation']));
            GL_OUT_OF_MEMORY:
              GLSLogger.LogError(format(rstrOpenGLError, ['Out of memory']));
          end;
      end;
    except
      GLSLogger.LogError(format(rstrOpenGLError, ['Exception in glGetError']));
    end;
end;

procedure TGLExtensionsAndEntryPoints.ClearError;
var
  n: integer;
begin
  n := 0;
  while (GetError <> GL_NO_ERROR) and (n < 6) do
    Inc(n);
end;

function TGLExtensionsAndEntryPoints.CheckExtension(const Extension: string): boolean;
var
  ExtPos: integer;
begin
  // First find the position of the extension string as substring in Buffer.
  ExtPos := Pos(Extension, FBuffer);
  Result := ExtPos > 0;
  // Now check that it isn't only a substring of another extension.
  if Result then
    Result := ((ExtPos + length(Extension) - 1) = length(FBuffer)) or
      (FBuffer[ExtPos + length(Extension)] = ' ');
{$IFDEF GLS_OPENGL_DEBUG}
  if Result then
    GLSLogger.LogDebug(Extension);
{$ENDIF}
end;

procedure TGLExtensionsAndEntryPoints.Initialize(ATemporary: boolean);
var
  i: integer;
  numExt: TGLint;
  MajorVersion, MinorVersion: integer;
begin
  GLSLogger.LogNotice('Getting OpenGL entry points and extension');
{$IFDEF SUPPORT_WGL}
  ReadWGLExtensions;
  ReadWGLImplementationProperties;
{$ENDIF}
{$IFDEF SUPPORT_GLX}
  ReadGLXExtensions;
  ReadGLXImplementationProperties;
{$ENDIF}
{$IFDEF DARWIN}
  ReadAGLExtensions;
{$ENDIF}
  GetString := GetAddress('GetString');
  GetStringi := GetAddress('GetStringi');
  GetIntegerv := GetAddress('GetIntegerv');
  GetError := GetAddress('GetError');
  // determine OpenGL versions supported
  FBuffer := string(GetString(GL_VERSION));
  TrimAndSplitVersionString(FBuffer, MajorVersion, MinorVersion);
  VERSION_1_0 := True;
  VERSION_1_1 := IsVersionMet(1, 1, MajorVersion, MinorVersion);
  VERSION_1_2 := IsVersionMet(1, 2, MajorVersion, MinorVersion);
  VERSION_1_3 := IsVersionMet(1, 3, MajorVersion, MinorVersion);
  VERSION_1_4 := IsVersionMet(1, 4, MajorVersion, MinorVersion);
  VERSION_1_5 := IsVersionMet(1, 5, MajorVersion, MinorVersion);
  VERSION_2_0 := IsVersionMet(2, 0, MajorVersion, MinorVersion);
  VERSION_2_1 := IsVersionMet(2, 1, MajorVersion, MinorVersion);
  VERSION_3_0 := IsVersionMet(3, 0, MajorVersion, MinorVersion);
  VERSION_3_1 := IsVersionMet(3, 1, MajorVersion, MinorVersion);
  VERSION_3_2 := IsVersionMet(3, 2, MajorVersion, MinorVersion);
  VERSION_3_3 := IsVersionMet(3, 3, MajorVersion, MinorVersion);
  VERSION_4_0 := IsVersionMet(4, 0, MajorVersion, MinorVersion);
  VERSION_4_1 := IsVersionMet(4, 1, MajorVersion, MinorVersion);

  if vNotInformed then
  begin
    GLSLogger.LogNotice('');
    GLSLogger.LogInfo('OpenGL rendering context information:');
    GLSLogger.LogInfo(format('Renderer     : %s', [GetString(GL_RENDERER)]));
    GLSLogger.LogInfo(format('Vendor       : %s', [GetString(GL_VENDOR)]));
    GLSLogger.LogInfo(format('Version      : %s', [GetString(GL_VERSION)]));
    if VERSION_2_0 then
      GLSLogger.LogInfo(format('GLSL version : %s',
        [GetString(GL_SHADING_LANGUAGE_VERSION)]))
    else
      GLSLogger.LogWarning('GLSL version : not supported');
    GLSLogger.LogNotice('');
    vNotInformed := False;
  end;

  if ATemporary then
  begin
    FInitialized := True;
    exit;
  end;

  // check supported OpenGL extensions
  if VERSION_3_0 then
  begin
    FBuffer := '';
    GetIntegerv(GL_NUM_EXTENSIONS, @numExt);
    for i := 0 to numExt - 1 do
      FBuffer := FBuffer + string(GetStringi(GL_EXTENSIONS, i)) + ' ';
  end
  else
    FBuffer := string(GetString(GL_EXTENSIONS));
  // check ARB approved OpenGL extensions
  ARB_blend_func_extended := CheckExtension('GL_ARB_blend_func_extended');
  ARB_color_buffer_float := CheckExtension('GL_ARB_color_buffer_float');
  ARB_compatibility := CheckExtension('GL_ARB_compatibility');
  ARB_copy_buffer := CheckExtension('GL_ARB_copy_buffer');
  ARB_depth_buffer_float := CheckExtension('GL_ARB_depth_buffer_float');
  ARB_depth_clamp := CheckExtension('GL_ARB_depth_clamp');
  ARB_depth_texture := CheckExtension('GL_ARB_depth_texture');
  ARB_draw_buffers := CheckExtension('GL_ARB_draw_buffers');
  ARB_draw_buffers_blend := CheckExtension('GL_ARB_draw_buffers_blend');
  ARB_draw_elements_base_vertex := CheckExtension('GL_ARB_draw_elements_base_vertex');
  ARB_draw_indirect := CheckExtension('GL_ARB_draw_indirect');
  ARB_draw_instanced := CheckExtension('GL_ARB_draw_instanced');
  ARB_explicit_attrib_location := CheckExtension('GL_ARB_explicit_attrib_location');
  ARB_fragment_coord_conventions := CheckExtension('GL_ARB_fragment_coord_conventions');
  ARB_fragment_program := CheckExtension('GL_ARB_fragment_program');
  ARB_fragment_program_shadow := CheckExtension('GL_ARB_fragment_program_shadow');
  ARB_fragment_shader := CheckExtension('GL_ARB_fragment_shader');
  ARB_framebuffer_object := CheckExtension('GL_ARB_framebuffer_object');
  ARB_framebuffer_sRGB := CheckExtension('GL_ARB_framebuffer_sRGB');
  ARB_geometry_shader4 := CheckExtension('GL_ARB_geometry_shader4');
  ARB_gpu_shader_fp64 := CheckExtension('GL_ARB_gpu_shader_fp64');
  ARB_gpu_shader5 := CheckExtension('GL_ARB_gpu_shader5');
  ARB_half_float_pixel := CheckExtension('GL_ARB_half_float_pixel');
  ARB_half_float_vertex := CheckExtension('GL_ARB_half_float_vertex');
  ARB_imaging := CheckExtension('GL_ARB_imaging');
  ARB_instanced_arrays := CheckExtension('GL_ARB_instanced_arrays');
  ARB_map_buffer_range := CheckExtension('GL_ARB_map_buffer_range');
  ARB_matrix_palette := CheckExtension('GL_ARB_matrix_palette');
  ARB_multisample := CheckExtension('GL_ARB_multisample');
  // ' ' to avoid collision with WGL variant
  ARB_multitexture := CheckExtension('GL_ARB_multitexture');
  ARB_occlusion_query := CheckExtension('GL_ARB_occlusion_query');
  ARB_occlusion_query2 := CheckExtension('GL_ARB_occlusion_query2');
  ARB_pixel_buffer_object := CheckExtension('GL_ARB_pixel_buffer_object');
  ARB_point_parameters := CheckExtension('GL_ARB_point_parameters');
  ARB_point_sprite := CheckExtension('GL_ARB_point_sprite');
  ARB_provoking_vertex := CheckExtension('GL_ARB_provoking_vertex');
  ARB_sample_shading := CheckExtension('GL_ARB_sample_shading');
  ARB_sampler_objects := CheckExtension('GL_ARB_sampler_objects');
  ARB_seamless_cube_map := CheckExtension('GL_ARB_seamless_cube_map');
  ARB_shader_bit_encoding := CheckExtension('GL_ARB_shader_bit_encoding');
  ARB_shader_objects := CheckExtension('GL_ARB_shader_objects');
  ARB_shader_subroutine := CheckExtension('GL_ARB_shader_subroutine');
  ARB_shader_texture_lod := CheckExtension('GL_ARB_shader_texture_lod');
  ARB_shading_language_100 := CheckExtension('GL_ARB_shading_language_100');
  ARB_shadow := CheckExtension('GL_ARB_shadow');
  ARB_shadow_ambient := CheckExtension('GL_ARB_shadow_ambient');
  ARB_sync := CheckExtension('GL_ARB_sync');
  ARB_tessellation_shader := CheckExtension('GL_ARB_tessellation_shader');
  ARB_texture_border_clamp := CheckExtension('GL_ARB_texture_border_clamp');
  ARB_texture_buffer_object := CheckExtension('GL_ARB_texture_buffer_object');
  ARB_texture_buffer_object_rgb32 :=
    CheckExtension('GL_ARB_texture_buffer_object_rgb32');
  ARB_texture_compression := CheckExtension('GL_ARB_texture_compression');
  ARB_texture_compression_rgtc := CheckExtension('GL_ARB_texture_compression_rgtc');
  ARB_texture_cube_map := CheckExtension('GL_ARB_texture_cube_map');
  ARB_texture_cube_map_array := CheckExtension('GL_ARB_texture_cube_map_array');
  ARB_texture_env_add := CheckExtension('GL_ARB_texture_env_add');
  ARB_texture_env_combine := CheckExtension('GL_ARB_texture_env_combine');
  ARB_texture_env_crossbar := CheckExtension('GL_ARB_texture_env_crossbar');
  ARB_texture_env_dot3 := CheckExtension('GL_ARB_texture_env_dot3');
  ARB_texture_float := CheckExtension('GL_ARB_texture_float');
  ARB_texture_gather := CheckExtension('GL_ARB_texture_gather');
  ARB_texture_mirrored_repeat := CheckExtension('GL_ARB_texture_mirrored_repeat');
  ARB_texture_multisample := CheckExtension('GL_ARB_texture_multisample');
  ARB_texture_non_power_of_two := CheckExtension('GL_ARB_texture_non_power_of_two');
  ARB_texture_query_lod := CheckExtension('GL_ARB_texture_query_lod');
  ARB_texture_rectangle := CheckExtension('GL_ARB_texture_rectangle');
  ARB_texture_rg := CheckExtension('GL_ARB_texture_rg');
  ARB_texture_rgb10_a2ui := CheckExtension('GL_ARB_texture_rgb10_a2ui');
  ARB_texture_swizzle := CheckExtension('GL_ARB_texture_swizzle');
  ARB_timer_query := CheckExtension('GL_ARB_timer_query');
  ARB_transform_feedback2 := CheckExtension('GL_ARB_transform_feedback2');
  ARB_transform_feedback3 := CheckExtension('GL_ARB_transform_feedback3');
  ARB_transpose_matrix := CheckExtension('GL_ARB_transpose_matrix');
  ARB_uniform_buffer_object := CheckExtension('GL_ARB_uniform_buffer_object');
  ARB_vertex_array_bgra := CheckExtension('GL_ARB_vertex_array_bgra');
  ARB_vertex_array_object := CheckExtension('GL_ARB_vertex_array_object');
  ARB_vertex_blend := CheckExtension('GL_ARB_vertex_blend');
  ARB_vertex_buffer_object := CheckExtension('GL_ARB_vertex_buffer_object');
  ARB_vertex_program := CheckExtension('GL_ARB_vertex_program');
  ARB_vertex_shader := CheckExtension('GL_ARB_vertex_shader');
  ARB_vertex_type_2_10_10_10_rev := CheckExtension('GL_ARB_vertex_type_2_10_10_10_rev');
  ARB_window_pos := CheckExtension('GL_ARB_window_pos');
  ARB_texture_compression_bptc := CheckExtension('GL_ARB_texture_compression_bptc');
  ARB_get_program_binary := CheckExtension('GL_ARB_get_program_binary');

  // check Vendor/EXT OpenGL extensions
  _3DFX_multisample := CheckExtension('GL_3DFX_multisample');
  _3DFX_tbuffer := CheckExtension('GL_3DFX_tbuffer');
  _3DFX_texture_compression_FXT1 := CheckExtension('GL_3DFX_texture_compression_FXT1');
  ATI_draw_buffers := CheckExtension('GL_ATI_draw_buffers');
  ATI_texture_compression_3dc := CheckExtension('GL_ATI_texture_compression_3dc');
  ATI_texture_float := CheckExtension('GL_ATI_texture_float');
  ATI_texture_mirror_once := CheckExtension('GL_ATI_texture_mirror_once');

  S3_s3tc := CheckExtension('GL_S3_s3tc');

  EXT_abgr := CheckExtension('GL_EXT_abgr');
  EXT_bgra := CheckExtension('GL_EXT_bgra');
  EXT_bindable_uniform := CheckExtension('GL_EXT_bindable_uniform');
  EXT_blend_color := CheckExtension('GL_EXT_blend_color');
  EXT_blend_equation_separate := CheckExtension('GL_EXT_blend_equation_separate');
  EXT_blend_func_separate := CheckExtension('GL_EXT_blend_func_separate');
  EXT_blend_logic_op := CheckExtension('GL_EXT_blend_logic_op');
  EXT_blend_minmax := CheckExtension('GL_EXT_blend_minmax');
  EXT_blend_subtract := CheckExtension('GL_EXT_blend_subtract');
  EXT_Cg_shader := CheckExtension('GL_EXT_Cg_shader');
  EXT_clip_volume_hint := CheckExtension('GL_EXT_clip_volume_hint');
  EXT_compiled_vertex_array := CheckExtension('GL_EXT_compiled_vertex_array');
  EXT_copy_texture := CheckExtension('GL_EXT_copy_texture');
  EXT_depth_bounds_test := CheckExtension('GL_EXT_depth_bounds_test');
  EXT_draw_buffers2 := CheckExtension('GL_EXT_draw_buffers2');
  EXT_draw_instanced := CheckExtension('GL_EXT_draw_instanced');
  EXT_draw_range_elements := CheckExtension('GL_EXT_draw_range_elements');
  EXT_fog_coord := CheckExtension('GL_EXT_fog_coord');
  EXT_framebuffer_blit := CheckExtension('GL_EXT_framebuffer_blit');
  EXT_framebuffer_multisample := CheckExtension('GL_EXT_framebuffer_multisample');
  EXT_framebuffer_object := CheckExtension('GL_EXT_framebuffer_object');
  EXT_framebuffer_sRGB := CheckExtension('GL_EXT_framebuffer_sRGB');
  EXT_geometry_shader4 := CheckExtension('GL_EXT_geometry_shader4');
  EXT_gpu_program_parameters := CheckExtension('GL_EXT_gpu_program_parameters');
  EXT_gpu_shader4 := CheckExtension('GL_EXT_gpu_shader4');
  EXT_multi_draw_arrays := CheckExtension('GL_EXT_multi_draw_arrays');
  EXT_multisample := CheckExtension('GL_EXT_multisample');
  EXT_packed_depth_stencil := CheckExtension('GL_EXT_packed_depth_stencil');
  EXT_packed_float := CheckExtension('GL_EXT_packed_float');
  EXT_packed_pixels := CheckExtension('GL_EXT_packed_pixels');
  EXT_paletted_texture := CheckExtension('GL_EXT_paletted_texture');
  EXT_pixel_buffer_object := CheckExtension('GL_EXT_pixel_buffer_object');
  EXT_polygon_offset := CheckExtension('GL_EXT_polygon_offset');
  EXT_rescale_normal := CheckExtension('GL_EXT_rescale_normal');
  EXT_secondary_color := CheckExtension('GL_EXT_secondary_color');
  EXT_separate_specular_color := CheckExtension('GL_EXT_separate_specular_color');
  EXT_shadow_funcs := CheckExtension('GL_EXT_shadow_funcs');
  EXT_shared_texture_palette := CheckExtension('GL_EXT_shared_texture_palette');
  EXT_stencil_clear_tag := CheckExtension('GL_EXT_stencil_clear_tag');
  EXT_stencil_two_side := CheckExtension('GL_EXT_stencil_two_side');
  EXT_stencil_wrap := CheckExtension('GL_EXT_stencil_wrap');
  EXT_texture3D := CheckExtension('GL_EXT_texture3D');
  EXT_texture_array := CheckExtension('GL_EXT_texture_array');
  EXT_texture_buffer_object := CheckExtension('GL_EXT_texture_buffer_object');
  EXT_texture_compression_latc := CheckExtension('GL_EXT_texture_compression_latc');
  EXT_texture_compression_rgtc := CheckExtension('GL_EXT_texture_compression_rgtc');
  EXT_texture_compression_s3tc := CheckExtension('GL_EXT_texture_compression_s3tc');
  EXT_texture_cube_map := CheckExtension('GL_EXT_texture_cube_map');
  EXT_texture_edge_clamp := CheckExtension('GL_EXT_texture_edge_clamp');
  EXT_texture_env_add := CheckExtension('GL_EXT_texture_env_add');
  EXT_texture_env_combine := CheckExtension('GL_EXT_texture_env_combine');
  EXT_texture_env_dot3 := CheckExtension('GL_EXT_texture_env_dot3');
  EXT_texture_filter_anisotropic := CheckExtension('GL_EXT_texture_filter_anisotropic');
  EXT_texture_integer := CheckExtension('GL_EXT_texture_integer');
  EXT_texture_lod := CheckExtension('GL_EXT_texture_lod');
  EXT_texture_lod_bias := CheckExtension('GL_EXT_texture_lod_bias');
  EXT_texture_mirror_clamp := CheckExtension('GL_EXT_texture_mirror_clamp');
  EXT_texture_object := CheckExtension('GL_EXT_texture_object');
  EXT_texture_rectangle := CheckExtension('GL_EXT_texture_rectangle');
  EXT_texture_sRGB := CheckExtension('GL_EXT_texture_sRGB');
  EXT_texture_shared_exponent := CheckExtension('GL_EXT_texture_shared_exponent');
  EXT_timer_query := CheckExtension('GL_EXT_timer_query');
  EXT_transform_feedback := CheckExtension('GL_EXT_transform_feedback');
  EXT_vertex_array := CheckExtension('GL_EXT_vertex_array');

  HP_occlusion_test := CheckExtension('GL_HP_occlusion_test');

  IBM_rasterpos_clip := CheckExtension('GL_IBM_rasterpos_clip');

  KTX_buffer_region := CheckExtension('GL_KTX_buffer_region');

  MESA_resize_buffers := CheckExtension('GL_MESA_resize_buffers');

  NV_blend_square := CheckExtension('GL_NV_blend_square');
  NV_conditional_render := CheckExtension('GL_NV_conditional_render');
  NV_copy_image := CheckExtension('GL_NV_copy_image');
  NV_depth_buffer_float := CheckExtension('GL_NV_depth_buffer_float');
  NV_fence := CheckExtension('GL_NV_fence');
  NV_float_buffer := CheckExtension('GL_NV_float_buffer');
  NV_fog_distance := CheckExtension('GL_NV_fog_distance');
  NV_geometry_program4 := CheckExtension('GL_NV_geometry_program4');
  NV_light_max_exponent := CheckExtension('GL_NV_light_max_exponent');
  NV_multisample_filter_hint := CheckExtension('GL_NV_multisample_filter_hint');
  NV_occlusion_query := CheckExtension('GL_NV_occlusion_query');
  NV_point_sprite := CheckExtension('GL_NV_point_sprite');
  NV_primitive_restart := CheckExtension('GL_NV_primitive_restart');
  NV_register_combiners := CheckExtension('GL_NV_register_combiners');
  NV_shader_buffer_load := CheckExtension('GL_NV_shader_buffer_load');
  NV_texgen_reflection := CheckExtension('GL_NV_texgen_reflection');
  NV_texture_compression_vtc := CheckExtension('GL_NV_texture_compression_vtc');
  NV_texture_env_combine4 := CheckExtension('GL_NV_texture_env_combine4');
  NV_texture_rectangle := CheckExtension('GL_NV_texture_rectangle');
  NV_texture_shader := CheckExtension('GL_NV_texture_shader');
  NV_texture_shader2 := CheckExtension('GL_NV_texture_shader2');
  NV_texture_shader3 := CheckExtension('GL_NV_texture_shader3');
  NV_transform_feedback := CheckExtension('GL_NV_transform_feedback');
  NV_vertex_array_range := CheckExtension('GL_NV_vertex_array_range');
  NV_vertex_array_range2 := CheckExtension('GL_NV_vertex_array_range2');
  NV_vertex_buffer_unified_memory :=
    CheckExtension('GL_NV_vertex_buffer_unified_memory');
  NV_vertex_program := CheckExtension('GL_NV_vertex_program');

  SGI_color_matrix := CheckExtension('GL_SGI_color_matrix');

  SGIS_generate_mipmap := CheckExtension('GL_SGIS_generate_mipmap');
  SGIS_multisample := CheckExtension('GL_SGIS_multisample');
  SGIS_texture_border_clamp := CheckExtension('GL_SGIS_texture_border_clamp');
  SGIS_texture_color_mask := CheckExtension('GL_SGIS_texture_color_mask');
  SGIS_texture_edge_clamp := CheckExtension('GL_SGIS_texture_edge_clamp');
  SGIS_texture_lod := CheckExtension('GL_SGIS_texture_lod');

  SGIX_depth_texture := CheckExtension('GL_SGIX_depth_texture');
  SGIX_shadow := CheckExtension('GL_SGIX_shadow');
  SGIX_shadow_ambient := CheckExtension('GL_SGIX_shadow_ambient');

  AMD_vertex_shader_tessellator := CheckExtension('GL_AMD_vertex_shader_tessellator');

  WIN_swap_hint := CheckExtension('GL_WIN_swap_hint');
  ATI_meminfo := CheckExtension('GL_ATI_meminfo');
  NVX_gpu_memory_info := CheckExtension('GL_NVX_gpu_memory_info');
  NV_vdpau_interop := CheckExtension('GL_NV_vdpau_interop');

  GREMEDY_frame_terminator := CheckExtension('GL_GREMEDY_frame_terminator');
  GREMEDY_string_marker := CheckExtension('GL_GREMEDY_string_marker');
  AMDX_debug_output := CheckExtension('AMDX_debug_output');
  ARB_debug_output := CheckExtension('GL_ARB_debug_output');

  BindTexture := GetAddress('BindTexture');
  BlendFunc := GetAddress('BlendFunc');
  Clear := GetAddress('Clear');
  ClearColor := GetAddress('ClearColor');
  ClearDepth := GetAddress('ClearDepth');
  ClearStencil := GetAddress('ClearStencil');
  ColorMask := GetAddress('ColorMask');
  CopyTexImage1D := GetAddress('CopyTexImage1D');
  CopyTexImage2D := GetAddress('CopyTexImage2D');
  CopyTexSubImage1D := GetAddress('CopyTexSubImage1D');
  CopyTexSubImage2D := GetAddress('CopyTexSubImage2D');
  CullFace := GetAddress('CullFace');
  DeleteTextures := GetAddress('DeleteTextures');
  DepthFunc := GetAddress('DepthFunc');
  DepthMask := GetAddress('DepthMask');
  DepthRange := GetAddress('DepthRange');
  Disable := GetAddress('Disable');
  DrawArrays := GetAddress('DrawArrays');
  DrawBuffer := GetAddress('DrawBuffer');
  DrawElements := GetAddress('DrawElements');
  Enable := GetAddress('Enable');
  Finish := GetAddress('Finish');
  Flush := GetAddress('Flush');
  FrontFace := GetAddress('FrontFace');
  GenTextures := GetAddress('GenTextures');
  GetBooleanv := GetAddress('GetBooleanv');
  GetDoublev := GetAddress('GetDoublev');
  GetFloatv := GetAddress('GetFloatv');
  GetPointerv := GetAddress('GetPointerv');
  GetString := GetAddress('GetString');
  GetTexImage := GetAddress('GetTexImage');
  GetTexLevelParameterfv := GetAddress('GetTexLevelParameterfv');
  GetTexLevelParameteriv := GetAddress('GetTexLevelParameteriv');
  GetTexParameterfv := GetAddress('GetTexParameterfv');
  GetTexParameteriv := GetAddress('GetTexParameteriv');
  Hint := GetAddress('Hint');
  IsEnabled := GetAddress('IsEnabled');
  IsTexture := GetAddress('IsTexture');
  LineWidth := GetAddress('LineWidth');
  LogicOp := GetAddress('LogicOp');
  PixelStoref := GetAddress('PixelStoref');
  PixelStorei := GetAddress('PixelStorei');
  PointSize := GetAddress('PointSize');
  PolygonMode := GetAddress('PolygonMode');
  PolygonOffset := GetAddress('PolygonOffset');
  ReadBuffer := GetAddress('ReadBuffer');
  ReadPixels := GetAddress('ReadPixels');
  Scissor := GetAddress('Scissor');
  StencilFunc := GetAddress('StencilFunc');
  StencilMask := GetAddress('StencilMask');
  StencilOp := GetAddress('StencilOp');
  TexImage1D := GetAddress('TexImage1D');
  TexImage2D := GetAddress('TexImage2D');
  TexParameterf := GetAddress('TexParameterf');
  TexParameterfv := GetAddress('TexParameterfv');
  TexParameteri := GetAddress('TexParameteri');
  TexParameteriv := GetAddress('TexParameteriv');
  TexSubImage1D := GetAddress('TexSubImage1D');
  TexSubImage2D := GetAddress('TexSubImage2D');
  Viewport := GetAddress('Viewport');
  Accum := GetAddress('Accum');
  AlphaFunc := GetAddress('AlphaFunc');
  AreTexturesResident := GetAddress('AreTexturesResident');
  ArrayElement := GetAddress('ArrayElement');
  Begin_ := GetAddress('Begin');
  Bitmap := GetAddress('Bitmap');
  CallList := GetAddress('CallList');
  CallLists := GetAddress('CallLists');
  ClearAccum := GetAddress('ClearAccum');
  ClearIndex := GetAddress('ClearIndex');
  ClipPlane := GetAddress('ClipPlane');
  Color3b := GetAddress('Color3b');
  Color3bv := GetAddress('Color3bv');
  Color3d := GetAddress('Color3d');
  Color3dv := GetAddress('Color3dv');
  Color3f := GetAddress('Color3f');
  Color3fv := GetAddress('Color3fv');
  Color3i := GetAddress('Color3i');
  Color3iv := GetAddress('Color3iv');
  Color3s := GetAddress('Color3s');
  Color3sv := GetAddress('Color3sv');
  Color3ub := GetAddress('Color3ub');
  Color3ubv := GetAddress('Color3ubv');
  Color3ui := GetAddress('Color3ui');
  Color3uiv := GetAddress('Color3uiv');
  Color3us := GetAddress('Color3us');
  Color3usv := GetAddress('Color3usv');
  Color4b := GetAddress('Color4b');
  Color4bv := GetAddress('Color4bv');
  Color4d := GetAddress('Color4d');
  Color4dv := GetAddress('Color4dv');
  Color4f := GetAddress('Color4f');
  Color4fv := GetAddress('Color4fv');
  Color4i := GetAddress('Color4i');
  Color4iv := GetAddress('Color4iv');
  Color4s := GetAddress('Color4s');
  Color4sv := GetAddress('Color4sv');
  Color4ub := GetAddress('Color4ub');
  Color4ubv := GetAddress('Color4ubv');
  Color4ui := GetAddress('Color4ui');
  Color4uiv := GetAddress('Color4uiv');
  Color4us := GetAddress('Color4us');
  Color4usv := GetAddress('Color4usv');
  ColorMaterial := GetAddress('ColorMaterial');
  ColorPointer := GetAddress('ColorPointer');
  CopyPixels := GetAddress('CopyPixels');
  DeleteLists := GetAddress('DeleteLists');
  DisableClientState := GetAddress('DisableClientState');
  DrawPixels := GetAddress('DrawPixels');
  EdgeFlag := GetAddress('EdgeFlag');
  EdgeFlagPointer := GetAddress('EdgeFlagPointer');
  EdgeFlagv := GetAddress('EdgeFlagv');
  EnableClientState := GetAddress('EnableClientState');
  End_ := GetAddress('End');
  EndList := GetAddress('EndList');
  EvalCoord1d := GetAddress('EvalCoord1d');
  EvalCoord1dv := GetAddress('EvalCoord1dv');
  EvalCoord1f := GetAddress('EvalCoord1f');
  EvalCoord1fv := GetAddress('EvalCoord1fv');
  EvalCoord2d := GetAddress('EvalCoord2d');
  EvalCoord2dv := GetAddress('EvalCoord2dv');
  EvalCoord2f := GetAddress('EvalCoord2f');
  EvalCoord2fv := GetAddress('EvalCoord2fv');
  EvalMesh1 := GetAddress('EvalMesh1');
  EvalMesh2 := GetAddress('EvalMesh2');
  EvalPoint1 := GetAddress('EvalPoint1');
  EvalPoint2 := GetAddress('EvalPoint2');
  FeedbackBuffer := GetAddress('FeedbackBuffer');
  Fogf := GetAddress('Fogf');
  Fogfv := GetAddress('Fogfv');
  Fogi := GetAddress('Fogi');
  Fogiv := GetAddress('Fogiv');
  Frustum := GetAddress('Frustum');
  GenLists := GetAddress('GenLists');
  GetClipPlane := GetAddress('GetClipPlane');
  GetLightfv := GetAddress('GetLightfv');
  GetLightiv := GetAddress('GetLightiv');
  GetMapdv := GetAddress('GetMapdv');
  GetMapfv := GetAddress('GetMapfv');
  GetMapiv := GetAddress('GetMapiv');
  GetMaterialfv := GetAddress('GetMaterialfv');
  GetMaterialiv := GetAddress('GetMaterialiv');
  GetPixelMapfv := GetAddress('GetPixelMapfv');
  GetPixelMapuiv := GetAddress('GetPixelMapuiv');
  GetPixelMapusv := GetAddress('GetPixelMapusv');
  GetPolygonStipple := GetAddress('GetPolygonStipple');
  GetTexEnvfv := GetAddress('GetTexEnvfv');
  GetTexEnviv := GetAddress('GetTexEnviv');
  GetTexGendv := GetAddress('GetTexGendv');
  GetTexGenfv := GetAddress('GetTexGenfv');
  GetTexGeniv := GetAddress('GetTexGeniv');
  IndexMask := GetAddress('IndexMask');
  IndexPointer := GetAddress('IndexPointer');
  Indexd := GetAddress('Indexd');
  Indexdv := GetAddress('Indexdv');
  Indexf := GetAddress('Indexf');
  Indexfv := GetAddress('Indexfv');
  Indexi := GetAddress('Indexi');
  Indexiv := GetAddress('Indexiv');
  Indexs := GetAddress('Indexs');
  Indexsv := GetAddress('Indexsv');
  Indexub := GetAddress('Indexub');
  Indexubv := GetAddress('Indexubv');
  InitNames := GetAddress('InitNames');
  InterleavedArrays := GetAddress('InterleavedArrays');
  IsList := GetAddress('IsList');
  LightModelf := GetAddress('LightModelf');
  LightModelfv := GetAddress('LightModelfv');
  LightModeli := GetAddress('LightModeli');
  LightModeliv := GetAddress('LightModeliv');
  Lightf := GetAddress('Lightf');
  Lightfv := GetAddress('Lightfv');
  Lighti := GetAddress('Lighti');
  Lightiv := GetAddress('Lightiv');
  LineStipple := GetAddress('LineStipple');
  ListBase := GetAddress('ListBase');
  LoadIdentity := GetAddress('LoadIdentity');
  LoadMatrixd := GetAddress('LoadMatrixd');
  LoadMatrixf := GetAddress('LoadMatrixf');
  LoadName := GetAddress('LoadName');
  Map1d := GetAddress('Map1d');
  Map1f := GetAddress('Map1f');
  Map2d := GetAddress('Map2d');
  Map2f := GetAddress('Map2f');
  MapGrid1d := GetAddress('MapGrid1d');
  MapGrid1f := GetAddress('MapGrid1f');
  MapGrid2d := GetAddress('MapGrid2d');
  MapGrid2f := GetAddress('MapGrid2f');
  Materialf := GetAddress('Materialf');
  Materialfv := GetAddress('Materialfv');
  Materiali := GetAddress('Materiali');
  Materialiv := GetAddress('Materialiv');
  MatrixMode := GetAddress('MatrixMode');
  MultMatrixd := GetAddress('MultMatrixd');
  MultMatrixf := GetAddress('MultMatrixf');
  NewList := GetAddress('NewList');
  Normal3b := GetAddress('Normal3b');
  Normal3bv := GetAddress('Normal3bv');
  Normal3d := GetAddress('Normal3d');
  Normal3dv := GetAddress('Normal3dv');
  Normal3f := GetAddress('Normal3f');
  Normal3fv := GetAddress('Normal3fv');
  Normal3i := GetAddress('Normal3i');
  Normal3iv := GetAddress('Normal3iv');
  Normal3s := GetAddress('Normal3s');
  Normal3sv := GetAddress('Normal3sv');
  NormalPointer := GetAddress('NormalPointer');
  Ortho := GetAddress('Ortho');
  PassThrough := GetAddress('PassThrough');
  PixelMapfv := GetAddress('PixelMapfv');
  PixelMapuiv := GetAddress('PixelMapuiv');
  PixelMapusv := GetAddress('PixelMapusv');
  PixelTransferf := GetAddress('PixelTransferf');
  PixelTransferi := GetAddress('PixelTransferi');
  PixelZoom := GetAddress('PixelZoom');
  PolygonStipple := GetAddress('PolygonStipple');
  PopAttrib := GetAddress('PopAttrib');
  PopClientAttrib := GetAddress('PopClientAttrib');
  PopMatrix := GetAddress('PopMatrix');
  PopName := GetAddress('PopName');
  PrioritizeTextures := GetAddress('PrioritizeTextures');
  PushAttrib := GetAddress('PushAttrib');
  PushClientAttrib := GetAddress('PushClientAttrib');
  PushMatrix := GetAddress('PushMatrix');
  PushName := GetAddress('PushName');
  RasterPos2d := GetAddress('RasterPos2d');
  RasterPos2dv := GetAddress('RasterPos2dv');
  RasterPos2f := GetAddress('RasterPos2f');
  RasterPos2fv := GetAddress('RasterPos2fv');
  RasterPos2i := GetAddress('RasterPos2i');
  RasterPos2iv := GetAddress('RasterPos2iv');
  RasterPos2s := GetAddress('RasterPos2s');
  RasterPos2sv := GetAddress('RasterPos2sv');
  RasterPos3d := GetAddress('RasterPos3d');
  RasterPos3dv := GetAddress('RasterPos3dv');
  RasterPos3f := GetAddress('RasterPos3f');
  RasterPos3fv := GetAddress('RasterPos3fv');
  RasterPos3i := GetAddress('RasterPos3i');
  RasterPos3iv := GetAddress('RasterPos3iv');
  RasterPos3s := GetAddress('RasterPos3s');
  RasterPos3sv := GetAddress('RasterPos3sv');
  RasterPos4d := GetAddress('RasterPos4d');
  RasterPos4dv := GetAddress('RasterPos4dv');
  RasterPos4f := GetAddress('RasterPos4f');
  RasterPos4fv := GetAddress('RasterPos4fv');
  RasterPos4i := GetAddress('RasterPos4i');
  RasterPos4iv := GetAddress('RasterPos4iv');
  RasterPos4s := GetAddress('RasterPos4s');
  RasterPos4sv := GetAddress('RasterPos4sv');
  Rectd := GetAddress('Rectd');
  Rectdv := GetAddress('Rectdv');
  Rectf := GetAddress('Rectf');
  Rectfv := GetAddress('Rectfv');
  Recti := GetAddress('Recti');
  Rectiv := GetAddress('Rectiv');
  Rects := GetAddress('Rects');
  Rectsv := GetAddress('Rectsv');
  RenderMode := GetAddress('RenderMode');
  Rotated := GetAddress('Rotated');
  Rotatef := GetAddress('Rotatef');
  Scaled := GetAddress('Scaled');
  Scalef := GetAddress('Scalef');
  SelectBuffer := GetAddress('SelectBuffer');
  ShadeModel := GetAddress('ShadeModel');
  TexCoord1d := GetAddress('TexCoord1d');
  TexCoord1dv := GetAddress('TexCoord1dv');
  TexCoord1f := GetAddress('TexCoord1f');
  TexCoord1fv := GetAddress('TexCoord1fv');
  TexCoord1i := GetAddress('TexCoord1i');
  TexCoord1iv := GetAddress('TexCoord1iv');
  TexCoord1s := GetAddress('TexCoord1s');
  TexCoord1sv := GetAddress('TexCoord1sv');
  TexCoord2d := GetAddress('TexCoord2d');
  TexCoord2dv := GetAddress('TexCoord2dv');
  TexCoord2f := GetAddress('TexCoord2f');
  TexCoord2fv := GetAddress('TexCoord2fv');
  TexCoord2i := GetAddress('TexCoord2i');
  TexCoord2iv := GetAddress('TexCoord2iv');
  TexCoord2s := GetAddress('TexCoord2s');
  TexCoord2sv := GetAddress('TexCoord2sv');
  TexCoord3d := GetAddress('TexCoord3d');
  TexCoord3dv := GetAddress('TexCoord3dv');
  TexCoord3f := GetAddress('TexCoord3f');
  TexCoord3fv := GetAddress('TexCoord3fv');
  TexCoord3i := GetAddress('TexCoord3i');
  TexCoord3iv := GetAddress('TexCoord3iv');
  TexCoord3s := GetAddress('TexCoord3s');
  TexCoord3sv := GetAddress('TexCoord3sv');
  TexCoord4d := GetAddress('TexCoord4d');
  TexCoord4dv := GetAddress('TexCoord4dv');
  TexCoord4f := GetAddress('TexCoord4f');
  TexCoord4fv := GetAddress('TexCoord4fv');
  TexCoord4i := GetAddress('TexCoord4i');
  TexCoord4iv := GetAddress('TexCoord4iv');
  TexCoord4s := GetAddress('TexCoord4s');
  TexCoord4sv := GetAddress('TexCoord4sv');
  TexCoordPointer := GetAddress('TexCoordPointer');
  TexEnvf := GetAddress('TexEnvf');
  TexEnvfv := GetAddress('TexEnvfv');
  TexEnvi := GetAddress('TexEnvi');
  TexEnviv := GetAddress('TexEnviv');
  TexGend := GetAddress('TexGend');
  TexGendv := GetAddress('TexGendv');
  TexGenf := GetAddress('TexGenf');
  TexGenfv := GetAddress('TexGenfv');
  TexGeni := GetAddress('TexGeni');
  TexGeniv := GetAddress('TexGeniv');
  Translated := GetAddress('Translated');
  Translatef := GetAddress('Translatef');
  Vertex2d := GetAddress('Vertex2d');
  Vertex2dv := GetAddress('Vertex2dv');
  Vertex2f := GetAddress('Vertex2f');
  Vertex2fv := GetAddress('Vertex2fv');
  Vertex2i := GetAddress('Vertex2i');
  Vertex2iv := GetAddress('Vertex2iv');
  Vertex2s := GetAddress('Vertex2s');
  Vertex2sv := GetAddress('Vertex2sv');
  Vertex3d := GetAddress('Vertex3d');
  Vertex3dv := GetAddress('Vertex3dv');
  Vertex3f := GetAddress('Vertex3f');
  Vertex3fv := GetAddress('Vertex3fv');
  Vertex3i := GetAddress('Vertex3i');
  Vertex3iv := GetAddress('Vertex3iv');
  Vertex3s := GetAddress('Vertex3s');
  Vertex3sv := GetAddress('Vertex3sv');
  Vertex4d := GetAddress('Vertex4d');
  Vertex4dv := GetAddress('Vertex4dv');
  Vertex4f := GetAddress('Vertex4f');
  Vertex4fv := GetAddress('Vertex4fv');
  Vertex4i := GetAddress('Vertex4i');
  Vertex4iv := GetAddress('Vertex4iv');
  Vertex4s := GetAddress('Vertex4s');
  Vertex4sv := GetAddress('Vertex4sv');
  VertexPointer := GetAddress('VertexPointer');
  BlendColor := GetAddress('BlendColor');
  BlendEquation := GetAddress('BlendEquation');
  DrawRangeElements := GetAddress('DrawRangeElements');
  TexImage3D := GetAddress('TexImage3D');
  TexSubImage3D := GetAddress('TexSubImage3D');
  CopyTexSubImage3D := GetAddress('CopyTexSubImage3D');

  IsRenderbuffer := GetAddress('IsRenderbuffer');
  BindRenderbuffer := GetAddress('BindRenderbuffer');
  DeleteRenderbuffers := GetAddress('DeleteRenderbuffers');
  GenRenderbuffers := GetAddress('GenRenderbuffers');
  RenderbufferStorage := GetAddress('RenderbufferStorage');
  RenderbufferStorageMultisample := GetAddress('RenderbufferStorageMultisample');
  GetRenderbufferParameteriv := GetAddress('GetRenderbufferParameteriv');
  IsFramebuffer := GetAddress('IsFramebuffer');
  BindFramebuffer := GetAddress('BindFramebuffer');
  DeleteFramebuffers := GetAddress('DeleteFramebuffers');
  GenFramebuffers := GetAddress('GenFramebuffers');
  CheckFramebufferStatus := GetAddress('CheckFramebufferStatus');
  FramebufferTexture := GetAddress('FramebufferTexture');
  FramebufferTexture1D := GetAddress('FramebufferTexture1D');
  FramebufferTexture2D := GetAddress('FramebufferTexture2D');
  FramebufferTexture3D := GetAddress('FramebufferTexture3D');
  FramebufferTextureLayer := GetAddress('FramebufferTextureLayer');
  FramebufferTextureFace := GetAddress('FramebufferTextureFace');
  FramebufferRenderbuffer := GetAddress('FramebufferRenderbuffer');
  GetFramebufferAttachmentParameteriv :=
    GetAddress('GetFramebufferAttachmentParameteriv');
  BlitFramebuffer := GetAddress('BlitFramebuffer');
  GenerateMipmap := GetAddress('GenerateMipmap');
  ClearBufferiv := GetAddress('ClearBufferiv');
  ClearBufferuiv := GetAddress('ClearBufferuiv');
  ClearBufferfv := GetAddress('ClearBufferfv');
  ClearBufferfi := GetAddress('ClearBufferfi');
  BlendFuncSeparate := GetAddress('BlendFuncSeparate');
  MultiDrawArrays := GetAddress('MultiDrawArrays');
  MultiDrawElements := GetAddress('MultiDrawElements');
  PointParameterf := GetAddress('PointParameterf');
  PointParameterfv := GetAddress('PointParameterfv');
  PointParameteri := GetAddress('PointParameteri');
  PointParameteriv := GetAddress('PointParameteriv');
  LockArrays := GetAddress('LockArrays');
  UnlockArrays := GetAddress('UnlockArrays');
  BindBuffer := GetAddress('BindBuffer');
  DeleteBuffers := GetAddress('DeleteBuffers');
  GenBuffers := GetAddress('GenBuffers');
  IsBuffer := GetAddress('IsBuffer');
  BufferData := GetAddress('BufferData');
  BufferSubData := GetAddress('BufferSubData');
  GetBufferSubData := GetAddress('GetBufferSubData');
  MapBuffer := GetAddress('MapBuffer');
  UnmapBuffer := GetAddress('UnmapBuffer');
  GetBufferParameteriv := GetAddress('GetBufferParameteriv');
  GetBufferPointerv := GetAddress('GetBufferPointerv');
  MapBufferRange := GetAddress('MapBufferRange');
  FlushMappedBufferRange := GetAddress('FlushMappedBufferRange');
  BindBufferRange := GetAddress('BindBufferRange');
  BindBufferOffset := GetAddress('BindBufferOffset');
  BindBufferBase := GetAddress('BindBufferBase');
  BeginTransformFeedback := GetAddress('BeginTransformFeedback');
  EndTransformFeedback := GetAddress('EndTransformFeedback');
  TransformFeedbackVaryings := GetAddress('TransformFeedbackVaryings');
  GetTransformFeedbackVarying := GetAddress('GetTransformFeedbackVarying');

  TransformFeedbackAttribs := GetAddress('TransformFeedbackAttribs');
  TransformFeedbackVaryingsNV := GetAddressNoSuffixes('TransformFeedbackVaryingsNV');
  TexBuffer := GetAddress('TexBuffer');
  BindVertexArray := GetAddress('BindVertexArray');
  DeleteVertexArrays := GetAddress('DeleteVertexArrays');
  GenVertexArrays := GetAddress('GenVertexArrays');
  IsVertexArray := GetAddress('IsVertexArray');
  FlushVertexArrayRangeNV := GetAddressNoSuffixes('FlushVertexArrayRangeNV');
  VertexArrayRangeNV := GetAddressNoSuffixes('VertexArrayRangeNV');
  CopyBufferSubData := GetAddress('CopyBufferSubData');
  UniformBuffer := GetAddress('UniformBuffer');
  GetUniformBufferSize := GetAddress('GetUniformBufferSize');
  GetUniformOffset := GetAddress('GetUniformOffset');
  PrimitiveRestartIndex := GetAddress('PrimitiveRestartIndex');

  DrawElementsBaseVertex := GetAddress('DrawElementsBaseVertex');
  DrawRangeElementsBaseVertex := GetAddress('DrawRangeElementsBaseVertex');
  DrawElementsInstancedBaseVertex := GetAddress('DrawElementsInstancedBaseVertex');
  MultiDrawElementsBaseVertex := GetAddress('MultiDrawElementsBaseVertex');
  DrawArraysInstanced := GetAddress('DrawArraysInstanced');
  DrawElementsInstanced := GetAddress('DrawElementsInstanced');

  VertexAttrib1d := GetAddress('VertexAttrib1d');
  VertexAttrib1dv := GetAddress('VertexAttrib1dv');
  VertexAttrib1f := GetAddress('VertexAttrib1f');
  VertexAttrib1fv := GetAddress('VertexAttrib1fv');
  VertexAttrib1s := GetAddress('VertexAttrib1s');
  VertexAttrib1sv := GetAddress('VertexAttrib1sv');
  VertexAttrib2d := GetAddress('VertexAttrib2d');
  VertexAttrib2dv := GetAddress('VertexAttrib2dv');
  VertexAttrib2f := GetAddress('VertexAttrib2f');
  VertexAttrib2fv := GetAddress('VertexAttrib2fv');
  VertexAttrib2s := GetAddress('VertexAttrib2s');
  VertexAttrib2sv := GetAddress('VertexAttrib2sv');
  VertexAttrib3d := GetAddress('VertexAttrib3d');
  VertexAttrib3dv := GetAddress('VertexAttrib3dv');
  VertexAttrib3f := GetAddress('VertexAttrib3f');
  VertexAttrib3fv := GetAddress('VertexAttrib3fv');
  VertexAttrib3s := GetAddress('VertexAttrib3s');
  VertexAttrib3sv := GetAddress('VertexAttrib3sv');
  VertexAttrib4Nbv := GetAddress('VertexAttrib4Nbv');
  VertexAttrib4Niv := GetAddress('VertexAttrib4Niv');
  VertexAttrib4Nsv := GetAddress('VertexAttrib4Nsv');
  VertexAttrib4Nub := GetAddress('VertexAttrib4Nub');
  VertexAttrib4Nubv := GetAddress('VertexAttrib4Nubv');
  VertexAttrib4Nuiv := GetAddress('VertexAttrib4Nuiv');
  VertexAttrib4Nusv := GetAddress('VertexAttrib4Nusv');
  VertexAttrib4bv := GetAddress('VertexAttrib4bv');
  VertexAttrib4d := GetAddress('VertexAttrib4d');
  VertexAttrib4dv := GetAddress('VertexAttrib4dv');
  VertexAttrib4f := GetAddress('VertexAttrib4f');
  VertexAttrib4fv := GetAddress('VertexAttrib4fv');
  VertexAttrib4iv := GetAddress('VertexAttrib4iv');
  VertexAttrib4s := GetAddress('VertexAttrib4s');
  VertexAttrib4sv := GetAddress('VertexAttrib4sv');
  VertexAttrib4ubv := GetAddress('VertexAttrib4ubv');
  VertexAttrib4uiv := GetAddress('VertexAttrib4uiv');
  VertexAttrib4usv := GetAddress('VertexAttrib4usv');
  VertexAttribPointer := GetAddress('VertexAttribPointer');
  VertexAttribI1i := GetAddress('VertexAttribI1i');
  VertexAttribI2i := GetAddress('VertexAttribI2i');
  VertexAttribI3i := GetAddress('VertexAttribI3i');
  VertexAttribI4i := GetAddress('VertexAttribI4i');
  VertexAttribI1ui := GetAddress('VertexAttribI1ui');
  VertexAttribI2ui := GetAddress('VertexAttribI2ui');
  VertexAttribI3ui := GetAddress('VertexAttribI3ui');
  VertexAttribI4ui := GetAddress('VertexAttribI4ui');
  VertexAttribI1iv := GetAddress('VertexAttribI1iv');
  VertexAttribI2iv := GetAddress('VertexAttribI2iv');
  VertexAttribI3iv := GetAddress('VertexAttribI3iv');
  VertexAttribI4iv := GetAddress('VertexAttribI4iv');
  VertexAttribI1uiv := GetAddress('VertexAttribI1uiv');
  VertexAttribI2uiv := GetAddress('VertexAttribI2uiv');
  VertexAttribI3uiv := GetAddress('VertexAttribI3uiv');
  VertexAttribI4uiv := GetAddress('VertexAttribI4uiv');
  VertexAttribI4bv := GetAddress('VertexAttribI4bv');
  VertexAttribI4sv := GetAddress('VertexAttribI4sv');
  VertexAttribI4ubv := GetAddress('VertexAttribI4ubv');
  VertexAttribI4usv := GetAddress('VertexAttribI4usv');
  VertexAttribIPointer := GetAddress('VertexAttribIPointer');
  GetVertexAttribIiv := GetAddress('GetVertexAttribIiv');
  GetVertexAttribIuiv := GetAddress('GetVertexAttribIuiv');
  EnableVertexAttribArray := GetAddress('EnableVertexAttribArray');
  DisableVertexAttribArray := GetAddress('DisableVertexAttribArray');
  VertexAttribDivisor := GetAddress('VertexAttribDivisor');

  GenQueries := GetAddress('GenQueries');
  DeleteQueries := GetAddress('DeleteQueries');
  IsQuery := GetAddress('IsQuery');
  BeginQuery := GetAddress('BeginQuery');
  EndQuery := GetAddress('EndQuery');
  GetQueryiv := GetAddress('GetQueryiv');
  GetQueryObjectiv := GetAddress('GetQueryObjectiv');
  GetQueryObjectuiv := GetAddress('GetQueryObjectuiv');
  QueryCounter := GetAddress('QueryCounter');
  GetQueryObjecti64v := GetAddress('GetQueryObjecti64v');
  GetQueryObjectui64v := GetAddress('GetQueryObjectui64v');

  DeleteObject := GetAddress('DeleteObject');
  GetHandle := GetAddress('GetHandle');
  DetachShader := GetAddressAlt('DetachShader', 'DetachObject');
  CreateShader := GetAddressAlt('CreateShader', 'CreateShaderObject');
  ShaderSource := GetAddress('ShaderSource');
  CompileShader := GetAddress('CompileShader');
  CreateProgram := GetAddressAlt('CreateProgram', 'CreateProgramObject');
  AttachShader := GetAddressAlt('AttachShader', 'AttachObject');
  LinkProgram := GetAddress('LinkProgram');
  UseProgram := GetAddressAlt('UseProgram', 'UseProgramObject');
  ValidateProgram := GetAddress('ValidateProgram');
  Uniform1f := GetAddress('Uniform1f');
  Uniform2f := GetAddress('Uniform2f');
  Uniform3f := GetAddress('Uniform3f');
  Uniform4f := GetAddress('Uniform4f');
  Uniform1i := GetAddress('Uniform1i');
  Uniform2i := GetAddress('Uniform2i');
  Uniform3i := GetAddress('Uniform3i');
  Uniform4i := GetAddress('Uniform4i');
  Uniform1fv := GetAddress('Uniform1fv');
  Uniform2fv := GetAddress('Uniform2fv');
  Uniform3fv := GetAddress('Uniform3fv');
  Uniform4fv := GetAddress('Uniform4fv');
  Uniform1iv := GetAddress('Uniform1iv');
  Uniform2iv := GetAddress('Uniform2iv');
  Uniform3iv := GetAddress('Uniform3iv');
  Uniform4iv := GetAddress('Uniform4iv');
  Uniform1ui := GetAddress('Uniform1ui');
  Uniform2ui := GetAddress('Uniform2ui');
  Uniform3ui := GetAddress('Uniform3ui');
  Uniform4ui := GetAddress('Uniform4ui');
  Uniform1uiv := GetAddress('Uniform1uiv');
  Uniform2uiv := GetAddress('Uniform2uiv');
  Uniform3uiv := GetAddress('Uniform3uiv');
  Uniform4uiv := GetAddress('Uniform4uiv');
  GetUniformuiv := GetAddress('GetUniformuiv');
  UniformMatrix2fv := GetAddress('UniformMatrix2fv');
  UniformMatrix3fv := GetAddress('UniformMatrix3fv');
  UniformMatrix4fv := GetAddress('UniformMatrix4fv');
  BindFragDataLocation := GetAddress('BindFragDataLocation');
  GetFragDataLocation := GetAddress('GetFragDataLocation');
  ClampColor := GetAddress('ClampColor');
  ColorMaski := GetAddress('ColorMaski');
  GetBooleani_v := GetAddress('GetBooleani_v');
  GetIntegeri_v := GetAddress('GetIntegeri_v');
  Enablei := GetAddress('Enablei');
  Disablei := GetAddress('Disablei');
  IsEnabledi := GetAddress('IsEnabledi');
  BindFragDataLocationIndexed := GetAddress('BindFragDataLocationIndexed');
  GetFragDataIndex := GetAddress('GetFragDataIndex');
  GetObjectParameterfv := GetAddress('GetObjectParameterfv');
  GetObjectParameteriv := GetAddress('GetObjectParameteriv');
  GetAttachedObjects := GetAddress('GetAttachedObjects');
  GetActiveAttrib := GetAddress('GetActiveAttrib');
  GetActiveUniform := GetAddress('GetActiveUniform');
  GetAttachedShaders := GetAddress('GetAttachedShaders');
  GetAttribLocation := GetAddress('GetAttribLocation');
  GetProgramiv := GetAddressAlt('GetProgramiv', 'GetObjectParameteriv');
  GetProgramInfoLog := GetAddress('GetProgramInfoLog');
  GetShaderiv := GetAddressAlt('GetShaderiv', 'GetObjectParameteriv');
  GetInfoLog := GetAddress('GetInfoLog');
  GetShaderInfoLog := GetAddress('GetShaderInfoLog');
  GetShaderSource := GetAddress('GetShaderSource');
  GetUniformLocation := GetAddress('GetUniformLocation');
  GetUniformfv := GetAddress('GetUniformfv');
  GetUniformiv := GetAddress('GetUniformiv');
  GetVertexAttribdv := GetAddress('GetVertexAttribdv');
  GetVertexAttribfv := GetAddress('GetVertexAttribfv');
  GetVertexAttribiv := GetAddress('GetVertexAttribiv');
  GetVertexAttribPointerv := GetAddress('GetVertexAttribPointerv');
  IsProgram := GetAddress('IsProgram');
  IsShader := GetAddress('IsShader');
  GetUniformLocation := GetAddress('GetUniformLocation');
  BindAttribLocation := GetAddress('BindAttribLocation');
  GetVaryingLocation := GetAddress('GetVaryingLocation');
  GetActiveVarying := GetAddress('GetActiveVarying');
  ActiveVarying := GetAddress('ActiveVarying');
  GetUniformIndices := GetAddress('GetUniformIndices');
  GetActiveUniformsiv := GetAddress('GetActiveUniformsiv');
  GetActiveUniformName := GetAddress('GetActiveUniformName');
  GetUniformBlockIndex := GetAddress('GetUniformBlockIndex');
  GetActiveUniformBlockiv := GetAddress('GetActiveUniformBlockiv');
  GetActiveUniformBlockName := GetAddress('GetActiveUniformBlockName');
  UniformBlockBinding := GetAddress('UniformBlockBinding');
  GetProgramBinary := GetAddress('GetProgramBinary');
  ProgramBinary := GetAddress('ProgramBinary');

  BlendEquationSeparate := GetAddress('BlendEquationSeparate');
  DrawBuffers := GetAddress('DrawBuffers');
  StencilOpSeparate := GetAddress('StencilOpSeparate');
  StencilFuncSeparate := GetAddress('StencilFuncSeparate');
  StencilMaskSeparate := GetAddress('StencilMaskSeparate');

  ActiveTexture := GetAddress('ActiveTexture');
  CompressedTexImage3D := GetAddress('CompressedTexImage3D');
  CompressedTexImage2D := GetAddress('CompressedTexImage2D');
  CompressedTexImage1D := GetAddress('CompressedTexImage1D');
  CompressedTexSubImage3D := GetAddress('CompressedTexSubImage3D');
  CompressedTexSubImage2D := GetAddress('CompressedTexSubImage2D');
  CompressedTexSubImage1D := GetAddress('CompressedTexSubImage1D');
  GetCompressedTexImage := GetAddress('GetCompressedTexImage');
  ClientActiveTexture := GetAddress('ClientActiveTexture');
  MultiTexCoord1d := GetAddress('MultiTexCoord1d');
  MultiTexCoord1dV := GetAddress('MultiTexCoord1dv');
  MultiTexCoord1f := GetAddress('MultiTexCoord1f');
  MultiTexCoord1fv := GetAddress('MultiTexCoord1fv');
  MultiTexCoord1i := GetAddress('MultiTexCoord1i');
  MultiTexCoord1iv := GetAddress('MultiTexCoord1iv');
  MultiTexCoord1s := GetAddress('MultiTexCoord1s');
  MultiTexCoord1sv := GetAddress('MultiTexCoord1sv');
  MultiTexCoord2d := GetAddress('MultiTexCoord2d');
  MultiTexCoord2dv := GetAddress('MultiTexCoord2dv');
  MultiTexCoord2f := GetAddress('MultiTexCoord2f');
  MultiTexCoord2fv := GetAddress('MultiTexCoord2fv');
  MultiTexCoord2i := GetAddress('MultiTexCoord2i');
  MultiTexCoord2iv := GetAddress('MultiTexCoord2iv');
  MultiTexCoord2s := GetAddress('MultiTexCoord2s');
  MultiTexCoord2sv := GetAddress('MultiTexCoord2sv');
  MultiTexCoord3d := GetAddress('MultiTexCoord3d');
  MultiTexCoord3dv := GetAddress('MultiTexCoord3dv');
  MultiTexCoord3f := GetAddress('MultiTexCoord3f');
  MultiTexCoord3fv := GetAddress('MultiTexCoord3fv');
  MultiTexCoord3i := GetAddress('MultiTexCoord3i');
  MultiTexCoord3iv := GetAddress('MultiTexCoord3iv');
  MultiTexCoord3s := GetAddress('MultiTexCoord3s');
  MultiTexCoord3sv := GetAddress('MultiTexCoord3sv');
  MultiTexCoord4d := GetAddress('MultiTexCoord4d');
  MultiTexCoord4dv := GetAddress('MultiTexCoord4dv');
  MultiTexCoord4f := GetAddress('MultiTexCoord4f');
  MultiTexCoord4fv := GetAddress('MultiTexCoord4fv');
  MultiTexCoord4i := GetAddress('MultiTexCoord4i');
  MultiTexCoord4iv := GetAddress('MultiTexCoord4iv');
  MultiTexCoord4s := GetAddress('MultiTexCoord4s');
  MultiTexCoord4sv := GetAddress('MultiTexCoord4sv');

  GetInteger64i_v := GetAddress('GetInteger64i_v');
  GetBufferParameteri64v := GetAddress('GetBufferParameteri64v');
  ProgramParameteri := GetAddress('ProgramParameteri');

  ProgramString := GetAddress('ProgramString');
  BindProgram := GetAddress('BindProgram');
  DeletePrograms := GetAddress('DeletePrograms');
  GenPrograms := GetAddress('GenPrograms');
  ProgramEnvParameter4d := GetAddress('ProgramEnvParameter4d');
  ProgramEnvParameter4dv := GetAddress('ProgramEnvParameter4dv');
  ProgramEnvParameter4f := GetAddress('ProgramEnvParameter4f');
  ProgramEnvParameter4fv := GetAddress('ProgramEnvParameter4fv');
  ProgramLocalParameter4d := GetAddress('ProgramLocalParameter4d');
  ProgramLocalParameter4dv := GetAddress('ProgramLocalParameter4dv');
  ProgramLocalParameter4f := GetAddress('ProgramLocalParameter4f');
  ProgramLocalParameter4fv := GetAddress('ProgramLocalParameter4fv');
  GetProgramEnvParameterdv := GetAddress('GetProgramEnvParameterdv');
  GetProgramEnvParameterfv := GetAddress('GetProgramEnvParameterfv');
  GetProgramLocalParameterdv := GetAddress('GetProgramLocalParameterdv');
  GetProgramLocalParameterfv := GetAddress('GetProgramLocalParameterfv');

  ClearColorIi := GetAddress('ClearColorIi');
  ClearColorIui := GetAddress('ClearColorIui');
  TexParameterIiv := GetAddress('TexParameterIiv');
  TexParameterIuiv := GetAddress('TexParameterIuiv');
  GetTexParameterIiv := GetAddress('GetTexParameterIiv');
  GetTexParameterIuiv := GetAddress('GetTexParameterIuiv');
  PatchParameteri := GetAddress('PatchParameteri');
  PatchParameterfv := GetAddress('PatchParameterfv');

  TexImage2DMultisample := GetAddress('TexImage2DMultisample');
  TexImage3DMultisample := GetAddress('TexImage3DMultisample');
  GetMultisamplefv := GetAddress('GetMultisamplefv');
  SampleMaski := GetAddress('SampleMaski');

  ProvokingVertex := GetAddress('ProvokingVertex');

  FenceSync := GetAddress('FenceSync');
  IsSync := GetAddress('IsSync');
  DeleteSync := GetAddress('DeleteSync');
  ClientWaitSync := GetAddress('ClientWaitSync');
  WaitSync := GetAddress('WaitSync');
  GetInteger64v := GetAddress('GetInteger64v');
  GetSynciv := GetAddress('GetSynciv');

  BlendEquationi := GetAddress('BlendEquationi');
  BlendEquationSeparatei := GetAddress('BlendEquationSeparatei');
  BlendFunci := GetAddress('BlendFunci');
  BlendFuncSeparatei := GetAddress('BlendFuncSeparatei');
  MinSampleShading := GetAddress('MinSampleShading');

  GenSamplers := GetAddress('GenSamplers');
  DeleteSamplers := GetAddress('DeleteSamplers');
  IsSampler := GetAddress('IsSampler');
  BindSampler := GetAddress('BindSampler');
  SamplerParameteri := GetAddress('SamplerParameteri');
  SamplerParameteriv := GetAddress('SamplerParameteriv');
  SamplerParameterf := GetAddress('SamplerParameterf');
  SamplerParameterfv := GetAddress('SamplerParameterfv');
  SamplerParameterIiv := GetAddress('SamplerParameterIiv');
  SamplerParameterIuiv := GetAddress('SamplerParameterIuiv');
  GetSamplerParameteriv := GetAddress('GetSamplerParameteriv');
  GetSamplerParameterIiv := GetAddress('GetSamplerParameterIiv');
  GetSamplerParameterfv := GetAddress('GetSamplerParameterfv');
  GetSamplerParameterIfv := GetAddress('GetSamplerParameterIfv');

  FrameTerminatorGREMEDY := GetAddress('FrameTerminatorGREMEDY');
  StringMarkerGREMEDY := GetAddress('StringMarkerGREMEDY');
  DebugMessageEnableAMDX := GetAddressNoSuffixes('DebugMessageEnableAMDX');
  DebugMessageCallbackAMDX := GetAddressNoSuffixes('DebugMessageCallbackAMDX');
  DebugMessageControl := GetAddress('DebugMessageControl');
  DebugMessageInsert := GetAddress('DebugMessageInsert');
  DebugMessageCallback := GetAddress('DebugMessageCallback');
  GetDebugMessageLog := GetAddress('GetDebugMessageLog');

{$IFDEF LINUX}
  VDPAUInitNV := GetAddressNoSuffixes('VDPAUInitNV');
  VDPAUFiniNV := GetAddressNoSuffixes('VDPAUFiniNV');
  VDPAURegisterVideoSurfaceNV := GetAddressNoSuffixes('VDPAURegisterVideoSurfaceNV');
  VDPAURegisterOutputSurfaceNV := GetAddressNoSuffixes('VDPAURegisterOutputSurfaceNV');
  VDPAUIsSurfaceNV := GetAddressNoSuffixes('VDPAUIsSurfaceNV');
  VDPAUUnregisterSurfaceNV := GetAddressNoSuffixes('VDPAUUnregisterSurfaceNV');
  VDPAUGetSurfaceivNV := GetAddressNoSuffixes('VDPAUGetSurfaceivNV');
  VDPAUSurfaceAccessNV := GetAddressNoSuffixes('VDPAUSurfaceAccessNV');
  VDPAUMapSurfacesNV := GetAddressNoSuffixes('VDPAUMapSurfacesNV');
  VDPAUUnmapSurfacesNV := GetAddressNoSuffixes('VDPAUUnmapSurfacesNV');
{$ENDIF LINUX}

  if FDebug then
    if ARB_debug_output then
    begin
      DebugMessageCallback(DebugCallBack, nil);
      DebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DONT_CARE, 0, FDebugIds, True);
    end
    else if AMDX_debug_output then
    begin
      DebugMessageCallbackAMDX(DebugCallBackAMD, nil);
      DebugMessageEnableAMDX(0, 0, 0, FDebugIds, True);
    end
    else
      FDebug := False;

  SetLength(FBuffer, 0);
  FInitialized := True;
end;

procedure TGLExtensionsAndEntryPoints.Close;
begin
  if FDebug then

    if ARB_debug_output then
    begin
      DebugMessageCallback(nil, nil);
      DebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DONT_CARE, 0, FDebugIds, False);
    end
    else if AMDX_debug_output then
    begin
      DebugMessageCallbackAMDX(nil, nil);
      DebugMessageEnableAMDX(0, 0, 0, FDebugIds, False);
    end;

  VERSION_1_0 := False;
  VERSION_1_1 := False;
  VERSION_1_2 := False;
  VERSION_1_3 := False;
  VERSION_1_4 := False;
  VERSION_1_5 := False;
  VERSION_2_0 := False;
  VERSION_2_1 := False;
  VERSION_3_0 := False;
  VERSION_3_1 := False;
  VERSION_3_2 := False;
  VERSION_3_3 := False;
  VERSION_4_0 := False;
  VERSION_4_1 := False;

  ARB_blend_func_extended := False;
  ARB_color_buffer_float := False;
  ARB_compatibility := False;
  ARB_copy_buffer := False;
  ARB_depth_buffer_float := False;
  ARB_depth_clamp := False;
  ARB_depth_texture := False;
  ARB_draw_buffers := False;
  ARB_draw_buffers_blend := False;
  ARB_draw_elements_base_vertex := False;
  ARB_draw_indirect := False;
  ARB_draw_instanced := False;
  ARB_explicit_attrib_location := False;
  ARB_fragment_coord_conventions := False;
  ARB_fragment_program := False;
  ARB_fragment_program_shadow := False;
  ARB_fragment_shader := False;
  ARB_framebuffer_object := False;
  ARB_framebuffer_sRGB := False;
  ARB_geometry_shader4 := False;
  ARB_gpu_shader_fp64 := False;
  ARB_gpu_shader5 := False;
  ARB_half_float_pixel := False;
  ARB_half_float_vertex := False;
  ARB_imaging := False;
  ARB_instanced_arrays := False;
  ARB_map_buffer_range := False;
  ARB_matrix_palette := False;
  ARB_multisample := False;
  // ' ' to avoid collision with WGL variant
  ARB_multitexture := False;
  ARB_occlusion_query := False;
  ARB_occlusion_query2 := False;
  ARB_pixel_buffer_object := False;
  ARB_point_parameters := False;
  ARB_point_sprite := False;
  ARB_provoking_vertex := False;
  ARB_sample_shading := False;
  ARB_sampler_objects := False;
  ARB_seamless_cube_map := False;
  ARB_shader_bit_encoding := False;
  ARB_shader_objects := False;
  ARB_shader_subroutine := False;
  ARB_shader_texture_lod := False;
  ARB_shading_language_100 := False;
  ARB_shadow := False;
  ARB_shadow_ambient := False;
  ARB_sync := False;
  ARB_tessellation_shader := False;
  ARB_texture_border_clamp := False;
  ARB_texture_buffer_object := False;
  ARB_texture_buffer_object_rgb32 := False;
  ARB_texture_compression := False;
  ARB_texture_compression_rgtc := False;
  ARB_texture_cube_map := False;
  ARB_texture_cube_map_array := False;
  ARB_texture_env_add := False;
  ARB_texture_env_combine := False;
  ARB_texture_env_crossbar := False;
  ARB_texture_env_dot3 := False;
  ARB_texture_float := False;
  ARB_texture_gather := False;
  ARB_texture_mirrored_repeat := False;
  ARB_texture_multisample := False;
  ARB_texture_non_power_of_two := False;
  ARB_texture_query_lod := False;
  ARB_texture_rectangle := False;
  ARB_texture_rg := False;
  ARB_texture_rgb10_a2ui := False;
  ARB_texture_swizzle := False;
  ARB_timer_query := False;
  ARB_transform_feedback2 := False;
  ARB_transform_feedback3 := False;
  ARB_transpose_matrix := False;
  ARB_uniform_buffer_object := False;
  ARB_vertex_array_bgra := False;
  ARB_vertex_array_object := False;
  ARB_vertex_blend := False;
  ARB_vertex_buffer_object := False;
  ARB_vertex_program := False;
  ARB_vertex_shader := False;
  ARB_vertex_type_2_10_10_10_rev := False;
  ARB_window_pos := False;
  ARB_texture_compression_bptc := False;
  ARB_get_program_binary := False;

  // check Vendor/EXT OpenGL extensions
  _3DFX_multisample := False;
  _3DFX_tbuffer := False;
  _3DFX_texture_compression_FXT1 := False;
  ATI_draw_buffers := False;
  ATI_texture_compression_3dc := False;
  ATI_texture_float := False;
  ATI_texture_mirror_once := False;

  S3_s3tc := False;

  EXT_abgr := False;
  EXT_bgra := False;
  EXT_bindable_uniform := False;
  EXT_blend_color := False;
  EXT_blend_equation_separate := False;
  EXT_blend_func_separate := False;
  EXT_blend_logic_op := False;
  EXT_blend_minmax := False;
  EXT_blend_subtract := False;
  EXT_Cg_shader := False;
  EXT_clip_volume_hint := False;
  EXT_compiled_vertex_array := False;
  EXT_copy_texture := False;
  EXT_depth_bounds_test := False;
  EXT_draw_buffers2 := False;
  EXT_draw_instanced := False;
  EXT_draw_range_elements := False;
  EXT_fog_coord := False;
  EXT_framebuffer_blit := False;
  EXT_framebuffer_multisample := False;
  EXT_framebuffer_object := False;
  EXT_framebuffer_sRGB := False;
  EXT_geometry_shader4 := False;
  EXT_gpu_program_parameters := False;
  EXT_gpu_shader4 := False;
  EXT_multi_draw_arrays := False;
  EXT_multisample := False;
  EXT_packed_depth_stencil := False;
  EXT_packed_float := False;
  EXT_packed_pixels := False;
  EXT_paletted_texture := False;
  EXT_pixel_buffer_object := False;
  EXT_polygon_offset := False;
  EXT_rescale_normal := False;
  EXT_secondary_color := False;
  EXT_separate_specular_color := False;
  EXT_shadow_funcs := False;
  EXT_shared_texture_palette := False;
  EXT_stencil_clear_tag := False;
  EXT_stencil_two_side := False;
  EXT_stencil_wrap := False;
  EXT_texture3D := False;
  EXT_texture_array := False;
  EXT_texture_buffer_object := False;
  EXT_texture_compression_latc := False;
  EXT_texture_compression_rgtc := False;
  EXT_texture_compression_s3tc := False;
  EXT_texture_cube_map := False;
  EXT_texture_edge_clamp := False;
  EXT_texture_env_add := False;
  EXT_texture_env_combine := False;
  EXT_texture_env_dot3 := False;
  EXT_texture_filter_anisotropic := False;
  EXT_texture_integer := False;
  EXT_texture_lod := False;
  EXT_texture_lod_bias := False;
  EXT_texture_mirror_clamp := False;
  EXT_texture_object := False;
  EXT_texture_rectangle := False;
  EXT_texture_sRGB := False;
  EXT_texture_shared_exponent := False;
  EXT_timer_query := False;
  EXT_transform_feedback := False;
  EXT_vertex_array := False;

  HP_occlusion_test := False;

  IBM_rasterpos_clip := False;

  KTX_buffer_region := False;

  MESA_resize_buffers := False;

  NV_blend_square := False;
  NV_conditional_render := False;
  NV_copy_image := False;
  NV_depth_buffer_float := False;
  NV_fence := False;
  NV_float_buffer := False;
  NV_fog_distance := False;
  NV_geometry_program4 := False;
  NV_light_max_exponent := False;
  NV_multisample_filter_hint := False;
  NV_occlusion_query := False;
  NV_point_sprite := False;
  NV_primitive_restart := False;
  NV_register_combiners := False;
  NV_shader_buffer_load := False;
  NV_texgen_reflection := False;
  NV_texture_compression_vtc := False;
  NV_texture_env_combine4 := False;
  NV_texture_rectangle := False;
  NV_texture_shader := False;
  NV_texture_shader2 := False;
  NV_texture_shader3 := False;
  NV_transform_feedback := False;
  NV_vertex_array_range := False;
  NV_vertex_array_range2 := False;
  NV_vertex_buffer_unified_memory := False;
  NV_vertex_program := False;

  SGI_color_matrix := False;

  SGIS_generate_mipmap := False;
  SGIS_multisample := False;
  SGIS_texture_border_clamp := False;
  SGIS_texture_color_mask := False;
  SGIS_texture_edge_clamp := False;
  SGIS_texture_lod := False;

  SGIX_depth_texture := False;
  SGIX_shadow := False;
  SGIX_shadow_ambient := False;

  AMD_vertex_shader_tessellator := False;

  WIN_swap_hint := False;
  ATI_meminfo := False;
  NVX_gpu_memory_info := False;
  NV_vdpau_interop := False;

  GREMEDY_frame_terminator := False;
  GREMEDY_string_marker := False;
  ARB_debug_output := False;

  BindTexture := GetCapAddress();
  BlendFunc := GetCapAddress();
  Clear := GetCapAddress();
  ClearColor := GetCapAddress();
  ClearDepth := GetCapAddress();
  ClearStencil := GetCapAddress();
  ColorMask := GetCapAddress();
  CopyTexImage1D := GetCapAddress();
  CopyTexImage2D := GetCapAddress();
  CopyTexSubImage1D := GetCapAddress();
  CopyTexSubImage2D := GetCapAddress();
  CullFace := GetCapAddress();
  DeleteTextures := GetCapAddress();
  DepthFunc := GetCapAddress();
  DepthMask := GetCapAddress();
  DepthRange := GetCapAddress();
  Disable := GetCapAddress();
  DrawArrays := GetCapAddress();
  DrawBuffer := GetCapAddress();
  DrawElements := GetCapAddress();
  Enable := GetCapAddress();
  Finish := GetCapAddress();
  Flush := GetCapAddress();
  FrontFace := GetCapAddress();
  GenTextures := GetCapAddress();
  GetBooleanv := GetCapAddress();
  GetDoublev := GetCapAddress();
  GetError := GetCapAddress();
  GetFloatv := GetCapAddress();
  GetPointerv := GetCapAddress();
  GetString := GetCapAddress();
  GetTexImage := GetCapAddress();
  GetTexLevelParameterfv := GetCapAddress();
  GetTexLevelParameteriv := GetCapAddress();
  GetTexParameterfv := GetCapAddress();
  GetTexParameteriv := GetCapAddress();
  Hint := GetCapAddress();
  IsEnabled := GetCapAddress();
  IsTexture := GetCapAddress();
  LineWidth := GetCapAddress();
  LogicOp := GetCapAddress();
  PixelStoref := GetCapAddress();
  PixelStorei := GetCapAddress();
  PointSize := GetCapAddress();
  PolygonMode := GetCapAddress();
  PolygonOffset := GetCapAddress();
  ReadBuffer := GetCapAddress();
  ReadPixels := GetCapAddress();
  Scissor := GetCapAddress();
  StencilFunc := GetCapAddress();
  StencilMask := GetCapAddress();
  StencilOp := GetCapAddress();
  TexImage1D := GetCapAddress();
  TexImage2D := GetCapAddress();
  TexParameterf := GetCapAddress();
  TexParameterfv := GetCapAddress();
  TexParameteri := GetCapAddress();
  TexParameteriv := GetCapAddress();
  TexSubImage1D := GetCapAddress();
  TexSubImage2D := GetCapAddress();
  Viewport := GetCapAddress();
  Accum := GetCapAddress();
  AlphaFunc := GetCapAddress();
  AreTexturesResident := GetCapAddress();
  ArrayElement := GetCapAddress();
  Begin_ := GetCapAddress();
  Bitmap := GetCapAddress();
  CallList := GetCapAddress();
  CallLists := GetCapAddress();
  ClearAccum := GetCapAddress();
  ClearIndex := GetCapAddress();
  ClipPlane := GetCapAddress();
  Color3b := GetCapAddress();
  Color3bv := GetCapAddress();
  Color3d := GetCapAddress();
  Color3dv := GetCapAddress();
  Color3f := GetCapAddress();
  Color3fv := GetCapAddress();
  Color3i := GetCapAddress();
  Color3iv := GetCapAddress();
  Color3s := GetCapAddress();
  Color3sv := GetCapAddress();
  Color3ub := GetCapAddress();
  Color3ubv := GetCapAddress();
  Color3ui := GetCapAddress();
  Color3uiv := GetCapAddress();
  Color3us := GetCapAddress();
  Color3usv := GetCapAddress();
  Color4b := GetCapAddress();
  Color4bv := GetCapAddress();
  Color4d := GetCapAddress();
  Color4dv := GetCapAddress();
  Color4f := GetCapAddress();
  Color4fv := GetCapAddress();
  Color4i := GetCapAddress();
  Color4iv := GetCapAddress();
  Color4s := GetCapAddress();
  Color4sv := GetCapAddress();
  Color4ub := GetCapAddress();
  Color4ubv := GetCapAddress();
  Color4ui := GetCapAddress();
  Color4uiv := GetCapAddress();
  Color4us := GetCapAddress();
  Color4usv := GetCapAddress();
  ColorMaterial := GetCapAddress();
  ColorPointer := GetCapAddress();
  CopyPixels := GetCapAddress();
  DeleteLists := GetCapAddress();
  DisableClientState := GetCapAddress();
  DrawPixels := GetCapAddress();
  EdgeFlag := GetCapAddress();
  EdgeFlagPointer := GetCapAddress();
  EdgeFlagv := GetCapAddress();
  EnableClientState := GetCapAddress();
  End_ := GetCapAddress();
  EndList := GetCapAddress();
  EvalCoord1d := GetCapAddress();
  EvalCoord1dv := GetCapAddress();
  EvalCoord1f := GetCapAddress();
  EvalCoord1fv := GetCapAddress();
  EvalCoord2d := GetCapAddress();
  EvalCoord2dv := GetCapAddress();
  EvalCoord2f := GetCapAddress();
  EvalCoord2fv := GetCapAddress();
  EvalMesh1 := GetCapAddress();
  EvalMesh2 := GetCapAddress();
  EvalPoint1 := GetCapAddress();
  EvalPoint2 := GetCapAddress();
  FeedbackBuffer := GetCapAddress();
  Fogf := GetCapAddress();
  Fogfv := GetCapAddress();
  Fogi := GetCapAddress();
  Fogiv := GetCapAddress();
  Frustum := GetCapAddress();
  GenLists := GetCapAddress();
  GetClipPlane := GetCapAddress();
  GetLightfv := GetCapAddress();
  GetLightiv := GetCapAddress();
  GetMapdv := GetCapAddress();
  GetMapfv := GetCapAddress();
  GetMapiv := GetCapAddress();
  GetMaterialfv := GetCapAddress();
  GetMaterialiv := GetCapAddress();
  GetPixelMapfv := GetCapAddress();
  GetPixelMapuiv := GetCapAddress();
  GetPixelMapusv := GetCapAddress();
  GetPolygonStipple := GetCapAddress();
  GetTexEnvfv := GetCapAddress();
  GetTexEnviv := GetCapAddress();
  GetTexGendv := GetCapAddress();
  GetTexGenfv := GetCapAddress();
  GetTexGeniv := GetCapAddress();
  IndexMask := GetCapAddress();
  IndexPointer := GetCapAddress();
  Indexd := GetCapAddress();
  Indexdv := GetCapAddress();
  Indexf := GetCapAddress();
  Indexfv := GetCapAddress();
  Indexi := GetCapAddress();
  Indexiv := GetCapAddress();
  Indexs := GetCapAddress();
  Indexsv := GetCapAddress();
  Indexub := GetCapAddress();
  Indexubv := GetCapAddress();
  InitNames := GetCapAddress();
  InterleavedArrays := GetCapAddress();
  IsList := GetCapAddress();
  LightModelf := GetCapAddress();
  LightModelfv := GetCapAddress();
  LightModeli := GetCapAddress();
  LightModeliv := GetCapAddress();
  Lightf := GetCapAddress();
  Lightfv := GetCapAddress();
  Lighti := GetCapAddress();
  Lightiv := GetCapAddress();
  LineStipple := GetCapAddress();
  ListBase := GetCapAddress();
  LoadIdentity := GetCapAddress();
  LoadMatrixd := GetCapAddress();
  LoadMatrixf := GetCapAddress();
  LoadName := GetCapAddress();
  Map1d := GetCapAddress();
  Map1f := GetCapAddress();
  Map2d := GetCapAddress();
  Map2f := GetCapAddress();
  MapGrid1d := GetCapAddress();
  MapGrid1f := GetCapAddress();
  MapGrid2d := GetCapAddress();
  MapGrid2f := GetCapAddress();
  Materialf := GetCapAddress();
  Materialfv := GetCapAddress();
  Materiali := GetCapAddress();
  Materialiv := GetCapAddress();
  MatrixMode := GetCapAddress();
  MultMatrixd := GetCapAddress();
  MultMatrixf := GetCapAddress();
  NewList := GetCapAddress();
  Normal3b := GetCapAddress();
  Normal3bv := GetCapAddress();
  Normal3d := GetCapAddress();
  Normal3dv := GetCapAddress();
  Normal3f := GetCapAddress();
  Normal3fv := GetCapAddress();
  Normal3i := GetCapAddress();
  Normal3iv := GetCapAddress();
  Normal3s := GetCapAddress();
  Normal3sv := GetCapAddress();
  NormalPointer := GetCapAddress();
  Ortho := GetCapAddress();
  PassThrough := GetCapAddress();
  PixelMapfv := GetCapAddress();
  PixelMapuiv := GetCapAddress();
  PixelMapusv := GetCapAddress();
  PixelTransferf := GetCapAddress();
  PixelTransferi := GetCapAddress();
  PixelZoom := GetCapAddress();
  PolygonStipple := GetCapAddress();
  PopAttrib := GetCapAddress();
  PopClientAttrib := GetCapAddress();
  PopMatrix := GetCapAddress();
  PopName := GetCapAddress();
  PrioritizeTextures := GetCapAddress();
  PushAttrib := GetCapAddress();
  PushClientAttrib := GetCapAddress();
  PushMatrix := GetCapAddress();
  PushName := GetCapAddress();
  RasterPos2d := GetCapAddress();
  RasterPos2dv := GetCapAddress();
  RasterPos2f := GetCapAddress();
  RasterPos2fv := GetCapAddress();
  RasterPos2i := GetCapAddress();
  RasterPos2iv := GetCapAddress();
  RasterPos2s := GetCapAddress();
  RasterPos2sv := GetCapAddress();
  RasterPos3d := GetCapAddress();
  RasterPos3dv := GetCapAddress();
  RasterPos3f := GetCapAddress();
  RasterPos3fv := GetCapAddress();
  RasterPos3i := GetCapAddress();
  RasterPos3iv := GetCapAddress();
  RasterPos3s := GetCapAddress();
  RasterPos3sv := GetCapAddress();
  RasterPos4d := GetCapAddress();
  RasterPos4dv := GetCapAddress();
  RasterPos4f := GetCapAddress();
  RasterPos4fv := GetCapAddress();
  RasterPos4i := GetCapAddress();
  RasterPos4iv := GetCapAddress();
  RasterPos4s := GetCapAddress();
  RasterPos4sv := GetCapAddress();
  Rectd := GetCapAddress();
  Rectdv := GetCapAddress();
  Rectf := GetCapAddress();
  Rectfv := GetCapAddress();
  Recti := GetCapAddress();
  Rectiv := GetCapAddress();
  Rects := GetCapAddress();
  Rectsv := GetCapAddress();
  RenderMode := GetCapAddress();
  Rotated := GetCapAddress();
  Rotatef := GetCapAddress();
  Scaled := GetCapAddress();
  Scalef := GetCapAddress();
  SelectBuffer := GetCapAddress();
  ShadeModel := GetCapAddress();
  TexCoord1d := GetCapAddress();
  TexCoord1dv := GetCapAddress();
  TexCoord1f := GetCapAddress();
  TexCoord1fv := GetCapAddress();
  TexCoord1i := GetCapAddress();
  TexCoord1iv := GetCapAddress();
  TexCoord1s := GetCapAddress();
  TexCoord1sv := GetCapAddress();
  TexCoord2d := GetCapAddress();
  TexCoord2dv := GetCapAddress();
  TexCoord2f := GetCapAddress();
  TexCoord2fv := GetCapAddress();
  TexCoord2i := GetCapAddress();
  TexCoord2iv := GetCapAddress();
  TexCoord2s := GetCapAddress();
  TexCoord2sv := GetCapAddress();
  TexCoord3d := GetCapAddress();
  TexCoord3dv := GetCapAddress();
  TexCoord3f := GetCapAddress();
  TexCoord3fv := GetCapAddress();
  TexCoord3i := GetCapAddress();
  TexCoord3iv := GetCapAddress();
  TexCoord3s := GetCapAddress();
  TexCoord3sv := GetCapAddress();
  TexCoord4d := GetCapAddress();
  TexCoord4dv := GetCapAddress();
  TexCoord4f := GetCapAddress();
  TexCoord4fv := GetCapAddress();
  TexCoord4i := GetCapAddress();
  TexCoord4iv := GetCapAddress();
  TexCoord4s := GetCapAddress();
  TexCoord4sv := GetCapAddress();
  TexCoordPointer := GetCapAddress();
  TexEnvf := GetCapAddress();
  TexEnvfv := GetCapAddress();
  TexEnvi := GetCapAddress();
  TexEnviv := GetCapAddress();
  TexGend := GetCapAddress();
  TexGendv := GetCapAddress();
  TexGenf := GetCapAddress();
  TexGenfv := GetCapAddress();
  TexGeni := GetCapAddress();
  TexGeniv := GetCapAddress();
  Translated := GetCapAddress();
  Translatef := GetCapAddress();
  Vertex2d := GetCapAddress();
  Vertex2dv := GetCapAddress();
  Vertex2f := GetCapAddress();
  Vertex2fv := GetCapAddress();
  Vertex2i := GetCapAddress();
  Vertex2iv := GetCapAddress();
  Vertex2s := GetCapAddress();
  Vertex2sv := GetCapAddress();
  Vertex3d := GetCapAddress();
  Vertex3dv := GetCapAddress();
  Vertex3f := GetCapAddress();
  Vertex3fv := GetCapAddress();
  Vertex3i := GetCapAddress();
  Vertex3iv := GetCapAddress();
  Vertex3s := GetCapAddress();
  Vertex3sv := GetCapAddress();
  Vertex4d := GetCapAddress();
  Vertex4dv := GetCapAddress();
  Vertex4f := GetCapAddress();
  Vertex4fv := GetCapAddress();
  Vertex4i := GetCapAddress();
  Vertex4iv := GetCapAddress();
  Vertex4s := GetCapAddress();
  Vertex4sv := GetCapAddress();
  VertexPointer := GetCapAddress();
  BlendColor := GetCapAddress();
  BlendEquation := GetCapAddress();
  DrawRangeElements := GetCapAddress();
  TexImage3D := GetCapAddress();
  TexSubImage3D := GetCapAddress();
  CopyTexSubImage3D := GetCapAddress();

  IsRenderbuffer := GetCapAddress();
  BindRenderbuffer := GetCapAddress();
  DeleteRenderbuffers := GetCapAddress();
  GenRenderbuffers := GetCapAddress();
  RenderbufferStorage := GetCapAddress();
  RenderbufferStorageMultisample := GetCapAddress();
  GetRenderbufferParameteriv := GetCapAddress();
  IsFramebuffer := GetCapAddress();
  BindFramebuffer := GetCapAddress();
  DeleteFramebuffers := GetCapAddress();
  GenFramebuffers := GetCapAddress();
  CheckFramebufferStatus := GetCapAddress();
  FramebufferTexture := GetCapAddress();
  FramebufferTexture1D := GetCapAddress();
  FramebufferTexture2D := GetCapAddress();
  FramebufferTexture3D := GetCapAddress();
  FramebufferTextureLayer := GetCapAddress();
  FramebufferTextureFace := GetCapAddress();
  FramebufferRenderbuffer := GetCapAddress();
  GetFramebufferAttachmentParameteriv := GetCapAddress();
  BlitFramebuffer := GetCapAddress();
  GenerateMipmap := GetCapAddress();
  ClearBufferiv := GetCapAddress();
  ClearBufferuiv := GetCapAddress();
  ClearBufferfv := GetCapAddress();
  ClearBufferfi := GetCapAddress();
  LockArrays := GetCapAddress();
  UnlockArrays := GetCapAddress();
  BindBuffer := GetCapAddress();
  DeleteBuffers := GetCapAddress();
  GenBuffers := GetCapAddress();
  IsBuffer := GetCapAddress();
  BufferData := GetCapAddress();
  BufferSubData := GetCapAddress();
  GetBufferSubData := GetCapAddress();
  MapBuffer := GetCapAddress();
  UnmapBuffer := GetCapAddress();
  GetBufferParameteriv := GetCapAddress();
  GetBufferPointerv := GetCapAddress();
  MapBufferRange := GetCapAddress();
  FlushMappedBufferRange := GetCapAddress();
  BindBufferRange := GetCapAddress();
  BindBufferOffset := GetCapAddress();
  BindBufferBase := GetCapAddress();
  BeginTransformFeedback := GetCapAddress();
  EndTransformFeedback := GetCapAddress();
  TransformFeedbackVaryings := GetCapAddress();
  GetTransformFeedbackVarying := GetCapAddress();

  TransformFeedbackAttribs := GetCapAddress();
  TransformFeedbackVaryingsNV := GetCapAddress();
  TexBuffer := GetCapAddress();
  BindVertexArray := GetCapAddress();
  DeleteVertexArrays := GetCapAddress();
  GenVertexArrays := GetCapAddress();
  IsVertexArray := GetCapAddress();
  FlushVertexArrayRangeNV := GetCapAddress();
  VertexArrayRangeNV := GetCapAddress();
  CopyBufferSubData := GetCapAddress();
  UniformBuffer := GetCapAddress();
  GetUniformBufferSize := GetCapAddress();
  GetUniformOffset := GetCapAddress();
  PrimitiveRestartIndex := GetCapAddress();

  DrawElementsBaseVertex := GetCapAddress();
  DrawRangeElementsBaseVertex := GetCapAddress();
  DrawElementsInstancedBaseVertex := GetCapAddress();
  MultiDrawElementsBaseVertex := GetCapAddress();
  DrawArraysInstanced := GetCapAddress();
  DrawElementsInstanced := GetCapAddress();

  VertexAttrib1d := GetCapAddress();
  VertexAttrib1dv := GetCapAddress();
  VertexAttrib1f := GetCapAddress();
  VertexAttrib1fv := GetCapAddress();
  VertexAttrib1s := GetCapAddress();
  VertexAttrib1sv := GetCapAddress();
  VertexAttrib2d := GetCapAddress();
  VertexAttrib2dv := GetCapAddress();
  VertexAttrib2f := GetCapAddress();
  VertexAttrib2fv := GetCapAddress();
  VertexAttrib2s := GetCapAddress();
  VertexAttrib2sv := GetCapAddress();
  VertexAttrib3d := GetCapAddress();
  VertexAttrib3dv := GetCapAddress();
  VertexAttrib3f := GetCapAddress();
  VertexAttrib3fv := GetCapAddress();
  VertexAttrib3s := GetCapAddress();
  VertexAttrib3sv := GetCapAddress();
  VertexAttrib4Nbv := GetCapAddress();
  VertexAttrib4Niv := GetCapAddress();
  VertexAttrib4Nsv := GetCapAddress();
  VertexAttrib4Nub := GetCapAddress();
  VertexAttrib4Nubv := GetCapAddress();
  VertexAttrib4Nuiv := GetCapAddress();
  VertexAttrib4Nusv := GetCapAddress();
  VertexAttrib4bv := GetCapAddress();
  VertexAttrib4d := GetCapAddress();
  VertexAttrib4dv := GetCapAddress();
  VertexAttrib4f := GetCapAddress();
  VertexAttrib4fv := GetCapAddress();
  VertexAttrib4iv := GetCapAddress();
  VertexAttrib4s := GetCapAddress();
  VertexAttrib4sv := GetCapAddress();
  VertexAttrib4ubv := GetCapAddress();
  VertexAttrib4uiv := GetCapAddress();
  VertexAttrib4usv := GetCapAddress();
  VertexAttribPointer := GetCapAddress();
  VertexAttribI1i := GetCapAddress();
  VertexAttribI2i := GetCapAddress();
  VertexAttribI3i := GetCapAddress();
  VertexAttribI4i := GetCapAddress();
  VertexAttribI1ui := GetCapAddress();
  VertexAttribI2ui := GetCapAddress();
  VertexAttribI3ui := GetCapAddress();
  VertexAttribI4ui := GetCapAddress();
  VertexAttribI1iv := GetCapAddress();
  VertexAttribI2iv := GetCapAddress();
  VertexAttribI3iv := GetCapAddress();
  VertexAttribI4iv := GetCapAddress();
  VertexAttribI1uiv := GetCapAddress();
  VertexAttribI2uiv := GetCapAddress();
  VertexAttribI3uiv := GetCapAddress();
  VertexAttribI4uiv := GetCapAddress();
  VertexAttribI4bv := GetCapAddress();
  VertexAttribI4sv := GetCapAddress();
  VertexAttribI4ubv := GetCapAddress();
  VertexAttribI4usv := GetCapAddress();
  VertexAttribIPointer := GetCapAddress();
  GetVertexAttribIiv := GetCapAddress();
  GetVertexAttribIuiv := GetCapAddress();
  EnableVertexAttribArray := GetCapAddress();
  DisableVertexAttribArray := GetCapAddress();
  VertexAttribDivisor := GetCapAddress();

  GenQueries := GetCapAddress();
  DeleteQueries := GetCapAddress();
  IsQuery := GetCapAddress();
  BeginQuery := GetCapAddress();
  EndQuery := GetCapAddress();
  GetQueryiv := GetCapAddress();
  GetQueryObjectiv := GetCapAddress();
  GetQueryObjectuiv := GetCapAddress();
  QueryCounter := GetCapAddress();
  GetQueryObjecti64v := GetCapAddress();
  GetQueryObjectui64v := GetCapAddress();

  DeleteObject := GetCapAddress();
  GetHandle := GetCapAddress();
  DetachShader := GetCapAddress();
  CreateShader := GetCapAddress();
  ShaderSource := GetCapAddress();
  CompileShader := GetCapAddress();
  CreateProgram := GetCapAddress();
  AttachShader := GetCapAddress();
  LinkProgram := GetCapAddress();
  UseProgram := GetCapAddress();
  ValidateProgram := GetCapAddress();
  Uniform1f := GetCapAddress();
  Uniform2f := GetCapAddress();
  Uniform3f := GetCapAddress();
  Uniform4f := GetCapAddress();
  Uniform1i := GetCapAddress();
  Uniform2i := GetCapAddress();
  Uniform3i := GetCapAddress();
  Uniform4i := GetCapAddress();
  Uniform1fv := GetCapAddress();
  Uniform2fv := GetCapAddress();
  Uniform3fv := GetCapAddress();
  Uniform4fv := GetCapAddress();
  Uniform1iv := GetCapAddress();
  Uniform2iv := GetCapAddress();
  Uniform3iv := GetCapAddress();
  Uniform4iv := GetCapAddress();
  Uniform1ui := GetCapAddress();
  Uniform2ui := GetCapAddress();
  Uniform3ui := GetCapAddress();
  Uniform4ui := GetCapAddress();
  Uniform1uiv := GetCapAddress();
  Uniform2uiv := GetCapAddress();
  Uniform3uiv := GetCapAddress();
  Uniform4uiv := GetCapAddress();
  GetUniformuiv := GetCapAddress();
  UniformMatrix2fv := GetCapAddress();
  UniformMatrix3fv := GetCapAddress();
  UniformMatrix4fv := GetCapAddress();
  BindFragDataLocation := GetCapAddress();
  GetFragDataLocation := GetCapAddress();
  ClampColor := GetCapAddress();
  ColorMaski := GetCapAddress();
  GetBooleani_v := GetCapAddress();
  GetIntegeri_v := GetCapAddress();
  Enablei := GetCapAddress();
  Disablei := GetCapAddress();
  IsEnabledi := GetCapAddress();
  BindFragDataLocationIndexed := GetCapAddress();
  GetFragDataIndex := GetCapAddress();
  GetObjectParameterfv := GetCapAddress();
  GetObjectParameteriv := GetCapAddress();
  GetAttachedObjects := GetCapAddress();
  GetActiveAttrib := GetCapAddress();
  GetActiveUniform := GetCapAddress();
  GetAttachedShaders := GetCapAddress();
  GetAttribLocation := GetCapAddress();
  GetProgramiv := GetCapAddress();
  GetProgramInfoLog := GetCapAddress();
  GetShaderiv := GetCapAddress();
  GetInfoLog := GetCapAddress();
  GetShaderInfoLog := GetCapAddress();
  GetShaderSource := GetCapAddress();
  GetUniformLocation := GetCapAddress();
  GetUniformfv := GetCapAddress();
  GetUniformiv := GetCapAddress();
  GetVertexAttribdv := GetCapAddress();
  GetVertexAttribfv := GetCapAddress();
  GetVertexAttribiv := GetCapAddress();
  GetVertexAttribPointerv := GetCapAddress();
  IsProgram := GetCapAddress();
  IsShader := GetCapAddress();
  GetUniformLocation := GetCapAddress();
  BindAttribLocation := GetCapAddress();
  GetVaryingLocation := GetCapAddress();
  GetActiveVarying := GetCapAddress();
  ActiveVarying := GetCapAddress();
  GetUniformIndices := GetCapAddress();
  GetActiveUniformsiv := GetCapAddress();
  GetActiveUniformName := GetCapAddress();
  GetUniformBlockIndex := GetCapAddress();
  GetActiveUniformBlockiv := GetCapAddress();
  GetActiveUniformBlockName := GetCapAddress();
  UniformBlockBinding := GetCapAddress();
  GetProgramBinary := GetCapAddress();
  ProgramBinary := GetCapAddress();

  DrawBuffers := GetCapAddress();

  ActiveTexture := GetCapAddress();
  CompressedTexImage3D := GetCapAddress();
  CompressedTexImage2D := GetCapAddress();
  CompressedTexImage1D := GetCapAddress();
  CompressedTexSubImage3D := GetCapAddress();
  CompressedTexSubImage2D := GetCapAddress();
  CompressedTexSubImage1D := GetCapAddress();
  GetCompressedTexImage := GetCapAddress();
  ClientActiveTexture := GetCapAddress();
  MultiTexCoord1d := GetCapAddress();
  MultiTexCoord1dV := GetCapAddress();
  MultiTexCoord1f := GetCapAddress();
  MultiTexCoord1fv := GetCapAddress();
  MultiTexCoord1i := GetCapAddress();
  MultiTexCoord1iv := GetCapAddress();
  MultiTexCoord1s := GetCapAddress();
  MultiTexCoord1sv := GetCapAddress();
  MultiTexCoord2d := GetCapAddress();
  MultiTexCoord2dv := GetCapAddress();
  MultiTexCoord2f := GetCapAddress();
  MultiTexCoord2fv := GetCapAddress();
  MultiTexCoord2i := GetCapAddress();
  MultiTexCoord2iv := GetCapAddress();
  MultiTexCoord2s := GetCapAddress();
  MultiTexCoord2sv := GetCapAddress();
  MultiTexCoord3d := GetCapAddress();
  MultiTexCoord3dv := GetCapAddress();
  MultiTexCoord3f := GetCapAddress();
  MultiTexCoord3fv := GetCapAddress();
  MultiTexCoord3i := GetCapAddress();
  MultiTexCoord3iv := GetCapAddress();
  MultiTexCoord3s := GetCapAddress();
  MultiTexCoord3sv := GetCapAddress();
  MultiTexCoord4d := GetCapAddress();
  MultiTexCoord4dv := GetCapAddress();
  MultiTexCoord4f := GetCapAddress();
  MultiTexCoord4fv := GetCapAddress();
  MultiTexCoord4i := GetCapAddress();
  MultiTexCoord4iv := GetCapAddress();
  MultiTexCoord4s := GetCapAddress();
  MultiTexCoord4sv := GetCapAddress();

  GetInteger64i_v := GetCapAddress();
  GetBufferParameteri64v := GetCapAddress();
  ProgramParameteri := GetCapAddress();

  ProgramString := GetCapAddress();
  BindProgram := GetCapAddress();
  DeletePrograms := GetCapAddress();
  GenPrograms := GetCapAddress();
  ProgramEnvParameter4d := GetCapAddress();
  ProgramEnvParameter4dv := GetCapAddress();
  ProgramEnvParameter4f := GetCapAddress();
  ProgramEnvParameter4fv := GetCapAddress();
  ProgramLocalParameter4d := GetCapAddress();
  ProgramLocalParameter4dv := GetCapAddress();
  ProgramLocalParameter4f := GetCapAddress();
  ProgramLocalParameter4fv := GetCapAddress();
  GetProgramEnvParameterdv := GetCapAddress();
  GetProgramEnvParameterfv := GetCapAddress();
  GetProgramLocalParameterdv := GetCapAddress();
  GetProgramLocalParameterfv := GetCapAddress();

  ClearColorIi := GetCapAddress();
  ClearColorIui := GetCapAddress();
  TexParameterIiv := GetCapAddress();
  TexParameterIuiv := GetCapAddress();
  GetTexParameterIiv := GetCapAddress();
  GetTexParameterIuiv := GetCapAddress();
  PatchParameteri := GetCapAddress();
  PatchParameterfv := GetCapAddress();

  TexImage2DMultisample := GetCapAddress();
  TexImage3DMultisample := GetCapAddress();
  GetMultisamplefv := GetCapAddress();
  SampleMaski := GetCapAddress();

  ProvokingVertex := GetCapAddress();

  FenceSync := GetCapAddress();
  IsSync := GetCapAddress();
  DeleteSync := GetCapAddress();
  ClientWaitSync := GetCapAddress();
  WaitSync := GetCapAddress();
  GetInteger64v := GetCapAddress();
  GetSynciv := GetCapAddress();

  BlendEquationi := GetCapAddress();
  BlendEquationSeparatei := GetCapAddress();
  BlendFunci := GetCapAddress();
  BlendFuncSeparatei := GetCapAddress();
  MinSampleShading := GetCapAddress();

  GenSamplers := GetCapAddress();
  DeleteSamplers := GetCapAddress();
  IsSampler := GetCapAddress();
  BindSampler := GetCapAddress();
  SamplerParameteri := GetCapAddress();
  SamplerParameteriv := GetCapAddress();
  SamplerParameterf := GetCapAddress();
  SamplerParameterfv := GetCapAddress();
  SamplerParameterIiv := GetCapAddress();
  SamplerParameterIuiv := GetCapAddress();
  GetSamplerParameteriv := GetCapAddress();
  GetSamplerParameterIiv := GetCapAddress();
  GetSamplerParameterfv := GetCapAddress();
  GetSamplerParameterIfv := GetCapAddress();

  FrameTerminatorGREMEDY := GetCapAddress();
  StringMarkerGREMEDY := GetCapAddress();
  DebugMessageControl := GetCapAddress();
  DebugMessageInsert := GetCapAddress();
  DebugMessageCallback := GetCapAddress();
  GetDebugMessageLog := GetCapAddress();

  FInitialized := False;
end;

{$IFDEF SUPPORT_WGL}
// ReadWGLImplementationProperties


procedure TGLExtensionsAndEntryPoints.ReadWGLImplementationProperties;
begin
  // ARB wgl extensions
  if Assigned(WGetExtensionsStringARB) then
    FBuffer := string(WGetExtensionsStringARB(wglGetCurrentDC))
  else
    FBuffer := '';
  W_ARB_buffer_region := CheckExtension('WGL_ARB_buffer_region');
  W_ARB_create_context := CheckExtension('WGL_ARB_create_context');
  W_ARB_create_context_profile := CheckExtension('WGL_ARB_create_context_profile');
  W_ARB_extensions_string := CheckExtension('WGL_ARB_extensions_string');
  W_ARB_framebuffer_sRGB := CheckExtension('WGL_ARB_framebuffer_sRGB');
  W_ARB_make_current_read := CheckExtension('WGL_ARB_make_current_read');
  W_ARB_multisample := CheckExtension('WGL_ARB_multisample');
  W_ARB_pbuffer := CheckExtension('WGL_ARB_pbuffer');
  W_ARB_pixel_format := CheckExtension('WGL_ARB_pixel_format');
  W_ARB_pixel_format_float := CheckExtension('WGL_ARB_pixel_format_float');
  W_ARB_render_texture := CheckExtension('WGL_ARB_render_texture');
  // Vendor/EXT wgl extensions
  W_ATI_pixel_format_float := CheckExtension('WGL_ATI_pixel_format_float');
  W_EXT_framebuffer_sRGB := CheckExtension('WGL_EXT_framebuffer_sRGB');
  W_EXT_pixel_format_packed_float := CheckExtension('WGL_EXT_pixel_format_packed_float');
  W_EXT_swap_control := CheckExtension('WGL_EXT_swap_control');
  W_NV_gpu_affinity := CheckExtension('WGL_NV_gpu_affinity');
end;

// ReadWGLExtensions


procedure TGLExtensionsAndEntryPoints.ReadWGLExtensions;
begin
  // ARB wgl extensions

  // ###########################################################
  // locating functions and procedures for
  // ARB approved WGL extensions
  // ###########################################################

  // WGL_buffer_region (ARB #4)
  WCreateBufferRegionARB := GLGetProcAddress('wglCreateBufferRegionARB');
  WDeleteBufferRegionARB := GLGetProcAddress('wglDeleteBufferRegionARB');
  WSaveBufferRegionARB := GLGetProcAddress('wglSaveBufferRegionARB');
  WRestoreBufferRegionARB := GLGetProcAddress('wglRestoreBufferRegionARB');

  // WGL_ARB_extensions_string (ARB #8)
  WGetExtensionsStringARB := GLGetProcAddress('wglGetExtensionsStringARB');

  // WGL_ARB_pixel_format (ARB #9)
  WGetPixelFormatAttribivARB := GLGetProcAddress('wglGetPixelFormatAttribivARB');
  WGetPixelFormatAttribfvARB := GLGetProcAddress('wglGetPixelFormatAttribfvARB');
  WChoosePixelFormatARB := GLGetProcAddress('wglChoosePixelFormatARB');

  // WGL_make_current_read (ARB #10)
  WMakeContextCurrentARB := GLGetProcAddress('wglMakeContextCurrentARB');
  WGetCurrentReadDCARB := GLGetProcAddress('wglGetCurrentReadDCARB');

  // WGL_ARB_pbuffer (ARB #11)
  WCreatePbufferARB := GLGetProcAddress('wglCreatePbufferARB');
  WGetPbufferDCARB := GLGetProcAddress('wglGetPbufferDCARB');
  WReleasePbufferDCARB := GLGetProcAddress('wglReleasePbufferDCARB');
  WDestroyPbufferARB := GLGetProcAddress('wglDestroyPbufferARB');
  WQueryPbufferARB := GLGetProcAddress('wglQueryPbufferARB');

  // WGL_ARB_render_texture (ARB #20)
  WBindTexImageARB := GLGetProcAddress('wglBindTexImageARB');
  WReleaseTexImageARB := GLGetProcAddress('wglReleaseTexImageARB');
  WSetPbufferAttribARB := GLGetProcAddress('wglSetPbufferAttribARB');

  // WGL_ARB_create_context (ARB #55)
  WCreateContextAttribsARB := GLGetProcAddress('wglCreateContextAttribsARB');

  // ###########################################################
  // locating functions and procedures for
  // Vendor/EXT WGL extensions
  // ###########################################################

  // WGL_EXT_swap_control (EXT #172)
  WSwapIntervalEXT := GLGetProcAddress('wglSwapIntervalEXT');
  WGetSwapIntervalEXT := GLGetProcAddress('wglGetSwapIntervalEXT');

  // GL_NV_vertex_array_range (EXT #190)
  WAllocateMemoryNV := GLGetProcAddress('wglAllocateMemoryNV');
  WFreeMemoryNV := GLGetProcAddress('wglFreeMemoryNV');

  // WGL_NV_gpu_affinity
  WEnumGpusNV := GLGetProcAddress('wglEnumGpusNV');
  WEnumGpuDevicesNV := GLGetProcAddress('wglEnumGpuDevicesNV');
  WCreateAffinityDCNV := GLGetProcAddress('wglCreateAffinityDCNV');
  WEnumGpusFromAffinityDCNV := GLGetProcAddress('wglEnumGpusFromAffinityDCNV');
  WDeleteDCNV := GLGetProcAddress('wglDeleteDCNV');
end;

{$ENDIF}
{$IFDEF SUPPORT_GLX}
// ReadGLXImplementationProperties


procedure TGLExtensionsAndEntryPoints.ReadGLXImplementationProperties;
var
  MajorVersion, MinorVersion: integer;
  dpy: PDisplay;
begin
  dpy := glXGetCurrentDisplay();
  FBuffer := string(glXQueryServerString(dpy, XDefaultScreen(dpy), GLX_VERSION));
  TrimAndSplitVersionString(FBuffer, MajorVersion, MinorVersion);
  X_VERSION_1_1 := IsVersionMet(1, 1, MajorVersion, MinorVersion);
  X_VERSION_1_2 := IsVersionMet(1, 2, MajorVersion, MinorVersion);
  X_VERSION_1_3 := IsVersionMet(1, 3, MajorVersion, MinorVersion);
  X_VERSION_1_4 := IsVersionMet(1, 4, MajorVersion, MinorVersion);

  // This procedure will probably need changing, as totally untested
  // This might only work if GLX functions/procedures are loaded dynamically
  if Assigned(glXQueryExtensionsString) then
    FBuffer := glXQueryExtensionsString(dpy, 0) // guess at a valid screen
  else
    FBuffer := '';
  X_ARB_create_context := CheckExtension('GLX_ARB_create_context');
  X_ARB_create_context_profile := CheckExtension('GLX_ARB_create_context_profile');
  X_ARB_framebuffer_sRGB := CheckExtension('GLX_ARB_framebuffer_sRGB');
  X_EXT_framebuffer_sRGB := CheckExtension('GLX_EXT_framebuffer_sRGB');
  X_EXT_fbconfig_packed_float := CheckExtension('GLX_EXT_fbconfig_packed_float');
  X_SGI_swap_control := CheckExtension('GLX_SGI_swap_control');
  X_ARB_multisample := CheckExtension('GLX_ARB_multisample');

  X_SGIS_multisample := CheckExtension('GLX_SGIS_multisample');
  X_EXT_visual_info := CheckExtension('GLX_EXT_visual_info');
  X_SGI_video_sync := CheckExtension('GLX_SGI_video_sync');
  X_SGI_make_current_read := CheckExtension('GLX_SGI_make_current_read');
  X_SGIX_video_source := CheckExtension('GLX_SGIX_video_source');
  X_EXT_visual_rating := CheckExtension('GLX_EXT_visual_rating');
  X_EXT_import_context := CheckExtension('GLX_EXT_import_context');
  X_SGIX_fbconfig := CheckExtension('GLX_SGIX_fbconfig');
  X_SGIX_pbuffer := CheckExtension('GLX_SGIX_pbuffer');
  X_SGI_cushion := CheckExtension('GLX_SGI_cushion');
  X_SGIX_video_resize := CheckExtension('GLX_SGIX_video_resize');
  X_SGIX_dmbuffer := CheckExtension('GLX_SGIX_dmbuffer');
  X_SGIX_swap_group := CheckExtension('GLX_SGIX_swap_group');
  X_SGIX_swap_barrier := CheckExtension('GLX_SGIX_swap_barrier');
  X_SGIS_blended_overlay := CheckExtension('GLX_SGIS_blended_overlay');
  X_SGIS_shared_multisample := CheckExtension('GLX_SGIS_shared_multisample');
  X_SUN_get_transparent_index := CheckExtension('GLX_SUN_get_transparent_index');
  X_3DFX_multisample := CheckExtension('GLX_3DFX_multisample');
  X_MESA_copy_sub_buffer := CheckExtension('GLX_MESA_copy_sub_buffer');
  X_MESA_pixmap_colormap := CheckExtension('GLX_MESA_pixmap_colormap');
  X_MESA_release_buffers := CheckExtension('GLX_MESA_release_buffers');
  X_MESA_set_3dfx_mode := CheckExtension('GLX_MESA_set_3dfx_mode');
  X_SGIX_visual_select_group := CheckExtension('GLX_SGIX_visual_select_group');
  X_SGIX_hyperpipe := CheckExtension('GLX_SGIX_hyperpipe');
  X_NV_multisample_coverage := CheckExtension('GLX_NV_multisample_coverage');
end;

// ReadGLXExtensions


procedure TGLExtensionsAndEntryPoints.ReadGLXExtensions;
begin
  // ARB glx extensions

  // ###########################################################
  // locating functions and procedures for
  // ARB approved GLX extensions
  // ###########################################################

  // GLX 1.3 and later
  XChooseFBConfig := GLGetProcAddress('glXChooseFBConfig');
  XGetFBConfigAttrib := GLGetProcAddress('glXGetFBConfigAttrib');
  XGetFBConfigs := GLGetProcAddress('glXGetFBConfigs');
  XGetVisualFromFBConfig := GLGetProcAddress('glXGetVisualFromFBConfig');
  XCreateWindow := GLGetProcAddress('glXCreateWindow');
  XDestroyWindow := GLGetProcAddress('glXDestroyWindow');
  XCreatePixmap := GLGetProcAddress('glXCreatePixmap');
  XDestroyPixmap := GLGetProcAddress('glXDestroyPixmap');
  XCreatePbuffer := GLGetProcAddress('glXCreatePbuffer');
  XDestroyPbuffer := GLGetProcAddress('glXDestroyPbuffer');
  XQueryDrawable := GLGetProcAddress('glXQueryDrawable');
  XCreateNewContext := GLGetProcAddress('glXCreateNewContext');
  XMakeContextCurrent := GLGetProcAddress('glXMakeContextCurrent');
  XGetCurrentReadDrawable := GLGetProcAddress('glXGetCurrentReadDrawable');
  XQueryContext := GLGetProcAddress('glXQueryContext');
  XSelectEvent := GLGetProcAddress('glXSelectEvent');
  XGetSelectedEvent := GLGetProcAddress('glXGetSelectedEvent');
  XBindTexImageARB := GLGetProcAddress('glXBindTexImageARB');
  XReleaseTexImageARB := GLGetProcAddress('glXReleaseTexImageARB');
  XDrawableAttribARB := GLGetProcAddress('glxDrawableAttribARB');

  // GLX 1.4
  // GLX_ARB_create_context (EXT #56)
  XCreateContextAttribsARB := GLGetProcAddress('glXCreateContextAttribsARB');

  // ###########################################################
  // locating functions and procedures for
  // Vendor/EXT WGL extensions
  // ###########################################################

  // WGL_EXT_swap_control (EXT #172)
  XSwapIntervalSGI := GLGetProcAddress('glXSwapIntervalSGI');
  XGetVideoSyncSGI := GLGetProcAddress('glXGetVideoSyncSGI');
  XWaitVideoSyncSGI := GLGetProcAddress('glXWaitVideoSyncSGI');
  XFreeContextEXT := GLGetProcAddress('glXFreeContextEXT');
  XGetContextIDEXT := GLGetProcAddress('glXGetContextIDEXT');
  XGetCurrentDisplayEXT := GLGetProcAddress('glXGetCurrentDisplayEXT');
  XImportContextEXT := GLGetProcAddress('glXImportContextEXT');
  XQueryContextInfoEXT := GLGetProcAddress('glXQueryContextInfoEXT');
  XCopySubBufferMESA := GLGetProcAddress('glXCopySubBufferMESA');
  XCreateGLXPixmapMESA := GLGetProcAddress('glXCreateGLXPixmapMESA');
  XReleaseBuffersMESA := GLGetProcAddress('glXReleaseBuffersMESA');
  XSet3DfxModeMESA := GLGetProcAddress('glXSet3DfxModeMESA');

  XBindTexImageEXT := GLGetProcAddress('glXBindTexImageEXT');
  XReleaseTexImageEXT := GLGetProcAddress('glXReleaseTexImageEXT');

  // GLX 1.4
  XMakeCurrentReadSGI := GLGetProcAddress('glXMakeCurrentReadSGI');
  XGetCurrentReadDrawableSGI := GLGetProcAddress('glXGetCurrentReadDrawableSGI');
  XGetFBConfigAttribSGIX := GLGetProcAddress('glXGetFBConfigAttribSGIX');
  XChooseFBConfigSGIX := GLGetProcAddress('glXChooseFBConfigSGIX');
  XCreateGLXPixmapWithConfigSGIX := GLGetProcAddress('glXCreateGLXPixmapWithConfigSGIX');
  XCreateContextWithConfigSGIX := GLGetProcAddress('glXCreateContextWithConfigSGIX');
  XGetVisualFromFBConfigSGIX := GLGetProcAddress('glXGetVisualFromFBConfigSGIX');
  XGetFBConfigFromVisualSGIX := GLGetProcAddress('glXGetFBConfigFromVisualSGIX');
  XCreateGLXPbufferSGIX := GLGetProcAddress('glXCreateGLXPbufferSGIX');
  XDestroyGLXPbufferSGIX := GLGetProcAddress('glXDestroyGLXPbufferSGIX');
  XQueryGLXPbufferSGIX := GLGetProcAddress('glXQueryGLXPbufferSGIX');
  XSelectEventSGIX := GLGetProcAddress('glXSelectEventSGIX');
  XGetSelectedEventSGIX := GLGetProcAddress('glXGetSelectedEventSGIX');
  XCushionSGI := GLGetProcAddress('glXCushionSGI');
  XBindChannelToWindowSGIX := GLGetProcAddress('glXBindChannelToWindowSGIX');
  XChannelRectSGIX := GLGetProcAddress('glXChannelRectSGIX');
  XQueryChannelRectSGIX := GLGetProcAddress('glXQueryChannelRectSGIX');
  XQueryChannelDeltasSGIX := GLGetProcAddress('glXQueryChannelDeltasSGIX');
  XChannelRectSyncSGIX := GLGetProcAddress('glXChannelRectSyncSGIX');
  XJoinSwapGroupSGIX := GLGetProcAddress('glXJoinSwapGroupSGIX');
  XBindSwapBarrierSGIX := GLGetProcAddress('glXBindSwapBarrierSGIX');
  XQueryMaxSwapBarriersSGIX := GLGetProcAddress('glXQueryMaxSwapBarriersSGIX');
  XQueryHyperpipeNetworkSGIX := GLGetProcAddress('glXQueryHyperpipeNetworkSGIX');

  XHyperpipeConfigSGIX := GLGetProcAddress('glXHyperpipeConfigSGIX');
  XQueryHyperpipeConfigSGIX := GLGetProcAddress('glXQueryHyperpipeConfigSGIX');
  XDestroyHyperpipeConfigSGIX := GLGetProcAddress('glXDestroyHyperpipeConfigSGIX');
  XBindHyperpipeSGIX := GLGetProcAddress('glXBindHyperpipeSGIX');
  XQueryHyperpipeBestAttribSGIX := GLGetProcAddress('glXQueryHyperpipeBestAttribSGIX');
  XHyperpipeAttribSGIX := GLGetProcAddress('glXHyperpipeAttribSGIX');
  XQueryHyperpipeAttribSGIX := GLGetProcAddress('glXQueryHyperpipeAttribSGIX');
  XGetAGPOffsetMESA := GLGetProcAddress('glXGetAGPOffsetMESA');
  XEnumerateVideoDevicesNV := GLGetProcAddress('glXEnumerateVideoDevicesNV');
  XBindVideoDeviceNV := GLGetProcAddress('glXBindVideoDeviceNV');
  XGetVideoDeviceNV := GLGetProcAddress('glXGetVideoDeviceNV');
  XCopySubBufferMESA := GLGetProcAddress('glXCopySubBufferMESA');
  XReleaseBuffersMESA := GLGetProcAddress('glXReleaseBuffersMESA');
  XCreateGLXPixmapMESA := GLGetProcAddress('glXCreateGLXPixmapMESA');
  XSet3DfxModeMESA := GLGetProcAddress('glXSet3DfxModeMESA');

  XAllocateMemoryNV := GLGetProcAddress('glXAllocateMemoryNV');
  XFreeMemoryNV := GLGetProcAddress('glXFreeMemoryNV');

  XReleaseVideoDeviceNV := GLGetProcAddress('glXReleaseVideoDeviceNV');
  XBindVideoImageNV := GLGetProcAddress('glXBindVideoImageNV');
  XReleaseVideoImageNV := GLGetProcAddress('glXReleaseVideoImageNV');
  XSendPbufferToVideoNV := GLGetProcAddress('glXSendPbufferToVideoNV');
  XGetVideoInfoNV := GLGetProcAddress('glXGetVideoInfoNV');
  XJoinSwapGroupNV := GLGetProcAddress('glXJoinSwapGroupNV');
  XBindSwapBarrierNV := GLGetProcAddress('glXBindSwapBarrierNV');
  XQuerySwapGroupNV := GLGetProcAddress('glXQuerySwapGroupNV');
  XQueryMaxSwapGroupsNV := GLGetProcAddress('glXQueryMaxSwapGroupsNV');
  XQueryFrameCountNV := GLGetProcAddress('glXQueryFrameCountNV');
  XResetFrameCountNV := GLGetProcAddress('glXResetFrameCountNV');
  XBindVideoCaptureDeviceNV := GLGetProcAddress('glXBindVideoCaptureDeviceNV');
  XEnumerateVideoCaptureDevicesNV :=
    GLGetProcAddress('glXEnumerateVideoCaptureDevicesNV');
  XLockVideoCaptureDeviceNV := GLGetProcAddress('glxLockVideoCaptureDeviceNV');
  XQueryVideoCaptureDeviceNV := GLGetProcAddress('glXQueryVideoCaptureDeviceNV');
  XReleaseVideoCaptureDeviceNV := GLGetProcAddress('glXReleaseVideoCaptureDeviceNV');
  XSwapIntervalEXT := GLGetProcAddress('glXSwapIntervalEXT');
  XCopyImageSubDataNV := GLGetProcAddress('glXCopyImageSubDataNV');
end;

{$ENDIF}

{$IFDEF DARWIN}
procedure TGLExtensionsAndEntryPoints.ReadAGLExtensions;
begin
  // Managing pixel format object
  ACreatePixelFormat := AGLGetProcAddress('ACreatePixelFormat');
  AChoosePixelFormat := AGLGetProcAddress('aglChoosePixelFormat');
  ADestroyPixelFormat := AGLGetProcAddress('aglDestroyPixelFormat');
  ADescribePixelFormat := AGLGetProcAddress('ADescribePixelFormat');
  ADestroyPixelFormat := AGLGetProcAddress('ADestroyPixelFormat');
  AGetCGLPixelFormat := AGLGetProcAddress('AGetCGLPixelFormat');
  ADisplaysOfPixelFormat := AGLGetProcAddress('ADisplaysOfPixelFormat');
  ANextPixelFormat := AGLGetProcAddress('ANextPixelFormat');
  // Managing context
  ACreateContext := AGLGetProcAddress('aglCreateContext');
  ACopyContext := AGLGetProcAddress('ACopyContext');
  ADestroyContext := AGLGetProcAddress('aglDestroyContext');
  AUpdateContext := AGLGetProcAddress('aglUpdateContext');
  ASetCurrentContext := AGLGetProcAddress('aglSetCurrentContext');
  AGetCGLContext := AGLGetProcAddress('AGetCGLContext');
  AGetCurrentContext := AGLGetProcAddress('AGetCurrentContext');
  ASwapBuffers := AGLGetProcAddress('ASwapBuffers');
  AUpdateContext := AGLGetProcAddress('AUpdateContext');
  // Managing Pixel Buffers
  ACreatePBuffer := AGLGetProcAddress('aglCreatePBuffer');
  ADestroyPBuffer := AGLGetProcAddress('aglDestroyPBuffer');
  ADescribePBuffer := AGLGetProcAddress('aglDescribePBuffer');
  AGetPBuffer := AGLGetProcAddress('aglGetPBuffer');
  ASetPBuffer := AGLGetProcAddress('aglSetPBuffer');
  ATexImagePBuffer := AGLGetProcAddress('aglTexImagePBuffer');
  // Managing Drawable Objects
  ASetDrawable := AGLGetProcAddress('aglSetDrawable'); // deprecated
  AGetDrawable := AGLGetProcAddress('aglGetDrawable'); // deprecated
  ASetFullScreen := AGLGetProcAddress('aglSetFullScreen');
  ASetOffScreen := AGLGetProcAddress('aglSetOffScreen');
  // Getting and Setting Context Options
  AEnable := AGLGetProcAddress('aglEnable');
  ADisable := AGLGetProcAddress('aglDisable');
  AIsEnabled := AGLGetProcAddress('aglIsEnabled');
  ASetInteger := AGLGetProcAddress('aglSetInteger');
  AGetInteger := AGLGetProcAddress('aglGetInteger');
  // Getting and Setting Global Information
  AConfigure := AGLGetProcAddress('aglConfigure');
  AGetVersion := AGLGetProcAddress('aglGetVersion');
  AResetLibrary := AGLGetProcAddress('aglResetLibrary');
  // Getting Renderer Information
  ADescribeRenderer := AGLGetProcAddress('aglDescribeRenderer');
  ADestroyRendererInfo := AGLGetProcAddress('aglDestroyRendererInfo');
  ANextRendererInfo := AGLGetProcAddress('aglNextRendererInfo');
  AQueryRendererInfoForCGDirectDisplayIDs := AGLGetProcAddress('aglQueryRendererInfoForCGDirectDisplayIDs');
  // Managing Virtual Screens
  AGetVirtualScreen := AGLGetProcAddress('aglGetVirtualScreen');
  ASetVirtualScreen := AGLGetProcAddress('aglSetVirtualScreen');
  // Getting and Setting Windows
  ASetWindowRef := AGLGetProcAddress('aglSetWindowRef');
  AGetWindowRef := AGLGetProcAddress('aglGetWindowRef');
  // Getting and Setting HIView Objects
  ASetHIViewRef := AGLGetProcAddress('aglSetHIViewRef');
  AGetHIViewRef := AGLGetProcAddress('aglGetHIViewRef');
  // Getting Error Information
  AGetError := AGLGetProcAddress('aglGetError');
  AErrorString := AGLGetProcAddress('aglErrorString');
end;
{$ENDIF}

// TrimAndSplitVersionString
//
procedure TrimAndSplitVersionString(buffer: string; var max, min: integer);
// Peels out the X.Y form from the given Buffer which must contain a version string like "text Minor.Major.Build text"
// at least however "Major.Minor".
var
  Separator: integer;
begin
  try
    // There must be at least one dot to separate major and minor version number.
    Separator := Pos('.', buffer);
    // At least one number must be before and one after the dot.
    if (Separator > 1) and (Separator < length(buffer)) and
      (AnsiChar(buffer[Separator - 1]) in ['0' .. '9']) and
      (AnsiChar(buffer[Separator + 1]) in ['0' .. '9']) then
    begin
      // OK, it's a valid version string. Now remove unnecessary parts.
      Dec(Separator);
      // Find last non-numeric character before version number.
      while (Separator > 0) and (AnsiChar(buffer[Separator]) in ['0' .. '9']) do
        Dec(Separator);
      // Delete leading characters which do not belong to the version string.
      Delete(buffer, 1, Separator);
      Separator := Pos('.', buffer) + 1;
      // Find first non-numeric character after version number
      while (Separator <= length(buffer)) and
        (AnsiChar(buffer[Separator]) in ['0' .. '9']) do
        Inc(Separator);
      // delete trailing characters not belonging to the version string
      Delete(buffer, Separator, 255);
      // Now translate the numbers.
      Separator := Pos('.', buffer);
      // This is necessary because the buffer length might have changed.
      max := StrToInt(Copy(buffer, 1, Separator - 1));
      min := StrToInt(Copy(buffer, Separator + 1, 255));
    end
    else
      Abort;
  except
    min := 0;
    max := 0;
  end;
end;

function IsVersionMet(MajorVersion, MinorVersion, actualMajorVersion,
  actualMinorVersion: integer): boolean;
begin
  Result := (actualMajorVersion > MajorVersion) or
    ((actualMajorVersion = MajorVersion) and (actualMinorVersion >= MinorVersion));
end;

// InitOpenGL


function InitOpenGL: boolean;
begin
  if (GLHandle = INVALID_MODULEHANDLE) or (GLUHandle = INVALID_MODULEHANDLE) then
    Result := InitOpenGLFromLibrary(opengl32, glu32)
  else
    Result := True;
end;

// InitOpenGLFromLibrary


function InitOpenGLFromLibrary(const GLName, GLUName: string): boolean;
begin
  Result := False;
  CloseOpenGL;

  GLHandle := LoadLibrary(PChar(GLName));
  GLUHandle := LoadLibrary(PChar(GLUName));
{$IFDEF DARWIN}
  AGLHandle := LoadLibrary(PChar(libAGL));
{$ENDIF}

  if (GLHandle <> INVALID_MODULEHANDLE) and (GLUHandle <> INVALID_MODULEHANDLE) then
  begin
    Result := True;
  end
  else
    CloseOpenGL;
end;

// IsOpenGLInitialized


function IsOpenGLInitialized: boolean;
begin
  Result := (GLHandle <> INVALID_MODULEHANDLE);
end;

// CloseOpenGL


procedure CloseOpenGL;
begin
  if GLHandle <> INVALID_MODULEHANDLE then
  begin
    FreeLibrary(GLHandle);
    GLHandle := INVALID_MODULEHANDLE;
  end;

  if GLUHandle <> INVALID_MODULEHANDLE then
  begin
    FreeLibrary(GLUHandle);
    GLUHandle := INVALID_MODULEHANDLE;
  end;

  {$IFDEF DARWIN}
  if AGLHandle <> INVALID_MODULEHANDLE then
  begin
    FreeLibrary(AGLHandle);
    AGLHandle := INVALID_MODULEHANDLE;
  end;
  {$ENDIF}
end;

// UnloadOpenGL


procedure UnloadOpenGL;
begin
  CloseOpenGL;
end;

// LoadOpenGL


function LoadOpenGL: boolean;
begin
  Result := InitOpenGL;
end;

// LoadOpenGLFromLibrary


function LoadOpenGLFromLibrary(GLName, GLUName: string): boolean;
begin
  Result := InitOpenGLFromLibrary(GLName, GLUName);
end;

// IsOpenGLLoaded


function IsOpenGLLoaded: boolean;
begin
  Result := IsOpenGLInitialized();
end;

// IsMesaGL


function IsMesaGL: boolean;
begin
  Result := GLGetProcAddress('glResizeBuffersMESA') <> nil;
end;

initialization

{$IFDEF FPC}
  { according to bug 7570, this is necessary on all x86 platforms,
    maybe we've to fix the sse control word as well }
  { Yes, at least for darwin/x86_64 (JM) }
  {$IF DEFINED(cpui386) or DEFINED(cpux86_64)}
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide,
    exOverflow, exUnderflow, exPrecision]);
  {$IFEND}
{$ELSE}
  Set8087CW($133F);
{$ENDIF}

finalization

  CloseOpenGL;

end.

