//
//  UserSection.swift
//  FriendBook
//
//  Created by Igor Malyarov on 22.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct UserSection: View {
    var user: User
    
    var body: some View {
        Section(header: Text("About".uppercased())) {
            VStack(alignment: .leading, spacing: 8) {
                Text(user.about)
                    .lineLimit(user.isActive ? 5 : 3)
                    .foregroundColor(user.isActive ? .primary : .secondary)
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Company:")
                        .frame(width: 90, alignment: .leading)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(user.company)
                        .foregroundColor(.systemTeal)
                }
                HStack(alignment: .firstTextBaseline) {
                    Text("Email:")
                        .frame(width: 90, alignment: .leading)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(user.email)
                }
                HStack(alignment: .firstTextBaseline) {
                    Text("Address:")
                        .frame(width: 90, alignment: .leading)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(user.address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Joined")
                        .frame(width: 90, alignment: .leading)
                    Text(user.registered.toString())
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Tags")
                        .frame(width: 90, alignment: .leading)
                        .foregroundColor(.secondary)
                    Text(user.tags.joined(separator: ", "))
                }
                .font(.subheadline)
            }
        }
    }
}

struct UserSection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                UserSection(user: loadUsers()[0])
            }
            .listStyle(GroupedListStyle())
        }
        .environment(\.colorScheme, .dark)
        .environment(\.sizeCategory, .extraLarge)
    }
}
