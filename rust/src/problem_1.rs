use std::time::Instant;

pub fn solve() {
    let start = Instant::now();

    /*
    Problem #1

    If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

    Find the sum of all the multiples of 3 or 5 below 1000

    */

    let mut i = 0;
    let mut result: i32 = 0;
    while i < 1_000 {
        if i % 3 == 0 || i % 5 == 0 {
            result += i;
        }
        i += 1;
    }

    let duration = start.elapsed();
    println!("problem_1: {}, time: {:?}", result, duration);
}
