<script lang="ts">
	import { onMount } from 'svelte';
	import * as THREE from 'three';
	
	let canvas: HTMLCanvasElement;

	onMount(() => {
		// return;
		const scene = new THREE.Scene();
		const camera = new THREE.PerspectiveCamera(
			75,
			window.innerWidth / window.innerHeight,
			0.1,
			1000
		);
		const renderer = new THREE.WebGLRenderer({ canvas, alpha: true });
		renderer.setSize(window.innerWidth, window.innerHeight, false);
		// Test Geometry
		const geometry = new THREE.BoxGeometry(1, 1, 1, 1);
		const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
		const cube = new THREE.Mesh(geometry, material);
		scene.add(cube);
		camera.position.z = 5;
		const resizeRendererToDisplaySize = () => {
			const width = canvas.clientWidth;
			const height = canvas.clientHeight;
			const shouldResize = canvas.width !== width || canvas.height !== height;
			if (shouldResize) {
				renderer.setSize(width, height, false);
			}
			return shouldResize;
		};
		const animate = () => {
			cube.rotation.x += 0.01;
			cube.rotation.y += 0.01;
			if (resizeRendererToDisplaySize()) {
				camera.aspect = canvas.clientWidth / canvas.clientHeight;
				camera.updateProjectionMatrix();
			}

			renderer.render(scene, camera);
		};
		renderer.setAnimationLoop(animate);
	});
</script>

<canvas bind:this={canvas} class="h-screen w-full"></canvas>
