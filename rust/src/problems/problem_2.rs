/*
Problem #2

Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

*/
fn solve(target: i32) -> i32 {
    let mut result: i32 = 0;

    let mut f1: i32 = 1;
    let mut f2: i32 = 1;

    loop {
        let current = f1 + f2;
        if current > target {
            break;
        }

        if current % 2 == 0 {
            result += current;
        }

        f1 = f2;
        f2 = current;
    }

    result
}

pub fn exec() -> String {
    solve(4_000_000).to_string()
}

#[cfg(test)]
mod tests {
    #[test]
    fn sums_only_evens() {
        assert_eq!(10, super::solve(20));
    }
}
