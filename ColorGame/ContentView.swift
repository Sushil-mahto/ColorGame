//
//  ContentView.swift
//  ColorGame
//
//  Created by SUshil on 16/02/22.
//

import SwiftUI
let n1:CGFloat = 1

struct ColorModel{
    var randomTitle:Int
    var color1:Color
    var color2:Color
    var score:Int
}
struct ContentView: View {
    @Environment(\.colorScheme) var cs
    @AppStorage("c1") var c1 = true
    
    let cols:[GridItem]=[
        GridItem(spacing:n1),
        GridItem(spacing:n1),
        GridItem(spacing:n1),
        GridItem(spacing:n1),
        
    ]
    let cols2:[GridItem] = Array(repeating:GridItem(),count:5)
    
    @State var colorModel:ColorModel = ColorModel(randomTitle: 0, color1: Color.blue, color2: Color.orange, score: 0)
    var body: some View {
        ZStack(alignment: .top){
        
            Color("MyBackground").edgesIgnoringSafeArea(.all)
            Image(systemName: "moon.fill")
                .padding(.leading,300)
                .font(.largeTitle)
                .onTapGesture {
                    c1.toggle()
                }
                Spacer()
            
        VStack{
            
            Text("Color Game")
                .font(.largeTitle)
                .bold()
                .padding()
            Button("Action: \(colorModel.score)"){
                CallRandom()
            }
            .font(.title)
            
            LazyVGrid(columns: cols2, alignment: .leading,spacing:5){
                ForEach(0..<45){x in
                    if(x == colorModel.randomTitle){
                        subView(x:x,color:colorModel.color1,score:$colorModel.score,randomTitle:colorModel.randomTitle)
                            .onTapGesture{
                                colorModel.score = colorModel.score+1
                            CallRandom()
                        }
                        
                    }else{
                        subView(x:x,color:colorModel.color2,score:$colorModel.score,randomTitle:colorModel.randomTitle)
                            .onTapGesture{
                                colorModel.score = 0
                                CallRandom()
                                
                            }
                    }
                }
            }.frame(width: 295, alignment: .center)
        }
    }
    }
    
    func RandomColor()->Color{
        let r1 = Double.random(in: 0...1)
        let r2 = Double.random(in: 0...1)
        let r3 = Double.random(in: 0...1)
        let color1 = Color(red: r1, green: r2, blue: r3)
        return color1
    }
    func CallRandom(){
        colorModel.randomTitle = Int.random(in: 0..<25)
        colorModel.color1 = RandomColor()
        colorModel.color2 = RandomColor()
    }
}
struct subView:View{
    let x:Int
    let color:Color
    @Binding var score:Int
    let randomTitle:Int
    var body: some View{
        Text("")
            .frame(width: 55, height: 55, alignment: .center)
            .background(color)
            .cornerRadius(10)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
