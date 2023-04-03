//
//  DetailAlertsViewController.swift
//  TakeHomeAssignment
//
//  Created by Daniel Ardeleanu on 03.04.2023.
//

import UIKit

class DetailAlertsViewController: UIViewController {
    
    
    var detailAlertViewModel:DetailAlertsViewModel
    
    init(detailAlertViewModel: DetailAlertsViewModel) {
        self.detailAlertViewModel = detailAlertViewModel
        super.init(nibName: "DetailAlertsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startDate: UILabel!
    
    @IBOutlet weak var endDate: UILabel!
    
    @IBOutlet weak var severity: UILabel!
    
    @IBOutlet weak var certainty: UILabel!
    @IBOutlet weak var urgency: UILabel!
    
    @IBOutlet weak var source: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }


    private func configureView() {
        let model = detailAlertViewModel.alertsModel
        let startDateString = Utility.shared.tranformDateToString(date: model.startDate)
        startDate.text = "Start Date: \(startDateString)"
        let endDateString = Utility.shared.tranformDateToString(date: model.endDate)
        endDate.text = "End Date: \(endDateString)"
        severity.text = "Severity: \(model.severity)"
        certainty.text = "Certainty: \(model.certainty)"
        urgency.text = "Urgency: \(model.urgency)"
        source.text = "Source: \(model.sourceOfAlert)"
        descriptionLabel.text = "Description: \(model.description)"
        let highResImage = Utility.shared.resizeImageWithAspect(image: detailAlertViewModel.image, scaledToMaxWidth: 200, maxHeight: 200)
        imageView.image = highResImage
    }

}
