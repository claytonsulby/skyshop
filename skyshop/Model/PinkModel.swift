//
//  ColorViewModel.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import Foundation
import SwiftUI

class PinkModel : ObservableObject {
    
    static let shared = PinkModel()
    
    @Published var currentColor:Color
    
    @Published var pinks:Pinks
    let dataModel:DataModel
    
    init() {
        
        dataModel = DataModel.shared
        pinks = dataModel.pinks
        currentColor = .pink
    }
    
    func addPink(name: String, hex:String) {
        
        var name:String = name
        var hex:String = hex
        
        if name == "" {
            name = "Unnamed Pink"
        }
        
        if hex == "" {
            hex = "000000"
        }
        
        let hexs = pinks.map({ (pink) -> String in
            return pink.hex
        })
        
        let names = pinks.map({ (pink) -> String in
            return pink.name
        })
        
        if hexs.contains(hex) {
            
            let index = self.pinks.firstIndex(where: { $0.hex == hex })!
            self.pinks[index].newHex(hex)
            
        } else if names.contains(name){

            let index = self.pinks.firstIndex(where: { $0.name == name })!
            self.pinks[index].newName(name)
            
        } else if names.contains(name) && hexs.contains(hex) {
            //do nothing
        } else {
            self.pinks.append(Pink(name: name, hex: hex))
        }
    }
    
    func isPink(_ hex:String) -> Bool {
        
        var hex:String = hex
        
        if hex == "" {
            hex = "000000"
        }
        
        let hexx = hex as NSString
        
        let red = Int(UInt8(hexx.substring(with: NSRange(location: 0, length: 2)), radix: 16) ?? 00)
        let green = Int(UInt8(hexx.substring(with: NSRange(location: 2, length: 2)), radix: 16) ?? 00)
        let blue = Int(UInt8(hexx.substring(with: NSRange(location: 4, length: 2)), radix: 16) ?? 00)
        
        if red < 255 && blue < 255 {
            return false
        } else {
            return true
        }
    }
    
    func deletePink(_ pink:Pink) {
        if let index = self.pinks.firstIndex(where: { $0.hex == pink.hex }) {
            self.pinks.remove(at: index)
        }
    }
    
    func savePinks() {
        dataModel.savePinks(pinks: self.pinks)
    }
    
    func resetPinks() {
        self.pinks = dataModel.corePinks
    }
}
