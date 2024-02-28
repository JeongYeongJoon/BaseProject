//
//  GetRepoLangUseCase.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import Foundation
import Alamofire

class TestUseCase {
    let repository: TestInterface
    
    init(repository: TestInterface) {
        self.repository = repository
    }
    
    func getTest(completion: @escaping (Result<TestResponse, AFError>) -> Void) {
        repository.getTest(completion: completion)
    }
}
