import XCTest
@testable import networking_library

final class networking_libraryTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(networking_library().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
