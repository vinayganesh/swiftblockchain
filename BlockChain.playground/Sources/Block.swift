import Foundation

public class Block {
    var previousHash: Int
    var transactions: [Transaction]
    
    public init(previousHash: Int, transactions: [Transaction]) {
        self.previousHash = previousHash
        self.transactions = transactions
    }
}

extension Block: Equatable {
    public static func ==(lhs: Block, rhs: Block) -> Bool {
        return lhs.previousHash == rhs.previousHash && lhs.transactions == rhs.transactions
    }
}

extension Block: Hashable {
    public var hashValue: Int {
        return previousHash.hashValue ^ hashOfTransactions
    }
    
    private var hashOfTransactions: Int {
        var hash = 0
        for transaction in transactions {
            hash = hash ^ transaction.hashValue
        }
        return hash
    }
}
