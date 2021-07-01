//
//  ViewExtension.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 27/06/2021.
//

import Foundation
import UIKit

extension UIView{
    func dropCornerShadow(){
        self.layer.cornerRadius = 4
        self.setShadow()
    }
    
    private func setShadow(){
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
