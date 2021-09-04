/*
Problem #4

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/
fn solve(floor: i32, ceiling: i32) -> i32 {
    let mut result: i32 = 0;

    for i in (floor..=ceiling).rev() {
        for j in (floor..=ceiling).rev() {
            let product = i * j;
            let s = String::from(product.to_string());
            if product > result && is_palindrome(&s) {
                result = product;
                break;
            } else if result > product {
                break;
            }
        }
    }

    result
}

fn is_palindrome(phrase: &str) -> bool {
    if phrase.len() == 0 || phrase.len() == 1 {
        return true;
    }

    for (idx, left) in phrase.chars().enumerate() {
        if idx < phrase.len() / 2 {
            let right = phrase.chars().nth(phrase.len() - idx - 1).unwrap();

            if left != right {
                return false;
            }
        }
    }

    true
}

pub fn exec() -> String {
    solve(100, 999).to_string()
}

#[cfg(test)]
mod tests {
    #[test]
    fn returns_the_largest_palindromic_number() {
        assert_eq!(9009, super::solve(10, 99));
    }
}
