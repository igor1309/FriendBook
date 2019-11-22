//
//  ContentView.swift
//  FriendBook
//
//  Created by Igor Malyarov on 22.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//
//  Challenge - a free Hacking with Swift tutorial
//  https://www.hackingwithswift.com/guide/ios-swiftui/5/3/challenge
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.users) { user in
                    //                    NavigationLink(destination: UserDetailByID(id: user.id)) {
                    NavigationLink(destination: UserDetail(user: user)) {
                        UserRow(user: user)
                    }
                }
            }
            .onAppear(perform: loadUsers)
            .navigationBarTitle("Community")
        }
    }
    
    func loadUsers() {
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let decodedResponse = try? decoder.decode([User].self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.userData.users = decodedResponse
                    }
                    // everything is good, so we can exit
                    return
                } else {
                    print("error decoding data")
                }
            }
            // if we're still here it means there was a problem
            let httpResponse = response as? HTTPURLResponse
            print("statusCode: \(String(describing: httpResponse?.statusCode))")
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
        return
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
