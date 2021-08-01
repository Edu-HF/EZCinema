//
//  MainService.swift
//  EZCinema
//
//  Created by Edu on 18/07/21.
//

import Foundation
import SwiftyJSON
import Alamofire

class MainService: NSObject {
    
    private func getAPIKey() -> String {
        var apiKey: String {
            let mainDict = Bundle.main.infoDictionary
            return mainDict?["API_KEY"] as! String
        }
        
        return apiKey
    }
    
    //MARK: Fetch Movie List
    func getMovieList(completion: @escaping (Result<ResponseMovieList, RequestError>) -> Void) {

        let params: Parameters = [
            "api_key" : self.getAPIKey()
        ]
        
        APIRequest.shared.makeRequest(resourceIn: .getMovieList, paramsIn: params) { (resultIn) in
            
            switch resultIn {
            case .success((let dataIn)):
                if let mResponse = try? newJSONDecoder().decode(ResponseMovieList.self, from: dataIn) {
                    completion(.success(mResponse))
                }else{
                    completion(.failure(.dataMappingError("")))
                }
            case .failure(let errorIn):
                completion(.failure(errorIn))
            }
        }
        
    }
    
    //MARK: Fetch Upcoming Movie List
    func getUpcomingList(completion: @escaping (Result<ResponseMovieList, RequestError>) -> Void) {
        
        let params: Parameters = [
            "api_key" : self.getAPIKey()
        ]
        
        APIRequest.shared.makeRequest(resourceIn: .getUpcoming, paramsIn: params) { (resultIn) in
            
            switch resultIn {
            case .success((let dataIn)):
                ezLog(dataIn)
                if let mResponse = try? newJSONDecoder().decode(ResponseMovieList.self, from: dataIn) {
                    completion(.success(mResponse))
                }else{
                    completion(.failure(.dataMappingError("")))
                }
            case .failure(let errorIn):
                completion(.failure(errorIn))
            }
        }
    }
    
    //MARK: Get Movie Genre List
    func getGenreList(completion: @escaping (Result<ResponseGenreList, RequestError>) -> Void) {
        
        let params: Parameters = [
            "api_key" : self.getAPIKey()
        ]
        
        APIRequest.shared.makeRequest(resourceIn: .getGenreList, paramsIn: params) { (resultIn) in
            
            switch resultIn {
            case .success((let dataIn)):
                ezLog(dataIn)
                if let mResponse = try? newJSONDecoder().decode(ResponseGenreList.self, from: dataIn) {
                    completion(.success(mResponse))
                }else{
                    completion(.failure(.dataMappingError("")))
                }
            case .failure(let errorIn):
                completion(.failure(errorIn))
            }
        }
    }
}
