//
//  UserDetail.swift
//  FriendBook
//
//  Created by Igor Malyarov on 22.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    @EnvironmentObject var userData: UserData
    var user: User
    
    var body: some View {
        List {
            UserSection(user: user)
            
            FriendsSection(user: user)
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(user.name)
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(0 ..< 2) { item in
            UserDetail(user: loadUsers()[item])
                .environmentObject(UserData())
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
