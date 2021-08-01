//
//  APIResource.swift
//  EZCinema
//
//  Created by Edu on 18/07/21.
//

import Foundation
import Alamofire
import SwiftyJSON

//MARK: Protocols
protocol EndPointType {
    var baseURL: URL? { get }
    var wsName: String { get }
}

//MARK: Structs
struct APIError: Codable {
    let onSuccess: Bool
    let onError: APIErrorDetail
}

struct APIErrorDetail: Codable {
    let message, name: String
    let code: Int
}

//MARK: Enums
enum RequestError: Error {
    case APIError(String)
    case UNError
    case ErrorParsing
    case dataMappingError(String)
}

enum APIResource {
    case getMovieList, getGenreList, getUpcoming
}

//MARK: Extension
extension APIResource: EndPointType {

    private var apiKey: String {
        let mainDict = Bundle.main.infoDictionary
        return mainDict?["API_KEY"] as! String
    }
    
    var baseURL: URL? {
        let mDict = Bundle.main.infoDictionary
        let mURL = mDict?["SERVER_URL"] as? String
        return URL(string: mURL ?? "")
    }
    
    var wsName: String {
        
        switch self {
            
        case .getMovieList:     return "/movie/now_playing"
        case .getGenreList:     return "/genre/movie/list"
        case .getUpcoming:      return "/movie/upcoming"
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovieList, .getGenreList, .getUpcoming: return .get
        }
    }
    
    var baseHeaders: HTTPHeaders {
        
        let headers: HTTPHeaders  = [
            "Content-Type" : "application/x-www-form-urlencoded",
            "Accept": "application/json",
            "api_key": self.apiKey
        ]
        return headers
    }
}
