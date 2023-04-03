//
//  Utility.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 30.03.2023.
//

import Foundation
import UIKit

final class Utility {
    
    static let shared = Utility()
    private init() {}
    func tranformDateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    func resizeImageWithAspect(image: UIImage,scaledToMaxWidth width:CGFloat,maxHeight height :CGFloat) -> UIImage? {
        let oldWidth = image.size.width;
        let oldHeight = image.size.height;
        
        let scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
        
        let newHeight = oldHeight * scaleFactor;
        let newWidth = oldWidth * scaleFactor;
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize,false,UIScreen.main.scale);
        
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage
    }
    
}

enum Const {
    static let contactsCell = "ContactsCell"
    static let contactsNibname = "ContactsTableViewCell"
    static let contactsDetailStoryboardId = "ContactDetailsViewController"
    static let detailsCell = "DetailContactsCell"
    static let detailsNibName = "DetailContactTableViewCell"
    static let weatherAlertsNibName = "WeatherAlertsTableViewCell"
    static let weatherAlertsCell = "WeatherAlertCell"
}


