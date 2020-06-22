//
//  ContentView.swift
//  BINDING
//
//  Created by User02 on 2020/6/22.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI




struct ContentView: View {
    @State private var isfemale: Bool = false
    @State private var selectDate = Date()
    @State private var name = ""
    @State private var showAlert: Bool = false
    @State private var selectIndex = 0

    var employee = ["貍克", "豆貍", "粒貍"]
    
    @State private var nextpage: Bool = false
    
    
    
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -20, to: Date())!
    var year: Int {
        Calendar.current.component(.year, from: selectDate)
    }
    var body: some View {
        VStack {
            Text("島民紀錄卡")
            VStack {
                if isfemale {
                    Image("woman")
                    Text("Female")
                } else {
                    Image("man")
                    Text("Male")
                }
                Toggle("性別", isOn: $isfemale)
            }
            Form {
                TextField("請輸入你的名字", text: $name, onEditingChanged: {(editing) in
                    self.showAlert = true
                }){
                    print(self.name)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 4))
                .padding()
                .alert(isPresented: $showAlert) { () -> Alert in
                    let result: String
                    if self.name.isEmpty {
                        result = "慟！請輸入你的名字！"
                    } else {
                        result = self.name + "恭喜你來到屬於你的無人島"
                    }
                    return Alert(title: Text(result))
                }
                
                Text("請問你的出生日是？")
                DatePicker("出生日: ", selection: self.$selectDate, in: self.startDate...self.today, displayedComponents: .date)
                
                VStack {
                    Text("以下是會過跟著\(name)你過去無人島的Nook員工喔！")
                    Picker(selection: $selectIndex, label: Text("員工")) {
                        ForEach(0..<employee.count){ (index) in
                            Text(self.employee[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Image(employee[selectIndex])//not get the pic yet
                    .resizable()
                        .frame(width:100, height:150)
                }
            }
            Button("未來想要的建築方向") {
                self.nextpage = true
            }.sheet(isPresented: self.$nextpage) {
                nextPage()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
