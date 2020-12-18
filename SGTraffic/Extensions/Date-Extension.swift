//
//  Date-Extension.swift
//  SGTraffic
//
//  Created by tigerspike on 18/12/20.
//

import Foundation

extension Date {
    func covertDateTime() -> String {

        let today = Date()
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        isoFormatter.timeZone = TimeZone(abbreviation: getCurrentTimeZone())

//        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //let date = isoFormatter.date(from: Date)!
        let date = isoFormatter.string(from: today)


        return date
    }
}

func getCurrentTimeZone() -> String{

    return TimeZone.current.identifier

}
