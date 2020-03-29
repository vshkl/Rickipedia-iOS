//
//  EpisodeView.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class EpisodeView: UIView {
    
    var episode: Episode! {
        didSet {
            title.text = episode.name
            slug.text = episode.episode
            airDate.text = episode.airDate
        }
    }
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var slug: UILabel!
    @IBOutlet weak var airDate: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("EpisodeView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
