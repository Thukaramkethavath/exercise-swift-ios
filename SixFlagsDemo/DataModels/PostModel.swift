//
//  PostModel.swift
//  SixflagsBlogger
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import Foundation

struct PostModel: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
