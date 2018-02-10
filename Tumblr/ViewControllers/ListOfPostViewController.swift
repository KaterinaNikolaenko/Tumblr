//
//  ViewController.swift
//  Tumblr
//
//  Created by Katerina on 25.01.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ListOfPostViewController: UIViewController  {
    
    //UI
    var textField = UITextField()
    let tableView = UITableView()
   
    //Data Source
    var postViewModel = PostViewModel()
        
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        setTableView()
        
        postViewModel.getPosts(tag: "lol") { [unowned self] (success) in
            self.tableView.reloadData()
        }
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
        textField.backgroundColor = .white
        textField.placeholder = "Enter text here"
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.text = "lol"
        
        navigationItem.titleView = textField
        let searchItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(search))
        navigationItem.rightBarButtonItem = searchItem
    }
    
    @objc func search() {
        postViewModel.getPosts(tag: (textField.text)!) { [unowned self] (success) in
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ListOfPostViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setTableView() {
        
        tableView.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(PhotoPostTableViewCell.self, forCellReuseIdentifier: "cellPhoto")
        tableView.register(VideoPostTableViewCell.self, forCellReuseIdentifier: "cellVideo")
        tableView.register(TextPostTableViewCell.self, forCellReuseIdentifier: "cellText")
        tableView.register(AudioPostTableViewCell.self, forCellReuseIdentifier: "cellAudio")
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        let post = postViewModel.postsArray[indexPath.row]
        
        if let photoPost = post as? PhotoPost {
            let photoPostCell = self.tableView.dequeueReusableCell(withIdentifier: "cellPhoto") as! PhotoPostTableViewCell
            photoPostCell.setPostData(post: photoPost)
            cell = photoPostCell
            let url = URL(string: photoPost.urlPhoto)
            photoPostCell.postImageView.af_setImage(withURL: url!)
        } else if let videoPost = post as? VideoPost {
            let videoPostCell = self.tableView.dequeueReusableCell(withIdentifier: "cellVideo") as! VideoPostTableViewCell
            videoPostCell.setPostData(post: videoPost)
            cell = videoPostCell
        } else if let audioPost = post as? AudioPost {
            let audioPostCell = self.tableView.dequeueReusableCell(withIdentifier: "cellAudio") as! AudioPostTableViewCell
            audioPostCell.setPostData(post: audioPost)
            cell = audioPostCell
        } else {
            let textPostCell = self.tableView.dequeueReusableCell(withIdentifier: "cellText") as! TextPostTableViewCell
            textPostCell.setPostData(post: post)
            cell = textPostCell
        }
        cell.toReadButton.tag = indexPath.item
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = postViewModel.postsArray[indexPath.row]
        if let photoPost = post as? PhotoPost {
            return postViewModel.calculateCellHeight(post: photoPost)
        } else {
            return 200
        }
    }
}

// MARK: - BlogDelegate

extension ListOfPostViewController: BlogDelegate {

    func toReadBlog(sender: UIButton){
        
        postViewModel.tappedPost = postViewModel.postsArray[sender.tag]
        let detailViewController = DetailsOfBlogViewController()
        detailViewController.postViewModel = postViewModel
        detailViewController.view.backgroundColor = .white
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}



