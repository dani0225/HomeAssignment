//
//  ContactsDetailViewModel.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 31.03.2023.
//

import Foundation

struct DetailContactsViewModel {
    var contactsModel: ContactsTableViewCellViewModel
    var name:String
    
    init(contactsModel: ContactsTableViewCellViewModel) {
        self.contactsModel = contactsModel
        self.name = contactsModel.duplicates
    }
}
