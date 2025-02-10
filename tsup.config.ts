import { defineConfig } from 'tsup'

const components = []
export default defineConfig((options) => ({
  entry: ['src/index.ts'],
  outDir: 'dist', // Output directory
  format: ['cjs', 'esm'], // Build CommonJS and ESM formats
  sourcemap: true, // Generate source maps
  dts: true, // Generate type declarations
  // minify: true, // Minify output
  clean: true, // Clean output directory before building
  css: true, // Include CSS in the build
  external: ['next', 'react', 'react-dom'],
  esbuildOptions: (options) => {
    options.alias = {
      '@': './src', // Map '@' to the 'src' directory
    }
  },
}))
