//
//  LocationsViewController.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit
import Moya

class LocationsViewController: UIViewController {

    @IBOutlet weak var locationsTableView: UITableView!
    
    var locations: [Location] = []
    var page: Int = 1
    var pages: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Locations"
        
        locationsTableView.dataSource = self
        locationsTableView.delegate = self
        
        fetchLocations()
    }
    
    private func fetchLocations(forPage page: Int = 1) {
        let moyaProvider = MoyaProvider<APIService>()
        
        moyaProvider.request(.locations(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let locationsResponse = try response.map(LocationsResponse.self)
                    self.locations.append(contentsOf: locationsResponse.results)
                    self.page = page
                    self.pages = locationsResponse.info.pages
                    self.locationsTableView.reloadData()
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

extension LocationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
        
        cell.locationView.location = locations[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (pages >= page && indexPath.row == locations.count - 1) {
            fetchLocations(forPage: page + 1)
        }
    }
    
}

// MARK: - UITableViewDelegate

extension LocationsViewController: UITableViewDelegate {
    
}
