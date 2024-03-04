//
//  GetCSVData.swift
//  Something
//
//  Created by 张萌琦 on 2024/3/2.
//

import Foundation

func getCSVData(CSVPath: String) -> Array<String> {
    do {
        let content = try String(contentsOfFile: CSVPath)
        let parsedCSV: [String] = content.components(
            separatedBy: "\n"
        ).map{ $0.components(separatedBy: ",")[0] }
        print(parsedCSV)
        return parsedCSV
    }
    catch {
        return []
    }
}
