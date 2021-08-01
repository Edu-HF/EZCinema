//
//  Extension.swift
//  EZCinema
//
//  Created by Edu on 18/07/21.
//

import Foundation
import UIKit
import Nuke
import Lottie

//MARK: EX String
extension String {
    
    func buildURLStringIMG() -> String? {
        let mainDict = Bundle.main.infoDictionary
        guard let bURL = mainDict?["API_IMG_BASE_URL"] as? String else { return "" }
        return bURL + self
    }
    
    func getDate() -> String? {
        
        let mFDate = DateFormatter()
        mFDate.dateFormat = "yyyy-mm-dd"
        
        if let mDate = mFDate.date(from: self) {
            
            let mOF = DateFormatter()
            mOF.dateFormat = "MMM dd, yyyy"
            return mOF.string(from: mDate)
        }
        
        return "-"
    }
}

//MARK: EX Color
extension UIColor {
    
    @nonobjc class var swipeBGColor: UIColor {
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
    }
    
    
    @nonobjc class var baseViewBGColor: UIColor {
        return UIColor().fromHex(0x1B1E24)
    }
    
    @nonobjc class var baseAppColor: UIColor {
        return UIColor().fromHex(0x2B2F3D)
    }
    
    @nonobjc class var orangeColor: UIColor {
        return UIColor().fromHex(0xFF6B00)
    }
    
    @nonobjc class var redColor: UIColor {
        return UIColor().fromHex(0xEC4F4F)
    }
    
    @nonobjc class var blackColor: UIColor {
        return UIColor().fromHex(0x1A1D23)
    }
    
    @nonobjc class var darkColor: UIColor {
        return UIColor().fromHex(0x393D4C)
    }
    
    @nonobjc class var cellBColor: UIColor {
        return UIColor().fromHex(0x132555)
    }
    
    func fromHex(_ rgbValue:UInt32, alpha:Double=1.0) -> UIColor {
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}

//MARK: EX UIView
extension UIView {
    
    enum DirectionX {
        case Left
        case Right
    }
    
    enum DirectionY {
        case Top
        case Bottom
    }
    
    func animationSlideInHorizontal(delay: Double, direction: DirectionX, block: @escaping ()->()){
        self.isHidden = true
        if(DirectionX.Left == direction){
            self.transform = CGAffineTransform(translationX: -400, y: 0)
        }else{
            self.transform = CGAffineTransform(translationX: 400, y: 0)
        }
        UIView.animate(withDuration: delay,  animations: {
            self.isHidden = false
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            self.alpha = 1
        },  completion: { finished in
            block()
        })
    }
    
    func animationSlideInVertical(delay: Double, direction: DirectionY, block: @escaping ()->()){
        self.isHidden = true
        if(DirectionY.Top == direction){
            self.transform = CGAffineTransform(translationX: 0, y: -400)
        }else{
            self.transform = CGAffineTransform(translationX: 0, y: 800)
        }
        UIView.animate(withDuration: delay,  animations: {
            self.isHidden = false
            self.transform = CGAffineTransform(translationX: 0, y: 0)
            self.alpha = 1
        },  completion: { finished in
            block()
        })
    }
    
    func animationSlideOutVertical(delay: Double, directionIn: DirectionY, block: @escaping ()->()){
        
        UIView.animate(withDuration: delay, delay: 0.0, options: .curveEaseOut, animations: {
            if(DirectionY.Top == directionIn){
                self.transform = CGAffineTransform(translationX: 0, y: -400)
            }else{
                self.transform = CGAffineTransform(translationX: 0, y: 800)
            }
        }, completion: { finished in
            block()
        })
    }
    
    func animationFaceIn(durationIn: TimeInterval = 1.0, delayIn: TimeInterval = 0.0, alphaIn: CGFloat, completionIn: @escaping ((Bool) -> ()) = {(onFinish: Bool) -> () in}) {
        self.alpha = 0
        UIView.animate(withDuration: durationIn, delay: delayIn, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = alphaIn
            self.isHidden = false
        }, completion: completionIn)
        
    }
    
    func animationFaceOut(durationIn: TimeInterval = 1.0, delayIn: TimeInterval = 0.0, alphaIn: CGFloat, completionIn: @escaping ((Bool) -> ()) = {(onFinish: Bool) -> () in}) {
        self.alpha = 1
        UIView.animate(withDuration: durationIn, delay: delayIn, options:     UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = alphaIn
            self.isHidden = true
        }, completion: completionIn)
        
    }

    func animationShake() {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
    
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    func animationAlpha(delay: Double, block: @escaping ()->()){
        self.isHidden = false
        self.alpha = 0.0
        UIView.animate(withDuration: delay,  animations: {
            self.alpha = 1.0
        },  completion: { finished in
            self.alpha = 1.0
            block()
        })
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }

    func removeProcessor() {
        self.subviews.forEach { (it) in
            if it.tag == 109 {
                it.removeFromSuperview()
            }
        }
    }
    
    func addVBorder(cornersIn: UIRectCorner, radiusIn: CGFloat, roundedRectIn: CGRect? = nil) {
        let mPath = UIBezierPath(roundedRect: roundedRectIn ?? bounds, byRoundingCorners: cornersIn, cornerRadii: CGSize(width: radiusIn, height: radiusIn))
        let mMask = CAShapeLayer()
        mMask.path = mPath.cgPath
        layer.mask = mMask
        self.setNeedsLayout()
    }
    
    func addVerticalGradient(colorTopIn: UIColor = .clear, colorBottomIn: UIColor = .clear) {
        
        let mGLayer = CAGradientLayer()
        mGLayer.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: 80)
        mGLayer.colors = [colorTopIn.cgColor, colorBottomIn.cgColor]
        mGLayer.locations = [0.6, 1.0]
        mGLayer.zPosition = -1
        self.layer.addSublayer(mGLayer)
    }
}

//MARK: EZ NSObject
extension NSObject {
    
    func buildNukeOP() -> ImageLoadingOptions {
        return ImageLoadingOptions(
            placeholder: UIImage(named: "PlaceHolder_IC"),
            transition: .fadeIn(duration: 0.30)
        )
    }
    
    func createGenreSizeCell(textIn: String?) -> CGSize {
        
        let tempLB = UILabel.init(frame: .zero)
        tempLB.text = textIn
        tempLB.sizeToFit()
        return CGSize(width: 150, height: 30)
    }
}

//MARK: EX UIViewController
extension UIViewController {
    
    func setupNavBar(titleIn: String, withBackBtn: Bool, colorBGIn: UIColor = .white, titleColorIn: UIColor = .black) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.alpha = 1
        self.navigationItem.title = titleIn
        self.navigationController?.navigationBar.barTintColor = colorBGIn
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: titleColorIn]
        if withBackBtn {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style:.plain, target: self, action: #selector(backViewController))
            self.navigationItem.leftBarButtonItem?.tintColor = titleColorIn
        }else {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem()
        }
    }
    
    @objc func backViewController() {
        
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
            if(self.navigationController?.viewControllers.count == 1){
                self.dismiss(animated: true, completion: {})
            }
        }else{
            self.dismiss(animated: true, completion: {})
        }
    }
    
    func showLoading() {
        
        self.removeLoading()
        let mBGView = UIView(frame: UIScreen.main.bounds)
        mBGView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        mBGView.tag = 101
        
        let mAnimView = AnimationView()
        mAnimView.animation = Animation.named("JLoading")
        mAnimView.frame = CGRect(origin: UIScreen.main.bounds.origin, size: CGSize(width: 200, height: 200))
        mAnimView.center = self.view.center
        mAnimView.contentMode = .scaleAspectFit
        mBGView.addSubview(mAnimView)
        mAnimView.loopMode = .loop
        mAnimView.play()
        
        self.view.addSubview(mBGView)
    }
    
    func removeLoading() {
        self.view.viewWithTag(101)?.removeFromSuperview()
    }
    
    func showAlert(title: String, description: String) {
        
        DispatchQueue.main.async {
         
            let mAlert = UIAlertController(title: title, message: description, preferredStyle: .alert)
            mAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                mAlert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(mAlert, animated: true, completion: nil)
        }
    }
}
