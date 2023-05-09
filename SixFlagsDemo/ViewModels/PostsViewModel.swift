//
//  PostsViewModel.swift
//  SixFlagsDemo
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import Foundation

class PostsViewModel: ObservableObject {
    
    @Published var userPosts = [PostModel]()
    
    func fetchPostsForUser(id: Int) {
        DispatchQueue.global(qos: .background).async {
            let data = Resource.posts.data()
            do {
                let posts = try JSONDecoder().decode([PostModel].self, from: data)
                let filtered = posts.filter() {
                    $0.userId == id
                }
                DispatchQueue.main.async {
                    self.userPosts = filtered
                }
            } catch let error {
                // can be displayed to user
                print(error.localizedDescription)
            }
        }
    }
}
