function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
} // in x2

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
} // in out

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
} // x already declared as variable

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
} // in out

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
} // in out

function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
};

function isSubstring(searchString, subString) {
    return searchString.includes(subString)
}

// PHASE 2 JS LOOPING CONSTRUCTS

function fizzbuzz(array) {
    let newArr = [];

    array.forEach(ele => {
        if ((ele%3===0) ^ (ele%5===0)) {
            newArr.push(ele);
        }
    });
    return newArr;
}

function isprime(num) {
    if (num < 2) {return false;}

    for (let i=2; i < num; i++) {
        if (num % i === 0) {
            return false;
    }   }
    return true;
}

function sumOfNPrimes(num) {
    let sum = 0;
    let count = 0;
    let i = 2;

    while (count < num) {
        if (isprime(i)) {
            sum += i;
            count++;
        }
        i++;
    }
    return sum;
}
    