<script lang="ts">
	import createRegl from 'regl';
	import { onMount } from 'svelte';
	import frag from '../shaders/dot_grid.glsl';
	import gsap from 'gsap';
	import { prefersReducedMotion } from 'svelte/motion';

	let canvas: HTMLCanvasElement;
	let mouseX = 0;
	let mouseY = 0;
	let scrollAmount = 0;
	let dpr: number;
	let parallaxScale = 0.2;
	const GSAP_ELASTIC_EASE = 'elastic.out(1.0, 0.4)';

	let pokeDots: () => void;

	let canvasWidth: number;
	let canvasHeight: number;

	const animatedUniforms = {
		displacementScale: 2.0,
		wipeAmount: 0.0,
		rippleRadius: 8.0
	};

	onMount(() => {
		if(prefersReducedMotion.current){
			parallaxScale = 0;
			animatedUniforms.wipeAmount = 1;
			animatedUniforms.displacementScale = 0;
		} 

		window.addEventListener('mousemove', (e) => {
			mouseX = e.clientX;
			mouseY = e.clientY;
		});
		const regl = createRegl({ canvas, pixelRatio: dpr });
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
				gridOffsetY: () => (scrollAmount / canvasHeight) * parallaxScale,
				displacementScale: () => animatedUniforms.displacementScale,
				wipeAmount: () => animatedUniforms.wipeAmount,
				rippleRadius: () => animatedUniforms.rippleRadius
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
			scrollAmount = window.scrollY;
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
	class="fixed inset-0 h-full w-full"
	width={canvasWidth * dpr}
	height={canvasHeight * dpr}
	onpointerdown={() => {
		if(prefersReducedMotion.current) return;
		gsap.killTweensOf(animatedUniforms, { props: ['displacementScale'] });
		gsap.to(animatedUniforms, {
			duration: 1.4,
			displacementScale: -1.4,
			ease: GSAP_ELASTIC_EASE
		});
		animatedUniforms.rippleRadius = 8.0;
		gsap.from(animatedUniforms, {
			rippleRadius: 0.0,
			duration: 4.0
		});
	}}
	onpointerup={() => {
		if(prefersReducedMotion.current) return;
		gsap.killTweensOf(animatedUniforms, { props: ['displacementScale'] });
		gsap.to(animatedUniforms, {
			duration: 1.7,
			displacementScale: 2.0,
			ease: GSAP_ELASTIC_EASE
		});
	}}
></canvas>
