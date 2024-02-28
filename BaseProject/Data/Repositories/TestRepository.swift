//
//  GetRepoLangRepository.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import Foundation
import Alamofire

class TestRepository: TestInterface {
    private let host: String = "https://jsonplaceholder.typicode.com"
    
    func getTest(completion: @escaping (Result<TestResponse, AFError>) -> Void) {
        let path: String = "/posts/1"
        AF.request(host+path, method: .get)
            .responseDecodable(of: TestResponse.self) { response in
                switch (response.result) {
                case .success(let value):
                    completion(.success(value))
                    break
                case .failure(let error):
                    completion(.failure(error))
                    break
                }
            }
    }
    
    
}
