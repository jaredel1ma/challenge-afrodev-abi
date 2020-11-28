//
//  Beer.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 26/11/20.
//

import Foundation

struct Beer: Decodable {
    let product: String
    let description: String
    let price: Double
    let discount: Bool
    let imageURLString: String
    
    private enum CodingKeys : String, CodingKey {
        case product = "produto"
        case description = "descricao"
        case price = "preco"
        case discount = "desconto"
        case imageURLString = "imagem"
    }
}
