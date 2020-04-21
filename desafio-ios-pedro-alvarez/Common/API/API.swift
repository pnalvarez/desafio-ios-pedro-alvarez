//
//  API.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Alamofire
import ObjectMapper

enum APIResult<T> {
    case sucess(T)
    case error(APIError)
}

enum APIError {
    case parseError
    case genericError
}

final class API{
    
    static let shared = API()
    
    let baseURL = "http://gateway.marvel.com/v1/public/characters"
    
    let apiTotal: Int = 1492
    
    func getCharacters(offset: Int, limit: Int, completion: @escaping (APIResult<[CharacterJSONModel]>) -> ()){
        
        let url = baseURL+"?ts=1&apikey=5d270d6ba90b8e7de71d2a65b6cce967&hash=1eb2d8a190e62c0ecf934462a91eb071&offset=\(offset)&limit=\(limit)"
        
        request(url: url){ character in
            
            guard let result = character, let data = result["data"] as? [String : Any], let total = data["total"] as? Int ,let chars = Mapper<CharacterJSONModel>().mapArray(JSONObject: data["results"]) else{
                completion(.error(.parseError))
                return
            }
            CharacterModel.total = total
            completion(.sucess(chars))
        }
    }
}

extension API{
    
    private func request(url: String, completion: @escaping ([String: Any]?) -> ()){
        
        guard let url = URL(string: url) else{
            return
        }
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON(completionHandler: { (response) in
            
            completion(response.result.value as? [String : Any])
        })
    }
}
