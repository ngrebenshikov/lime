package lime._backend.native;


import lime.graphics.opengl.GLBuffer;
import lime.graphics.opengl.GLFramebuffer;
import lime.graphics.opengl.GLProgram;
import lime.graphics.opengl.GLRenderbuffer;
import lime.graphics.opengl.GLShader;
import lime.graphics.opengl.GLTexture;
import lime.graphics.Image;
import lime.graphics.ImageBuffer;
import lime.math.Rectangle;
import lime.media.openal.ALAuxiliaryEffectSlot;
import lime.system.CFFIPointer;
import lime.utils.DataPointer;

#if hl
import lime._backend.native.NativeApplication;
import lime.graphics.cairo.CairoGlyph;
import lime.math.Matrix3;
import lime.math.Vector2;
import lime.media.openal.ALContext;
import lime.media.openal.ALDevice;
#end

#if cpp
import cpp.Float32;
#else
typedef Float32 = Float;
#end

// #if hl
// typedef TNative_Application = hl.Abstract<"Application">;
// #end

#if !lime_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end

#if !macro
@:build(lime.system.CFFI.build())
#end


class NativeCFFI {
	
	
	#if (lime_cffi && !macro && !hl)
	@:cffi private static function lime_application_create ():Dynamic;
	@:cffi private static function lime_application_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_application_exec (handle:Dynamic):Int;
	@:cffi private static function lime_application_init (handle:Dynamic):Void;
	@:cffi private static function lime_application_quit (handle:Dynamic):Int;
	@:cffi private static function lime_application_set_frame_rate (handle:Dynamic, value:Float):Void;
	@:cffi private static function lime_application_update (handle:Dynamic):Bool;
	@:cffi private static function lime_audio_load (data:Dynamic, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_bytes_from_data_pointer (data:Float, length:Int):Dynamic;
	@:cffi private static function lime_bytes_get_data_pointer (data:Dynamic):Float;
	@:cffi private static function lime_bytes_get_data_pointer_offset (data:Dynamic, offset:Int):Float;
	@:cffi private static function lime_bytes_read_file (path:String, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_cffi_get_native_pointer (ptr:Dynamic):Float;
	@:cffi private static function lime_clipboard_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_clipboard_get_text ():Dynamic;
	@:cffi private static function lime_clipboard_set_text (text:String):Void;
	@:cffi private static function lime_data_pointer_offset (dataPointer:DataPointer, offset:Int):Float;
	@:cffi private static function lime_deflate_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_deflate_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_drop_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_file_dialog_open_directory (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_dialog_open_file (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_dialog_open_files (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_dialog_save_file (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_watcher_create (callback:Dynamic):CFFIPointer;
	@:cffi private static function lime_file_watcher_add_directory (handle:CFFIPointer, path:Dynamic, recursive:Bool):Dynamic;
	@:cffi private static function lime_file_watcher_remove_directory (handle:CFFIPointer, watchID:Dynamic):Void;
	@:cffi private static function lime_file_watcher_update (handle:CFFIPointer):Void;
	@:cffi private static function lime_font_get_ascender (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_descender (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_family_name (handle:Dynamic):Dynamic;
	@:cffi private static function lime_font_get_glyph_index (handle:Dynamic, character:String):Int;
	@:cffi private static function lime_font_get_glyph_indices (handle:Dynamic, characters:String):Dynamic;
	@:cffi private static function lime_font_get_glyph_metrics (handle:Dynamic, index:Int):Dynamic;
	@:cffi private static function lime_font_get_height (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_num_glyphs (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_underline_position (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_underline_thickness (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_units_per_em (handle:Dynamic):Int;
	@:cffi private static function lime_font_load (data:Dynamic):Dynamic;
	@:cffi private static function lime_font_outline_decompose (handle:Dynamic, size:Int):Dynamic;
	@:cffi private static function lime_font_render_glyph (handle:Dynamic, index:Int, data:Dynamic):Bool;
	@:cffi private static function lime_font_render_glyphs (handle:Dynamic, indices:Dynamic, data:Dynamic):Bool;
	@:cffi private static function lime_font_set_size (handle:Dynamic, size:Int):Void;
	@:cffi private static function lime_gamepad_add_mappings (mappings:Dynamic):Void;
	@:cffi private static function lime_gamepad_get_device_guid (id:Int):Dynamic;
	@:cffi private static function lime_gamepad_get_device_name (id:Int):Dynamic;
	@:cffi private static function lime_gamepad_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_gzip_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_gzip_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_haptic_vibrate (period:Int, duration:Int):Void;
	@:cffi private static function lime_image_encode (data:Dynamic, type:Int, quality:Int, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_image_load (data:Dynamic, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_image_data_util_color_transform (image:Dynamic, rect:Dynamic, colorMatrix:Dynamic):Void;
	@:cffi private static function lime_image_data_util_copy_channel (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, srcChannel:Int, destChannel:Int):Void;
	@:cffi private static function lime_image_data_util_copy_pixels (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, alphaImage:Dynamic, alphaPoint:Dynamic, mergeAlpha:Bool):Void;
	@:cffi private static function lime_image_data_util_fill_rect (image:Dynamic, rect:Dynamic, rg:Int, ba:Int):Void;
	@:cffi private static function lime_image_data_util_flood_fill (image:Dynamic, x:Int, y:Int, rg:Int, ba:Int):Void;
	@:cffi private static function lime_image_data_util_get_pixels (image:Dynamic, rect:Dynamic, format:Int, bytes:Dynamic):Void;
	@:cffi private static function lime_image_data_util_merge (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, redMultiplier:Int, greenMultiplier:Int, blueMultiplier:Int, alphaMultiplier:Int):Void;
	@:cffi private static function lime_image_data_util_multiply_alpha (image:Dynamic):Void;
	@:cffi private static function lime_image_data_util_resize (image:Dynamic, buffer:Dynamic, width:Int, height:Int):Void;
	@:cffi private static function lime_image_data_util_set_format (image:Dynamic, format:Int):Void;
	@:cffi private static function lime_image_data_util_set_pixels (image:Dynamic, rect:Dynamic, bytes:Dynamic, offset:Int, format:Int, endian:Int):Void;
	@:cffi private static function lime_image_data_util_threshold (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, operation:Int, thresholdRG:Int, thresholdBA:Int, colorRG:Int, colorBA:Int, maskRG:Int, maskBA:Int, copySource:Bool):Int;
	@:cffi private static function lime_image_data_util_unmultiply_alpha (image:Dynamic):Void;
	@:cffi private static function lime_joystick_get_device_guid (id:Int):Dynamic;
	@:cffi private static function lime_joystick_get_device_name (id:Int):Dynamic;
	@:cffi private static function lime_joystick_get_num_axes (id:Int):Int;
	@:cffi private static function lime_joystick_get_num_buttons (id:Int):Int;
	@:cffi private static function lime_joystick_get_num_hats (id:Int):Int;
	@:cffi private static function lime_joystick_get_num_trackballs (id:Int):Int;
	@:cffi private static function lime_joystick_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_jpeg_decode_bytes (data:Dynamic, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_jpeg_decode_file (path:String, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_key_code_from_scan_code (scanCode:Float32):Float32;
	@:cffi private static function lime_key_code_to_scan_code (keyCode:Float32):Float32;
	@:cffi private static function lime_key_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_lzma_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_lzma_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_mouse_hide ():Void;
	@:cffi private static function lime_mouse_set_cursor (cursor:Int):Void;
	@:cffi private static function lime_mouse_set_lock (lock:Bool):Void;
	@:cffi private static function lime_mouse_show ():Void;
	@:cffi private static function lime_mouse_warp (x:Int, y:Int, window:Dynamic):Void;
	@:cffi private static function lime_mouse_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_neko_execute (module:String):Void;
	@:cffi private static function lime_png_decode_bytes (data:Dynamic, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_png_decode_file (path:String, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_renderer_create (window:Dynamic):Dynamic;
	@:cffi private static function lime_renderer_flip (handle:Dynamic):Void;
	@:cffi private static function lime_renderer_get_context (handle:Dynamic):Float;
	@:cffi private static function lime_renderer_get_scale (handle:Dynamic):Float;
	@:cffi private static function lime_renderer_get_type (handle:Dynamic):Dynamic;
	@:cffi private static function lime_renderer_lock (handle:Dynamic):Dynamic;
	@:cffi private static function lime_renderer_make_current (handle:Dynamic):Void;
	@:cffi private static function lime_renderer_read_pixels (handle:Dynamic, rect:Dynamic, imageBuffer:Dynamic):Dynamic;
	@:cffi private static function lime_renderer_unlock (handle:Dynamic):Void;
	@:cffi private static function lime_render_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_sensor_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_system_get_allow_screen_timeout ():Bool;
	@:cffi private static function lime_system_set_allow_screen_timeout (value:Bool):Bool;
	@:cffi private static function lime_system_get_device_model ():Dynamic;
	@:cffi private static function lime_system_get_device_vendor ():Dynamic;
	@:cffi private static function lime_system_get_directory (type:Int, company:String, title:String):Dynamic;
	@:cffi private static function lime_system_get_display (index:Int):Dynamic;
	@:cffi private static function lime_system_get_ios_tablet ():Bool;
	@:cffi private static function lime_system_get_num_displays ():Int;
	@:cffi private static function lime_system_get_platform_label ():Dynamic;
	@:cffi private static function lime_system_get_platform_name ():Dynamic;
	@:cffi private static function lime_system_get_platform_version ():Dynamic;
	@:cffi private static function lime_system_get_timer ():Float;
	@:cffi private static function lime_system_open_file (path:String):Void;
	@:cffi private static function lime_system_open_url (url:String, target:String):Void;
	@:cffi private static function lime_text_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_text_layout_create (direction:Int, script:String, language:String):Dynamic;
	@:cffi private static function lime_text_layout_position (textHandle:Dynamic, fontHandle:Dynamic, size:Int, textString:String, data:Dynamic):Dynamic;
	@:cffi private static function lime_text_layout_set_direction (textHandle:Dynamic, direction:Int):Void;
	@:cffi private static function lime_text_layout_set_language (textHandle:Dynamic, language:String):Void;
	@:cffi private static function lime_text_layout_set_script (textHandle:Dynamic, script:String):Void;
	@:cffi private static function lime_touch_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_window_alert (handle:Dynamic, message:String, title:String):Void;
	@:cffi private static function lime_window_close (handle:Dynamic):Void;
	@:cffi private static function lime_window_create (application:Dynamic, width:Int, height:Int, flags:Int, title:String):Dynamic;
	@:cffi private static function lime_window_focus (handle:Dynamic):Void;
	@:cffi private static function lime_window_get_display (handle:Dynamic):Int;
	@:cffi private static function lime_window_get_display_mode (handle:Dynamic):Dynamic;
	@:cffi private static function lime_window_get_enable_text_events (handle:Dynamic):Bool;
	@:cffi private static function lime_window_get_height (handle:Dynamic):Int;
	@:cffi private static function lime_window_get_id (handle:Dynamic):Int;
	@:cffi private static function lime_window_get_width (handle:Dynamic):Int;
	@:cffi private static function lime_window_get_x (handle:Dynamic):Int;
	@:cffi private static function lime_window_get_y (handle:Dynamic):Int;
	@:cffi private static function lime_window_move (handle:Dynamic, x:Int, y:Int):Void;
	@:cffi private static function lime_window_resize (handle:Dynamic, width:Int, height:Int):Void;
	@:cffi private static function lime_window_set_borderless (handle:Dynamic, borderless:Bool):Bool;
	@:cffi private static function lime_window_set_display_mode (handle:Dynamic, displayMode:Dynamic):Dynamic;
	@:cffi private static function lime_window_set_enable_text_events (handle:Dynamic, enabled:Bool):Void;
	@:cffi private static function lime_window_set_fullscreen (handle:Dynamic, fullscreen:Bool):Bool;
	@:cffi private static function lime_window_set_icon (handle:Dynamic, buffer:Dynamic):Void;
	@:cffi private static function lime_window_set_maximized (handle:Dynamic, maximized:Bool):Bool;
	@:cffi private static function lime_window_set_minimized (handle:Dynamic, minimized:Bool):Bool;
	@:cffi private static function lime_window_set_resizable (handle:Dynamic, resizable:Bool):Bool;
	@:cffi private static function lime_window_set_title (handle:Dynamic, title:String):Dynamic;
	@:cffi private static function lime_window_event_manager_register (callback:Dynamic, eventObject:Dynamic):Void;
	@:cffi private static function lime_zlib_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_zlib_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	#end
	
	#if hl
	@:hlNative("lime", "lime_application_create") private static function lime_application_create ():CFFIPointer { return null; }
	@:hlNative("lime", "lime_application_event_manager_register") private static function lime_application_event_manager_register (callback:Void->Void, eventObject:ApplicationEventInfo):Void {}
	@:hlNative("lime", "lime_application_exec") private static function lime_application_exec (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_application_init") private static function lime_application_init (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_application_quit") private static function lime_application_quit (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_application_set_frame_rate") private static function lime_application_set_frame_rate (handle:CFFIPointer, value:Float):Void {}
	@:hlNative("lime", "lime_application_update") private static function lime_application_update (handle:CFFIPointer):Bool { return false; }
	@:cffi private static function lime_audio_load (data:Dynamic, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_bytes_from_data_pointer (data:Float, length:Int):Dynamic;
	@:hlNative("lime", "lime_bytes_get_data_pointer") private static function lime_bytes_get_data_pointer (data:hl.Bytes):Float { return 0; }
	@:cffi private static function lime_bytes_get_data_pointer_offset (data:Dynamic, offset:Int):Float;
	@:cffi private static function lime_bytes_read_file (path:String, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_cffi_get_native_pointer (ptr:Dynamic):Float;
	@:hlNative("lime", "lime_clipboard_event_manager_register") private static function lime_clipboard_event_manager_register (callback:Void->Void, eventObject:ClipboardEventInfo):Void {}
	@:cffi private static function lime_clipboard_get_text ():Dynamic;
	@:cffi private static function lime_clipboard_set_text (text:String):Void;
	@:cffi private static function lime_data_pointer_offset (dataPointer:DataPointer, offset:Int):Float;
	@:cffi private static function lime_deflate_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_deflate_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:hlNative("lime", "lime_drop_event_manager_register") private static function lime_drop_event_manager_register (callback:Void->Void, eventObject:DropEventInfo):Void {}
	@:cffi private static function lime_file_dialog_open_directory (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_dialog_open_file (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_dialog_open_files (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_dialog_save_file (title:String, filter:String, defaultPath:String):Dynamic;
	@:cffi private static function lime_file_watcher_create (callback:Dynamic):CFFIPointer;
	@:cffi private static function lime_file_watcher_add_directory (handle:CFFIPointer, path:Dynamic, recursive:Bool):Dynamic;
	@:cffi private static function lime_file_watcher_remove_directory (handle:CFFIPointer, watchID:Dynamic):Void;
	@:cffi private static function lime_file_watcher_update (handle:CFFIPointer):Void;
	@:cffi private static function lime_font_get_ascender (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_descender (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_family_name (handle:Dynamic):Dynamic;
	@:cffi private static function lime_font_get_glyph_index (handle:Dynamic, character:String):Int;
	@:cffi private static function lime_font_get_glyph_indices (handle:Dynamic, characters:String):Dynamic;
	@:cffi private static function lime_font_get_glyph_metrics (handle:Dynamic, index:Int):Dynamic;
	@:cffi private static function lime_font_get_height (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_num_glyphs (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_underline_position (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_underline_thickness (handle:Dynamic):Int;
	@:cffi private static function lime_font_get_units_per_em (handle:Dynamic):Int;
	@:cffi private static function lime_font_load (data:Dynamic):Dynamic;
	@:cffi private static function lime_font_outline_decompose (handle:Dynamic, size:Int):Dynamic;
	@:cffi private static function lime_font_render_glyph (handle:Dynamic, index:Int, data:Dynamic):Bool;
	@:cffi private static function lime_font_render_glyphs (handle:Dynamic, indices:Dynamic, data:Dynamic):Bool;
	@:cffi private static function lime_font_set_size (handle:Dynamic, size:Int):Void;
	@:cffi private static function lime_gamepad_add_mappings (mappings:Dynamic):Void;
	@:cffi private static function lime_gamepad_get_device_guid (id:Int):Dynamic;
	@:cffi private static function lime_gamepad_get_device_name (id:Int):Dynamic;
	@:hlNative("lime", "lime_gamepad_event_manager_register") private static function lime_gamepad_event_manager_register (callback:Void->Void, eventObject:GamepadEventInfo):Void {}
	@:cffi private static function lime_gzip_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_gzip_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_haptic_vibrate (period:Int, duration:Int):Void;
	@:cffi private static function lime_image_encode (data:Dynamic, type:Int, quality:Int, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_image_load (data:Dynamic, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_image_data_util_color_transform (image:Dynamic, rect:Dynamic, colorMatrix:Dynamic):Void;
	@:cffi private static function lime_image_data_util_copy_channel (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, srcChannel:Int, destChannel:Int):Void;
	@:cffi private static function lime_image_data_util_copy_pixels (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, alphaImage:Dynamic, alphaPoint:Dynamic, mergeAlpha:Bool):Void;
	@:hlNative("lime", "lime_image_data_util_fill_rect") private static function lime_image_data_util_fill_rect (image:Image, rect:Rectangle, rg:Int, ba:Int):Void {}
	@:cffi private static function lime_image_data_util_flood_fill (image:Dynamic, x:Int, y:Int, rg:Int, ba:Int):Void;
	@:cffi private static function lime_image_data_util_get_pixels (image:Dynamic, rect:Dynamic, format:Int, bytes:Dynamic):Void;
	@:cffi private static function lime_image_data_util_merge (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, redMultiplier:Int, greenMultiplier:Int, blueMultiplier:Int, alphaMultiplier:Int):Void;
	@:cffi private static function lime_image_data_util_multiply_alpha (image:Dynamic):Void;
	@:cffi private static function lime_image_data_util_resize (image:Dynamic, buffer:Dynamic, width:Int, height:Int):Void;
	@:cffi private static function lime_image_data_util_set_format (image:Dynamic, format:Int):Void;
	@:cffi private static function lime_image_data_util_set_pixels (image:Dynamic, rect:Dynamic, bytes:Dynamic, offset:Int, format:Int, endian:Int):Void;
	@:cffi private static function lime_image_data_util_threshold (image:Dynamic, sourceImage:Dynamic, sourceRect:Dynamic, destPoint:Dynamic, operation:Int, thresholdRG:Int, thresholdBA:Int, colorRG:Int, colorBA:Int, maskRG:Int, maskBA:Int, copySource:Bool):Int;
	@:cffi private static function lime_image_data_util_unmultiply_alpha (image:Dynamic):Void;
	@:cffi private static function lime_joystick_get_device_guid (id:Int):Dynamic;
	@:cffi private static function lime_joystick_get_device_name (id:Int):Dynamic;
	@:cffi private static function lime_joystick_get_num_axes (id:Int):Int;
	@:cffi private static function lime_joystick_get_num_buttons (id:Int):Int;
	@:cffi private static function lime_joystick_get_num_hats (id:Int):Int;
	@:cffi private static function lime_joystick_get_num_trackballs (id:Int):Int;
	@:hlNative("lime", "lime_joystick_event_manager_register") private static function lime_joystick_event_manager_register (callback:Void->Void, eventObject:JoystickEventInfo):Void {}
	@:cffi private static function lime_jpeg_decode_bytes (data:Dynamic, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_jpeg_decode_file (path:String, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_key_code_from_scan_code (scanCode:Float32):Float32;
	@:cffi private static function lime_key_code_to_scan_code (keyCode:Float32):Float32;
	@:hlNative("lime", "lime_key_event_manager_register") private static function lime_key_event_manager_register (callback:Void->Void, eventObject:KeyEventInfo):Void {}
	@:cffi private static function lime_lzma_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_lzma_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_mouse_hide ():Void;
	@:cffi private static function lime_mouse_set_cursor (cursor:Int):Void;
	@:cffi private static function lime_mouse_set_lock (lock:Bool):Void;
	@:cffi private static function lime_mouse_show ():Void;
	@:cffi private static function lime_mouse_warp (x:Int, y:Int, window:Dynamic):Void;
	@:hlNative("lime", "lime_mouse_event_manager_register") private static function lime_mouse_event_manager_register (callback:Void->Void, eventObject:MouseEventInfo):Void {}
	@:cffi private static function lime_neko_execute (module:String):Void;
	@:cffi private static function lime_png_decode_bytes (data:Dynamic, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:cffi private static function lime_png_decode_file (path:String, decodeData:Bool, buffer:Dynamic):Dynamic;
	@:hlNative("lime", "lime_renderer_create") private static function lime_renderer_create (window:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_renderer_flip") private static function lime_renderer_flip (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_renderer_get_context") private static function lime_renderer_get_context (handle:CFFIPointer):Float { return 0; }
	@:hlNative("lime", "lime_renderer_get_scale") private static function lime_renderer_get_scale (handle:CFFIPointer):Float { return 0; }
	@:hlNative("lime", "lime_renderer_get_type") private static function lime_renderer_get_type (handle:CFFIPointer):hl.Bytes { return null; }
	@:hlNative("lime", "lime_renderer_lock") private static function lime_renderer_lock (handle:CFFIPointer):Dynamic { return null; }
	@:hlNative("lime", "lime_renderer_make_current") private static function lime_renderer_make_current (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_renderer_read_pixels") private static function lime_renderer_read_pixels (handle:CFFIPointer, rect:Rectangle, imageBuffer:ImageBuffer):Dynamic { return null; }
	@:hlNative("lime", "lime_renderer_unlock") private static function lime_renderer_unlock (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_render_event_manager_register") private static function lime_render_event_manager_register (callback:Void->Void, eventObject:RenderEventInfo):Void {}
	@:hlNative("lime", "lime_sensor_event_manager_register") private static function lime_sensor_event_manager_register (callback:Void->Void, eventObject:SensorEventInfo):Void {}
	@:cffi private static function lime_system_get_allow_screen_timeout ():Bool;
	@:cffi private static function lime_system_set_allow_screen_timeout (value:Bool):Bool;
	@:cffi private static function lime_system_get_device_model ():Dynamic;
	@:cffi private static function lime_system_get_device_vendor ():Dynamic;
	@:cffi private static function lime_system_get_directory (type:Int, company:String, title:String):Dynamic;
	@:cffi private static function lime_system_get_display (index:Int):Dynamic;
	@:cffi private static function lime_system_get_ios_tablet ():Bool;
	@:cffi private static function lime_system_get_num_displays ():Int;
	@:cffi private static function lime_system_get_platform_label ():Dynamic;
	@:cffi private static function lime_system_get_platform_name ():Dynamic;
	@:cffi private static function lime_system_get_platform_version ():Dynamic;
	@:hlNative("lime", "lime_system_get_timer") private static function lime_system_get_timer ():Float { return 0; }
	@:cffi private static function lime_system_open_file (path:String):Void;
	@:cffi private static function lime_system_open_url (url:String, target:String):Void;
	@:hlNative("lime", "lime_text_event_manager_register") private static function lime_text_event_manager_register (callback:Void->Void, eventObject:TextEventInfo):Void {}
	@:cffi private static function lime_text_layout_create (direction:Int, script:String, language:String):Dynamic;
	@:cffi private static function lime_text_layout_position (textHandle:Dynamic, fontHandle:Dynamic, size:Int, textString:String, data:Dynamic):Dynamic;
	@:cffi private static function lime_text_layout_set_direction (textHandle:Dynamic, direction:Int):Void;
	@:cffi private static function lime_text_layout_set_language (textHandle:Dynamic, language:String):Void;
	@:cffi private static function lime_text_layout_set_script (textHandle:Dynamic, script:String):Void;
	@:hlNative("lime", "lime_touch_event_manager_register") private static function lime_touch_event_manager_register (callback:Void->Void, eventObject:TouchEventInfo):Void {}
	@:cffi private static function lime_window_alert (handle:Dynamic, message:String, title:String):Void;
	@:cffi private static function lime_window_close (handle:Dynamic):Void;
	@:hlNative("lime", "lime_window_create") private static function lime_window_create (application:CFFIPointer, width:Int, height:Int, flags:Int, title:String):CFFIPointer { return null; }
	@:cffi private static function lime_window_focus (handle:Dynamic):Void;
	@:hlNative("lime", "lime_window_get_display") private static function lime_window_get_display (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_window_get_display_mode") private static function lime_window_get_display_mode (handle:CFFIPointer):Dynamic { return null; }
	@:hlNative("lime", "lime_window_get_enable_text_events") private static function lime_window_get_enable_text_events (handle:CFFIPointer):Bool { return false; }
	@:hlNative("lime", "lime_window_get_height") private static function lime_window_get_height (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_window_get_id") private static function lime_window_get_id (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_window_get_width") private static function lime_window_get_width (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_window_get_x") private static function lime_window_get_x (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_window_get_y") private static function lime_window_get_y (handle:CFFIPointer):Int { return 0; }
	@:cffi private static function lime_window_move (handle:Dynamic, x:Int, y:Int):Void;
	@:cffi private static function lime_window_resize (handle:Dynamic, width:Int, height:Int):Void;
	@:cffi private static function lime_window_set_borderless (handle:Dynamic, borderless:Bool):Bool;
	@:cffi private static function lime_window_set_display_mode (handle:Dynamic, displayMode:Dynamic):Dynamic;
	@:cffi private static function lime_window_set_enable_text_events (handle:Dynamic, enabled:Bool):Void;
	@:cffi private static function lime_window_set_fullscreen (handle:Dynamic, fullscreen:Bool):Bool;
	@:cffi private static function lime_window_set_icon (handle:Dynamic, buffer:Dynamic):Void;
	@:cffi private static function lime_window_set_maximized (handle:Dynamic, maximized:Bool):Bool;
	@:cffi private static function lime_window_set_minimized (handle:Dynamic, minimized:Bool):Bool;
	@:cffi private static function lime_window_set_resizable (handle:Dynamic, resizable:Bool):Bool;
	@:hlNative("lime", "lime_window_set_title") private static function lime_window_set_title (handle:CFFIPointer, title:String):String { return null; }
	@:hlNative("lime", "lime_window_event_manager_register") private static function lime_window_event_manager_register (callback:Void->Void, eventObject:WindowEventInfo):Void {}
	@:cffi private static function lime_zlib_compress (data:Dynamic, bytes:Dynamic):Dynamic;
	@:cffi private static function lime_zlib_decompress (data:Dynamic, bytes:Dynamic):Dynamic;
	#end
	
	#if (lime_cffi && !macro && android)
	@:cffi private static function lime_jni_call_member (jniMethod:Dynamic, jniObject:Dynamic, args:Dynamic):Dynamic;
	@:cffi private static function lime_jni_call_static (jniMethod:Dynamic, args:Dynamic):Dynamic;
	@:cffi private static function lime_jni_create_field (className:String, field:String, signature:String, isStatic:Bool):Dynamic;
	@:cffi private static function lime_jni_create_method (className:String, method:String, signature:String, isStatic:Bool, quiet:Bool):Dynamic;
	@:cffi private static function lime_jni_get_env ():Float;
	@:cffi private static function lime_jni_get_member (jniField:Dynamic, jniObject:Dynamic):Dynamic;
	@:cffi private static function lime_jni_get_static (jniField:Dynamic):Dynamic;
	@:cffi private static function lime_jni_post_ui_callback (callback:Dynamic):Void;
	@:cffi private static function lime_jni_set_member (jniField:Dynamic, jniObject:Dynamic, value:Dynamic):Void;
	@:cffi private static function lime_jni_set_static (jniField:Dynamic, value:Dynamic):Void;
	#end
	
	#if (lime_cffi && !macro && lime_openal)
	#if !hl
	@:cffi private static function lime_al_buffer_data (buffer:CFFIPointer, format:Int, data:Dynamic, size:Int, freq:Int):Void;
	@:cffi private static function lime_al_buffer3f (buffer:CFFIPointer, param:Int, value1:Float32, value2:Float32, value3:Float32):Void;
	@:cffi private static function lime_al_buffer3i (buffer:CFFIPointer, param:Int, value1:Int, value2:Int, value3:Int):Void;
	@:cffi private static function lime_al_bufferf (buffer:CFFIPointer, param:Int, value:Float32):Void;
	@:cffi private static function lime_al_bufferfv (buffer:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_bufferi (buffer:CFFIPointer, param:Int, value:Int):Void;
	@:cffi private static function lime_al_bufferiv (buffer:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_cleanup ():Void;
	@:cffi private static function lime_al_delete_buffer (buffer:CFFIPointer):Void;
	@:cffi private static function lime_al_delete_buffers (n:Int, buffers:Dynamic):Void;
	@:cffi private static function lime_al_delete_source (source:CFFIPointer):Void;
	@:cffi private static function lime_al_delete_sources (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_disable (capability:Int):Void;
	@:cffi private static function lime_al_distance_model (distanceModel:Int):Void;
	@:cffi private static function lime_al_doppler_factor (value:Float32):Void;
	@:cffi private static function lime_al_doppler_velocity (value:Float32):Void;
	@:cffi private static function lime_al_enable (capability:Int):Void;
	@:cffi private static function lime_al_gen_source ():CFFIPointer;
	@:cffi private static function lime_al_gen_sources (n:Int):Array<CFFIPointer>;
	@:cffi private static function lime_al_get_boolean (param:Int):Bool;
	@:cffi private static function lime_al_get_booleanv (param:Int, count:Int):Array<Bool>;
	@:cffi private static function lime_al_gen_buffer ():CFFIPointer;
	@:cffi private static function lime_al_gen_buffers (n:Int):Array<CFFIPointer>;
	@:cffi private static function lime_al_get_buffer3f (buffer:CFFIPointer, param:Int):Array<Float>;
	@:cffi private static function lime_al_get_buffer3i (buffer:CFFIPointer, param:Int):Array<Int>;
	@:cffi private static function lime_al_get_bufferf (buffer:CFFIPointer, param:Int):Float32;
	@:cffi private static function lime_al_get_bufferfv (buffer:CFFIPointer, param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_bufferi (buffer:CFFIPointer, param:Int):Int;
	@:cffi private static function lime_al_get_bufferiv (buffer:CFFIPointer, param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_double (param:Int):Float;
	@:cffi private static function lime_al_get_doublev (param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_enum_value (ename:String):Int;
	@:cffi private static function lime_al_get_error ():Int;
	@:cffi private static function lime_al_get_float (param:Int):Float32;
	@:cffi private static function lime_al_get_floatv (param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_integer (param:Int):Int;
	@:cffi private static function lime_al_get_integerv (param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_listener3f (param:Int):Array<Float>;
	@:cffi private static function lime_al_get_listener3i (param:Int):Array<Int>;
	@:cffi private static function lime_al_get_listenerf (param:Int):Float32;
	@:cffi private static function lime_al_get_listenerfv (param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_listeneri (param:Int):Int;
	@:cffi private static function lime_al_get_listeneriv (param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_proc_address (fname:String):Float;
	@:cffi private static function lime_al_get_source3f (source:CFFIPointer, param:Int):Array<Float>;
	@:cffi private static function lime_al_get_source3i (source:CFFIPointer, param:Int):Array<Int>;
	@:cffi private static function lime_al_get_sourcef (source:CFFIPointer, param:Int):Float32;
	@:cffi private static function lime_al_get_sourcefv (source:CFFIPointer, param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_sourcei (source:CFFIPointer, param:Int):Dynamic;
	@:cffi private static function lime_al_get_sourceiv (source:CFFIPointer, param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_string (param:Int):Dynamic;
	@:cffi private static function lime_al_is_buffer (buffer:CFFIPointer):Bool;
	@:cffi private static function lime_al_is_enabled (capability:Int):Bool;
	@:cffi private static function lime_al_is_extension_present (extname:String):Bool;
	@:cffi private static function lime_al_is_source (source:CFFIPointer):Bool;
	@:cffi private static function lime_al_listener3f (param:Int, value1:Float32, value2:Float32, value3:Float32):Void;
	@:cffi private static function lime_al_listener3i (param:Int, value1:Int, value2:Int, value3:Int):Void;
	@:cffi private static function lime_al_listenerf (param:Int, value1:Float32):Void;
	@:cffi private static function lime_al_listenerfv (param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_listeneri (param:Int, value1:Int):Void;
	@:cffi private static function lime_al_listeneriv (param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_source_pause (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_pausev (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_play (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_playv (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_queue_buffers (source:CFFIPointer, nb:Int, buffers:Dynamic):Void;
	@:cffi private static function lime_al_source_rewind (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_rewindv (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_stop (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_stopv (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_unqueue_buffers (source:CFFIPointer, nb:Int):Dynamic;
	@:cffi private static function lime_al_source3f (source:CFFIPointer, param:Int, value1:Float32, value2:Float32, value3:Float32):Void;
	@:cffi private static function lime_al_source3i (source:CFFIPointer, param:Int, value1:Dynamic, value2:Int, value3:Int):Void;
	@:cffi private static function lime_al_sourcef (source:CFFIPointer, param:Int, value:Float32):Void;
	@:cffi private static function lime_al_sourcefv (source:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_sourcei (source:CFFIPointer, param:Int, value:Dynamic):Void;
	@:cffi private static function lime_al_sourceiv (source:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_speed_of_sound (speed:Float32):Void;
	@:cffi private static function lime_alc_close_device (device:CFFIPointer):Bool;
	@:cffi private static function lime_alc_create_context (device:CFFIPointer, attrlist:Dynamic):CFFIPointer;
	@:cffi private static function lime_alc_destroy_context (context:CFFIPointer):Void;
	@:cffi private static function lime_alc_get_contexts_device (context:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_alc_get_current_context ():CFFIPointer;
	@:cffi private static function lime_alc_get_error (device:CFFIPointer):Int;
	@:cffi private static function lime_alc_get_integerv (device:CFFIPointer, param:Int, size:Int):Dynamic;
	@:cffi private static function lime_alc_get_string (device:CFFIPointer, param:Int):Dynamic;
	@:cffi private static function lime_alc_make_context_current (context:CFFIPointer):Bool;
	@:cffi private static function lime_alc_open_device (devicename:String):CFFIPointer;
	@:cffi private static function lime_alc_pause_device (device:CFFIPointer):Void;
	@:cffi private static function lime_alc_process_context (context:CFFIPointer):Void;
	@:cffi private static function lime_alc_resume_device (device:CFFIPointer):Void;
	@:cffi private static function lime_alc_suspend_context (context:CFFIPointer):Void;
	#end
	
	#if hl
	@:cffi private static function lime_al_buffer_data (buffer:CFFIPointer, format:Int, data:Dynamic, size:Int, freq:Int):Void;
	@:cffi private static function lime_al_buffer3f (buffer:CFFIPointer, param:Int, value1:Float32, value2:Float32, value3:Float32):Void;
	@:cffi private static function lime_al_buffer3i (buffer:CFFIPointer, param:Int, value1:Int, value2:Int, value3:Int):Void;
	@:cffi private static function lime_al_bufferf (buffer:CFFIPointer, param:Int, value:Float32):Void;
	@:cffi private static function lime_al_bufferfv (buffer:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_bufferi (buffer:CFFIPointer, param:Int, value:Int):Void;
	@:cffi private static function lime_al_bufferiv (buffer:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_cleanup ():Void;
	@:cffi private static function lime_al_delete_buffer (buffer:CFFIPointer):Void;
	@:cffi private static function lime_al_delete_buffers (n:Int, buffers:Dynamic):Void;
	@:cffi private static function lime_al_delete_source (source:CFFIPointer):Void;
	@:cffi private static function lime_al_delete_sources (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_disable (capability:Int):Void;
	@:cffi private static function lime_al_distance_model (distanceModel:Int):Void;
	@:cffi private static function lime_al_doppler_factor (value:Float32):Void;
	@:cffi private static function lime_al_doppler_velocity (value:Float32):Void;
	@:cffi private static function lime_al_enable (capability:Int):Void;
	@:cffi private static function lime_al_gen_source ():CFFIPointer;
	@:cffi private static function lime_al_gen_sources (n:Int):Array<CFFIPointer>;
	@:cffi private static function lime_al_get_boolean (param:Int):Bool;
	@:cffi private static function lime_al_get_booleanv (param:Int, count:Int):Array<Bool>;
	@:cffi private static function lime_al_gen_buffer ():CFFIPointer;
	@:cffi private static function lime_al_gen_buffers (n:Int):Array<CFFIPointer>;
	@:cffi private static function lime_al_get_buffer3f (buffer:CFFIPointer, param:Int):Array<Float>;
	@:cffi private static function lime_al_get_buffer3i (buffer:CFFIPointer, param:Int):Array<Int>;
	@:cffi private static function lime_al_get_bufferf (buffer:CFFIPointer, param:Int):Float32;
	@:cffi private static function lime_al_get_bufferfv (buffer:CFFIPointer, param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_bufferi (buffer:CFFIPointer, param:Int):Int;
	@:cffi private static function lime_al_get_bufferiv (buffer:CFFIPointer, param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_double (param:Int):Float;
	@:cffi private static function lime_al_get_doublev (param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_enum_value (ename:String):Int;
	@:cffi private static function lime_al_get_error ():Int;
	@:cffi private static function lime_al_get_float (param:Int):Float32;
	@:cffi private static function lime_al_get_floatv (param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_integer (param:Int):Int;
	@:cffi private static function lime_al_get_integerv (param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_listener3f (param:Int):Array<Float>;
	@:cffi private static function lime_al_get_listener3i (param:Int):Array<Int>;
	@:cffi private static function lime_al_get_listenerf (param:Int):Float32;
	@:cffi private static function lime_al_get_listenerfv (param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_listeneri (param:Int):Int;
	@:cffi private static function lime_al_get_listeneriv (param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_proc_address (fname:String):Float;
	@:cffi private static function lime_al_get_source3f (source:CFFIPointer, param:Int):Array<Float>;
	@:cffi private static function lime_al_get_source3i (source:CFFIPointer, param:Int):Array<Int>;
	@:cffi private static function lime_al_get_sourcef (source:CFFIPointer, param:Int):Float32;
	@:cffi private static function lime_al_get_sourcefv (source:CFFIPointer, param:Int, count:Int):Array<Float>;
	@:cffi private static function lime_al_get_sourcei (source:CFFIPointer, param:Int):Dynamic;
	@:cffi private static function lime_al_get_sourceiv (source:CFFIPointer, param:Int, count:Int):Array<Int>;
	@:cffi private static function lime_al_get_string (param:Int):Dynamic;
	@:cffi private static function lime_al_is_buffer (buffer:CFFIPointer):Bool;
	@:cffi private static function lime_al_is_enabled (capability:Int):Bool;
	@:cffi private static function lime_al_is_extension_present (extname:String):Bool;
	@:cffi private static function lime_al_is_source (source:CFFIPointer):Bool;
	@:cffi private static function lime_al_listener3f (param:Int, value1:Float32, value2:Float32, value3:Float32):Void;
	@:cffi private static function lime_al_listener3i (param:Int, value1:Int, value2:Int, value3:Int):Void;
	@:cffi private static function lime_al_listenerf (param:Int, value1:Float32):Void;
	@:cffi private static function lime_al_listenerfv (param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_listeneri (param:Int, value1:Int):Void;
	@:cffi private static function lime_al_listeneriv (param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_source_pause (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_pausev (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_play (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_playv (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_queue_buffers (source:CFFIPointer, nb:Int, buffers:Dynamic):Void;
	@:cffi private static function lime_al_source_rewind (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_rewindv (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_stop (source:CFFIPointer):Void;
	@:cffi private static function lime_al_source_stopv (n:Int, sources:Dynamic):Void;
	@:cffi private static function lime_al_source_unqueue_buffers (source:CFFIPointer, nb:Int):Dynamic;
	@:cffi private static function lime_al_source3f (source:CFFIPointer, param:Int, value1:Float32, value2:Float32, value3:Float32):Void;
	@:cffi private static function lime_al_source3i (source:CFFIPointer, param:Int, value1:Dynamic, value2:Int, value3:Int):Void;
	@:cffi private static function lime_al_sourcef (source:CFFIPointer, param:Int, value:Float32):Void;
	@:cffi private static function lime_al_sourcefv (source:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_sourcei (source:CFFIPointer, param:Int, value:Dynamic):Void;
	@:cffi private static function lime_al_sourceiv (source:CFFIPointer, param:Int, values:Dynamic):Void;
	@:cffi private static function lime_al_speed_of_sound (speed:Float32):Void;
	@:cffi private static function lime_alc_close_device (device:CFFIPointer):Bool;
	@:cffi private static function lime_alc_create_context (device:CFFIPointer, attrlist:Dynamic):CFFIPointer;
	@:cffi private static function lime_alc_destroy_context (context:CFFIPointer):Void;
	@:cffi private static function lime_alc_get_contexts_device (context:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_alc_get_current_context ():CFFIPointer;
	@:cffi private static function lime_alc_get_error (device:CFFIPointer):Int;
	@:cffi private static function lime_alc_get_integerv (device:CFFIPointer, param:Int, size:Int):Dynamic;
	@:cffi private static function lime_alc_get_string (device:CFFIPointer, param:Int):Dynamic;
	// @:cffi private static function lime_alc_make_context_current (context:CFFIPointer):Bool;
	// @:cffi private static function lime_alc_open_device (devicename:String):CFFIPointer;
	@:cffi private static function lime_alc_pause_device (device:CFFIPointer):Void;
	@:cffi private static function lime_alc_process_context (context:CFFIPointer):Void;
	@:cffi private static function lime_alc_resume_device (device:CFFIPointer):Void;
	@:cffi private static function lime_alc_suspend_context (context:CFFIPointer):Void;
	// @:hlNative("lime", "lime_alc_close_device") private static function lime_alc_close_device (device:ALDevice):Bool { return false; }
	// @:hlNative("lime", "lime_alc_create_context") private static function lime_alc_create_context (device:ALDevice, attrlist:Array<Int>):ALContext { return null; }
	// @:hlNative("lime", "lime_alc_destroy_context") private static function lime_alc_destroy_context (context:ALContext):Void {}
	// @:hlNative("lime", "lime_alc_get_contexts_device") private static function lime_alc_get_contexts_device (context:ALContext):ALDevice { return null; }
	// @:hlNative("lime", "lime_alc_get_current_context") private static function lime_alc_get_current_context ():ALContext { return null; }
	// @:hlNative("lime", "lime_alc_get_error") private static function lime_alc_get_error (device:ALDevice):Int { return 0; }
	// @:hlNative("lime", "lime_alc_get_integerv") private static function lime_alc_get_integerv (device:ALDevice, param:Int, size:Int):Array<Int> { return null; }
	// @:hlNative("lime", "lime_alc_get_string") private static function lime_alc_get_string (device:ALDevice, param:Int):String { return null; }
	@:hlNative("lime", "lime_alc_make_context_current") private static function lime_alc_make_context_current (context:ALContext):Bool { return false; }
	@:hlNative("lime", "lime_alc_open_device") private static function lime_alc_open_device (devicename:String):CFFIPointer { return null; };
	// @:hlNative("lime", "lime_alc_pause_device") private static function lime_alc_pause_device (device:ALDevice):Void {}
	// @:hlNative("lime", "lime_alc_process_context") private static function lime_alc_process_context (context:ALContext):Void {}
	// @:hlNative("lime", "lime_alc_resume_device") private static function lime_alc_resume_device (device:ALDevice):Void {}
	// @:hlNative("lime", "lime_alc_suspend_context") private static function lime_alc_suspend_context (context:ALContext):Void {}
	#end
	
	@:cffi private static function lime_al_gen_filter():CFFIPointer;
	@:cffi private static function lime_al_filteri(filter:CFFIPointer, param:Int, value:Dynamic):Void;
	@:cffi private static function lime_al_filterf(filter:CFFIPointer, param:Int, value:Float32):Void;
	@:cffi private static function lime_al_remove_direct_filter(source:CFFIPointer):Void;
	@:cffi private static function lime_al_is_filter (filter:CFFIPointer):Bool;
	@:cffi private static function lime_al_get_filteri(filter:CFFIPointer, param:Int):Int;
	@:cffi private static function lime_al_gen_effect():CFFIPointer;
	@:cffi private static function lime_al_effectf(effect:CFFIPointer, param:Int, value:Float32):Void;  
	@:cffi private static function lime_al_effectfv(effect:CFFIPointer, param:Int, values:Array<Float>):Void;
	@:cffi private static function lime_al_effecti(effect:CFFIPointer, param:Int, value:Int):Void;
	@:cffi private static function lime_al_effectiv(effect:CFFIPointer, param:Int, values:Array<Int>):Void;
	@:cffi private static function lime_al_is_effect(effect:CFFIPointer):Bool;	
	@:cffi private static function lime_al_gen_aux():CFFIPointer;
	@:cffi private static function lime_al_auxf(aux:CFFIPointer, param:Int, value:Float32):Void;  
	@:cffi private static function lime_al_auxfv(aux:CFFIPointer, param:Int, values:Array<Float>):Void;
	@:cffi private static function lime_al_auxi(aux:CFFIPointer, param:Int, value:Dynamic):Void;
	@:cffi private static function lime_al_auxiv(aux:CFFIPointer, param:Int, values:Array<Int>):Void;	
	@:cffi private static function lime_al_is_aux(aux:CFFIPointer):Bool;	
	@:cffi private static function lime_al_remove_send (source:CFFIPointer, index:Int):Void;
	
	#end
	
	#if (lime_cffi && !macro && lime_cairo)
	#if !hl
	@:cffi private static function lime_cairo_arc (handle:CFFIPointer, xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float):Void;
	@:cffi private static function lime_cairo_arc_negative (handle:CFFIPointer, xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float):Void;
	@:cffi private static function lime_cairo_clip (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_clip_preserve (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_clip_extents (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void;
	@:cffi private static function lime_cairo_close_path (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_copy_page (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_create (handle:CFFIPointer):Dynamic;
	@:cffi private static function lime_cairo_curve_to (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float):Void;
	@:cffi private static function lime_cairo_fill (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_fill_extents (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void;
	@:cffi private static function lime_cairo_fill_preserve (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_get_antialias (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_get_current_point (handle:CFFIPointer):Dynamic;
	@:cffi private static function lime_cairo_get_dash (handle:CFFIPointer):Dynamic;
	@:cffi private static function lime_cairo_get_dash_count (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_get_fill_rule (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_get_font_face (handle:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_cairo_get_font_options (handle:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_cairo_get_group_target (handle:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_cairo_get_line_cap (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_get_line_join (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_get_line_width (handle:CFFIPointer):Float;
	@:cffi private static function lime_cairo_get_matrix (handle:CFFIPointer):Dynamic;
	@:cffi private static function lime_cairo_get_miter_limit (handle:CFFIPointer):Float;
	@:cffi private static function lime_cairo_get_operator (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_get_source (handle:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_cairo_get_target (handle:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_cairo_get_tolerance (handle:CFFIPointer):Float;
	@:cffi private static function lime_cairo_has_current_point (handle:CFFIPointer):Bool;
	@:cffi private static function lime_cairo_identity_matrix (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_in_clip (handle:CFFIPointer, x:Float, y:Float):Bool;
	@:cffi private static function lime_cairo_in_fill (handle:CFFIPointer, x:Float, y:Float):Bool;
	@:cffi private static function lime_cairo_in_stroke (handle:CFFIPointer, x:Float, y:Float):Bool;
	@:cffi private static function lime_cairo_line_to (handle:CFFIPointer, x:Float, y:Float):Void;
	@:cffi private static function lime_cairo_mask (handle:CFFIPointer, pattern:CFFIPointer):Void;
	@:cffi private static function lime_cairo_mask_surface (handle:CFFIPointer, surface:CFFIPointer, x:Float, y:Float):Void;
	@:cffi private static function lime_cairo_move_to (handle:CFFIPointer, x:Float, y:Float):Void;
	@:cffi private static function lime_cairo_new_path (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_paint (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_paint_with_alpha (handle:CFFIPointer, alpha:Float):Void;
	@:cffi private static function lime_cairo_pop_group (handle:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_cairo_pop_group_to_source (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_push_group (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_push_group_with_content (handle:CFFIPointer, content:Int):Void;
	@:cffi private static function lime_cairo_rectangle (handle:CFFIPointer, x:Float, y:Float, width:Float, height:Float):Void;
	@:cffi private static function lime_cairo_rel_curve_to (handle:CFFIPointer, dx1:Float, dy1:Float, dx2:Float, dy2:Float, dx3:Float, dy3:Float):Void;
	@:cffi private static function lime_cairo_rel_line_to (handle:CFFIPointer, dx:Float, dy:Float):Void;
	@:cffi private static function lime_cairo_rel_move_to (handle:CFFIPointer, dx:Float, dy:Float):Void;
	@:cffi private static function lime_cairo_reset_clip (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_restore (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_rotate (handle:CFFIPointer, amount:Float):Void;
	@:cffi private static function lime_cairo_save (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_scale (handle:CFFIPointer, x:Float, y:Float):Void;
	@:cffi private static function lime_cairo_set_antialias (handle:CFFIPointer, cap:Int):Void;
	@:cffi private static function lime_cairo_set_dash (handle:CFFIPointer, dash:Dynamic):Void;
	@:cffi private static function lime_cairo_set_fill_rule (handle:CFFIPointer, cap:Int):Void;
	@:cffi private static function lime_cairo_set_font_face (handle:CFFIPointer, face:CFFIPointer):Void;
	@:cffi private static function lime_cairo_set_font_options (handle:CFFIPointer, options:CFFIPointer):Void;
	@:cffi private static function lime_cairo_set_font_size (handle:CFFIPointer, size:Float):Void;
	@:cffi private static function lime_cairo_set_line_cap (handle:CFFIPointer, cap:Int):Void;
	@:cffi private static function lime_cairo_set_line_join (handle:CFFIPointer, join:Int):Void;
	@:cffi private static function lime_cairo_set_line_width (handle:CFFIPointer, width:Float):Void;
	@:cffi private static function lime_cairo_set_matrix (handle:CFFIPointer, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	//@:cffi private static function lime_cairo_set_matrix (handle:CFFIPointer, matrix:Dynamic):Void;
	@:cffi private static function lime_cairo_set_miter_limit (handle:CFFIPointer, miterLimit:Float):Void;
	@:cffi private static function lime_cairo_set_operator (handle:CFFIPointer, op:Int):Void;
	@:cffi private static function lime_cairo_set_source (handle:CFFIPointer, pattern:CFFIPointer):Void;
	@:cffi private static function lime_cairo_set_source_rgb (handle:CFFIPointer, r:Float, g:Float, b:Float):Void;
	@:cffi private static function lime_cairo_set_source_rgba (handle:CFFIPointer, r:Float, g:Float, b:Float, a:Float):Void;
	@:cffi private static function lime_cairo_set_source_surface (handle:CFFIPointer, surface:CFFIPointer, x:Float, y:Float):Void;
	@:cffi private static function lime_cairo_set_tolerance (handle:CFFIPointer, tolerance:Float):Void;
	@:cffi private static function lime_cairo_show_glyphs (handle:CFFIPointer, glyphs:Dynamic):Void;
	@:cffi private static function lime_cairo_show_page (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_show_text (handle:CFFIPointer, text:String):Void;
	@:cffi private static function lime_cairo_status (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_stroke (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_stroke_extents (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void;
	@:cffi private static function lime_cairo_stroke_preserve (handle:CFFIPointer):Void;
	@:cffi private static function lime_cairo_text_path (handle:CFFIPointer, text:String):Void;
	@:cffi private static function lime_cairo_transform (handle:CFFIPointer, matrix:Dynamic):Void;
	@:cffi private static function lime_cairo_translate (handle:CFFIPointer, x:Float, y:Float):Void;
	@:cffi private static function lime_cairo_version ():Int;
	@:cffi private static function lime_cairo_version_string ():String;
	@:cffi private static function lime_cairo_font_face_status (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_font_options_create ():CFFIPointer;
	@:cffi private static function lime_cairo_font_options_get_antialias (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_font_options_get_hint_metrics (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_font_options_get_hint_style (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_font_options_get_subpixel_order (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_font_options_set_antialias (handle:CFFIPointer, v:Int):Void;
	@:cffi private static function lime_cairo_font_options_set_hint_metrics (handle:CFFIPointer, v:Int):Void;
	@:cffi private static function lime_cairo_font_options_set_hint_style (handle:CFFIPointer, v:Int):Void;
	@:cffi private static function lime_cairo_font_options_set_subpixel_order (handle:CFFIPointer, v:Int):Void;
	@:cffi private static function lime_cairo_ft_font_face_create (face:CFFIPointer, flags:Int):CFFIPointer;
	@:cffi private static function lime_cairo_image_surface_create (format:Int, width:Int, height:Int):CFFIPointer;
	@:cffi private static function lime_cairo_image_surface_create_for_data (data:DataPointer, format:Int, width:Int, height:Int, stride:Int):CFFIPointer;
	@:cffi private static function lime_cairo_image_surface_get_data (handle:CFFIPointer):DataPointer;
	@:cffi private static function lime_cairo_image_surface_get_format (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_image_surface_get_height (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_image_surface_get_stride (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_image_surface_get_width (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_pattern_add_color_stop_rgb (handle:CFFIPointer, offset:Float, red:Float, green:Float, blue:Float):Void;
	@:cffi private static function lime_cairo_pattern_add_color_stop_rgba (handle:CFFIPointer, offset:Float, red:Float, green:Float, blue:Float, alpha:Float):Void;
	@:cffi private static function lime_cairo_pattern_create_for_surface (surface:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_cairo_pattern_create_linear (x0:Float, y0:Float, x1:Float, y1:Float):CFFIPointer;
	@:cffi private static function lime_cairo_pattern_create_radial (cx0:Float, cy0:Float, radius0:Float, cx1:Float, cy1:Float, radius1:Float):CFFIPointer;
	@:cffi private static function lime_cairo_pattern_create_rgb (r:Float, g:Float, b:Float):CFFIPointer;
	@:cffi private static function lime_cairo_pattern_create_rgba (r:Float, g:Float, b:Float, a:Float):CFFIPointer;
	@:cffi private static function lime_cairo_pattern_get_color_stop_count (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_pattern_get_extend (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_pattern_get_filter (handle:CFFIPointer):Int;
	@:cffi private static function lime_cairo_pattern_get_matrix (handle:CFFIPointer):Dynamic;
	@:cffi private static function lime_cairo_pattern_set_extend (handle:CFFIPointer, extend:Int):Void;
	@:cffi private static function lime_cairo_pattern_set_filter (handle:CFFIPointer, filter:Int):Void;
	@:cffi private static function lime_cairo_pattern_set_matrix (handle:CFFIPointer, matrix:Dynamic):Void;
	@:cffi private static function lime_cairo_surface_flush (surface:CFFIPointer):Void;
	#end
	
	#if hl
	@:hlNative("lime", "lime_cairo_arc") private static function lime_cairo_arc (handle:CFFIPointer, xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float):Void {}
	@:hlNative("lime", "lime_cairo_arc_negative") private static function lime_cairo_arc_negative (handle:CFFIPointer, xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float):Void {}
	@:hlNative("lime", "lime_cairo_clip") private static function lime_cairo_clip (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_clip_preserve") private static function lime_cairo_clip_preserve (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_clip_extents") private static function lime_cairo_clip_extents (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void {}
	@:hlNative("lime", "lime_cairo_close_path") private static function lime_cairo_close_path (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_copy_page") private static function lime_cairo_copy_page (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_create") private static function lime_cairo_create (handle:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_curve_to") private static function lime_cairo_curve_to (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float):Void {}
	@:hlNative("lime", "lime_cairo_fill") private static function lime_cairo_fill (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_fill_extents") private static function lime_cairo_fill_extents (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void {}
	@:hlNative("lime", "lime_cairo_fill_preserve") private static function lime_cairo_fill_preserve (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_get_antialias") private static function lime_cairo_get_antialias (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_get_current_point") private static function lime_cairo_get_current_point (handle:CFFIPointer):Vector2 { return null; }
	@:hlNative("lime", "lime_cairo_get_dash") private static function lime_cairo_get_dash (handle:CFFIPointer):Array<Float> { return null; }
	@:hlNative("lime", "lime_cairo_get_dash_count") private static function lime_cairo_get_dash_count (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_get_fill_rule") private static function lime_cairo_get_fill_rule (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_get_font_face") private static function lime_cairo_get_font_face (handle:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_get_font_options") private static function lime_cairo_get_font_options (handle:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_get_group_target") private static function lime_cairo_get_group_target (handle:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_get_line_cap") private static function lime_cairo_get_line_cap (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_get_line_join") private static function lime_cairo_get_line_join (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_get_line_width") private static function lime_cairo_get_line_width (handle:CFFIPointer):Float { return 0; }
	@:hlNative("lime", "lime_cairo_get_matrix") private static function lime_cairo_get_matrix (handle:CFFIPointer):Matrix3 { return null; }
	@:hlNative("lime", "lime_cairo_get_miter_limit") private static function lime_cairo_get_miter_limit (handle:CFFIPointer):Float { return 0; }
	@:hlNative("lime", "lime_cairo_get_operator") private static function lime_cairo_get_operator (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_get_source") private static function lime_cairo_get_source (handle:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_get_target") private static function lime_cairo_get_target (handle:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_get_tolerance") private static function lime_cairo_get_tolerance (handle:CFFIPointer):Float { return 0; }
	@:hlNative("lime", "lime_cairo_has_current_point") private static function lime_cairo_has_current_point (handle:CFFIPointer):Bool { return false; }
	@:hlNative("lime", "lime_cairo_identity_matrix") private static function lime_cairo_identity_matrix (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_in_clip") private static function lime_cairo_in_clip (handle:CFFIPointer, x:Float, y:Float):Bool { return false; }
	@:hlNative("lime", "lime_cairo_in_fill") private static function lime_cairo_in_fill (handle:CFFIPointer, x:Float, y:Float):Bool { return false; }
	@:hlNative("lime", "lime_cairo_in_stroke") private static function lime_cairo_in_stroke (handle:CFFIPointer, x:Float, y:Float):Bool { return false; }
	@:hlNative("lime", "lime_cairo_line_to") private static function lime_cairo_line_to (handle:CFFIPointer, x:Float, y:Float):Void {}
	@:hlNative("lime", "lime_cairo_mask") private static function lime_cairo_mask (handle:CFFIPointer, pattern:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_mask_surface") private static function lime_cairo_mask_surface (handle:CFFIPointer, surface:CFFIPointer, x:Float, y:Float):Void {}
	@:hlNative("lime", "lime_cairo_move_to") private static function lime_cairo_move_to (handle:CFFIPointer, x:Float, y:Float):Void {}
	@:hlNative("lime", "lime_cairo_new_path") private static function lime_cairo_new_path (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_paint") private static function lime_cairo_paint (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_paint_with_alpha") private static function lime_cairo_paint_with_alpha (handle:CFFIPointer, alpha:Float):Void {}
	@:hlNative("lime", "lime_cairo_pop_group") private static function lime_cairo_pop_group (handle:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_pop_group_to_source") private static function lime_cairo_pop_group_to_source (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_push_group") private static function lime_cairo_push_group (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_push_group_with_content") private static function lime_cairo_push_group_with_content (handle:CFFIPointer, content:Int):Void {}
	@:hlNative("lime", "lime_cairo_rectangle") private static function lime_cairo_rectangle (handle:CFFIPointer, x:Float, y:Float, width:Float, height:Float):Void {}
	@:hlNative("lime", "lime_cairo_rel_curve_to") private static function lime_cairo_rel_curve_to (handle:CFFIPointer, dx1:Float, dy1:Float, dx2:Float, dy2:Float, dx3:Float, dy3:Float):Void {}
	@:hlNative("lime", "lime_cairo_rel_line_to") private static function lime_cairo_rel_line_to (handle:CFFIPointer, dx:Float, dy:Float):Void {}
	@:hlNative("lime", "lime_cairo_rel_move_to") private static function lime_cairo_rel_move_to (handle:CFFIPointer, dx:Float, dy:Float):Void {}
	@:hlNative("lime", "lime_cairo_reset_clip") private static function lime_cairo_reset_clip (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_restore") private static function lime_cairo_restore (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_rotate") private static function lime_cairo_rotate (handle:CFFIPointer, amount:Float):Void {}
	@:hlNative("lime", "lime_cairo_save") private static function lime_cairo_save (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_scale") private static function lime_cairo_scale (handle:CFFIPointer, x:Float, y:Float):Void {}
	@:hlNative("lime", "lime_cairo_set_antialias") private static function lime_cairo_set_antialias (handle:CFFIPointer, cap:Int):Void {}
	@:hlNative("lime", "lime_cairo_set_dash") private static function lime_cairo_set_dash (handle:CFFIPointer, dash:Array<Float>):Void {}
	@:hlNative("lime", "lime_cairo_set_fill_rule") private static function lime_cairo_set_fill_rule (handle:CFFIPointer, cap:Int):Void {}
	@:hlNative("lime", "lime_cairo_set_font_face") private static function lime_cairo_set_font_face (handle:CFFIPointer, face:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_set_font_options") private static function lime_cairo_set_font_options (handle:CFFIPointer, options:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_set_font_size") private static function lime_cairo_set_font_size (handle:CFFIPointer, size:Float):Void {}
	@:hlNative("lime", "lime_cairo_set_line_cap") private static function lime_cairo_set_line_cap (handle:CFFIPointer, cap:Int):Void {}
	@:hlNative("lime", "lime_cairo_set_line_join") private static function lime_cairo_set_line_join (handle:CFFIPointer, join:Int):Void {}
	@:hlNative("lime", "lime_cairo_set_line_width") private static function lime_cairo_set_line_width (handle:CFFIPointer, width:Float):Void {}
	@:hlNative("lime", "lime_cairo_set_matrix") private static function lime_cairo_set_matrix (handle:CFFIPointer, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {}
	// @:hlNative("lime", "lime_cairo_create") private static function lime_cairo_set_matrix (handle:CFFIPointer, matrix:Dynamic):Void {}
	@:hlNative("lime", "lime_cairo_set_miter_limit") private static function lime_cairo_set_miter_limit (handle:CFFIPointer, miterLimit:Float):Void {}
	@:hlNative("lime", "lime_cairo_set_operator") private static function lime_cairo_set_operator (handle:CFFIPointer, op:Int):Void {}
	@:hlNative("lime", "lime_cairo_set_source") private static function lime_cairo_set_source (handle:CFFIPointer, pattern:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_set_source_rgb") private static function lime_cairo_set_source_rgb (handle:CFFIPointer, r:Float, g:Float, b:Float):Void {}
	@:hlNative("lime", "lime_cairo_set_source_rgba") private static function lime_cairo_set_source_rgba (handle:CFFIPointer, r:Float, g:Float, b:Float, a:Float):Void {}
	@:hlNative("lime", "lime_cairo_set_source_surface") private static function lime_cairo_set_source_surface (handle:CFFIPointer, surface:CFFIPointer, x:Float, y:Float):Void {}
	@:hlNative("lime", "lime_cairo_set_tolerance") private static function lime_cairo_set_tolerance (handle:CFFIPointer, tolerance:Float):Void {}
	@:hlNative("lime", "lime_cairo_show_glyphs") private static function lime_cairo_show_glyphs (handle:CFFIPointer, glyphs:Array<CairoGlyph>):Void {}
	@:hlNative("lime", "lime_cairo_show_page") private static function lime_cairo_show_page (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_show_text") private static function lime_cairo_show_text (handle:CFFIPointer, text:String):Void {}
	@:hlNative("lime", "lime_cairo_status") private static function lime_cairo_status (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_stroke") private static function lime_cairo_stroke (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_stroke_extents") private static function lime_cairo_stroke_extents (handle:CFFIPointer, x1:Float, y1:Float, x2:Float, y2:Float):Void {}
	@:hlNative("lime", "lime_cairo_stroke_preserve") private static function lime_cairo_stroke_preserve (handle:CFFIPointer):Void {}
	@:hlNative("lime", "lime_cairo_text_path") private static function lime_cairo_text_path (handle:CFFIPointer, text:String):Void {}
	@:hlNative("lime", "lime_cairo_transform") private static function lime_cairo_transform (handle:CFFIPointer, matrix:Matrix3):Void {}
	@:hlNative("lime", "lime_cairo_translate") private static function lime_cairo_translate (handle:CFFIPointer, x:Float, y:Float):Void {}
	@:hlNative("lime", "lime_cairo_version") private static function lime_cairo_version ():Int { return 0; }
	@:hlNative("lime", "lime_cairo_version_string") private static function lime_cairo_version_string ():hl.Bytes { return null; }
	@:hlNative("lime", "lime_cairo_font_face_status") private static function lime_cairo_font_face_status (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_font_options_create") private static function lime_cairo_font_options_create ():CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_font_options_get_antialias") private static function lime_cairo_font_options_get_antialias (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_font_options_get_hint_metrics") private static function lime_cairo_font_options_get_hint_metrics (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_font_options_get_hint_style") private static function lime_cairo_font_options_get_hint_style (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_font_options_get_subpixel_order") private static function lime_cairo_font_options_get_subpixel_order (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_font_options_set_antialias") private static function lime_cairo_font_options_set_antialias (handle:CFFIPointer, v:Int):Void {}
	@:hlNative("lime", "lime_cairo_font_options_set_hint_metrics") private static function lime_cairo_font_options_set_hint_metrics (handle:CFFIPointer, v:Int):Void {}
	@:hlNative("lime", "lime_cairo_font_options_set_hint_style") private static function lime_cairo_font_options_set_hint_style (handle:CFFIPointer, v:Int):Void {}
	@:hlNative("lime", "lime_cairo_font_options_set_subpixel_order") private static function lime_cairo_font_options_set_subpixel_order (handle:CFFIPointer, v:Int):Void {}
	@:hlNative("lime", "lime_cairo_ft_font_face_create") private static function lime_cairo_ft_font_face_create (face:CFFIPointer, flags:Int):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_image_surface_create") private static function lime_cairo_image_surface_create (format:Int, width:Int, height:Int):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_image_surface_create_for_data") private static function lime_cairo_image_surface_create_for_data (data:DataPointer, format:Int, width:Int, height:Int, stride:Int):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_image_surface_get_data") private static function lime_cairo_image_surface_get_data (handle:CFFIPointer):DataPointer { return 0; }
	@:hlNative("lime", "lime_cairo_image_surface_get_format") private static function lime_cairo_image_surface_get_format (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_image_surface_get_height") private static function lime_cairo_image_surface_get_height (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_image_surface_get_stride") private static function lime_cairo_image_surface_get_stride (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_image_surface_get_width") private static function lime_cairo_image_surface_get_width (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_pattern_add_color_stop_rgb") private static function lime_cairo_pattern_add_color_stop_rgb (handle:CFFIPointer, offset:Float, red:Float, green:Float, blue:Float):Void {}
	@:hlNative("lime", "lime_cairo_pattern_add_color_stop_rgba") private static function lime_cairo_pattern_add_color_stop_rgba (handle:CFFIPointer, offset:Float, red:Float, green:Float, blue:Float, alpha:Float):Void {}
	@:hlNative("lime", "lime_cairo_pattern_create_for_surface") private static function lime_cairo_pattern_create_for_surface (surface:CFFIPointer):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_pattern_create_linear") private static function lime_cairo_pattern_create_linear (x0:Float, y0:Float, x1:Float, y1:Float):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_pattern_create_radial") private static function lime_cairo_pattern_create_radial (cx0:Float, cy0:Float, radius0:Float, cx1:Float, cy1:Float, radius1:Float):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_pattern_create_rgb") private static function lime_cairo_pattern_create_rgb (r:Float, g:Float, b:Float):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_pattern_create_rgba") private static function lime_cairo_pattern_create_rgba (r:Float, g:Float, b:Float, a:Float):CFFIPointer { return null; }
	@:hlNative("lime", "lime_cairo_pattern_get_color_stop_count") private static function lime_cairo_pattern_get_color_stop_count (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_pattern_get_extend") private static function lime_cairo_pattern_get_extend (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_pattern_get_filter") private static function lime_cairo_pattern_get_filter (handle:CFFIPointer):Int { return 0; }
	@:hlNative("lime", "lime_cairo_pattern_get_matrix") private static function lime_cairo_pattern_get_matrix (handle:CFFIPointer):Matrix3 { return null; }
	@:hlNative("lime", "lime_cairo_pattern_set_extend") private static function lime_cairo_pattern_set_extend (handle:CFFIPointer, extend:Int):Void {}
	@:hlNative("lime", "lime_cairo_pattern_set_filter") private static function lime_cairo_pattern_set_filter (handle:CFFIPointer, filter:Int):Void {}
	@:hlNative("lime", "lime_cairo_pattern_set_matrix") private static function lime_cairo_pattern_set_matrix (handle:CFFIPointer, matrix:Matrix3):Void {}
	@:hlNative("lime", "lime_cairo_surface_flush") private static function lime_cairo_surface_flush (surface:CFFIPointer):Void {}
	#end
	#end
	
	#if (lime_cffi && !macro && lime_curl)
	@:cffi private static function lime_curl_getdate (date:String, now:Float):Float;
	@:cffi private static function lime_curl_global_cleanup ():Void;
	@:cffi private static function lime_curl_global_init (flags:Int):Int;
	@:cffi private static function lime_curl_version ():Dynamic;
	@:cffi private static function lime_curl_version_info (type:Int):Dynamic;
	@:cffi private static function lime_curl_easy_cleanup (handle:CFFIPointer):Void;
	@:cffi private static function lime_curl_easy_duphandle (handle:CFFIPointer):CFFIPointer;
	@:cffi private static function lime_curl_easy_escape (curl:CFFIPointer, url:String, length:Int):Dynamic;
	@:cffi private static function lime_curl_easy_getinfo (curl:CFFIPointer, info:Int):Dynamic;
	@:cffi private static function lime_curl_easy_init ():CFFIPointer;
	@:cffi private static function lime_curl_easy_pause (handle:CFFIPointer, bitmask:Int):Int;
	@:cffi private static function lime_curl_easy_perform (easy_handle:CFFIPointer):Int;
	@:cffi private static function lime_curl_easy_recv (curl:CFFIPointer, buffer:Dynamic, buflen:Int, n:Int):Int;
	@:cffi private static function lime_curl_easy_reset (curl:CFFIPointer):Void;
	@:cffi private static function lime_curl_easy_send (curl:CFFIPointer, buffer:Dynamic, buflen:Int, n:Int):Int;
	@:cffi private static function lime_curl_easy_setopt (handle:CFFIPointer, option:Int, parameter:Dynamic, writeBytes:Dynamic):Int;
	@:cffi private static function lime_curl_easy_strerror (errornum:Int):Dynamic;
	@:cffi private static function lime_curl_easy_unescape (curl:CFFIPointer, url:String, inlength:Int, outlength:Int):Dynamic;
	@:cffi private static function lime_curl_multi_init ():CFFIPointer;
	@:cffi private static function lime_curl_multi_add_handle (multi_handle:CFFIPointer, curl_handle:CFFIPointer):Int;
	@:cffi private static function lime_curl_multi_get_running_handles (multi_handle:CFFIPointer):Int;
	@:cffi private static function lime_curl_multi_info_read (multi_handle:CFFIPointer):Dynamic;
	@:cffi private static function lime_curl_multi_perform (multi_handle:CFFIPointer):Int;
	@:cffi private static function lime_curl_multi_remove_handle (multi_handle:CFFIPointer, curl_handle:CFFIPointer):Int;
	@:cffi private static function lime_curl_multi_wait (multi_handle:CFFIPointer, timeout_ms:Int):Int;
	#end
	
	#if (lime_cffi && !macro && lime_opengl)
	@:cffi private static function lime_gl_active_texture (texture:Int):Void;
	@:cffi private static function lime_gl_attach_shader (program:Int, shader:Int):Void;
	@:cffi private static function lime_gl_begin_query (target:Int, query:Int):Void;
	@:cffi private static function lime_gl_begin_transform_feedback (primitiveNode:Int):Void;
	@:cffi private static function lime_gl_bind_attrib_location (program:Int, index:Int, name:String):Void;
	@:cffi private static function lime_gl_bind_buffer (target:Int, buffer:Int):Void;
	@:cffi private static function lime_gl_bind_buffer_base (target:Int, index:Int, buffer:Int):Void;
	@:cffi private static function lime_gl_bind_buffer_range (target:Int, index:Int, buffer:Int, offset:DataPointer, size:Int):Void;
	@:cffi private static function lime_gl_bind_framebuffer (target:Int, framebuffer:Int):Void;
	@:cffi private static function lime_gl_bind_renderbuffer (target:Int, renderbuffer:Int):Void;
	@:cffi private static function lime_gl_bind_sampler (target:Int, sampler:Int):Void;
	@:cffi private static function lime_gl_bind_texture (target:Int, texture:Int):Void;
	@:cffi private static function lime_gl_bind_transform_feedback (target:Int, transformFeedback:Int):Void;
	@:cffi private static function lime_gl_bind_vertex_array (vertexArray:Int):Void;
	@:cffi private static function lime_gl_blend_color (red:Float32, green:Float32, blue:Float32, alpha:Float32):Void;
	@:cffi private static function lime_gl_blend_equation (mode:Int):Void;
	@:cffi private static function lime_gl_blend_equation_separate (modeRGB:Int, modeAlpha:Int):Void;
	@:cffi private static function lime_gl_blend_func (sfactor:Int, dfactor:Int):Void;
	@:cffi private static function lime_gl_blend_func_separate (srcRGB:Int, dstRGB:Int, srcAlpha:Int, dstAlpha:Int):Void;
	@:cffi private static function lime_gl_blit_framebuffer (srcX0:Int, srcY0:Int, srcX1:Int, srcY1:Int, dstX0:Int, dstY0:Int, dstX1:Int, dstY1:Int, mask:Int, filter:Int):Void;
	@:cffi private static function lime_gl_buffer_data (target:Int, size:Int, srcData:DataPointer, usage:Int):Void;
	@:cffi private static function lime_gl_buffer_sub_data (target:Int, offset:Int, size:Int, srcData:DataPointer):Void;
	@:cffi private static function lime_gl_check_framebuffer_status (target:Int):Int;
	@:cffi private static function lime_gl_clear (mask:Int):Void;
	@:cffi private static function lime_gl_clear_bufferfi (buffer:Int, drawBuffer:Int, depth:Float32, stencil:Int):Void;
	@:cffi private static function lime_gl_clear_bufferfv (buffer:Int, drawBuffer:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_clear_bufferiv (buffer:Int, drawBuffer:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_clear_bufferuiv (buffer:Int, drawBuffer:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_client_wait_sync (sync:CFFIPointer, flags:Int, timeoutA:Int, timeoutB:Int):Int;
	@:cffi private static function lime_gl_clear_color (red:Float32, green:Float32, blue:Float32, alpha:Float32):Void;
	@:cffi private static function lime_gl_clear_depthf (depth:Float32):Void;
	@:cffi private static function lime_gl_clear_stencil (s:Int):Void;
	@:cffi private static function lime_gl_color_mask (red:Bool, green:Bool, blue:Bool, alpha:Bool):Void;
	@:cffi private static function lime_gl_compile_shader (shader:Int):Void;
	@:cffi private static function lime_gl_compressed_tex_image_2d (target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, imageSize:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_compressed_tex_image_3d (target:Int, level:Int, internalformat:Int, width:Int, height:Int, depth:Int, border:Int, imageSize:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_compressed_tex_sub_image_2d (target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, imageSize:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_compressed_tex_sub_image_3d (target:Int, level:Int, xoffset:Int, yoffset:Int, zoffset:Int, width:Int, height:Int, depth:Int, format:Int, imageSize:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_copy_buffer_sub_data (readTarget:Int, writeTarget:Int, readOffset:DataPointer, writeOffset:DataPointer, size:Int):Void;
	@:cffi private static function lime_gl_copy_tex_image_2d (target:Int, level:Int, internalformat:Int, x:Int, y:Int, width:Int, height:Int, border:Int):Void;
	@:cffi private static function lime_gl_copy_tex_sub_image_2d (target:Int, level:Int, xoffset:Int, yoffset:Int, x:Int, y:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_copy_tex_sub_image_3d (target:Int, level:Int, xoffset:Int, yoffset:Int, zoffset:Int, x:Int, y:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_create_buffer ():Int;
	@:cffi private static function lime_gl_create_framebuffer ():Int;
	@:cffi private static function lime_gl_create_program ():Int;
	@:cffi private static function lime_gl_create_query ():Int;
	@:cffi private static function lime_gl_create_renderbuffer ():Int;
	@:cffi private static function lime_gl_create_sampler ():Int;
	@:cffi private static function lime_gl_create_shader (type:Int):Int;
	@:cffi private static function lime_gl_create_texture ():Int;
	@:cffi private static function lime_gl_create_transform_feedback ():Int;
	@:cffi private static function lime_gl_create_vertex_array ():Int;
	@:cffi private static function lime_gl_cull_face (mode:Int):Void;
	@:cffi private static function lime_gl_delete_buffer (buffer:Int):Void;
	@:cffi private static function lime_gl_delete_framebuffer (framebuffer:Int):Void;
	@:cffi private static function lime_gl_delete_program (program:Int):Void;
	@:cffi private static function lime_gl_delete_query (query:Int):Void;
	@:cffi private static function lime_gl_delete_renderbuffer (renderbuffer:Int):Void;
	@:cffi private static function lime_gl_delete_sampler (sampler:Int):Void;
	@:cffi private static function lime_gl_delete_shader (shader:Int):Void;
	@:cffi private static function lime_gl_delete_sync (sync:CFFIPointer):Void;
	@:cffi private static function lime_gl_delete_texture (texture:Int):Void;
	@:cffi private static function lime_gl_delete_transform_feedback (transformFeedback:Int):Void;
	@:cffi private static function lime_gl_delete_vertex_array (vertexArray:Int):Void;
	@:cffi private static function lime_gl_depth_func (func:Int):Void;
	@:cffi private static function lime_gl_depth_mask (flag:Bool):Void;
	@:cffi private static function lime_gl_depth_rangef (zNear:Float32, zFar:Float32):Void;
	@:cffi private static function lime_gl_detach_shader (program:Int, shader:Int):Void;
	@:cffi private static function lime_gl_disable (cap:Int):Void;
	@:cffi private static function lime_gl_disable_vertex_attrib_array (index:Int):Void;
	@:cffi private static function lime_gl_draw_arrays (mode:Int, first:Int, count:Int):Void;
	@:cffi private static function lime_gl_draw_arrays_instanced (mode:Int, first:Int, count:Int, instanceCount:Int):Void;
	@:cffi private static function lime_gl_draw_buffers (buffers:Dynamic):Void;
	@:cffi private static function lime_gl_draw_elements (mode:Int, count:Int, type:Int, offset:DataPointer):Void;
	@:cffi private static function lime_gl_draw_elements_instanced (mode:Int, count:Int, type:Int, offset:DataPointer, instanceCount:Int):Void;
	@:cffi private static function lime_gl_draw_range_elements (mode:Int, start:Int, end:Int, count:Int, type:Int, offset:DataPointer):Void;
	@:cffi private static function lime_gl_enable (cap:Int):Void;
	@:cffi private static function lime_gl_enable_vertex_attrib_array (index:Int):Void;
	@:cffi private static function lime_gl_end_query (target:Int):Void;
	@:cffi private static function lime_gl_end_transform_feedback ():Void;
	@:cffi private static function lime_gl_fence_sync (condition:Int, flags:Int):CFFIPointer;
	@:cffi private static function lime_gl_finish ():Void;
	@:cffi private static function lime_gl_flush ():Void;
	@:cffi private static function lime_gl_framebuffer_renderbuffer (target:Int, attachment:Int, renderbuffertarget:Int, renderbuffer:Int):Void;
	@:cffi private static function lime_gl_framebuffer_texture2D (target:Int, attachment:Int, textarget:Int, texture:Int, level:Int):Void;
	@:cffi private static function lime_gl_framebuffer_texture_layer (target:Int, attachment:Int, texture:Int, level:Int, layer:Int):Void;
	@:cffi private static function lime_gl_front_face (mode:Int):Void;
	@:cffi private static function lime_gl_generate_mipmap (target:Int):Void;
	@:cffi private static function lime_gl_get_active_attrib (program:Int, index:Int):Dynamic;
	@:cffi private static function lime_gl_get_active_uniform (program:Int, index:Int):Dynamic;
	@:cffi private static function lime_gl_get_active_uniform_blocki (program:Int, uniformBlockIndex:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_active_uniform_blockiv (program:Int, uniformBlockIndex:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_active_uniform_block_name (program:Int, uniformBlockIndex:Int):Dynamic;
	@:cffi private static function lime_gl_get_active_uniformsiv (program:Int, uniformIndices:Dynamic, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_attached_shaders (program:Int):Dynamic;
	@:cffi private static function lime_gl_get_attrib_location (program:Int, name:String):Int;
	@:cffi private static function lime_gl_get_boolean (pname:Int):Bool;
	@:cffi private static function lime_gl_get_booleanv (pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_buffer_parameteri (target:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_buffer_parameteri64v (target:Int, index:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_buffer_parameteriv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_buffer_pointerv (target:Int, pname:Int):DataPointer;
	@:cffi private static function lime_gl_get_buffer_sub_data (target:Int, offset:DataPointer, size:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_get_context_attributes ():Dynamic;
	@:cffi private static function lime_gl_get_error ():Int;
	@:cffi private static function lime_gl_get_extension (name:String):Dynamic;
	@:cffi private static function lime_gl_get_float (pname:Int):Float32;
	@:cffi private static function lime_gl_get_floatv (pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_frag_data_location (program:Int, name:String):Int;
	@:cffi private static function lime_gl_get_framebuffer_attachment_parameteri (target:Int, attachment:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_framebuffer_attachment_parameteriv (target:Int, attachment:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_integer (pname:Int):Int;
	@:cffi private static function lime_gl_get_integer64v (pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_integer64i_v (pname:Int, index:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_integerv (pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_integeri_v (pname:Int, index:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_internalformativ (target:Int, internalformat:Int, pname:Int, bufSize:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_program_binary (program:Int, binaryFormat:Int, bytes:Dynamic):Void;
	@:cffi private static function lime_gl_get_program_info_log (program:Int):Dynamic;
	@:cffi private static function lime_gl_get_programi (program:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_programiv (program:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_queryi (target:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_queryiv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_query_objectui (target:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_query_objectuiv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_renderbuffer_parameteri (target:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_renderbuffer_parameteriv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_sampler_parameterf (target:Int, pname:Int):Float32;
	@:cffi private static function lime_gl_get_sampler_parameterfv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_sampler_parameteri (target:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_sampler_parameteriv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_shader_info_log (shader:Int):Dynamic;
	@:cffi private static function lime_gl_get_shaderi (shader:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_shaderiv (shader:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_shader_precision_format (shadertype:Int, precisiontype:Int):Dynamic;
	@:cffi private static function lime_gl_get_shader_source (shader:Int):Dynamic;
	@:cffi private static function lime_gl_get_string (pname:Int):Dynamic;
	@:cffi private static function lime_gl_get_stringi (pname:Int, index:Int):Dynamic;
	@:cffi private static function lime_gl_get_sync_parameteri (sync:CFFIPointer, pname:Int):Int;
	@:cffi private static function lime_gl_get_sync_parameteriv (sync:CFFIPointer, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_tex_parameterf (target:Int, pname:Int):Float32;
	@:cffi private static function lime_gl_get_tex_parameterfv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_tex_parameteri (target:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_tex_parameteriv (target:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_transform_feedback_varying (program:Int, index:Int):Dynamic;
	@:cffi private static function lime_gl_get_uniformf (program:Int, location:Int):Float32;
	@:cffi private static function lime_gl_get_uniformfv (program:Int, location:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_uniformi (program:Int, location:Int):Int;
	@:cffi private static function lime_gl_get_uniformiv (program:Int, location:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_uniformui (program:Int, location:Int):Int;
	@:cffi private static function lime_gl_get_uniformuiv (program:Int, location:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_uniform_block_index (program:Int, uniformBlockName:String):Int;
	@:cffi private static function lime_gl_get_uniform_location (program:Int, name:String):Int;
	@:cffi private static function lime_gl_get_vertex_attribf (index:Int, pname:Int):Float32;
	@:cffi private static function lime_gl_get_vertex_attribfv (index:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_vertex_attribi (index:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_vertex_attribiv (index:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_vertex_attribii (index:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_vertex_attribiiv (index:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_vertex_attribiui (index:Int, pname:Int):Int;
	@:cffi private static function lime_gl_get_vertex_attribiuiv (index:Int, pname:Int, params:DataPointer):Void;
	@:cffi private static function lime_gl_get_vertex_attrib_pointerv (index:Int, pname:Int):DataPointer;
	@:cffi private static function lime_gl_hint (target:Int, mode:Int):Void;
	@:cffi private static function lime_gl_invalidate_framebuffer (target:Int, attachments:Dynamic):Void;
	@:cffi private static function lime_gl_invalidate_sub_framebuffer (target:Int, attachments:Dynamic, x:Int, y:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_is_buffer (buffer:Int):Bool;
	@:cffi private static function lime_gl_is_enabled (cap:Int):Bool;
	@:cffi private static function lime_gl_is_framebuffer (framebuffer:Int):Bool;
	@:cffi private static function lime_gl_is_program (program:Int):Bool;
	@:cffi private static function lime_gl_is_query (query:Int):Bool;
	@:cffi private static function lime_gl_is_renderbuffer (renderbuffer:Int):Bool;
	@:cffi private static function lime_gl_is_sampler (sampler:Int):Bool;
	@:cffi private static function lime_gl_is_shader (shader:Int):Bool;
	@:cffi private static function lime_gl_is_sync (sync:CFFIPointer):Bool;
	@:cffi private static function lime_gl_is_texture (texture:Int):Bool;
	@:cffi private static function lime_gl_is_transform_feedback (transformFeedback:Int):Bool;
	@:cffi private static function lime_gl_is_vertex_array (vertexArray:Int):Bool;
	@:cffi private static function lime_gl_line_width (width:Float32):Void;
	@:cffi private static function lime_gl_link_program (program:Int):Void;
	@:cffi private static function lime_gl_map_buffer_range (target:Int, offset:DataPointer, length:Int, access:Int):DataPointer;
	@:cffi private static function lime_gl_object_deregister (object:Dynamic):Void;
	@:cffi private static function lime_gl_object_from_id (id:Int, type:Int):Dynamic;
	@:cffi private static function lime_gl_object_register (id:Int, type:Int, object:Dynamic):Void;
	@:cffi private static function lime_gl_pause_transform_feedback ():Void;
	@:cffi private static function lime_gl_pixel_storei (pname:Int, param:Int):Void;
	@:cffi private static function lime_gl_polygon_offset (factor:Float32, units:Float32):Void;
	@:cffi private static function lime_gl_program_binary (program:Int, binaryFormat:Int, binary:DataPointer, length:Int):Void;
	@:cffi private static function lime_gl_program_parameteri (program:Int, pname:Int, value:Int):Void;
	@:cffi private static function lime_gl_read_buffer (src:Int):Void;
	@:cffi private static function lime_gl_read_pixels (x:Int, y:Int, width:Int, height:Int, format:Int, type:Int, pixels:DataPointer):Void;
	@:cffi private static function lime_gl_release_shader_compiler ():Void;
	@:cffi private static function lime_gl_renderbuffer_storage (target:Int, internalformat:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_renderbuffer_storage_multisample (target:Int, samples:Int, internalformat:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_resume_transform_feedback ():Void;
	@:cffi private static function lime_gl_sample_coverage (value:Float32, invert:Bool):Void;
	@:cffi private static function lime_gl_sampler_parameterf (sampler:Int, pname:Int, param:Float32):Void;
	@:cffi private static function lime_gl_sampler_parameteri (sampler:Int, pname:Int, param:Int):Void;
	@:cffi private static function lime_gl_scissor (x:Int, y:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_shader_binary (shaders:Dynamic, binaryformat:Int, binary:DataPointer, length:Int):Void;
	@:cffi private static function lime_gl_shader_source (shader:Int, source:String):Void;
	@:cffi private static function lime_gl_stencil_func (func:Int, ref:Int, mask:Int):Void;
	@:cffi private static function lime_gl_stencil_func_separate (face:Int, func:Int, ref:Int, mask:Int):Void;
	@:cffi private static function lime_gl_stencil_mask (mask:Int):Void;
	@:cffi private static function lime_gl_stencil_mask_separate (face:Int, mask:Int):Void;
	@:cffi private static function lime_gl_stencil_op (fail:Int, zfail:Int, zpass:Int):Void;
	@:cffi private static function lime_gl_stencil_op_separate (face:Int, fail:Int, zfail:Int, zpass:Int):Void;
	@:cffi private static function lime_gl_tex_image_2d (target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, format:Int, type:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_tex_image_3d (target:Int, level:Int, internalformat:Int, width:Int, height:Int, depth:Int, border:Int, format:Int, type:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_tex_parameterf (target:Int, pname:Int, param:Float32):Void;
	@:cffi private static function lime_gl_tex_parameteri (target:Int, pname:Int, param:Int):Void;
	@:cffi private static function lime_gl_tex_storage_2d (target:Int, level:Int, internalformat:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_tex_storage_3d (target:Int, level:Int, internalformat:Int, width:Int, height:Int, depth:Int):Void;
	@:cffi private static function lime_gl_tex_sub_image_2d (target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, type:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_tex_sub_image_3d (target:Int, level:Int, xoffset:Int, yoffset:Int, zoffset:Int, width:Int, height:Int, depth:Int, format:Int, type:Int, data:DataPointer):Void;
	@:cffi private static function lime_gl_transform_feedback_varyings (program:Int, varyings:Dynamic, bufferMode:Int):Void;
	@:cffi private static function lime_gl_uniform1f (location:Int, v0:Float32):Void;
	@:cffi private static function lime_gl_uniform1fv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform1i (location:Int, v0:Int):Void;
	@:cffi private static function lime_gl_uniform1iv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform1ui (location:Int, v0:Int):Void;
	@:cffi private static function lime_gl_uniform1uiv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform2f (location:Int, v0:Float32, v1:Float32):Void;
	@:cffi private static function lime_gl_uniform2fv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform2i (location:Int, v0:Int, v1:Int):Void;
	@:cffi private static function lime_gl_uniform2iv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform2ui (location:Int, v0:Int, v1:Int):Void;
	@:cffi private static function lime_gl_uniform2uiv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform3f (location:Int, v0:Float32, v1:Float32, v2:Float32):Void;
	@:cffi private static function lime_gl_uniform3fv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform3i (location:Int, v0:Int, v1:Int, v2:Int):Void;
	@:cffi private static function lime_gl_uniform3iv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform3ui (location:Int, v0:Int, v1:Int, v2:Int):Void;
	@:cffi private static function lime_gl_uniform3uiv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform4f (location:Int, v0:Float32, v1:Float32, v2:Float32, v3:Float32):Void;
	@:cffi private static function lime_gl_uniform4fv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform4i (location:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;
	@:cffi private static function lime_gl_uniform4iv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform4ui (location:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;
	@:cffi private static function lime_gl_uniform4uiv (location:Int, count:Int, v:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_block_binding (program:Int, uniformBlockIndex:Int, uniformBlockBinding:Int):Void;
	@:cffi private static function lime_gl_uniform_matrix2fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix2x3fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix2x4fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix3fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix3x2fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix3x4fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix4fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix4x2fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_uniform_matrix4x3fv (location:Int, count:Int, transpose:Bool, value:DataPointer):Void;
	@:cffi private static function lime_gl_unmap_buffer (target:Int):Bool;
	@:cffi private static function lime_gl_use_program (program:Int):Void;
	@:cffi private static function lime_gl_validate_program (program:Int):Void;
	@:cffi private static function lime_gl_vertex_attrib1f (indx:Int, v0:Float32):Void;
	@:cffi private static function lime_gl_vertex_attrib1fv (indx:Int, values:DataPointer):Void;
	@:cffi private static function lime_gl_vertex_attrib2f (indx:Int, v0:Float32, v1:Float32):Void;
	@:cffi private static function lime_gl_vertex_attrib2fv (indx:Int, values:DataPointer):Void;
	@:cffi private static function lime_gl_vertex_attrib3f (indx:Int, v0:Float32, v1:Float32, v2:Float32):Void;
	@:cffi private static function lime_gl_vertex_attrib3fv (indx:Int, values:DataPointer):Void;
	@:cffi private static function lime_gl_vertex_attrib4f (indx:Int, v0:Float32, v1:Float32, v2:Float32, v3:Float32):Void;
	@:cffi private static function lime_gl_vertex_attrib4fv (indx:Int, values:DataPointer):Void;
	@:cffi private static function lime_gl_vertex_attribi4i (indx:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;
	@:cffi private static function lime_gl_vertex_attribi4iv (indx:Int, values:DataPointer):Void;
	@:cffi private static function lime_gl_vertex_attribi4ui (indx:Int, v0:Int, v1:Int, v2:Int, v3:Int):Void;
	@:cffi private static function lime_gl_vertex_attribi4uiv (indx:Int, values:DataPointer):Void;
	@:cffi private static function lime_gl_vertex_attrib_divisor (indx:Int, divisor:Int):Void;
	@:cffi private static function lime_gl_vertex_attrib_ipointer (indx:Int, size:Int, type:Int, stride:Int, offset:DataPointer):Void;
	@:cffi private static function lime_gl_vertex_attrib_pointer (indx:Int, size:Int, type:Int, normalized:Bool, stride:Int, offset:DataPointer):Void;
	@:cffi private static function lime_gl_viewport (x:Int, y:Int, width:Int, height:Int):Void;
	@:cffi private static function lime_gl_wait_sync (sync:CFFIPointer, flags:Int, timeoutA:Int, timeoutB:Int):Void;
	#end
	
	#if (lime_cffi && !macro && lime_vorbis)
	@:cffi private static function lime_vorbis_file_bitrate (vorbisFile:Dynamic, bitstream:Int):Int;
	@:cffi private static function lime_vorbis_file_bitrate_instant (vorbisFile:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_clear (vorbisFile:Dynamic):Void;
	@:cffi private static function lime_vorbis_file_comment (vorbisFile:Dynamic, bitstream:Int):Dynamic;
	@:cffi private static function lime_vorbis_file_crosslap (vorbisFile:Dynamic, otherVorbisFile:Dynamic):Dynamic;
	@:cffi private static function lime_vorbis_file_from_bytes (bytes:Dynamic):Dynamic;
	@:cffi private static function lime_vorbis_file_from_file (path:String):Dynamic;
	@:cffi private static function lime_vorbis_file_info (vorbisFile:Dynamic, bitstream:Int):Dynamic;
	@:cffi private static function lime_vorbis_file_pcm_seek (vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_pcm_seek_lap (vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_pcm_seek_page (vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_pcm_seek_page_lap (vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_raw_seek (vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_raw_seek_lap (vorbisFile:Dynamic, posLow:Dynamic, posHigh:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_pcm_tell (vorbisFile:Dynamic):Dynamic;
	@:cffi private static function lime_vorbis_file_pcm_total (vorbisFile:Dynamic, bitstream:Int):Dynamic;
	@:cffi private static function lime_vorbis_file_raw_tell (vorbisFile:Dynamic):Dynamic;
	@:cffi private static function lime_vorbis_file_raw_total (vorbisFile:Dynamic, bitstream:Int):Dynamic;
	@:cffi private static function lime_vorbis_file_read (vorbisFile:Dynamic, buffer:Dynamic, position:Int, length:Int, bigendianp:Bool, word:Int, signed:Bool):Dynamic;
	@:cffi private static function lime_vorbis_file_read_float (vorbisFile:Dynamic, pcmChannels:Dynamic, samples:Int):Dynamic;
	@:cffi private static function lime_vorbis_file_seekable (vorbisFile:Dynamic):Bool;
	@:cffi private static function lime_vorbis_file_serial_number (vorbisFile:Dynamic, bitstream:Int):Int;
	@:cffi private static function lime_vorbis_file_streams (vorbisFile:Dynamic):Int;
	@:cffi private static function lime_vorbis_file_time_seek (vorbisFile:Dynamic, s:Float):Int;
	@:cffi private static function lime_vorbis_file_time_seek_lap (vorbisFile:Dynamic, s:Float):Int;
	@:cffi private static function lime_vorbis_file_time_seek_page (vorbisFile:Dynamic, s:Float):Int;
	@:cffi private static function lime_vorbis_file_time_seek_page_lap (vorbisFile:Dynamic, s:Float):Int;
	@:cffi private static function lime_vorbis_file_time_tell (vorbisFile:Dynamic):Float;
	@:cffi private static function lime_vorbis_file_time_total (vorbisFile:Dynamic, bitstream:Int):Float;
	#end
	
	
}