//
//  ViewController.swift
//  TestApp
//
//  Created by עלי חלאחלה on 19/10/2023.
//

import UIKit

let screenSize: CGRect = UIScreen.main.bounds
var modelName =  UIDevice.current.modelName

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var viewTest: ViewTest!
    
    @IBOutlet var tableView: UITableView!
    
    var tableData = ["Array<String>()1", "Array<String>()2", "Array<String>()3"]
    
    static let itemClicked = Notification.Name("ItemClicked")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("modelName \(modelName)")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
    }


    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: ViewController.itemClicked, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
          NotificationCenter.default.addObserver(self, selector: #selector(clickItemNotification(notification:)), name: ViewController.itemClicked, object: nil)
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    @objc func clickItemNotification(notification:Notification){
        
        let data = String(describing:(notification.userInfo?["data"])!)
        
        viewTest.isHidden = true
        tableView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
}

