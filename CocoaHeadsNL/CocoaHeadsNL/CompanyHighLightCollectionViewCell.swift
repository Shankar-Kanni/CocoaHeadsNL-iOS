//
//  CompanyHighLightCollectionViewCell.swift
//  CocoaHeadsNL
//
//  Created by Bart Hoffman on 01/06/15.
//  Copyright (c) 2015 Stichting CocoaheadsNL. All rights reserved.
//

import Foundation

class CompanyHighLightCollectionViewCell: PFCollectionViewCell {
    
    override func updateFromObject(object: PFObject?) {
        
        if let company = object as? Company {
            
            if let companyLogo = company.logo {
                imageView.file = companyLogo
                imageView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 89)
                imageView.image = UIImage(named: "CocoaHeadsNLLogo")
                imageView.contentMode = .ScaleAspectFit
                imageView.loadInBackground().continueWithSuccessBlock({[weak self] (task: BFTask!) -> AnyObject! in
                    self?.setNeedsLayout()
                    return nil
                    })
            }
            
            if let place = company.place {
                textLabel.text = place
                textLabel.font = UIFont.systemFontOfSize(8)
                textLabel.textAlignment = .Center
            }
            
            contentView.layer.borderWidth = (2.0 / UIScreen.mainScreen().scale) / 2
            contentView.layer.borderColor = UIColor.grayColor().CGColor
        }
    }
    
}