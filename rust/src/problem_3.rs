use std::time::Instant;

fn nth(n: i64, factor: i64) -> i64 {
    if n == factor {
        return n;
    }

    match n % factor {
        0 => nth(n / factor, factor),
        _ => nth(n, factor + 1),
    }
}

pub fn solve() {
    let start = Instant::now();

    /*
      Problem #3

      The prime factors of 13195 are 5, 7, 13 and 29.

      What is the largest prime factor of the number 600851475143 ?
    */

    const TARGET: i64 = 600_851_475_143;

    let result = nth(TARGET, 2);

    let duration = start.elapsed();
    println!("problem_3: {}, time: {:?}", result, duration);
}
