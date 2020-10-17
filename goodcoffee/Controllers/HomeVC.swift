//
//  HomeVC.swift
//  goodcoffee
//
//  Created by Trevor Pennington on 10/13/20.
//  Copyright © 2020 Trevor Pennington. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let titleLabel = UILabel()

    let menuButton = UIButton()
    let menuButtonImage = UIImage(systemName: "line.horizontal.3", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    let menuCloseButtonImage = UIImage(systemName: "xmark.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    
    let menuView = UIView()
    let tapToCloseArea = UIView()
    var leadingConstraint = NSLayoutConstraint()
    var menuLeadingAnchorPosition = CGFloat(0.0)
    var menuHidden = true
    
    let menuOptions = ["account", "favorites", "jobs", "about", "contact"]
    var menuTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        renderTitleLabel()
        renderPlaceholderImage()
        renderMenuView()
        renderMenuButton()
        

        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuOptionCell")
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.tableFooterView = UIView()
    }
    
    func renderTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "Welcome"
        titleLabel.font = UIFont(name: "GillSans", size: 24)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    func renderPlaceholderImage() {
        let placeholderImage = UIImage(named: "placeholderImg")
        let placeholderImageView = UIImageView(image: placeholderImage!)
        placeholderImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        view.addSubview(placeholderImageView)
        
        placeholderImageView.contentMode = .scaleToFill
        placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeholderImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            placeholderImageView.widthAnchor.constraint(equalToConstant: 300.0),
            placeholderImageView.heightAnchor.constraint(equalToConstant: 200.0),
            placeholderImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //MARK: #1
    func renderMenuButton() {
        view.addSubview(menuButton)
        menuButton.setImage(menuButtonImage, for: .normal)
        menuButton.tintColor = .black
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        menuButton.addTarget(self, action: #selector(toggleMenuView), for: .touchUpInside)
    }
    
    //MARK: #2
    func renderMenuView() {
        view.addSubview(menuView)
        menuView.addSubview(menuTableView) //add menu options (mine is a table view, defined later in this guide)
        
        menuView.backgroundColor = .white
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOpacity = 0.1
        menuView.layer.shadowOffset = .zero
        menuView.layer.shadowRadius = 15
        
        leadingConstraint = menuView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: menuLeadingAnchorPosition)
        
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.heightAnchor.constraint(equalTo: view.heightAnchor),
            menuView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            leadingConstraint,
            
            menuTableView.heightAnchor.constraint(equalTo: menuView.heightAnchor),
            menuTableView.widthAnchor.constraint(equalTo: menuView.widthAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            menuTableView.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 70)
        ])
    }
    
    
    //MARK: #3
    func renderTapToCloseArea() {
        view.addSubview(tapToCloseArea)
        
        tapToCloseArea.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tapToCloseArea.heightAnchor.constraint(equalTo: view.heightAnchor),
            tapToCloseArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            tapToCloseArea.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func removeTapToCloseArea() {
        tapToCloseArea.removeFromSuperview()
    }
    
    //MARK: #4
    @objc func toggleMenuView() {
        if menuHidden {
            leadingConstraint.constant = UIScreen.main.bounds.size.width / 2 * -1
            menuButton.setImage(menuCloseButtonImage, for: .normal)
            renderTapToCloseArea()
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.toggleMenuView))
            self.tapToCloseArea.addGestureRecognizer(tap)
        } else {
            removeTapToCloseArea()
            leadingConstraint.constant = 0.0
            menuButton.setImage(menuButtonImage, for: .normal)

        }

        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        menuHidden.toggle()
    }
    
    //MARK: #5
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuOptionCell", for: indexPath as IndexPath)
        let cellText = menuOptions[indexPath.row]
        
        cell.textLabel!.text = "\(cellText)"
        
        return cell
    }

}
