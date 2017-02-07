const colors = require('colors')
const quitCommand = require('../helpers/quitCommand')
let computerNumber;

function generateNumber(){
  computerNumber = Math.ceil(Math.random() * 100)
}

generateNumber();
console.log("Guess the number I'm thinking of!".green)

process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(input){
  if(input.indexOf('/') === 0) {
    quitCommand(input, process)
  } else {
    input = Number(input.replace(/\D/, ''))

    if(input === computerNumber){
      console.log('Congratulations! You guessed the right number!'.green)
      process.disconnect();
    } else if (input === NaN){
      console.log('Guesses must be a number!'.green)
    } else {
      console.log('Guess again!'.green)
    }
  }
})
