//
//  LoginPasswordTextField.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/09.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignInPasswordTextField: UITextField {
    
    var textFieldState: TextFieldState? {
        didSet {
            guard let textFieldState = textFieldState else { return }
            updateView(by: textFieldState)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNotification()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNotification()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.PasswordTextFieldInput, object: nil)
    }

    private func updateView(by state: TextFieldState)  {
        let color = TextFieldFactoryByState.colorByState(state: state)
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.borderColor = color.cgColor
    }

    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.PasswordTextFieldInput, object: nil)
    }

    @objc private func updateState(_ notification: Notification) {
        guard let state = notification.userInfo?[UserInfoKey.TextFieldState] as? TextFieldState else { return }
        textFieldState = state
    }
}

