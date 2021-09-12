//
//  MainContactViewController.swift
//  ContactList
//
//  Created by Vladimir Izmaylov on 08.09.2021.
//

import UIKit

class MainContactViewController: UITableViewController {
    
    var contactList = Person.getContact()
    private var dataManagerCount = Person.getContact().count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManagerCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fullname", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let contact = contactList[indexPath.row]
        content.text = contact.fullName
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentContact = contactList.remove(at: sourceIndexPath.row)
        contactList.insert(currentContact, at: destinationIndexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? ContactInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let person = contactList[indexPath.row]
        detailsVC.person = person
        }
}
    
