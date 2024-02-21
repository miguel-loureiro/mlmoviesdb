//
//  Observable.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 09/01/2024.
//

import Foundation

class Observable<T> {

    var value: T? {
        didSet {
            guard let unwrappedValue = value else {
                return
            }
            
            DispatchQueue.main.async {
                self.listener?(unwrappedValue)
            }
        }
    }

    init( _ value: T?) {
        self.value = value
    }

    private var listener: ((T) -> Void)?

    func bind( _ closure: @escaping ((T?) -> Void)) {
        closure(value)
        self.listener = closure
    }
}
