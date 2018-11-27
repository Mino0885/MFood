//
//  PrivateCustomViewController.swift
//  MFood
//
//  Created by Mino on 2018/11/27.
//  Copyright © 2018 Mino. All rights reserved.
//

import UIKit

class PrivateCustomViewController: UIViewController {
    
    var length = (UIScreen.main.bounds.width - 60 - 32.666 * 7) / 6
    lazy var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "searchBtn"), for: UIControlState.normal)
        //        btn.addTarget(self, action: #selector(onClickPlusBtn), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var sun: UIButton = {
        let btn = UIButton()
        btn.setTitle("周日", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    
    lazy var mon: UIButton = {
        let btn = UIButton()
        btn.setTitle("周一", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    
    lazy var tue: UIButton = {
        let btn = UIButton()
        btn.setTitle("周二", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    
    lazy var wed: UIButton = {
        let btn = UIButton()
        btn.setTitle("周三", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    
    lazy var thu: UIButton = {
        let btn = UIButton()
        btn.setTitle("周四", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    
    lazy var fri: UIButton = {
        let btn = UIButton()
        btn.setTitle("周五", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    
    lazy var sat: UIButton = {
        let btn = UIButton()
        btn.setTitle("周六", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "今日定制"
        var rightView = UIView()
        
        rightView.addSubview(self.searchBtn)
        
        rightView.snp.makeConstraints { (make) in
            make.width.height.equalTo(61)
        }
        
        searchBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.center.equalTo(rightView)
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightView)
        
        //初始化UI
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIConfig.main_back_color
    }
    
    func setupUI() {
        self.view.addSubview(sun)
        self.view.addSubview(mon)
        self.view.addSubview(tue)
        self.view.addSubview(wed)
        self.view.addSubview(thu)
        self.view.addSubview(fri)
        self.view.addSubview(sat)
        
        sun.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(30)
            make.top.equalTo(self.view).offset(100)
        }
        
        mon.snp.makeConstraints { (make) in
            make.left.equalTo(sun.snp.right).offset(self.length)
            make.top.equalTo(sun)
        }
        
        tue.snp.makeConstraints { (make) in
            make.left.equalTo(mon.snp.right).offset(self.length)
            make.top.equalTo(sun)
        }
        
        wed.snp.makeConstraints { (make) in
            make.left.equalTo(tue.snp.right).offset(self.length)
            make.top.equalTo(sun)
        }
        
        thu.snp.makeConstraints { (make) in
            make.left.equalTo(wed.snp.right).offset(self.length)
            make.top.equalTo(sun)
        }
        
        fri.snp.makeConstraints { (make) in
            make.left.equalTo(thu.snp.right).offset(self.length)
            make.top.equalTo(sun)
        }
        
        sat.snp.makeConstraints { (make) in
            make.left.equalTo(fri.snp.right).offset(self.length)
            make.top.equalTo(sun)
        }
        
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
