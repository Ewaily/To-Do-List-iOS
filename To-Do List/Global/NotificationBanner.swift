//
//  NotificationBanner.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/25/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import NotificationBannerSwift

extension UIViewController {
    func showNotificationBannerSwift(bannerTitle: String, bannerStyle: BannerStyle){
        let banner = StatusBarNotificationBanner(title: bannerTitle, style: bannerStyle)
        banner.show()
    }
}
