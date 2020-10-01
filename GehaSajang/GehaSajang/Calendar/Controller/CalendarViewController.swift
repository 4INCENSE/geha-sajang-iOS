//
//  CalendarViewController.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/29.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {

    //TODO: 방 예약 현황 / 서비스 이용 현황 두 버튼 IBOutlet으로 연결
    //TODO: 객실 예약 현황 버튼 -> 방 예약 현황 화면으로 전환
    //TODO: 서비스 이용 현황 버튼 -> 게스트하우스 서비스 이용 현황 화면으로 전환
    @IBOutlet weak var dailyTableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    private let dailyTableViewDataSource = DailyTableViewDataSource()
    private let calendarDataSource = CalendarDataSource()
    private var isMonthScope = true
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        return panGesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
        setCalendarHeight()
        setupTableView()
        setupCalendar()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(NSNotification.Name.CalendarButtonTapped)
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.CalendarButtonTapped, object: nil, queue: nil) { (notification) in
            guard let viewControllerToPresent = notification.userInfo?[UserInfoKey.ViewController] as? UIViewController else { return }
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    private func setCalendarHeight() {
        if UIDevice.current.model.hasPrefix("iPad") {
            self.calendarHeightConstraint.constant = 400
        }
    }
    
    private func setupTableView() {
        self.view.addGestureRecognizer(self.scopeGesture)
        self.dailyTableView.panGestureRecognizer.require(toFail: self.scopeGesture)
        self.dailyTableView.dataSource = dailyTableViewDataSource
        self.dailyTableView.delegate =  self
    }
    
    private func setupCalendar() {
        self.calendar.select(Date())
        self.calendar.scope = .month
        self.calendar.delegate = self
        self.calendar.dataSource = calendarDataSource
    }
    
    @IBAction func CalendarToggleButtonTapped(_ sender: Any) {
        isMonthScope = !isMonthScope
        let scope: FSCalendarScope = isMonthScope ? .month : .week
        self.calendar.setScope(scope, animated: true)
    }
}
