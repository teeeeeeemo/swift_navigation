//
//  ViewController.swift
//  Navigation
//
//  Created by Lucia on 2017. 2. 22..
//  Copyright © 2017년 Lucia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    var isZoom = false
    var orgZoom = false
    
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 세그웨이를 이용한 화면 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as!
                    EditViewController
        if segue.identifier == "editButton" {
            // 버튼 클릭
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            // 바 버튼 클릭
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = orgZoom
        editViewController.delegate = self
    }
    
    
    // 메시지 값을 텍스트 필드에 표시
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }

    // 전구 이미지 값 세팅
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            if orgZoom {
                
            } else {
                self.isZoom = false
                self.orgZoom = true
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
            print("Zoom: true")
        } else {
            if orgZoom {
                self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
                
            } else {
                
            }
            
            print("Zoom: false")
        }
    }

}

