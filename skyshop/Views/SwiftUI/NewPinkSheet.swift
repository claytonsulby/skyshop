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
                
                Button(action: {
                    newPinkBool.toggle()
                    pinkModel.addPink(name: textFieldBinding, hex: pickerColor.hex)
                    pinkModel.savePinks()
                }) {
                    Text("Add Pink")
                        .padding()
                }
                .background(RoundedRectangle(cornerRadius: 15).opacity(0.2))
                
                
                
                ColorPickerButton(pickerColor: $pickerColor)
                
                
                Spacer()
            }.padding([.leading, .trailing])
            
        }
    }
    
    
}

//struct _PinkSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        _PinkSheet()
//    }
//}
