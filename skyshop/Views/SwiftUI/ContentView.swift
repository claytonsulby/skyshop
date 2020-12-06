//
//  ContentView.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pinkModel:PinkModel
    @EnvironmentObject var audioModel:AudioModel
    
    @State var newPinkBool:Bool = false
    @State var showingPicker:Bool = false
    
    @State var pickerColor:Color = .pink
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            ForEach(pinkModel.pinks) { pink in
                PinkRow(pickerColor: $pickerColor, pink: pink)
            }
            
            HStack {
                Text("+Pink")
                    .foregroundColor(pinkModel.currentColor)
                    .onTapGesture {
                        newPinkBool.toggle()
                    }
                    .padding(.leading)
                    .sheet(isPresented: $newPinkBool, onDismiss: {}, content: {
                        NewPinkSheet(newPinkBool: $newPinkBool, pickerColor: $pickerColor)
                    })
                Spacer()
                Text("← Tap to add your own!")
                    .font(.caption)
                    .foregroundColor(pinkModel.currentColor)
                    .padding(.trailing)
                    .opacity(0.5)
                
            }
            
        }
        .brightness(0.2)
        .font(.system(size: 25, design: .rounded))
        .background(backgroundColor)
    }

    
    var backgroundColor : some View {
        Rectangle()
            .ignoresSafeArea(.container)
            .foregroundColor(pinkModel.currentColor)
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
