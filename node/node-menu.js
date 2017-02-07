const colors = require('colors')
const quitCommand = require('./helpers/quitCommand')
const menuOptions = require('./constants/menuOptions')
const optionKeys = Object.keys(menuOptions)

function printMenu(){
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  console.log("Welcome to Node Coding Exercises!".magenta)
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)

  console.log("Menu:".green)
  optionKeys.forEach(option => {
    console.log( colors.green(option + ': ' + menuOptions[option].name + '.'))
  })

  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  console.log("Enter the number of the program to run or /q to quit.".magenta)
  console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
}

printMenu()
process.stdin.resume()
process.stdin.setEncoding('utf8')
const spawn = require('child_process').spawn
let program = {}
let showMenu = true
let waitingForEnter = false

process.stdin.on('data', function(input){
    if(waitingForEnter){
        waitingForEnter = false
        showMenu = true
        printMenu()
    } else {
      input = input.replace(/\n/, '')

      if(showMenu){
        if(input.indexOf('/') === 0) {
          quitCommand(input, process, true)
        } else {
          switch(input){
            case 'menu':
              printMenu()
              break;
            default:
              if(optionKeys.includes(input)){
                program.path = menuOptions[input].path
                program.name = menuOptions[input].name
              } else {
                console.log("Please enter a valid number or enter 'menu' for options.".magenta)
              }
            }
        }

        if(program.path){
          program.process = spawn('node', [program.path], { stdio: ['inherit', 'inherit', 'inherit', 'ipc'] })
          console.log(colors.magenta('Starting ' + program.name + '.'))
          console.log("Enter /q to return to the menu.".magenta)
          showMenu = false
          process.stdin.pause()

          program.process.on('disconnect', function(message){
            console.log('Returning to Menu.'.magenta)
            program.process.kill()
            program = {}
            waitingForEnter = true
            console.log('Hit any key to continue.')
            process.stdin.resume()
          })
        }
      }
    }
})

process.on('exit', function(code){
  console.log('Exiting Node Coding Exercises Menu.'.red)
})
