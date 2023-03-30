//
//  SwiftUIView.swift
//  
//
//  Created by 한지석 on 2023/03/29.
//

import SwiftUI

struct Ep3Frame1: View {
    
    @State var design: [Design] = [
        Design(image: "Frame1", subtitle: "우리는 전투를 끝내고, 회식을 진행했다. 1차는 맘스터치였다."),
        Design(image: "Frame2", subtitle: "서로 고생했다며 이야기를 이어가는 중에, 우리는 평소처럼 유사과학 이야기를 진행했다."),
        Design(image: "Frame3", subtitle: "섀넌은 갑자기 '딸은 아버지를 닮고, 아들은 어머니를 닮는대요. 제가 그 증거에요!' 라고 했다.")
    ]
    
    @State var index = 0
    @State var hideButton = false
    @State var thisEPFinish = false
    
    var body: some View {
        
        if !thisEPFinish {
            ZStack {
                Button {
                    if index != 0 {
                        withAnimation(.easeOut) {
                            index -= 1
                            hideButton = false
                        }
                    }
                } label: {
                    Image(design[index].image)
                }
                
                    VStack {
                        Spacer()
                        Rectangle()
                            .textField(design[index].subtitle)
                            .overlay {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        // button 클릭될 경우 text 변하도록 설정
                                        Button("NEXT") {
                                            withAnimation(.easeIn) {
                                                if index < design.count - 1{
                                                    index += 1
                                                } else {
                                                    thisEPFinish = true
                                                }
                                            }
                                        }
                                        .frame(width: 50, height: 30)
                                        .padding(.bottom, 100)
                                        .padding(.trailing, 35)
                                        .opacity(hideButton ? 0 : 1)

                            }
                        }
                    }
                }
            }
            .background(Color.backgroundColor)
            .ignoresSafeArea(.all)
        }
        else {
            Ep3Frame2()
        }
//                                    if index == design.count - 1 {
//                                        NavigationLink {
//                                            Ep3Frame2()
//                                        } label: {
//                                            Text("NEXT")
//                                        }
//                                        .frame(width: 50, height: 30)
//                                        .padding(.bottom, 100)
//                                        .padding(.trailing, 35)
//                            }
//        .navigationBarBackButtonHidden(true)
    }
}


struct Ep3Frame1_Previews: PreviewProvider {
    static var previews: some View {

        Ep3Frame1()
    }
}

struct Design: Identifiable {
    let id = UUID().uuidString
    let image: String
    let subtitle: String
}