<script lang="ts">
	import createRegl from 'regl';
	import { onMount } from 'svelte';
	import frag from '../shaders/dot_grid.glsl';
	import gsap from 'gsap';

	let canvas: HTMLCanvasElement;
	let mouseX = 0;
	let mouseY = 0;

	onMount(() => {
		window.addEventListener('mousemove', (e) => {
			mouseX = e.clientX;
			mouseY = e.clientY;
			console.log(mouseX, mouseY);
		});
		const regl = createRegl({});
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
