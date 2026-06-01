import { defineConfig } from 'vite';
import { resolve } from 'node:path';

export default defineConfig({
  base: '/recruit-designer/',
  build: {
    outDir: resolve(__dirname, '../build/web/recruit-designer'),
    emptyOutDir: true,
    assetsDir: 'assets',
    cssCodeSplit: false,
    sourcemap: false,
    target: 'es2020',
    rollupOptions: {
      output: {
        entryFileNames: 'assets/[name]-[hash].js',
        chunkFileNames: 'assets/[name]-[hash].js',
        assetFileNames: 'assets/[name]-[hash][extname]',
      },
    },
  },
  server: {
    port: 5174,
    open: '/',
  },
});
