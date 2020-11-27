//
//  TableViewCell.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import UIKit
//import SDWebImage
class CanadaInfoCell: UITableViewCell {
    
    // Setting Data into the labels and imageview in TableView cell
    var info:CanadaInfoRow? {
        didSet {
            guard let rowItem = info else {return}
            if let name = rowItem.title {
                nameLabel.text = name
            }
            if let Title = rowItem.descriptionField {
                detailedLabel.text = "\(Title)"
            }
            if let image = rowItem.imageHref {
                profileImageView.sd_setImage(with: URL(string:image), placeholderImage: UIImage(named: Constants.placeholderImg))
            }
            else
            {
                profileImageView.image = UIImage(named: Constants.placeholderImg)
            }
            
        }
    }
    
    //---Cofigure and setting of UI objects in UItableview cell
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let profileImageView:UIImageView = {
        let img = UIImageView(image: UIImage(named: Constants.placeholderImg))
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 90
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor =  .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0;
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(detailedLabel)
        self.contentView.addSubview(containerView)
        
        profileImageView.centerXAnchor.constraint(equalTo:self.contentView.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 10).isActive = true
       
        profileImageView.widthAnchor.constraint(equalToConstant:180).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:180).isActive = true
        
        containerView.topAnchor.constraint(equalTo:self.profileImageView.bottomAnchor, constant: 5).isActive = true

        containerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant:-15).isActive = true

        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        detailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        detailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        detailedLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        detailedLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
