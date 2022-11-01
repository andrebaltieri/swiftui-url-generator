//
//  ContentView.swift
//  BaltaUrlHelper
//
//  Created by Andre Baltieri on 30/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var copied = false
    @State private var url = "https://go.balta.io/"
    @State private var campaign = "social-to-lp"
    @State private var content = "post-"
    @State private var medium = "social"
    @State private var social = "Discord"
    let socialNetworks = [
        "Discord",
        "WhatsApp",
        "Telegram",
        "Instagram",
        "Facebook",
        "LinkedIn",
        "GitHub",
        "YouTube"]
    
    var body: some View {
        VStack {
            Text("balta URL Helper")
            Form {
                TextField("Link", text: $url).keyboardType(.URL)
                TextField("Campanha", text: $campaign).keyboardType(.URL)
                TextField("Conteúdo", text: $content).keyboardType(.URL)
                TextField("Medium (Social)", text: $medium).keyboardType(.URL)
                Picker("Rede", selection: $social){
                    ForEach(socialNetworks, id: \.self) {
                        Text("\($0)")
                    }
                }
                Spacer()
                Text(url + "?utm_source=\(social)&utm_campaign=\(campaign)&utm_content=\(content)&utm_medium=\(medium)")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
            }.onChange(of: social) { newValue in
                copied = false
            }

            Label("Copiado para o clipboard", systemImage: "checkmark.circle")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .opacity(copied ? 1 : 0)
            
            Button("Copiar Link") {
                UIPasteboard.general.string = url + "?utm_source=\(social)&utm_campaign=\(campaign)&utm_content=\(content)&utm_medium=\(medium)"
                copied = true
            }.padding(10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
