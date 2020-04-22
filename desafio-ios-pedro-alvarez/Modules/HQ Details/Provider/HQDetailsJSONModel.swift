//
//  HQDetailsJSONModel.swift
//  desafio-ios-pedro-alvarez
//
//  Created by Pedro Alvarez on 21/04/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import ObjectMapper

final class HQDetailsJSONModel: Mappable {
    
    var id: Int = 0
    var title: String = .empty
    var description: String = .empty
    var images: [[String : Any]] = []
    var costs: [[String : Any]] = []
    
    private var path: String {
        return images[0]["path"] as! String
    }
    private var fileExtension: String {
        return images[0]["extension"] as! String
    }
    
    var cost: Double? {
        if costs.count > 0 {
            if let cost = costs[0]["price"] as? Double {
                return cost
            }
        }
        return nil
    }
    
    var imageURL: String {
        path + .dot + fileExtension
    }
    
    init?(map: Map) { }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        images <- map["images"]
        costs <- map["prices"]
    }
}
