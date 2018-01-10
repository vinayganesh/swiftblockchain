import Foundation

// create transactions
let t1 = Transaction(coin: .ripple, number: 100, parties: ["Mike","Tim"])
let t2 = Transaction(coin: .liteCoin, number: 63, parties: ["Alex","Steph"])
let t3 = Transaction(coin: .digitalNote, number: 48, parties: ["Andre","Zaza"])
let t4 = Transaction(coin: .bitCoin, number: 2, parties: ["Kevin","Bill"])


// transactions are represented in blocks which are nothing
// but an array of transactions
let first = Block(previousHash: 0, transactions: [t1])
let second = Block(previousHash: first.hashValue, transactions: [t2, t3, t4])

// create a decentralized network
let network = Network()

// create a Miner named Steve
let steve = Miner(name: "Steve")

// add Steve to the decentralized network
network.addMiner(miner: steve)

// create a Miner named Mark
let mark = Miner(name: "Mark")

// add Mark to the decentralized network
network.addMiner(miner: mark)

// Steve adds transactions to his ledger through blocks
steve.addTransactions(block: first)
steve.addTransactions(block: second)

// Mark adds transactions to his ledger through blocks
mark.addTransactions(block: first)
mark.addTransactions(block: second)

// If anything changes in the transactions
// in Steve's ledger, Mark's hashValue
// will change too and thats when you will know
// that Steve has cheated
print(steve.hashValue)
print(mark.hashValue)

