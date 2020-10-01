//
//  CalendarDataSource.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/10/01.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarDataSource: NSObject, FSCalendarDataSource {
    
    var datesWithEvent = ["2020-10-03", "2020-10-06", "2020-10-12", "2020-10-25"]
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    //TODO: 네트워크에 요청 전 캐시 확인하기
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    //TODO: API에서 각 날짜별 예약 현황(퍼센트)를 받아와 날짜 밑에 퍼센트별 색상 표시하기
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter.string(from: date)
        if self.datesWithEvent.contains(dateString) {
            return 1
        }
        return 0
    }
}
