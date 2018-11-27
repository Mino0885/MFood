//
//  PersonalViewController.swift
//  MFood
//
//  Created by Mino on 2018/11/27.
//  Copyright © 2018 Mino. All rights reserved.
//

import UIKit
import SnapKit

class PersonalViewController: UIViewController {
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "plusBtn"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(onClickPlusBtn), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var rightView = UIView()
        rightView.addSubview(self.plusBtn)
        rightView.snp.makeConstraints { (make) in
            make.width.height.equalTo(61)
        }
        self.plusBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.center.equalTo(rightView)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIConfig.main_back_color
    }
    
    @objc func onClickPlusBtn() {
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
