//
//  TermsDetailViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/15.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class TermsDetailViewController: UIViewController {

    @IBOutlet weak var termTitleLabel: UILabel!
    @IBOutlet weak var termContentLabel: UILabel!
    var titleText: String? {
        didSet {
            guard let titleText = self.titleText else { return }
            termTitleLabel.text = titleText
        }
    }
    var contentText: String? {
        didSet {
            guard let contentText = self.contentText else { return }
            termContentLabel.text = contentText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
