//
//  Goal.swift
//  Planner
//
//  Created by Chris Withers on 8/24/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import Foundation
import RealmSwift

class Goal: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var duration: Int = 0
    @objc dynamic var id: Int = 0
    
}
