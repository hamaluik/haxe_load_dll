
package;

/**
   dynamic linking
*/
@:include("dlfcn.h")
extern class Dl {
	@:native("RTLD_NOW")
	public static var RTLD_NOW: Int;

	@:native("dlopen")
	public static function open(filename: cpp.ConstCharStar, flags: Int): cpp.RawPointer<cpp.Void>;

	@:native("dlerror")
	public static function error(): cpp.RawPointer<cpp.Char>;

	@:native("dlsym")
	public static function sym(lib: cpp.RawPointer<cpp.Void>, sym: cpp.ConstCharStar): cpp.RawPointer<cpp.Void>;

	@:native("dlclose")
	public static function close(lib:cpp.RawPointer<cpp.Void>): Int;
}