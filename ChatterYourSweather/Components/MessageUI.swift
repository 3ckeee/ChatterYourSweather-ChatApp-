//
//  MessageUI.swift
//  ChatterYourSweather
//
//  Created by Erik Kokinda on 02/10/2022.
//

import SwiftUI

struct MessageUI: View {
    var message: Message
    @State private var timeReceived = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ?
                                Color("Gray") : Color("Cyan"))
                    .cornerRadius(20)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                timeReceived.toggle()
            }
            
            if timeReceived {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 15)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 5)
    }
}

struct MessageUI_Previews: PreviewProvider {
    static var previews: some View {
        MessageUI(message: Message(id: "xyz123", text: "Message for my future self: You're awsome!", received: true, timestamp: Date()))
    }
}
