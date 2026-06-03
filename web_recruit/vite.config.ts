import { defineConfig } from 'vite';
import { resolve } from 'node:path';

export default defineConfig({
  build: {
    // 라이브러리 모드: Flutter 안에서 mount(host) 호출로 부착
    lib: {
      entry: resolve(__dirname, 'src/main.ts'),
      name: 'RecruitDesigner',
      formats: ['es'],
      fileName: () => 'recruit-designer.js',
    },
    // Flutter dev/build 양쪽이 정적 자산을 web/에서 가져가므로
    // 빌드 산출물을 직접 web/recruit-designer/로 보낸다.
    outDir: resolve(__dirname, '../web/recruit-designer'),
    emptyOutDir: true,
    cssCodeSplit: false,
    sourcemap: false,
    target: 'es2020',
    rollupOptions: {
      output: {
        assetFileNames: 'recruit-designer[extname]',
      },
    },
  },
  // 라이브러리 모드에서도 process.env.NODE_ENV 참조를 빌드 타임에 치환
  define: {
    'process.env.NODE_ENV': JSON.stringify('production'),
  },
  server: {
    port: 5174,
    cors: true,
    open: '/',
  },
});
