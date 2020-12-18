//
//  SGTrafficTests.swift
//  SGTrafficTests
//
//  Created by tigerspike on 16/12/20.
//

import XCTest
@testable import SGTraffic

class SGTrafficTests: XCTestCase {
    let viewModel = TrafficMapViewModal()

    override func setUpWithError() throws {
        viewModel.getTrafficList()

        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.trafficsData.count, 2)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testEmptyData() {
        viewModel.getTrafficList()
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.trafficsData.count, 0)
    }

    func testAPI(){
        XCTAssertFalse(viewModel.trafficsData.count > 0)

        let json = """
                {
                  "items": [
                    {
                      "timestamp": "2020-12-17T02:18:44+08:00",
                      "cameras": [
                        {
                          "timestamp": "2020-12-17T02:18:44+08:00",
                          "image": "https://images.data.gov.sg/api/traffic-images/2020/12/41dbba0a-c148-44cf-bc67-74de0f769841.jpg",
                          "location": {
                            "latitude": 1.29531332,
                            "longitude": 103.871146
                          },
                          "camera_id": "1001",
                          "image_metadata": {
                            "height": 240,
                            "width": 320,
                            "md5": "6b2e687a60a7376dfbf77ff6b8a3887e"
                          }
                        }
                    ]
                    }
                  ]
                }

        """.data(using: .utf8)!

        let traffics = try! JSONDecoder().decode(ListTrafficItem.self, from: json)
        XCTAssertNotNil(traffics)
        //XCTAssertEqual(traffics[0].cameras.count, 1)
    }

    func testDateFormat(){
        let today = Date().covertDateTime()
        XCTAssertNotNil(today)
    }

}
