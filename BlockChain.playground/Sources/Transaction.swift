import Foundation

public class Transaction {
    var coin: Coin
    var number: Int
    var parties: [String]
    
    public init(coin: Coin, number: Int, parties: [String]) {
        self.coin = coin
        self.number = number
        self.parties = parties
    }
}

extension Transaction: Equatable {
    public static func ==(lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.coin == rhs.coin && lhs.number == rhs.number && lhs.parties == rhs.parties
    }
}

extension Transaction: Hashable {
    public var hashValue: Int {
        return coin.hashValue ^ number.hashValue ^ hashOfParties
    }
    
    private var hashOfParties: Int {
        var hash = 0
        for party in parties {
            hash = hash ^ party.hashValue
        }
        return hash
    }
}
