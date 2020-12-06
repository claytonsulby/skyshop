//
//  Pink.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import Foundation
import SwiftUI

typealias Pinks = [Pink]

struct Pink : Identifiable, Codable, Equatable {
    
    var id:String { self.hex }
    var name:String
    var hex:String
    var imageURL:URL?
    
    var color:Color {
        Color.init(hex: self.hex)
    }
    
    mutating func newName(_ name: String) { //FIXME: not updating
        self.name = name
    }
    
    mutating func newHex(_ hex: String) { //FIXME: not updating
        self.hex = hex
    }
}
