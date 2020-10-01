//
//  DailyTableViewDataSource.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/29.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit

class DailyTableViewDataSource: NSObject, UITableViewDataSource {
    
    enum CalendarCellName {
        static let BookingStatusButtonsCell = "cell_BookingStatusButtonsCell"
        static let LastCell = "cell_last"
        static let CalendarDailyTableViewCell = "cell"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewIndexPath.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewIndexPath.numberOfRowsInEachSection[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == TableViewIndexPath.firstSection {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalendarCellName.BookingStatusButtonsCell)!
            return cell
        } else if indexPath.section == TableViewIndexPath.secondSection && indexPath.row == TableViewIndexPath.lastRow {
            let cell = tableView.dequeueReusableCell(withIdentifier: CalendarCellName.LastCell)!
            return cell
        } else {
            //TODO: API에서 예약자 목록을 받아와 tableView에 표시
            let cell = tableView.dequeueReusableCell(withIdentifier: CalendarCellName.CalendarDailyTableViewCell)!
            return cell
        }
    }
}
