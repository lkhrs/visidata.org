module.exports = {
    mode: 'jit',
    purge: {
        content: [
            "site/**/*.html",
            "site/*.njk",
            "site/includes/**/*.njk",
            "site/docs/*.njk",
            "site/blog/*.md"
        ],
        options: {
            whitelist: [],
        },
    },
    theme: {
        extend: {
            colors: {
                change: "transparent",
                brand: {
                    primary: "#5fd7ff",
                    dark: "#003a4d"
                }
            },
            animation: {
                fadeInDown: "fadeInDown 1s ease-in-out forwards"
            },
            keyframes: {
                fadeInDown: {
                    "0%": { opacity: 0, transform: 'translateY(-50%)' },
                    "100%": { opacity: 1, transform: 'translateY(0)' }
                }
            }
        }
    },
    variants: {},
    plugins: [
        require('@tailwindcss/forms')
    ],
    darkMode: 'media',
}