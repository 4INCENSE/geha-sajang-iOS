//
//  SignInViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/04.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: SignInEmailTextField!
    @IBOutlet weak var emailAlertMessage: SignInEmailConditionLabel!
    @IBOutlet weak var passwordTextField: SignInPasswordTextField!
    @IBOutlet weak var passwordAlertMessage: SignInPasswordConditionLabel!
    @IBOutlet weak var signInStackView: UIStackView!
    let inputUserData = SignInInputUserData()
    let emailTextFieldDelegate = SignInEmailTextFieldDelegate()
    let passwordTextFieldDelegate = SignInPasswordTextFieldDelegate()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        initialSetUpView()
    }
    
    private func initialSetUpView() {
        navigationController?.navigationBar.isHidden = true
        emailAlertMessage.isHidden = true
        passwordAlertMessage.isHidden = true
        setupDelegate()
    }
    
    private func setupDelegate() {
        emailTextFieldDelegate.inputUserData = inputUserData
        emailTextField.delegate = emailTextFieldDelegate
        passwordTextFieldDelegate.inputUserData =  inputUserData
        passwordTextField.delegate = passwordTextFieldDelegate
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
    }
    
}
