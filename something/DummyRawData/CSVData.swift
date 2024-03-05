//
//  CSVData.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//

import Foundation

class CSVData {
    private var data: [String: [[String]]]
    let resourceNames: [String]
    let resourceType: String
    
    init(resourceNames: [String], resourceType: String = "csv") {
        self.resourceNames = resourceNames
        self.data = [:]
        self.resourceType = resourceType
        for resourceName in resourceNames {
            do {
                guard let pathToCSV = Bundle.main.path(forResource: resourceName, ofType: resourceType) else {
                    print("File not found in main bundle: \(resourceName).\(resourceType)")
                    return
                }
                let content = try String(contentsOfFile: pathToCSV).replacingOccurrences(of: "\r", with: "")
                let parsedCSV: [[String]] = content.components(separatedBy: "\n")
                    .map{ $0.components(separatedBy: ",") }
                print("Successfully parsed \(pathToCSV), length: \(parsedCSV.count)")
                self.data[resourceName] = parsedCSV
            }
            catch {
                print("Failed parsing (\(resourceName).\(resourceType)):\n \(error)")
                self.data[resourceName] = []
            }
        }
        print(self.data["LessonGroup"]![1])
    }
    
    func getData() -> [String: [[String]]] {
        return self.data
    }
}
