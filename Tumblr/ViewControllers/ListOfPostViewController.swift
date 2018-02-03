//
//  ViewController.swift
//  Tumblr
//
//  Created by Katerina on 25.01.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit
import Alamofire

class ListOfPostViewController: UIViewController  {
    
    //UI
    weak var textField = UITextField()
    
    let tableView: UITableView = UITableView()
    var postViewModel = PostViewModel()
    var tappedPost: Post? = nil
   
    // private
    fileprivate var httpClient:HttpClient = HttpClient()
   
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        setTableView()
        
        postViewModel.getPosts(tag: "lol") { (success) in
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
        textField?.backgroundColor = .white
        textField?.placeholder = "Enter text here"
        textField?.borderStyle = UITextBorderStyle.roundedRect
        textField?.font = UIFont.systemFont(ofSize: 15)
        textField?.clearButtonMode = UITextFieldViewMode.whileEditing
        textField?.text = "lol"
        
        navigationItem.titleView = textField
        let searchItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(search))
        navigationItem.rightBarButtonItem = searchItem
    }
    
    @objc func search() {
        postViewModel.getPosts(tag: (textField?.text)!) { (success) in
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowDetails"{
            let post = sender as! Post
            let detailsVC = segue.destination as? DetailsOfBlogViewController
            detailsVC!.currentPost = post
        }
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
        
        var cell = PostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let post = postViewModel.postsArray[indexPath.row]
        
        if let photoPost = post as? PhotoPost {
            let photoPostCell = PhotoPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            photoPostCell.setPostData(post: photoPost)
            cell = photoPostCell
        } else if let videoPost = post as? VideoPost {
            let videoPostCell = VideoPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            videoPostCell.setPostData(post: videoPost)
            cell = videoPostCell
        } else if let audioPost = post as? AudioPost {
            let audioPostCell = AudioPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            audioPostCell.setPostData(post: audioPost)
            cell = audioPostCell
        } else {
            let textPostCell = TextPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            textPostCell.setPostData(post: post)
            cell = textPostCell
        }
        cell.delegate = self
        tappedPost = postViewModel.postsArray[indexPath.row]
        
        return cell
    }
}

// MARK: - BlogDelegate

extension ListOfPostViewController: BlogDelegate {
    
    func toReadBlog(){
        self.performSegue(withIdentifier: "toShowDetails", sender: tappedPost)
    }
}



