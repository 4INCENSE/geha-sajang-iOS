//
//  SignUpViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/04.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var passwordTextField: SignUpPasswordTextField!
    @IBOutlet weak var checkPasswordTextField: CheckPasswordTextField!
    @IBOutlet weak var nicknameTextField: NicknameTextField!
    @IBOutlet weak var profileTextField: UITextField!
    @IBOutlet weak var emailAlertMessageLabel: EmailConditionLabel!
    @IBOutlet weak var passwordAlertMessageLabel: PasswordConditionLabel!
    @IBOutlet weak var checkPasswordConditionLabel: PasswordConditionLabel!
    @IBOutlet weak var nickNameConditionLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    let alert = UIAlertController(title: "회원가입 완료", message: "회원가입이 완료되었습니다. 서비스 이용을 위해 게스트하우스에 대한 정보를 등록해주세요.", preferredStyle: .alert)
    let inputUserData = InputUserData()
    let picker = UIImagePickerController()
    private let emailDelegate = EmailTextFieldDelegate()
    private let passwordDelegate = PasswordTextFieldDelegate()
    private let checkPasswordDelegate = CheckPasswordTextFieldDelegate()
    private let nicknameDelegate = NicknameTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupinitialView()
        picker.delegate = self
    }
    
    private func setupinitialView() {
        profileTextField.isUserInteractionEnabled = false
        emailAlertMessageLabel.isHidden = true
        passwordAlertMessageLabel.isHidden = true
        checkPasswordConditionLabel.isHidden = true
        nickNameConditionLabel.isHidden = true
    }
    
    private func setupDelegate() {
        emailDelegate.inputUserData = inputUserData
        passwordDelegate.inputUserData = inputUserData
        checkPasswordDelegate.inputUserData = inputUserData
        nicknameDelegate.inputUserData = inputUserData
        emailTextField.delegate = emailDelegate
        passwordTextField.delegate = passwordDelegate
        checkPasswordTextField.delegate = checkPasswordDelegate
        nicknameTextField.delegate = nicknameDelegate
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        profileImageView.image = #imageLiteral(resourceName: "gehaSaJangLogo_white")
        profileTextField.placeholder = "파일을 업로드해 주세요"
    }
    
    @IBAction func uploadButtonTapped(_ sender: Any) {
        let alert =  UIAlertController(title: "프로필 이미지 선택", message: "카메라 / 사진앱에서 이미지를 가져오기", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let registerGuesthouseVC = UIStoryboard.registerGuesthouseViewController
        let loginVC = UIStoryboard.loginViewController
        
        let okAction = UIAlertAction(title: "계속하기", style: .default) { (action) in
            self.navigationController?.pushViewController(registerGuesthouseVC, animated: true)
        }
        let cancel = UIAlertAction(title: "다음에 하기", style: .cancel) {(action) in
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }else{
            print("카메라 앱을 이용할 수 없습니다.")
        }
    }
}

extension SignUpViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            profileImageView.image = image
        }
        dismiss(animated: true, completion: nil)
        print(UIImagePickerController.InfoKey.originalImage.rawValue)
        profileTextField.placeholder = ""
    }
    
}
