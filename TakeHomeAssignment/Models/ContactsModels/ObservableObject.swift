//
//  ObservableObject.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 30.03.2023.
//

import Foundation

class Observable<T> {
    var value:T? {
        didSet {
            listener?(value)
        }
    }
    init(value: T?) {
        self.value = value
    }
    private var listener:((T?) -> Void)?
    
    func bind(listener: @escaping ((T)?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
