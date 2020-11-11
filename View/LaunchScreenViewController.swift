//
//  LaunchScreenViewController.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit
import Reachability
class LaunchScreenViewController: UIViewController {
    var progressAmount:Float = 0.0
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemRed
        progress.tintColor = .systemGray
        progress.setProgress(0, animated: true)
        progress.layer.borderWidth =  1.0
        progress.layer.borderColor = UIColor.lightGray.cgColor
        progress.layer.cornerRadius = 5
        progress.layer.masksToBounds = true
        return progress
    }()
    let refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 0.2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        return button
    }()
    let refreshButotnShadow: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowOffset =  CGSize.zero
        view.layer.shadowRadius = 9
        view.layer.shadowOpacity = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let messageView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    @objc func refreshButtonPressed(){
        let deadline = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            self.checkPoints()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let deadline = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            self.checkPoints()
        }
    }
    private func moveToNext(){
        let deadline = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            let vc = MainViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    private func addSubviews(){
        self.view.addSubview(progressView)
        self.view.addSubview(refreshButotnShadow)
        self.view.addSubview(refreshButton)
        self.view.addSubview(messageView)
    }
    private func setConstraints(){
        setProgressViewConstraints()
        setupRefreshButton()
        setupMessageViewConstraints()
    }
    //check for internet first.
    //then fill the tables with pairs for KRW and BTC
    //then show the tables
    private func checkPoints(){
        if !checkForInternet(){return}
        fillTables()
        moveToNext()
    }
    private func setProgressViewConstraints(){
        progressView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 240).isActive = true
        progressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 220).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    private func setupRefreshButton(){
        refreshButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        refreshButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        refreshButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        refreshButotnShadow.topAnchor.constraint(equalTo: refreshButton.topAnchor).isActive = true
        refreshButton.bottomAnchor.constraint(equalTo: refreshButton.bottomAnchor).isActive = true
        refreshButton.leftAnchor.constraint(equalTo: refreshButton.leftAnchor).isActive = true
        refreshButton.rightAnchor.constraint(equalTo: refreshButton.rightAnchor).isActive = true
    }
    private func setupMessageViewConstraints(){
        messageView.topAnchor.constraint(equalTo: progressView.topAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 50).isActive = true
        messageView.leftAnchor.constraint(equalTo: progressView.leftAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: progressView.rightAnchor).isActive = true
    }
    private func hideUI(){
        self.messageView.backgroundColor = .white
        self.messageView.text = YSNNoInternetConnection
        self.messageView.textColor = .black
        self.messageView.fadeTransition(0.5)
        self.refreshButton.setImage(UIImage(named: "refreshButton"), for: .normal)
        self.refreshButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.refreshButotnShadow.layer.shadowOpacity = 0.5
        self.refreshButton.fadeTransition(0.5)
        self.refreshButotnShadow.fadeTransition(0.5)
    }
    fileprivate func updateProgressBar() {
        self.progressAmount = self.progressAmount + 0.7
        self.progressView.setProgress(self.progressAmount, animated: true)
    }
    private func checkForInternet() -> Bool{
        let reachability = try! Reachability()
        if reachability.isReachable{
            updateProgressBar()
            return true
        }else{
            hideUI()
            return false
        }
    }
    private func fillTables(){
        FillKRWList.shared.fillPairs()
    }
}
extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
