//
//  PinkDetail.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import SwiftUI

struct PinkDetail: View {
    
    @EnvironmentObject var pinkModel:PinkModel
    
    @Binding var pinkSelectBool:Bool
    
    let shareMessage:[String] = [
        "Checkout this cool pink I found!",
        "Yo here's a super cool pink!",
        "I wanted to share this pink with you!"
    ]
    
    @State var shareShowing:Bool = false
    
    var pink:Pink
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(maxHeight: 250)
                    .foregroundColor(pink.color)
                    .ignoresSafeArea(edges: .top)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            shareShowing.toggle()
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 25, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .sheet(isPresented: $shareShowing, onDismiss: {
                        }, content: {
                            ActivityViewController(activityItems: [UIImage(color: UIColor(Color.init(hex: pink.hex)), size: CGSize(width: 500, height: 500))!, "\(shareMessage.randomElement() ?? "Checkout this cool pink I found!") I call it \(pink.name). Here's the hex: #\(pink.hex)"])
                        })
                    }.padding([.bottom, .trailing])
                }.frame(maxHeight: 250)
            }
                Group{
                    HStack {
                        Text(pink.name)
                            .font(.system(size: 50, design: .rounded))
                            .foregroundColor(pink.color)
                        Spacer()
                    }
                    HStack {
                        Text("#\(pink.hex)")
                            .font(.system(.caption, design: .rounded))
                            .foregroundColor(.primary)
                        Spacer()
                    }
                }.padding(.leading)
            
            
                Spacer()
                Button(action: {
                    pinkSelectBool.toggle()
                    pinkModel.currentColor = .pink
                    pinkModel.deletePink(pink)
                    pinkModel.savePinks()
                }) {
                    HStack {
                        Text("Delete")
                        Image(systemName: "trash")
                    }.foregroundColor(pink.color)
                    .font(.system(size: 25, design: .rounded))
                    .ignoresSafeArea(.keyboard)
                }
            }
        }
    }

//struct PinkDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PinkDetail()
//    }
//}
