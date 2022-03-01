//
//  TitleRow.swift
//  ChatApp
//
//  Created by simge on 1.03.2022.
//

import SwiftUI

struct TitleRow: View {
    
    var name = "Joey 🍕"
    var imageURL = URL(string:"https://i.pinimg.com/originals/57/05/4a/57054a5772b03417021e8ec85a43440c.jpg")
    
    
    var body: some View {
        HStack(spacing:20){
            AsyncImage(url:imageURL){ image in
                image
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            
            VStack(alignment:.leading){
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading) //*
            
            Image(systemName: "video.fill")
                .foregroundColor(.black)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
            Image(systemName: "phone.fill")
                .foregroundColor(.black)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}


struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Green")) //from assets color
    }
}
