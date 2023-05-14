//
//  ContentView.swift
//  WeatherWithYou
//
//  Created by oboard on 2023/5/2.
//

import SwiftUI


struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    //指定桥接类型
    typealias UIViewType = UIView
    //指定类型之后会提示自动补全下面两个方法
    
    //初始化UIView的方法
    func makeUIView(context: Context) -> UIView {
        //下面要使用自动布局指定大小，所以初始化为0
        let view = UIView(frame: CGRect.zero)
        //指定容器View的背景色为 clear
        view.backgroundColor = .clear
        
        //常规初始化BlurView的操作
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        //将BlurView插入到view的最底层
        view.insertSubview(blurView, at: 0)
        
        //自动布局指定blueView的大小为与View等宽高
        //要注意先后顺序，需先将blurView插入到view中
        NSLayoutConstraint.activate([
            //width & height 这里是用autolayout 设置与view 等宽高
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            //也可这样可以直接指定宽/高
            //            blurView.widthAnchor.constraint(equalToConstant: <#T##CGFloat#>)
        ])
        return view
    }
    
    //据说是用来完善动画相关的部分
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
var foreground = Color.white;

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ForEach(0..<numberOfPages) { index in
                Circle()
                    .foregroundColor(currentPage == index ? foreground : foreground.opacity(0.5))
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct ContentView: View {
    
    @State private var currentPage = 0
    @State var isPresented = false // 表示是否打开Modal窗口
    
    var page: some View {
        VStack {
            
            Text("东莞").foregroundColor(foreground)
                    .font(.largeTitle)
                    .shadow(color: .black, radius: 8)
            Text("2°")
                .font(.system(size: 70,weight: .light))
                .foregroundColor(foreground)
                .shadow(color: .black, radius: 8)
            VStack {
                Text("晴天")
                    .font(.title2)
                    .foregroundColor(foreground)
                    .shadow(color: .black, radius: 8)
                   
                Text("最高24° 最低20°")
                    .font(.title2)
                    .foregroundColor(foreground)
                    .shadow(color: .black, radius: 8)
            }
            Image("boy")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            
        }.padding(.bottom,40)
    }
    
    
    
    var body: some View {
        ZStack{
            Image("summer_bg")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea().edgesIgnoringSafeArea(.all).ignoresSafeArea(.all)
            
            TabView(selection: $currentPage) {
                page
                    .tag(0)
                page
                    .tag(1)
                page
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack() {
                
                Spacer()
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "list.bullet").resizable().aspectRatio(contentMode: .fit).frame(height: 20).padding(20)
                    }
                    
                    Spacer()
                    PageControl(numberOfPages: 3, currentPage: $currentPage)
                    Spacer()
                    
                    Button {
                        self.isPresented = true
                    } label: {
                        Image(systemName: "person").resizable().aspectRatio(contentMode: .fit).frame(height: 20).padding(20)
                    }.sheet(isPresented: $isPresented, content: {
                        MyView() //将创建的自定义视图作为模态窗口的内容
                    })
                }.accentColor(foreground).frame(width: .infinity).ignoresSafeArea().frame(height:.infinity).edgesIgnoringSafeArea(.all)
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
