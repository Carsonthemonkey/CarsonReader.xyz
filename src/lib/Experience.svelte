<script lang="ts">
	import ExperienceCard from './ExperienceCard.svelte';
	import IconGraduationCap from '~icons/lucide/graduation-cap';
	import IconBrain from '~icons/lucide/brain';
	import LucideMove3d from '~icons/lucide/move-3d';
	import LucideApple from '~icons/lucide/apple';
	import gsap from 'gsap';
	import { SplitText } from 'gsap/SplitText';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';
	import { onMount } from 'svelte';

	let header: HTMLElement;

	onMount(() => {
		gsap.registerPlugin(SplitText);
		gsap.registerPlugin(ScrollTrigger);
		let split = SplitText.create(header, { type: 'chars' });
		gsap.from(split.chars, {
			duration: 0.3,
			autoAlpha: 0,
			x: -10,
			stagger: 0.02,
			scrollTrigger: {trigger: header, start: '100% 90%'},
		});
	});
</script>

<h1
	bind:this={header}
	class="font-electrolize~ isolate my-24 text-center text-6xl text-shadow-sky-600 text-shadow-sm"
>
	Experience
</h1>

<div class="flex flex-col gap-16">
	<ExperienceCard Icon={IconGraduationCap} iconClasses="text-orange-300">
		<h1 class="mb-2 text-3xl">B.A. in Computer Science</h1>
		<h2
			class="mx-auto mb-2 max-w-fit truncate rounded-full border-1 bg-green-300/10 px-2 text-green-300 sm:mx-0"
		>
			Lewis & Clark College
		</h2>
		<p class="font-electrolize text-lg text-sky-600">
			Two time 1st place winner of the LC Hackathon. Served as president of the LC ACM chapter my Junior and Senior year where I led workshops on topics including Git, circuitry and game development. Graduated with C.S and Mathematics departmental honors award for 2025.
		</p>
	</ExperienceCard>
	<ExperienceCard Icon={IconBrain} iconClasses="text-red-300">
		<h1 class="mb-2 text-3xl">BCI Programmer</h1>
		<h2
			class="mx-auto mb-2 max-w-fit truncate rounded-full border-1 bg-green-300/10 px-2 text-green-300 sm:mx-0"
		>
			Oregon Health & Science University
		</h2>
		<p class="font-electrolize text-lg text-sky-600">
			At OHSU, I designed and implemented an orchestration module for open source brain-computer interface software in Python. Implemented unit tests, and worked with a team via Git and GitHub to ensure a high code quality standard. 
		</p>
	</ExperienceCard>
	<ExperienceCard Icon={LucideMove3d} iconClasses="text-purple-300">
		<h1 class="mb-2 text-3xl">3D Modeler</h1>
		<h2
			class="mx-auto mb-2 max-w-fit truncate rounded-full border-1 bg-green-300/10 px-2 text-green-300 sm:mx-0"
		>
			Lewis & Clark College
		</h2>
		<p class="font-electrolize text-lg text-sky-600">
			Created game-ready 3D assets for use in a behavioral study using Unity Engine and Blender. Advised project leads on rendering techniques and animation.
		</p>
	</ExperienceCard>
	<ExperienceCard Icon={LucideApple} iconClasses="text-cyan-300">
		<h1 class="mb-2 text-3xl">Teacher's Assistant</h1>
		<h2
			class="mx-auto mb-2 max-w-fit truncate rounded-full border-1 bg-green-300/10 px-2 text-green-300 sm:mx-0"
		>
			Algorithms & Data Structures
		</h2>
		<p class="font-electrolize text-lg text-sky-600">
			Tested and graded student work for the Algorithm Design and Analysis class. Supported students in office hours by providing intuitive explanations for complex data structures and algorithms.
		</p>
	</ExperienceCard>
</div>
