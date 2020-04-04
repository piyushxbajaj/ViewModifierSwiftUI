//
//  ContentView.swift
//  funcModifier
//
//  Created by Piyush Bajaj on 04/04/20.
//  Copyright © 2020 Piyush Bajaj. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View{
    let rows: Int
    let cols: Int
    let content: (Int,Int) -> Content
    var body: some View{
        VStack{
            ForEach(0 ..< rows,id : \.self){ row in
                
                HStack{
                    ForEach(0 ..< self.cols,id : \.self ){ col in
                        
                        self.content(row,col)
                        
                    }
                }
            }
        }
        
    }
    init(rows: Int, cols: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.cols = cols
        self.content = content
    }
}
struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, cols: 4) { row, col in
        
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//    }
//}
//extension View {
//    func titleStyle() -> some View {
//        self.modifier(Title())
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        Text("Hello World")
////        .modifier(Title())
//
//        .titleStyle()
//        .watermarked(with: "piyushxbajaj")
//
//    }
//}
//
//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//
//            Text(text)
//                .font(.caption)
//                .foregroundColor(.white)
//                .padding(5)
//                .background(Color.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        self.modifier(Watermark(text: text))
//    }
//}

