<script lang="ts">
	import { onMount } from 'svelte';
	import DotGrid from '$lib/DotGrid.svelte';
	import ContactIcons from '$lib/ContactIcons.svelte';
	import AboutMe from '$lib/AboutMe.svelte';
	import Experience from '$lib/Experience.svelte';

	let loaded = false;
	onMount(() => {
		loaded = true;
	});
</script>

<div class="min-h-screen text-sky-400">
	<div class="relative w-full overflow-x-hidden">
		<DotGrid />
		<!-- Backdrop for the Header, to cover the dots -->
		<div
			class="absolute h-[500px] w-full -translate-y-11 rounded-b-[200px] bg-slate-950 blur-2xl"
		></div>
		<header class="min-h-screen">
			<div class="relative flex justify-center overflow-x-clip">
				<!-- Background Glow Gradient -->
				<div
					class="absolute m-10 h-full min-w-xl rounded-full bg-[radial-gradient(ellipse_at_center,_rgba(0,188,255,0.2)_0%,_transparent_70%)] blur-3xl"
				></div>
				<h1
					class="max-w-2xl pt-24 text-center text-7xl font-bold text-sky-400 ease-out motion-safe:transition-all motion-safe:duration-[1500ms] md:text-8xl"
					class:blur-[50px]={!loaded}
					class:opacity-0={!loaded}
				>
					CARSON <br />
					READER
				</h1>
			</div>
			<h2
				class="relative z-10 p-4 text-center text-xl text-sky-700 italic ease-out motion-safe:transition-all motion-safe:delay-1000 motion-safe:duration-1000"
				class:translate-y-4={!loaded}
				class:opacity-0={!loaded}
			>
				A Passionate Developer working on cool things
			</h2>
			<ContactIcons delay={1.5} />
		</header>
		<section class="min-h-screen py-32">
			<AboutMe />
		</section>
		<section class="py-32">
			<Experience />
		</section>
	</div>
</div>
