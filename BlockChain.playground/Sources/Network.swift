import Foundation

public class Network {
    var miners: [Miner]
    
    public init() {
        miners = [Miner]()
    }
    
    public func addMiner(miner: Miner) {
        miners.append(miner)
    }
}
