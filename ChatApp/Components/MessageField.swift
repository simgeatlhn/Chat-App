//
//  MessageField.swift
//  ChatApp
//
//  Created by simge on 1.03.2022.
//

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var messagesManager : MessagesManager
    @State private var message = ""
    
    var body: some View {
        
        HStack{
            CustomTextField(placeholder: Text("Enter your message.."), text:  $message)
            
            Button{
                messagesManager.sendMessage(text: message)
                message = ""
            }label:{
                Image(systemName: "arrow.up.circle.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.black)
                    .cornerRadius(50)
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color("Green"))
        .cornerRadius(20)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField:View{
    var placeholder : Text
    @Binding var text : String
    var editingChanged : (Bool) -> () = { _ in}
    var commit : () -> () = { }
    
    var body : some View {
        ZStack(alignment:.leading){
            if text.isEmpty{
                placeholder
                    .opacity(0.5)
            }
            TextField("",text:$text,onEditingChanged: editingChanged , onCommit: commit)
        }
    }
}
