//
//  RootViewModel.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/24.
//

import Foundation

class RootViewModel: ObservableObject {
    @Published var thisIsValue: String
    @Published var testValue: Test?
    
    @Published var testData: [TestData] = []
    
    @Published var title: String = "newData"
    @Published var body: String = "this is body"
    @Published var userId: Int64 = 0
    
    let dataService = TestDataController.shared
    
    let usecase: TestUseCase
    
    init(thisIsValue: String) {
        self.thisIsValue = thisIsValue
        self.testValue = nil
        self.usecase = TestUseCase(repository: TestRepository())
    }
    
    func getTestValue() {
        usecase.getTest { response in
            switch(response) {
            case .success(let value):
                self.testValue = Test(entity: value)
                break
                
            case .failure(let error) :
                print("\(error)")
                break
            }
        }
    }
    
    func getAllData() {
        testData = dataService.ReadTestData()
    }
    
    func createData() {
        dataService.CreateTestData(title: title, body: body, userId: userId)
        getAllData()
    }
    
    func updateData(data: TestData) {
        userId += 1
        dataService.UpdateTestData(entity: data, userId: userId)
        getAllData()
    }
    
    func deleteData(data: TestData) {
        dataService.DeleteTestData(data)
        getAllData()
    }
}
