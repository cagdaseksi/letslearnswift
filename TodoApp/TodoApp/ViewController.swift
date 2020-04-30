//
//  ViewController.swift
//  TodoApp
//
//  Created by MAC on 30.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    
    var taskStore = [[TaskEntity](), [TaskEntity]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         tableView.tableFooterView = UIView()
         loadData()
    }
    
    func loadData() {
        
         let tasks = DataBaseHelper.shareInstance.fetch()
         
         taskStore = [tasks.filter{ $0.isdone == false }, tasks.filter{ $0.isdone == true }]
         
         tableView.reloadData()
        
    }

    @IBAction func btnAdd(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) {_ in
            
            guard let name = alertController.textFields?.first?.text else { return }
            
            DataBaseHelper.shareInstance.save(name: name, isDone: false)
            self.loadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter task name..."
        }
        
        alertController.addAction(addAction);
        alertController.addAction(cancelAction);
        
        present(alertController, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "To-do" : "Done"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskStore[indexPath.section][indexPath.row].name
        
        return cell
    }
    
}

// MARK: - Delegate
extension ViewController {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) {(action, sourceView, completionHandler) in
            
            let row = self.taskStore[indexPath.section][indexPath.row]
            
            self.taskStore[indexPath.section].remove(at: indexPath.row)
            
            DataBaseHelper.shareInstance.deleteData(name: row.name!)
            self.loadData()
            
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(named: "trash-24.png")
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: nil) {(action, sourceView, completionHandler) in
            
            let row = self.taskStore[0][indexPath.row]
            
            DataBaseHelper.shareInstance.update(name: row.name!, isdone: true)
            
            self.loadData()
            
            completionHandler(true)
        }
        
        doneAction.image = UIImage(named: "checkmark-24.png")
        doneAction.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.7411764706, blue: 0.6509803922, alpha: 1)
        
        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
    
}
