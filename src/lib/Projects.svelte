<script lang="ts">
	import ProjectCard from './ProjectCard.svelte';
	import testImage from '$lib/assets/path_tracer_placeholder.png';
	import testImage2 from '$lib/assets/DarkSeer Screenshot.png';
	import ChevronLeft from '~icons/lucide/chevron-left';
	import ChevronRight from '~icons/lucide/chevron-right';

	// Later on, I will likely have an 'articles' section, so would be nice to fetch this dynamically
	// TODO: Add images to the projects
	// There needs to be at least 5 projects for the animations to display properly.
	let projects = [
		{
			title: 'Path Tracer',
			description:
				'A multithreaded CPU path tracer written in C, using a simple drawing library on top of X11. Supports importing 3D models, camera controls, depth of field, and more.',
			image: testImage
		},
		{
			title: 'Test Project',
			description:
				'This is a whole paragraph. It has a lot of very very interesting things about this project that I worked on',
			image: testImage
		},
		{
			title: 'Portfolio Website',
			description:
				'The website you are on right now! Created with Sveltekit, TailwindCSS, and TypeScript. Has custom GLSL shaders running in WebGL to create the background effects.',
			image: testImage2
		},
		{
			title: 'G.I.S.T',
			description:
				'An app for automatically translating, transcribing, and summarizing audio recordings using Whisper and GPT. Written in React with a desktop app via Electron.',
			image: testImage2
		},
		{
			title: 'QuestScraper',
			description: 'This is a placeholder',
			image: testImage
		}
	];

	let activeIndex = $state(0);

	function getStylesForIndex(index: number) {
		// Active element
		if (index == activeIndex) return `z-20`;
		// Immediately to the left
		if (index == activeIndex - 1 || (activeIndex == 0 && index == projects.length - 1))
			return 'absolute sm:-translate-x-80 scale-80 blur-[4px] opacity-100 z-10 -translate-x-[93%]';
		// Immediately to the right
		if (index == (activeIndex + 1) % projects.length)
			return 'absolute sm:translate-x-80 scale-80 blur-[4px] opacity-100 z-10 translate-x-[93%]';
		// Hidden and to the right
		if (index == (activeIndex + 2) % projects.length)
			return 'absolute opacity-0 scale-50 translate-x-50 blur-[4px]';
		// hidden and to the left
		return 'absolute opacity-0 scale-50 -translate-x-80 blur-[4px]';
	}

	function moveCarouselLeft() {
		activeIndex--;
		if (activeIndex == -1) activeIndex = projects.length - 1;
	}
	function moveCarouselRight() {
		activeIndex = (activeIndex + 1) % projects.length;
	}
</script>

<h1 class="m-10 text-center text-4xl">Some things I've made</h1>
<div class="relative flex min-h-[600px] w-full items-center justify-center p-0">
	{#each projects as project, i}
		<ProjectCard
			classes={'duration-500 ' + getStylesForIndex(i)}
			title={project.title}
			image={project.image}
			imageAlt="testImage"
			active={i == activeIndex}
			description={project.description}
		/>
	{/each}
</div>

<div class="mb-10 flex justify-center gap-2 text-3xl">
	<button
		onclick={moveCarouselLeft}
		class="isolate aspect-square h-12 w-12 cursor-pointer rounded-full bg-slate-900/50 bg-radial-[at_50%_59%] from-slate-900/50 to-slate-600 from-60% text-sky-600 backdrop-blur-xs"
		><ChevronLeft class="mx-auto" /></button
	>
	<button
		onclick={moveCarouselRight}
		class="isolate aspect-square h-12 w-12 cursor-pointer rounded-full bg-slate-900/50 bg-radial-[at_50%_59%] from-slate-900/50 to-slate-600 from-60% text-sky-600 backdrop-blur-xs"
		><ChevronRight class="mx-auto" /></button
	>
</div>
