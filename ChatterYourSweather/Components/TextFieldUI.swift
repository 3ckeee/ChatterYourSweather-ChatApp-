//
//  TextFieldUI.swift
//  ChatterYourSweather
//
//  Created by Erik Kokinda on 02/10/2022.
//

import SwiftUI

struct TextFieldUI: View {
    @EnvironmentObject var messageManager: MessageManager
    @State private var message = ""
    var body: some View {
        HStack {
            CustomField(placeholder: Text("You can type here"), text: $message)
                .frame(height: 52)
                .disableAutocorrection(true)
            
            Button {
                messageManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(25)
                    .background(Color("Cyan"))
                    .cornerRadius(22)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 15)
        .background(Color("Gray"))
        .cornerRadius(28)
        .padding(20)
    }
}

struct TextFieldUI_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldUI()
            .environmentObject(MessageManager())
    }
}


struct CustomField: View {
    var placeholder: Text
    @Binding var text: String
    
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.7)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
