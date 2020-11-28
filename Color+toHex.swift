//
//  Color+toHex.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/27/20.
//

import Foundation
import SwiftUI
import UIKit

extension Color {
    func toHex(color: Color) -> String {
        
        let colorString = "\(color)"
        let colorArray: [String] = colorString.components(separatedBy: " ")
        
        if colorArray.count > 1 {
            var r: CGFloat = CGFloat((Float(colorArray[1]) ?? 1))
            var g: CGFloat = CGFloat((Float(colorArray[2]) ?? 1))
            var b: CGFloat = CGFloat((Float(colorArray[3]) ?? 1))
            
            if (r < 0.0) {r = 0.0}
            if (g < 0.0) {g = 0.0}
            if (b < 0.0) {b = 0.0}
            
            if (r > 1.0) {r = 1.0}
            if (g > 1.0) {g = 1.0}
            if (b > 1.0) {b = 1.0}
            
            // Update hex
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format: "%06X", rgb)
        }
        
        return "FFFFFF"
        
    }
    
    var hex:String {
        let colorString = "\(self)"
        let colorArray: [String] = colorString.components(separatedBy: " ")
        
        if colorArray.count > 1 {
            var r: CGFloat = CGFloat((Float(colorArray[1]) ?? 1))
            var g: CGFloat = CGFloat((Float(colorArray[2]) ?? 1))
            var b: CGFloat = CGFloat((Float(colorArray[3]) ?? 1))
            
            if (r < 0.0) {r = 0.0}
            if (g < 0.0) {g = 0.0}
            if (b < 0.0) {b = 0.0}
            
            if (r > 1.0) {r = 1.0}
            if (g > 1.0) {g = 1.0}
            if (b > 1.0) {b = 1.0}
            
            // Update hex
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format: "%06X", rgb)
        }
        
        return "000000"
    }
    
}
