//
//  NetworkService.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation

class NetworkService {
    
    private let request = Requester()
    
    func getSearchMovie(completion: @escaping ([Search]) -> ()) {
        let params = ["s": "Batman", "page": "1"]
        request.getRequest(baseURL: .omdbapi, httpMetod: .GET, apiKey: .omdbapi, urlParams: params) { (data) in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(SearchMovieModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse.search)
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getMovieDescription(id: String, completion: @escaping (MovieModel) -> ()) {
        let params = ["i": id]
        request.getRequest(baseURL: .omdbapi, httpMetod: .GET, apiKey: .omdbapi, urlParams: params) { (data) in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(MovieModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
