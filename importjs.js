module.exports = {
  declarationKeyword: 'const',
  danglingCommas: false,
  importDevDependencies: true,
  importStatementFormatter: ({ importStatement }) => {
    return importStatement.replace(/;$/, '')
  }
}
