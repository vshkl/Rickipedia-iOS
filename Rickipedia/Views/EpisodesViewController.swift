//
//  ViewController.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit
import Moya

class EpisodesViewController: UIViewController {

    @IBOutlet weak var episodesTableView: UITableView!
    
    var episodes: [Episode] = []
    var page: Int = 1
    var pages: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Episodes"
        
        episodesTableView.dataSource = self
        episodesTableView.delegate = self
        
        fetchEpisodes()
    }
    
    private func fetchEpisodes(forPage page: Int = 1) {
        let moyaProvider = MoyaProvider<APIService>()
        
        moyaProvider.request(.episodes(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let episodesResponse = try response.map(EpisodesResponse.self)
                    self.episodes.append(contentsOf: episodesResponse.results)
                    self.page = page
                    self.pages = episodesResponse.info.pages
                    self.episodesTableView.reloadData()
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

extension EpisodesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
        
        cell.episodeView.episode = episodes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (pages >= page && indexPath.row == episodes.count - 1) {
            fetchEpisodes(forPage: page + 1)
        }
    }
    
}

// MARK: - UITableViewDelegate

extension EpisodesViewController: UITableViewDelegate {
    
}
