
package;

@:include("dlfcn.h")
extern class Dl {
	public static inline var RTLD_NOW: Int = 2;

	@:native("dlopen")
	public static function open(lib:cpp.ConstCharStar, flags: Int): cpp.RawPointer<cpp.Void>;

	@:native("dlerror")
	public static function error(): cpp.RawPointer<cpp.Char>;

	@:native("dlsym")
	public static function sym(lib:cpp.RawPointer<cpp.Void>, sym:cpp.ConstCharStar): cpp.RawPointer<cpp.Void>;
}