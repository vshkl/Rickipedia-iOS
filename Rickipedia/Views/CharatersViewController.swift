//
//  CharatersViewController.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit
import Moya

class CharatersViewController: UIViewController {

    @IBOutlet weak var charactersTableView: UITableView!
    
    var characters: [Character] = []
    var page: Int = 1
    var pages: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Characters"
        
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        
        fetchCharacters()
    }
    
    private func fetchCharacters(forPage page: Int = 1) {
        let moyaProvider = MoyaProvider<APIService>()
        
        moyaProvider.request(.characters(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let charactersResponse = try response.map(CharactersResponse.self)
                    self.characters.append(contentsOf: charactersResponse.results)
                    self.page = page
                    self.pages = charactersResponse.info.pages
                    self.charactersTableView.reloadData()
                } catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }

}

// MARK: - UITableViewDataSource

extension CharatersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.characterView.character = characters[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (pages >= page && indexPath.row == characters.count - 1) {
            fetchCharacters(forPage: page + 1)
        }
    }
    
}

// MARK: - UITableViewDelegate

extension CharatersViewController: UITableViewDelegate {
    
}
