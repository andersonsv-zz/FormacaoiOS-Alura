//
//  PacoteViagemService.swift
//  Alura Viagens
//
//  Created by Anderson on 18/08/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import Foundation
import Alamofire

class PacoteViagemService: Service {
    let url = "https://backend-formacao.herokuapp.com/"
    func retornaTodasAsViagens(response: Response<[PacoteViagem]>) {
        let url = "\(endPoint)pacotes"
        request(url, response: response)
    }
}
