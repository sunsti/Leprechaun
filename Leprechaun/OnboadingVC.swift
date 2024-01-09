//
//  OnboadingVC.swift
//  Leprechaun

import Foundation
import UIKit

class OnboadingVC: UIViewController {
    

    private var contentView: OnboadingView {
        view as? OnboadingView ?? OnboadingView()
    }
    
    override func loadView() {
        view = OnboadingView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
