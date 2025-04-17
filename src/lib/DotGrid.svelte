<script lang="ts">
	import createRegl from 'regl';
	import { onMount } from 'svelte';
	import frag from '../shaders/dot_grid.glsl';
	let canvas: HTMLCanvasElement;
    let mouseX = 0;
    let mouseY = 0;


	onMount(() => {
        window.addEventListener('mousemove', (e) => {
            mouseX = e.clientX;
            mouseY = e.clientY;
            console.log(mouseX, mouseY);
        })
        console.log('dpr ' + window.devicePixelRatio);
		const regl = createRegl({});
		const drawDots = regl({
			frag,
			vert: `
            precision mediump float;
            attribute vec2 position;
            void main () {
              gl_Position = vec4(position, 0, 1);
            }`,

			uniforms: {
				resolution: () => [window.innerWidth, window.innerHeight],
				mouse: () => [mouseX * 2, (window.innerHeight - mouseY) * 2]
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
