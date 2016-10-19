//
//  DBTableViewImageCell.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBTableViewImageCell: UITableViewCell {

    @IBOutlet weak private var scrollView_: UIScrollView!
    
    var scrollViewDelegate:UIScrollViewDelegate? {
        get {
            return self.scrollView_.delegate
        }
        set {
            self.scrollView_.delegate = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.db_buildUI()
    }
    
    
//MARK: Public methods
    
    func setCellImages(_ images:[String]) {
        var lastX:CGFloat = 0.0
        
        for (index, image) in images.enumerated() {
            let newX = Double(index) * Double(self.contentView.bounds.width)
            let imageView: UIImageView = UIImageView(frame: CGRect.init(x: CGFloat(newX),
                                                                        y: self.contentView.bounds.origin.y,
                                                                        width: self.contentView.bounds.width,
                                                                        height: self.contentView.bounds.height))
            
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: image)
            self.scrollView_.addSubview(imageView)
            
            lastX = imageView.frame.maxX
        }
        
        self.scrollView_.contentSize = CGSize(width: lastX, height: self.contentView.bounds.height)
    }
    
    
//MARK: Private methods
    
    private func db_buildUI() {
        self.selectionStyle = .none
        
        self.setNeedsUpdateConstraints()
    }

}
