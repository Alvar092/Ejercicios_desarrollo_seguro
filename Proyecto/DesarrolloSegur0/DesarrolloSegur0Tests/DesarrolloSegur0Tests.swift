//
//  DesarrolloSegur0Tests.swift
//  DesarrolloSegur0Tests
//
//  Created by Álvaro Entrena Casas on 20/6/25.
//

import XCTest
@testable import DesarrolloSegur0

final class DesarrolloSegur0Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCharactersNetwork() async throws {
        let network = NetworkCharacters()
        
        let characters = await network.getCharacters(filter: "Morty")
        
        XCTAssert(characters.count == 68)
    }

}
