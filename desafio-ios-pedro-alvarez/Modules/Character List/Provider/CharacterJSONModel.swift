//
//  CharacterJSONModel.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 20/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import ObjectMapper

final class CharacterJSONModel: Mappable {
    
    var id: Int = 0
    var name: String = .empty
    var description: String = .empty
    
    private var thumbnail: [String : Any] = [:]
    
    private var path: String{
        return thumbnail["path"] as! String
    }
    
    private var fileExtension: String{
        return thumbnail["extension"] as! String
    }
    
    var thumb: String{
        return path + "." + fileExtension
    }
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        thumbnail <- map["thumbnail"]
        description <- map["description"]
    }
}
