//
//  +PinkSheet.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/27/20.
//

import SwiftUI

struct NewPinkSheet: View {
    
    @EnvironmentObject var pinkModel:PinkModel
    
    @State var showingPicker:Bool = false
    @Binding var newPinkBool:Bool
    
    @State var textFieldBinding:String = ""
    @Binding var pickerColor:Color
        
    @State var imageColors:UIImageColors? = nil
    @State var inputImage:UIImage? = nil
    @State var image:Image? = nil
    
    var hex:String { pickerColor.hex }

    var body: some View {
        
        VStack{
            
            Rectangle()
                .frame(maxHeight: 250)
                .foregroundColor(pinkModel.currentColor) //FIXME: fatal error sometimes missing pinkModel as environment object
                .ignoresSafeArea(edges: [.top, .leading, .trailing])
            
            Group {

                
                ColorPicker(selection: $pickerColor, label: {
                    TextField("Name your color.", text: $textFieldBinding)
                        .foregroundColor(pinkModel.currentColor)
                        .font(.system(size: 25, design: .rounded))
                })
                    .onChange(of: pickerColor) { newValue in
                        pinkModel.currentColor = newValue
                    }
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.primary)
                
                HStack{
                    
                    Button(action: {
                        newPinkBool.toggle()
                        if image != nil {
                            let url = pinkModel.addToDocuments(name: textFieldBinding, image: inputImage!)
                            pinkModel.addPink(name: textFieldBinding, hex: pickerColor.hex, url: url)
                        } else {
                            pinkModel.addPink(name: textFieldBinding, hex: pickerColor.hex, url: nil)
                        }
                        
                        
                        pinkModel.savePinks()
                    }) {
                        Text("Add Pink")
                            .padding()
                    }
                    .background(RoundedRectangle(cornerRadius: 15).opacity(0.2))
                
                    Button(action: {
                        if image == nil {
                            showingPicker.toggle()
                        } else {
                            image = nil
                        }
                    }) {
                        Text((image == nil ? "Choose from Photo" : "Clear photo"))
                            .padding()
                    }
                    .background(RoundedRectangle(cornerRadius: 15).opacity(0.2))
                    .sheet(isPresented: $showingPicker, onDismiss: loadImage) {
                        ImagePicker(image: self.$inputImage)
                    }
                    
                }
                Spacer()
                if image != nil {
                    GeometryReader{ geometry in
                        HStack(alignment: .top)
                        {
                            
                            Spacer()
                            Button(action: { showingPicker.toggle() }) {
                                
                                image!
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .frame(minWidth: 0, maxWidth: geometry.size.width/1.5, minHeight: 0, maxHeight: geometry.size.width/1.5, alignment: .bottom)
                                    .ignoresSafeArea(.container)

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
                } else {
                    EmptyView()
                        .ignoresSafeArea(.keyboard)
                }
                
                
//                Spacer()
//                ColorPickerButton(pickerColor: $pickerColor)
                
                
                Spacer()
            }.padding([.leading, .trailing])
            
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

//struct _PinkSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        _PinkSheet()
//    }
//}
