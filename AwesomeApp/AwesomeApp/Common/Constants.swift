//
//  Constants.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let protocolo: String = "https://"
    static let apiVersion: String = "/v1"
    static let domain: String = "gateway.marvel.com"
    static let domainImage: String = "https://cagdaseksi.com/t/p"
    static let apiKey: String = "9be3d5999fe0f5f75916d436c8ecfa75"
    static let ts: String = "1600515700"
    static let hash: String = "eb6de4ec60b2e279074209520c39cb53"
    static let keyPath: String = "apikey="
    static let keyHash: String = "hash="
    static let keyts: String = "ts="
    static let limit: String = "limit=\(30)"
    
    struct Api {
         static let baseUrl = Constants.protocolo + Constants.domain + Constants.apiVersion
         static let characterUrl = Constants.Api.baseUrl + CharactersEndPoint.getCharacters.rawValue + Constants.keyPath + Constants.apiKey + "&" + Constants.keyHash + Constants.hash + "&" + Constants.keyts + Constants.ts
         static let comicsUrl = Constants.Api.baseUrl + CharactersEndPoint.getRoot.rawValue
         static let apiEnd = Constants.keyPath + Constants.apiKey + "&" + Constants.keyHash + Constants.hash + "&" + Constants.keyts + Constants.ts
    }
    
    struct DummyImage {
        static let url = "https://tineye.com/images/widgets/mona.jpg"
    }
    
}
