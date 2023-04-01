//
//  Utility.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 30.03.2023.
//

import Foundation

final class Utility {
    
    static let shared = Utility()
    private init() {
        
    }
    
    
}

enum Const {
    static let contactsCell = "ContactsCell"
    static let contactsNibname = "ContactsTableViewCell"
    static let contactsDetailStoryboardId = "ContactDetailsViewController"
    static let detailsCell = "DetailContactsCell"
    static let detailsNibName = "DetailContactTableViewCell"
}


