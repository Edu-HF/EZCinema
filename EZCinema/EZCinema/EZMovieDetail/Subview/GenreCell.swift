//
//  GenreCell.swift
//  EZCinema
//
//  Created by Edu on 17/07/21.
//

import UIKit

class GenreCell: UICollectionViewCell {

    //MARK: Outlets and Vars
    @IBOutlet weak var mGenreLB: UILabel!
    
    //MARK: Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.mGenreLB.text = ""
    }

    //MARK: Public Methods
    func setupCell(genreIn: Genre?) {
        self.mGenreLB.text = genreIn?.mName
        self.mGenreLB.sizeToFit()
    }
    
}
