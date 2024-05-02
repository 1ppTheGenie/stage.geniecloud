import { defineConfig } from "vite";
import solidPlugin from "vite-plugin-solid";
import basicSsl from "@vitejs/plugin-basic-ssl";
import solidSvg from "vite-plugin-solid-svg";

import path from "path";

const __BASE__ =
	process.env.NODE_ENV === "production"
		? "/genie-tools/collection-editor/"
		: "";
const __BUILD_VERSION__ = process.env.npm_package_version;

const appendVersion = () => {
	return {
		name: "vite-append-version",
		transformIndexHtml(html) {
			["js", "css"].forEach(suffix => {
				html = html.replace(
					`/genie-tools/collection-editor/index.${suffix}`,
					`/genie-tools/collection-editor/index.${suffix}?v=${__BUILD_VERSION__}`
				);
			});

			return html;
		},
	};
};

export default defineConfig({
	define: {
		__APP_VERSION__: JSON.stringify(process.env.npm_package_version),
	},
	plugins: [solidPlugin(), appendVersion(), basicSsl(), solidSvg()],
	resolve: {
		alias: {
			"@": path.resolve(__dirname, "./src"),
		},
	},
	base: __BASE__,
	build: {
		outDir: `../public/genie-tools/collection-editor/`,
		sourcemap: true,
		minify: false,
		target: "esnext",
		polyfillDynamicImport: false,
		manifest: false,
		rollupOptions: {
			output: {
				entryFileNames: `assets/[name].js`,
				chunkFileNames: `assets/[name].js`,
				assetFileNames: `assets/[name].[ext]`,
			},
		},
		legalComments: "none",
		treeShaking: true,
	},
	server: {
		port: 3063,
		https: true,
		proxy: {
			"/wp-json": {
				target: "https://genie.dynamicarray.co.uk/wp-json",
				changeOrigin: true,
				rewrite: path => path.replace(/^\/wp-json/, ""),
			},
		},
	},
});
