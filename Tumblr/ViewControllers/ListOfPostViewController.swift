//
//  ViewController.swift
//  Tumblr
//
//  Created by Katerina on 25.01.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

class ListOfPostViewController: UIViewController  {
    
    //UI
    weak var textField = UITextField()
    let tableView: UITableView = UITableView()
    
    var postViewModel: PostViewModel = PostViewModel()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        setTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func orientationChanged() {
        setNavigationBar()
    }
}

// MARK: - Private

extension ListOfPostViewController {
    
    fileprivate func setNavigationBar() {
        
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 35))
        textField?.backgroundColor = .white
        textField?.placeholder = "Enter text here"
        textField?.borderStyle = UITextBorderStyle.roundedRect
        textField?.font = UIFont.systemFont(ofSize: 15)
        textField?.clearButtonMode = UITextFieldViewMode.whileEditing
        
        navigationItem.titleView = textField
        let searchItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(search))
        navigationItem.rightBarButtonItem = searchItem
    }
    
    @objc func search() {
        //Should delete!!!
        print("I am searching!")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ListOfPostViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setTableView() {
        
        tableView.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = PostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let post = postViewModel.postsArray[indexPath.row]
        cell.setPostData(post: post)
        
        return cell
    }
}


