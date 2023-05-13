//
//  ASNetworking+Combine.swift
//  TopApps
//
//  Created by APPSPIA on 2022/06/14.
//

import Foundation
import Combine
import ASNetworking

extension ASNetworking {
    func combineHttpRequest<T: Codable>(requestData: ASRequestData) -> AnyPublisher<ASHttpResult<T>, Never> {
        return Future { promise in
            httpRequest(requestData: requestData).response { (result: ASHttpResult<T>) in
                promise(.success(result))
            }
        }.eraseToAnyPublisher()
    }
}
