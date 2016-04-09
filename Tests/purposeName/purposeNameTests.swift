@testable import purposeName
import XCTest

class purposeNameTests: XCTestCase {
    func testNoSuffix() {
        let result = AppRunner.purposeName("README")
        XCTAssertEqual(result, "README.md")
    }

    func testJPGSuffix() {
        let result = AppRunner.purposeName("beach", ofType: "JPG")
        XCTAssertEqual(result, "beach.JPG")
    }

    func testPNGSuffixWithExtraPeriod() {
        let result = AppRunner.purposeName("stars", ofType: ".PNG")
        XCTAssertEqual(result, "stars.PNG")
    }

    func testWhitespace() {
        let result = AppRunner.purposeName("stars are aligned")
        XCTAssertEqual(result, "stars-are-aligned.md")
    }
}

#if os(Linux)
extension purposeNameTests: XCTestCaseProvider {
  var allTests : [(String, () throws -> Void)] {
    return [
      ("testNoSuffix", testNoSuffix),
      ("testJPGSuffix", testJPGSuffix),
      ("testPNGSuffixWithExtraPeriod", testPNGSuffixWithExtraPeriod),
      ("testWhitespace", testWhitespace),
      ("testSuffixArgumentIsUsed", testSuffixArgumentIsUsed),
      ]
  }
}
#endif
