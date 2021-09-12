//
//  DetailsContactViewController.swift
//  ContactList
//
//  Created by Vladimir Izmaylov on 08.09.2021.
//

import UIKit

class DetailsContactViewController: UITableViewController {
    
    var contactList = Person.getContact()
    private var dataManagerCount = Person.getContact().count
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        dataManagerCount
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "phone", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = contactList[indexPath.section]
        
        switch indexPath.row {
        case 0:
            content.image = UIImage(systemName: "phone")
            content.text = person.number
        default:
            content.image = UIImage(systemName: "mail")
            content.text = person.email
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contactList[section].fullName
    }

}
