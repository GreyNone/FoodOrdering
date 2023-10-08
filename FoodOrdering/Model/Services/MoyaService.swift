//
//  MoyaManager.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 6.10.23.
//

import Foundation
import Moya

enum MoyaService {
    case burger
    case pizza
    case sushi
    case image(String)
    case itemInformation(Int)
}

extension MoyaService: TargetType {
    var baseURL: URL {
        switch self {
        case .burger, .pizza, .sushi, .itemInformation(_):
            return URL(string: "https://api.spoonacular.com")!
        case .image(let imageUrl):
            return URL(string: imageUrl)!
        }
    }
    var path: String {
        switch self {
        case .burger, .pizza, .sushi:
            return "/food/menuItems/search"
        case .image(_):
            return ""
        case .itemInformation(let id):
            return "/food/menuItems/\(id)"
        }
    }
    var headers: [String : String]? {
        return ["x-api-Key" : "4721d7561fee4b608074d80c55787119"]
    }
    var method: Moya.Method {
        switch self {
        case .burger, .pizza, .sushi, .image(_), .itemInformation(_):
            return .get
        }
    }
    var task: Task {
        switch self {
        case .burger:
            return .requestParameters(parameters: ["query" : "burger"], encoding: URLEncoding.queryString)
        case .pizza:
            return .requestParameters(parameters: ["query" : "pizza"], encoding: URLEncoding.queryString)
        case .sushi:
            return .requestParameters(parameters: ["query" : "sushi"], encoding: URLEncoding.queryString)
        case .image(_), .itemInformation(_):
            return .requestPlain
        }
    }
    var sampleData: Data {
        return Data()
    }
}
