//
//  Transactions.swift
//  Cryato
//
//  Created by John Melody Me on 10/02/2023.
//

import Foundation

struct Transaction : Codable, Identifiable {
    public var id :String?
    public var transaction_id :String
    public var block_timestamp :Int64
    public var from :String
    public var to :String
    public var value :String
}

struct Transactions : Codable {
    public var data :[Transaction]?
}
