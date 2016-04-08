@testable import purposeName
import XCTest

class purposeNameTests: XCTestCase {
  func testNoSuffix() {
    let result = AppRunner.purposeName("README")
      XCTAssertEqual(result, "README.md")
  }
}
