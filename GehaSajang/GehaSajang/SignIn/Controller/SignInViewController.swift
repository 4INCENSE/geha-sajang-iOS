//
//  SignInViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/04.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    enum ErrorMessage: String, CustomStringConvertible {
        var description: String { return self.rawValue }
        case NoInput = "이메일과 비밀번호를 입력해주세요."
        case Invalid = "아이디나 비밀번호가 일치하지 않습니다."
        case NoAccount = "계정 정보가 없습니다."
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInResultAlertMessageLabel: UILabel!
    @IBOutlet weak var signInStackView: UIStackView!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        initialSetUpView()
    }
    
    private func initialSetUpView() {
        navigationController?.navigationBar.isHidden = true
        signInResultAlertMessageLabel.isHidden = true
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let inputEmail = emailTextField.text else { return }
        guard let inputPassword = passwordTextField.text else { return }
        let isFilled = ConditionChecker.isFilled(emailTextField: inputEmail, passwordTextField: inputPassword)
        if isFilled {
            // TODO:- API 로그인 요청하기
        } else {
            signInResultAlertMessageLabel.isHidden = false
            let color = TextFieldFactoryByState.colorByState(state: .NoInput)
            signInResultAlertMessageLabel.textColor = color
            signInResultAlertMessageLabel.text = ErrorMessage.NoInput.description
        }
    }
}
