//
//  LabelObserver.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/21.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class LabelObserver: UILabel, ViewUpdating {
    
    var viewState: TextFieldState? {
        didSet {
            guard let labeltate = viewState else { return }
            updateView(by: labeltate)
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

    func updateView(by state: TextFieldState) {
        if state != .Valid {
            self.isHidden = false
            self.text = state.rawValue
            self.textColor = TextFieldFactoryByState.colorByState(state: state)
        } else {
            self.isHidden = true
        }
    }

    func setupNotification() { }
    
    @objc func updateState(_ notification: Notification) {
        guard let state = notification.userInfo?[UserInfoKey.TextFieldState] as? TextFieldState else { return }
        viewState = state
    }
}

