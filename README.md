phonegap-binary-file-writer-ios
===============================

Phonegap plugin for writing binary files for IOS.

## Installation

1. Add the .js file to your www folder, and load the others into the XCode project's plugins folder.
2. Add the plugin to the plugin list.  That used to be in the .plist file, but now has moved into config.xml.  Use "BinaryFileWriter" for the name and value.
3. Reference the .js file.

## Usage

One important thing to note is that you need to base64 encode the binary data before passing it to the plugin.  Binary data can't be sent from javascript into a plugin.  Only text can be passed.  Base64 encoding will take the binary data and make it into a string.

Another thing to do is make sure that whatever file you are going to write to needs to already exist.  In the example below the pdf file is created first, and then the fullPath for the file is passed to the plugin.

## Demo

// generic error catcher.
var fail = function(evt) {
    console.log(evt.target.error.code);
};

window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function(fileSystem) {
    fileSystem.root.getFile("example.pdf", {create: true, exclusive: false}, function(fileEntry) {

        // FileWrite won't write binary data, so we use our special binary file writer plugin.
        // use btoa to base64 encode the binary data into a string that can be passed to the plugin.
        plugins.binaryFileWriter.writeToFile(fileEntry.fullPath, btoa(output), function(bytes) {
            console.log('file is written: ' + bytes);
        });

    }, fail);
}, fail);
