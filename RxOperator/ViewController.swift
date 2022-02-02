//
//  ViewController.swift
//  RxOperator
//
//  Created by tw on 2022/01/17.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let button = UIButton(type: .custom)
    let disposeBag = DisposeBag()
    
    var deboundCount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.just(1)
            .materialize()
        
        
        // 1 Debounce
        button.rx.tap
            .asDriver()
            .debounce(.seconds(3))
            .drive(onNext: { [weak self] _ in
                self?.deboundCount += 1
            }).disposed(by: disposeBag)
        
        // 2 ElementAt
        let subject2 = PublishSubject<Int>()
        subject2
            .debug()
            .element(at: 2)
            .subscribe(onNext: { _ in
                print("OUT")
            }).disposed(by: disposeBag)
        
        subject2.onNext(1)
        subject2.onNext(2)
        subject2.onNext(3)
        subject2.onNext(4)
        subject2.onNext(5)

        
        // 3 filter
        Observable.of(1, 2, 3, 4, 5)
            .filter { $0 == 1 }
            .subscribe(onNext: { value in
                print(value)
            }).disposed(by: disposeBag)
        
        
        // 4 first
//        Observable.of(1, 2, 3)
//            .first(1)
        
        // 5 IgnoreElements
        let subject5 = PublishSubject<Int>()
        subject5
            .ignoreElements()
    }


}

