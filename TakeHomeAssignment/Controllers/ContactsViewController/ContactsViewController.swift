//
//  ViewController.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 29.03.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    
    private var contactsModel = ContactsViewModel()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib(nibName: Const.contactsNibname, bundle: .main), forCellReuseIdentifier: Const.contactsCell)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Duplicates"
        configureTableView()
        let viewModel = contactsModel.createViewModel()
        bindModel()
        contactsModel.userViewModels.value = viewModel
    }
    
  
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func bindModel() {
        contactsModel.userViewModels.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsModel.userViewModels.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.contactsCell, for: indexPath) as? ContactsTableViewCell, let contactsModel = contactsModel.userViewModels.value else {
            return UITableViewCell()
        }
        let model = contactsModel[indexPath.row]
        cell.configureCell(with: model)
        
        return cell
    }
    
    
}
extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contactsModel = contactsModel.userViewModels.value else{
            return
        }
        let model = contactsModel[indexPath.row]
        let detailsViewModel = DetailContactsViewModel(contactsModel: model)
        let detailsController = DetailsContactViewController(viewModel: detailsViewModel)
        detailsController.delegate = self
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
        
    }
    
}

extension ContactsViewController: DeleteModel {
    func deleteModel(model: ContactsTableViewCellViewModel) {
        if let index = contactsModel.userViewModels.value?.firstIndex(where: {$0 === model})    {
            contactsModel.userViewModels.value?.remove(at: index)
        }
    }
}
