//
//  Service.swift
//  PostApp
//
//  Created by Valentin on 25.05.2021.
//

import UIKit

enum OrderBy: String {
    case mostPopular
    case mostCommented
    case createdAt
}

class Service {
    
    
    let decoder = JSONDecoder()
    
    func downloadPhoto(orderBy: OrderBy, from: String?, completion: @escaping (Response) -> Void) {
        
        
        
        var baseUrl = "https://k8s-stage.apianon.ru/posts/v1/posts?first=20&orderBy=\(orderBy.rawValue)"
    
        if let from = from {
            baseUrl = "https://k8s-stage.apianon.ru/posts/v1/posts?first=20&after=\(from)&orderBy=\(orderBy)"
        }
            if let url = URL(string: baseUrl) {
                URLSession.shared.dataTask(with: url) { data, responce, error in
                    if let data = data {
                        do {
                            let object = try self.decoder.decode(Response.self, from: data)
                            DispatchQueue.main.async {
                                completion(object)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
            }
        
    }
    
}
