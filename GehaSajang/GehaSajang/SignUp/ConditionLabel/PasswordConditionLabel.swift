//
//  PasswordConditionLabel.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/09.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class PasswordConditionLabel: UILabel {

    var labelState: TextFieldState? {
        didSet {
            guard let labelState = labelState else { return }
            updateView(by: labelState)
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
        NotificationCenter.default.addObserver(self, selector: #selector(updateState), name: NSNotification.Name.PasswordTextFieldInput, object: nil)
    }
    
    @objc private func updateState(_ notification: Notification) {
        guard let state = notification.userInfo?[UserInfoKey.TextFieldState] as? TextFieldState else { return }
        labelState = state
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
