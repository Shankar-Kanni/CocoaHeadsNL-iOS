//
//  JobsCollectionViewCell.swift
//  CocoaHeadsNL
//
//  Created by Bart Hoffman on 27/05/15.
//  Copyright (c) 2015 Stichting CocoaheadsNL. All rights reserved.
//

import Foundation

class JobsCollectionViewCell: PFCollectionViewCell {
    
    override func layoutSubviews() {
        imageView.contentMode = .ScaleAspectFit
    }
    
    override func updateFromObject(object: PFObject?)
    {
        if let job = object as? Job {
            
            if let logoFile = job.logo {
                imageView.file = logoFile
                let frameForImage = CGRectMake(0, 0, 130, 70)
                imageView.frame = CGRectInset(frameForImage, 5, 5)
                imageView.clipsToBounds = true
                imageView.contentMode = .ScaleAspectFit
                imageView.image = UIImage(named: "CocoaHeadsNLLogo")
                imageView.loadInBackground({ (image, error) -> Void in
                    if error == nil {
                        self.layoutIfNeeded()
                    }
                })
                
            }
        
            if let title = job.title {
                textLabel.frame = CGRectMake(0, 70, 140, 20)
                textLabel.text = title
                textLabel.font = UIFont.systemFontOfSize(8)
                textLabel.textAlignment = .Center
            }
            
            contentView.layer.borderWidth = 0.5
            contentView.layer.borderColor = UIColor.grayColor().CGColor
        }
    }
    
}