//
//  UserPostsView.swift
//  SixFlagsDemo
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import SwiftUI

struct UserPostsView: View {
    
    var userId: Int
    @ObservedObject var postsViewModel = PostsViewModel()
    
    var body: some View {
        VStack {
            List(postsViewModel.userPosts) { post in
                Section {
                    Text(post.title).font(.title3).bold()
                    Text(post.body).font(.body)
                    NavigationLink(destination: UserCommentsView(post: post)) {
                        Text("Comments").foregroundColor(.blue)
                    }
                }
                
            }.navigationTitle("Posts")
        }
        .onAppear() {
            postsViewModel.fetchPostsForUser(id: userId)
        }
    }
}
