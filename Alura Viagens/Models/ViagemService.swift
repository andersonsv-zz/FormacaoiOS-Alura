//
//  ViagemService.swift
//  Alura Viagens
//
//  Created by Anderson on 18/08/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import Foundation
import Alamofire

class ViagemService: Service {
    let url = "https://backend-formacao.herokuapp.com/viagens"
    func retornaTodasAsViagens(response: Response<[Viagem]>) {
        let url = "\(endPoint)viagens"
        request(url, response: response)
    }
}

