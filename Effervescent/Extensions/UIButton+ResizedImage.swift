//
//  UIButton+ResizedImage.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import UIKit

@IBDesignable
class ResizedImageButton: UIButton {
    @IBInspectable var sizeImage: CGSize {
        get {
            return self.imageView?.image?.size ?? CGSize.zero
        }
        set {
            if let image = self.imageView?.image {
                let imgUpdate = image.resizedImage(Size: newValue)
                self.setImage(imgUpdate, for: .normal)
            }
        }
    }
}

extension UIImage {
    func resizedImage(Size sizeImage: CGSize) -> UIImage? {
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: sizeImage.width, height: sizeImage.height))
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        self.draw(in: frame)
        let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.withRenderingMode(.alwaysOriginal)
        return resizedImage
    }
}
