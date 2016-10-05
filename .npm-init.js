if (!package.name) {
  exports.name = basename;
}

if (!package.version) {
  exports.version = '1.0.0';
}

if (!package.repository) {
  exports.repository = `csabapalfi/${basename}`;
}

if (!package.license) {
  exports.license = "MIT";
}
