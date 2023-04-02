//
//  HintView.swift
//  Chemino
//
//  Created by Irmak Atılgan on 9.03.2023.
//

import SwiftUI

struct HintView: View {
    @State var Q1go = false
    @Binding var pointsCounter: Int

    var body: some View {
        //HintView(pointsCounter: $pointsCounter)

        HStack{
        Text("OK, I’m all good!")
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            Image("littleArrow")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50.0, height: 50.0)
            
        }
        .navigationBarBackButtonHidden(true)
            .padding(.top, 550.0)
            .background(
                Image("hintViewBG")
                    .resizable()
                    .frame(width: 423.0, height: 854.0))
                    .padding(.bottom, 50.0)

            .onTapGesture {
                Q1go.toggle()
            }
        NavigationLink("", destination: Q1View(pointsCounter: $pointsCounter), isActive: $Q1go)
    }
}

struct HintView_Previews: PreviewProvider {
    @State static var pointsCounter = 0
    
    static var previews: some View {
        return HintView(pointsCounter: $pointsCounter)
    }
}
