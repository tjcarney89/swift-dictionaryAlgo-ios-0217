//: Playground - noun: a place where people can play

import UIKit

//DICTIONARY

struct Dictionary {
    
    var dict = [(String, Any)]()
    
    mutating func addKeyAndValue(key: String, value: String) {
        for (index, _) in dict.enumerated() {
            if dict[index].0.contains(key) {
                break
            } else {
                dict.append((key, value))
            }
        }
    }
    
    func getAllKeys() -> [String] {
        var keysArray: [String] = []
        for (index, _) in dict.enumerated() {
            keysArray.append(dict[index].0)
        }
        return keysArray
    }
    
    func getAllValues() -> [Any] {
        var valuesArray: [Any] = []
        for (index, _) in dict.enumerated() {
            valuesArray.append(dict[index].1)
        }
        return valuesArray
    }
    
    mutating func removeKeyAndValue(key: String) {
        for (index, _) in dict.enumerated() {
            if dict[index].0.contains(key) {
                dict.remove(at: index)
            }
        }
    }
    
    mutating func updateValue(key: String, value: String) {
        for (index, _) in dict.enumerated() {
            if dict[index].0.contains(key) {
                dict[index].1 = value
            }
        }
    }
    
    
}

var newDict = Dictionary(dict: [("Johann", "Kerr")])
print(newDict)
newDict.addKeyAndValue(key: "Johann", value: "Jim")
print(newDict)
newDict.addKeyAndValue(key: "Jim", value: "Campagno")
print(newDict)
newDict.getAllKeys()
newDict.getAllValues()
newDict.removeKeyAndValue(key: "Jim")
print(newDict)
newDict.updateValue(key: "Johann", value: "Campagno")
print(newDict)

//CLOCK

func angle(time: String) -> Int {
    
    var newTime = time.components(separatedBy: ":")
    var newHour = Int(newTime[0])
    var newMinute = Int(newTime[1])
    var minuteHandArray: [Int] = []
    var hourHandArray: [Int] = []
    var minuteHand = -6
    var hourHand = 0
    
    for i in 1...12 {
        hourHand += 30
        hourHandArray.append(hourHand)
    }
    
    for i in 0...60 {
        minuteHand += 6
        minuteHandArray.append(minuteHand)
    }
    
    var hour: Int = 0
    var minute = minuteHandArray[newMinute!]
    
    if newHour! == 0 {
        newHour = 12
    }
    if newHour! > 12 {
        hour = hourHandArray[(newHour! - 12) - 1]
    } else {
        hour = hourHandArray[newHour! - 1]
    }
    
    var angle = abs(hour-minute)
    
    if angle > 180 {
        angle = 360 - angle
    }
    
    return angle
}

angle(time: "12:15")

