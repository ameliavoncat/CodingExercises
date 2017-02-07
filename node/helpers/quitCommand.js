const quitCommand = (input, program, parent = false) => {
  input = input.replace(/\n/, '')

  if(input === "/q"){
    if(parent){
      program.exit();
    } else {
      program.disconnect();
    }
  }
}

module.exports = quitCommand
