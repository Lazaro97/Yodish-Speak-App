//
//  OnBoardingCollectionViewCell.swift
//  YodaApp
//
//  Created by Lazaro Ambrosio on 11/22/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardingSliderImgView: UIImageView!
    
    func configure(image:UIImage) {
        onboardingSliderImgView.image = image
    }
}
