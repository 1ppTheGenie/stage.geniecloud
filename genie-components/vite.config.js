import { defineConfig } from "vite";
import solidPlugin from "vite-plugin-solid";
import solidSvg from "vite-plugin-solid-svg";
import mkcert from "vite-plugin-mkcert";
import path from "path";

const __BUILD_VERSION__ = process.env.npm_package_version;
const __BASE__ =
	process.env.NODE_ENV && process.env.NODE_ENV === "production"
		? `/_assets/landing-pages/dist/${__BUILD_VERSION__}/`
		: "";

export default defineConfig({
	plugins: [solidPlugin(), solidSvg(), mkcert()],
	resolve: {
		alias: {
			"@": path.resolve(__dirname, "./src"),
		},
	},
	base: __BASE__,
	experimental: {
		renderBuiltUrl(filename, { hostType }) {
			console.log(filename, hostType);
			if (hostType === "js" || hostType === "css") {
				return { runtime: `window.gHub.buildUrl(${JSON.stringify(filename)})` };
			} else {
				return { relative: true };
			}
		},
	},
	build: {
		outDir: `../public/_assets/landing-pages/dist/${__BUILD_VERSION__}/`,
		sourcemap: false,
		minify: false,
		target: "esnext",
		polyfillDynamicImport: false,
		rollupOptions: {
			output: {
				entryFileNames: `assets/[name].js`,
				chunkFileNames: `assets/[name].js`,
				assetFileNames: `assets/[name].[ext]`,
			},
		},
	},
	server: {
		port: 3001,
		https: true,
		proxy: {
			"/wp-json": {
				target:
					"https://dqohcd54xpkdwnueu2wn2nkxge0aboae.lambda-url.eu-west-2.on.aws/",
				changeOrigin: true,
				rewrite: path => path.replace(/^\/wp-json/, ""),
			},
		},
	},
});
