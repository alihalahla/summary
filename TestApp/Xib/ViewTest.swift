//
//  ViewTest.swift
//  TestApp
//
//  Created by עלי חלאחלה on 19/10/2023.
//

import Foundation
import UIKit

class ViewTest: UIView {
    
    @IBOutlet var showTable: UIButton!
    @IBOutlet var title: UILabel!
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    private func loadViewFromNib(){
        
        Bundle.main.loadNibNamed("ViewTest", owner: self, options: nil)
        
        addSubview(title)
        addSubview(showTable)
        
        title.textColor = UIColor.mainBlue
        
        title.frame = CGRect(x: (screenSize.width - self.title.frame.size.width)/2, y: self.title.frame.origin.y, width:self.title.frame.size.width, height: self.title.frame.size.height)
        let text = localizedString(forKey: "test")
        title.text = text
        
        showTable.addTarget(self, action: #selector(showTableBtn), for: .touchUpInside)
        showTable.layer.cornerRadius = 18
        showTable.setTitleColor(.mainWhite, for: .normal)
        showTable.backgroundColor = .borderButton
        showTable.layer.shadowColor = UIColor.black.cgColor
        showTable.layer.shadowOpacity = 0.29
        showTable.layer.shadowOffset = .zero
        showTable.layer.shadowRadius = 6
        showTable.titleLabel!.minimumScaleFactor = 0.5
        showTable.titleLabel!.adjustsFontSizeToFitWidth = true
        showTable.layer.borderWidth = 2
        showTable.layer.borderColor = UIColor.mainWhite.cgColor
        
    }
    
    @objc func showTableBtn() {
        NotificationCenter.default.post(name: ViewController.itemClicked, object: nil, userInfo:["data": ""])
        
    }
}
