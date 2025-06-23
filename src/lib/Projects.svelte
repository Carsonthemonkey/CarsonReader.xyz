<script lang="ts">
	import ProjectCard from './ProjectCard.svelte';
	import testImage from '$lib/assets/path_tracer_placeholder.png';

	// Later on, I will likely have an 'articles' section, so would be nice to fetch this dynamically
	// TODO: Add images to the projects
	let projects = [
		{
			title: 'Path Tracer',
			description:
				'A multithreaded CPU path tracer written in C, using a simple drawing library on top of X11. Supports importing 3D models, camera controls, depth of field, and more.'
		},
		{
			title: 'Test Project',
			description:
				'This is a whole paragraph. It has a lot of very very interesting things about this project that I worked on'
		},
		{
			title: 'Portfolio Website',
			description:
				'The website you are on right now! Created with Sveltekit, TailwindCSS, and TypeScript. Has custom GLSL shaders running in WebGL to create the background effects.'
		},
		{
			title: 'G.I.S.T',
			description:
				'An app for automatically translating, transcribing, and summarizing audio recordings using Whisper and GPT. Written in React with a desktop app via Electron.'
		}
	];

	let activeIndex = $state(0);

	function getStylesForIndex(index: number) {
		if (index == activeIndex) return `z-10`;
		if (index == activeIndex - 1 || (activeIndex == 0 && index == projects.length - 1))
			return 'absolute -translate-x-80 scale-80 blur-xs';
		if (index == (activeIndex + 1) % projects.length)
			return 'absolute translate-x-80 scale-80 blur-xs';
		return 'hidden';
	}

	function moveCarouselLeft(){
		activeIndex--;
		if (activeIndex == -1) activeIndex = projects.length - 1;
	}
	function moveCarouselRight(){
		activeIndex = (activeIndex + 1) % projects.length;
	}
</script>

<h1 class="m-10 text-center text-4xl">Some things I've made</h1>
<div class="my-15 flex w-full items-center justify-center">
	{#each projects as project, i}
		<ProjectCard
			classes={getStylesForIndex(i)}
			title={project.title}
			image={testImage}
			imageAlt="testImage"
			active={i == activeIndex}
			description={project.description}
		/>
	{/each}
	<!-- <ProjectCard
		classes="absolute -translate-x-80 scale-80 blur-xs"
		image={testImage}
		imageAlt="test alt"
		title={'Project Title'}
		description={'This is a whole paragraph. It has a lot of very very interesting things about this project that I worked on'}
	/>
	<ProjectCard
		classes="absolute translate-x-80 scale-80 blur-xs"
		image={testImage}
		imageAlt="test alt"
		title={'Project Title'}
		description={'This is a whole paragraph. It has a lot of very very interesting things about this project that I worked on'}
	/>
	<ProjectCard
		active={true}
		image={testImage}
		imageAlt="test alt"
		title={'Project Title'}
		description={'This is a whole paragraph. It has a lot of very very interesting things about this project that I worked on'}
	/> -->
</div>

<div class="flex justify-center text-3xl gap-2 isolate">
	<button onclick={moveCarouselLeft} class="text-slate-800 bg-sky-400 rounded-full p-2 cursor-pointer">&#8592</button>
	<button onclick={moveCarouselRight} class="text-slate-800 bg-sky-400 rounded-full p-2 cursor-pointer">&#8594</button>
</div>