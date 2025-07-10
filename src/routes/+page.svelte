<script lang="ts">
	import { onMount } from 'svelte';
	import DotGrid from '$lib/DotGrid.svelte';
	import ContactIcons from '$lib/ContactIcons.svelte';
	import AboutMe from '$lib/AboutMe.svelte';
	import Experience from '$lib/Experience.svelte';
	import Projects from '$lib/Projects.svelte';
	import LucideChevronsDown from '~icons/lucide/chevrons-down';

	const SCROLL_INDICATOR_DELAY = 3.0;

	let scrollIndicatorVisible = $state(false);
	let loaded = $state(false);
	onMount(() => {
		loaded = true;
		setTimeout(() => {scrollIndicatorVisible = true;}, SCROLL_INDICATOR_DELAY * 1000);
	});
</script>

<div class="min-h-screen text-sky-400">
	<div class="relative w-full overflow-x-hidden">
		<DotGrid />
		<!-- Backdrop for the Header, to cover the dots -->
		<div
			class="absolute h-[500px] w-full -translate-y-11 rounded-b-[200px] bg-slate-950 blur-2xl"
		></div>
		<!-- Pointer events removed and then re added to allow background to be clickable -->
		<header class="min-h-screen relative pointer-events-none">
			<div class="relative flex justify-center overflow-x-clip pointer-events-auto">
				<!-- Background Glow Gradient -->
				<div
					class="absolute m-10 h-full min-w-xl rounded-full bg-[radial-gradient(ellipse_at_center,_rgba(0,188,255,0.2)_0%,_transparent_70%)] blur-3xl"
				></div>
				<h1
					class="max-w-2xl pt-24 text-center text-7xl font-bold text-sky-400 ease-out text-shadow-lg text-shadow-sky-600 motion-safe:transition-all motion-safe:duration-[1500ms] md:text-8xl"
					class:blur-[50px]={!loaded}
				>
					CARSON <br />
					READER
				</h1>
			</div>
			<h2
				class="relative z-10 p-4 text-center text-xl text-sky-700 italic ease-out motion-safe:transition-all motion-safe:delay-1000 motion-safe:duration-1000 pointer-events-auto"
				class:translate-y-4={!loaded}
				class:opacity-0={!loaded}
			>
				Software Developer Working On Cool Things
			</h2>
			<div class="pointer-events-auto">
				<ContactIcons delay={1.5} />
			</div>
			<div
				class="absolute bottom-20 mx-auto mt-20 flex h-13 w-13 items-center justify-center rounded-full bg-sky-400 text-4xl text-slate-950 animate-bounce left-1/2 -translate-x-1/2 duration-300"
				class:scale-0={!scrollIndicatorVisible}
				class:opacity-0={!scrollIndicatorVisible}
			>
				<LucideChevronsDown />
			</div>
		</header>
		<section class="pt-32">
			<AboutMe />
		</section>
		<section class="py-32">
			<Experience />
		</section>
		<section>
			<Projects />
		</section>
	</div>
</div>
