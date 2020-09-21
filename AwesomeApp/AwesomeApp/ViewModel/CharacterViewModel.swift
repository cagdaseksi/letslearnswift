//
//  CharacterViewModel.swift
//  AwesomeApp
//
//  Created by MAC on 20.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
import UIKit

class CharacterViewModel{
    
    weak var vc: CharacterViewController?
    weak var vcDetail: DetailViewController?
    var arrCharacter = [Results]()
    var arrComics = [ComicsResults]()
    
    func getAllCharacters(limit: Int = 30, offset: Int = 0){
        
        let fullUrl = "\(Constants.Api.characterUrl)&limit=\(limit)&offset=\(offset)"
        
        guard let url = URL(string: fullUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil{
                if let data = data {
                    do{
                        
                        let response = try JSONDecoder().decode(RootModel.self, from: data)
                        
                        let arr = Array((response.data?.results)!)
                        
                        self.arrCharacter.append(contentsOf: arr)
                        
                        DispatchQueue.main.async{
                            self.vc?.tblView.reloadData()
                        }
                    }catch let err{
                        print(err)
                    }
                }
            }else{
                print("\(error?.localizedDescription ?? "error")")
            }
        }.resume()
    }
    
    func getAllComicsById(characterId: Int, limit: Int = 10){
        
        let fullUrl = "\(Constants.Api.comicsUrl)/\(characterId)/comics?dateRange=2005-12-31%2C2020-09-01&orderBy=focDate&limit=\(limit)&\(Constants.Api.apiEnd)"
        
        guard let url = URL(string: fullUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil{
                if let data = data {
                    do{
                        let response = try JSONDecoder().decode(ComicsModel.self, from: data)
                        
                        let arr = Array((response.data?.results)!)
                        self.arrComics.append(contentsOf: arr)
                        
                        DispatchQueue.main.async{
                            self.vcDetail?.tblView.reloadData()
                        }
                    }catch let err{
                        print(err)
                    }
                }
            }else{
                print("\(error?.localizedDescription ?? "error")")
            }
        }.resume()
    }
    
}
