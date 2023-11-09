//
//  BaseResponse.swift
//  SOM AI
//
//  Created by Bagas Ilham on 06/11/2023.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    var status: Status?
    var data: T?
//    var meta: Meta?
}

// MARK: - Extensions

extension BaseResponse {
    struct Status: Decodable {
        var code: String
        var reason: String?
        var message: String
        var customMessage: String?
    }
}

struct EmptyResponseData: Decodable {}
