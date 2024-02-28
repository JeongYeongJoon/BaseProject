//
//  ContentView.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/24.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel: RootViewModel = RootViewModel(thisIsValue: "value")
    @State var isActive: Bool = false
    @State var isAnotherShow: Bool = false
    init() {
        
    }
    
    var body: some View {
        if isAnotherShow {
            
                AnotherView()
            
        } else {
            NavigationView {
                VStack {
                    NavigationLink(
                        destination: SubView(rootIsActive: $isActive, isAnotherShow: $isAnotherShow).environmentObject(viewModel),
                        isActive: self.$isActive
                    ) {
                        Text("To SubView")
                    }
                    .isDetailLink(false)
                    .navigationTitle("Root")
                }
                .padding()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
