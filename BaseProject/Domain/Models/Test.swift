//
//  Test.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import Foundation

struct Test: Identifiable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

extension Test {
    init(entity: TestResponse) {
        self.id = entity.id
        self.title = entity.title
        self.body = entity.body
        self.userId = entity.userId
    }
}
