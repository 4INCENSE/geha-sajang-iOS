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
    @IBOutlet weak var agreeButton: UIButton!
    let termDetailViewController = UIStoryboard.termsDetailViewController as? TermsDetailViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
    }
    
    private func setupInitialView() {
        self.navigationController?.isToolbarHidden = false
        agreeButton.layer.cornerRadius = 20
        agreeButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    // TODO:- API 요청
    @IBAction func agreeButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func userInfoTermsViewButtonTapped(_ sender: Any) {
        // TODO:- API 요청해서 개인정보 수집 및 이용 동의 약관 내용 받아와서 파라미터에 넣어주기
        presentTermsDetailVC(title: "title", content: "content")
    }
    
    @IBAction func termsAndConditionsViewButtonTapped(_ sender: Any) {
        // TODO:- API 요청해서 이용 약관 내용 받아와서 ViewController에 표시
        presentTermsDetailVC(title: "title", content: "content")
    }
    
    @IBAction func marketingTermsButtonTapped(_ sender: Any) {
        // TODO:- API 요청해서 마케팅 정보 수신 약관 내용 받아와서 ViewController에 표시
        presentTermsDetailVC(title: "title", content: "content")
    }
    
    private func presentTermsDetailVC(title: String, content: String) {
        guard let termDetailViewController = self.termDetailViewController else { return }
        self.present(termDetailViewController, animated: true) {
            termDetailViewController.titleText = title
            termDetailViewController.contentText = content
        }
    }
}


