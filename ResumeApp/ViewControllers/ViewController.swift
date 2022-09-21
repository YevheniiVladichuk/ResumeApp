//
//  ViewController.swift
//  ResumeApp
//
//  Created by Yevhenii Vladichuk on 19.08.2022.
//

import UIKit
import AVKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        Utilities.styleClearButtonBlack(signUpButton)
        Utilities.styleFilledButton(logInButton)
    
    }

    @IBAction func logInButtonTapped(_ sender: UIButton) {
        segue(id: "LoginVC")
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        segue(id: "UploadPhotoVC")
    }
    
    
    //segue to next view
    func segue(id: String ) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: id)
        view?.window?.rootViewController = nextView
        view?.window?.makeKeyAndVisible()
    }
    
    //add video to the view
    override func viewWillAppear(_ animated: Bool) {
        addVideo()
    }
    
    func addVideo() {
    
        let bundlePath = Bundle.main.path(forResource: "hands", ofType: "mp4")
        guard bundlePath != nil else {return}
        
        //creat URL
        let url = URL(fileURLWithPath: bundlePath!)
        
        //creat item
        let item = AVPlayerItem(url: url)
        
        //player
        videoPlayer = AVPlayer(playerItem: item)
        
        //layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        //creat size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y:0, width: self.view.frame.size.width*4, height: self.view.frame.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
     
        //play it
        videoPlayer?.playImmediately(atRate: 1)
    }
}


