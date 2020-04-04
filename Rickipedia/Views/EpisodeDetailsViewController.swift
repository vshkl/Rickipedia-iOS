//
//  EpisodeDetailsViewController.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 4/4/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {
    
    var episode: Episode?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = episode?.name
    }

}
