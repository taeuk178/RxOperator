//
//  ButtonCell.swift
//  RxOperator
//
//  Created by tw on 2022/01/29.
//

import UIKit

class ButtonCell: UITableViewCell {

    @IBOutlet weak var bottomView: UIView!
    
    var isExpandable: Bool = false
    
    var closureCell: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        expandableButton.backgroundColor = .black
//
//        expandableButton.addTarget(self, action: #selector(touchButton(_:)), for: .touchUpInside)
        bottomView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print("selected: ", selected)
        bottomView.isHidden = !selected
    }
    
    @objc
    func touchButton(_ sender: UIButton) {
        
        isExpandable = !isExpandable
        
        closureCell?()
    }

}
