//
//  UserRow.swift
//  FriendBook
//
//  Created by Igor Malyarov on 22.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct UserRow: View {
    var user: User
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "person")
            
            VStack(alignment: .leading, spacing: 6) {
                Text(user.name)
                Text(user.company)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .foregroundColor(user.isActive ? .primary : .secondary)
        }
    }
}


struct UserRow_Preview: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                UserRow(user: loadUsers()[item])
            }
        }
    }
}
