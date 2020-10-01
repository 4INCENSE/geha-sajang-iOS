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
        //TODO: 선택한 예약의 상세 페이지로 이동
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
