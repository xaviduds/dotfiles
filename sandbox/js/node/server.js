const express = require("express");
const path = require("path");

const app = express();

const PORT = 8383;
const DATA = ["james"];

app.use(express.json());
app.use(express.static("./public"));

app.get("/", (req, res) => {
    res.send(`<body style="background:pink; color: blue;">
<h1>Data:</h1>
<p>${JSON.stringify(DATA)}</p>
</body>`);
});

app.get("/dashboard", (req, res) => {
    console.log("Great, dashboard stuff");
    res.send(`hi, im paul, this is the ${__filename} file`);
});

app.get("/createdindex", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./index.html"));
});

app.get("/api/data", (req, res) => {
    res.send(DATA);
});

app.post("/api/data", (req, res) => {
    const newEntry = req.body;
    DATA.push(newEntry.name);
    res.sendStatus(201);
});

app.delete("/api/data", (req, res) => {
    DATA.pop();
});

app.all("*", (req, res) => {
    res.status(404).send("Not found");
});

app.listen(PORT, () => console.log(`Server started at ${PORT}`));
