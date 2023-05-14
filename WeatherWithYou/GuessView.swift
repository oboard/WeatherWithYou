//
//  GuessView.swift
//  WeatherWithYou
//
//  Created by oboard on 2023/5/13.
//

import SwiftUI

struct GuessView: View {
    private var displayState1 = [ "小雨", "大雨", "中雨"]
    private var displayState2 = [ "23°", "10°", "20°"]
    private var displayState3 = [ "50%", "90%", "99%"]
    private var displayState4 = [ "东风", "南风", "西风", "北风"]
    @State private var selectedNumber = 0

    var body: some View {
        NavigationView {
            // 表单
            Form {
                Section{
                    Text("查看往日天气")
                }
                Section{
                    Text("地理信息提示")
                }
                Section {
                    Picker(selection: $selectedNumber, label: Text("天气")) {
                        //选择器可选项内容
                        ForEach(0 ..< displayState1.count, id: \.self) {
                            Text(self.displayState1[$0])
                        }
                    }
                }
                Section {
                    Picker(selection: $selectedNumber, label: Text("最低温度")) {
                        //选择器可选项内容
                        ForEach(0 ..< displayState2.count, id: \.self) {
                            Text(self.displayState2[$0])
                        }
                    }
                }
                Section {
                    Picker(selection: $selectedNumber, label: Text("最高温度")) {
                        //选择器可选项内容
                        ForEach(0 ..< displayState2.count, id: \.self) {
                            Text(self.displayState2[$0])
                        }
                    }
                }
                Section {
                    Picker(selection: $selectedNumber, label: Text("湿度")) {
                        //选择器可选项内容
                        ForEach(0 ..< displayState3.count, id: \.self) {
                            Text(self.displayState3[$0])
                        }
                    }
                }
                Section {
                    Picker(selection: $selectedNumber, label: Text("风向")) {
                        //选择器可选项内容
                        ForEach(0 ..< displayState4.count, id: \.self) {
                            Text(self.displayState4[$0])
                        }
                    }
                }
                
            }

            // 导航栏标题
            .navigationBarTitle("猜天气", displayMode: .inline)
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView()
    }
}
