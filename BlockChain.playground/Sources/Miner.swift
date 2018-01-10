import Foundation

public class Miner {
    var name: String
    var ledger: [Transaction]
    
    public init(name: String) {
        self.name = name
        self.ledger = [Transaction]()
    }
    
    public func addTransactions(block: Block) {
        ledger.append(contentsOf: block.transactions)
    }
}

extension Miner: Equatable {
    public static func ==(lhs: Miner, rhs: Miner) -> Bool {
        return lhs.ledger == rhs.ledger && lhs.name == rhs.name
    }
}

extension Miner: Hashable {
    public var hashValue: Int {
        return hashOfLedger
    }
    
    private var hashOfLedger: Int {
        var hash = 0
        for transaction in ledger {
            hash = hash ^ transaction.hashValue
        }
        return hash
    }
}
