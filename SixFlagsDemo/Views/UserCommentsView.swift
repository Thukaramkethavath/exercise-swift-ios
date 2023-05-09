//
//  UserCommentsView.swift
//  SixFlagsDemo
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import SwiftUI

struct UserCommentsView: View {
    
    var post: PostModel
    @ObservedObject var commentsViewModel = CommentsViewModel()
    
    var body: some View {
        VStack {
            Text(post.title)
                .font(.largeTitle)
                .bold()
            List(commentsViewModel.comments) { comment in
                Section {
                    Text("Name: \(comment.name)").bold()
                    Text("Email: \(comment.email)")
                    Text(comment.body)
                }
            }
        }
            .onAppear() {
                commentsViewModel.fetchCommentsForPost(id: post.id)
            }
    }
}
