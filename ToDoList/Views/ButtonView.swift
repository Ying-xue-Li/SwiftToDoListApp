//
//  ButtonView.swift
//  ToDoList
//
//  Created by 李映雪 on 2/12/2023.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let foreColor: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(foreColor)
                Text(text)
                    .bold()
                    .foregroundColor(textColor)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Hi", foreColor: .blue, textColor: .white) {
            //action
        }
    }
}
