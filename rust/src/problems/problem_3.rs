/*
  Problem #3

  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
*/
fn solve(target: i64) -> i64 {
    nth(target, 2)
}

fn nth(n: i64, factor: i64) -> i64 {
    if n == factor {
        return n;
    }

    match n % factor {
        0 => nth(n / factor, factor),
        _ => nth(n, factor + 1),
    }
}

pub fn exec() -> String {
    solve(600_851_475_143).to_string()
}

#[cfg(test)]
mod tests {
    #[test]
    fn returns_largest_prime_factor() {
        assert_eq!(29, super::solve(13195));
    }
}
