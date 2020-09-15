//
//  SignInPasswordConditionLabel.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/14.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class SignInPasswordConditionLabel: UILabel {
    
    var state: TextFieldState? {
        didSet {
            guard let state = state else { return }
            updateView(by: state)
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
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.EmailTextFieldInput, object: nil)
    }
    
    @objc private func updateState(_ notification: Notification) {
        guard let state = notification.userInfo?[UserInfoKey.TextFieldState] as? TextFieldState else { return }
        self.state = state
    }
    
    private func updateView(by state: TextFieldState)  {
        if state != .Valid {
            self.isHidden = false
            self.text = state.rawValue
            self.textColor = TextFieldFactoryByState.colorByState(state: state)
        } else {
            self.isHidden = true
        }
    }
}
