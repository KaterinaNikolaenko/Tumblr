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
    let tableView: UITableView = UITableView()
   
    //Data Source
    var postViewModel = PostViewModel()
        
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
        postViewModel.getPosts(tag: (textField.text)!) { (success) in
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowDetails"{
            let postViewModel = sender as! PostViewModel
            let detailsVC = segue.destination as? DetailsOfBlogViewController
            detailsVC!.postViewModel = postViewModel
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ListOfPostViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setTableView() {
        
        tableView.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = PostTableViewCell()
        let post = postViewModel.postsArray[indexPath.row]
        
        if let photoPost = post as? PhotoPost {
            let photoPostCell = PhotoPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellPhoto")
            
            photoPostCell.setPostDataNew(post: photoPost)
            cell = photoPostCell
            let url = URL(string: photoPost.urlPhoto)
            let filter = AspectRatioScaledToWidthFilter(width: tableView.frame.width)
            photoPostCell.postImageView.af_setImage(withURL: url!, filter: filter, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5),  runImageTransitionIfCached: false) { response in
                if response.response != nil {
                    self.tableView.beginUpdates()
                    self.tableView.endUpdates()
                }
            }
        } else if let videoPost = post as? VideoPost {
            let videoPostCell = VideoPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellVideo")
            videoPostCell.setPostData(post: videoPost)
            cell = videoPostCell
        } else if let audioPost = post as? AudioPost {
            let audioPostCell = AudioPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellAudio")
            audioPostCell.setPostData(post: audioPost)
            cell = audioPostCell
        } else {
            let textPostCell = TextPostTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellText")
            textPostCell.setPostData(post: post)
            cell = textPostCell
        }
        cell.delegate = self
        postViewModel.tappedPost = postViewModel.postsArray[indexPath.row]
        
        return cell
    }
}

// MARK: - BlogDelegate

extension ListOfPostViewController: BlogDelegate {
    
    func toReadBlog(){
        self.performSegue(withIdentifier: "toShowDetails", sender: postViewModel)
    }
}



