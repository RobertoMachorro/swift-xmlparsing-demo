//
//  main.swift
//  XMLSwiftParseDemo
//
//  Created by Roberto Machorro on 9/8/22.
//

import Foundation
import XMLParsing

let xmlStr = """
<note>
	<to>Bob</to>
	<from>Jane</from>
	<heading>Reminder</heading>
	<body>Don't forget to use XMLParsing!</body>
</note>
"""

struct Note: Codable {
	var to: String
	var from: String
	var heading: String
	var body: String
}

if let data = xmlStr.data(using: .utf8),
   let note = try? XMLDecoder().decode(Note.self, from: data),
   let returnData = try? XMLEncoder().encode(note, withRootKey: "note") {
	print(String(data: returnData, encoding: .utf8) ?? "")
} else {
	print("Decoding or Encoding failed.")
}
