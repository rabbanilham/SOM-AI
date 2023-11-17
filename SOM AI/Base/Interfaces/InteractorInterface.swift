//
//  InteractorInterface.swift
//  SOM AI
//
//  Created by Bagas Ilham on 16/11/2023.
//

import Foundation

typealias ResponseConfigurator<T: Decodable> = (BaseResponse<T>?, Error?) -> Void

protocol InteractorInterface: AnyObject {
}

// MARK: - Extensions

extension InteractorInterface {
}
