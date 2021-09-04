/*
    Problem #5

    2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

    What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

fn solve(floor: i32, ceiling: i32) -> i32 {
    let mut factors = find_primes(ceiling);

    for v in floor..ceiling {
        let prime_factors = prime_factors(v);
        factors = intersect_vectors(factors, prime_factors)
    }

    factors.into_iter().fold(floor, |acc, value| acc * value)
}

fn is_prime(target: i32) -> bool {
    if target <= 1 {
        return false;
    }

    for v in 2..target {
        if target % v == 0 {
            return false;
        }
    }

    true
}

fn find_primes(target: i32) -> Vec<i32> {
    let mut primes: Vec<i32> = vec![];

    for value in 2..target {
        if is_prime(value) {
            primes.push(value)
        }
    }

    primes
}

fn prime_factors(target: i32) -> Vec<i32> {
    let mut factors: Vec<i32> = Vec::new();

    let primes = find_primes(target);
    for prime in primes {
        let mut num = target;
        while num % prime == 0 {
            factors.push(prime);
            num = num / prime;
        }
    }

    return factors;
}

fn intersect_vectors(mut left: Vec<i32>, mut right: Vec<i32>) -> Vec<i32> {
    for value in &left {
        if right.contains(value) {
            let idx = right.iter().position(|x| *x == *value).expect("not found");

            right.remove(idx);
        }
    }

    left.append(&mut right);
    return left;
}

pub fn exec() -> String {
    solve(1, 20).to_string()
}

#[cfg(test)]
mod tests {
    #[test]
    fn smallest_divisible_number() {
        assert_eq!(2520, super::solve(1, 10));
    }
}
