//
//  Acronym.swift
//  Acromine
//
//  Created by Shalinipriya Annadurai on 10/15/21.
//

import Foundation

struct Acronym: Codable {
    let sf: String?
    let lfs: [Abbreviation]?
}

struct Abbreviation: Codable {
    let lf: String?
    let freq, since: Int?
    let vars: [Abbreviation]?
}
typealias empty = [Acronym]
