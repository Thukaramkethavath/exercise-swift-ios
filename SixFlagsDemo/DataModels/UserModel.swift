//
//  UserModel.swift
//  SixflagsBlogger
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import Foundation

class UserModel: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressModel
    let phone: String
    let website: String
    let company: Company
}

struct AddressModel: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

enum Rank: String {
    case mostEnagaging = "Most Engaging"
    case averageEnagaging = "Average Enagaging"
    case lowEnagaging = "Low Engaging"
}
