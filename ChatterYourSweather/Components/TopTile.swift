//
//  TopTile.swift
//  ChatterYourSweather
//
//  Created by Erik Kokinda on 02/10/2022.
//

import SwiftUI

struct TopTile: View {
    
    var imageUrl = URL (string:"https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80")
    var name = "Jane Doe"
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(15)
        }
        .padding()
    }
}

struct TopTile_Previews: PreviewProvider {
    static var previews: some View {
        TopTile()
            .background(Color("Cyan"))
    }
}
