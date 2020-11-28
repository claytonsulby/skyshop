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
    var description:String = ""
    
    var color:Color {
        Color.init(hex: self.hex)
    }
    
    mutating func newName(_ name: String) {
        self.name = name
    }
    
    mutating func newHex(_ hex: String) {
        self.hex = hex
    }
}
