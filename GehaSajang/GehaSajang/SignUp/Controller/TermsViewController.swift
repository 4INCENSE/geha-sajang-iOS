//
//  TermsViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit
import BEMCheckBox

class TermsViewController: UIViewController {

    @IBOutlet weak var agreeAllCheckbox: BEMCheckBox!
    @IBOutlet weak var agreeConditionsCheckbox: BEMCheckBox!
    @IBOutlet weak var agreePersonalsCheckbox: BEMCheckBox!
    @IBOutlet weak var agreeMarketingCheckbox: BEMCheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = false
        agreeAllCheckbox.boxType = .square
        agreeConditionsCheckbox.boxType = .square
        agreePersonalsCheckbox.boxType = .square
        agreeMarketingCheckbox.boxType = .square
        agreeAllCheckbox.widthAnchor.constraint(equalToConstant: 25).isActive = true
        agreeConditionsCheckbox.widthAnchor.constraint(equalToConstant: 25).isActive = true
        agreePersonalsCheckbox.widthAnchor.constraint(equalToConstant: 25).isActive = true
        agreeMarketingCheckbox.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
