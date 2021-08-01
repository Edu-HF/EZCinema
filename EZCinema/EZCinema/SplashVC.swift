//
//  ViewController.swift
//  EZCinema
//
//  Created by Edu on 17/07/21.
//

import UIKit
import Lottie

class SplashVC: UIViewController {

    // MARK: - Public properties
    private let mAnimView: AnimationView = AnimationView()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.playAnim()
    }
    

    // MARK: - Private Methods
    private func setupUI() {
        
        self.view.backgroundColor = .baseViewBGColor
        let mAnim = Animation.named("JIntro")
        self.mAnimView.animation = mAnim
        self.mAnimView.frame = CGRect(origin: self.view.frame.origin, size: CGSize(width: 300, height: 300))
        self.mAnimView.center = self.view.center
        self.mAnimView.contentMode = .scaleAspectFit
        self.view.addSubview(self.mAnimView)
    }
    
    private func playAnim() {
        
        self.mAnimView.play { _ in
            let mWirefame = EZMovieListWireframe()
            let navC = UINavigationController.init(rootViewController: mWirefame.viewController)
            navC.modalPresentationStyle = .fullScreen
            self.present(navC, animated: true, completion: nil)
        }
    }
    
    // MARK: - Public Methods
}

