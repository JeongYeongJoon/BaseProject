//
//  LanguageResponse.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import Foundation

// MARK: - LanguageResponse
struct TestResponse: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

