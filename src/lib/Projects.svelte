<script>
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
		}
	];
</script>

<h1 class="m-10 text-center text-4xl">Some things I've made</h1>
<div class="my-15 flex w-full justify-center">
	<ProjectCard
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
	/>
</div>
