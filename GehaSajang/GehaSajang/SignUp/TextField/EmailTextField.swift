//
//  EmailTextField.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/08/28.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class EmailTextField: UITextField {
    
    var textFieldState: TextFieldState? {
        didSet {
            guard let textFieldState = textFieldState else { return }
            updateView(by: textFieldState)
        }
    }
    let placeholderText = "이메일을 입력하주세요"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNotification()
        setupInitialView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNotification()
        setupInitialView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.EmailTextFieldInput, object: nil)
    }
    
    private func setupInitialView() {
        self.placeholder = placeholderText
    }
    
    private func updateView(by state: TextFieldState)  {
        let color = TextFieldFactoryByState.colorByState(state: state)
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.borderColor = color.cgColor
    }
     
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.EmailTextFieldInput, object: nil)
    }
    
    @objc private func updateState(_ notification: Notification) {
        guard let state = notification.userInfo?[UserInfoKey.TextFieldState] as? TextFieldState else { return }
        textFieldState = state
    }
}
