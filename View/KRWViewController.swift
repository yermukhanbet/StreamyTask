//
//  KRWViewController.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class KRWViewController: UIViewController {
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUptTableView()
    }
    private func setUptTableView(){
        self.view.addSubview(tableView)
        tableView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension KRWViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return KRW.KRWlist.count-1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(KRW.KRWlist[indexPath.section].name)  Vol:\(KRW.KRWlist[indexPath.section].volume) Price:\(KRW.KRWlist[indexPath.section].price)"
        return cell
    }
    
}
