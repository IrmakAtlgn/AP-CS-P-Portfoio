//
//  newQ1.swift
//  Chemino
//
//  Created by Irmak Atılgan on 27.03.2023.
//

import SwiftUI

struct Q1View_old: View {
    
    @State var correctGo = false
    @State var wrongGo = false
    @State var levelsGo = false
    @State var Q2go = false
    @State var hintViewGo = false
    
    @State private var askAgain: [String] = []

    let options = ["propane", "butane", "tetrane", "quatrane"]
    @Binding var pointsCounter: Int
    
    init(pointsCounter: Binding<Int>) {
           _pointsCounter = pointsCounter
           // ...
       }
    
    var body: some View {
        //Q1View(pointsCounter: $pointsCounter)

        VStack {
            ZStack { //bar at the top
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

            Text("Name the molecule") //prompt
                .font(.custom("Verdana", fixedSize: 20))
                .padding(.vertical, 15.0)
                .multilineTextAlignment(.center)

            Image("Q1 photo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 30.0)
                .frame(width: 354.0, height: 200.0)

            //these are the multiple choice options
            
            wrongOpt(text: options[0])
            
            //this is the correct option, i haven't coded the function yet so I will just let it stay like this
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .padding(.horizontal, 15.0)
                    .foregroundColor(Color("optionsCL"))
                    .frame(width: 313.0, height: 89.0)

                Text(options[1])
                    .foregroundColor(Color.white)
                    .font(.custom("Verdana", fixedSize: 30))
            }
            .onTapGesture {
                correctGo.toggle()
                pointsCounter += 10
            }
            NavigationLink("", destination: Q1Correct(pointsCounter: $pointsCounter), isActive: $correctGo)
            
            //these are the other two wrong options
            
            wrongOpt(text: options[2])
            
            wrongOpt(text: options[3])

            //this is the bottom bar
            ZStack {
                Rectangle()
                    .fill(Color("bar color"))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                HStack {
                    Text ("< back")
                        .foregroundColor(Color.white)
                        .font(.custom("Verdana", fixedSize: 30))
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 10.0)
                        .onTapGesture {
                            levelsGo.toggle()
                        }
                    NavigationLink("", destination: LevelsView(), isActive: $levelsGo)

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("optionsCL"))
                            .frame(width: 68, height: 33)
                        Text("hint")
                            .foregroundColor(Color.white)
                            .font(.custom("Verdana", fixedSize: 30))
                            .onTapGesture {
                                hintViewGo.toggle()
                            }
                        NavigationLink("", destination: HintView(pointsCounter: $pointsCounter), isActive: $hintViewGo)
                    }
                    .padding(.horizontal, 15.0)
                    
                    Text("skip >")
                        .foregroundColor(Color.white)
                        .font(.custom("Verdana", fixedSize: 30))
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 10.0)
                        .onTapGesture {
                            Q2go.toggle()
                        }
                        NavigationLink("", destination: Q2View(pointsCounter: $pointsCounter), isActive: $Q2go)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .ignoresSafeArea()
             
             }
            .navigationBarBackButtonHidden(true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }

    @ViewBuilder
    func wrongOpt(text: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal, 15.0)
                .foregroundColor(Color("optionsCL"))
                .frame(width: 313.0, height: 89.0)
            Text(text)
                .foregroundColor(Color.white)
                .font(.custom("Verdana", fixedSize: 30))
        }
        .onTapGesture {
            askAgain.append(text)
            pointsCounter -= 5
            wrongGo.toggle()
        }
        .padding(.bottom, 10.0)
        NavigationLink("", destination: Q1Wrong(pointsCounter: $pointsCounter), isActive: $wrongGo)
    }
}

struct Q1View_Previews: PreviewProvider {
    @State static var pointsCounter = 0
    
    static var previews: some View {
        return Q1View_old(pointsCounter: $pointsCounter)
    }
}
