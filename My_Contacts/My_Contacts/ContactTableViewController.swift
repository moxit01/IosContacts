//
//  ContactTableViewController.swift
//  My_Contacts
//
//  Created by Moxit Shah on 04/04/22.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    var contactList = ContactList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // super.viewWillAppear(animated)
      
       // contactList.list.sort { $0.name < $1.name}
        tableView.reloadData()
        
    }
//
//    @IBAction func toggleEditMode(_ sender: UIBarButtonItem) {
//        if isEditing{
//            sender.title = "Edit"
//            setEditing(false, animated: true)
//        } else{
//            sender.title = "Done"
//            setEditing(true, animated: true)
//        }
//    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as! ContactTableViewCell

        // Configure the cell...
        
        let contact = contactList.list[indexPath.row]
        cell.contactName?.text = contact.name + " " + contact.lastName
        cell.contactNumber?.text = contact.number
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            let alert = UIAlertController(title: "Are you sure you want to delete?", message: "Deleted contacts cannot be retrieved", preferredStyle: .alert)

            let yes = UIAlertAction(title: "Yes", style: .destructive)
            {(UIAlertAction) in
                self.contactList.deleteContact(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
            
            alert.addAction(yes)
            alert.addAction(cancel)
            present(alert, animated: true)
            
            
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        contactList.moveContact(from: fromIndexPath.row, to: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//
//        cell?.backgroundColor = .systemPink
//        cell?.tintColor = .white
//    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier{
        case "newContact":
            guard
                let dst = segue.destination as? DetailedContactViewController
            else {return}
            dst.contactList = contactList
            dst.isNew = true
            
        case "editContact":
            guard
                let dst = segue.destination as? DetailedContactViewController,
                let indexPath = tableView.indexPathForSelectedRow
            else {return}
            dst.contactList = contactList
            dst.isNew = false
            dst.indexPath = indexPath
            
        default:
            preconditionFailure("Segue identifier does not exist")
        }
    }
    

}
