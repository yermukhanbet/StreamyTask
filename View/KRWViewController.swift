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
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .lightGray
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    @objc func refresh(){
        if #available(iOS 13.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        } else {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
    }
    func update(){
        self.tableView.reloadData()
        let deadline = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            self.refresher.endRefreshing()
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if refresher.isRefreshing == true{
            update()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUptTableView()
        //sort the list by price
        KRW.KRWlist.sort{ $0.price > $1.price }
    }
    private func setUptTableView(){
        self.view.addSubview(tableView)
        tableView.refreshControl  = refresher
        tableView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: "Cell")
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCellTableViewCell  else{fatalError("Unable to create cell") }
        cell.setValues(name: KRW.KRWlist[indexPath.section].name, price: KRW.KRWlist[indexPath.section].price.toString(), volume: KRW.KRWlist[indexPath.section].volume.toString())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
//extension to handle large doubles
extension Double {
    func toString(decimal: Int = 9) -> String {
        let value = decimal < 0 ? 0 : decimal
        var string = String(format: "%.\(value)f", self)
        while string.last == "0" || string.last == "." {
            if string.last == "." { string = String(string.dropLast()); break}
            string = String(string.dropLast())
        }
        return string
    }
}
