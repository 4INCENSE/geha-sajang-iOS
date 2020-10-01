//
//  CalendarGestureRecognizerDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/29.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

extension CalendarViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let shouldBegin = self.dailyTableView.contentOffset.y <= -self.dailyTableView.contentInset.top
        if shouldBegin {
            let velocity = self.scopeGesture.velocity(in: self.view)
            switch self.calendar.scope {
            case .month:
                return velocity.y < 0
            case .week:
                return velocity.y > 0
            }
        }
        return shouldBegin
    }
}
