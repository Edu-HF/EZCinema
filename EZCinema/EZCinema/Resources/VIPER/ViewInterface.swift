//
//  ViewInterface.swift
//  EZCinema
//
//  Created by Edu on 17/07/21.
//

import Foundation
import UIKit

protocol ViewInterface: UIViewController {
}

extension ViewInterface{
    func showAlert(title: String, description: String){
        DispatchQueue.main.async {
            self.showAlert(title: title, description: description)
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.showLoading()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.removeLoading()
        }
    }
}
