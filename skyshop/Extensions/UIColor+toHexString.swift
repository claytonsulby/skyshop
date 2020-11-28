//
//  UIColor+toHexString.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/27/20.
//

import Foundation
import UIKit

extension UIColor {
      func toHexString() -> String {
          var r:CGFloat = 0
          var g:CGFloat = 0
          var b:CGFloat = 0
          var a:CGFloat = 0

          getRed(&r, green: &g, blue: &b, alpha: &a)

          let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

          return String(format:"%06x", rgb)
      }
    
    var hex:String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"%06x", rgb)
    }
    
  }
