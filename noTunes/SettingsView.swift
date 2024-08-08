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

// TODO: Fix replacement setting to also use URLs (like in documentation)

@available(macOS 10.15, *)
struct SettingsView: View {
    @State private var replacement: String = UserDefaults.standard.string(forKey: "replacement") ?? ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Replacement Application")
                .padding(.bottom, 5)

            HStack {
                Text(replacement.isEmpty ? "No application selected" : replacement)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color(NSColor.windowBackgroundColor))
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
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
                }
                .padding(.leading, 10)
            }
            .padding(.bottom, 20)
            
            LaunchAtLogin.Toggle()

            Spacer()
        }
        .frame(width: 400, height: 150)
        .padding()
    }
}
