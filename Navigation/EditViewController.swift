//
//  EditViewController.swift
//  Navigation
//
//  Created by Lucia on 2017. 2. 22..
//  Copyright © 2017년 Lucia. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var isOn = false
    var isZoom = false
    var delegate: EditDelegate?

    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    @IBOutlet weak var btnImageSizing: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        if isZoom {
            btnImageSizing.setTitle("축소", for: UIControlState())
        } else {
            btnImageSizing.setTitle("확대", for: UIControlState())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 메인화면으로 텍스트와 전구 이미지 상태 보내기.
    @IBAction func btnDone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        
        
        // 뷰를 전환하기 위해 세그웨이 추가시 [Action Segue]를 'Show'로 지정.
        // 따라서 되돌아갈 때는 'pop' 형태로 해줘야~~~
        _ = navigationController?.popViewController(animated: true)
    }
    
    // 전구 켜고 끄기
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }

    @IBAction func btnImageSizing(_ sender: UIButton) {
        if isZoom {
            isZoom = false
            btnImageSizing.setTitle("확대", for: UIControlState())
        } else {
            isZoom = true
            btnImageSizing.setTitle("축소", for: UIControlState())
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
