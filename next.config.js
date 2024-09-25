module.exports = {
  reactStrictMode: true,
  output: 'export', // for static exports
  // or
  output: 'standalone', // for server builds
  // Add other valid options here
  async rewrites() {
    return [
      {
        source: '/',
        destination: '/index.html',
      },
    ]
  },
}
