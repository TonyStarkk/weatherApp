//
//  Main.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 23/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}

class MainWindow: NSWindow, NSApplicationDelegate, NSWindowDelegate {
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: false)
            self.contentView!.wantsLayer = true;/*this can and is set in the view*/
//            self.backgroundColor = NSColor.lightGray
            self.isOpaque = false
            self.title = "Weather App"
            self.makeKeyAndOrderFront(nil)//moves the window to the front
            self.makeMain()//makes it the apps main menu?
            //self.appearance = NSAppearance(named: NSAppearanceNameVibrantDark)
            self.titlebarAppearsTransparent = true
            self.center()
        
            self.delegate = self
            
            let visualEffectView = NSVisualEffectView(frame: NSMakeRect(0, 0, contentRect.width, contentRect.height))
            visualEffectView.material = NSVisualEffectView.Material.dark//Dark,MediumLight,PopOver,UltraDark,AppearanceBased,Titlebar,Menu
            visualEffectView.state = NSVisualEffectView.State.active
        
            
            self.contentView?.addSubview(visualEffectView)
        }
}
