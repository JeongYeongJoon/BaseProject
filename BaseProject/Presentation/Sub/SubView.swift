//
//  SubView.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/24.
//

import SwiftUI

struct SubView: View {
    @EnvironmentObject var viewModel: RootViewModel
    @Binding var rootIsActive: Bool
    @Binding var isAnotherShow: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.testData.count == 0 {
                Button {
                    viewModel.createData()
                } label: {
                    Text("Create")
                }

            } else {
                List {
                    ForEach(viewModel.testData) { data in
                        VStack {
                            HStack(spacing: 0) {
                                Text("Data Title: \(data.title)")
                                
                                Text("Data Body: \(data.body)")
                                
                                Text("User ID: \(data.userId)")
                            }
                            Button {
                                viewModel.updateData(data: data)
                            } label: {
                                Text("Update")
                            }
                            Button {
                                viewModel.deleteData(data: data)
                            } label: {
                                Text("Delete")
                            }
                        }
                    }
                }
                
            }
            NavigationLink(destination: LastView(shouldPopToRoot: $rootIsActive, isAnotherShow: $isAnotherShow)){
                    Text("To Last View")
            }
            .isDetailLink(false)
        }
        .navigationTitle("Sub")
        .onAppear() {
            
        }
    }
    
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(rootIsActive: .constant(false), isAnotherShow: .constant(false)).environmentObject(RootViewModel(thisIsValue: "value"))
    }
}
