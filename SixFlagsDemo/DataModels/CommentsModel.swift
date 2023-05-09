//
//  CommentsModel.swift
//  SixflagsBlogger
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import Foundation

struct CommentsModel: Codable, Identifiable {
    let postId: Int
    let email: String
    let name: String
    let body: String
    let id: Int
}
