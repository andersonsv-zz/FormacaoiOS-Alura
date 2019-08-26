//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Alura on 21/06/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class Viagem: Codable {
    let id: Int
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let imageUrl: String
    let localizacao: String
}
