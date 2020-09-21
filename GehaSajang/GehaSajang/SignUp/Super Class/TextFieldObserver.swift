//
//  TextFieldObserver.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/21.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class TextFieldObserver: UITextField, ViewUpdating {
    
    var viewState: TextFieldState? {
        didSet {
            guard let textFieldState = viewState else { return }
            updateView(by: textFieldState)
        }
    }
    
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
    
    func updateView(by state: TextFieldState) {
        let color = TextFieldFactoryByState.colorByState(state: state)
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.borderColor = color.cgColor
    }
    
    @objc func updateState(_ notification: Notification) {
        guard let state = notification.userInfo?[UserInfoKey.TextFieldState] as? TextFieldState else { return }
        viewState = state
    }
    
    func setupNotification() { }
    
    func setupInitialView() { }
}
