import esbuild from "esbuild";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const SRC_DIR = resolve(__dirname, "src");
const OUT_DIR = resolve(__dirname, "build");

esbuild
	.build({
		entryPoints: [resolve(SRC_DIR, "index.js")],
		outfile: resolve(OUT_DIR, "index.js"),
		platform: "node",
		external: [
			"sharp",
			"@sparticuz/chromium",
			"@aws-sdk/client-s3",
			"@aws-sdk/client-sqs",
		],
		minify: true,
		bundle: true,
		loader: {
			".js": "jsx",
		},
		plugins: [],
	})
	.catch(() => process.exit(1));
