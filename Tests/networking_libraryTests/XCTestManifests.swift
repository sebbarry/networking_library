import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(networking_libraryTests.allTests),
    ]
}
#endif
