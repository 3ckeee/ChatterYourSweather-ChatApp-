//
//  ContentView.swift
//  ChatterYourSweather
//
//  Created by Erik Kokinda on 01/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var messageManager = MessageManager()
    
  
    
    var body: some View {
        VStack {
            VStack {
                TopTile()
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messageManager.messages, id: \.id) { message in
                            MessageUI(message: message)
                        }
                    }
                    .padding(.top, 12)
                    .background(.white)
                    .cornerRadius(18, corners: [.topLeft, .topRight])
                    .onChange(of: messageManager.lastMessageId)  {
                        id in  withAnimation {proxy.scrollTo(id, anchor: .bottom)
                        }
                    }}
            }
            .background(Color("Cyan"))
             
            
            TextFieldUI()
                .environmentObject(messageManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
