//
//  StringExtension.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import UIKit

extension String {
  func heightForLabel(font: UIFont, width: CGFloat) -> CGFloat {
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = self
    label.sizeToFit()
    
    return label.frame.height
  }
  
  func capitalizeFirstLetter() -> String {
    guard count > 0 else { return self }
    
    return prefix(1).uppercased() + self.lowercased().dropFirst()
  }
}
