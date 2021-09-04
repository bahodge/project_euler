use std::time::Instant;

pub struct Problem {
    name: String,
    problem_exec: fn() -> String,
}

impl Problem {
    pub fn new(name: &str, problem_exec: fn() -> String) -> Problem {
        Problem {
            name: String::from(name),
            problem_exec,
        }
    }

    pub fn exec(&self) -> String {
        (self.problem_exec)()
    }
}

pub struct Solver {
    problem: Problem,
}

impl Solver {
    pub fn new(problem: Problem) -> Solver {
        Solver { problem }
    }

    pub fn exec(&self) {
        let start = Instant::now();

        let result = self.problem.exec();
        let duration = start.elapsed();
        println!("{}: {}, time: {:?}", self.problem.name, result, duration);
    }
}
