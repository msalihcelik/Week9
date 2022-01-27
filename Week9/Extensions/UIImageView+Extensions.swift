//
//  UIImageView+Extensions.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 3.12.2021.
//

import Kingfisher

extension UIImageView {
    
    func configureKF(url: String?) {
        guard let url = url else { return }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url), placeholder: nil, options: [.transition(.fade(0.7 ))], progressBlock: nil)
    }
}
