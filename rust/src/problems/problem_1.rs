/*
Problem #1

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000

*/
fn solve(ceiling: i32) -> i32 {
    if ceiling < 1 {
        panic!("Cannot solve with ceiling: {}", ceiling);
    }

    let mut i = 0;
    let mut result: i32 = 0;
    while i < ceiling {
        if i % 3 == 0 || i % 5 == 0 {
            result += i;
        }
        i += 1;
    }

    result
}

pub fn exec() -> String {
    solve(1_000).to_string()
}

#[cfg(test)]
mod tests {
    #[test]
    fn sum_below_ten() {
        assert_eq!(23, super::solve(10));
    }
}
