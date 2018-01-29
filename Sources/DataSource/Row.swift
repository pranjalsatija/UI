//
//  Row.swift
//  UI
//
//  Created by Pranjal Satija on 1/27/18.
//  Copyright © 2018 Pranjal Satija. All rights reserved.
//

public enum Row {
    case button(text: String, clickHandler: () -> Void)
    case text(image: UIImage?, message: String)
}
