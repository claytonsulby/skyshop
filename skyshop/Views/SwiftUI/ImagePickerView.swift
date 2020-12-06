//
//  ColorPickerButton.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/27/20.
//

import SwiftUI

struct ImagePickerView: View {
    
    @EnvironmentObject var pinkModel:PinkModel
    
    @State var showingPicker:Bool = false
    
    @State var imageColors:UIImageColors? = nil
    @State var inputImage:UIImage? = nil
    @State var image:Image? = nil
    
    @Binding var pickerColor:Color
    var hex:String { pickerColor.hex }
    
    
    var body: some View {
        GeometryReader{ geometry in
            HStack(alignment: .bottom)
            {
                
                Spacer()
                Button(action: { showingPicker.toggle() }) {
                    
                    image!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .frame(minWidth: 0, maxWidth: geometry.size.width/1.5, minHeight: 0, maxHeight: geometry.size.width/1.5, alignment: .bottom)

                }
                
                if image == nil {
                    EmptyView()
                } else {
                    VStack {
                        Button(action: {
                            pickerColor = Color(imageColors!.background)
                            pinkModel.currentColor = Color.init(hex: imageColors!.background.hex)
                        }) {
                            RoundedRectangle(cornerRadius: 2.5)
                                .frame(width: geometry.size.width/15, height: geometry.size.width/15, alignment: .center)
                                .foregroundColor(Color(imageColors!.background))
                        }
                        Button(action: {
                            pickerColor = Color(imageColors!.primary)
                            pinkModel.currentColor = Color.init(hex: imageColors!.primary.hex)
                        }) {
                            RoundedRectangle(cornerRadius: 2.5)
                                .frame(width: geometry.size.width/15, height: geometry.size.width/15, alignment: .center)
                                .foregroundColor(Color(imageColors!.primary))
                        }
                        Button(action: {
                            pickerColor = Color(imageColors!.secondary)
                            pinkModel.currentColor = Color.init(hex: imageColors!.secondary.hex)
                        }) {
                            RoundedRectangle(cornerRadius: 2.5)
                                .frame(width: geometry.size.width/15, height: geometry.size.width/15, alignment: .center)
                                .foregroundColor(Color(imageColors!.secondary))
                        }
                        Button(action: {
                            pickerColor = Color(imageColors!.detail)
                            pinkModel.currentColor = Color.init(hex: imageColors!.detail.hex)
                        }) {
                            RoundedRectangle(cornerRadius: 2.5)
                                .frame(width: geometry.size.width/15, height: geometry.size.width/15, alignment: .center)
                                .foregroundColor(Color(imageColors!.detail))
                        }
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showingPicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        imageColors = inputImage.getColors()
        pickerColor = Color(imageColors!.background)
        pinkModel.currentColor = Color.init(hex: imageColors!.background.hex)
        
    }
}

//struct ColorPickerButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorPickerButton()
//    }
//}
