<script lang="ts">
	import ProjectCard from './ProjectCard.svelte';
	import testImage from '$lib/assets/path_tracer_placeholder.png';
	import testImage2 from '$lib/assets/DarkSeer Screenshot.png';
	import ChevronLeft from '~icons/lucide/chevron-left';
	import ChevronRight from '~icons/lucide/chevron-right';
	import { onMount, type Component } from 'svelte';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';
	import { prefersReducedMotion } from 'svelte/motion';

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
	let carouselNumbersContainer: HTMLDivElement;
	let carouselCards: HTMLDivElement[] = $state([]);

	// 28 pixels between non scaled numbers
	const NUMBER_OFFSET = 28;
	const INTIAL_OFFSET = 82;

	// To play a full animation when clicked
	let leftClicked = $state(false);
	let rightClicked = $state(false);

	let scrollOffset: number;

	onMount(() => {
		// Scroll Carousel numbers correctly
		scrollOffset = INTIAL_OFFSET - carouselNumbersContainer.clientWidth / 2;
		carouselNumbersContainer.scrollBy(scrollOffset, 0);

		// Animate cards
		if (prefersReducedMotion) return;
		// TODO: Remove repeated plugin registering
		gsap.registerPlugin(ScrollTrigger);
		// gsap.from(carouselCards[0], {
		// 	opacity: 0.0,
		// 	duration: 0.9
		// })
	});
	$effect(() => {
		carouselNumbersContainer.scrollTo({
			left: activeIndex * NUMBER_OFFSET + scrollOffset,
			behavior: 'smooth'
		});
	});
	function getStylesForIndex(index: number) {
		// Active element
		if (index == activeIndex) return `z-20`;
		// Immediately to the left
		if (index == activeIndex - 1 || (activeIndex == 0 && index == projects.length - 1))
			return 'absolute sm:-translate-x-80 scale-80 opacity-100 z-10 -translate-x-[93%]';
		// Immediately to the right
		if (index == (activeIndex + 1) % projects.length)
			return 'absolute sm:translate-x-80 scale-80 opacity-100 z-10 translate-x-[93%]';
		// Hidden and to the right
		if (index == (activeIndex + 2) % projects.length)
			return 'absolute opacity-0 scale-50 translate-x-50';
		
		// hidden and to the left
		return 'absolute opacity-0 scale-50 -translate-x-80';
	}

	function moveCarouselLeft() {
		leftClicked = true;
		activeIndex--;
		if (activeIndex == -1) activeIndex = projects.length - 1;
		setTimeout(() => {
			leftClicked = false;
		}, 300);
	}
	function moveCarouselRight() {
		rightClicked = true;
		activeIndex = (activeIndex + 1) % projects.length;
		setTimeout(() => {
			rightClicked = false;
		}, 300);
	}
</script>

<h1 class="m-10 text-center text-4xl">Some things I've made</h1>
<div class="flex min-h-[600px] w-full items-center justify-center p-0">
	{#each projects as project, i}
		<div class={'isolate duration-500 ' + getStylesForIndex(i)} bind:this={carouselCards[i]}>
			<ProjectCard
				title={project.title}
				image={project.image}
				imageAlt="testImage"
				active={i == activeIndex}
				description={project.description}
			/>
		</div>
	{/each}
</div>

<div class="mb-10 flex justify-center gap-2 text-3xl">
	<button
		onclick={moveCarouselLeft}
		class={'isolate aspect-square h-14 w-14 cursor-pointer rounded-full border-2 border-sky-400/20 bg-slate-900/50 bg-radial-[at_50%_59%] from-slate-900/50 from-60% to-slate-600 bg-clip-padding text-4xl text-sky-600 transition-all duration-300 will-change-transform ' +
			(leftClicked ? 'scale-110 opacity-80' : 'scale-100')}
		><ChevronLeft class="mx-auto" /></button
	>
	<div
		class="font-electrolize relative isolate flex w-36 items-center gap-2 overflow-hidden rounded-full border-2 border-sky-400/20 bg-slate-900/50 bg-radial-[at_50%_70%] from-slate-900/50 from-60% to-slate-600/20"
	>
		<!-- Peripheral blur -->
		<div
			class="~[mask-size:80px_80px,80px_80px,calc(100%_-_160px)_80px] ~[mask-position:left_center,right_center,center] ~[mask-repeat:no-repeat] ~bg-red-400 absolute
			h-full
			w-full
    		[mask-image:radial-gradient(ellipse_30px_30px_at_25%_50%,transparent_10%,black_100%),radial-gradient(ellipse_30px_30px_at_75%_50%,transparent_10%,black_100%),radial-gradient(ellipse_50px_50px_at_50%_50%,transparent_10%,black_100%)]
    		[mask-composite:intersect]
    		backdrop-blur-xs
		"
		></div>
		<div
			class="no-scrollbar flex h-full items-center overflow-x-auto"
			bind:this={carouselNumbersContainer}
		>
			{#each { length: projects.length + 4 }, index}
				<span
					class="mx-1 flex h-full min-w-5 items-center"
					class:mx-4={index - 2 == activeIndex}
				>
					<span
						class={'text-sm transition-all duration-400 ' +
							(index - 2 == activeIndex
								? 'scale-200 text-green-300'
								: 'text-sky-800')}
						>{projects.length > index - 2 && index - 2 >= 0
							? '0' + (index - 2).toString()
							: ''}</span
					>
				</span>
			{/each}
		</div>
	</div>
	<button
		onclick={moveCarouselRight}
		class={'isolate aspect-square h-14 w-14 cursor-pointer rounded-full border-2 border-sky-400/20 bg-slate-900/50 bg-radial-[at_50%_59%] from-slate-900/50 from-60% to-slate-600 bg-clip-padding text-4xl text-sky-600 transition-all duration-300 will-change-transform ' +
			(rightClicked ? 'scale-110 opacity-80' : 'scale-100')}
		><ChevronRight class="mx-auto" /></button
	>
</div>
