//
//  PrivateCustomViewController.swift
//  MFood
//
//  Created by Mino on 2018/11/27.
//  Copyright © 2018 Mino. All rights reserved.
//

import UIKit
import WebKit

class PrivateCustomViewController: UIViewController {
    
    var length = (UIScreen.main.bounds.width - 60 - 32.666 * 7) / 6
    
    var currBtn: UIButton?
    
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
        btn.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var mon: UIButton = {
        let btn = UIButton()
        btn.setTitle("周一", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var tue: UIButton = {
        let btn = UIButton()
        btn.setTitle("周二", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var wed: UIButton = {
        let btn = UIButton()
        btn.setTitle("周三", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var thu: UIButton = {
        let btn = UIButton()
        btn.setTitle("周四", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var fri: UIButton = {
        let btn = UIButton()
        btn.setTitle("周五", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var sat: UIButton = {
        let btn = UIButton()
        btn.setTitle("周六", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    //tableview
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.estimatedRowHeight = 50
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor(red: 240/255, green: 239/255, blue: 243/255, alpha: 1)
        //        table.alwaysBounceVertical = false
        table.tableHeaderView = UIView()
        table.tableFooterView = UIView()
        table.register(PrivateCustomCell.self, forCellReuseIdentifier: "PrivateCustomCell")
        table.separatorStyle = .none
        return table
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
        
        self.setCurrPage(day: self.weekDay())
        self.setupTable()
    }
    
    @objc func onClick(obj: Any) {
        if let btn = obj as? UIButton {
            self.setCurrPage(day: btn.titleLabel?.text ?? "")
        }
    }
    
    func setupTable() {
        self.view.addSubview(tableView)
        let height = self.tabBarController?.tabBar.frame.height ?? 0
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.sun.snp.bottom).offset(20)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-height)
        }
    }
    
    func weekDay() -> String {
        let weekDays = [NSNull.init(),"周日","周一","周二","周三","周四","周五","周六"] as [Any]
        let calendar = NSCalendar.init(calendarIdentifier: .gregorian)
        let timeZone = NSTimeZone.init(name: "Asia/Shanghai")
        calendar?.timeZone = timeZone! as TimeZone
        let calendarUnit = NSCalendar.Unit.weekday
        let theComponents = calendar?.components(calendarUnit, from: Date.init())
        return weekDays[(theComponents?.weekday)!] as! String
    }
    
    func setCurrPage(day: String) {
        self.clearBtnUI()
        switch day {
        case "周日":
            self.currBtn = sun
        case "周一":
            self.currBtn = mon
        case "周二":
            self.currBtn = tue
        case "周三":
            self.currBtn = wed
        case "周四":
            self.currBtn = thu
        case "周五":
            self.currBtn = fri
        case "周六":
            self.currBtn = sat
        default:
            fatalError()
        }
        self.currBtn?.layer.cornerRadius = 2
        self.currBtn?.layer.borderWidth = 1
        self.currBtn?.layer.borderColor = UIColor.gray.cgColor
        
        if let dayStr = self.currBtn?.titleLabel?.text {
            
            if dayStr == self.weekDay() {
                self.navigationItem.title = "今日定制"
            } else {
                self.navigationItem.title = dayStr
            }
            
        }
    }
    
    func clearBtnUI() {
        self.currBtn?.layer.cornerRadius = 0
        self.currBtn?.layer.borderWidth = 0
        self.currBtn?.layer.borderColor = UIColor.clear.cgColor
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

extension PrivateCustomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let privateCell = tableView.dequeueReusableCell(withIdentifier: "PrivateCustomCell") as? PrivateCustomCell
        guard let cell = privateCell else {
            return UITableViewCell()
        }
        cell.setupUI(row: indexPath.row)
        return cell
    }
}

class PrivateCustomCell: UITableViewCell {
    lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.layer.cornerRadius = 3
        webView.layer.borderWidth = 2
        webView.layer.borderColor = UIConfig.main_back_color.cgColor
        return webView
    }()
    
    func setupUI(row: Int) {
        switch row {
        case 0:
            self.tipLabel.text = "早餐"
            self.webView.load(URLRequest.init(url: URL.init(string: "https://www.baidu.com")!))
        case 1:
            self.tipLabel.text = "午餐"
            self.webView.load(URLRequest.init(url: URL.init(string: "http://mino.site")!))
        case 2:
            self.tipLabel.text = "晚餐"
            self.webView.load(URLRequest.init(url: URL.init(string: "https://www.sina.com.cn")!))
        default:
            fatalError()
        }
        self.backgroundColor = UIColor(red: 240/255, green: 239/255, blue: 243/255, alpha: 1)
        self.addSubview(tipLabel)
        self.addSubview(webView)
        
        self.tipLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(20)
            make.top.greaterThanOrEqualTo(self).offset(30)
        }
        
        self.webView.snp.makeConstraints { (make) in
            make.left.equalTo(self.tipLabel)
            make.top.equalTo(self.tipLabel).offset(30)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(200)
            make.bottom.lessThanOrEqualTo(self).offset(30)
        }
    }
}
