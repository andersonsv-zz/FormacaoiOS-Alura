//
//  Service.swift
//  Alura Viagens
//
//  Created by Anderson on 20/08/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import Foundation
import Alamofire

protocol Service: class {
    var endPoint: String { get }
}

extension Service {
    var endPoint: String {
        return "https://backend-formacao.herokuapp.com/"
    }
    
    typealias Response<T> = (success: (T) -> Void, failure: (Error) -> Void, completion: () -> Void)
  
    @discardableResult
    func request<T: Decodable>(_ url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, keyPath: String? = nil, response: Response<T>) -> DataRequest {
        return Alamofire.request(url,
                                 method: method,
                                 parameters: parameters,
                                 encoding: encoding,
                                 headers: headers)
            .validate()
            .responseDecodable(completionHandler: completionHandler(for: response))
    }
    
    func completionHandler<T : Decodable>(for response: Response<T>) -> (DataResponse<T>) -> Void {
        return { [weak self] dataResponse in
            defer { response.completion() }

            switch dataResponse.result {
            case .success(let value):
                response.success(value)
                break
            case .failure(let error):
                response.failure(error)
            }
        }
    }

}
