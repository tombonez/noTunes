//
//  AppDelegate.swift
//  noTunes
//
//  Created by Tom Taylor on 04/01/2017.
//  Copyright © 2017 Twisted Digital Ltd. All rights reserved.
//

import Cocoa
import ServiceManagement

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    @IBOutlet weak var startupMenu: NSMenuItem!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    @IBAction func startupClicked(_ sender: NSMenuItem) {
        let autoLaunch = (startupMenu.state != NSOnState)
        SMLoginItemSetEnabled("digital.twisted.noTunesHelper" as CFString, autoLaunch)
    }
    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    func statusBarButtonClicked(sender: NSStatusBarButton) {
        let event = NSApp.currentEvent!
        
        if event.type == NSEventType.rightMouseUp {
            statusItem.menu = statusMenu
            statusItem.popUpMenu(statusMenu)
            statusItem.menu = nil
        } else {
            if statusItem.image == NSImage(named: "StatusBarButtonImage") {
                self.appIsLaunched()
                statusItem.image = NSImage(named: "StatusBarButtonImageActive")
            } else {
                statusItem.image = NSImage(named: "StatusBarButtonImage")
            }
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.image = NSImage(named: "StatusBarButtonImageActive")
        
        if let button = statusItem.button {
            button.action = #selector(self.statusBarButtonClicked(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        self.appIsLaunched()
        self.createListener()
    }
    
    func createListener() {
        let workspaceNotificationCenter = NSWorkspace.shared().notificationCenter
        workspaceNotificationCenter.addObserver(self, selector: #selector(self.appWillLaunch(note:)), name: .NSWorkspaceWillLaunchApplication, object: nil)
    }
    
    func appIsLaunched() {
        let apps = NSWorkspace.shared().runningApplications
        for currentApp in apps.enumerated() {
            let runningApp = apps[currentApp.offset]
            
            if(runningApp.activationPolicy == .regular) {
                if(runningApp.localizedName == "iTunes") {
                    self.terminateProcessWith(Int(runningApp.processIdentifier), runningApp.localizedName!)
                }
            }
        }
    }
    
    func appWillLaunch(note:Notification) {
        if statusItem.image == NSImage(named: "StatusBarButtonImageActive") {
            if let processName:String = note.userInfo?["NSApplicationName"] as? String {
                if let processId = note.userInfo?["NSApplicationProcessIdentifier"] as? Int {
                    switch processName {
                        case "iTunes":
                            self.terminateProcessWith(processId, processName)
                        default:break
                    }
                }
            }
        }
    }
    
    func terminateProcessWith(_ processId:Int,_ processName:String) {
        let process = NSRunningApplication.init(processIdentifier: pid_t(processId))
        process?.forceTerminate()
    }
    
}
