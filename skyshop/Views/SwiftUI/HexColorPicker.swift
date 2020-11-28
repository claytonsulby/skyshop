//
//  HexColorPicker.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import SwiftUI

struct HexColorPicker: View {
    
    @EnvironmentObject var pinkModel:PinkModel
    
    @State var drawSwiftUIColor: Color
    var supportsOpacity:Bool
    var label:String
    
    @State private var drawOpacity: Double = 1.0
    @State private var drawUIColor: UIColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    @Binding var drawHexNumber: String
    
    
    var body: some View {
        ColorPicker(label, selection: $drawSwiftUIColor, supportsOpacity: supportsOpacity)
            .onChange(of: drawSwiftUIColor) { newValue in
                getColorsFromPicker(pickerColor: newValue)
                
            }
    }
    
    
    func getColorsFromPicker(pickerColor: Color) {
        
        let colorString = "\(pickerColor)"
        let colorArray: [String] = colorString.components(separatedBy: " ")
        
        if colorArray.count > 1 {
            var r: CGFloat = CGFloat((Float(colorArray[1]) ?? 1))
            var g: CGFloat = CGFloat((Float(colorArray[2]) ?? 1))
            var b: CGFloat = CGFloat((Float(colorArray[3]) ?? 1))
            let alpha: CGFloat = CGFloat((Float(colorArray[4]) ?? 1))
            
            if (r < 0.0) {r = 0.0}
            if (g < 0.0) {g = 0.0}
            if (b < 0.0) {b = 0.0}
            
            if (r > 1.0) {r = 1.0}
            if (g > 1.0) {g = 1.0}
            if (b > 1.0) {b = 1.0}
            
            // Update UIColor
            drawUIColor = UIColor(red: r, green: g, blue: b, alpha: alpha)
            // Update Opacity
            drawOpacity = Double(alpha)
            
            // Update hex
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            drawHexNumber = String(format: "%06X", rgb)
        }
    }
    
    
    func resetColorPickerWithUIColor() {
        let color: UIColor = drawUIColor
        let r: Double = Double(color.rgba.red)
        let g: Double = Double(color.rgba.green)
        let b: Double = Double(color.rgba.blue)
        drawSwiftUIColor = Color(red: r, green: g, blue: b, opacity: drawOpacity)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}


//struct HexColorPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        HexColorPicker()
//    }
//}
