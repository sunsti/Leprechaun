//
//  GiftsModel.swift
//  Leprechaun
//
//  Created by apple on 03.01.2024.
//

import Foundation
struct GiftsModel: Decodable {
    
    let price: Int
    let id: String
    let description: String
    let image: String
    let title: String
}
