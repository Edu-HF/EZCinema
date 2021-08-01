//
//  MovieACell.swift
//  EZCinema
//
//  Created by Edu on 17/07/21.
//

import UIKit
import Nuke

class MovieACell: UICollectionViewCell {

    //MARK: - Properties and Outlets
    @IBOutlet weak var mMovieIMG: UIImageView!
    @IBOutlet weak var mTitleLB: UILabel!
    
    //MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        
        self.mMovieIMG.image = UIImage(named: "PlaceHolder_IC")
        self.mTitleLB.text = ""
    }
    
    //MARK: - Private Methods
    
    //MARK: - Public Methods
    func setupCell(movieIn: Movie?) {
        
        guard let mMovie = movieIn else { return }
        
        self.mTitleLB.text = mMovie.mTitle
        if let imgURL = URL(string: mMovie.mPoster?.buildURLStringIMG() ?? "") {
            Nuke.loadImage(with: imgURL, options: self.buildNukeOP(), into: self.mMovieIMG)
        }
    }
}
