//
//  DataModel.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import Foundation

class DataModel : ObservableObject {
    
    static let shared = DataModel()
    
    var pinksURL:URL
    var corePinks:Pinks = [
        Pink(name: "Pink Cascade", hex: "EFE6E1"),
        Pink(name: "Light Pink", hex: "EFE4E0"),
        Pink(name: "Ginger Jar", hex: "EDCBBF"),
        Pink(name: "Pink Joy", hex: "F6C8CA"),
        Pink(name: "Le Reve Pink", hex: "F6C0CE"),
        Pink(name: "Pink", hex: "F6B1C3"),
        Pink(name: "Fantasia Pink", hex: "F1D4DE"),
        Pink(name: "Exclusive Pink", hex: "F5B2C4"),
        Pink(name: "Petal Pink", hex: "F2C9C7"),
        Pink(name: "Pink Sherbert", hex: "F4A2CA"),
        Pink(name: "Pink Splendor", hex: "F598BD"),
        Pink(name: "Mountain Rose", hex: "F89CA7"),
        Pink(name: "Flesh Pink", hex: "F4BCA3"),
        Pink(name: "Dancing Salmon", hex: "F48F8D"),
        Pink(name: "Wild Ginseng", hex: "E6B8B0"),
        Pink(name: "Heather Mist", hex: "DEB19E"),
        Pink(name: "Pink Sham", hex: "F2C4BC"),
        Pink(name: "Dusty Rose", hex: "F4ABBC"),
        Pink(name: "Wild Pink", hex: "F879A4"),
        Pink(name: "Rose Cerise", hex: "FB99A8"),
        Pink(name: "Horizon Pink", hex: "F04E89"),
        Pink(name: "Carnation", hex: "FD768A"),
        Pink(name: "Fairy Tale Pink", hex: "D07B83"),
        Pink(name: "Pink Pompas", hex: "DE8990"),
        Pink(name: "Cabernet", hex: "CF576A"),
        Pink(name: "Begonia", hex: "FF668A"),
        Pink(name: "Wild Romance", hex: "F96A8D"),
        Pink(name: "Salmon", hex: "CD928C"),
        Pink(name: "Hot Cha Cha", hex: "FE604E"),
        Pink(name: "Oriantal Poppies", hex: "F56D57"),
        Pink(name: "Azalea", hex: "F45078"),
        Pink(name: "Rose Pink", hex: "D74262"),
        Pink(name: "Scalloped Coral", hex: "BB4E59"),
        Pink(name: "Bitteroot", hex: "F95259"),
        Pink(name: "Passion Rose", hex: "B53E5E"),
        Pink(name: "Paprika", hex: "D92D0F"),
        Pink(name: "Indian Summer", hex: "FF4339"),
        Pink(name: "Comfort Pink", hex: "B6686D"),
        Pink(name: "Pink Bleeding Heart", hex: "DD3A61"),
        Pink(name: "Rich Pink", hex: "A64281")
    ]
    var pinks:Pinks
    
    init(){
        let pinksFilename = "pinks"
        
        let fileManager = FileManager.default
        pinksURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(pinksFilename + ".json")
        
        if fileManager.fileExists(atPath: pinksURL.path) {
            do {
                let data = try Data(contentsOf: pinksURL)
                let decoder = JSONDecoder()
                pinks = try decoder.decode(Pinks.self, from: data)
            } catch {
                pinks = []
                print("Error writing: \(error)")
            }
        } else {
            pinks = corePinks
        }
    }
    
    func savePinks(pinks: Pinks) {
        let encoder = JSONEncoder()
        do {
            let pinksToSave = try encoder.encode(pinks)
            try pinksToSave.write(to: self.pinksURL)
        } catch  {
            print("Error writing: \(error)")
        }
    }
}
