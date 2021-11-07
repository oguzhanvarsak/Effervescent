//
//  BoardCollectionViewCell.swift
//  Effervescent
//
//  Created by Oğuzhan Varsak on 7.11.2021.
//

import UIKit
import Foundation
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var board: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        visualView.layer.cornerRadius = 15
        visualView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    var item: Threads? {
        didSet {
            if let postAtIndex = item {
                let title = postAtIndex.sub ?? (postAtIndex.com ?? "")
                
                let fixedTitle = title.replaceBrokenChars(in: title)
                
                titleLabel.text = fixedTitle
                
                
                if let file = postAtIndex.tim, let ext = postAtIndex.ext, ext != ".webm" {
                    let imagePath = String(file) + "s" + ext
                    let board = board ?? ""
                    let photo = String(format: GeneralSettings.url.image, board, imagePath)
                    
                    imageView.kf.setImage(with: URL(string: photo),
                                          placeholder: nil,
                                          options: [.transition(ImageTransition.none)],
                                          progressBlock: nil)
                } else {
                    imageView.image = UIImage(named: "logo")
                    imageView.contentMode = .center
                }
            }
        }
    }

    // MARK: Internal Functions
    func prepareCell(post: Threads?) {
        item = post
    }
}


extension String {
    func replaceBrokenChars(in string: String?) -> String {
        var replacedString = string?.replacingOccurrences(of: "&#039;", with: "'")
        replacedString = string?.replacingOccurrences(of: "&amp;", with: "&")
        replacedString = string?.replacingOccurrences(of: "&quot;", with: "\"")
        replacedString = string?.replacingOccurrences(of: "<span class=\"quote\">&gt;", with: ">")
        replacedString = string?.replacingOccurrences(of: "</span>", with: "")
        replacedString = string?.replacingOccurrences(of: "<br>", with: " ")
        
        return replacedString!
    }
    
    func stringByRemovingAll(characters: [Character]) -> String {
            return String(self.characters.filter({ !characters.contains($0) }))
        }
}
