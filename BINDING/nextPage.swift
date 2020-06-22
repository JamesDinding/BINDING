//
//  nextPage.swift
//  BINDING
//
//  Created by User02 on 2020/6/22.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct brightnessSlider: View {
    @Binding var brightnessAmount: Double
    var body: some View {
        HStack {
            Text("亮度")
            Slider(value: self.$brightnessAmount, in: 0...1, minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)) {
                Text("")
            }
        }
    }
}

struct nextPage: View {
    var buildingstyle = ["ac1","ac2","ac3","ac4"]
    @State private var brightnessAmount: Double = 0
    @State private var selectIndex = 0
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(self.buildingstyle[self.selectIndex])
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                                   .clipped()
                                   .brightness(self.brightnessAmount)
                
                Form {
                    brightnessSlider(brightnessAmount:self.$brightnessAmount)
                    Picker(selection: self.$selectIndex, label: Text("風格")) {
                               Text(self.buildingstyle[0]).tag(0)
                               Text(self.buildingstyle[1]).tag(1)
                               Text(self.buildingstyle[2]).tag(2)
                               Text(self.buildingstyle[3]).tag(3)
                    }.pickerStyle(WheelPickerStyle())
                    .frame(width: 380, height: 200)
                    .background(Image("BG"))
                    .foregroundColor(.black)
                    .cornerRadius(30)
                    .shadow(radius: 30)
                    if self.selectIndex == 0 {
                        Text("實用工業風，把DIY做出來的小道具放在一起營造有點混亂的風個")
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 4))
                    }
                    else if self.selectIndex == 1 {
                        Text("自然休閒，栽培花兒做出自己的小小花圃，幫花兒雜交培育出新的顏色，既美麗又有趣")
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 4))
                    }
                    else if self.selectIndex == 2 {
                        Text("迷幻森林，挖出高低台地，營造出強烈的距離感，讓島嶼看起來更加管廣大")
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 4))
                    }
                    else {
                        Text("復古風格，鋪路，設立電線桿，安置許多小攤販，彷彿讓人回到９０年代")
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 4))

                    }
                }
            }
            
        }
    }
}
