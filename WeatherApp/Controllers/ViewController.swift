//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 22/01/2018.
//  Copyright © 2018 Mohamed Ali. All rights reserved.
//

import Cocoa
import SwiftyJSON
import Kingfisher

class ViewController: NSViewController {

    @IBOutlet weak var timeLB: NSTextField!
    @IBOutlet weak var dayLB: NSTextField!
    @IBOutlet weak var weatherIV: NSImageView!
    @IBOutlet weak var degreeLB: NSTextField!
    @IBOutlet weak var humidityLB: NSTextFieldCell!
    @IBOutlet weak var pressureLB: NSTextField!
    @IBOutlet weak var tempMinLB: NSTextField!
    @IBOutlet weak var tempMaxLB: NSTextField!
    @IBOutlet weak var windSpeedLB: NSTextField!
    @IBOutlet weak var descriptionLB: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        
        let dateString = formatter.string(from: Date())
        dayLB.stringValue = dateString
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        timeLB.stringValue = formatter.string(from: Date())
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimeLB), userInfo: nil, repeats: true)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @objc func updateTimeLB() {
        DispatchQueue.main.async {
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .medium
            self.timeLB.stringValue = formatter.string(from: Date())
        }
    }

    func getWeather() {
        WeatherTask(query: "Paris").execute(in: weatherDispatcher).then(in: .main, { weather in
            self.degreeLB.stringValue = "\(weather.temp) °C"
            self.pressureLB.stringValue = "\(weather.pressure) \""
            self.tempMinLB.stringValue = "\(weather.temp_min) °C"
            self.tempMaxLB.stringValue = "\(weather.temp_max) °C"
            self.windSpeedLB.stringValue = "\(weather.wind_speed) m/s"
            self.degreeLB.stringValue = "\(weather.temp) °C"
            self.descriptionLB.stringValue = weather.description
            self.humidityLB.stringValue = "\(weather.humidity) %"
            self.weatherIV.kf.setImage(with: ImageResource(downloadURL: weather.icon as URL))
         }).catch(in: .main, { error in
            print("Something bad occurred: \(error)")
        })
    }
}
