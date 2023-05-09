//
//  CommentsViewModel.swift
//  SixFlagsDemo
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import Foundation

class CommentsViewModel: ObservableObject {
    
    @Published var comments = [CommentsModel]()
    
    func fetchCommentsForPost(id: Int) {
        DispatchQueue.global(qos: .background).async {
            let data = Resource.comments.data()
            do {
                let comments = try JSONDecoder().decode([CommentsModel].self, from: data)
                let filtered = comments.filter() {
                    $0.postId == id
                }
                DispatchQueue.main.async {
                    self.comments = filtered
                }
                
            } catch let error {
                // can be displayed to user
                print(error.localizedDescription)
            }
        }
    }
}
