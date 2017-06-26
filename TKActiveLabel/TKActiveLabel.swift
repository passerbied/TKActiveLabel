//
//  TKActiveLabel.swift
//  TKActiveLabel
//
//  Created by i-chou on 26/06/2017.
//  Copyright © 2017 i-chou. All rights reserved.
//
import ActiveLabel
class TKActiveLabel: ActiveLabel {
    
    var space: CGFloat = 3.0
    
    func requiredHeight() -> CGFloat{
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height:  CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let contentStr = NSMutableAttributedString(string: self.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = self.space
        paragraphStyle.firstLineHeadIndent = 0
        contentStr.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, (self.text?.characters.count)!))
        contentStr.addAttribute(NSFontAttributeName, value: self.font, range: NSMakeRange(0, (self.text?.characters.count)!))
        label.attributedText = contentStr
        label.font = self.font
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.lineBreakMode = .byWordWrapping
        self.attributedText = contentStr
        self.sizeToFit()
        
        return label.frame.height
    }
    
    func setLineSpace(_ space: CGFloat = 3.0, alignment textAlignment: NSTextAlignment = .left) {
        if self.text != nil {
            self.space = space
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = space
            let contentStr = NSMutableAttributedString(string: self.text!)
            contentStr.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, contentStr.length))
            self.attributedText = contentStr
            self.sizeToFit()
            self.textAlignment = textAlignment
        }
    }
}
