//
//  UserDetailsView.swift
//  SixFlagsDemo
//
//  Created by Thukaram Kethavath on 5/7/23.
//

import SwiftUI

struct UserDetailsView: View {
    var user: UserModel
    
    var body: some View {
        VStack {
            Text(user.name).font(.largeTitle)
            List {
                Section() {
                    NavigationLink(destination: UserPostsView(userId: user.id)) {
                        Text("All Posts").foregroundColor(.blue)
                    }
                }
                
                Section() {
                    Text("Personal Info").font(.title)
                    Text("Username: \(user.username)")
                    Text("Email: \(user.email)")
                    Text("Phone: \(user.phone)")
                    Text(.init(user.website))
                }
              
                Section() {
                    Text("Org Info").font(.title)
                    Text("Name: \(user.company.name)").font(.title3)
                    Text("Desc: \(user.company.catchPhrase)").font(.title3)
                    Text("BS: \(user.company.bs)").font(.title3)
                    Text("Phone: \(user.phone)").font(.title3)
                }
                
                Section() {
                    Text("Address").font(.title)
                    Text("Street: \(user.address.street)").font(.title3)
                    Text("Suite: \(user.address.suite)").font(.title3)
                    Text("City: \(user.address.city)").font(.title3)
                    Text("Zip: \(user.address.zipcode)").font(.title3)
                    Text("Geo: \(user.address.geo.lat), \(user.address.geo.lng)").font(.title3)
                }
            }
        }
    }
}
