import chalk from "chalk";
import boxen from "boxen";

const greeting = chalk.blue("Hello", "World!", "Foo", "bar", "biz", "baz");
const boxenOptions = {
  padding: 1,
  margin: 1,
  borderStyle: "round",
  borderColor: "green",
  backgroundColor: "#555555",
};

const msgBox = boxen(greeting, boxenOptions);

console.log(msgBox);
