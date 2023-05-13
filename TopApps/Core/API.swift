//
//  API.swift
//  TopApps
//
//  Created by APPSPIA on 2022/05/18.
//

import Foundation
import Combine
import ASNetworking

enum API<T: Codable>: ASNetworking {
    case free
    case paid
    case grossing
}

extension API {
    var request: AnyPublisher<ASHttpResult<T>, Never> {
        let requestData: ASRequestData
        switch self {
        case .free:
            requestData = ASRequestData(urlString: server.rawValue + "/kr/rss/topfreeapplications/limit=100/json", httpMethod: .get)
        case .paid:
            requestData = ASRequestData(urlString: server.rawValue + "/kr/rss/toppaidapplications/limit=100/json", httpMethod: .get)
        case .grossing:
            requestData = ASRequestData(urlString: server.rawValue + "/kr/rss/topgrossingapplications/limit=100/json", httpMethod: .get)
        }
        return combineHttpRequest(requestData: requestData)
    }
}

