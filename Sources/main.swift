import Foundation

extension String {
    func replace(a: Character, with: Character) -> String {
        let replaced = String(self.characters.split(separator: a)
            .joined(separator: [with]))
        return replaced
    }
}

class AAMain {
    func run() {
        let args = Process.arguments
        guard args.count > 1 else {
            print("Please supply strings to be used for the name")
            return
        }
        print(AAMain.use(arguments: args))
    }
    
    static func use(arguments argv: [String]) -> String {
        //TODO: support suffix argument
        // The first element is the application name, which we don't care about in
        // this case.
        let args = Array(argv.dropFirst())
        var name = ""
        for x in args { name += x }
        return AAMain.rename(name: name)
    }
    
    static func rename(name: String, ofType suffix: String = "md") -> String {
        var renamed = name
        
        if name.contains(" ") {
            renamed = name.replace(a: " ", with: "-")
        }
        if suffix.contains(".") {
            return "\(renamed)\(suffix)"
        }
        return "\(renamed).\(suffix)"
    }
}

let a = AAMain()
a.run()
