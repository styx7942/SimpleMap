//
//  ViewController.swift
//  DITMap
//
//  Created by D7703_11 on 2017. 8. 31..
//  Copyright © 2017년 LeeHyeonHo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//-----------------------------------------------------
        // DIT 위치정보 35.166096, 129.072616
        let center = CLLocationCoordinate2DMake(35.166096, 129.072616)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
      
        
        myMapView.setRegion(region, animated: true)
        
//-----------------------------------------------------
        
        
        //Annotation(Pin) 꼽기
        let anno01 = MKPointAnnotation()
        anno01.coordinate = center
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        
        
        
        myMapView.addAnnotation(anno01)
        
        
        
        let anno02 = MKPointAnnotation()
        anno02.coordinate.latitude = 35.168424
        anno02.coordinate.longitude = 129.057823
        anno02.title = "부산시민공원"
        anno02.subtitle = "포켓몬GO!!"
        
        myMapView.addAnnotation(anno02) 
        
        myMapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        let idebtufier = "My Pin"
        var annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: idebtufier) as? MKPinAnnotationView
        
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: idebtufier)
            annotationView?.canShowCallout = true
            
            if annotation.title! == "부산시민공원" {
                annotationView?.pinTintColor = UIColor.green
            }
            
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            if annotation.title! == "부산시민공원"{
                leftIconView.image = UIImage(named: "aa.jpeg")
            }else{
                leftIconView.image = UIImage(named: "unnamed.png")
            }
            
            annotationView?.leftCalloutAccessoryView = leftIconView
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        }else{
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Accessary Button tapped!!!")
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Accessary Button tapped!!!")
        let viewAnno = view.annotation
        let viewTitle : String = ((viewAnno?.title)!)!
        let viewSubTitle : String = ((viewAnno?.subtitle)!)!
        
        print("\(viewTitle) \(viewSubTitle)")
        
        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        ac.addAction(UIAlertAction(title: "CANCEL", style: .destructive, handler: nil))
        
        present(ac, animated: true, completion: nil)
    }
    
    

}

