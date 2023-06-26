//
//  LoadImageFunction.swift
//  MC2-United-Hands
//
//  Created by Jason Leonardo on 26/06/23.
//

import Foundation
import SwiftUI

func loadImageFromPath(_ path: String) -> UIImage? {
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return nil
    }
    
    let imagePath = documentsDirectory.appendingPathComponent(path).path
    return UIImage(contentsOfFile: imagePath)
}
