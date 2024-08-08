//
//  SettingsView.swift
//  noTunes
//
//  Created by Zein Hajj-Ali on 2024-08-08.
//  Copyright © 2024 Twisted Digital Ltd. All rights reserved.
//

import SwiftUI
import AppKit
import LaunchAtLogin

@available(macOS 10.15, *)
struct SettingsView: View {
    @State private var replacement: String = UserDefaults.standard.string(forKey: "replacement") ?? ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Replacement Application or URL")
                .padding(.bottom, 5)
            
            HStack {
                TextField("Enter application path or URL", text: $replacement, onCommit: {
                    UserDefaults.standard.set(replacement, forKey: "replacement")
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    let panel = NSOpenPanel()
                    panel.title = "Select a Replacement Application"
                    panel.allowedFileTypes = ["app"]
                    panel.allowsMultipleSelection = false
                    panel.canChooseDirectories = false
                    panel.canChooseFiles = true
                    
                    if panel.runModal() == .OK {
                        if let url = panel.url {
                            replacement = url.path
                            UserDefaults.standard.set(replacement, forKey: "replacement")
                        }
                    }
                }) {
                    Text("Browse...")
                        .frame(width: 60)
                }
                .padding(.leading, 5)
                
                
                Button(action: {
                    UserDefaults.standard.removeObject(forKey: "replacement")
                    replacement = ""
                }) {
                    Text("Reset")
                        .frame(width: 60)
                }
                .padding(.leading, 5)
            }
            .padding(.bottom, 20)
            
            LaunchAtLogin.Toggle()

            Spacer()
        }
        .frame(width: 400, height: 150)
        .padding()
    }
}

@available(macOS 10.15, *)
#Preview {
    SettingsView()
}
