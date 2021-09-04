mod common;
mod problems;

use problems::*;

use common::{Problem, Solver};

fn main() {
    let mut solvers: Vec<Solver> = Vec::new();
    let problem_1 = Problem::new("problem_1", problem_1::exec);
    let problem_2 = Problem::new("problem_2", problem_2::exec);
    let problem_3 = Problem::new("problem_3", problem_3::exec);
    let problem_4 = Problem::new("problem_4", problem_4::exec);
    let problem_5 = Problem::new("problem_5", problem_5::exec);

    solvers.push(Solver::new(problem_1));
    solvers.push(Solver::new(problem_2));
    solvers.push(Solver::new(problem_3));
    solvers.push(Solver::new(problem_4));
    solvers.push(Solver::new(problem_5));

    for solver in solvers.into_iter() {
        solver.exec()
    }
}
