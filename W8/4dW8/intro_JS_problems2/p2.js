// PHASE 1

function titleize(names, cb) {
    let new_names = names.map( ele => `Mx. ${ele} Jingleheimer Schmidt`);
    cb(new_names);
};    

titleize(['Moustafa', 'Mous', 'Jabroni'], function(names) {
    names.forEach(name => console.log(name));
});

// PHASE 2

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
};

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRR!!!`)
};

Elephant.prototype.grow = function() {
    this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
};

Elephant.prototype.play = function() {
    randomtrick = function(tricks) {
        let max = tricks.length;
        let index = Math.floor(Math.random() * max);
        return tricks[index];
    }
    console.log( `${this.name} is ${randomtrick(this.tricks)}`);
};

// PHASE 3

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];


Elephant.paradeHelper = function(elephant) {
    console.log( `${elephant.name} is trotting by!`);
}

herd.forEach(elephant => {
    Elephant.paradeHelper(elephant);
});

// PHASE 4

bfastOrder = function(item) {
    bfastOrder + ``
}