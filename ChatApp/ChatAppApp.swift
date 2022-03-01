//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by simge on 1.03.2022.
//

import SwiftUI
import Firebase //**

@main
struct ChatAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
