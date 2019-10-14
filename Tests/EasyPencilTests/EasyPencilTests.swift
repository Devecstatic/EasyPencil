import XCTest
@testable import EasyPencil

final class EasyPencilTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(EasyPencil().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
