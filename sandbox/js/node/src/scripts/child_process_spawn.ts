const { spawn } = require("child_process");

const ls = spawn("ls", ["-l"]);

ls.stderr.on("data", (data) => {
  console.log(`Error: ${data}`);
});
ls.stdout.on("data", (data) => {
  console.log(`Output: ${data}`);
});

ls.on("close", (code) => {
  console.log(`Process exited with code ${code}`);
});
