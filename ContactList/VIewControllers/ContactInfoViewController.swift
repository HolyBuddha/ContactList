//
//  ContactInfoViewController.swift
//  ContactList
//
//  Created by Vladimir Izmaylov on 09.09.2021.
//

import UIKit

class ContactInfoViewController: UIViewController {

    @IBOutlet var phone: UILabel!
    @IBOutlet var email: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = person.fullName
        phone.text = "Phone: \(person.number)"
        email.text = "Email: \(person.email)"
    }
}

