//
//  EndPoints.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

//https://gateway.marvel.com/v1/public/characters?limit=10&ts=1600515700&apikey=9be3d5999fe0f5f75916d436c8ecfa75&hash=eb6de4ec60b2e279074209520c39cb53

enum CharactersEndPoint: String {
    case getCharacters  = "/public/characters?"
    case getRoot = "/public/characters"
    case getComics = "/comics?"
}
