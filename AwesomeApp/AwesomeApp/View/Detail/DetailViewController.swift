//
//  DetailViewController.swift
//  AwesomeApp
//
//  Created by MAC on 21.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var result: Results?
    var viewModel = CharacterViewModel()
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detail = result else { return }
        
        name.text = detail.name
        desc.text = detail.description
        image.load(url: URL(string: detail.fullUrl)!)
        viewModel.vcDetail = self
        viewModel.getAllComicsById(characterId: detail.id!)
        
    }
    
}
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrComics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        let row = viewModel.arrComics[indexPath.row]
        
        cell.title.text = row.title
        cell.img.load(url: URL(string: row.fullUrl)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenRow = viewModel.arrComics[indexPath.row]
        print(chosenRow)
    }
    
}
