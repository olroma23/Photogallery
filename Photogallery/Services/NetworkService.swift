//
//  NetworkService.swift
//  Photogallery
//
//  Created by Roman Oliinyk on 06.09.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let params = self.prepareParams(searchTerm: searchTerm)
        let url = self.url(params: params)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID c-e7QtNSAPLOM9-BqUdexvhSTgklX5LvTgKuw2Mfm_8"
        return headers
    }
    
    private func prepareParams(searchTerm: String?) -> [String: String] {
        var params = [String: String]()
        params["page"] = String(1)
        params["query"] = searchTerm
        params["per_page"] = String(30)
        return params
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
}
