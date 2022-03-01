//
//  ContentView.swift
//  ChatApp
//
//  Created by simge on 1.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                //automatically scroll
                ScrollViewReader{proxy in
                    ScrollView{
                        ForEach(messagesManager.messages , id:\.id){ message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top , 10)
                    .background(Color("Background"))
                    .onChange(of: messagesManager.lastMessageId) {id in
                        withAnimation{
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("Green"))
            
            MessageField()
                .environmentObject(messagesManager)
                .background(Color("Background"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
