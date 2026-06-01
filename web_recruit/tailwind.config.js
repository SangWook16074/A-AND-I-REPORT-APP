/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{ts,html}'],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Pretendard', 'system-ui', 'sans-serif'],
      },
      colors: {
        ink: {
          50: '#f5f7fb',
          100: '#e7eaf2',
          200: '#c2cad9',
          300: '#8c95a8',
          400: '#5a6273',
          500: '#3a4150',
          600: '#252a35',
          700: '#15181f',
          800: '#0a0b10',
          900: '#050608',
          950: '#000000',
        },
        brand: {
          50: '#eff6ff',
          100: '#dbeafe',
          200: '#bfdbfe',
          300: '#93c5fd',
          400: '#60a5fa',
          500: '#3b83f6',
          600: '#2563eb',
          700: '#1d4ed8',
          800: '#1e40af',
          900: '#1e3a8a',
        },
        accent: {
          deep: '#1e3a8a',
        },
      },
      letterSpacing: {
        tightest: '-0.04em',
        tighter2: '-0.025em',
      },
      fontSize: {
        'display-2xl': ['clamp(3rem, 8vw, 7.5rem)', { lineHeight: '0.95', letterSpacing: '-0.04em', fontWeight: '800' }],
        'display-xl': ['clamp(2.5rem, 6vw, 5rem)', { lineHeight: '1', letterSpacing: '-0.035em', fontWeight: '800' }],
        'display-lg': ['clamp(2rem, 4.5vw, 3.5rem)', { lineHeight: '1.05', letterSpacing: '-0.025em', fontWeight: '700' }],
      },
      animation: {
        'gradient-slow': 'gradientShift 18s ease-in-out infinite',
        'float-slow': 'floatY 6s ease-in-out infinite',
        'pulse-soft': 'pulseSoft 3.5s ease-in-out infinite',
        'shimmer': 'shimmer 2.4s linear infinite',
      },
      keyframes: {
        gradientShift: {
          '0%, 100%': { transform: 'translate3d(0,0,0) rotate(0deg)' },
          '50%': { transform: 'translate3d(2%, -3%, 0) rotate(8deg)' },
        },
        floatY: {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-12px)' },
        },
        pulseSoft: {
          '0%, 100%': { opacity: '0.55' },
          '50%': { opacity: '0.9' },
        },
        shimmer: {
          '0%': { backgroundPosition: '-200% 0' },
          '100%': { backgroundPosition: '200% 0' },
        },
      },
    },
  },
  plugins: [],
};
