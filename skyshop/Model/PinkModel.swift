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
    
    func addPink(name: String, hex:String, url: URL?) {
        
        var name:String = name
        var hex:String = hex
        
        if name == "" { name = "Unnamed Pink" }
        if hex == "" || hex == "000000" { hex = self.currentColor.hex }
        
        let existingHexValues = pinks.map({ (pink) -> String in return pink.hex })
        let existingPinkNames = pinks.map({ (pink) -> String in return pink.name })
        
        if url == nil {
            if existingHexValues.contains(hex) {
                
                let existingPink = self.pinks.first(where: { $0.hex == hex } )!
                self.pinks.removeAll(where: { $0.hex == hex })
                self.pinks.append(Pink(name: name, hex: existingPink.hex))

                
            } else if existingPinkNames.contains(name){
                
                let existingPink = self.pinks.first(where: { $0.name == name } )!
                self.pinks.removeAll(where: { $0.name == name })
                self.pinks.append(Pink(name: existingPink.name, hex: hex))
                
            } else if existingPinkNames.contains(name) && existingHexValues.contains(hex) {

                let existingPink = self.pinks.first(where: { $0.name == name && $0.hex == hex } )!
                self.pinks.removeAll(where: { $0.name == name && $0.hex == hex })
                self.pinks.append(Pink(name: existingPink.name, hex: existingPink.hex))
                
            } else {
                self.pinks.append(Pink(name: name, hex: hex))
            }
        } else {
            if existingHexValues.contains(hex) {
                
                let existingPink = self.pinks.first(where: { $0.hex == hex } )!
                self.pinks.removeAll(where: { $0.hex == hex })
                self.pinks.append(Pink(name: name, hex: existingPink.hex, imageURL: url))

                
            } else if existingPinkNames.contains(name){
                
                let existingPink = self.pinks.first(where: { $0.name == name } )!
                self.pinks.removeAll(where: { $0.name == name })
                self.pinks.append(Pink(name: existingPink.name, hex: hex, imageURL: url))
                
            } else if existingPinkNames.contains(name) && existingHexValues.contains(hex) {

                let existingPink = self.pinks.first(where: { $0.name == name && $0.hex == hex } )!
                self.pinks.removeAll(where: { $0.name == name && $0.hex == hex })
                self.pinks.append(Pink(name: existingPink.name, hex: existingPink.hex, imageURL: url))
                
            } else {
                self.pinks.append(Pink(name: name, hex: hex, imageURL: url))
            }
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
    
    func addToDocuments(name: String, image: UIImage) -> URL? {
        // get the documents directory url
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // choose a name for your image
        let fileName = "\(name).jpg"
        // create the destination file url to save your image
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        if let data = image.jpegData(compressionQuality:  1.0),
          !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                return fileURL
            } catch {
                print("error saving file:", error)
            }
        }
        return nil
    }
}
