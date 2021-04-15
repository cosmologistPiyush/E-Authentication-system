//
//  data.swift
//  E-Authentication App
//
//  Created by Piyush Sachdeva on 15/04/21.
//  Copyright © 2021 Piyush Sachdeva. All rights reserved.
//

import Foundation

enum type{
    case QR
    case OTP
}
struct Data {
    var type: type
    var name: String
    var description: String
    var purpose: String
}
