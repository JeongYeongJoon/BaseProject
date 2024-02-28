//
//  GetRepoLangInterface.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import Foundation
import Alamofire

protocol TestInterface {
    func getTest(completion: @escaping (Result<TestResponse, AFError>) -> Void)
}
