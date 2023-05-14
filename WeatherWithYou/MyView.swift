//
//  MyView.swift
//  WeatherWithYou
//
//  Created by oboard on 2023/5/13.
//

import SwiftUI

struct MyView: View {
    @State private var selection = "红色"
    let colors = ["红色", "绿色", "蓝色", "黑色", "黄色"]

    var body: some View {
        NavigationView{
            VStack {
                ZStack {
                    Image("summer_bg").resizable().aspectRatio(contentMode: .fill).frame(width: 128,height: 128).cornerRadius(64)
                }.padding(.all,16)
                Text("用户名").bold().foregroundColor(.cyan).font(.largeTitle)
                
                Form {
                    Section {
                        Section() {
                            Text("积分：100")
                        }
                        
                        Section() {
                            Text("积分商城")
                        }
                    }
                    
                    Section {
                        Picker(selection: $selection, label: Text("主题")) {
                            //选择器可选项内容
                            ForEach(0 ..< colors.count, id: \.self) {
                                Text(self.colors[$0])
                            }
                        }
                    }
                    Section() {
                        Text("关于")
                    }
               }
            }
        }.navigationTitle(Text("我的"))
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
