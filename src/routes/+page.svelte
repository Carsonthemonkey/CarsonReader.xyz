<script lang="ts">
	import { onMount } from 'svelte';
	import { fade } from 'svelte/transition';
	import DotGrid from '$lib/DotGrid.svelte';

	let loaded = false;
	onMount(() => {
		loaded = true;
	});
</script>

<DotGrid />
<div class="h-dvh bg-gradient-to-b from-slate-950 to-gray-950">
	<div class="z-10 relative h-dvh w-full overflow-x-hidden">
		<!-- Backdrop for the Header, to cover the dots -->
		<div class="-z-10 h-[500px] -translate-y-24 rounded-full w-full scale-x-125 blur-2xl absolute bg-slate-950"></div>
		<div class="relative flex justify-center overflow-x-clip">
			<!-- Background Glow Gradient -->
			<div
				class="absolute m-10 h-full min-w-xl rounded-full bg-[radial-gradient(ellipse_at_center,_rgba(0,188,255,0.2)_0%,_transparent_70%)] blur-3xl"
			></div>
			<h1
				class="z-20 max-w-2xl pt-24 text-center text-7xl font-bold text-sky-400 transition-all duration-[1500ms] ease-out md:text-8xl"
				class:blur-[50px]={!loaded}
				class:opacity-0={!loaded}
			>
				CARSON <br />
				READER
			</h1>
		</div>
		<h2
			class="p-4 text-center text-xl text-sky-700 italic transition-all delay-1000 duration-1000 ease-out"
			class:translate-y-4={!loaded}
			class:opacity-0={!loaded}
		>
			A Passionate Developer working on cool things
		</h2>
	</div>
</div>
