//
//  main.swift
//  XMLSwiftParseDemo
//
//  Created by Roberto Machorro on 9/8/22.
//

import Foundation
import XMLParsing

let xml = """
<airportlist> <hash>F16443A97073B98718174A8AFCDE5F65</hash> <changed>true</changed> <airports> <airport> <id>AAL_APT_0001</id><code>AAL</code> <name>Int</name> <citycode>AAL</citycode> <city>Aalborg</city> <countrycode>DK</countrycode> <country>Danimarca</country> <continent>Europa</continent> <latitude>57,09275891</latitude> <longitude>9,849243164</longitude> </airport> <airport> <id>AES_APT_0019</id><code>AES</code> <name>Aalesund Vigra</name> <citycode>AES</citycode> <city>Aalesund</city> <countrycode>NO</countrycode> <country>Norvegia</country> <continent>Europa</continent> <latitude>62,5625</latitude> <longitude>6,119699955</longitude> </airport> <airport> <id>AAR_APT_0001</id><code>AAR</code> <name>Aarhus Airport</name> <citycode>AAR</citycode> <city>Aarhus</city> <countrycode>DK</countrycode> <country>Danimarca</country> <continent>Europa</continent> <latitude>56,2999992</latitude> <longitude>10,6190004</longitude> </airport> </airports> </airportlist>
"""

struct Airport: Codable {
	let id: String
	let code: String
	let name: String
	let citycode: String
	let city: String
	let countrycode: String
	let country: String
	let continent: String
	let latitude: String
	let longitude: String
}

struct Airports: Codable {
	var airport: [Airport]
}

struct AirportList: Codable {
	var hash: String
	var changed: Bool
	var airports: Airports
}

if let data = xml.data(using: .utf8) {
	do {
		let airportlist = try XMLDecoder().decode(AirportList.self, from: data)
		let returnData = try XMLEncoder().encode(airportlist, withRootKey: "airportlist")
		print(String(data: returnData, encoding: .utf8) ?? "")
	} catch {
		print(error)
	}
}
