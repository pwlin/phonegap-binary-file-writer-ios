var exec = require("cordova/exec");

function BinaryFileWriter() {};

BinaryFileWriter.prototype.writeToFile = function(path, data, callback) { // data = base64 encoded string.
	cordova.exec(callback, function(err) {
		console.log('error.');
	}, "BinaryFileWriter", "writeToFile", [path, data]);
};

var binaryFileWriter = new BinaryFileWriter();
module.exports = binaryFileWriter;