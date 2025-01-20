console.log("---");

const myInter = setInterval(() => console.log(1), 1000);
setTimeout(() => clearTimeout(myInter), 5000);

console.log("Test");
