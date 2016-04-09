@testable import PurposeName
import XCTest

class PurposeNameTests: XCTestCase {
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

    func testSuffixArgumentIsUsed() {
      let input = ["processName", "1", "--suffix txt"]
      let result = AppRunner.purposeName(input)
      XCTAssertEqual(result, "1.txt")
    }
}

#if os(Linux)
extension PurposeNameTests: XCTestCaseProvider {
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
