#[no_mangle]
pub extern "C" fn add_two(x: u64) -> u64 {
    x + 2
}

// from https://riptutorial.com/rust/example/21013/custom-iterator

struct Fibonacci(u64, u64);

impl Iterator for Fibonacci {
    type Item = u64;
    
    fn next(&mut self) -> Option<Self::Item> {
        let ret = self.0;
        self.0 = self.1;
        self.1 += ret;
        Some(ret)
    }
}

#[no_mangle]
pub extern "C" fn fib_sum(times: usize) -> u64 {
    Fibonacci(0, 1).take(times).sum()
}

#[cfg(test)]
mod tests {
    #[test]
    fn fib_sum_works() {
        use super::fib_sum;
        assert_eq!(fib_sum(10), 88);
    }
}