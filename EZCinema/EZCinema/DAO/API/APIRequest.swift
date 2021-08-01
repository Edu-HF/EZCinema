//
//  APIRequest.swift
//  EZCinema
//
//  Created by Edu on 18/07/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequest: NSObject {
    
    //MARK: Shared Instance
    static let shared = APIRequest()
    
    //MARK: Make a Request
    func makeRequest(resourceIn: APIResource, paramsIn: Parameters? = nil, completionHandler: @escaping(Result<(Data), RequestError>) -> Void) {
        
        guard let mURL: URL = resourceIn.baseURL?.appendingPathComponent(resourceIn.wsName) else { return }
        
        ezLog(mURL)
        ezLog(resourceIn.baseHeaders)
        AF.request(mURL, method: resourceIn.method, parameters: paramsIn, headers: resourceIn.baseHeaders)
            .validate()
            .responseJSON(queue: DispatchQueue.global(qos: .userInitiated)) { response in
                
                guard let dataResponse = response.data else { return completionHandler(.failure(.APIError(""))) }
                return completionHandler(.success((dataResponse)))
            }
    }
}
