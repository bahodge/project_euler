use std::time::Instant;

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

pub fn solve() {
    let start = Instant::now();

    /*
      Problem #4

      A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

      Find the largest palindrome made from the product of two 3-digit numbers.
    */

    let mut result: i32 = 0;

    for i in (100..999).rev() {
        for j in (100..999).rev() {
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

    let duration = start.elapsed();
    println!("problem_4: {}, time: {:?}", result, duration);
}
