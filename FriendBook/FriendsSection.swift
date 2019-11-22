//
//  FriendsSection.swift
//  FriendBook
//
//  Created by Igor Malyarov on 22.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct FriendsSection: View {
    @EnvironmentObject var userData: UserData
    var user: User
    
    var body: some View {
        Section(header: Text("Friends".uppercased())) {
            if user.isActive {
                ForEach(user.friends) { friend in
                    NavigationLink(destination: UserDetail(user: self.userData.users.first(where: { $0.id == friend.id })!)) {
                        UserRow(user: self.userData.users.first(where: { $0.id == friend.id })!)
                    }
                }
            } else {
                Text("Can't show friends for inactive user.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

struct FriendsSection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ForEach(0 ..< 2) { item in
                    FriendsSection(user: loadUsers()[item])
                }
            }
            .listStyle(GroupedListStyle())
        }
        .environmentObject(UserData())
        .environment(\.colorScheme, .dark)
        .environment(\.sizeCategory, .extraLarge)
    }
}
