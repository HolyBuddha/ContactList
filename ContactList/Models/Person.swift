//
//  Person.swift
//  ContactList
//
//  Created by Vladimir Izmaylov on 08.09.2021.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let number: String
    let email: String
    var fullName: String { "\(name) \(surname)" }
    
    static func getContact() -> [Person] {
        let dataManager = DataManager()
        var contactFromData: [Person] = []
        
        for _ in dataManager.names {
        let name = dataManager.names.randomElement() ?? ""
        let surname = dataManager.surnames.randomElement() ?? ""
        let number = dataManager.numbers.randomElement() ?? ""
        let email = dataManager.emails.randomElement() ?? ""
        
        let person = Person(name: name, surname: surname, number: number, email: email)
        
        dataManager.names = dataManager.names.filter(){$0 != name}
        dataManager.surnames = dataManager.surnames.filter(){$0 != surname}
        dataManager.numbers = dataManager.numbers.filter(){$0 != number}
        dataManager.emails = dataManager.emails.filter(){$0 != email}
            
        contactFromData.append(person)
        }
        
        return contactFromData.sorted { $0.name < $1.name }
    }
        
}
