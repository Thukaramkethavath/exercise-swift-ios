//
//  UsersView.swift
//  SixFlagsDemo
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import SwiftUI

struct UsersView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List(usersViewModel.allUsers) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    UserDetailRow(user: user, viewModel: usersViewModel).foregroundColor(.blue)
                }
            }
            .navigationBarTitle("Users")
            .onAppear() {
                usersViewModel.fetchUsers()
            }
        }
    }
}

struct UserDetailRow: View {
    var user: UserModel
    var viewModel: UsersViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(user.name)
                Text("Org: \(user.company.name)").font(.subheadline).foregroundColor(.gray)
                Text("City: \(user.address.city)").font(.subheadline).foregroundColor(.gray)
                Text("Rank: \(viewModel.getRankForUser(id: user.email).rawValue)").font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            
        }
    }
}
