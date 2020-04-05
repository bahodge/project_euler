const square = x => x * x;

const sum = list => list.reduce((acc, x) => x + acc, 0);

const squareList = list => list.reduce((acc, x) => acc + square(x), 0);

const list = [...Array(101).keys()];

console.log(square(sum(list)) - squareList(list));
