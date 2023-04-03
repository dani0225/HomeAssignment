//
//  ContactsViewModel.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 30.03.2023.
//

import Foundation


struct ContactsViewModel {
    var userViewModels:Observable<[ContactsTableViewCellViewModel]> = Observable(value: [])
    
    
    func createMockData() -> [ContactsModel] {
        return [ContactsModel(user: User(firstName: "Andrei", lastName: "Work"), phoneNumber: "0733812702"),
                    ContactsModel(user: User(firstName: "Andreeei", lastName: "Home"), phoneNumber: "0733812702"),
                    ContactsModel(user: User(firstName: "Andrei", lastName: "2"), phoneNumber: "0733812702"),
                ContactsModel(user: User(firstName: "Mom", lastName: "Mobile"), phoneNumber: "0726803658"),
                    ContactsModel(user: User(firstName: "Mama", lastName: "Acasa"), phoneNumber: "0726803658"),
                ContactsModel(user: User(firstName: "Alexandra", lastName: ""), phoneNumber: "0721200300")]
    }
    //group the contacts by phoneNumber and then filter the ones that have duplicates
    func groupContactsByPhoneNumber(model:[ContactsModel]) -> [String: [ContactsModel]] {
        let groupedDocumentsByPhoneNumber = Dictionary(grouping: model) { (element) -> String in
            element.phoneNumber
        }
        return groupedDocumentsByPhoneNumber.filter {$0.value.count > 1}

    }
    func createViewModel() -> [ContactsTableViewCellViewModel] {
        
        let mockedData = createMockData()
        let groupedData = groupContactsByPhoneNumber(model: mockedData)
        
        var contactsViewModel:[ContactsTableViewCellViewModel] = []
        for element in groupedData {
            let title = element.value.first?.user.firstName ?? ""
            var duplicates = element.value.reduce("") {$0 + $1.user.firstName + " " + $1.user.lastName + ", "}
            if let subrange = duplicates.range(of: ",", options: String.CompareOptions.backwards, range: nil, locale: nil) {
                duplicates.removeSubrange(subrange)
            }
            let phoneNumber = element.key
            let viewModel = ContactsTableViewCellViewModel(title: title , duplicates: duplicates, phoneNumber: phoneNumber)
            contactsViewModel.append(viewModel)
        }
        return contactsViewModel
    }
}

class ContactsTableViewCellViewModel {
    let title:String
    let duplicates:String
    let phoneNumber:String
    init(title:String, duplicates:String, phoneNumber:String) {
        self.title = title
        self.duplicates = duplicates
        self.phoneNumber = phoneNumber
    }
}
