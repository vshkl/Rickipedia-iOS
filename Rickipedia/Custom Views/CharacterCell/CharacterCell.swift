//
//  CharacterCellTableViewCell.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/30/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet var characterView: CharacterView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
