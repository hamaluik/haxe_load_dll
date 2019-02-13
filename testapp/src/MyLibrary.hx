package;

class MyLibrary {
    static var lib: cpp.RawPointer<cpp.Void>;
    static var _add_two: cpp.RawPointer<cpp.Void>;
    static var _fib_sum: cpp.RawPointer<cpp.Void>;

    public static function load(path: String): Bool {
		lib = Dl.open(path, Dl.RTLD_NOW);
		if(lib == null) {
			trace("can't find library");
			return false;
		}
        Dl.error();

		_add_two = Dl.sym(lib, "add_two");
		if(_add_two == null) {
			trace("can't find add_two");
            Dl.close(lib);
			return false;
		}

		_fib_sum = Dl.sym(lib, "fib_sum");
		if(_fib_sum == null) {
			trace("can't find fib_sum");
            Dl.close(lib);
			return false;
		}

        return true;
    }

    public static function unload(): Void {
        Dl.close(lib);
    }

    public static function add_two(x: Int): Int {
        var xu: cpp.UInt64 = x;
        var y: cpp.UInt64 = untyped __cpp__("reinterpret_cast<uint64_t(*)(uint64_t)>({0})({1})", _add_two, xu);
        return y;
    }

    public static function fib_sum(times: Int): Int {
        var xu: cpp.SizeT = times;
        var y: cpp.UInt64 = untyped __cpp__("reinterpret_cast<uint64_t(*)(size_t)>({0})({1})", _fib_sum, xu);
        return y;
    }
}