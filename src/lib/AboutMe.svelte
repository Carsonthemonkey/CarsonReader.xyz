<script lang="ts">
	import gsap from 'gsap';
	import { onMount } from 'svelte';
	import clientInfo from './utils/clientInfo.svelte';

	let dragWindow: HTMLDivElement;
	let dragHandle: HTMLDivElement;
	let dragStartPos = [0, 0];
	let windowPos = [0, 0];

	let windowGrabbed = false;
	let handleWindowDrag: (e: MouseEvent) => void;
	let releaseWindow: () => void;

	const GSAP_ELASTIC_EASE = 'elastic.out(1, 0.45)';
	function elasticDrag(val: number, r: number) {
		return (r * val) / (r + Math.abs(val));
	}

	onMount(() => {
		// Disable dragging on touchscreen
		if (clientInfo.isTouchscreen) return;
		const setX = gsap.quickSetter(dragWindow, 'x', 'px');
		const setY = gsap.quickSetter(dragWindow, 'y', 'px');
		handleWindowDrag = (e) => {
			if (!windowGrabbed) return;
			windowPos = [
				elasticDrag(e.clientX - dragStartPos[0], 500),
				elasticDrag(e.clientY - dragStartPos[1], 500)
			];
			setX(windowPos[0]);
			setY(windowPos[1]);
		};
		releaseWindow = () => {
			if (!windowGrabbed) return;
			windowGrabbed = false;
			gsap.to(dragWindow, {
				x: 0,
				y: 0,
				duration: 1.0,
				ease: GSAP_ELASTIC_EASE
			});
		};
		window.addEventListener('pointermove', handleWindowDrag);
		window.addEventListener('pointerup', releaseWindow);
	});
</script>

<div
	bind:this={dragWindow}
	class="min-mx mx-6 flex min-h-screen max-w-2xl flex-col justify-center sm:mx-auto"
>
	<div
		class:scale-[1.03]={windowGrabbed && !clientInfo.isTouchscreen}
		class="transition-transform"
	>
		<div
			bind:this={dragHandle}
			on:pointerdown={(e) => {
				windowGrabbed = true;
				gsap.killTweensOf(dragWindow);
				dragStartPos = [e.clientX, e.clientY];
			}}
			class:cursor-grabbing={windowGrabbed}
			class="text h-10 w-full cursor-grab content-center rounded-t-2xl bg-sky-300 outline outline-sky-300"
		>
			<div class="mx-3 flex w-30 gap-3">
				<div class="h-5 w-5 rounded-full bg-slate-950"></div>
				<div class="h-5 w-5 rounded-full bg-slate-950"></div>
				<div class="h-5 w-5 rounded-full bg-slate-950"></div>
			</div>
		</div>
		<div
			class="flex flex-col gap-3 rounded-b-2xl bg-slate-950 bg-gradient-to-br p-10 shadow-2xl shadow-sky-400/20 outline"
		>
			<h2 class="text-4xl text-yellow-200 italic">About Me</h2>
			<hr />
			<p class="text-lg text-sky-300 sm:text-2xl">
				This is a section about me. It has interesting things in it. Or at least it will.
				Right now it is just here to take up some space. Hope this looks cool. Maybe it
				won't. Who knows.
			</p>
		</div>
	</div>
</div>
