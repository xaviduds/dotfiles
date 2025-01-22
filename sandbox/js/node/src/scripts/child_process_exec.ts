const { exec } = require("child_process");

exec("ls -l", (error, stdout, stderr) => {
  if (error) {
    console.log(error);
  }
  if (stderr) {
    console.log(stderr);
  }
  console.log(`Stdout:\n${stdout}`);
});
