//
//  SettingsWindowController.swift
//  noTunes
//
//  Created by Zein Hajj-Ali on 2024-08-08.
//  Copyright © 2024 Twisted Digital Ltd. All rights reserved.
//

import Cocoa
import SwiftUI

@available(macOS 10.15, *)
class SettingsWindowController: NSWindowController {

    convenience init() {
        let settingsView = SettingsView()
        let hostingController = NSHostingController(rootView: settingsView)
        let window = NSWindow(contentViewController: hostingController)
        
        self.init(window: window)
        
        window.title = "Settings"
        window.styleMask = [.titled, .closable, .miniaturizable]
        window.setFrame(NSRect(x: 0, y: 0, width: 300, height: 200), display: true)
        window.center()
    }
    
    override func showWindow(_ sender: Any?) {
        super.showWindow(sender)
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}
