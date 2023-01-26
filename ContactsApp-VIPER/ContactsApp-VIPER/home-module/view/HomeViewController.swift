//
//  HomeViewController.swift
//  ContactsApp-VIPER
//
//  Created by Yusuf Can Bircan on 26.01.2023.
//

import UIKit

class HomeViewController: UIViewController, PresenterToViewHomeProtocol {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var viewToPresenter_Object: ViewToPresenterHomeProtocol?
    
    
    var contacts = [Contacts]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        HomeRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewToPresenter_Object?.fetchAllContacts_Presenter()
    }
    
    func sendDataToView(contacts: Array<Contacts>) {
        self.contacts = contacts
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.contactInformationLabel.text = "\(contact.kisi_ad!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: contacts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let destinationVC = segue.destination as! ContactDetailsViewController
            if let contact = sender as? Contacts {
                destinationVC.contact = contact
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contact = contacts[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {(contextualAction, view, bool) in
            let alert = UIAlertController(title: "Delete", message: "Do you want to delete \(contact.kisi_ad!) ?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                self.viewToPresenter_Object?.deleteContact_Presenter(contact_id: contact.kisi_id!)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                
            })
            
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
            
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewToPresenter_Object?.searchData_Presenter(searchText: searchText)
    }
}
