//
//  DailyTableViewDelegate.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/29.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit
import FSCalendar

extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let scope: FSCalendarScope = (indexPath.row == 0) ? .month : .week
            self.calendar.setScope(scope, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == TableViewIndexPath.firstSection {
            return self.view.frame.height * 0.07
        }
        return self.view.frame.height * 0.055
    }
}
