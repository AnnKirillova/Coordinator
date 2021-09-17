//
//  ChooseColorViewModule.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 17.09.2021.
//

import Foundation
import UIKit

class ChooseColorViewModule{
    func getColor(by id: Int) -> UIColor?{
        switch id {
        case 0:
           return .red
        case 1:
           return .orange
        case 2:
           return .yellow
        case 3:
           return .green
        case 4:
           return .systemBlue
        case 5:
           return .blue
        case 6:
           return .purple
        default:
           return nil
        }
    }
}
