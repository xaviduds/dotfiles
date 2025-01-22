const { EventEmitter } = require("events");

const eventEmitter = new EventEmitter();
eventEmitter.emit("My first event!");

class TicketManager extends EventEmitter {
  constructor(supply: number) {
    super();
    this.supply = supply;
  }
  buy(email: string, price: number) {
    this.supply--;
    this.emit("buy", email, price, Date.now());
  }
}

module.exports = TicketManager;
