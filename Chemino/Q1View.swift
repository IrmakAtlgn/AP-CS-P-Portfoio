//
//  GTPsaid.swift
//  Chemino
//
//  Created by Irmak Atılgan on 2.04.2023.
//

import SwiftUI

struct Q1View: View {
    
        @State private var correctGo = false
        @State private var wrongGo = false
        @State private var levelsGo = false
        @State private var hintViewGo = false
        @State private var Q2go = false
        @Binding var pointsCounter: Int

        @State private var askAgain: [String] = []
        let options = ["propane", "butane", "tetrane", "quatrane"]
        
        var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("bar color"))
                        .frame(maxWidth: .infinity, maxHeight: 80)
                    Text("Level 1 - Alkanes")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30.0)
                        .font(.custom("Verdana", fixedSize: 30))
                        .frame(height: 80.0)
                }
                .ignoresSafeArea()

                Text("Name the molecule")
                    .font(.custom("Verdana", fixedSize: 20))
                    .padding(.vertical, 15.0)
                    .multilineTextAlignment(.center)

                Image("Q1 photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30.0)
                    .frame(width: 354.0, height: 200.0)

               ForEach(options, id: \.self) { option in
                    Button(action: {
                        answerChecker(option: option)
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .padding(.horizontal, 15.0)
                                .foregroundColor(Color("optionsCL"))
                                .frame(width: 313.0, height: 89.0)
                            
                            Text(option)
                                .foregroundColor(Color.white)
                                .font(.custom("Verdana", fixedSize: 30))
                        }
                    }
                }
                NavigationLink("", destination: Q1Correct(pointsCounter: $pointsCounter), isActive: $correctGo)
                NavigationLink("", destination: Q1Wrong(pointsCounter: $pointsCounter), isActive: $wrongGo)
                
                
            
                
                // Bottom bar
                HStack {
                    Button(action: {
                        levelsGo.toggle()
                    }) {
                        Text("< back")
                            .foregroundColor(Color.white)
                            .font(.custom("Verdana", fixedSize: 30))
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 10.0)
                            .padding(.leading, 15.0)
                    }
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(.white)
                    NavigationLink("", destination: LevelsView(), isActive: $levelsGo)
                    
                    Button(action: {
                        hintViewGo.toggle()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("optionsCL"))
                                .frame(width: 68, height: 33)
                                .padding(.horizontal, 15.0)

                            Text("hint")
                                .foregroundColor(Color.white)
                                .font(.custom("Verdana", fixedSize: 30))
                        }
                    }
                    NavigationLink("", destination: HintView(pointsCounter: $pointsCounter), isActive: $hintViewGo)
                    //here
                    Text("skip >")
                        .foregroundColor(Color.white)
                        .font(.custom("Verdana", fixedSize: 30))
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 10.0)
                        .padding(.trailing, 15.0)
                        .onTapGesture {
                            Q2go.toggle()
                        }
                        NavigationLink("", destination: Q2View(pointsCounter: $pointsCounter), isActive: $Q2go)
                }
                .padding(.vertical, 10.0)
                .background(Color("bar color"))
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        } //for var body some view

    
    func answerChecker(option:String) {
        if option == options[1] {
            correctGo = true
            pointsCounter += 10
        } else {
            wrongGo = true
            pointsCounter -= 5
            askAgain.append(option)
        }
        
    }
    

}//for main View


struct GTPsaid_Previews: PreviewProvider {
    @State static var pointsCounter = 0
    
    static var previews: some View {
        return Q1View(pointsCounter: $pointsCounter)
    }
}
