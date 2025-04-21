<script lang="ts">
	import createRegl from 'regl';
	import { onMount } from 'svelte';
	import { browser } from '$app/environment';
	import frag from '../shaders/dot_grid.glsl';
	import gsap from 'gsap';

	let canvas: HTMLCanvasElement;
	let mouseX = 0;
	let mouseY = 0;
	// const dpr = browser ? window.devicePixelRatio || 1 : 1;
	let dpr: number;

	let canvasWidth: number;
	let canvasHeight: number;

	onMount(() => {
		window.addEventListener('mousemove', (e) => {
			mouseX = e.clientX;
			mouseY = e.clientY;
		});
		const regl = createRegl({ canvas, pixelRatio: dpr });
		const animatedUniforms = {
			wipeAmount: 0.0
		};
		gsap.to(animatedUniforms, {
			duration: 2.0,
			delay: 1.2,
			wipeAmount: 1.0
		});
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
				width: regl.context('viewportWidth'),
				height: regl.context('viewportHeight'),
				mouse: () => [
					mouseX / window.innerWidth,
					(window.innerHeight - mouseY) / window.innerHeight
				],
				dotColor: [0.4, 0.8, 1.0, 1.0],
				wipeAmount: () => animatedUniforms.wipeAmount
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

<svelte:window
	bind:innerWidth={canvasWidth}
	bind:innerHeight={canvasHeight}
	bind:devicePixelRatio={dpr}
/>
<canvas
	bind:this={canvas}
	class="fixed inset-0 z-0 h-full w-full"
	width={canvasWidth * dpr}
	height={canvasHeight * dpr}
></canvas>
