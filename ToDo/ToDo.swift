//
//  ToDo.swift
//  ToDo
//
//  Created by Brian Mahne on 12/6/24.
//

import Foundation
import SwiftData
@Model
class ToDo {
    var dueDate = Date.now + 60*60*24
    var item = ""
    var isCompleted = false
    var isReminderOn = false
    var notes = ""
    
    init(dueDate: Date = Date.now + 60*60*24, item: String = "", isCompleted: Bool = false, isReminderOn: Bool = false, notes: String = "") {
        self.dueDate = dueDate
        self.item = item
        self.isCompleted = isCompleted
        self.isReminderOn = isReminderOn
        self.notes = notes
    }
}
