//
//  ViewController.swift
//  RxSwiftTextColorDemonstration
//
//  Created by Jackson Beachwood on 10/27/16.
//  Copyright © 2016 BeachwoodEngineering. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    //Bind this to a textView in the xib/storyboard
    @IBOutlet private weak var textView: UITextView!
    
    var rx_bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindAndBugOut()
    }
    
    private func bindAndBugOut() {
        self.textView.text = "Initial String"
        self.textView.rx.text.asObservable().subscribe(onNext: { (value) in
            self.textView.textColor = UIColor.black
        }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(self.rx_bag)
        
        var counter = 0
        self.textView.rx.text.asObservable().subscribe(onNext: { (value) in
            print("Loop Iteration: \(counter) - TextView Value: \(value)")
            counter += 1
        }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(self.rx_bag)
        self.textView.textColor = UIColor.blue
    }
}

