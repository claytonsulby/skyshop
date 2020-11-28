//
//  PinkRow.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/27/20.
//

import SwiftUI

struct PinkRow: View {
    
    @EnvironmentObject var pinkModel:PinkModel
    @EnvironmentObject var audioModel:AudioModel
    
    @State var pinkSelectBool:Bool = false
    @State var selectedPink:Pink?
    
    @Binding var pickerColor:Color
    
    var pink:Pink
    
    var body: some View {
        HStack {
            Text(pink.name)
                .fontWeight(selectedPink == pink ? .bold : .regular) //FIXME: selectedPink not updating
                .foregroundColor(pink.color)
                .onTapGesture {
                    audioModel.playNote()
                    selectedPink = pink
                    pinkModel.currentColor = pink.color
                    pickerColor = pinkModel.currentColor
                }
                .onLongPressGesture(minimumDuration: 0.1) {
                    selectedPink = pink
                    pinkSelectBool.toggle()
                }
                .padding(.leading)
            
            Spacer()
        }
        .sheet(isPresented: $pinkSelectBool, onDismiss: {} ) {
            if selectedPink == pink {
                PinkDetail(pinkSelectBool: $pinkSelectBool, pink: pink)
            }
        }
    }
}

//struct PinkRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PinkRow()
//    }
//}
