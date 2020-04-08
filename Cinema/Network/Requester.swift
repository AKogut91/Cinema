//
//  Requester.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation

class Requester {
    
    enum BaseURL: String {
        case omdbapi
        var description: String {
            get {
                switch self {
                case .omdbapi:
                    return "http://www.omdbapi.com/"
                }
            }
        }
    }
    
    enum ApiKey: String {
        case omdbapi
        var description: String {
            get {
                switch self {
                case .omdbapi:
                    return PlistParser().getValue(plistName: .ApiKey, key: .omdbapi)
                }
            }
        }
    }
    
    enum HttpMetod: String {
        case GET, POST
    }
    
    func getRequest(baseURL: Requester.BaseURL, httpMetod: Requester.HttpMetod, apiKey: Requester.ApiKey, urlParams: [String: String], completion: @escaping (Data?) -> ()) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard var URL = URL(string: baseURL.description) else {return}
        var URLParams = urlParams
        URLParams["apikey"] = apiKey.description
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = httpMetod.rawValue
        Logger.Log("url \(URL.absoluteString) \nhttpMethod \(httpMetod.rawValue)")
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(data)
            } else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}

