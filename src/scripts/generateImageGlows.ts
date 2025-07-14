import sharp from 'sharp';
import fs from 'fs';
import path from 'path';

const inputDir = path.resolve('static/project_thumbnails');
const outputDir = path.resolve('static/project_thumbnails/glow');

if (!fs.existsSync(outputDir)) {
	fs.mkdirSync(outputDir);
}

const files = fs
	.readdirSync(inputDir, { withFileTypes: true })
	.filter((dirent) => dirent.isFile())
	.map((dirent) => dirent.name);

for (const file of files) {
	const extension = path.extname(file);
	const base = path.basename(file, extension);
	const input = path.join(inputDir, file);
	const output = path.join(outputDir, `${base}_glow${extension}`);

	await sharp(input)
		.ensureAlpha()
		.resize(500)
		.blur(60)
		.extend({
			top: 60,
			bottom: 60,
			left: 60,
			right: 60,
			background: { r: 0, g: 0, b: 0, alpha: 0 }
		})
		.toFile(output);
}
