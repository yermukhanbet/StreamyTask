//
//  CustomCellTableViewCell.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/11/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    lazy var box: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    lazy var volume: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    lazy var price: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        box.frame = contentView.frame
        self.contentView.addSubview(box)
        addViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        name.frame = CGRect(x: 10, y: 10, width: 200, height: 30)
        box.addSubview(name)
        volume.frame = CGRect(x: 10, y: 40, width: 200, height: 30)
        box.addSubview(volume)
        price.frame = CGRect(x: 10, y: 70, width: 200, height: 30)
        box.addSubview(price)
    }
    public func setValues(name:String, price: String, volume: String){
        self.name.text = "Name: \(name)"
        self.price.text = "Price: \(price)"
        self.volume.text = "Volume: \(volume)"
        self.name.fadeTransition(0.1)
        self.price.fadeTransition(0.1)
        self.volume.fadeTransition(0.1)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
