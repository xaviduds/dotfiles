const TicketManager = require("./eventEmitter.ts");

const ticketManager = new TicketManager(10);

ticketManager.on("buy", () => {
  console.log("Someone bought a ticket!");
});
ticketManager.once("buy", () => {
  console.log("this only runs once!");
});

ticketManager.buy("test@email.com", 20);
ticketManager.buy("fso@email.com", 23);
