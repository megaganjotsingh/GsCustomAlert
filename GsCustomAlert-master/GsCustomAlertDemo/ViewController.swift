//
//  ViewController.swift
//  GsCustomAlertDemo
//
//  Created by Gagan Mac on 18/01/20.
//  Copyright © 2020 Gaganjot singh. All rights reserved.
//

import UIKit
import GsCustomAlert

class ViewController: UIViewController {
    
    var tableView: UITableView?
    var alert = GsCustomAlert() 
    private enum animationType: String, CaseIterable {
        case slideModalBottom = "slideModalBottom"
        case slideModalLeft = "slideModalLeft"
        case slideModalRight = "slideModalRight"
        case slideModalTop = "slideModalTop"
        case fadeIn = "fadeIn"
        case popIn = "popIn"
        case bounceModalBottom = "bounceModalBottom"
        case bounceModalLeft = "bounceModalLeft"
        case bounceModalRight = "bounceModalRight"
        case bounceModalTop = "bounceModalTop"
        
        init(id : Int) {
            switch id {
            case 0:
                self = .slideModalBottom
            case 1:
                self = .slideModalLeft
            case 2:
                self = .slideModalRight
            case 3:
                self = .slideModalTop
            case 4:
                self = .fadeIn
            case 5:
                self = .popIn
            case 6:
                self = .bounceModalBottom
            case 7:
                self = .bounceModalLeft
            case 8:
                self = .bounceModalRight
            case 9:
                self = .bounceModalTop
            default : self = .slideModalBottom
            }
        }
    }
    
    private var tableData: [String] = animationType.allCases.map({$0.rawValue})
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    private func setUpTable() {
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    }
    
    private func animation(index: Int) -> GsCustomAlertAnimationType {
        let type: GsCustomAlertAnimationType!
        switch animationType(id: index) {
            case .slideModalBottom:
                type = .slideModalBottom
            case .slideModalTop:
                type = .slideModalTop
            case .slideModalRight:
                type = .slideModalRight
            case .slideModalLeft:
                type = .slideModalLeft
            case .bounceModalTop:
                type = .bounceModalTop
            case .bounceModalBottom:
                type = .bounceModalBottom
            case .bounceModalLeft:
                type = .bounceModalLeft
            case .bounceModalRight:
                type = .bounceModalRight
            case .popIn:
                type = .popIn
            case .fadeIn:
                type = .fadeIn
        }
        return type
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertView = ChangePasswordView.instantiateFromNib()
        alertView.label_top.text = tableData[indexPath.row]
        alertView.btn_cancel.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        alertView.btn_done.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        alert = GsCustomAlert(customView: alertView, tapToDismiss: true)
        alert.animationType = animation(index: indexPath.row)
        //alert.animationType = .popIn
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController {
    //MARK: - Selectors
    @objc func cancelAction() {
        alert.dismiss(animated: true, completion: nil)
    }
    
    @objc func doneAction() {
        print("Done Button Tapped")
    }
}


