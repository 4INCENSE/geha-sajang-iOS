//
//  SignUpViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK:- Properties
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var emailConditionLabel: EmailConditionLabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordConditionLabel: UILabel!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var nicknameConditionLabel: UILabel!
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK:- Methods
    
    @IBAction func emailEditingDidEnd(_ sender: UITextField) {
        // 여기서 이메일 형식 체크하기
//        if ConditionCheck.isValidEmail(sender.text!) {
        if !sender.text!.isEmpty {
            self.emailTextField.layer.borderWidth = 1.0
            self.emailTextField.cornerRadius = 10
            self.emailTextField.layer.borderColor = UIColor.systemBlue.cgColor
 
//            emailTextField.layer.borderColor
////            emailTextField.updateBorderColor(color:
//                UIColor(named: ColorName.mainBlue) as! CGColor)
        } else {
            self.emailTextField.layer.borderWidth = 1.0
            self.emailTextField.cornerRadius = 10
            self.emailTextField.layer.borderColor = UIColor.red.cgColor
//            emailTextField.layer.borderColor = CGColor(srgbRed: 10, green: 0, blue: 0, alpha: 1)
//            emailTextField.updateBorderColor(color: UIColor(named: "red") as! CGColor )
            emailConditionLabel.text = "이메일 형식이 올바르지 않습니다"
            emailConditionLabel.textColor = .red
//            emailConditionLabel.updateBorderColor(labelConfiguration(text: "이메일 형식이 올바르지 않습니다", textColor: UIColor(named: "System Red Color")!))
        }
    }
    
    @IBAction func passwordEditingDidEnd(_ sender: UITextField) {
        // 비밀번호 형식 체크하기
//        if ConditionCheck.isValidPassword(sender.text!) {
        if !sender.text!.isEmpty {
//            DispatchQueue.main.async {
//                 self.passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
                
                self.passwordTextField.layer.borderWidth = 1.0
                self.passwordTextField.cornerRadius = 10
                self.passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
//             }
        } else {
//            passwordTextField.layer.borderColor = CGColor(srgbRed: 10, green: 0, blue: 0, alpha: 1)
            
            self.passwordTextField.layer.borderWidth = 1.0
            self.passwordTextField.cornerRadius = 10
            self.passwordTextField.layer.borderColor = UIColor.red.cgColor
            //            emailTextField.updateBorderColor(color: UIColor(named: "red") as! CGColor )
                        passwordConditionLabel.text = "비밀번호 조건에 맞지 않습니다"
                        passwordConditionLabel.textColor = .red
        }
    }
    
    @IBAction func nicknameEditingDidEnd(_ sender: UITextField) {
        // 닉네임 형식 체크
        guard let textRange = sender.text?.count else { return }
        if textRange < 2 || textRange > 10 {
            self.nicknameTextField.layer.borderWidth = 1.0
            self.nicknameTextField.cornerRadius = 10
            self.nicknameTextField.layer.borderColor = UIColor.red.cgColor
            nicknameConditionLabel.textColor = .red
            nicknameConditionLabel.text = "2자에서 10자 이내로 작성해주세요."
        } else {
//                      DispatchQueue.main.async {
            self.nicknameTextField.layer.borderWidth = 1.0
            self.nicknameTextField.cornerRadius = 10
            self.nicknameTextField.layer.borderColor = UIColor.systemBlue.cgColor
//               }
        }
    }
    
    @IBAction func duplicatedNicknameCheckButtonTapped(_ sender: Any) {
        // 닉네임 중복 확인 요청 보내기
        
    }
    
}
//extension SignUpViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let newLength = (textField.text?.count)! + string.count - range.length
//        return !(newLength < 2 || newLength > 10)
//    }
//}
