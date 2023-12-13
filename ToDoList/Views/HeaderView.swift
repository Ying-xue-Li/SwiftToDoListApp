//
//  HeaderView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import SwiftUI

struct HeaderView: View {
    let image: Image
    let title: String
    let subtitle: String
    let color: Color
    let angle: Double
    
    var body: some View {
        ZStack{
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400.0, height: 500.0)
                .ignoresSafeArea()
//            RoundedRectangle(cornerRadius: 0)
//                .foregroundColor(color)
//                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
            }
            .shadow(color: color, radius: 5, x: 0, y: 5)
            .foregroundColor(.white)
            .padding(.top, 60)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(image: Image("killmyself-cat"), title: "Title",
                    subtitle: "Subtitle",
                    color: .blue,
                    angle: 15.0)
    }
}
