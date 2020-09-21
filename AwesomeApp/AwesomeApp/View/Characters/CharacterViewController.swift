//
//  CharacterViewController.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var limit = 30
    var offset = 0
    
    var characterModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        characterModel.vc = self
        characterModel.getAllCharacters()
    }

}

extension CharacterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterModel.arrCharacter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        let row = characterModel.arrCharacter[indexPath.row]
        cell.title.text = row.name
        cell.img.load(url: URL(string: row.fullUrl)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characterModel.arrCharacter.count - 1 {
            offset = offset + limit
            characterModel.getAllCharacters(limit: limit, offset: offset)
            self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenRow = characterModel.arrCharacter[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: chosenRow)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let vc = segue.destination as? DetailViewController {
                let result = sender as! Results
                vc.result = result
            }
        }
    }
    
    @objc func loadTable() {
        self.tblView.reloadData()
    }
    
}
