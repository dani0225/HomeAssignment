//
//  DetailsContactViewController.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 31.03.2023.
//

import UIKit


protocol DeleteModel:AnyObject {
    func deleteModel(model:ContactsTableViewCellViewModel)
}
class DetailsContactViewController: UIViewController {
    
   
    var viewModel: DetailContactsViewModel
    weak var delegate: DeleteModel?
   
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib(nibName: Const.detailsNibName, bundle: .main), forCellReuseIdentifier: Const.detailsCell)
        return table
    }()
    
    
    init(viewModel: DetailContactsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsContactViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Duplicate Contacts"
        configureTableView()
    }
    

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
    }
}

extension DetailsContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.detailsCell, for: indexPath) as? DetailContactTableViewCell else {
            return UITableViewCell()
        }
        cell.configueCell(with: viewModel)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Duplicates that will be Deleted"
        default:
            return ""
        }
    }
    
}
extension DetailsContactViewController: DeleteButtonTapped {
    func deleteButtonTaped() {
        self.navigationController?.popViewController(animated: true)
        delegate?.deleteModel(model: viewModel.contactsModel)
    }
    
    
}
