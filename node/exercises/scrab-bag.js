const colors = require('colors')
const quitCommand = require('../helpers/quitCommand')
const scrabbleLetters = require('../constants/scrabbleLetters')

const letters = Object.keys(scrabbleLetters)
let scrabBag = Object.assign(scrabbleLetters)

console.log('Enter the tiles that have already been played.'.green)

process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(input){
  if(input.indexOf('/') === 0) {
    quitCommand(input, process)
  } else {
    input = input.replace(/\W|\d/g, '').toUpperCase().split('')
    console.log(input)

    input.forEach(letter => {
      scrabBag[letter].count = scrabBag[letter].count - 1
    })

    let remainingLetters = {}

    letters.forEach(letter => {
      let count = scrabBag[letter].count;
      if(remainingLetters.hasOwnProperty(count)){
        remainingLetters[count].push(letter)
      } else {
        remainingLetters[count] = [letter]
      }
    })

    let remainingLetterKeys = Object.keys(remainingLetters)

    console.log('Letters remaining in the bag:'.green)
    remainingLetterKeys.forEach(key => {
      let currentLetters = []
      console.log(colors.green(key + ': ' + remainingLetters[key].join(', ')))
    })
    process.disconnect()
  }
})
