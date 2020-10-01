//
//  TransitionButtonsRowTableViewCell.swift
//  GehaSajang
//
//  Created by Keunna Lee on 2020/09/30.
//  Copyright © 2020 dev-Lena. All rights reserved.
//

import UIKit


class TransitionButtonsRowTableViewCell: UITableViewCell {

    private let notificationCenter = NotificationCenter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func bookingStatusButtonTapped(_ sender: Any) {
        let roomBookingStatusViewController = RoomBookingStatusViewController.loadFromNib()
        notificationCenter.sendNotification(notificationName: NSNotification.Name.CalendarButtonTapped, viewController: roomBookingStatusViewController)

    }
    
    @IBAction func serviceStatusButtonTapped(_ sender: Any) {
        let serviceUsingStatusViewController = ServiceUsingStatusViewController.loadFromNib()
        notificationCenter.sendNotification(notificationName: NSNotification.Name.CalendarButtonTapped, viewController: serviceUsingStatusViewController)
    }
}
