const fs = require("fs").promises;

async function readerr(pat) {
    try {
        const data = await fs.readFile(pat);
        console.log(data.toString());
    } catch (error) {
        console.log(error);
    }
}

readerr("./hello.ts");

async function writerr(pat, contents) {
    try {
        await fs.writeFile(pat, contents);
    } catch (error) {
        console.log(error);
    }
}

writerr("whatever/nodefswrite.txt", "hello file writting world");
