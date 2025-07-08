<script lang="ts">
	import ProjectCard from './ProjectCard.svelte';
	import testImage from '$lib/assets/path_tracer_placeholder.png';
	import testImage2 from '$lib/assets/DarkSeer Screenshot.png';
	import ChevronLeft from '~icons/lucide/chevron-left';
	import ChevronRight from '~icons/lucide/chevron-right';
	import { onMount } from 'svelte';
	import gsap from 'gsap';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';
	import { SplitText } from 'gsap/SplitText';
	// Later on, I will likely have an 'articles' section, so would be nice to fetch this dynamically
	// TODO: Add images to the projects
	// There needs to be at least 5 projects for the animations to display properly.
	let projects = [
		{
			title: 'Path Tracer',
			description:
				'A multithreaded CPU path tracer written in C, using only a simple drawing library on top of X11. Supports importing 3D models, camera controls, depth of field, and more.',
			tags: [{ class: 'devicon-c-plain', name: 'C' }],
			image: testImage
		},
		{
			title: 'DarkSeer',
			description:
				'An original puzzle game created in 2 weeks for a game jam. Playable in your browser. Written in GDScript and gdshader.',
			tags: [{ class: 'devicon-godot-plain', name: 'Godot' }],
			image: testImage2
		},
		{
			title: 'CarsonReader.xyz',
			description:
				'The website you are on right now! Created with Sveltekit, TailwindCSS, and TypeScript. Has custom GLSL shaders running in WebGL to create the background effects.',
			tags: [
				{ class: 'devicon-svelte-plain', name: 'Svelte' },
				{ class: 'devicon-opengl-plain', name: 'GLSL' },
				{ class: 'devicon-tailwindcss-original', name: 'Tailwind' },
				{ class: 'devicon-typescript-plain', name: 'TypeScript' }
			],
			image: testImage2
		},
		{
			title: 'G.I.S.T',
			description:
				"An app for automatically translating, transcribing, and summarizing audio recordings using Whisper and GPT. Written in React with a desktop app via Electron. Placed 1st in Lewis & Clark's Spring 2023 Hackathon.",
			tags: [
				{ class: 'devicon-react-plain', name: 'React' },
				{ class: 'devicon-sass-plain', name: 'Sass' },
				{ class: 'devicon-electron-original', name: 'Electron' },
				{ class: 'devicon-typescript-plain', name: 'TypeScript' }
			],
			image: testImage2
		},
		{
			title: 'QuestScraper',
			description:
				'A Python app that scrapes data from reed college websites, providing the Reed newspaper editors with structured crime and event data to print each week. Uses BeautifulSoup, Gooey, and Pyinstaller to provided an intuitive standalone app.',
			tags: [
				{ class: 'devicon-python-plain', name: 'Python' },
				{ class: 'devicon-html5-plain', name: 'HTML' }
			],
			image: testImage
		}
	];

	let activeIndex = $state(0);
	let header: HTMLElement;
	let carouselNumbersContainer: HTMLDivElement;
	let carouselNumbersDisplay: HTMLDivElement;
	let rightButton: HTMLButtonElement;
	let leftButton: HTMLButtonElement;
	let carouselContainer: HTMLDivElement;

	// 28 pixels between non scaled numbers
	const NUMBER_OFFSET = 28;
	const INTIAL_OFFSET = 82;
	const SWIPE_DELTA = 50;

	let scrolledTo = $state(false);
	let scrollOffset: number;


	// Handle carousel swiping on mobile
	let startX = 0;
	let startY = 0;
	
	function handleSwipeStart(e: TouchEvent){
		startX = e.touches[0].clientX;
		e.preventDefault();
	}

	function handleSwipeEnd(e: TouchEvent){
		console.log('ended')
		let endX = e.changedTouches[0].clientX;
		let diff = endX - startX;
		if(Math.abs(diff) > SWIPE_DELTA){
			if(diff > 0){
				moveCarouselLeft();
			}
			else {
				moveCarouselRight();
			}
		}
	}

	onMount(() => {
		scrollOffset = INTIAL_OFFSET - carouselNumbersContainer.clientWidth / 2;
		carouselNumbersContainer.scrollBy(scrollOffset, 0);
		// TODO: Register scroll trigger once on the page rather than in each component
		gsap.registerPlugin(ScrollTrigger);
		gsap.registerPlugin(SplitText);
		let headerSplit = SplitText.create(header, { type: 'chars' });
		//TODO: The header could probably use a more distinct animation from the experience header
		gsap.from(headerSplit.chars, {
			duration: 0.3,
			autoAlpha: 0,
			x: -10,
			stagger: 0.02,
			scrollTrigger: { trigger: header, start: '100% 90%' }
		});
		ScrollTrigger.create({
			trigger: carouselContainer,
			onEnter: () => {
				scrolledTo = true;
			},
			start: '30% bottom'
		});
		
		// Prevent swipe back a page on div
		carouselContainer.addEventListener("touchstart", handleSwipeStart);
		carouselContainer.addEventListener("touchend", handleSwipeEnd);

		let controlsTimeline = gsap.timeline({ scrollTrigger: carouselNumbersContainer });
		controlsTimeline
			.from(carouselNumbersDisplay, {
				opacity: 1.0,
				duration: 0.3,
				width: 55,
				ease: 'power1.inOut'
			})
			.from(leftButton, { scale: 0, duration: 0.3 })
			.from(rightButton, { scale: 0, delay: 0.1, duration: 0.3 }, '<');
	});
	$effect(() => {
		carouselNumbersContainer.scrollTo({
			left: activeIndex * NUMBER_OFFSET + scrollOffset,
			behavior: 'smooth'
		});
	});
	// Animations are handled here right now, but they should be refactored to use GSAP as this is less maintainable, and customizable
	function getStylesForIndex(index: number) {
		// Active element
		if (index == activeIndex) return `z-20 ` + (!scrolledTo ? 'opacity-0 scale-80' : '');
		// Immediately to the left
		if (index == activeIndex - 1 || (activeIndex == 0 && index == projects.length - 1))
			return (
				'absolute blur-[4px] z-10 -translate-x-[93%] ' +
				(!scrolledTo ? 'opacity-0 sm:-translate-x-30' : 'sm:-translate-x-80 scale-80 ')
			);
		// Immediately to the right
		if (index == (activeIndex + 1) % projects.length)
			return (
				'absolute blur-[4px] z-10 translate-x-[93%] ' +
				(!scrolledTo ? 'opacity-0 sm:translate-x-30' : 'sm:translate-x-80 scale-80 ')
			);
		// Hidden and to the right
		if (index == (activeIndex + 2) % projects.length)
			return 'absolute opacity-0 scale-50 translate-x-50 blur-[4px]';
		// hidden and to the left
		return 'absolute opacity-0 scale-50 -translate-x-80 blur-[4px]';
	}

	function pulseButton(btn: HTMLButtonElement){
		gsap.fromTo(
			btn,
			{ scale: 1.0, opacity: 1.0 },
			{
				scale: 1.1,
				duration: 0.2,
				opacity: 0.8,
				yoyo: true,
				repeat: 1,
				ease: 'power1.inOut'
			}
		);
	}
	function moveCarouselLeft() {
		activeIndex--;
		if (activeIndex == -1) activeIndex = projects.length - 1;
		gsap.killTweensOf(leftButton);
	}
	function moveCarouselRight() {
		gsap.killTweensOf(rightButton);
		activeIndex = (activeIndex + 1) % projects.length;
	}
</script>

<h1 bind:this={header} class="m-10 text-center text-6xl text-shadow-sky-600 text-shadow-sm">
	Projects
</h1>
<div
	bind:this={carouselContainer}
	class="relative flex min-h-[600px] w-full items-center justify-center p-0"
>
	{#each projects as project, i}
		<ProjectCard
			classes={'duration-500 ' + getStylesForIndex(i)}
			title={project.title}
			image={project.image}
			imageAlt="testImage"
			active={i == activeIndex}
			description={project.description}
			iconTags={project.tags}
		/>
	{/each}
</div>

<div class="mb-10 flex justify-center gap-2 text-3xl">
	<button
		bind:this={leftButton}
		onclick={() => {
			moveCarouselLeft();
			pulseButton(leftButton);
		}}
		class="isolate aspect-square h-14 w-14 cursor-pointer rounded-full border-2 border-sky-400/20 bg-slate-900/50 bg-radial-[at_50%_59%] from-slate-900/50 from-60% to-slate-600 bg-clip-padding text-4xl text-sky-600 will-change-transform"
		><ChevronLeft class="mx-auto" /></button
	>
	<div
		bind:this={carouselNumbersDisplay}
		class="font-electrolize relative isolate flex w-36 items-center gap-2 overflow-hidden rounded-full border-2 border-sky-400/20 bg-slate-900/50 bg-radial-[at_50%_70%] from-slate-900/50 from-60% to-slate-600/20"
	>
		<!-- Peripheral blur -->
		<div
			class="absolute
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
		bind:this={rightButton}
		onclick={() => {
			moveCarouselRight();
			pulseButton(rightButton);
		}}
		class="isolate aspect-square h-14 w-14 cursor-pointer rounded-full border-2 border-sky-400/20 bg-slate-900/50 bg-radial-[at_50%_59%] from-slate-900/50 from-60% to-slate-600 bg-clip-padding text-4xl text-sky-600 will-change-transform"
		><ChevronRight class="mx-auto" /></button
	>
</div>
