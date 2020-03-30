//
//  CharacterView.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/30/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CharacterView: UIView {
    
    var character: Character! {
        didSet {
            name.text = character.name
            status.text = character.status.capitalized
            configureImageView()
        }
    }
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CharacterView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func configureImageView() {
        let url = URL(string: character.image)!
        let placeholder = UIImage(systemName: "person.fill")!
        image.af.setImage(withURL: url, placeholderImage: placeholder, imageTransition: .crossDissolve(0.2))
    }

}
