//
//  MovieBCell.swift
//  EZCinema
//
//  Created by Edu on 17/07/21.
//

import UIKit
import Nuke

class MovieBCell: UITableViewCell {
    
    //MARK: - Properties and Outlets
    @IBOutlet weak var mMovieIMG: UIImageView!
    @IBOutlet weak var mTitleLB: UILabel!
    @IBOutlet weak var mDateLB: UILabel!
    @IBOutlet weak var mRateNumLB: UILabel!
    
    //MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
        
        self.mMovieIMG.image = UIImage(named: "PlaceHolder_IC")
        self.mTitleLB.text = ""
        self.mDateLB.text = ""
        self.mRateNumLB.text = ""
        
    }
    
    //MARK: - Private Methods
    
    //MARK: - Public Methods
    func setupCell(movieIn: Movie?) {
        
        guard let mMovie = movieIn else { return }
        ezLog(mMovie)
        
        self.mTitleLB.text = mMovie.mTitle
        self.mDateLB.text = mMovie.mReleaseDate?.getDate()
        self.mRateNumLB.text = (mMovie.mRanking != nil) ? "vote: " + String(mMovie.mRanking ?? 0) : ""
        if let imgURL = URL(string: mMovie.mPoster?.buildURLStringIMG() ?? "") {
            Nuke.loadImage(with: imgURL, options: self.buildNukeOP(), into: self.mMovieIMG)
        }
    }

}
