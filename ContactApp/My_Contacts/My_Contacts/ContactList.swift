//
//  ContactList.swift
//  My_Contacts
//
//  Created by Moxit Shah on 04/04/22.
//

import UIKit

class ContactList{
    var list = [Contact]()
    
    //var contactList: ContactList
    init(){
        for _ in 0...11{
            list.append(Contact(random: true))
        }
    }
    
    func moveContact(from fromIndex: Int, to toIndex: Int){
        let temp = list[fromIndex]
        list.remove(at: fromIndex)
        list.insert(temp, at: toIndex)
    }
    
    func addContact(name: String) -> Contact{
        let contact = Contact(name: name)
        list.append(contact)
        
        return contact
    }
    
    func addContact(name: String, lastName: String, number: String){
        list.append(Contact(name: name, lastName: lastName, number: number))
    }
    
    func updateContact(at: Int, name: String, lastName: String, number: String){
        self.list[at].name = name
        self.list[at].lastName = lastName
        self.list[at].number = number
//        contact.name = name
//        contact.lastName = lastName
//        contact.number = number
    }
    
    func deleteContact(at: Int){
     
        list.remove(at: at)
    }
}
