package noor.io;

import sys.FileSystem;
using noor.io.FileSystemExtensions;

// Extensions for sys.FileSystem. Use it via "using noor.io.FileSystemExtensions"
// TODO: replace string messages with exceptions that have a type and message
// eg. DirectoryDoesntExistException
class FileSystemExtensions
{
    public static function copyDirectoryRecursively(fs:Class<FileSystem>, srcPath:String, destPath:String) : Void
    {
        if (!FileSystem.exists(destPath))
        {
            FileSystem.createDirectory(destPath);
        }

        if (FileSystem.exists(srcPath) && FileSystem.isDirectory(srcPath))
        {
            var entries = FileSystem.readDirectory(srcPath);
            for (entry in entries)
            {
                if (FileSystem.isDirectory('${srcPath}/${entry}'))
                {
                    FileSystem.createDirectory('${srcPath}/${entry}');
                    FileSystem.copyDirectoryRecursively('${srcPath}/${entry}', '${destPath}/${entry}');
                }
                else
                {
                    sys.io.File.copy('${srcPath}/${entry}', '${destPath}/${entry}');
                }
            }
        }
        else 
        {
            throw srcPath + " doesn't exist or isn't a directory";
        }
    }

    public static function deleteDirectoryRecursively(fs:Class<FileSystem>, path:String) : Void
    {
        validateDirectoryExists(path);
        
        var entries = FileSystem.readDirectory(path);
        for (entry in entries)
        {
        if (FileSystem.isDirectory('${path}/${entry}'))
        {
                FileSystem.deleteDirectoryRecursively('${path}/${entry}');
        }
        else
        {
                FileSystem.deleteFile('${path}/${entry}');
        }
        }
        FileSystem.deleteDirectory(path);
        
    }

    public static function ensureDirectoryExists(fs:Class<FileSystem>, path:String) : Void
    {
        if (!FileSystem.exists(path))
        {
            throw path + " doesn't exist";
        }
        else if (!FileSystem.isDirectory(path))
        {
            throw path + " isn't a directory";
        }
    }
    
    /** Get all files (not directories) on a given path. Not recursive. Ignores .DS files/folders. */
    public static function getFiles(fs:Class<FileSystem>, path:String):Array<String>
    {
        var toReturn = new Array<String>();

        validateDirectoryExists(path);
        
        var filesAndDirs = FileSystem.readDirectory(path);
        for (entry in filesAndDirs)
                {
                var relativePath = '${path}/${entry}';
                // Ignore .DS on Mac/OSX
                if (entry.toUpperCase().indexOf(".DS") == -1 && !FileSystem.isDirectory(relativePath))
                {
                        toReturn.push(relativePath);
                }
        }
        

        return toReturn;
    }
    
    /** If a directory exists, delete it. Recreate the directory. */
    public static function recreateDirectory(fs:Class<FileSystem>, directory:String):Void
    {
        if (FileSystem.exists(directory))
        {
            FileSystem.deleteDirectoryRecursively(directory);
        }
        FileSystem.createDirectory(directory);
    }
    
    private static function validateDirectoryExists(path:String):Void
    {
        if (!FileSystem.exists(path))
        {
                throw 'Path ${path} doesn\'t exist';
        }
         
        if (!FileSystem.isDirectory(path))
        {
                throw 'Path ${path} isn\'t a directory';                
        }
    }
}
