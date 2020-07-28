//
//  TableViewController.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 28/07/2020.
//  Copyright © 2020 Maxwell. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var gitArray : Results<Commit>?
    
    lazy var refresh: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refresh
        } else {
            self.tableView.addSubview(refresh)
        }
        
        do{
            let realm = try Realm()
            gitArray = realm.objects(Commit.self)
        }catch{}
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        self.tableView.contentInset = inset
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let size = gitArray?.count {
            if size < 1 {
                loadData()
            }
        }else{
            loadData()
        }
    }
    
    func loadData() {
        spinner?.startAnimating()
        
         GitCaller.getCommit(){
                   responseModel in
                   if responseModel.success{
                       
                   }else{
                       self.presentOkAlert(responseModel.title ?? "Error", responseModel.generalMessage ?? "")
                   }
                   self.spinner?.stopAnimating()
                   self.spinner?.isHidden = true
               }
               
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gitArray?.count ?? 0
    }
    
    @objc private func handleRefresh(_ refreshControl: UIRefreshControl) {
        GitCaller.getCommit(){
            responseModel in
            if responseModel.success{
                self.tableView.reloadData()
                refreshControl.endRefreshing()
            }else{
                self.presentOkAlert(responseModel.title ?? "Error", responseModel.generalMessage ?? "")
                self.tableView.reloadData()
                refreshControl.endRefreshing()
            }
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let git = gitArray?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as! TableViewCell
        //cell.number.text = String(indexPath.row + 1)
        cell.number.isHidden = true
        cell.message.text = git?.commit?.message
        // Configure the cell...

        return cell
    }
    
}
