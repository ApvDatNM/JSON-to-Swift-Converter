//
//  AppSettingsTests.swift
//  JSON to Swift Converter
//
//  Created by Brian Arnold on 2/25/17.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import XCTest


class AppSettingsTests: XCTestCase {
    
    func testSharedInstance() {
        /// Use AppSettings default constructor once here for code coverage,
        /// because it will access the shared UserDefaults which may change between tests.
        let _ = AppSettings()
    }
    
    func testDefaultSettings() {
        let appSettings = AppSettings(UserDefaults(suiteName: "JSON-to-Swift-tests-defaults")!)
        
        XCTAssertEqual(appSettings.declaration, .useLet, "default for declaration")
        XCTAssertEqual(appSettings.typeUnwrapping, .required, "default for type unwrapping")
        XCTAssertTrue(appSettings.supportCodable, "default for support Codable")
        XCTAssertFalse(appSettings.addDefaultValue, "default for add default value")
    }

    func testChangingSettings() {
        var appSettings = AppSettings(UserDefaults(suiteName: "JSON-to-Swift-tests-changing")!)

        appSettings.declaration = .useVar
        XCTAssertEqual(appSettings.declaration, .useVar, "declaration")
        
        appSettings.typeUnwrapping = .explicit
        XCTAssertEqual(appSettings.typeUnwrapping, .explicit, "type unwrapping")

        appSettings.typeUnwrapping = .optional
        XCTAssertEqual(appSettings.typeUnwrapping, .optional, "type unwrapping")

        appSettings.supportCodable = false
        XCTAssertFalse(appSettings.supportCodable, "support Codable")
        
        appSettings.addDefaultValue = true
        XCTAssertTrue(appSettings.addDefaultValue, "add default value")
    }
    
    func testTypeUnwrappingStringConvertible() {
        XCTAssertEqual("\(AppSettings.TypeUnwrapping.explicit)", "", "type unwrapping explicit string")
        XCTAssertEqual("\(AppSettings.TypeUnwrapping.optional)", "?", "type unwrapping optional string")
        XCTAssertEqual("\(AppSettings.TypeUnwrapping.required)", "!", "type unwrapping required string")
    }
    
}
