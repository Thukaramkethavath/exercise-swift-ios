//
//  UsersViewModel.swift
//  SixflagsBlogger
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import Foundation

class UsersViewModel: ObservableObject {
    
    @Published var allUsers = [UserModel]()
    var userCommentsMap = [String: Int]()
    var highestComments = 0
    var AvergaeComments = 0
    
    init() {
        loadAllComments()
    }
    
    func fetchUsers() {
        DispatchQueue.global(qos: .background).async {
            let data = Resource.users.data()
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.allUsers = users
                }
            } catch let error {
                // can be displayed to user
                print(error.localizedDescription)
            }
        }
    }
    
    func loadAllComments() {
        let data = Resource.comments.data()
        do {
             let comments = try JSONDecoder().decode([CommentsModel].self, from: data)
            for comment in comments {
                if var val = userCommentsMap[comment.email] {
                    userCommentsMap[comment.email]! = val+1
                } else {
                    userCommentsMap[comment.email] = 1
                }
            }
            
            highestComments = userCommentsMap.values.max() ?? 0
            AvergaeComments = highestComments / 2
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getRankForUser(id: String) -> Rank {
       
        guard let commentCount = userCommentsMap[id] else  {
            return Rank.lowEnagaging
        }
        
        if commentCount <= 0 {
            return Rank.lowEnagaging
        } else if(commentCount > 0 && commentCount <= AvergaeComments) {
            return Rank.averageEnagaging
        } else {
            return Rank.mostEnagaging
        }
    }
}

