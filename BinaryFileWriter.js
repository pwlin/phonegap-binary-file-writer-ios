(function() {

	var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks

	function BinaryFileWriter() {
		this.writeToFile = function(path, data, callback) { // data = base64 encoded string.
			cordova.exec(callback, function(err) {
				console.log('error.');
			}, "BinaryFileWriter", "writeToFile", [path, data]);
		};
	}

	if (cordovaRef && cordovaRef.addConstructor) {
		cordovaRef.addConstructor(function() {
			if (!window.plugins) {
				window.plugins = {};
			}
			if (!window.plugins.binaryFileWriter) {
				window.plugins.binaryFileWriter = new BinaryFileWriter();
			}
		});
	}

})();