//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Vladimir Izmaylov on 12.09.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var contactList = Person.getContact()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            
            guard let navigationVC = viewController as? UINavigationController else { return }
            
            if let contactListVC = navigationVC.topViewController as? MainContactViewController {
                contactListVC.contactList = contactList
            } else if let contactListVCWithSections = navigationVC.topViewController as? DetailsContactViewController {
                contactListVCWithSections.contactList = contactList
            }
        }
    }
    

}
