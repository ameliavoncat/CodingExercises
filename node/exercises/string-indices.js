const colors = require('colors')
const quitCommand = require('../helpers/quitCommand')

process.stdin.resume();
process.stdin.setEncoding('utf8');
console.log('Enter a string.'.green)
let stringEntered = false

process.stdin.on('data', function(input){
  if(input.indexOf('/') === 0) {
    quitCommand(input, process)
  } else {
    if(!stringEntered){
      input = input.replace(/\n/, '').replace(/[^a-zA-Z]/g, ' ').split(' ')

      for(let i = input.length -1; i >=0; i--){
        if (input[i] === ''){
          input.splice(i, 1)
        }
      }
      stringEntered = input
      console.log('Enter the index of the word to find.'.green)
    } else {
      input = Number(input.replace(/\n/, ''))

      if(isNaN(input)) {
        console.log('Index must be a number.'.green)
      } else {
        if(stringEntered.length >= input || input < 1){
          console.log(colors.green("Word " + input + " is:"))
          console.log(colors.green(stringEntered[input - 1]))
          process.disconnect()
        } else {
          console.log(colors.green("Word " + input + " is:"))
          console.log("''".green)
        }
      }
    }
  }
})
