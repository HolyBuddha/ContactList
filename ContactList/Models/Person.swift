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
        
        let dataManager = DataManager.shared
        
        var contactFromData: [Person] = []
        
        let names = dataManager.names.shuffled()
        let surnames = dataManager.surnames.shuffled()
        let numbers = dataManager.numbers.shuffled()
        let emails = dataManager.emails.shuffled()
        
        
        for index in 0..<dataManager.names.count {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                number: numbers[index],
                email: emails[index]
            )
            
            contactFromData.append(person)
        }

        return contactFromData.sorted { $0.name < $1.name }
    }
        
}
