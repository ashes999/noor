![logo](logo.png)

# Noor

![Build status](https://travis-ci.org/ashes999/noor.svg)

Noor brings the best parts of working in C# to Haxe. The roadmap includes:

- LINQ-like lambdas for collections
- Common string methods: `StartsWith`, `EndsWith`, and more
- Container methods that return `true/false` instead of `indexOf(x) > -1`
- And more!

Noor is currently under active development. To consume it as a libray, use `haxlib git noor http://github.com/ashes999/noor`.

# Exceptions/Errors

Noor provides a basic `Exception` class with a configurable message. Throw it, or extend it to expose more specific exceptions (eg. `NotImplementedException`).

```
public function divide(a:Int, b:Int) {
    if (b == 0) {
        throw new Exception("Can't divide by zero.");
    }
}
```

Alternatively:

```
class DivideByZeroException extends noor.Exception
{
    public function new() { super("Can't divide by zero."); }
}

throw new DivideByZeroException();
```

# FileSystem extensions

Noor extends `sys.FileSystem` with several helpers. To use them, specify `using noor.io.FileSystemExtensions`, then call them from `FileSystem` as normal.

- `FileSystem.copyDirectoryRecursively(source, destination)`: Creates the `destination` directory and copies `source` into it recursively.
- `FileSystem.deleteDirectoryRecursively(directory)`: Deletes `directory` and all files/subfolders recursively
 - `FileSystem.ensureDirectoryExists(directory)`: Throws an exception if `directory` doesn't exist 
 - `FileSystem.getFiles(directory)`:
 - `FileSystem.recreateDirectory(directory)`: Deletes and re-creates `directory` if it exists; creates it if it doesn't exist

# Math extensions

```
using noor.MathExtensions;

var n:Int = Math.randomBetween(10, 20); // 10 <= n < 20
```

# noor.web.Request

Noor exposes a `getUrlParameters` method that returns a map of key/value pairs (`Map<String, Dynamic>`). This provides a way to access URL parameters across Neko, Flash, and Javascript.

eg. with a URL like `index.html?a=true&b=hello%20there!&c=71`, `getUrlParameters` returns `{ a => true, b => "hello there!", c => 71 }`