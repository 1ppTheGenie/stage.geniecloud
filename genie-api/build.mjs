import esbuild from "esbuild";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

import aliasPlugin from "./node_modules/esbuild-plugin-path-alias/index.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const SRC_DIR = resolve(__dirname, "src");
const OUT_DIR = resolve(__dirname, "build");

esbuild
	.build({
		entryPoints: [resolve(SRC_DIR, "index.js")],
		outdir: OUT_DIR,
		platform: "node",
		external: [
			"@aws-sdk/client-s3",
			"@aws-sdk/client-sqs",
			"@aws-sdk/client-cloudfront",
			"node-fetch",
			"sharp",
		],
		minify: false,
		bundle: true,
		loader: {
			".js": "jsx",
		},
		plugins: [
			aliasPlugin({
				// must be absolute path
				"@": resolve(__dirname, "./src"),
			}),
		],
	})
	.catch(() => process.exit(1));
