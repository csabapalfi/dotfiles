exports.name = basename;
exports.version = '1.0.0';
if (!package.description) {
  exports.description = yes ? '' : prompt('description')
}
exports.repository = {
    type: 'git',
    url: 'https://github.com/csabapalfi/' + basename + '.git'
};
exports.license = 'MIT'
