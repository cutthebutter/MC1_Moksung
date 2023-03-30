//
//  SwiftUIView.swift
//  
//
//  Created by user on 2023/03/29.
//

import SwiftUI

struct Episode2Frame5: View {
    let images = ["2_5_1", "2_5_2", "2_5_3"]
    @State private var index = 0
    var body: some View {
        ZStack {
            Image(index<=0 ? images[0] : images[index])
            Image(images[index])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    if index < images.count-1 {
                        index += 1
                    }
                }
                .animation(.easeIn, value: index)
                
            
            VStack {
                Spacer()
                Rectangle()
                    .textField("인터뷰씬")
                    .overlay {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                // button 클릭될 경우 text 변하도록 설정
                                NavigationLink {
                                    Episode2Frame6()
                                } label: {
                                    Label("NEXT", systemImage: "arrow")
                                }
                                .frame(width: 50, height: 30)
                                .padding(.bottom, 100)
                                .padding(.trailing, 35)
                                .disabled(index<images.count-1)
                                
                                
                            }
                        }
                    }
            }
        }
        .background(Color.backgroundColor)
        .ignoresSafeArea(.all)
    }
}

struct Episode2Frame5_Previews: PreviewProvider {
    static var previews: some View {
        Episode2Frame5()
    }
}