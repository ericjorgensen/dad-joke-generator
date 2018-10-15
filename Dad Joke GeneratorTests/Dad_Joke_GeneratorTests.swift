//
//  Dad_Joke_GeneratorTests.swift
//  Dad Joke GeneratorTests
//
//  Created by Eric Jorgensen on 10/8/18.
//  Copyright © 2018 Eric Jorgensen. All rights reserved.
//

import XCTest
@testable import Dad_Joke_Generator

class Dad_Joke_GeneratorTests: XCTestCase {
    
    let testCorpusFileManager = CorpusLibraryManager()

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCorpusLibraryManagerInit() {
        
        XCTAssertNotNil(testCorpusFileManager)
    }
    
    func testCreateCorpusFile() {
        
    }
}
