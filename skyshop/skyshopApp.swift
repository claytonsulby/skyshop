//
//  skyshopApp.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import SwiftUI

@main
struct skyshopApp: App {
    
    var pinkModel = PinkModel.shared
    var audioModel = AudioModel.shared
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pinkModel)
                .environmentObject(audioModel)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                audioModel.playBackgroundMusic()
            case .inactive:
                pinkModel.savePinks()
            default:
                break
            }
        }
    }
    
}
