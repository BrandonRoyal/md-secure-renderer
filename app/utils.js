var path = require('path');

var utils = {};

utils.isFileExtensionMatch = function(filePath, fileExtensionArray){
    var match = false;
    fileExtensionArray.forEach(function(element) {
        if (path.extname(filePath).toLowerCase() === element){
            match = true;
        }
    }, this);
    return match;
}

utils.updatePath = function(filePath){
    var relPath = path.relative(path.resolve(__dirname), path.resolve(filePath));
    var newPath = path.resolve(relPath.replace('content/', 'www/'));
    return newPath;
}

utils.updateNameToIndex = function(filePath){
    var newPath = filePath;
    console.log(path.basename(newPath));
    if (path.basename(newPath) === 'README.md'){
        console.log('mewo')
        newPath = newPath.replace('README.md', 'index.md');
    }
    return newPath;
}

utils.updateExtension = function(filePath, fileExtensionArray){
    var newPath = filePath;
    for (var i = 0, len = fileExtensionArray.length; i < len; i++) {
        newPath = newPath.replace(fileExtensionArray[i], '.html');
    }
    return newPath;
}

module.exports = utils;