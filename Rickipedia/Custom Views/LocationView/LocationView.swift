//
//  LocationView.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/30/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class LocationView: UIView {
    
    var location: Location! {
        didSet {
            name.text = location.name
            type.text = location.type.capitalized
            dimension.text = location.dimension.capitalized
        }
    }
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var dimension: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LocationView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
