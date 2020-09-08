//
//  NetworkDataFetcher.swift
//  Photogallery
//
//  Created by Roman Oliinyk on 06.09.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> Void) {
        networkService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else {
                let decode = self.decodeJSON(type: SearchResults.self, from: data)
                completion(decode)
            }
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
             print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
}
