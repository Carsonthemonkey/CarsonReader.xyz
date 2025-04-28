<script lang="ts">
	import { onMount } from 'svelte';
	import * as THREE from 'three';
	import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';

	let canvas: HTMLCanvasElement;

	onMount(() => {
		const scene = new THREE.Scene();
		// const camera = new THREE.PerspectiveCamera(
		// 	75,
		// 	window.innerWidth / window.innerHeight,
		// 	0.1,
		// 	1000
		// );
		const frustumSize = 40;
		const aspect = window.innerWidth / window.innerHeight;
		const camera = new THREE.OrthographicCamera(
			(frustumSize * aspect) / -2, // left
			(frustumSize * aspect) / 2, // right
			frustumSize / 2, // top
			frustumSize / -2, // bottom
			0.1, // near
			1000
		);
		camera.position.z = 10;
		camera.position.y = 2;
		const renderer = new THREE.WebGLRenderer({ canvas, alpha: true });
		renderer.setSize(window.innerWidth, window.innerHeight, false);

		// Test Geometry
		// const geometry = new THREE.BoxGeometry(1, 1, 1, 1);
		// const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
		// const cube = new THREE.Mesh(geometry, material);
		// scene.add(cube);
		let gizmo: THREE.Group<THREE.Object3DEventMap>;
		const gltfLoader = new GLTFLoader();
		gltfLoader.load('/models/gizmo.glb', (gltf) => {
			gizmo = gltf.scene;
			scene.add(gizmo);
			gizmo.rotation.y = THREE.MathUtils.degToRad(45);
			gizmo.rotation.x = THREE.MathUtils.degToRad( -35.264);
			// (gizmo as any).children[0].material.wireframe = true;
		});
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
			// console.log(window.scrollY);
			// TODO: Actually compute this instead of guessing
			camera.position.y = -window.scrollY / 50 + 7;
			if (resizeRendererToDisplaySize()) {
				// camera.aspect = canvas.clientWidth / canvas.clientHeight;
				camera.updateProjectionMatrix();
			}

			renderer.render(scene, camera);
		};
		renderer.setAnimationLoop(animate);
	});
</script>

<canvas bind:this={canvas} class=".bg-red-400/30 fixed inset-0 h-screen w-full pointer-events-none"></canvas>
