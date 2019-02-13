package;

// https://gist.github.com/ibilon/02e3e4e7f2c825444501a2e878e0ec7f

class Main {
	public static function main () {
        if(Sys.args().length != 1) {
            trace("Usage: testapp <path-to-library>");
            Sys.exit(0);
        }

        if(!MyLibrary.load(Sys.args()[0])) {
            Sys.exit(1);
        }

        trace("Adding two...");
        for(i in 0...10) {
            trace(i + " -> " + MyLibrary.add_two(i));
        }

        trace("Calculating the sum of the first 10 numbers in the Fibonacci sequence:");
        trace(MyLibrary.fib_sum(10));

        MyLibrary.unload();
	}
}