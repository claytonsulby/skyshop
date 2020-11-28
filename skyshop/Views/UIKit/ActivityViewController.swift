//
//  ActivityViewController.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/26/20.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        controller.excludedActivityTypes = [
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.copyToPasteboard,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToVimeo
        ]
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}
