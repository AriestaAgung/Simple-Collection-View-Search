//
//  Constants.swift
//  searchView
//
//  Created by odikk on 27/01/22.
//

import Foundation
import UIKit

struct CollectionData{
    let id: String
    let name: String
    let img: UIImage
}

class Constants{
    static let shared = Constants()
    
    let images = [
        UIImage(named: "random1"),
        UIImage(named: "random2"),
        UIImage(named: "hill1"),
        UIImage(named: "hill2"),
    ]
    
    func generateData() -> [CollectionData] {
        return [
            CollectionData(id: "random1", name: "random 1", img: images[0]!),
            CollectionData(id: "random2", name: "random 2", img: images[1]!),
            CollectionData(id: "hill1", name: "hill 1", img: images[2]!),
            CollectionData(id: "hill2", name: "hill 2", img: images[3]!),
        ]
    }
}
