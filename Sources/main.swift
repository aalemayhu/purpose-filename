import Foundation

extension String {
    func replace(a: Character, with: Character) -> String {
        let replaced = String(self.characters.split(separator: a)
        .joined(separator: [with]))
        return replaced
    }
}

class AppRunner {
    func run() {
        // The first element is the application name, which we don't care about in
        // this case.
        let args = Array(Process.arguments.dropFirst())
        guard args.count > 0 else {
            print("Please supply strings to be used for the name")
            return
        }

        print(AppRunner.purposeName(args))
    }

    static func purposeName(args: [String]) -> String {
        //TODO: support suffix argument
        var name = ""
        for x in args { name += x }
        return AppRunner.purposeName(name)
    }

    static func purposeName(name: String, ofType suffix: String = "md") -> String {
        var renamed = name

        if name.containsString(" ") {
            renamed = name.replace(" ", with: "-")
        }
        if suffix.containsString(".") {
            return "\(renamed)\(suffix)"
        }
        return "\(renamed).\(suffix)"
    }
}

let a = AppRunner()
a.run()
