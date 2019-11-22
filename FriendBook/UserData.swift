//
//  UserData.swift
//  FriendBook
//
//  Created by Igor Malyarov on 22.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var users: [User] = []
}

func loadUsers() -> [User] {
    if let fileURL = Bundle.main.url(forResource: "friendface", withExtension: "json") {
        // we found the file in our bundle!
        
        if let fileContents = try? String(contentsOf: fileURL) {
            // we loaded the file into a string!
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let users = try? decoder.decode([User].self, from: fileContents.data(using: .utf8)!) {
                return users
            }
        }
    }
    fatalError()
}

