import Foundation

class AppRunner {
  func run() {
    // The first element is the application name, which we don't care about in
    // this case.
    let args = Process.arguments.dropFirst()
      guard args.count > 0 else {
        print("Please supply strings to be used for the name")
          return
      }
  }

  static func purposeName(name: String, ofType suffix: String = "md") -> String {
    let renamed = name
    //jlet joined = args.joinWithSeparator("-")
      //joined.lowercaseString
      return "\(renamed).\(suffix)"
  }
}

let a = AppRunner()
a.run()

