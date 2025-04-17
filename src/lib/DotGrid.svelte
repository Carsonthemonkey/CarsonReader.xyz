<script lang="ts">
	import createRegl from 'regl';
	import { onMount } from 'svelte';
	let canvas: HTMLCanvasElement;

	onMount(() => {
		const regl = createRegl({ canvas });
		const drawDots = regl({
			frag: `
            precision mediump float;
            uniform vec4 color;
            void main() {
                gl_FragColor = color;
            }`,
			vert: `
            precision mediump float;
            attribute vec2 position;
            void main () {
              gl_Position = vec4(position, 0, 1);
            }`,

			uniforms: {
				color: [0.0118, 0.0275, 0.0706, 1]
			},
			attributes: {
				position: [
					[-1, -1],
					[1, -1],
					[1, 1],
					[-1, -1],
					[1, 1],
					[-1, 1]
				]
			},
			count: 6
		});
		regl.frame(() => {
			regl.clear({ color: [1.0, 0.0, 1.0, 1.0] });
			drawDots();
		});
	});
</script>

<canvas bind:this={canvas} class="absolute inset-0 -z-10 h-full max-w-full"></canvas>
