<script lang="ts">
	import ExperienceCard from './ExperienceCard.svelte';
	import IconGraduationCap from '~icons/lucide/graduation-cap';
	import IconBrain from '~icons/lucide/brain';
	import IconMove3d from '~icons/lucide/move-3d';
	import IconApple from '~icons/lucide/apple';
	import IconLightbulb from '~icons/lucide/lightbulb';
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
			scrollTrigger: { trigger: header, start: '100% 90%' }
		});
	});
</script>

<h2
	bind:this={header}
	class="font-electrolize~ isolate my-24 text-center text-6xl text-shadow-sky-600 text-shadow-sm"
>
	Experience
</h2>

<div class="flex flex-col gap-16">
	<ExperienceCard
		Icon={IconLightbulb}
		iconClasses="text-teal-300"
		title="Software Engineer, Data Platform"
		subtitle="IQ500"
	>
		As one of the first engineers at a VC intelligence startup, I architected the data pipeline
		behind a platform covering ~13k startups and ~5k venture firms. I built agentic extraction
		pipelines for fund sites and SEC filings, using LLMs where they made sense and swapping in
		deterministic or local models elsewhere to cut cost and improve reliability.
	</ExperienceCard>
	<ExperienceCard
		Icon={IconBrain}
		iconClasses="text-red-300"
		title="BCI Programmer"
		subtitle="Oregon Health & Science University"
	>
		At OHSU, I designed and implemented an orchestration module for open source brain-computer
		interface software in Python. Implemented unit tests, and worked with a team via Git and
		GitHub to ensure a high code quality standard.
	</ExperienceCard>
	<ExperienceCard
		Icon={IconGraduationCap}
		iconClasses="text-orange-300"
		title="B.A. in Computer Science"
		subtitle="Lewis & Clark College"
	>
		Two time 1st place winner of the LC Hackathon. Served as president of the LC ACM chapter my
		Junior and Senior year where I led workshops on topics including Git, circuitry and game
		development. Graduated with C.S and Mathematics departmental honors award for 2025.
	</ExperienceCard>
	<ExperienceCard
		Icon={IconMove3d}
		iconClasses="text-purple-300"
		title="3D Modeler"
		subtitle="Lewis & Clark College"
	>
		Created game-ready 3D assets for use in a behavioral study using Unity Engine and Blender.
		Advised project leads on rendering techniques and animation.
	</ExperienceCard>
	<ExperienceCard
		Icon={IconApple}
		iconClasses="text-cyan-300"
		title="Teacher's Assistant"
		subtitle="Algorithms & Data Structures"
	>
		Tested and graded student work for the Algorithm Design and Analysis class. Supported
		students in office hours by providing intuitive explanations for complex data structures and
		algorithms.
	</ExperienceCard>
</div>
